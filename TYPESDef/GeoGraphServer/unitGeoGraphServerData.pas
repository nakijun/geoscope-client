unit unitGeoGraphServerData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Sockets, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Functionality, TypesFunctionality, ImgList, Menus;

type
  TfmGeoGraphServerData = class(TForm)
    tvData: TTreeView;
    ImageList: TImageList;
    tvData_PopupMenu: TPopupMenu;
    Exportanobjecttrackdayhistory1: TMenuItem;
    Editobject1: TMenuItem;
    N1: TMenuItem;
    procedure Exportanobjecttrackdayhistory1Click(Sender: TObject);
    procedure Editobject1Click(Sender: TObject);
  private
    { Private declarations }
    function DownloadObjectTrack(const ObjectID: integer; const Date: TDateTime; const flUseOwnerPassword: boolean; const UserPassword: string;  out TrackFileStream: TMemoryStream): boolean;
  public
    GeoGraphServerF: TGeoGraphServerFunctionality;
    { Public declarations }
    Constructor Create(const pGeoGraphServerF: TGeoGraphServerFunctionality);
    procedure Update; reintroduce;
  end;

implementation
uses
  ActiveX,
  MSXML,
  unitGeoGraphServerEditObjectForm,
  unitObjectTrackDownloadPanel;

{$R *.dfm}


Constructor TfmGeoGraphServerData.Create(const pGeoGraphServerF: TGeoGraphServerFunctionality);
begin
Inherited Create(nil);
GeoGraphServerF:=pGeoGraphServerF;
Update;
end;

procedure TfmGeoGraphServerData.Update;
var
  DATAStream: TMemoryStream;
  OLEStream: IStream;
  Doc: IXMLDOMDocument;
  UsersNode: IXMLDOMNode;
  UserNode: IXMLDOMNode;
  UserName: WideString;
  UserID: integer;
  UserObjectsNode: IXMLDOMNode;
  UserObjectNode: IXMLDOMNode;
  _UserNode: TTreeNode;
  Object_ID: integer;
  Object_Name: string;
  Object_Type: integer;
  Object_BusinessType: integer;
  Object_ComponentID: integer;
  _ObjectNode: TTreeNode;
  _Node: TTreeNode;
  //.
  I,J: integer;
begin
tvData.Items.BeginUpdate;
try
tvData.Items.Clear;
GeoGraphServerF.GetData(DATAStream);
try
if (DATAStream.Size > 0)
 then begin
  DATAStream.Position:=0;
  OLEStream:=TStreamAdapter.Create(DATAStream);
  Doc:=CoDomDocument.Create;
  Doc.Set_Async(false);
  Doc.Load(OLEStream);
  UsersNode:=Doc.documentElement.selectSingleNode('/Users');
  for I:=0 to UsersNode.childNodes.length-1 do begin
    //.
    UserNode:=UsersNode.childNodes[I];
    UserName:=UserNode.NodeName;
    UserID:=UserNode.selectSingleNode('ID').nodeTypedValue;
    UserObjectsNode:=UserNode.selectSingleNode('Objects');
    //.
    _UserNode:=tvData.Items.AddChild(nil,UserName);
    _UserNode.Data:=nil;
    _UserNode.ImageIndex:=0;
    _UserNode.SelectedIndex:=_UserNode.ImageIndex;
    //. transfer user objects nodes
    for J:=0 to UserObjectsNode.childNodes.length-1 do begin
      UserObjectNode:=UserObjectsNode.childNodes[J];
      Object_ID:=UserObjectNode.selectSingleNode('ID').nodeTypedValue;
      Object_Name:=UserObjectNode.NodeName+'('+IntToStr(Object_ID)+')';
      _ObjectNode:=tvData.Items.AddChild(_UserNode,Object_Name);
      _ObjectNode.Data:=Pointer(Object_ID);
      _ObjectNode.ImageIndex:=1;
      _ObjectNode.SelectedIndex:=_ObjectNode.ImageIndex;
      //.
      _Node:=tvData.Items.AddChild(_ObjectNode,'ID: '+IntToStr(Object_ID));
      _Node.Data:=nil;
      _Node.ImageIndex:=-1;
      _Node.SelectedIndex:=_Node.ImageIndex;
      if (UserObjectNode.selectSingleNode('Type') <> nil)
       then Object_Type:=UserObjectNode.selectSingleNode('Type').nodeTypedValue
       else Object_Type:=0;
      _Node:=tvData.Items.AddChild(_ObjectNode,'Type: '+IntToStr(Object_Type));
      _Node.Data:=nil;
      _Node.ImageIndex:=-1;
      _Node.SelectedIndex:=_Node.ImageIndex;
      if (UserObjectNode.selectSingleNode('BusinessType') <> nil)
       then Object_BusinessType:=UserObjectNode.selectSingleNode('BusinessType').nodeTypedValue
       else Object_BusinessType:=0;
      _Node:=tvData.Items.AddChild(_ObjectNode,'BusinessType: '+IntToStr(Object_BusinessType));
      _Node.Data:=nil;
      _Node.ImageIndex:=-1;
      _Node.SelectedIndex:=_Node.ImageIndex;
      if (UserObjectNode.selectSingleNode('ComponentID') <> nil)
       then Object_ComponentID:=UserObjectNode.selectSingleNode('ComponentID').nodeTypedValue
       else Object_ComponentID:=0;
      _Node:=tvData.Items.AddChild(_ObjectNode,'ComponentID: '+IntToStr(Object_ComponentID));
      _Node.Data:=nil;
      _Node.ImageIndex:=-1;
      _Node.SelectedIndex:=_Node.ImageIndex;
      end;
    _UserNode.Expand(false);
    end;
  end;
