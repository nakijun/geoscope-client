unit unitInsideFormatting;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes,
  GlobalSpaceDefines, unitProxySpace, Functionality, SpaceObjInterpretation, TypesDefines, TypesFunctionality, unitReflector,
  Graphics, Controls, Forms, Dialogs, ComCtrls, StdCtrls, Buttons, Gauges,
  ExtCtrls;

type
  TfmInsideFormatting = class(TForm)
    Panel1: TPanel;
    pnl: TGroupBox;
    cbTypes: TComboBoxEx;
    rbByCoType: TRadioButton;
    cbCoTypes: TComboBoxEx;
    rbByType: TRadioButton;
    cbScaling: TCheckBox;
    edScalingAlignFactor: TEdit;
    Label1: TLabel;
    sbStartStop: TSpeedButton;
    PageControl1: TPageControl;
    tsProcessing: TTabSheet;
    lvResult: TListView;
    procedure lvResultDblClick(Sender: TObject);
    procedure sbStartStopClick(Sender: TObject);
    procedure rbByTypeClick(Sender: TObject);
    procedure rbByCoTypeClick(Sender: TObject);
    procedure cbScalingClick(Sender: TObject);
  private
    { Private declarations }
    ObjFunctionality: TCELLVisualizationFunctionality;
    cbCoTypes_ImageList: TImageList;
    flInProgress: boolean;
    flProgressCancelled: boolean;
  public
    { Public declarations }
    Constructor Create(pObjFunctionality: TComponentFunctionality);
    destructor Destroy; override;
    procedure lvResult_Clear;
    procedure FormatByObj(const ptrObject: TPtr; const FindTypeID: integer; const flBuiltInType: boolean; const flScaling: boolean; const ScalingSpaceFactor: Extended);
    procedure lvTypes_Update;
    procedure lvCoTypes_Update;
  end;


implementation

{$R *.dfm}


{TComponentsFindServicePanelProps}
Constructor TfmInsideFormatting.Create(pObjFunctionality: TComponentFunctionality);
begin
Inherited Create(nil);
ObjFunctionality:=pObjFunctionality as TCELLVisualizationFunctionality;
ObjFunctionality.AddRef;
cbTypes.Images:=Types_ImageList;
cbCoTypes_ImageList:=TImageList.Create(nil);
with cbCoTypes_ImageList do begin
Width:=Types_ImageList.Width;
Height:=Types_ImageList.Height;
end;
cbCoTypes.Images:=cbCoTypes_ImageList;
flInProgress:=false;
lvTypes_Update;
lvCoTypes_Update;
end;

Destructor TfmInsideFormatting.Destroy;
begin
lvResult_Clear;
cbCoTypes_ImageList.Free;
if ObjFunctionality <> nil then ObjFunctionality.Release;
Inherited;
end;

procedure TfmInsideFormatting.lvTypes_Update;
var
  I: integer;
begin
with cbTypes do begin
Clear;
Items.BeginUpdate;
try
for I:=0 to TypesSystem.Count-1 do with ItemsEx.Add do
  with TTypeSystem(TypesSystem[I]).TypeFunctionalityClass.Create do
  try
  Data:=Pointer(idType);
  Caption:=Name;
  ImageIndex:=ImageList_Index;
  finally
  Release;
  end;
finally
Items.EndUpdate;
end;
end;
end;

procedure TfmInsideFormatting.lvCoTypes_Update;
var
  I: integer;
  CoTypesList: TList;
  IconBitmap,TempBMP: TBitmap;
  MS: TMemoryStream;
