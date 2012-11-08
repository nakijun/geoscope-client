unit unitGeoGraphServerObjectPanelProps;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unitProxySpace, unitReflector, unitObjectReflectingCfg, Functionality, TypesDefines, TypesFunctionality, unitGEOGraphServerController,
  Db, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, SpaceObjInterpretation,
  ComCtrls, unitObjectModel, Menus;

type
  TGeoGraphServerObjectPanelProps = class(TSpaceObjPanelProps)
    Bevel: TBevel;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    edObjectID: TEdit;
    cbGeoGraphServer: TComboBox;
    gbServerObjectProps: TGroupBox;
    pnlServerObjectProps: TPanel;
    stServerObjectIsNotSet: TStaticText;
    Label5: TLabel;
    sbServerObjectPropsAccept: TSpeedButton;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edBusinessType: TEdit;
    edComponentID: TEdit;
    edObjectName: TEdit;
    edObjectType: TEdit;
    PageControl1: TPageControl;
    tsObjectModel: TTabSheet;
    TabSheet2: TTabSheet;
    Panel2: TPanel;
    reConsole: TRichEdit;
    GroupBox2: TGroupBox;
    Label11: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    cbOperations: TComboBox;
    edObjectCommandToExecute: TEdit;
    edDeviceCommandToExecute: TEdit;
    lbNoObjectModel: TLabel;
    Label13: TLabel;
    edBusinessModelID: TEdit;
    Bevel1: TBevel;
    Bevel2: TBevel;
    PopupMenu: TPopupMenu;
    Shownearestmapobjects1: TMenuItem;
    ConstructURL1: TMenuItem;
    spacewindowimage1: TMenuItem;
    nearestmapobjectstext1: TMenuItem;
    spacewindowimagepageconstructor1: TMenuItem;
    procedure edObjectIDKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbGeoGraphServerChange(Sender: TObject);
    procedure sbServerObjectPropsAcceptClick(Sender: TObject);
    procedure edCommandToExecuteKeyPress(Sender: TObject; var Key: Char);
    procedure cbOperationsChange(Sender: TObject);
    procedure edObjectCommandToExecuteKeyPress(Sender: TObject;
      var Key: Char);
    procedure edDeviceCommandToExecuteKeyPress(Sender: TObject;
      var Key: Char);
    procedure edBusinessModelIDKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Shownearestmapobjects1Click(Sender: TObject);
    procedure spacewindowimage1Click(Sender: TObject);
    procedure nearestmapobjectstext1Click(Sender: TObject);
    procedure spacewindowimagepageconstructor1Click(Sender: TObject);
  private
    _GeoGraphServerID: integer;
    _ObjectID: integer;
    _BusinessModelID: integer;
    ServerObjectController: TGEOGraphServerObjectController;
    ObjectModel: TObjectModel;
    GeographServerObjectSpaceViewWebPageConstructor: TForm;

    { Private declarations }
    procedure ServerObjectProps_Update;
    procedure reConsole_WriteInfoMessage(const S: string);
    procedure reConsole_WriteCommandPrompt(const S: string);
    procedure reConsole_WriteSuccessResult(const S: string);
    procedure reConsole_WriteErrorResult(const S: string);
    procedure ExecuteObjectCommand(const InStr: string; out OutStr: string);
    procedure ExecuteDeviceCommand(const InStr: string; out OutStr: string);
    procedure DisableControls;
    procedure Controls_ClearPropData; override;
  public
    { Public declarations }
    Constructor Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr); override;
    destructor Destroy; override;
    procedure _Update; override;
    function ConstructGetSpaceWindowImageURL(): string;
    procedure ConstructGetNearestMapFormatObjectsTextURL();
    procedure ConstructGetVisualizationPositionURL();
  end;

implementation
uses
  ShellAPI,
  ClipBrd,
  Cipher,
  GlobalSpaceDefines,
  GeoTransformations,
  unitSetCheckpointIntervalPanel,
  unitSetGeoDistanceThresholdPanel,
  unitGetDayLogDataPanel,
  unitGeographServerObjectNearestMapFormatObjectsPanel,
  unitGeographServerObjectSpaceViewWebPageConstructor;

