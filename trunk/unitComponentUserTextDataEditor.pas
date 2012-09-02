unit unitComponentUserTextDataEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,
  Functionality;

type
  TfmComponentUserTextDataEditor = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    memoFile: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    idTComponent: integer;
    idComponent: integer;
    DataName: string;
    //.
    flSaved: boolean; 

    procedure Save;
  public
    { Public declarations }
    Constructor Create(const pidTComponent,pidComponent: integer; const pDataName: string; const pCaption: string);
    procedure Update(); reintroduce;
    function Edit(): boolean;
  end;


implementation

{$R *.dfm}

Constructor TfmComponentUserTextDataEditor.Create(const pidTComponent,pidComponent: integer; const pDataName: string; const pCaption: string);
begin
Inherited Create(nil);
idTComponent:=pidTComponent;
idComponent:=pidComponent;
DataName:=pDataName;
Caption:=pCaption;
//.
Update();
end;

procedure TfmComponentUserTextDataEditor.Update();
var
  Data: TMemoryStream;
begin
with TComponentFunctionality_Create(idTComponent,idComponent) do
try
GetUserData(DataName,{out} Data);
try
memoFile.Lines.Clear();
if (Data <> nil) then memoFile.Lines.LoadFromStream(Data);
finally
Data.Free;
end;
finally
Release();
end;
end;

function TfmComponentUserTextDataEditor.Edit(): boolean;
begin
flSaved:=false;
ShowModal();
Result:=flSaved;
end;

procedure TfmComponentUserTextDataEditor.Save;
var
  Data: TMemoryStream;
begin
with TComponentFunctionality_Create(idTComponent,idComponent) do
try
Data:=TMemoryStream.Create();
try
memoFile.Lines.SaveToStream(Data);
if (Data.Size > 0)
 then SetUserData(DataName,Data)
 else DeleteUserData(DataName);
finally
Data.Destroy();
end;
finally
Release();
end;
end;

procedure TfmComponentUserTextDataEditor.Button1Click(Sender: TObject);
begin
Save();
flSaved:=true;
Close();
end;

procedure TfmComponentUserTextDataEditor.Button2Click(Sender: TObject);
begin
Close();
end;


end.
