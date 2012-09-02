unit unitAddressesEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Buttons, StdCtrls, ExtCtrls;

type
  TfmAddressesEditor = class(TForm)
    Panel2: TPanel;
    Panel1: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Label1: TLabel;
    sbAddSMSAddress: TSpeedButton;
    sbRemoveSMSAddress: TSpeedButton;
    sbEditSMSAddress: TSpeedButton;
    lvSMSAddresses: TListView;
    Splitter1: TSplitter;
    Panel5: TPanel;
    Splitter2: TSplitter;
    Panel6: TPanel;
    Panel7: TPanel;
    Label2: TLabel;
    sbAddEMAILAddress: TSpeedButton;
    sbRemoveEMAILAddress: TSpeedButton;
    sbEditEMAILAddress: TSpeedButton;
    lvEMAILAddresses: TListView;
    Panel8: TPanel;
    Panel9: TPanel;
    Label3: TLabel;
    sbAddMBMAddress: TSpeedButton;
    sbRemoveMBMAddress: TSpeedButton;
    sbEditMBMAddress: TSpeedButton;
    lvMBMAddresses: TListView;
    sbSave: TSpeedButton;
    sbCancel: TSpeedButton;
    procedure sbAddSMSAddressClick(Sender: TObject);
    procedure sbRemoveSMSAddressClick(Sender: TObject);
    procedure sbEditSMSAddressClick(Sender: TObject);
    procedure sbAddEMAILAddressClick(Sender: TObject);
    procedure sbRemoveEMAILAddressClick(Sender: TObject);
    procedure sbEditEMAILAddressClick(Sender: TObject);
    procedure sbAddMBMAddressClick(Sender: TObject);
    procedure sbRemoveMBMAddressClick(Sender: TObject);
    procedure sbEditMBMAddressClick(Sender: TObject);
    procedure sbCancelClick(Sender: TObject);
    procedure sbSaveClick(Sender: TObject);
  private
    { Private declarations }
    flChanged: boolean;
    flAccepted: boolean;

    procedure ParseStringToAddresses(const S: string);
    function BuildResultString(): string;
  public
    { Public declarations }

    Constructor Create;
    function Edit(var AddressesString: string): boolean;
  end;

Type
  TEventSendMethod = (esmUnknown,esmMBM,esmEMAIL,esmSMS);
  
  TEventSendEndpoint = record
    SendMethod: TEventSendMethod;
    MessageType: integer;
    Address: shortstring;
  end;

Const
  EventSendMethods: array[TEventSendMethod] of string = ('Unknown','Internal-Mail','E-Mail','SMS');
  EventSendMethodPrefixes: array[TEventSendMethod] of string = ('UNK','MBMAIL','EMAIL','SMS');
  EventMessageTypeStrings: array[0..2] of string = ('Default','English','Русский');

implementation
Uses
  unitAddressEditor;

{$R *.dfm}


Constructor TfmAddressesEditor.Create;
begin
Inherited Create(nil);    
end;

function TfmAddressesEditor.Edit(var AddressesString: string): boolean;
begin
ParseStringToAddresses(AddressesString);
//.
flChanged:=false;
flAccepted:=false;
ShowModal();
if (flChanged AND flAccepted)
 then begin
  AddressesString:=BuildResultString();
  Result:=true;
  end
 else Result:=false;
end;

