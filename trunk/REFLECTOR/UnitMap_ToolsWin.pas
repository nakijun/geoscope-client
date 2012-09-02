unit UnitMap_ToolsWin;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ToolWin, ComCtrls, ImgList, unitReflector, StdCtrls;

type
  TMap_ToolsWin = class(TForm)
    ImageListButtons: TImageList;
    CoolBar1: TCoolBar;
    ToolBar2: TToolBar;
    URLs: TComboBox;
    ToolBar: TToolBar;
    ToolButtonGetHints: TToolButton;
    ToolButton13: TToolButton;
    ToolButtonDeletePoint: TToolButton;
    ToolButtonDeleteObj: TToolButton;
    ToolButtonEditVisiblePropsObj: TToolButton;
    ToolButton9: TToolButton;
    ToolButtonChangeObj: TToolButton;
    ToolButtonCancelPutObj: TToolButton;
    ToolButton10: TToolButton;
    ToolButton8: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButtonChangeOp: TToolButton;
    ToolButton2: TToolButton;
    ToolButtonCreateSubDetail: TToolButton;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ToolButtonGetHintsClick(Sender: TObject);
    procedure ToolButtonDeletePointClick(Sender: TObject);
    procedure ToolButtonCreateNewObjClick(Sender: TObject);
    procedure ToolButtonChangeObjClick(Sender: TObject);
    procedure ToolButtonCancelPutObjClick(Sender: TObject);
    procedure ToolButtonSaveSpaceClick(Sender: TObject);
    procedure ToolButtonDeleteObjClick(Sender: TObject);
    procedure ToolButtonEditVisiblePropsObjClick(Sender: TObject);
    procedure ToolButton13Click(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButtonChangeOpClick(Sender: TObject);
    procedure ToolButtonCreateSubDetailClick(Sender: TObject);
  private
    { Private declarations }
    FMap: TFormMain;
  public
    { Public declarations }
    Constructor Create(pMap: TFormMain);
  end;

implementation
Uses
  UnitOperator;

{$R *.DFM}

{TMap_ToolsWin}
Constructor TMap_ToolsWin.Create(pMap: TFormMain);
begin
Inherited Create(nil);
FMap:=pMap;
with FMap.Configuration do begin
ToolButtonDeletePoint.Enabled:=EnableEditLine;
ToolButtonCreateSubDetail.Enabled:=EnableCreateNewObj;
ToolButtonDeleteObj.Enabled:=EnableDeleteObj;
ToolButtonEditVisiblePropsObj.Enabled:=EnableEditLine;
ToolButtonChangeObj.Enabled:=EnableChangeObj;
ToolButtonCancelPutObj.Enabled:=EnableChangeObj;
//ToolButtonSaveSpace.Enabled:=(EnableEditLine OR EnableCreateNewObj OR EnableDeleteObj OR EnableChangeObj);
end;
Show;
end;

procedure TMap_ToolsWin.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
CanClose:=false;
end;

procedure TMap_ToolsWin.ToolButtonGetHintsClick(Sender: TObject);
begin
FMap.ReflectHint;
end;

procedure TMap_ToolsWin.ToolButtonDeletePointClick(Sender: TObject);
begin
FMap.DeleteSelectedPointObj;
end;

procedure TMap_ToolsWin.ToolButtonCreateNewObjClick(Sender: TObject);
begin
FMap.PrepToConstrObjInSelectedObj;
end;

procedure TMap_ToolsWin.ToolButtonChangeObjClick(Sender: TObject);
begin
FMap.PutReleaseSelectedObj;
end;

procedure TMap_ToolsWin.ToolButtonCancelPutObjClick(Sender: TObject);
begin
FMap.CancelPutSelectedObj;
end;

procedure TMap_ToolsWin.ToolButtonSaveSpaceClick(Sender: TObject);
begin
//FMap.Space.UpDate;
ShowMessage('Map saved.');
end;

procedure TMap_ToolsWin.ToolButtonDeleteObjClick(Sender: TObject);
begin
FMap.DeleteSelectedObj;
end;

procedure TMap_ToolsWin.ToolButtonEditVisiblePropsObjClick(Sender: TObject);
begin
FMap.ChangeVisiblePropsSelectedObj;
end;

procedure TMap_ToolsWin.ToolButton13Click(Sender: TObject);
begin
FMap.ShowPanelTreeSelectedObject
end;

procedure TMap_ToolsWin.ToolButton8Click(Sender: TObject);
begin
FMap.PrintViewObj;
end;

procedure TMap_ToolsWin.ToolButton5Click(Sender: TObject);
begin
FMap.SendMessage;
end;

procedure TMap_ToolsWin.ToolButtonChangeOpClick(Sender: TObject);
begin
with TFormOperator.Create do begin
EditOp.Text:=FMap.OperatorID;
FMap.ChangeOperatorID(Input);
Destroy;
end;
end;

procedure TMap_ToolsWin.ToolButtonCreateSubDetailClick(Sender: TObject);
begin
FMap.CreateDetailOnSelectedObj;
end;

end.
