unit unitCoSegmentedImagePanelProps;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GlobalSpaceDefines, FunctionalityImport, unitCoSegmentedImageFunctionality, unitCoComponentRepresentations, StdCtrls, ExtCtrls, Buttons;

type
  TCoSegmentedImagePanelProps = class(TCoComponentPanelProps)
    Panel1: TPanel;
    sbLoadFromFile: TSpeedButton;
    Image: TImage;
    Label1: TLabel;
    sPrepare: TSpeedButton;
    edProportion: TEdit;
    OpenFileDialog: TOpenDialog;
    Splitter1: TSplitter;
    sbSegmentsMap: TScrollBox;
    sbBindImage: TSpeedButton;
    StaticText1: TStaticText;
    sbShowSegments: TSpeedButton;
    procedure sbLoadFromFileClick(Sender: TObject);
    procedure edProportionKeyPress(Sender: TObject; var Key: Char);
    procedure sPrepareClick(Sender: TObject);
    procedure sbBindImageClick(Sender: TObject);
    procedure sbShowSegmentsClick(Sender: TObject);
  private
    { Private declarations }
    procedure LoadFromFile;
  public
    { Public declarations }
    Constructor Create(const pidCoComponent: integer); override;
    Destructor Destroy; override;
    procedure _Update; override;
    procedure SegmentsMap_Clear;
    procedure SegmentsMap_Update;
    procedure SegmentsMap__DoOnSegmentMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,Y: Integer);
  end;

implementation
Uses
  ShellAPI,
  JPEG,
  TypesDefines,
  unitCoDetailedImageBinder;

{$R *.dfm}


Constructor TCoSegmentedImagePanelProps.Create(const pidCoComponent: integer);
begin
Inherited Create(pidCoComponent);
Update;
end;

Destructor TCoSegmentedImagePanelProps.Destroy;
begin
Inherited;
end;

procedure TCoSegmentedImagePanelProps._Update;
begin
with TCoSegmentedImageFunctionality.Create(idCoComponent) do
try
edProportion.Text:=FormatFloat('0.000',Proportion);
finally
Release;
end;
end;


procedure TCoSegmentedImagePanelProps.LoadFromFile;
var
  CD: string;
  R: boolean;
begin
CD:=GetCurrentDir;
try
R:=OpenFileDialog.Execute;
finally
SetCurrentDir(CD);
end;
if R
 then with TCoSegmentedImageFunctionality.Create(idCoComponent) do
  try
  ProxySpace__Log_OperationStarting('generation image from file ...');
  try
  GenerateFromImage(OpenFileDialog.FileName);
  finally
  ProxySpace__Log_OperationDone;
  end;
  Self.Update;
  finally
  Release;
  end;
end;

procedure TCoSegmentedImagePanelProps.SegmentsMap_Clear;
begin
sbSegmentsMap.DestroyComponents;
end;

procedure TCoSegmentedImagePanelProps.SegmentsMap_Update;
const
  OrgX = 16;
  OrgY = 16;
  PanelSize = 128;
var
  MapTable: pointer;
  MapTableXSize,MapTableYSize: integer;
  SegmentWidth,SegmentHeight: double;
  PanelXSize,PanelYSize: integer;
  I,J: integer;
  LevelsInfo: TByteArray;
  idLevel0Params: TDetailedPictureVisualizationLevel;
  idSegment: integer;
  ExS: TByteArray;
  SegmentDATA: TByteArray;
  P: pointer;
  SegmentParams: TDetailedPictureVisualizationLevelSegment;
  _DATASize: integer;
  JI: TJPegImage;
  NewPanel: TPanel;
  NewImage: TImage;
