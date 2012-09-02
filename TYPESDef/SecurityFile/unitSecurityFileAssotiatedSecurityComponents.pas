unit unitSecurityFileAssotiatedSecurityComponents;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Buttons, StdCtrls,
  GlobalSpaceDefines, unitProxySpace, Functionality, TypesDefines, TypesFunctionality,
  ExtCtrls;

type
  TfmSecurityFileAssotiatedSecurityComponents = class(TForm)
    PageControl1: TPageControl;
    tsAssotiatedComponents: TTabSheet;
    ListObjects: TListView;
    Timer: TTimer;
    bbBreak: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ListObjectsDblClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure bbBreakClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    Space: TProxySpace;
    idSecurityFile: integer;
    ImageList: TImageList;
    flProcessing: boolean;
    flBreak: boolean;
  public
    { Public declarations }

    Constructor Create(const pSpace: TProxySpace; const pidSecurityFile: integer);
    Destructor Destroy; override;
    procedure Update;
  end;


implementation
Uses
  FunctionalitySOAPInterface;

{$R *.dfm}


{TfmComponentSearch}
Constructor TfmSecurityFileAssotiatedSecurityComponents.Create(const pSpace: TProxySpace; const pidSecurityFile: integer);
begin
Inherited Create(nil);
Space:=pSpace;
idSecurityFile:=pidSecurityFile;
ImageList:=TImageList.Create(nil);
with ImageList do begin
Width:=32;
Height:=32;
end;
ListObjects.SmallImages:=ImageList;
flProcessing:=false;
end;

Destructor TfmSecurityFileAssotiatedSecurityComponents.Destroy;
begin
ImageList.Free;
Inherited;
end;

procedure TfmSecurityFileAssotiatedSecurityComponents.Update;

  function GetVisualizationsSquare(const CF: TComponentFunctionality): Extended;
  var
    CL: TComponentsList;
    I: integer;
    CCF: TComponentFunctionality;
  begin
  Result:=0;
  if CF is TBase2DVisualizationFunctionality then Result:=Result+TBase2DVisualizationFunctionality(CF).Square;
  //. process own components
  CF.GetComponentsList(CL);
  try
  for I:=0 to CL.Count-1 do with TItemComponentsList(CL[I]^) do begin
    CCF:=TComponentFunctionality_Create(idTComponent,idComponent);
    try
    Result:=Result+GetVisualizationsSquare(CCF);
    finally
    CCF.Release;
    end;
    end;
  finally
  CL.Destroy;
  end;
  end;

var
  SC: TCursor;
  SecurityComponents: TList;
  I: integer;
  idTOwner,idOwner: integer;
  OwnerFunctionality: TComponentFunctionality;
  IconBitmap: TBitmap;
  MS: TMemoryStream;
  TempBMP: TBitmap;
  S: Extended;
begin
if flProcessing then Raise Exception.Create('update in progress'); //. =>
flProcessing:=true;
try
flBreak:=false;
bbBreak.Show;
SC:=Screen.Cursor;
try
Screen.Cursor:=crAppStart;
with TSecurityFileFunctionality(TComponentFunctionality_Create(idTSecurityFile,idSecurityFile)) do
try
tsAssotiatedComponents.Caption:='Security - "'+Name+'"';
//.
ImageList.Clear;
ImageList.AddImages(TypesImageList);
with ListObjects do begin
/// ? Items.BeginUpdate;
try
Items.Clear;
GetAssotiatedSecurityComponents(SecurityComponents);
try
for I:=0 to SecurityComponents.Count-1 do with TComponentFunctionality_Create(idTSecurityComponent,Integer(SecurityComponents[I])) do
  try
  if GetOwner(idTOwner,idOwner)
   then begin
    OwnerFunctionality:=TComponentFunctionality_Create(idTOwner,idOwner);
    try
    with Items.Add do
    try
    Data:=Pointer(idObj);
    with OwnerFunctionality do begin
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
      ImageIndex:=TypeFunctionality.ImageList_Index;
    SubItems.Add(IntToStr(DATASize));
    S:=GetVisualizationsSquare(OwnerFunctionality);
    if S > 0 
     then SubItems.Add(FormatFloat('0.###',S))
     else SubItems.Add('--');
    end;
    except
      end;
    Application.ProcessMessages;
    if flBreak then Raise EAbort.Create(''); //. =>
    finally
    OwnerFunctionality.Release;
    end;
    end;
  finally
  Release;
  end;
finally
SecurityComponents.Destroy;
end;
finally
/// ? Items.EndUpdate;
end;
end;
//.
finally
Release;
end;
finally
Screen.Cursor:=SC;
end;
finally
flProcessing:=false;
bbBreak.Hide;
end;
end;

procedure TfmSecurityFileAssotiatedSecurityComponents.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action:=caFree;
end;

procedure TfmSecurityFileAssotiatedSecurityComponents.ListObjectsDblClick(Sender: TObject);
var
  idTOwner,idOwner: integer;
begin
with TComponentFunctionality_Create(idTSecurityComponent,Integer(ListObjects.Selected.Data)) do
try
if GetOwner(idTOwner,idOwner)
 then with TComponentFunctionality_Create(idTOwner,idOwner) do
  try
  with TPanelProps_Create(false,0,nil,nilObject) do begin
  Position:=poScreenCenter;
  Show;
  end;
  finally
  Release;
  end;
finally
Release;
end;
end;

procedure TfmSecurityFileAssotiatedSecurityComponents.TimerTimer(Sender: TObject);
begin
Timer.Enabled:=false;
Update;
end;

procedure TfmSecurityFileAssotiatedSecurityComponents.bbBreakClick(Sender: TObject);
begin
flBreak:=true;
end;

procedure TfmSecurityFileAssotiatedSecurityComponents.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
CanClose:=NOT flProcessing;
end;

end.