finally
DATAStream.Destroy;
end;
finally
tvData.Items.EndUpdate;
end;
end;

function TfmGeoGraphServerData.DownloadObjectTrack(const ObjectID: integer; const Date: TDateTime; const flUseOwnerPassword: boolean; const UserPassword: string;  out TrackFileStream: TMemoryStream): boolean;

  function ParseServerAddress(const ServerAddress: string;  out ServerIP: string; out ServerPort: string): boolean;
  var
    I: integer;
  begin
  Result:=false;
  I:=Pos(':',ServerAddress);
  if (I > 0)
   then begin
    ServerPort:=IntToStr(StrToIntDef(Copy(ServerAddress, I+1, Length(ServerAddress)-I), 0));
    ServerIP:=Copy(ServerAddress, 1, I-1);
    Result:=true;
    end;
  end;

const
  MessageBufferSize = 2+4+8+4;
  MessageBufferSize1 = 2+4+4+8+4;
var
  ServerIP: string;
  ServerPort: string;
  ServiceID: word;
  MessageBuffer: array[0..MessageBufferSize-1] of byte;
  MessageBuffer1: array[0..MessageBufferSize1-1] of byte;
  UPI,I: integer;
  CRC,V: integer;
  ServerSocket: TTcpClient;
  ActualSize,SumActualSize: integer;
  TrackBufferSize: integer;
  TrackBuffer: array of byte;
