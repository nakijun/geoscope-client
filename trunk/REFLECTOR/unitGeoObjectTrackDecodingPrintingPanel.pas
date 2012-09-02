unit unitGeoObjectTrackDecodingPrintingPanel;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, SHDocVw, ExtCtrls, StdCtrls, Buttons,
  unitGeoObjectTrackControlPanel, ComCtrls, Menus;

type
  TfmGeoObjectTrackDecodingPrintingPanel = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnPrint: TBitBtn;
    btnExit: TBitBtn;
    cbStopsAndMovementsAnalysis: TCheckBox;
    cbFuelConsumptionAnalysis: TCheckBox;
    cbBusinessModelEvents: TCheckBox;
    GroupBox1: TGroupBox;
    lvFragments: TListView;
    lvFragments_PopupMenu: TPopupMenu;
    Removeselecteditem1: TMenuItem;
    N1: TMenuItem;
    RemoveAll1: TMenuItem;
    btnCompile: TBitBtn;
    procedure btnPrintClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnCompileClick(Sender: TObject);
    procedure Removeselecteditem1Click(Sender: TObject);
    procedure RemoveAll1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    TrackControlPanel: TfmGeoObjectTrackControlPanel;
    PrintPageFileName: string;
    ObjectName: string;
    wbPrintBrowser: TWebBrowser;

    procedure PreviewPrintPageFile();
  public
    { Public declarations }
    Constructor Create(const pTrackControlPanel: TfmGeoObjectTrackControlPanel);
    Destructor Destroy(); override;
    procedure CompilePrintPageFile();
    //.
    procedure lvFragments_Clear();
    function  lvFragments_AddNew(const ptrTrackNode: pointer; const Description: string): integer;
    procedure lvFragments_Remove(const Index: integer);
  end;


implementation
uses
  ActiveX,
  GlobalSpaceDefines,
  unitProxySpace,
  unitReflector,
  unitObjectReflectingCfg,
  Functionality,
  TypesDefines,
  unitObjectModel;

{$R *.dfm}


Constructor TfmGeoObjectTrackDecodingPrintingPanel.Create(const pTrackControlPanel: TfmGeoObjectTrackControlPanel);
begin
Inherited Create(nil);
TrackControlPanel:=pTrackControlPanel;
PrintPageFileName:=ExtractFilePath(ParamStr(0))+PathTempDATA+'\'+FormatDateTime('DDMMYYHHNNSS',Now)+'.html';
with TComponentFunctionality_Create(idTCoComponent,TGeoObjectTrack(TrackControlPanel.ptrGeoObjectTrack^).CoComponentID) do
try
ObjectName:=Name;
finally
Release();
end;
end;

Destructor TfmGeoObjectTrackDecodingPrintingPanel.Destroy();
begin
if (wbPrintBrowser <> nil) then wbPrintBrowser.Stop();
if (lvFragments <> nil) then lvFragments_Clear();
DeleteFile(PrintPageFileName);
Inherited;
end;

procedure TfmGeoObjectTrackDecodingPrintingPanel.lvFragments_Clear();
var
  I: integer;
begin
for I:=0 to lvFragments.Items.Count-1 do FreeMem(lvFragments.Items[I].Data,SizeOf(TObjectTrackNode));
//.
lvFragments.Items.Clear();  
end;

function TfmGeoObjectTrackDecodingPrintingPanel.lvFragments_AddNew(const ptrTrackNode: pointer; const Description: string): integer;
begin
with lvFragments.Items.Add() do begin
Data:=ptrTrackNode;
Caption:=Description;
Checked:=true;
Result:=Index;
end;
end;

procedure TfmGeoObjectTrackDecodingPrintingPanel.lvFragments_Remove(const Index: integer);
begin
FreeMem(lvFragments.Items[Index].Data,SizeOf(TObjectTrackNode));
//.
lvFragments.Items[Index].Delete();
end;