begin
with cbCoTypes do begin
Clear;
cbCoTypes_ImageList.Clear;
Items.BeginUpdate;
try
with TTCoComponentTypeFunctionality.Create do
try
GetInstanceList(CoTypesList);
try
for I:=0 to CoTypesList.Count-1 do begin
  try
  with ItemsEx.Add do
  with TCoComponentTypeFunctionality(TComponentFunctionality_Create(Integer(CoTypesList[I]))) do
  try
  Data:=Pointer(idObj);
  Caption:=Name;
  if GetIconImage(IconBitmap)
   then
    try
    TempBMP:=TBitmap.Create;
    try
    MS:=TMemoryStream.Create;
    try
    IconBitmap.SaveToStream(MS); MS.Position:=0;
    TempBMP.LoadFromStream(MS);
    finally
    MS.Destroy;
    end;
    ImageIndex:=cbCoTypes_ImageList.Add(TempBMP,nil);
    finally
    TempBMP.Destroy;
    end;
    finally
    IconBitmap.Destroy;
    end
   else with TTCoComponentFunctionality.Create do
    try
    ImageIndex:=ImageList_Index;
    finally
    Release;
    end;
  finally
  Release;
  end;
  except
    end;
  end;
finally
CoTypesList.Destroy;
end;
finally
Release;
end;
finally
Items.EndUpdate;
end;
end;
end;

procedure TfmInsideFormatting.lvResult_Clear;
var
  I: integer;
  ptrDestroyItem: pointer;
begin
with lvResult do begin
for I:=0 to Items.Count-1 do begin
  ptrDestroyItem:=Items[I].Data;
  Items[I].Data:=nil;
  FreeMem(ptrDestroyItem,SizeOf(TItemComponentsList));
  end;
Clear;
end;
end;

procedure TfmInsideFormatting.FormatByObj(const ptrObject: TPtr; const FindTypeID: integer; const flBuiltInType: boolean; const flScaling: boolean; const ScalingSpaceFactor: Extended);
begin
end;

procedure TfmInsideFormatting.lvResultDblClick(Sender: TObject);
var
  ptrObject: TPtr;
  idTOwner,idOwner: integer;
begin
if lvResult.Selected = nil then Exit; //. ->
with TItemComponentsList(lvResult.Selected.Data^),TComponentFunctionality_Create(idTComponent,idComponent) do
try
with TAbstractSpaceObjPanelProps(TPanelProps_Create(false, 0,nil,nilObject)) do begin
Left:=Round((Screen.Width-Width)/2);
Top:=Screen.Height-Height-20;
OnKeyDown:=Self.OnKeyDown;
OnKeyUp:=Self.OnKeyUp;
Show;
end;
finally
Release;
end;
end;

procedure TfmInsideFormatting.sbStartStopClick(Sender: TObject);
var
  FindTypeID: integer;
  ptrObj: TPtr;
begin
if NOT flInProgress
 then begin
  ptrObj:=ObjFunctionality.Ptr;
  if rbByType.Checked
   then
    if cbTypes.ItemIndex <> -1
     then FindTypeID:=Integer(cbTypes.ItemsEx[cbTypes.ItemIndex].Data)
     else FindTypeID:=0
   else
    if cbCoTypes.ItemIndex <> -1
     then FindTypeID:=Integer(cbCoTypes.ItemsEx[cbCoTypes.ItemIndex].Data)
     else FindTypeID:=0;
  if cbScaling.Checked
   then FormatByObj(ptrObj,FindTypeID,rbByType.Checked,true,StrToFloat(edScalingAlignFactor.Text))
   else FormatByObj(ptrObj,FindTypeID,rbByType.Checked,false,0);
  end
 else
  flProgressCancelled:=true;
end;

procedure TfmInsideFormatting.rbByTypeClick(Sender: TObject);
begin
if rbByType.Checked
 then begin
  cbTypes.Enabled:=true;
  cbCoTypes.Enabled:=false;
  end;
end;

procedure TfmInsideFormatting.rbByCoTypeClick(Sender: TObject);
begin
if rbByCoType.Checked
 then begin
  cbTypes.Enabled:=false;
  cbCoTypes.Enabled:=true;
  end;
end;

procedure TfmInsideFormatting.cbScalingClick(Sender: TObject);
begin
edScalingAlignFactor.Enabled:=cbScaling.Checked;
end;

end.