begin
Result:=false;
TrackFileStream:=nil;
//.
ParseServerAddress(GeoGraphServerF.Address, ServerIP,ServerPort);
if (flUseOwnerPassword)
 then begin
  ServiceID:=6; //. get track history ServiceID
  //. preparing message buffer
  Word(Pointer(@MessageBuffer[0])^):=ServiceID;
  Integer(Pointer(@MessageBuffer[2])^):=ObjectID;
  Double(Pointer(@MessageBuffer[6])^):=Double(Date);
  CRC:=0;
  for I:=6 to 6+8-1 do begin
    V:=Integer(MessageBuffer[I]);
    CRC:=(((CRC+V) SHL 1) XOR V);
    end;
  Integer(Pointer(@MessageBuffer[14])^):=Integer(CRC);
  UPI:=1;
  for I:=6 to 6+8+4-1 do
    if (UPI <= Length(UserPassword))
     then begin
      MessageBuffer[I]:=MessageBuffer[I]+Byte(UserPassword[UPI]);
      Inc(UPI);
      if (UPI > Length(UserPassword)) then UPI:=1;
      end;
  //.
  ServerSocket:=TTcpClient.Create(nil);
  try
  ServerSocket.RemoteHost:=ServerIP;
  ServerSocket.RemotePort:=ServerPort;
  ServerSocket.Open;
  //. send request buffer
  ActualSize:=ServerSocket.SendBuf(MessageBuffer,MessageBufferSize);
  if (ActualSize <> MessageBufferSize) then Raise Exception.Create('operation error'); //. =>
  //. read response
  ActualSize:=ServerSocket.ReceiveBuf(TrackBufferSize,SizeOf(TrackBufferSize));
  if (ActualSize <> SizeOf(TrackBufferSize)) then Raise Exception.Create('operation error'); //. =>
  SetLength(TrackBuffer,TrackBufferSize);
  if (TrackBufferSize > 0)
   then begin
    SumActualSize:=0;
    repeat
      ActualSize:=ServerSocket.ReceiveBuf(Pointer(Integer(@TrackBuffer[0])+SumActualSize)^,(TrackBufferSize-SumActualSize));
      if (ActualSize <= 0) then Raise Exception.Create('operation error'); //. =>
      Inc(SumActualSize,ActualSize);
    until (SumActualSize = TrackBufferSize);
    end
   else Exit; //. ->
  finally
  ServerSocket.Destroy;
  end;
  end
 else begin
  ServiceID:=7; //. get track history ServiceID
  //. preparing message buffer
  Word(Pointer(@MessageBuffer1[0])^):=ServiceID;
  Integer(Pointer(@MessageBuffer1[2])^):=ObjectID;
  Integer(Pointer(@MessageBuffer1[6])^):=GeoGraphServerF.Space.UserID;
  Double(Pointer(@MessageBuffer1[10])^):=Double(Date);
  CRC:=0;
  for I:=10 to 10+8-1 do begin
    V:=Integer(MessageBuffer1[I]);
    CRC:=(((CRC+V) SHL 1) XOR V);
    end;
  Integer(Pointer(@MessageBuffer1[18])^):=Integer(CRC);
  UPI:=1;
  for I:=10 to 10+8+4-1 do
    if (UPI <= Length(GeoGraphServerF.Space.UserPassword))
     then begin
      MessageBuffer1[I]:=MessageBuffer1[I]+Byte(GeoGraphServerF.Space.UserPassword[UPI]);
      Inc(UPI);
      if (UPI > Length(GeoGraphServerF.Space.UserPassword)) then UPI:=1;
      end;
  //.
  ServerSocket:=TTcpClient.Create(nil);
  try
  ServerSocket.RemoteHost:=ServerIP;
  ServerSocket.RemotePort:=ServerPort;
  ServerSocket.Open;
  //. send request buffer
  ActualSize:=ServerSocket.SendBuf(MessageBuffer1,MessageBufferSize1);
  if (ActualSize <> MessageBufferSize1) then Raise Exception.Create('operation error'); //. =>
  //. read response
  ActualSize:=ServerSocket.ReceiveBuf(TrackBufferSize,SizeOf(TrackBufferSize));
  if (ActualSize <> SizeOf(TrackBufferSize)) then Raise Exception.Create('operation error'); //. =>
  SetLength(TrackBuffer,TrackBufferSize);
  if (TrackBufferSize > 0)
   then begin
    SumActualSize:=0;
    repeat
      ActualSize:=ServerSocket.ReceiveBuf(Pointer(Integer(@TrackBuffer[0])+SumActualSize)^,(TrackBufferSize-SumActualSize));
      if (ActualSize <= 0) then Raise Exception.Create('operation error'); //. =>
      Inc(SumActualSize,ActualSize);
    until (SumActualSize = TrackBufferSize);
    end
   else Exit; //. ->
  finally
  ServerSocket.Destroy;
  end;
  end;
//. save track into a stream
TrackFileStream:=TMemoryStream.Create;
try
TrackFileStream.Write(Pointer(@TrackBuffer[0])^,TrackBufferSize);
except
  TrackFileStream.Destroy;
  Raise; //. =>
  end;
Result:=true;
end;

procedure TfmGeoGraphServerData.Exportanobjecttrackdayhistory1Click(Sender: TObject);
var
  ObjectID: integer;
  flUseOwnerPassword: boolean;
  TrackFileStream: TMemoryStream;
begin
if (NOT ((tvData.Selected <> nil) AND (tvData.Selected.Level = 1))) then Exit; //. ->
ObjectID:=Integer(tvData.Selected.Data);
with TfmObjectTrackDownload.Create(ObjectID) do
try
if (Accept(flUseOwnerPassword))
 then
  if (DownloadObjectTrack(ObjectID, MonthCalendar.Date, flUseOwnerPassword, edUserPassword.Text, TrackFileStream))
   then
    try
    TrackFileStream.SaveToFile(edDownloadFile.Text);
    ShowMessage('Object track has been saved into a file '+edDownloadFile.Text);
    finally
    TrackFileStream.Destroy;
    end
   else Raise Exception.Create('track on date specified is not found'); //. =>
finally
Destroy;
end;
end;

procedure TfmGeoGraphServerData.Editobject1Click(Sender: TObject);
var
  ObjectID: integer;
  flUseOwnerPassword: boolean;
  TrackFileStream: TMemoryStream;
begin
if (NOT ((tvData.Selected <> nil) AND (tvData.Selected.Level = 1))) then Exit; //. ->
ObjectID:=Integer(tvData.Selected.Data);
with TfmGeographServerEditObject.Create(GeoGraphServerF.Space,GeoGraphServerF.idObj,ObjectID) do
try
if (Edit())
 then Self.Update();
finally
Destroy;
end;
end;


end.