procedure TfmGeoObjectTrackDecodingPrintingPanel.CompilePrintPageFile();
const
  FragmentBMP_Width = 640;
  FragmentBMP_Height = 480;
  FragmentBMP_MarkLength = 16;
  FragmentBMP_MarkColor = clRed;

  function Table_Header(const HeaderName: string): string;
  begin
  Result:='<td width=21 valign=top style=''width:159.5pt;border:solid black 1.0pt; mso-border-themecolor:text1;border-bottom:solid black 2.25pt;mso-border-bottom-themecolor: text1;padding: '+
          '0cm 5.4pt 0cm 5.4pt''> <p class=MsoNormal style=''margin-bottom:0cm;margin-bottom:.0001pt;line-height: normal;mso-yfti-cnfc:5''><span class=SpellE><b><span lang=EN-US '+
          'style=''font-family:"Cambria","serif";mso-ascii-theme-font:major-latin; mso-fareast-font-family:"Times New Roman";mso-fareast-theme-font:major-fareast; mso-hansi-theme-font:major-latin;mso-bidi-font-family:"Times New Roman"; '+
          'mso-bidi-theme-font:major-bidi;mso-ansi-language:EN-US''>'+HeaderName+'</span></b></span><b><span lang=EN-US style=''font-family:"Cambria","serif";mso-ascii-theme-font:major-latin; mso-fareast-font-family:"Times New Roman";mso-fareast-theme-font:major-fareast; '+
          'mso-hansi-theme-font:major-latin;mso-bidi-font-family:"Times New Roman"; mso-bidi-theme-font:major-bidi;mso-ansi-language:EN-US''><o:p></o:p></span></b></p></td>';
  end;

  function Table_LightCell(const CellText: string): string;
  begin
  Result:='<td width=21 valign=top style=''width:159.5pt;border:solid black 1.0pt; mso-border-themecolor:text1;border-top:none;mso-border-top-alt:solid black 1.0pt; mso-border-top-themecolor:text1;padding:0cm 5.4pt 0cm 5.4pt''> <p class=MsoNormal '+
          'style=''margin-bottom:0cm;margin-bottom:.0001pt;line-height:normal;mso-yfti-cnfc:132''><b><span lang=EN-US style=''font-family:"Cambria","serif"; mso-ascii-theme-font:major-latin;mso-fareast-font-family:"Times New Roman"; '+
          'mso-fareast-theme-font:major-fareast; mso-hansi-theme-font:major-latin; mso-bidi-font-family:"Times New Roman";mso-bidi-theme-font:major-bidi; mso-ansi-language:EN-US''>'+CellText+'<o:p></o:p></span></b></p></td>';
  end;

  function Table_DarkCell(const CellText: string): string;
  begin
  Result:='<td width=21 valign=top style=''width:159.5pt;border:solid black 1.0pt; mso-border-themecolor:text1;border-top:none;mso-border-top-alt:solid black 1.0pt; mso-border-top-themecolor:text1;background:silver;mso-background-themecolor:text1; '+
          'mso-background-themetint:63;padding:0cm 5.4pt 0cm 5.4pt''><p class=MsoNormal style=''margin-bottom:0cm;margin-bottom:.0001pt;line-height:normal;mso-yfti-cnfc:68''><span class=SpellE><b><span lang=EN-US style=''font-family:"Cambria","serif"; '+
          'mso-ascii-theme-font:major-latin; mso-fareast-font-family:"Times New Roman";mso-fareast-theme-font:major-fareast; mso-hansi-theme-font:major-latin;mso-bidi-font-family:"Times New Roman"; mso-bidi-theme-font:major-bidi; '+
          'mso-ansi-language:EN-US''>'+CellText+'</span></b></span><b><span lang=EN-US style=''font-family:"Cambria","serif";mso-ascii-theme-font:major-latin; mso-fareast-font-family:"Times New Roman";mso-fareast-theme-font:major-fareast; '+
          'mso-hansi-theme-font:major-latin;mso-bidi-font-family:"Times New Roman"; mso-bidi-theme-font:major-bidi;mso-ansi-language:EN-US''><o:p></o:p></span></b></p></td>';
  end;

  function Table_Cell(const CellText: string; const flDark: boolean): string;
  begin
  if (flDark)
   then Result:=Table_DarkCell(CellText)
   else Result:=Table_LightCell(CellText);
  end;

  procedure GetFragmentBitmap(const Lat,Long: double; out BMP: TBitmap);
  var
    X,Y: Extended;
    dX,dY: Extended;
    Reflector: TReflector;
    RW: TReflectionWindowStrucEx;
    HorRange,VertRange: Extended;
    X1new,Y1new,X2new,Y2new,X3new,Y3new: TCrd;
    VisibleFactor: integer;
    DynamicHintVisibility: double;
    InvisibleLayNumbersArray: TByteArray;
    DynamicHintData: TMemoryStream;
    ActualityInterval: TComponentActualityInterval; 

    procedure PixShiftPoint(const VertShift,HorShift: integer; var X,Y: TCrd);
    var
       VS,HS,ofsX,ofsY: Extended;
       diffX0X3,diffY0Y3, diffX0X1,diffY0Y1: real;
    begin
    with RW do begin
    VS:=VertShift*VertRange/(Ymx-Ymn);
    HS:=HorShift*HorRange/(Xmx-Xmn);
    //.
    diffX0X3:=X0-X3;diffY0Y3:=Y0-Y3;
    diffX0X1:=X0-X1;diffY0Y1:=Y0-Y1;
    //.
    ofsX:=(diffX0X1)*HS/HorRange+(diffX0X3)*VS/VertRange;
    ofsY:=(diffY0Y1)*HS/HorRange+(diffY0Y3)*VS/VertRange;
    //.
    X:=X+ofsX;Y:=Y+ofsY;
    end;
    end;

  begin
  BMP:=nil;
  if (NOT TrackControlPanel.GeoObjectTracks.Convertor.ConvertGeoGrdToXY(Lat,Long,{out} X,Y)) then Raise Exception.Create('could not convert Lat,Long to X,Y'); //. =>
  try
  BMP:=TBitmap.Create();
  BMP.Width:=FragmentBMP_Width;
  BMP.Height:=FragmentBMP_Height;
  //.
  Reflector:=TrackControlPanel.GeoObjectTracks.Convertor.Reflector;
  //.
  Reflector.ReflectionWindow.GetWindow(true,{out} RW);
  with RW do begin
  HorRange:=Sqrt(sqr(X1-X0)+sqr(Y1-Y0));
  VertRange:=Sqrt(sqr(X3-X0)+sqr(Y3-Y0));
  X1new:=X1;Y1new:=Y1;
  X2new:=X2;Y2new:=Y2;
  X3new:=X3;Y3new:=Y3;
  PixShiftPoint(0,Xmx-BMP.Width, X1new,Y1new);
  PixShiftPoint(Ymx-BMP.Height,Xmx-BMP.Width, X2new,Y2new);
  PixShiftPoint(Ymx-BMP.Height,0, X3new,Y3new);
  X1:=X1new;Y1:=Y1new;
  X2:=X2new;Y2:=Y2new;
  X3:=X3new;Y3:=Y3new;
  Xmx:=Xmn+BMP.Width;
  Ymx:=Ymn+BMP.Height;
  //.
  dX:=X-(X0+X2)/2.0; dY:=Y-(Y0+Y2)/2.0;
  //.
  X0:=X0+dX; Y0:=Y0+dY;
  X1:=X1+dX; Y1:=Y1+dY;
  X2:=X2+dX; Y2:=Y2+dY;
  X3:=X3+dX; Y3:=Y3+dY;
  end;
  //.
  VisibleFactor:=Reflector.ReflectionWindow.VisibleFactor;
  DynamicHintVisibility:=Reflector.DynamicHints.VisibleFactor;
  InvisibleLayNumbersArray:=TObjectReflectingCfg(Reflector.Reflecting.ObjectConfiguration).HidedLays.GetLayNumbersArray();
  ActualityInterval:=Reflector.ReflectionWindow.GetActualityInterval();
  //.
  Reflector.Space.User_ReflectSpaceWindowOnBitmap(Reflector.Space.UserName,Reflector.Space.UserPassword, RW.X0,RW.Y0,RW.X1,RW.Y1,RW.X2,RW.Y2,RW.X3,RW.Y3, InvisibleLayNumbersArray, VisibleFactor,DynamicHintVisibility, 0{DynamicHintDataVersion},nil{VisualizationUserData},ActualityInterval, BMP.Width,BMP.Height, {ref} BMP, {out} DynamicHintData);
  except
    FreeAndNil(BMP);
    //.
    Raise; //. =>
    end;
  end;

