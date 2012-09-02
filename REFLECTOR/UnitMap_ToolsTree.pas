unit UnitMap_ToolsTree;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ImgList, ComCtrls, StdCtrls, Buttons;

type
  TMap_ToolsTree = class(TForm)
    Tree: TTreeView;
    ImageList: TImageList;
    BitBtn1: TBitBtn;
    procedure TreeDblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Map_ToolsTree: TMap_ToolsTree;

implementation
Uses unitReflector;

{$R *.DFM}

//type
//  Operations = (opFind,opCreate,opRemove);
//  Objects = (objTLF,obj)

procedure TMap_ToolsTree.TreeDblClick(Sender: TObject);
begin
with (Sender as TTreeView).Selected do begin

end;
end;

procedure TMap_ToolsTree.BitBtn1Click(Sender: TObject);
begin
With TFormMain.Create('ServerGTS') do Show;
end;

end.
