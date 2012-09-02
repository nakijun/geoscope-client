unit UnitLabelPanelProps;

interface

uses
  UnitProxySpace, Functionality, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TypesDefines,TypesFunctionality,unitReflector,
  Db, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, SpaceObjInterpretation, Spin,
  ComCtrls;

const
  HeightIncrement = 4;
  WidthIncrement = 4;
type
  TLabelPanelProps = class(TSpaceObjPanelProps)
    FontDialog: TFontDialog;
    LabelType: TLabel;
    EditText: TEdit;
    LabelFont_Height: TLabel;
    LabelFontWidth: TLabel;
    EditFont_Height: TEdit;
    EditFont_Width: TEdit;
    UpDownFont_Height: TUpDown;
    UpDownFont_Width: TUpDown;
    EditFont_Name: TEdit;
    LabelFont_Name: TLabel;
    SpeedButtonFontChange: TSpeedButton;
    Bevel: TBevel;
    procedure EditKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButtonFontChangeClick(Sender: TObject);
    procedure UpDownFont_HeightClick(Sender: TObject; Button: TUDBtnType);
    procedure UpDownFont_WidthClick(Sender: TObject; Button: TUDBtnType);
    procedure UpDownFont_HeightMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure UpDownFont_WidthMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    procedure DisableControls;
    procedure Controls_ClearPropData; override;
  public
    { Public declarations }
    Font_Width: Extended;
    Font_Height: Extended;
    Constructor Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr); override;
    destructor Destroy; override;
    procedure _Update; override;
  end;

implementation

{$R *.DFM}

Constructor TLabelPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
Update;
end;

destructor TLabelPanelProps.Destroy;
begin
Inherited;
end;

procedure TLabelPanelProps._Update;
begin
Inherited;
{/// + with ObjFunctionality.Space.TObjPropsQuery_Create do
try
EnterSQL('SELECT * FROM '+TComponentFunctionality(ObjFunctionality).TypeFunctionality.TableName+' WHERE Key_+0 = '+IntToStr(TComponentFunctionality(ObjFunctionality).idObj));
Open;
try EditText.Text:=FieldValues['Text'] except EditText.Text:='' end;
try Font_Height:=FieldValues['Font_Height'] except Font_Height:=0 end;
EditFont_Height.Text:=FloatToStr(Font_Height);
try Font_Width:=FieldValues['Font_Width'] except Font_Width:=0 end;
EditFont_Width.Text:=FloatToStr(Font_Width);
try EditFont_Name.Text:=FieldValues['Font_Name'] except EditFont_Name.Text:='' end;
finally
Destroy;
end;}
end;

