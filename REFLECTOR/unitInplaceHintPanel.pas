unit unitInplaceHintPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TInplaceHintPanel = class(TRichEdit)
  private
    { Private declarations }
  public
    { Public declarations }
    Constructor Create(const pParent: TForm; const pHintText: string; const X,Y: integer);
    procedure Show(); reintroduce;
    procedure UpdateLayout();
    procedure SetHintText(const pHintText: string);
    procedure SetPosition(const X,Y: integer);
  end;


implementation
uses
  RichEdit;


Constructor TInplaceHintPanel.Create(const pParent: TForm; const pHintText: string; const X,Y: integer);
const
  InitialWidth = 250;
begin
Inherited Create(nil);
Visible:=false;
BorderStyle:=bsNone;
WordWrap:=true;
Width:=InitialWidth;
Height:=16;
///? ScrollBars:=ssVertical;
//.
Text:=pHintText;
Left:=X;
Top:=Y;
end;

procedure TInplaceHintPanel.Show();
begin
Color:=TColor($00F4EAFF);
Font.Size:=10;
//.
Inherited Show();
end;

procedure TInplaceHintPanel.UpdateLayout();
var
  Range: TFormatRange;
  Rect: TRect;
  LogX,LogY: Integer;
begin
FillChar(Range, SizeOf(Range), 0);
Range.hdc:=TForm(Parent).Canvas.Handle;
Range.hdcTarget:=Range.hdc;
LogX:=GetDeviceCaps(Range.hdc, LOGPIXELSX);
LogY:=GetDeviceCaps(Range.hdc, LOGPIXELSY);
Range.rc.Left:=0;
Range.rc.Right:=ClientWidth*1440 DIV LogX; // Any predefined width
Range.rc.Top:=0;
Range.rc.Bottom:=Screen.Height*1440 DIV LogY; // Some big number
Range.rcPage:=Range.rc;
Range.chrg.cpMin:=0;
Range.chrg.cpMax:=-1;
Perform(EM_FORMATRANGE, 0, Longint(@Range));
//.
Width:=Range.rc.Right*LogX DIV 1440;
Height:=Range.rc.Bottom*LogY DIV 1440;
end;

procedure TInplaceHintPanel.SetHintText(const pHintText: string);
begin
Text:=pHintText;
UpdateLayout();
end;

procedure TInplaceHintPanel.SetPosition(const X,Y: integer);
begin
Left:=X;
Top:=Y;
end;


end.