procedure TfmAddressesEditor.ParseStringToAddresses(const S: string);

  function SplitStrings(const S: string; out SL: TStringList): boolean;
  var
    SS: string;
    I: integer;
  begin
  SL:=TStringList.Create;
  try
  SS:='';
  for I:=1 to Length(S) do
    if (S[I] in [',',#$0D,#$0A])
     then begin
      if (SS <> '')
       then begin
        SL.Add(SS);
        SS:='';
        end;
      end
    else
     if (S[I] <> ' ') then SS:=SS+S[I];
  if (SS <> '')
   then begin
    SL.Add(SS);
    SS:='';
    end;
  if (SL.Count > 0)
   then Result:=true
   else begin
    FreeAndNil(SL);
    Result:=false;
    end;
  except
    FreeAndNil(SL);
    Raise; //. =>
    end;
  end;

  procedure ParseAddress(const A: string; out EventSendEndpoint: TEventSendEndpoint);
  var
    I: integer;
    SendMethodPrefix: string;
    MessageTypeStr: string;
    AddrStr: string;
    M: TEventSendMethod;
  begin
  I:=1;
  //. get SendMethodPrefix
  SendMethodPrefix:='';
  while (I <= Length(A)) do begin
    if ((A[I] = ':') OR (($30 <= Ord(A[I])) AND (Ord(A[I]) <= $39)))
     then Break //. >
     else SendMethodPrefix:=SendMethodPrefix+A[I];
    Inc(I);
    end;
  if (SendMethodPrefix = '') then Raise Exception.Create('ParseAddress: cannot get "Send Method Prefix": '+A); //. =>
  //. get MessageTypeStr
  MessageTypeStr:='';
  while (I <= Length(A)) do begin
    if (($30 <= Ord(A[I])) AND (Ord(A[I]) <= $39))
     then MessageTypeStr:=MessageTypeStr+A[I]
     else Break; //. >
    Inc(I);
    end;
  if (MessageTypeStr = '')
   then EventSendEndpoint.MessageType:=0
   else
    try
    EventSendEndpoint.MessageType:=StrToInt(MessageTypeStr);
    except
      Raise Exception.Create('ParseAddress: cannot parse Message Type string: '+MessageTypeStr); //. =>
      end;
  //. get Address string
  AddrStr:='';
  if (A[I] <> ':') then Raise Exception.Create('ParseAddress: cannot find "Address" string start: '+A); //. =>
  Inc(I);
  while (I <= Length(A)) do begin
    AddrStr:=AddrStr+A[I];
    Inc(I);
    end;
  if (AddrStr = '') then Raise Exception.Create('ParseAddress: cannot get "Address" string: '+A); //. =>
  //.
  EventSendEndpoint.SendMethod:=esmUnknown;
  for M:=Low(TEventSendMethod) to High(TEventSendMethod) do
    if (EventSendMethodPrefixes[M] = SendMethodPrefix)
     then begin
      EventSendEndpoint.SendMethod:=M;
      Break; //. >
      end;
  if (EventSendEndpoint.SendMethod = esmUnknown) then Raise Exception.Create('ParseAddress: unknown "Send Method Prefix": '+SendMethodPrefix); //. =>
  //.
  EventSendEndpoint.Address:=AddrStr;
  end;

var
  SL: TStringList;
  I: integer;
  EventSendEndpoint: TEventSendEndpoint;
begin
lvSMSAddresses.Items.BeginUpdate();
lvEMAILAddresses.Items.BeginUpdate();
try
lvSMSAddresses.Items.Clear();
lvEMAILAddresses.Items.Clear();
if (SplitStrings(S,SL))
 then
  try
  for I:=0 to SL.Count-1 do begin
    ParseAddress(SL[I], EventSendEndpoint);
    case (EventSendEndpoint.SendMethod) of
    esmSMS: with lvSMSAddresses.Items.Add do begin
      Data:=Pointer(EventSendEndpoint.MessageType);
      Caption:=EventSendEndpoint.Address;
      SubItems.Add(EventMessageTypeStrings[EventSendEndpoint.MessageType]);
      end;
    esmEMAIL: with lvEMAILAddresses.Items.Add do begin
      Data:=Pointer(EventSendEndpoint.MessageType);
      Caption:=EventSendEndpoint.Address;
      SubItems.Add(EventMessageTypeStrings[EventSendEndpoint.MessageType]);
      end;
    esmMBM: with lvMBMAddresses.Items.Add do begin
      Data:=Pointer(EventSendEndpoint.MessageType);
      Caption:=EventSendEndpoint.Address;
      SubItems.Add(EventMessageTypeStrings[EventSendEndpoint.MessageType]);
      end;
    end;
    end;
  finally
  SL.Destroy;
  end;
finally
lvEMAILAddresses.Items.EndUpdate();
lvSMSAddresses.Items.EndUpdate();
end;
end;

function TfmAddressesEditor.BuildResultString(): string;
var
  I: integer;
begin
Result:='';
for I:=0 to lvSMSAddresses.Items.Count-1 do Result:=Result+EventSendMethodPrefixes[esmSMS]+IntToStr(Integer(lvSMSAddresses.Items[I].Data))+': '+lvSMSAddresses.Items[I].Caption+',';
for I:=0 to lvEMAILAddresses.Items.Count-1 do Result:=Result+EventSendMethodPrefixes[esmEMAIL]+IntToStr(Integer(lvEMAILAddresses.Items[I].Data))+': '+lvEMAILAddresses.Items[I].Caption+',';
for I:=0 to lvMBMAddresses.Items.Count-1 do Result:=Result+EventSendMethodPrefixes[esmMBM]+IntToStr(Integer(lvMBMAddresses.Items[I].Data))+': '+lvMBMAddresses.Items[I].Caption+',';
if (Length(Result) > 0) then SetLength(Result,Length(Result)-1);
end;


procedure TfmAddressesEditor.sbAddSMSAddressClick(Sender: TObject);
var
  Address: string;
  MessageType: integer;
begin
with TfmAddressEditor.Create do
try
Address:='';
MessageType:=1; //. ENG
if (Edit(Address,MessageType))
 then with lvSMSAddresses.Items.Add do begin
  Caption:=Address;
  Data:=Pointer(MessageType);
  SubItems.Add(EventMessageTypeStrings[MessageType]);
  flChanged:=true;
  end;
finally
Destroy;
end;
end;

procedure TfmAddressesEditor.sbRemoveSMSAddressClick(Sender: TObject);
begin
if (lvSMSAddresses.Selected = nil) then Exit; //. ->
lvSMSAddresses.Selected.Delete();
flChanged:=true;
end;

procedure TfmAddressesEditor.sbEditSMSAddressClick(Sender: TObject);
var
  Address: string;
  MessageType: integer;
begin
if (lvSMSAddresses.Selected = nil) then Exit; //. ->
Address:=lvSMSAddresses.Selected.Caption;
MessageType:=Integer(lvSMSAddresses.Selected.Data);
with TfmAddressEditor.Create do
try
if (Edit(Address,MessageType))
 then begin
  lvSMSAddresses.Selected.Caption:=Address;
  lvSMSAddresses.Selected.Data:=Pointer(MessageType);
  lvSMSAddresses.Selected.SubItems[0]:=EventMessageTypeStrings[MessageType];
  flChanged:=true;
  end;
finally
Destroy;
end;
end;

procedure TfmAddressesEditor.sbAddEMAILAddressClick(Sender: TObject);
var
  Address: string;
  MessageType: integer;
begin
with TfmAddressEditor.Create do
try
Address:='';
MessageType:=1; //. ENG
if (Edit(Address,MessageType))
 then with lvEMAILAddresses.Items.Add do begin
  Caption:=Address;
  Data:=Pointer(MessageType);
  SubItems.Add(EventMessageTypeStrings[MessageType]);
  flChanged:=true;
  end;
finally
Destroy;
end;
end;

procedure TfmAddressesEditor.sbRemoveEMAILAddressClick(Sender: TObject);
begin
if (lvEMAILAddresses.Selected = nil) then Exit; //. ->
lvEMAILAddresses.Selected.Delete();
flChanged:=true;
end;

procedure TfmAddressesEditor.sbEditEMAILAddressClick(Sender: TObject);
var
  Address: string;
  MessageType: integer;
begin
if (lvEMAILAddresses.Selected = nil) then Exit; //. ->
Address:=lvEMAILAddresses.Selected.Caption;
MessageType:=Integer(lvEMAILAddresses.Selected.Data);
with TfmAddressEditor.Create do
try
if (Edit(Address,MessageType))
 then begin
  lvEMAILAddresses.Selected.Caption:=Address;
  lvEMAILAddresses.Selected.Data:=Pointer(MessageType);
  lvEMAILAddresses.Selected.SubItems[0]:=EventMessageTypeStrings[MessageType];
  flChanged:=true;
  end;
finally
Destroy;
end;
end;

procedure TfmAddressesEditor.sbAddMBMAddressClick(Sender: TObject);
var
  Address: string;
  MessageType: integer;
begin
with TfmAddressEditor.Create do
try
Address:='';
MessageType:=1; //. ENG
if (Edit(Address,MessageType))
 then with lvMBMAddresses.Items.Add do begin
  Caption:=Address;
  Data:=Pointer(MessageType);
  SubItems.Add(EventMessageTypeStrings[MessageType]);
  flChanged:=true;
  end;
finally
Destroy;
end;
end;

procedure TfmAddressesEditor.sbRemoveMBMAddressClick(Sender: TObject);
begin
if (lvMBMAddresses.Selected = nil) then Exit; //. ->
lvMBMAddresses.Selected.Delete();
flChanged:=true;
end;

procedure TfmAddressesEditor.sbEditMBMAddressClick(Sender: TObject);
var
  Address: string;
  MessageType: integer;
begin
if (lvMBMAddresses.Selected = nil) then Exit; //. ->
Address:=lvMBMAddresses.Selected.Caption;
MessageType:=Integer(lvMBMAddresses.Selected.Data);
with TfmAddressEditor.Create do
try
if (Edit(Address,MessageType))
 then begin
  lvMBMAddresses.Selected.Caption:=Address;
  lvMBMAddresses.Selected.Data:=Pointer(MessageType);
  lvMBMAddresses.Selected.SubItems[0]:=EventMessageTypeStrings[MessageType];
  flChanged:=true;
  end;
finally
Destroy;
end;
end;


procedure TfmAddressesEditor.sbCancelClick(Sender: TObject);
begin
Close();
end;

procedure TfmAddressesEditor.sbSaveClick(Sender: TObject);
begin
flAccepted:=true;
Close();
end;

end.
