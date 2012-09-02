unit unitGeographServerObjectSpaceViewWebPageConstructor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, OleCtrls, SHDocVw, unitGeoGraphServerObjectPanelProps;

const
  PageBody_ItemSize = 3;
type
  TfmGeographServerObjectSpaceViewWebPageConstructor = class(TForm)
    Panel1: TPanel;
    edViewURLLabel: TEdit;
    Label1: TLabel;
    cbAddViewURLLabelAsHyperlink: TCheckBox;
    btnAddViewURL: TButton;
    btnRemoveLastViewURL: TButton;
    TestWebBrowser: TWebBrowser;
    Label2: TLabel;
    edResultFileName: TEdit;
    Panel2: TPanel;
    btnTestBrowserBack: TButton;
    btnSaveResultFile: TButton;
    btnTestBrowserRefresh: TButton;
    btnTestBrowserForward: TButton;
    Button1: TButton;
    procedure btnAddViewURLClick(Sender: TObject);
    procedure btnRemoveLastViewURLClick(Sender: TObject);
    procedure btnTestBrowserBackClick(Sender: TObject);
    procedure btnSaveResultFileClick(Sender: TObject);
    procedure btnTestBrowserRefreshClick(Sender: TObject);
    procedure btnTestBrowserForwardClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    GeoGraphServerObjectPanelProps: TGeoGraphServerObjectPanelProps;
    PageBody: TStringList;
    PageBody_LastItem: integer;
    TestFileName: string;

    procedure PageBody_AddItem(const URL: string; const URLLabel: string; const flAsHyperlink: boolean);
    procedure PageBody_RemoveLastItem();
    procedure PageBody_SaveResultPageToFile(const FileName,FileFullName: string);
    procedure TestInBrowser();
  public
    { Public declarations }
    Constructor Create(const pGeoGraphServerObjectPanelProps: TGeoGraphServerObjectPanelProps);
    Destructor Destroy; override;
  end;

  
implementation
uses
  FileCtrl,
  ShellAPI,
  GlobalSpaceDefines,
  unitProxySpace,
  Functionality,
  TypesDefines,
  TypesFunctionality;

{$R *.dfm}


Constructor TfmGeographServerObjectSpaceViewWebPageConstructor.Create(const pGeoGraphServerObjectPanelProps: TGeoGraphServerObjectPanelProps);
begin
Inherited Create(nil);
GeoGraphServerObjectPanelProps:=pGeoGraphServerObjectPanelProps;
PageBody:=TStringList.Create;
PageBody_LastItem:=-PageBody_ItemSize;
TestFileName:=ExtractFilePath(ParamStr(0))+PathTempDATA+'\'+FormatDateTime('DDMMYYHHNNSS',Now)+'.html';
end;

Destructor TfmGeographServerObjectSpaceViewWebPageConstructor.Destroy;
begin
PageBody.Free();
Inherited;
end;

procedure TfmGeographServerObjectSpaceViewWebPageConstructor.PageBody_AddItem(const URL: string; const URLLabel: string; const flAsHyperlink: boolean);
begin
if (NOT flAsHyperlink)
 then begin
  PageBody.Add('<p align="left">'+URLLabel+'</p>');
  PageBody.Add('<p align="left">');
  PageBody.Add('<img border="0" src="'+URL+'"></p>');
  end
 else begin
  PageBody.Add('<p align="left">');
  PageBody.Add('<a href="'+URL+'">');
  PageBody.Add(URLLabel+'</a></p>');
  end;
Inc(PageBody_LastItem,PageBody_ItemSize);
end;

procedure TfmGeographServerObjectSpaceViewWebPageConstructor.PageBody_RemoveLastItem();
begin
if (PageBody_LastItem < 0) then Exit; //. ->
//.
PageBody.Delete(PageBody.Count-1);
PageBody.Delete(PageBody.Count-1);
PageBody.Delete(PageBody.Count-1);
Dec(PageBody_LastItem,PageBody_ItemSize);
end;

procedure TfmGeographServerObjectSpaceViewWebPageConstructor.PageBody_SaveResultPageToFile(const FileName,FileFullName: string);
var
  TF: TextFile;
  I: integer;