var
  TF: TextFile;
  I: integer;
  flDarkRow: boolean;
  FragmentBMP: TBitmap;
  FragmentBMPFileName: string; 
begin
AssignFile(TF,PrintPageFileName); Rewrite(TF);
try
WriteLn(TF,'<html>');
WriteLn(TF,'<head>');
WriteLn(TF,'<meta http-equiv="Content-Language" content="ru">');
WriteLn(TF,'<meta name="GENERATOR" content="Geoscope">');
WriteLn(TF,'<meta name="ProgId" content="Geoscope.Editor.Document">');
WriteLn(TF,'<meta http-equiv="Content-Type" content="text/html; charset=windows-1251">');
WriteLn(TF,'<title>'+'Track report: '+ObjectName+'</title>');
WriteLn(TF,'</head>');
WriteLn(TF,'<body>');
//. body
WriteLn(TF,'<p align="left">');
WriteLn(TF,'<p align="left">'+'Object: '+ObjectName+'</p>');
WriteLn(TF,'<p align="left">');
WriteLn(TF,'<p align="left">');
//.
if (cbStopsAndMovementsAnalysis.Checked)
 then begin
  WriteLn(TF,'<p align="left">'+'StopsAndMovements analysis'+'</p>');
  WriteLn(TF,'<table class=MsoTableLightGrid border=1 cellspacing=0 cellpadding=0 style=''border-collapse:collapse;border:none;mso-border-alt:solid black 1.0pt; mso-border-themecolor:text1;mso-yfti-tbllook:1184;mso-padding-alt:0cm 5.4pt 0cm 5.4pt''>');
  WriteLn(TF,'<tr style=''mso-yfti-irow:-1;mso-yfti-firstrow:yes''>');
  WriteLn(TF,Table_Header(' Time '));
  WriteLn(TF,Table_Header(' Event '));
  WriteLn(TF,Table_Header(' Duration, min '));
  WriteLn(TF,Table_Header(' Distance,km '));
  WriteLn(TF,Table_Header(' Location '));
  WriteLn(TF,Table_Header(' Avr Speed, km/h '));
  WriteLn(TF,Table_Header(' Min Speed, km/h '));
  WriteLn(TF,Table_Header(' Max Speed, km/h '));
  WriteLn(TF,'</tr>');
  //.
  for I:=0 to TrackControlPanel.lvStopsAndMovementsAnalysis.Items.Count-1 do with TrackControlPanel.lvStopsAndMovementsAnalysis.Items[I] do begin
    flDarkRow:=(I MOD 2) = 0;
    //.
    WriteLn(TF,'<tr  style=''mso-yfti-irow:0''>');
    WriteLn(TF,Table_Cell(Caption,flDarkRow));
    WriteLn(TF,Table_Cell(SubItems[0],flDarkRow));
    WriteLn(TF,Table_Cell(SubItems[1],flDarkRow));
    WriteLn(TF,Table_Cell(SubItems[2],flDarkRow));
    WriteLn(TF,Table_Cell(SubItems[3],flDarkRow));
    WriteLn(TF,Table_Cell(SubItems[4],flDarkRow));
    WriteLn(TF,Table_Cell(SubItems[5],flDarkRow));
    WriteLn(TF,Table_Cell(SubItems[6],flDarkRow));
    WriteLn(TF,'</tr>');
    end;
  //.
  WriteLn(TF,'</tr>');
  WriteLn(TF,'</table>');
  WriteLn(TF,'<p align="left">'+'Summary: '+TrackControlPanel.lbStopsAndMovementsDuration.Caption+'</p>');
  WriteLn(TF,'<p align="left">');
  end;