procedure TLabelPanelProps.EditKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D
 then begin
  {/// + with ObjFunctionality.Space.TObjPropsQuery_Create do
  try
  ObjFunctionality.CheckUserOperation(idWriteOperation);
  EnterSQL('UPDATE '+TComponentFunctionality(ObjFunctionality).TypeFunctionality.TableName+' SET Text = '''+EditText.Text+''' WHERE Key_ = '+IntToStr(TComponentFunctionality(ObjFunctionality).idObj));
  ExecSQL;
  finally
  Destroy;
  end;
  LabelsCash.UpdateItem(TComponentFunctionality(ObjFunctionality).idObj);
  if ObjectIsInheritedFrom(TypesSystem.Reflector,TReflector) then with TReflector(TypesSystem.Reflector) do Reflecting.ReFresh;}
  end;
end;


procedure TLabelPanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TLabelPanelProps.SpeedButtonFontChangeClick(Sender: TObject);
begin
FontDialog.Font.Name:=EditFont_Name.Text;
if FontDialog.Execute
 then begin
  EditFont_Name.Text:=FontDialog.Font.Name;
  {/// + with ObjFunctionality.Space.TObjPropsQuery_Create do
  try
  ObjFunctionality.CheckUserOperation(idWriteOperation);
  EnterSQL('UPDATE '+TComponentFunctionality(ObjFunctionality).TypeFunctionality.TableName+' SET Font_Name = "'+FontDialog.Font.Name+'" WHERE Key_ = '+IntToStr(TComponentFunctionality(ObjFunctionality).idObj));
  ExecSQL;
  finally
  Destroy;
  end;
  LabelsCash.UpdateItem(TComponentFunctionality(ObjFunctionality).idObj);
  if ObjectIsInheritedFrom(TypesSystem.Reflector,TReflector) then with TReflector(TypesSystem.Reflector) do Reflecting.ReFresh;}
  end;
end;

procedure TLabelPanelProps.UpDownFont_HeightClick(Sender: TObject;
  Button: TUDBtnType);
begin
if ObjectIsInheritedFrom(TypesSystem.Reflector,TReflector) then with TReflector(TypesSystem.Reflector) do begin
if Button = btNext
 then Font_Height:=Font_Height+(HeightIncrement/ReflectionWindow.Scale)
 else Font_Height:=Font_Height-(HeightIncrement/ReflectionWindow.Scale);
EditFont_Height.Text:=FloatToStr(Font_Height);
end;
end;

procedure TLabelPanelProps.UpDownFont_WidthClick(Sender: TObject;
  Button: TUDBtnType);
begin
if ObjectIsInheritedFrom(TypesSystem.Reflector,TReflector) then with TReflector(TypesSystem.Reflector) do begin
if Button = btNext
 then Font_Width:=Font_Width+(WidthIncrement/ReflectionWindow.Scale)
 else Font_Width:=Font_Width-(WidthIncrement/ReflectionWindow.Scale);
EditFont_Width.Text:=FloatToStr(Font_Width);
end;
end;

procedure TLabelPanelProps.UpDownFont_HeightMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  C: Char;
begin
{/// + with TypesSystem.Reflector.Space.TObjPropsQuery_Create do
try
ObjFunctionality.CheckUserOperation(idWriteOperation);
C:=DecimalSeparator;DecimalSeparator:='.';
EnterSQL('UPDATE '+TComponentFunctionality(ObjFunctionality).TypeFunctionality.TableName+' SET Font_Height = '+FormatFloat('',Font_Height)+' WHERE Key_ = '+IntToStr(TComponentFunctionality(ObjFunctionality).idObj));
DecimalSeparator:=C;
ExecSQL;
finally
Destroy;
end;}
LabelsCash.UpdateItem(TComponentFunctionality(ObjFunctionality).idObj);
if ObjectIsInheritedFrom(TypesSystem.Reflector,TReflector) then with TReflector(TypesSystem.Reflector) do Reflecting.ReFresh;
end;

procedure TLabelPanelProps.UpDownFont_WidthMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  C: Char;
begin
{/// + with TypesSystem.Reflector.Space.TObjPropsQuery_Create do
try
ObjFunctionality.CheckUserOperation(idWriteOperation);
C:=DecimalSeparator;DecimalSeparator:='.';
EnterSQL('UPDATE '+TComponentFunctionality(ObjFunctionality).TypeFunctionality.TableName+' SET Font_Width = '+FormatFloat('',Font_Width)+' WHERE Key_ = '+IntToStr(TComponentFunctionality(ObjFunctionality).idObj));
DecimalSeparator:=C;
ExecSQL;
finally
Destroy;
end;}
LabelsCash.UpdateItem(TComponentFunctionality(ObjFunctionality).idObj);
if ObjectIsInheritedFrom(TypesSystem.Reflector,TReflector) then with TReflector(TypesSystem.Reflector) do Reflecting.ReFresh;
end;

procedure TLabelPanelProps.Controls_ClearPropData;
begin
EditText.Text:='';
EditFont_Height.Text:='';
EditFont_Width.Text:='';
EditFont_Name.Text:='';
end;

end.