begin
AssignFile(TF,FileFullName); Rewrite(TF);
try
WriteLn(TF,'<html>');
WriteLn(TF,'<head>');
WriteLn(TF,'<meta http-equiv="Content-Language" content="ru">');
WriteLn(TF,'<meta name="GENERATOR" content="Geoscope">');
WriteLn(TF,'<meta name="ProgId" content="Geoscope.Editor.Document">');
WriteLn(TF,'<meta http-equiv="Content-Type" content="text/html; charset=windows-1251">');
WriteLn(TF,'<title>'+FileName+'</title>');
WriteLn(TF,'</head>');
WriteLn(TF,'<body>');
for I:=0 to PageBody.Count-1 do WriteLn(TF,PageBody[I]);
WriteLn(TF,'</body>');
WriteLn(TF,'</html>');
finally
CloseFile(TF);
end;
end;

procedure TfmGeographServerObjectSpaceViewWebPageConstructor.TestInBrowser();
var
  FullFileName: string;
begin
TestWebBrowser.Stop();
FullFileName:=TestFileName;
PageBody_SaveResultPageToFile(edResultFileName.Text,FullFileName);
TestWebBrowser.Navigate(FullFileName);
end;

procedure TfmGeographServerObjectSpaceViewWebPageConstructor.btnAddViewURLClick(Sender: TObject);
var
  URL: string;
begin
URL:=GeoGraphServerObjectPanelProps.ConstructGetSpaceWindowImageURL();
PageBody_AddItem(URL,edViewURLLabel.Text,cbAddViewURLLabelAsHyperlink.Checked);
TestInBrowser();
cbAddViewURLLabelAsHyperlink.Checked:=true;
end;

procedure TfmGeographServerObjectSpaceViewWebPageConstructor.btnRemoveLastViewURLClick(Sender: TObject);
begin
PageBody_RemoveLastItem();
if (PageBody_LastItem < 0) then cbAddViewURLLabelAsHyperlink.Checked:=false;
TestInBrowser();
end;

procedure TfmGeographServerObjectSpaceViewWebPageConstructor.btnTestBrowserRefreshClick(Sender: TObject);
begin
TestWebBrowser.Refresh2();
end;

procedure TfmGeographServerObjectSpaceViewWebPageConstructor.btnTestBrowserBackClick(Sender: TObject);
begin
TestWebBrowser.GoBack();
end;

procedure TfmGeographServerObjectSpaceViewWebPageConstructor.btnTestBrowserForwardClick(Sender: TObject);
begin
TestWebBrowser.GoForward();
end;

procedure TfmGeographServerObjectSpaceViewWebPageConstructor.btnSaveResultFileClick(Sender: TObject);
var
  Folder: string;
  FullFileName: string;
begin
if (SelectDirectory('select folder','',{ref} Folder))
 then begin
  FullFileName:=Folder+'\'+edResultFileName.Text+'.html';
  PageBody_SaveResultPageToFile(edResultFileName.Text,FullFileName);
  //.
  ShowMessage('Result has been saved into file: '+FullFileName);
  end;
end;

procedure TfmGeographServerObjectSpaceViewWebPageConstructor.Button1Click(Sender: TObject);
var
  FullFileName: string;
  UFFN: string;
  FileData: TByteArray;
  ServerAddress: string;
begin
TestWebBrowser.Stop();
FullFileName:=TestFileName;
PageBody_SaveResultPageToFile(edResultFileName.Text,FullFileName);
UFFN:=edResultFileName.Text+'.html';
with TFileStream.Create(FullFileName,fmOpenRead) do
try
SetLength(FileData,Size);
Read(Pointer(@FileData[0])^,Length(FileData));
finally
Destroy;
end;
with TMODELUserFunctionality(TComponentFunctionality_Create(idTMODELUser,GeoGraphServerObjectPanelProps.ObjFunctionality.Space.UserID)) do
try
if (NOT ServerFolder_AddFile('',UFFN,FileData))
 then begin
  ServerFolder_RemoveFile('',UFFN);
  if (NOT ServerFolder_AddFile('',UFFN,FileData)) then Raise Exception.Create('error on file saving'); //. =>
  ShowMessage('file has been successfully replaced with new one on the server side'); //. =>
  end
 else
  ShowMessage('file has been successfully stored on the server side'); //. =>
//.
ServerAddress:=ProxySpace.SOAPServerURL;
SetLength(ServerAddress,Pos(ANSIUpperCase('SpaceSOAPServer.dll'),ANSIUpperCase(ProxySpace.SOAPServerURL))-2);
ServerAddress:=ServerAddress+'/'+'Space'+'/'+'0'{URL protocol version}+'/'+'TypesSystem'+'/'+IntToStr(idTMODELUser)+'/'+'Co'+'/'+IntToStr(idObj)+'/'+'Folder'+'/'+UFFN;
ShellExecute(0,'open',PChar(ServerAddress),nil,nil, SW_SHOWNORMAL);
finally
Release;
end;
end;

end.