if (cbFuelConsumptionAnalysis.Checked)
 then begin
  WriteLn(TF,'<p align="left">'+'Fuel consumption analysis'+'</p>');
  WriteLn(TF,'<table class=MsoTableLightGrid border=1 cellspacing=0 cellpadding=0 style=''border-collapse:collapse;border:none;mso-border-alt:solid black 1.0pt; mso-border-themecolor:text1;mso-yfti-tbllook:1184;mso-padding-alt:0cm 5.4pt 0cm 5.4pt''>');
  WriteLn(TF,'<tr style=''mso-yfti-irow:-1;mso-yfti-firstrow:yes''>');
  WriteLn(TF,Table_Header(' Time '));
  WriteLn(TF,Table_Header(' Duration, min '));
  WriteLn(TF,Table_Header(' Distance,km '));
  WriteLn(TF,Table_Header(' Avr Speed, km/h '));
  WriteLn(TF,Table_Header(' Consumption, L '));
  WriteLn(TF,'</tr>');
  //.
  for I:=0 to TrackControlPanel.lvFuelConsumptionAnalysis.Items.Count-1 do with TrackControlPanel.lvFuelConsumptionAnalysis.Items[I] do begin
    flDarkRow:=(I MOD 2) = 0;
    //.
    WriteLn(TF,'<tr  style=''mso-yfti-irow:0''>');
    WriteLn(TF,Table_Cell(Caption,flDarkRow));
    WriteLn(TF,Table_Cell(SubItems[0],flDarkRow));
    WriteLn(TF,Table_Cell(SubItems[1],flDarkRow));
    WriteLn(TF,Table_Cell(SubItems[2],flDarkRow));
    WriteLn(TF,Table_Cell(SubItems[3],flDarkRow));
    WriteLn(TF,'</tr>');
    end;
  //.
  WriteLn(TF,'</tr>');
  WriteLn(TF,'</table>');
  WriteLn(TF,'<p align="left">'+'Summary: '+TrackControlPanel.lbFuelConsumption.Caption+'</p>');
  WriteLn(TF,'<p align="left">');
  WriteLn(TF,'<p align="left">');
  WriteLn(TF,'<p align="left">');
  end;
