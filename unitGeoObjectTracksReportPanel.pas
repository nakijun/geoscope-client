unit unitGeoObjectTracksReportPanel;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, SHDocVw, ExtCtrls, StdCtrls, Buttons,
  ComCtrls, Menus,
  unitObjectModel;

type
  TfmGeoObjectTracksReportPanel = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnPrint: TBitBtn;
    btnExit: TBitBtn;
    cbStopsAndMovementsAnalysis: TCheckBox;
    cbFuelConsumptionAnalysis: TCheckBox;
    cbBusinessModelEvents: TCheckBox;
    btnCompile: TBitBtn;
    cbResolvePositionToLocation: TCheckBox;
    procedure btnPrintClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnCompileClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    TrackDecriptors: TGeoObjectTrackDecriptors;
    ReportName: string;
    PrintPageFileName: string;
    wbPrintBrowser: TWebBrowser;

    procedure PreviewPrintPageFile();
  public
    { Public declarations }
    Constructor Create(var vTrackDecriptors: TGeoObjectTrackDecriptors; const pReportName: string);
    Destructor Destroy(); override;
    procedure CompilePrintPageFile();
  end;


implementation
uses
  ActiveX,
  unitProxySpace,
  GlobalSpaceDefines,
  GeoTransformations,
  unitGeoObjectTrackDecoding;

{$R *.dfm}


Constructor TfmGeoObjectTracksReportPanel.Create(var vTrackDecriptors: TGeoObjectTrackDecriptors; const pReportName: string);
begin
Inherited Create(nil);
TrackDecriptors:=vTrackDecriptors;
vTrackDecriptors:=nil;
//.
ReportName:=pReportName;
Caption:=ReportName;
//.
PrintPageFileName:=ExtractFilePath(ParamStr(0))+PathTempDATA+'\'+FormatDateTime('DDMMYYHHNNSS',Now)+'.html';
end;

Destructor TfmGeoObjectTracksReportPanel.Destroy();
var
  I: integer;
begin
if (wbPrintBrowser <> nil) then wbPrintBrowser.Stop();
DeleteFile(PrintPageFileName);
if (Length(TrackDecriptors) > 0)
 then begin
  for I:=0 to Length(TrackDecriptors)-1 do if (TrackDecriptors[I].ptrTrack <> nil) then TObjectModel.Log_DestroyTrack(TrackDecriptors[I].ptrTrack);
  SetLength(TrackDecriptors,0);
  end;
Inherited;
end;

procedure TfmGeoObjectTracksReportPanel.CompilePrintPageFile();

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

var
  I,J: integer;
  TF: TextFile;
  flDarkRow: boolean;
  NearestEvents: TObjectTrackEvents;
  LocationInfo: string;
  SummaryDistance: Extended;
  SD,MD: TDateTime;
  OI: integer;
  S: string;
  ptrEvent: pointer;
  InfoEventsCounter,MinorEventsCounter,MajorEventsCounter,CriticalEventsCounter: integer;
begin
ProxySpace.Log.OperationStarting('preparing report ...');
try
ProxySpace.Log.OperationProgress(0);
//. decoding tracks if needed
if (Length(TrackDecriptors) > 0)
 then begin
  for I:=0 to Length(TrackDecriptors)-1 do if ((TrackDecriptors[I].ptrTrack <> nil) AND (TGeoObjectTrack(TrackDecriptors[I].ptrTrack^).StopsAndMovementsAnalysis = nil))
   then with TGeoObjectTrack(TrackDecriptors[I].ptrTrack^) do begin
    StopsAndMovementsAnalysis:=TTrackStopsAndMovementsAnalysis.Create();
    TTrackStopsAndMovementsAnalysis(StopsAndMovementsAnalysis).Process(TrackDecriptors[I].ptrTrack);
    end;
  end;