begin
SegmentsMap_Clear;
//.
with TCoSegmentedImageFunctionality.Create(idCoComponent) do
try
GetSegmentsMapTable(MapTable, MapTableXSize,MapTableYSize, SegmentWidth,SegmentHeight);
if (MapTable <> nil)
 then
  try
  PanelXSize:=PanelSize;
  PanelYSize:=Round(PanelSize*(SegmentHeight/SegmentWidth));
  for I:=0 to MapTableYSize-1 do
    for J:=0 to MapTableXSize-1 do begin
      idSegment:=Integer(Pointer(Integer(MapTable)+(I*MapTableXSize+J)*SizeOf(Integer))^);
      if (idSegment <> 0)
       then begin
        //. segment data getting (level 0, segment: 0;0)
        with TDetailedPictureVisualizationFunctionality(TComponentFunctionality_Create(idTDetailedPictureVisualization,idSegment)) do
        try
        GetLevelsInfo(LevelsInfo);
        if (Length(LevelsInfo) = 0) then Continue; //. >
        idLevel0Params:=TDetailedPictureVisualizationLevel(Pointer(@LevelsInfo[Length(LevelsInfo)-SizeOf(TDetailedPictureVisualizationLevel)])^);
        SetLength(ExS,0);
        Level_GetSegments(idLevel0Params.id, 0,0,0,0, ExS, SegmentDATA);
        finally
        Release;
        end;
        P:=@SegmentDATA[0];
        with SegmentParams do begin
        id:=Integer(P^); Inc(Integer(P),SizeOf(id));
        XIndex:=Integer(P^); Inc(Integer(P),SizeOf(XIndex));
        YIndex:=Integer(P^); Inc(Integer(P),SizeOf(YIndex));
        _DATASize:=Integer(P^); Inc(Integer(P),SizeOf(_DATASize));
        if (_DATASize > 0)
         then begin
          DATA:=TMemoryStream.Create;
          try
          DATA.Size:=_DATASize;
          DATA.Write(P^,_DATASize);
          Inc(Integer(P),_DATASize);
          except
            FreeAndNil(DATA);
            Raise; //. =>
            end;
          end
         else DATA:=nil;
        //.
        try
        if (DATA <> nil)
         then begin
          NewPanel:=TPanel.Create(sbSegmentsMap);
          NewPanel.Width:=PanelXSize;
          NewPanel.Height:=PanelYSize;
          NewPanel.Left:=OrgX+J*PanelXSize;
          NewPanel.Top:=OrgY+I*PanelYSize;
          NewPanel.Parent:=sbSegmentsMap;
          //.
          JI:=TJpegImage.Create;
          try
          DATA.Position:=0;
          JI.LoadFromStream(DATA);
          NewImage:=TImage.Create(NewPanel);
          NewImage.Align:=alClient;
          NewImage.Stretch:=true;
          NewImage.Picture.Assign(JI);
          NewImage.Tag:=idSegment;
          NewImage.OnMouseDown:=SegmentsMap__DoOnSegmentMouseDown;
          NewImage.Parent:=NewPanel;
          finally
          JI.Destroy;
          end;
          //.
          NewPanel.Show;
          end;
        finally
        DATA.Free;
        end;
        end;
        end
       else begin
        NewPanel:=TPanel.Create(sbSegmentsMap);
        NewPanel.Caption:='Empty segment';
        NewPanel.Color:=clSilver;
        NewPanel.Width:=PanelXSize;
        NewPanel.Height:=PanelYSize;
        NewPanel.Left:=OrgX+J*PanelXSize;
        NewPanel.Top:=OrgY+I*PanelYSize;
        NewPanel.BevelOuter:=bvLowered;
        NewPanel.Parent:=sbSegmentsMap;
        NewPanel.Show;
        end;
      end;
  finally
  FreeMem(MapTable, MapTableXSize*MapTableYSize*SizeOf(Integer));
  end;
finally
Release;
end;
end;

procedure TCoSegmentedImagePanelProps.SegmentsMap__DoOnSegmentMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,Y: Integer);
var
  idSegment: integer;
  SegmentPropsForm: TForm;
begin
idSegment:=TImage(Sender).Tag;
if (Button = mbLeft)
 then begin
  with TDetailedPictureVisualizationFunctionality(TComponentFunctionality_Create(idTDetailedPictureVisualization,idSegment)) do
  try
  SegmentPropsForm:=TLevelsPropsPanel_Create();
  try
  SegmentPropsForm.ShowModal();
  finally
  SegmentPropsForm.Destroy;
  end;
  finally
  Release;
  end;
  end
 else begin
  with TComponentFunctionality_Create(idTDetailedPictureVisualization,idSegment) do
  try
  with TPanelProps_Create(false, 0,nil,nilObject) do begin
  Position:=poScreenCenter;
  Show;
  end;
  finally
  Release;
  end;
  end;
end;

procedure TCoSegmentedImagePanelProps.sbLoadFromFileClick(Sender: TObject);
begin
LoadFromFile;
end;

procedure TCoSegmentedImagePanelProps.edProportionKeyPress(Sender: TObject; var Key: Char);
begin
if (Key = #$0D)
 then with TCoSegmentedImageFunctionality.Create(idCoComponent) do
  try
  Proportion:=StrToFloat(edProportion.Text);
  finally
  Release;
  end;
end;

procedure TCoSegmentedImagePanelProps.sPrepareClick(Sender: TObject);
begin
if (Application.MessageBox('Confirm operation','Confirmation',MB_YESNO+MB_ICONWARNING) <> IDYES) then Exit; //. ->
with TCoSegmentedImageFunctionality.Create(idCoComponent) do
try
Prepare();
finally
Release;
end;
end;

procedure TCoSegmentedImagePanelProps.sbBindImageClick(Sender: TObject);
begin
with TfmCoDetailedImageBinder.Create(idCoComponent) do
try
ShowModal();
finally
Destroy;
end;
end;

procedure TCoSegmentedImagePanelProps.sbShowSegmentsClick(Sender: TObject);
begin
sbShowSegments.Hide;
SegmentsMap_Update;
end;

end.