if (cbBusinessModelEvents.Checked)
 then begin
  WriteLn(TF,'<p align="left">'+'Events'+'</p>');
  WriteLn(TF,'<table class=MsoTableLightGrid border=1 cellspacing=0 cellpadding=0 style=''border-collapse:collapse;border:none;mso-border-alt:solid black 1.0pt; mso-border-themecolor:text1;mso-yfti-tbllook:1184;mso-padding-alt:0cm 5.4pt 0cm 5.4pt''>');
  WriteLn(TF,'<tr style=''mso-yfti-irow:-1;mso-yfti-firstrow:yes''>');
  WriteLn(TF,Table_Header(' Time '));
  WriteLn(TF,Table_Header(' Severity '));
  WriteLn(TF,Table_Header(' Message '));
  WriteLn(TF,Table_Header(' Info '));
  WriteLn(TF,'</tr>');
  //.
  for I:=0 to TrackControlPanel.lvBusinessModelEvents.Items.Count-1 do with TrackControlPanel.lvBusinessModelEvents.Items[I] do begin
    flDarkRow:=false;
    //.
    WriteLn(TF,'<tr  style=''mso-yfti-irow:0''>');
    WriteLn(TF,Table_Cell(Caption,flDarkRow));
    WriteLn(TF,Table_Cell(SubItems[0],flDarkRow));
    WriteLn(TF,Table_Cell(SubItems[1],flDarkRow));
    WriteLn(TF,Table_Cell(SubItems[2],flDarkRow));
    WriteLn(TF,'</tr>');
    end;
  //.
  WriteLn(TF,'</tr>');
  WriteLn(TF,'</table>');
  WriteLn(TF,'<p align="left">'+'Summary: '+TrackControlPanel.stBusinessModelEventsSummary.Caption+'</p>');
  WriteLn(TF,'<p align="left">');
  WriteLn(TF,'<p align="left">');
  WriteLn(TF,'<p align="left">');
  end;