//.
AssignFile(TF,PrintPageFileName); Rewrite(TF);
try
WriteLn(TF,'<html>');
WriteLn(TF,'<head>');
WriteLn(TF,'<meta http-equiv="Content-Language" content="ru">');
WriteLn(TF,'<meta name="GENERATOR" content="Geoscope">');
WriteLn(TF,'<meta name="ProgId" content="Geoscope.Editor.Document">');
WriteLn(TF,'<meta http-equiv="Content-Type" content="text/html; charset=windows-1251">');
WriteLn(TF,'<title>'+ReportName+'</title>');
WriteLn(TF,'</head>');
WriteLn(TF,'<body>');
//. body
for OI:=0 to Length(TrackDecriptors)-1 do begin
  WriteLn(TF,'<p align="left">');
  WriteLn(TF,'<p align="left">');
  WriteLn(TF,'<p align="left">'+'Object: '+TrackDecriptors[OI].ObjectName+'</p>');
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
    SummaryDistance:=0.0;
    for I:=0 to TTrackStopsAndMovementsAnalysis(TGeoObjectTrack(TrackDecriptors[OI].ptrTrack^).StopsAndMovementsAnalysis).Items.Count-1 do with TTrackStopsAndMovementsAnalysisInterval(TTrackStopsAndMovementsAnalysis(TGeoObjectTrack(TrackDecriptors[OI].ptrTrack^).StopsAndMovementsAnalysis).Items[I]) do begin
      flDarkRow:=(I MOD 2) = 0;
      //.
      WriteLn(TF,'<tr  style=''mso-yfti-irow:0''>');
      WriteLn(TF,Table_Cell(FormatDateTime('DD/MM/YY HH:NN:SS',Position.TimeStamp+TimeZoneDelta),flDarkRow));
      if (flMovement) then S:='Movement' else S:='stop';
      WriteLn(TF,Table_Cell(S,flDarkRow));
      WriteLn(TF,Table_Cell(FormatFloat('0.0',Duration*(24*60)),flDarkRow));
      if (flMovement) then S:=FormatFloat('0.000',Distance/1000.0) else S:='';
      WriteLn(TF,Table_Cell(S,flDarkRow));
      SummaryDistance:=SummaryDistance+Distance;
      S:='';
      if (Track_GetNearestBusinessModelEvents(TrackDecriptors[OI].ptrTrack, Position.TimeStamp,Duration, otesCritical,{out} NearestEvents))
       then begin
        for J:=0 to Length(NearestEvents)-1 do
          case NearestEvents[J].EventTag of
          EVENTTAG_POI_NEW: S:=S+' POI,';
          EVENTTAG_POI_ADDTEXT: S:=S+' Text: '+NearestEvents[J].EventMessage+',';
          EVENTTAG_POI_ADDIMAGE: S:=S+' Image,';
          EVENTTAG_POI_ADDDATAFILE: S:=S+' DataFile,';
          end;
        if (Length(S) > 0) then SetLength(S,Length(S)-1);
        end;
      if ((NOT flMovement) AND cbResolvePositionToLocation.Checked)
       then begin
        with TGeoCrdConverter.Create(TGeoObjectTrack(TrackDecriptors[OI].ptrTrack^).DatumID) do
        try
        GeoCoder_LatLongToNearestObjects(GEOCODER_YANDEXMAPS, Position.Latitude,Position.Longitude,{out} LocationInfo);
        finally
        Destroy();
        end;
        if (LocationInfo <> '')
         then
          if (S = '')
           then S:=LocationInfo
           else S:=S+'; '+LocationInfo;
        end;
      WriteLn(TF,Table_Cell(S,flDarkRow));
      WriteLn(TF,Table_Cell(FormatFloat('0',AvrSpeed),flDarkRow));
      WriteLn(TF,Table_Cell(FormatFloat('0',MinSpeed),flDarkRow));
      WriteLn(TF,Table_Cell(FormatFloat('0',MaxSpeed),flDarkRow));
      WriteLn(TF,'</tr>');
      end;
    //.
    SD:=TTrackStopsAndMovementsAnalysis(TGeoObjectTrack(TrackDecriptors[OI].ptrTrack^).StopsAndMovementsAnalysis).StopsDuration();
    MD:=TTrackStopsAndMovementsAnalysis(TGeoObjectTrack(TrackDecriptors[OI].ptrTrack^).StopsAndMovementsAnalysis).MovementsDuration();
    S:='Stops duration: '+IntToStr(Trunc(SD*24.0))+' h '+IntToStr(Trunc(Frac(SD*24.0)*60.0))+' min,  '+'Movements duration: '+IntToStr(Trunc(MD*24.0))+' h '+IntToStr(Trunc(Frac(MD*24.0)*60.0))+' min,  '+'Distance: '+FormatFloat('0.000',SummaryDistance/1000.0)+' km';
    WriteLn(TF,'</tr>');
    WriteLn(TF,'</table>');
    WriteLn(TF,'<p align="left">'+'Summary: '+S+'</p>');
    WriteLn(TF,'<p align="left">');
    end;
  (*if (cbFuelConsumptionAnalysis.Checked)
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
    end;*)
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
    ptrEvent:=TGeoObjectTrack(TrackDecriptors[OI].ptrTrack^).BusinessModelEvents;
    while (ptrEvent <> nil) do with TObjectTrackEvent(ptrEvent^) do begin
      flDarkRow:=false;
      //.
      if (Severity = otesCritical)
       then begin
        WriteLn(TF,'<tr  style=''mso-yfti-irow:0''>');
        WriteLn(TF,Table_Cell(FormatDateTime('DD/MM/YY HH:NN:SS',TimeStamp+TimeZoneDelta),flDarkRow));
        WriteLn(TF,Table_Cell(ObjectTrackEventSeverityStrings[Severity],flDarkRow));
        WriteLn(TF,Table_Cell(EventMessage,flDarkRow));
        WriteLn(TF,Table_Cell(EventInfo,flDarkRow));
        WriteLn(TF,'</tr>');
        end;
      //.
      ptrEvent:=Next;
      end;
    //.
    Track_GetBusinessModelEventsInfo(TrackDecriptors[OI].ptrTrack, InfoEventsCounter,MinorEventsCounter,MajorEventsCounter,CriticalEventsCounter);
    S:='Info: '+IntToStr(InfoEventsCounter)+', Minor: '+IntToStr(MinorEventsCounter)+', Major: '+IntToStr(MajorEventsCounter)+', Critical: '+IntToStr(CriticalEventsCounter);
    WriteLn(TF,'</tr>');
    WriteLn(TF,'</table>');
    WriteLn(TF,'<p align="left">'+'Summary: '+S+'</p>');
    WriteLn(TF,'<p align="left">');
    WriteLn(TF,'<p align="left">');
    WriteLn(TF,'<p align="left">');
    end;
  //.
  ProxySpace.Log.OperationProgress(Trunc(100.0*(OI+1)/Length(TrackDecriptors)));
  end;
