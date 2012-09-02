unit unitComponentSearch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Buttons, StdCtrls,
  GlobalSpaceDefines, unitProxySpace, Functionality, TypesFunctionality,
  ExtCtrls;

type
  TTextSearching = class(TThread)
  private
    Space: TProxySpace;
    Context: WideString;
    flRootOwner: boolean;
    ResultComponents: TComponentsList;
    flFinished: boolean;
    ExceptionMessage: string;

    Constructor Create(const pSpace: TProxySpace; const pContext: WideString; const pflRootOwner: boolean);
    Destructor Destroy; override;
    procedure Execute; override;
  end;

  TfmComponentSearch = class(TForm)
    PageControl1: TPageControl;
    tsTextSearch: TTabSheet;
    anTextSearching: TAnimate;
    edTextContext: TEdit;
    Label1: TLabel;
    sbDoTextSearch: TSpeedButton;
    ListObjects: TListView;
    timerTextSearch: TTimer;
    sbStopTextSearch: TSpeedButton;
    cbTextSearchDetailed: TCheckBox;
    procedure timerTextSearchTimer(Sender: TObject);
    procedure sbStopTextSearchClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbDoTextSearchClick(Sender: TObject);
    procedure ListObjectsDblClick(Sender: TObject);
    procedure edTextContextKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    Space: TProxySpace;
    TextSearching: TTextSearching;
    TextSearch_Result: TComponentsList;
    ImageList: TImageList;

    procedure TextSearch_Begin(const TextContext: WideString; const flRootOwner: boolean);
    procedure TextSearch_End;
    procedure TextSearch_Check;
  public
    { Public declarations }

    Constructor Create(const pSpace: TProxySpace);
    Destructor Destroy; override;
  end;


implementation
Uses
  FunctionalitySOAPInterface;

{$R *.dfm}


{TTextSearching}
Constructor TTextSearching.Create(const pSpace: TProxySpace; const pContext: WideString; const pflRootOwner: boolean);
begin
Space:=pSpace;
Context:=pContext;
flRootOwner:=pflRootOwner;
ResultComponents:=nil;
ExceptionMessage:='';
flFinished:=false;
Inherited Create(false);
end;

Destructor TTextSearching.Destroy;
var
  EC: dword;
begin
if (Space.State <> psstDestroying)
 then Inherited
 else begin
  GetExitCodeThread(Handle,EC);
  TerminateThread(Handle,EC);
  end;
FreeAndNil(ResultComponents);
end;

procedure TTextSearching.Execute;
var
  BA: TByteArray;
  I: integer;
begin
try
with GetISpaceTypesSystemManager(Space.SOAPServerURL) do TextSearch(Space.UserName,Space.UserPassword, Context,flRootOwner, BA);
ResultComponents:=TComponentsList.Create;
try
for I:=0 to (Length(BA) DIV SizeOf(TItemComponentsList))-1 do with TItemComponentsList(Pointer(Integer(@BA[0])+I*SizeOf(TItemComponentsList))^) do ResultComponents.AddComponent(idTComponent,idComponent,0);
except
  FreeAndNil(ResultComponents);
  Raise; //. =>
  end;
except
  On E: Exception do ExceptionMessage:=E.Message;
  end;
flFinished:=true;
end;


{TfmComponentSearch}
Constructor TfmComponentSearch.Create(const pSpace: TProxySpace);
begin
Inherited Create(nil);
Space:=pSpace;
TextSearching:=nil;
TextSearch_Result:=nil;
ImageList:=TImageList.Create(nil);
with ImageList do begin
Width:=32;
Height:=32;
end;
ListObjects.SmallImages:=ImageList;
end;

Destructor TfmComponentSearch.Destroy;
begin
if TextSearching <> nil then TextSearching.FreeOnTerminate:=true;
FreeAndNil(TextSearch_Result);
ImageList.Free;
Inherited;
end;

procedure TfmComponentSearch.TextSearch_Begin(const TextContext: WideString; const flRootOwner: boolean);
begin
sbDoTextSearch.Enabled:=false;
with anTextSearching do begin
Parent:=ListObjects;
Left:=Round((ListObjects.Width-Width)/2);
Top:=Round((ListObjects.Height-Height)/2);
Visible:=true;
Active:=true;
end;
sbStopTextSearch.Visible:=true;
edTextContext.Enabled:=false;
cbTextSearchDetailed.Enabled:=false;
ListObjects.Items.Clear;
timerTextSearch.Enabled:=true;
TextSearching:=TTextSearching.Create(Space,TextContext,flRootOwner);
end;

procedure TfmComponentSearch.TextSearch_End;
begin
TextSearching.FreeOnTerminate:=true; TextSearching:=nil;
timerTextSearch.Enabled:=false;
cbTextSearchDetailed.Enabled:=true;
edTextContext.Enabled:=true;
sbStopTextSearch.Visible:=false;
anTextSearching.Active:=false;
anTextSearching.Visible:=false;
sbDoTextSearch.Enabled:=true;
end;

procedure TfmComponentSearch.TextSearch_Check;
var
  I: integer;
  IconBitmap: TBitmap;
  MS: TMemoryStream;
  TempBMP: TBitmap;
begin
if (TextSearching <> nil) AND TextSearching.flFinished
 then begin
  try
  if TextSearching.ExceptionMessage <> '' then Raise Exception.Create(TextSearching.ExceptionMessage); //. =>
  //. prepare results
  ImageList.Clear;
  ImageList.AddImages(TypesImageList);
  with ListObjects do begin
  Items.BeginUpdate;
  try
  FreeAndNil(TextSearch_Result); TextSearch_Result:=TextSearching.ResultComponents; TextSearching.ResultComponents:=nil;
  Items.Clear;
  for I:=0 to TextSearch_Result.Count-1 do with Items.Add,TItemComponentsList(TextSearch_Result[I]^) do
    try
    Data:=TextSearch_Result[I];
    with TComponentFunctionality_Create(idTComponent,idComponent) do
    try
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
      ImageIndex:=ImageList.Add(TempBMP,nil);
      finally
      TempBMP.Destroy;
      end;
      finally
      IconBitmap.Destroy;
      end
     else
      ImageIndex:=TypeFunctionality.ImageList_Index
    finally
    Release;
    end;
    except
      end;
  finally
  Items.EndUpdate;
  end;
  end;
  finally
  TextSearch_End;
  end;
  if TextSearch_Result.Count = 0 then ShowMessage('Sorry, no objects found.');
  end;
end;

procedure TfmComponentSearch.sbDoTextSearchClick(Sender: TObject);
begin
TextSearch_Begin(edTextContext.Text,NOT cbTextSearchDetailed.Checked);
end;

procedure TfmComponentSearch.timerTextSearchTimer(Sender: TObject);
begin
TextSearch_Check;
end;

procedure TfmComponentSearch.sbStopTextSearchClick(Sender: TObject);
begin
TextSearch_End;
end;

procedure TfmComponentSearch.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action:=caFree;
end;


procedure TfmComponentSearch.ListObjectsDblClick(Sender: TObject);
begin
with TItemComponentsList(ListObjects.Selected.Data^) do
with TComponentFunctionality_Create(idTComponent,idComponent) do
try
with TPanelProps_Create(false,0,nil,nilObject) do begin
Position:=poScreenCenter;
Show;
end;
finally
Release;
end;
end;


procedure TfmComponentSearch.edTextContextKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D then TextSearch_Begin(edTextContext.Text,NOT cbTextSearchDetailed.Checked);
end;

end.