if (lvFragments.Items.Count > 0)
 then begin
  WriteLn(TF,'<p align="left">'+'Fragments: '+'</p>');
  WriteLn(TF,'<p align="left">');
  for I:=0 to lvFragments.Items.Count-1 do if (lvFragments.Items[I].Checked) then begin
    with TObjectTrackNode(lvFragments.Items[I].Data^) do GetFragmentBitmap(Latitude,Longitude,{out} FragmentBMP);
    try
    //. show center
    FragmentBMP.Canvas.Pen.Color:=FragmentBMP_MarkColor;
    FragmentBMP.Canvas.Pen.Width:=2;
    FragmentBMP.Canvas.MoveTo((FragmentBMP.Width-FragmentBMP_MarkLength) DIV 2,FragmentBMP.Height DIV 2);
    FragmentBMP.Canvas.LineTo((FragmentBMP.Width+FragmentBMP_MarkLength) DIV 2,FragmentBMP.Height DIV 2);
    FragmentBMP.Canvas.MoveTo(FragmentBMP.Width DIV 2,(FragmentBMP.Height-FragmentBMP_MarkLength) DIV 2);
    FragmentBMP.Canvas.LineTo(FragmentBMP.Width DIV 2,(FragmentBMP.Height+FragmentBMP_MarkLength) DIV 2);
    //.
    FragmentBMPFileName:=ExtractFilePath(ParamStr(0))+PathTempDATA+'\'+FormatDateTime('DDMMYYHHNNSS',Now)+'.bmp';
    FragmentBMP.SaveToFile(FragmentBMPFileName);
    finally
    FragmentBMP.Destroy();
    end;
    WriteLn(TF,'<p align="left">'+lvFragments.Items[I].Caption+'</p>');
    WriteLn(TF,'<img border="0" src="'+FragmentBMPFileName+'"></p>');
    WriteLn(TF,'<p align="left">');
    WriteLn(TF,'<p align="left">');
    end;
  end;
//.
WriteLn(TF,'</body>');
WriteLn(TF,'</html>');
finally
CloseFile(TF);
end;
//.
PreviewPrintPageFile();
end;

procedure TfmGeoObjectTrackDecodingPrintingPanel.PreviewPrintPageFile();
begin
if (NOT FileExists(PrintPageFileName)) then Raise Exception.Create('report is not constructed'); //. =>
wbPrintBrowser.Stop();
wbPrintBrowser.Navigate(PrintPageFileName);
end;

procedure TfmGeoObjectTrackDecodingPrintingPanel.FormCreate(Sender: TObject);
begin
if (wbPrintBrowser = nil)
 then begin
  CoInitializeEx(nil, COINIT_APARTMENTTHREADED);
  try
  Show();
  wbPrintBrowser:=TWebBrowser.Create(Self);
  wbPrintBrowser.Align:=alClient;
  TControl(wbPrintBrowser).Parent:=Self;
  wbPrintBrowser.Show();
  finally
  CoUninitialize;
  end;
  end;
end;

procedure TfmGeoObjectTrackDecodingPrintingPanel.btnCompileClick(Sender: TObject);
var
  SC: TCursor;
begin
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
//.
CompilePrintPageFile();
finally
Screen.Cursor:=SC;
end;
wbPrintBrowser.Show();
end;

procedure TfmGeoObjectTrackDecodingPrintingPanel.btnPrintClick(Sender: TObject);
var
   vIn, vOut: OleVariant;
begin
if (NOT FileExists(PrintPageFileName)) then Raise Exception.Create('report is not constructed'); //. =>
wbPrintBrowser.ControlInterface.ExecWB(OLECMDID_PRINT, OLECMDEXECOPT_PROMPTUSER, vIn, vOut) ;
end;


procedure TfmGeoObjectTrackDecodingPrintingPanel.btnExitClick(Sender: TObject);
begin
Close();
end;


procedure TfmGeoObjectTrackDecodingPrintingPanel.Removeselecteditem1Click(Sender: TObject);
begin
if (lvFragments.Selected <> nil) then lvFragments_Remove(lvFragments.Selected.Index);
end;

procedure TfmGeoObjectTrackDecodingPrintingPanel.RemoveAll1Click(Sender: TObject);
begin
lvFragments_Clear();
end;


end.