//.
WriteLn(TF,'</body>');
WriteLn(TF,'</html>');
finally
CloseFile(TF);
end;
finally
ProxySpace.Log.OperationDone();
end;
//.
PreviewPrintPageFile();
end;

procedure TfmGeoObjectTracksReportPanel.PreviewPrintPageFile();
begin
if (NOT FileExists(PrintPageFileName)) then Raise Exception.Create('report is not constructed'); //. =>
wbPrintBrowser.Stop();
wbPrintBrowser.Navigate(PrintPageFileName);
end;

procedure TfmGeoObjectTracksReportPanel.FormCreate(Sender: TObject);
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

procedure TfmGeoObjectTracksReportPanel.btnCompileClick(Sender: TObject);
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

procedure TfmGeoObjectTracksReportPanel.btnPrintClick(Sender: TObject);
var
   vIn, vOut: OleVariant;
begin
if (NOT FileExists(PrintPageFileName)) then Raise Exception.Create('report is not constructed'); //. =>
wbPrintBrowser.ControlInterface.ExecWB(OLECMDID_PRINT, OLECMDEXECOPT_PROMPTUSER, vIn, vOut) ;
end;

procedure TfmGeoObjectTracksReportPanel.btnExitClick(Sender: TObject);
begin
Close();
end;

procedure TfmGeoObjectTracksReportPanel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action:=caFree;
end;


end.