{$R *.DFM}


Constructor TGeoGraphServerObjectPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
var
  IL: TList;
  I: integer;
begin
Inherited Create(pObjFunctionality, pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
//.
with TTGeoGraphServerFunctionality.Create do
try
GetInstanceList(IL);
try
cbGeoGraphServer.Items.BeginUpdate;
try
cbGeoGraphServer.Items.Clear;
for I:=0 to IL.Count-1 do with TGeoGraphServerFunctionality(TComponentFunctionality_Create(Integer(IL[I]))) do
  try
  cbGeoGraphServer.Items.AddObject(Name+' ('+IntToStr(idObj)+')',Pointer(idObj));
  finally
  Release;
  end;
finally
cbGeoGraphServer.Items.EndUpdate;
end;
finally
IL.Destroy;
end;
finally
Release;
end;
//.
_GeoGraphServerID:=0;
_ObjectID:=0;
_BusinessModelID:=0;
ServerObjectController:=nil;
ObjectModel:=nil;
//.
Update;
end;

destructor TGeoGraphServerObjectPanelProps.Destroy;
begin
GeographServerObjectSpaceViewWebPageConstructor.Free;
ObjectModel.Free;
ServerObjectController.Free;
Inherited;
end;

procedure TGeoGraphServerObjectPanelProps._Update;
var
  I: integer;
  _OldObjectID: integer;
begin
Inherited;
_OldObjectID:=_ObjectID;
with TGeoGraphServerObjectFunctionality(ObjFunctionality) do begin
_GeoGraphServerID:=GeoGraphServerID;
_ObjectID:=ObjectID;
_BusinessModelID:=BusinessModelID;
cbGeoGraphServer.ItemIndex:=-1;
for I:=0 to cbGeoGraphServer.Items.Count-1 do
  if (Integer(cbGeoGraphServer.Items.Objects[I]) = _GeoGraphServerID)
   then begin
    cbGeoGraphServer.ItemIndex:=I;
    Break; //. >
    end;
edObjectID.Text:=IntToStr(_ObjectID);
edBusinessModelID.Text:=IntToStr(_BusinessModelID);
//.
if (_ObjectID <> _OldObjectID)
 then begin
  if ((_GeoGraphServerID <> 0) AND (_ObjectID <> 0))
   then begin
    ServerObjectProps_Update;
    stServerObjectIsNotSet.Hide;
    gbServerObjectProps.Show;
    end
   else begin
    gbServerObjectProps.Hide;
    stServerObjectIsNotSet.Show;
    end;
  _OldObjectID:=_ObjectID;
  end;
end;
end;

procedure TGeoGraphServerObjectPanelProps.ServerObjectProps_Update;
var
  ObjectName: string;
  ObjectType: integer;
  BusinessType: integer;
  GeoSpaceID: integer;
  ComponentID: integer;
  idVisualization: integer;
  idHint: integer;
  CP: TForm;
begin
ObjectType:=0;
with TGeoGraphServerFunctionality(TComponentFunctionality_Create(idTGeographServer,_GeoGraphServerID)) do
try
try
Object_GetProperties(_ObjectID, ObjectName,ObjectType,BusinessType,ComponentID);
edObjectName.Text:=ObjectName;
edObjectType.Text:=IntToStr(ObjectType);
edBusinessType.Text:=IntToStr(BusinessType);
edComponentID.Text:=IntToStr(ComponentID);
pnlServerObjectProps.Visible:=true;
except
  edObjectName.Text:='';
  edObjectType.Text:='';
  edBusinessType.Text:='';
  edComponentID.Text:='';
  pnlServerObjectProps.Visible:=false;
  end;
finally
Release;
end;
FreeAndNil(ObjectModel);
FreeAndNil(ServerObjectController);
ServerObjectController:=TGEOGraphServerObjectController.Create(ObjFunctionality.idObj,_ObjectID,ObjFunctionality.Space.UserID,ObjFunctionality.Space.UserName,ObjFunctionality.Space.UserPassword,'',0,false);
ObjectModel:=TObjectModel.GetModel(ObjectType,ServerObjectController);
if (ObjectModel <> nil)
 then begin
  lbNoObjectModel.Hide;
  CP:=ObjectModel.GetControlPanel();
  CP.Align:=alClient;
  CP.Parent:=tsObjectModel;
  CP.Show();
  end
 else lbNoObjectModel.Show;
end;

procedure TGeoGraphServerObjectPanelProps.reConsole_WriteInfoMessage(const S: string);
begin
reConsole.SelStart:=reConsole.GetTextLen();
reConsole.SelAttributes.Color:=clSilver;
reConsole.Lines.Add(S);
reConsole.Perform(EM_SCROLL,SB_LINEDOWN,0);
reConsole.Update;
end;

procedure TGeoGraphServerObjectPanelProps.reConsole_WriteCommandPrompt(const S: string);
begin
reConsole.SelStart:=reConsole.GetTextLen();
reConsole.SelAttributes.Color:=clYellow;
reConsole.Lines.Add(S);
reConsole.Perform(EM_SCROLL,SB_LINEDOWN,0);
reConsole.Update;
end;

procedure TGeoGraphServerObjectPanelProps.reConsole_WriteSuccessResult(const S: string);
begin
reConsole.SelStart:=reConsole.GetTextLen();
reConsole.SelAttributes.Color:=clLime;
reConsole.Lines.Add(S);
reConsole.Perform(EM_SCROLL,SB_LINEDOWN,0);
reConsole.Update;
end;

procedure TGeoGraphServerObjectPanelProps.reConsole_WriteErrorResult(const S: string);
begin
reConsole.SelStart:=reConsole.GetTextLen();
reConsole.SelAttributes.Color:=clRed;
reConsole.Lines.Add(S);
reConsole.Perform(EM_SCROLL,SB_LINEDOWN,0);
reConsole.Update;
end;

procedure SplitStringIntoArray(const S: string; out SL: TStringList);
var
  I: integer;
  Item: string;
begin
SL:=TStringList.Create;
I:=1;
Item:='';
while (I <= Length(S)) do begin
  if (S[I] = ' ')
   then begin
    if (Item <> '')
     then begin
      SL.Add(Item);
      Item:='';
      end;
    end
   else Item:=Item+S[I];
  Inc(I);
  end;
if (Item <> '') then SL.Add(Item);
end;

procedure TGeoGraphServerObjectPanelProps.ExecuteObjectCommand(const InStr: string; out OutStr: string);
var
  SL: TStringList;
begin
SplitStringIntoArray(InStr, SL);
if (SL.Count < 2) then Raise Exception.Create('wrong command format'); //. =>
if (AnsiUpperCase(SL[0]) = 'SET')
 then begin
  if (SL.Count < 3) then Raise Exception.Create('wrong SET command format'); //. =>
  ServerObjectController.ObjectOperation_SetComponentDataCommand1(SL[1], SL[2]);
  OutStr:='done.';
  end
 else
  if (AnsiUpperCase(SL[0]) = 'GET')
   then begin
    ServerObjectController.ObjectOperation_GetComponentDataCommand1(SL[1], OutStr);
    end
   else
    if (AnsiUpperCase(SL[0]) = 'BSET')
     then begin
      if (SL.Count < 3) then Raise Exception.Create('wrong SET command format'); //. =>
      ServerObjectController.ObjectOperation_BatchSetComponentDataCommand1(SL[1], SL[2]);
      OutStr:='done.';
      end
     else Raise Exception.Create('unknown command is found: '+SL[0]); //. =>
end;

procedure TGeoGraphServerObjectPanelProps.ExecuteDeviceCommand(const InStr: string; out OutStr: string);
var
  SL: TStringList;
begin
SplitStringIntoArray(InStr, SL);
if (SL.Count < 2) then Raise Exception.Create('wrong command format'); //. =>
if (AnsiUpperCase(SL[0]) = 'SET')
 then begin
  if (SL.Count < 3) then Raise Exception.Create('wrong SET command format'); //. =>
  ServerObjectController.DeviceOperation_SetComponentDataCommand1(SL[1], SL[2]);
  OutStr:='done.';
  end
 else
  if (AnsiUpperCase(SL[0]) = 'GET')
   then begin
    ServerObjectController.DeviceOperation_GetComponentDataCommand1(SL[1], OutStr);
    end
   else Raise Exception.Create('unknown command is found: '+SL[0]); //. =>
end;

procedure CopyStringToClipboard(s: string); 
var
 hClipbrd: THandle;
 hg: THandle;
 P: PChar; 
begin
Clipboard.Open;
try
Clipboard.AsText:=s;
hClipbrd:=Clipboard.GetAsHandle(CF_TEXT);
if (hClipbrd = INVALID_HANDLE_VALUE) then Raise Exception.Create('could not insert a string into clipboard'); //. =>
SetClipboardData(CF_LOCALE,hClipbrd);
finally
Clipboard.Close;
end;
end;

procedure EncryptBuf(const Key: string; const BufferPtr: pointer; const BufferSize: integer);
begin
with TCipher_RC5.Create do
try
Mode:=cmCTS;
InitKey(Key, nil);
EncodeBuffer(BufferPtr^,BufferPtr^,BufferSize);
finally
Destroy;
end;
end;

function EncodeString(const Source: string): string;
var
  I: integer;
  S: string[2];
begin
SetLength(Result,Length(Source) SHL 1);
for I:=0 to Length(Source)-1 do begin
  S:=IntToHex(Ord(Source[I+1]),2);
  Result[(I SHL 1)+1]:=S[1];
  Result[(I SHL 1)+1+1]:=S[2];
  end;
end;

function TGeoGraphServerObjectPanelProps.ConstructGetSpaceWindowImageURL(): string;
var
  Reflector: TReflector;
  RW: TReflectionWindowStrucEx;
  VisibleFactor: integer;
  DynamicHintVisibility: double;
  InvisibleLayNumbersArray: TByteArray;
  InvisibleLaysCount: Word;
  InvisibleLayNumber: Word;
  URL,URL1,URL2: string;
  Idx: integer;
  BuffPtr: pointer;
  BuffSize: integer;
  I: integer;
begin
if (TTypesSystem(ObjFunctionality.Space.TypesSystem).Reflector = nil) then Raise Exception.Create('there is no default Reflector'); //. =>
Reflector:=(TTypesSystem(ObjFunctionality.Space.TypesSystem).Reflector as TReflector);
//.
Reflector.ReflectionWindow.GetWindow(true,{out} RW);
VisibleFactor:=Reflector.ReflectionWindow.VisibleFactor;
DynamicHintVisibility:=Reflector.DynamicHints.VisibleFactor;
InvisibleLayNumbersArray:=TObjectReflectingCfg(Reflector.Reflecting.ObjectConfiguration).HidedLays.GetLayNumbersArray();
//.
URL1:=ObjFunctionality.Space.SOAPServerURL;
Idx:=Pos('SPACESOAPSERVER.DLL',ANSIUpperCase(URL1));
if (Idx = -1) then Raise Exception.Create('SOAPServerURL has a wrong format'); //. =>
SetLength(URL1,Idx-1);
//. add command path
URL1:=URL1+'Space'+'/'+'1'{URLProtocolVersion}+'/'+IntToStr(ObjFunctionality.Space.UserID);
URL2:='TypesSystem'+'/'+IntToStr(ObjFunctionality.idTObj)+'/'+'Co'+'/'+IntToStr(ObjFunctionality.idObj)+'/'+'SpaceWindow.jpg';
//. add command parameters
URL2:=URL2+'?'+'1'{command version}+','+FloatToStr(RW.X0)+','+FloatToStr(RW.Y0)+','+FloatToStr(RW.X1)+','+FloatToStr(RW.Y1)+','+FloatToStr(RW.X2)+','+FloatToStr(RW.Y2)+','+FloatToStr(RW.X3)+','+FloatToStr(RW.Y3)+',';
InvisibleLaysCount:=Word(Pointer(@InvisibleLayNumbersArray[0])^);
URL2:=URL2+IntToStr(InvisibleLaysCount)+',';
for I:=0 to InvisibleLaysCount-1 do begin
  InvisibleLayNumber:=Word(Pointer(@InvisibleLayNumbersArray[2{SizeOf(LaysCount)}+I*SizeOf(InvisibleLayNumber)])^);
  URL2:=URL2+IntToStr(InvisibleLayNumber)+',';
  end;
URL2:=URL2+FloatToStr(VisibleFactor)+',';
URL2:=URL2+FloatToStr(DynamicHintVisibility)+',';
URL2:=URL2+IntToStr(RW.Xmn)+','+IntToStr(RW.Ymn)+','+IntToStr(RW.Xmx)+','+IntToStr(RW.Ymx);
//.
EncryptBuf(ObjFunctionality.Space.UserPasswordHash,Pointer(@URL2[1]),Length(URL2));
URL2:=EncodeString(URL2);
//.
URL:=URL1+'/'+URL2+'.jpg';
//.
Result:=URL;
end;

procedure TGeoGraphServerObjectPanelProps.ConstructGetNearestMapFormatObjectsTextURL();
var
  URL,URL1,URL2: string;
  Idx: integer;
begin
URL1:=ObjFunctionality.Space.SOAPServerURL;
Idx:=Pos('SPACESOAPSERVER.DLL',ANSIUpperCase(URL1));
if (Idx = -1) then Raise Exception.Create('SOAPServerURL has a wrong format'); //. =>
SetLength(URL1,Idx-1);
//. add command path
URL1:=URL1+'Space'+'/'+'1'{URLProtocolVersion}+'/'+IntToStr(ObjFunctionality.Space.UserID);
URL2:='TypesSystem'+'/'+IntToStr(ObjFunctionality.idTObj)+'/'+'Co'+'/'+IntToStr(ObjFunctionality.idObj)+'/'+'NearestMapFormatObjectsNames.txt';
//. add command parameters
URL2:=URL2+'?'+'1'{command version};
//.
EncryptBuf(ObjFunctionality.Space.UserPasswordHash,Pointer(@URL2[1]),Length(URL2));
URL2:=EncodeString(URL2);
//.
URL:=URL1+'/'+URL2+'.txt';
//.
CopyStringToClipboard(URL);
//.
ShowMessage('Constructed URL has been copied into the clipboard'); //. =>
end;

procedure TGeoGraphServerObjectPanelProps.ConstructGetVisualizationPositionURL();
var
  URL,URL1,URL2: string;
  Idx: integer;
begin
URL1:=ObjFunctionality.Space.SOAPServerURL;
Idx:=Pos('SPACESOAPSERVER.DLL',ANSIUpperCase(URL1));
if (Idx = -1) then Raise Exception.Create('SOAPServerURL has a wrong format'); //. =>
SetLength(URL1,Idx-1);
//. add command path
URL1:=URL1+'Space'+'/'+'1'{URLProtocolVersion}+'/'+IntToStr(ObjFunctionality.Space.UserID);
URL2:='TypesSystem'+'/'+IntToStr(ObjFunctionality.idTObj)+'/'+'Co'+'/'+IntToStr(ObjFunctionality.idObj)+'/'+'Data.dat';
//. add command parameters
URL2:=URL2+'?'+'1'{command version};
//.
EncryptBuf(ObjFunctionality.Space.UserPasswordHash,Pointer(@URL2[1]),Length(URL2));
URL2:=EncodeString(URL2);
//.
URL:=URL1+'/'+URL2+'.dat';
//.
CopyStringToClipboard(URL);
//.
ShowMessage('Constructed URL has been copied into the clipboard'); //. =>
end;


procedure TGeoGraphServerObjectPanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TGeoGraphServerObjectPanelProps.cbGeoGraphServerChange(Sender: TObject);
begin
TGeoGraphServerObjectFunctionality(ObjFunctionality).GeoGraphServerID:=Integer(cbGeoGraphServer.Items.Objects[cbGeoGraphServer.ItemIndex]);
end;

procedure TGeoGraphServerObjectPanelProps.edObjectIDKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
case Key of
VK_RETURN: TGeoGraphServerObjectFunctionality(ObjFunctionality).ObjectID:=StrToInt(edObjectID.Text);
end;
end;

procedure TGeoGraphServerObjectPanelProps.edBusinessModelIDKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
case Key of
VK_RETURN: TGeoGraphServerObjectFunctionality(ObjFunctionality).BusinessModelID:=StrToInt(edBusinessModelID.Text);
end;
end;

procedure TGeoGraphServerObjectPanelProps.Controls_ClearPropData;
begin
cbGeoGraphServer.ItemIndex:=-1;
edObjectID.Text:='';
edBusinessModelID.Text:='';
end;

procedure TGeoGraphServerObjectPanelProps.sbServerObjectPropsAcceptClick(Sender: TObject);
var
  ObjectName: string;
  ObjectType: integer;
  BusinessType: integer;
  ComponentID: integer;
begin
ObjectName:=edObjectName.Text;
ObjectType:=StrToInt(edObjectType.Text);
BusinessType:=StrToInt(edBusinessType.Text);
ComponentID:=StrToInt(edComponentID.Text);
//. set properties
with TGeoGraphServerFunctionality(TComponentFunctionality_Create(idTGeographServer,_GeoGraphServerID)) do
try
Object_SetProperties(_ObjectID, ObjectName,ObjectType,BusinessType,ComponentID);
finally
Release;
end;
ShowMessage('Data has been saved');
end;

procedure TGeoGraphServerObjectPanelProps.edCommandToExecuteKeyPress(Sender: TObject; var Key: Char);
var
  InStr: string;
  OutStr: string;
begin
if (Key = #$0D)
 then
  try
  InStr:=edObjectCommandToExecute.Text;
  reConsole_WriteCommandPrompt('> '+InStr);
  try
  ExecuteObjectCommand(InStr, OutStr);
  reConsole_WriteSuccessResult('> '+OutStr);
  except
    on E: Exception do begin
      reConsole_WriteErrorResult('CONNECTION ERROR: '+E.Message);
      end;
    end;
  finally
  edObjectCommandToExecute.SelectAll;
  end;
end;

procedure TGeoGraphServerObjectPanelProps.cbOperationsChange(Sender: TObject);
var
  R: boolean;
  NewCheckpointInterval: smallint;
  NewGeoDistanceThreshold: smallint;
  LogDate: TDateTime;
  LogDataType: word;
  RC: integer;
  LastCheckpointTime: TDateTime;
  CheckpointInterval: smallint;
  LF: string;
  MS: TMemoryStream;
  ObjectData: TGeographUserObjectDataV0;
begin
try
case cbOperations.ItemIndex of
0: begin //. Object operation: set checkpoint interval
  with TfmSetCheckpointIntervalPanel.Create() do
  try
  R:=Accept(NewCheckpointInterval);
  finally
  Destroy;
  end;
  if (R)
   then begin
    try
    reConsole_WriteCommandPrompt('> [OID: '+IntToStr(_ObjectID)+']  SetCheckpointInterval (NewCheckpointInterval = '+IntToStr(NewCheckpointInterval)+')');
    //.
    RC:=ServerObjectController.ObjectOperation_SetCheckpointInterval(NewCheckpointInterval);
    //.
    reConsole_WriteSuccessResult('> OK');
    except
      on E: OperationException do begin
        reConsole_WriteErrorResult('> ERROR'+IntToStr(E.Code)+': '+E.Message);
        end;
      on E: Exception do begin
        reConsole_WriteErrorResult('CONNECTION ERROR: '+E.Message);
        end;
      end;
    end;
  end;
1: begin //. Object operation: set geo-distance threshold
  with TfmSetGeoDistanceThresholdPanel.Create() do
  try
  R:=Accept(NewGeoDistanceThreshold);
  finally
  Destroy;
  end;
  if (R)
   then begin
    try
    reConsole_WriteCommandPrompt('> [OID: '+IntToStr(_ObjectID)+']  SetGeoDistanceThreshold (NewDistance = '+IntToStr(NewGeoDistanceThreshold)+')');
    //.
    RC:=ServerObjectController.ObjectOperation_SetGeoDistanceThreshold(NewGeoDistanceThreshold);
    //.
    reConsole_WriteSuccessResult('> OK');
    except
      on E: OperationException do begin
        reConsole_WriteErrorResult('> ERROR'+IntToStr(E.Code)+': '+E.Message);
        end;
      on E: Exception do begin
        reConsole_WriteErrorResult('CONNECTION ERROR: '+E.Message);
        end;
      end;
    end;
  end;
2: begin //. Object operation: get checkpoint
  try
  reConsole_WriteCommandPrompt('> [OID: '+IntToStr(_ObjectID)+'] GetCheckpoint()');
  //.
  RC:=ServerObjectController.ObjectOperation_GetCheckpoint(LastCheckpointTime,CheckpointInterval);
  reConsole_WriteSuccessResult('> LastCheckpointTime: '+FormatDateTime('DD/MM/YY HH:NN:SS',LastCheckpointTime));
  reConsole_WriteSuccessResult('> CheckpointInterval: '+IntToStr(CheckpointInterval));
  if (LastCheckpointTime <> 0.0)
   then
    if ((Now-LastCheckpointTime) <= (CheckpointInterval/(3600.0*24.0)))
     then reConsole_WriteSuccessResult('> Object is online')
     else reConsole_WriteSuccessResult('> Object is offline')
   else reConsole_WriteSuccessResult('> Server is started recently');
  //.
  reConsole_WriteSuccessResult('> OK');
  except
    on E: OperationException do begin
      reConsole_WriteErrorResult('> ERROR'+IntToStr(E.Code)+': '+E.Message);
      end;
    on E: Exception do begin
      reConsole_WriteErrorResult('CONNECTION ERROR: '+E.Message);
      end;
    end;
  end;
3: begin //. Object operation: GetData
  try
  reConsole_WriteCommandPrompt('> [OID: '+IntToStr(_ObjectID)+'] GetData(Version = 0)');
  //.
  RC:=ServerObjectController.ObjectOperation_GetData(0{Version}, ObjectData);
  reConsole_WriteSuccessResult('> ID: '+IntToStr(ObjectData.ID));
  reConsole_WriteSuccessResult('> Name: '+ObjectData.ObjectName);
  reConsole_WriteSuccessResult('> ObjectType: '+IntToStr(ObjectData.ObjectType));
  reConsole_WriteSuccessResult('> ObjectDatumID: '+IntToStr(ObjectData.ObjectDatumID));
  reConsole_WriteSuccessResult('> ObjectGeoSpaceID: '+IntToStr(ObjectData.GeoSpaceID));
  reConsole_WriteSuccessResult('> VisualizationType: '+IntToStr(ObjectData.idTVisualization));
  reConsole_WriteSuccessResult('> VisualizationID: '+IntToStr(ObjectData.idVisualization));
  reConsole_WriteSuccessResult('> HintID: '+IntToStr(ObjectData.idHint));
  reConsole_WriteSuccessResult('> CheckpointInterval: '+IntToStr(ObjectData.CheckpointInterval));
  reConsole_WriteSuccessResult('> LastCheckpointTime: '+FormatDateTime('DD/MM/YY HH:NN:SS',ObjectData.LastCheckpointTime));
  reConsole_WriteSuccessResult('> GeoDistanceThreshold: '+IntToStr(ObjectData.GeoDistanceThreshold));
  //.
  reConsole_WriteSuccessResult('> OK');
  except
    on E: OperationException do begin
      reConsole_WriteErrorResult('> ERROR'+IntToStr(E.Code)+': '+E.Message);
      end;
    on E: Exception do begin
      reConsole_WriteErrorResult('CONNECTION ERROR: '+E.Message);
      end;
    end;
  end;
4: begin //. Object operation: GetDatLog
  with TfmGetDayLogDataPanel.Create() do
  try
  R:=Accept(LogDate,LogDataType);
  finally
  Destroy;
  end;
  if (R)
   then begin
    try
    reConsole_WriteCommandPrompt('> [OID: '+IntToStr(_ObjectID)+'] GetDayLogData(DayDate = '+FormatDateTime('DD/MM/YY',LogDate)+', DataType = '+IntToStr(LogDataType)+')');
    //.
    RC:=ServerObjectController.ObjectOperation_GetDayLogData(LogDate,LogDataType, MS);
    try
    case LogDataType of
    0: begin //. XML
      LF:=ExtractFileDir(Application.ExeName)+'\'+PathTempData+'\Object'+IntToStr(_ObjectID)+'_'+FormatDateTime('DDMMYY',LogDate)+'.log';
      MS.SaveToFile(LF);
      ShowMessage('Object day log has been saved into a file: '+LF);
      end;
    3: begin {PlainTextRU format}
      LF:=ExtractFileDir(Application.ExeName)+'\'+PathTempData+'\DATA'+FormatDateTime('DDMMYYYYHHNNSSZZZ',Now)+'.log';
      MS.SaveToFile(LF);
      ShellExecute(0,nil,PChar(LF),nil,nil, 1);
      end;
    end;
    finally
    MS.Destroy;
    end;
    //.
    reConsole_WriteSuccessResult('> OK');
    except
      on E: OperationException do begin
        reConsole_WriteErrorResult('> ERROR'+IntToStr(E.Code)+': '+E.Message);
        end;
      on E: Exception do begin
        reConsole_WriteErrorResult('CONNECTION ERROR: '+E.Message);
        end;
      end;
    end;
  end;
end;
finally
cbOperations.ItemIndex:=-1;
end;
end;

procedure TGeoGraphServerObjectPanelProps.edObjectCommandToExecuteKeyPress(Sender: TObject; var Key: Char);
var
  InStr: string;
  OutStr: string;
begin
if (Key = #$0D)
 then
  try
  InStr:=edObjectCommandToExecute.Text;
  reConsole_WriteCommandPrompt('> '+InStr);
  try
  ExecuteObjectCommand(InStr, OutStr);
  reConsole_WriteSuccessResult('OBJECT> '+OutStr);
  except
    on E: Exception do begin
      reConsole_WriteErrorResult('CONNECTION ERROR: '+E.Message);
      end;
    end;
  finally
  edObjectCommandToExecute.SelectAll;
  end;
end;

procedure TGeoGraphServerObjectPanelProps.edDeviceCommandToExecuteKeyPress(Sender: TObject; var Key: Char);
var
  InStr: string;
  OutStr: string;
begin
if (Key = #$0D)
 then
  try
  InStr:=edDeviceCommandToExecute.Text;
  reConsole_WriteCommandPrompt('DEVICE> '+InStr);
  try
  ExecuteDeviceCommand(InStr, OutStr);
  reConsole_WriteSuccessResult('> '+OutStr);
  except
    on E: Exception do begin
      reConsole_WriteErrorResult('CONNECTION ERROR: '+E.Message);
      end;
    end;
  finally
  edDeviceCommandToExecute.SelectAll;
  end;
end;

procedure TGeoGraphServerObjectPanelProps.Shownearestmapobjects1Click(Sender: TObject);
begin 
with TfmGeographServerObjectNearestMapFormatObjectsPanel.Create(ObjFunctionality.idObj) do Show();
end;


procedure TGeoGraphServerObjectPanelProps.spacewindowimagepageconstructor1Click(Sender: TObject);
begin
if (GeographServerObjectSpaceViewWebPageConstructor = nil) then GeographServerObjectSpaceViewWebPageConstructor:=TfmGeographServerObjectSpaceViewWebPageConstructor.Create(Self);
GeographServerObjectSpaceViewWebPageConstructor.Show();
end;

procedure TGeoGraphServerObjectPanelProps.spacewindowimage1Click(Sender: TObject);
begin
//.
CopyStringToClipboard(ConstructGetSpaceWindowImageURL());
//.
ShowMessage('Constructed URL has been copied into the clipboard'); //. =>
end;

procedure TGeoGraphServerObjectPanelProps.nearestmapobjectstext1Click(Sender: TObject);
begin
ConstructGetNearestMapFormatObjectsTextURL();
end;


end.
