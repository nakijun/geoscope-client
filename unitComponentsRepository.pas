Unit unitComponentsRepository;
Interface
Uses
  Classes,
  SysUtils,
  StdCtrls,
  ComCtrls,
  ExtCtrls,
  Graphics,
  Forms,

  RXCtrls,
  Animate,
  GIFCtrl,
  SHDocVw;

Type
  TComponentEntry = record
    idType: TComponentClass;
    nmType: shortstring;
  end;
const
  ComponentsCount = 11;
Type
  TComponents = Array[0..ComponentsCount-1] of TComponentEntry;

Const
  Components: TComponents = (
  (idType: TLabel; nmType: 'TLabel'),
  (idType: TBevel; nmType: 'TBevel'),
  (idType: TImage; nmType: 'TImage'),
  (idType: TMemo; nmType: 'TMemo'),
  (idType: TPanel; nmType: 'TPanel'),
  (idType: TScrollBox; nmType: 'TScrollBox'),
  (idType: TSplitter; nmType: 'TSplitter'),
  (idType: TAnimate; nmType: 'TAnimate'),
  (idType: TWebBrowser; nmType: 'TWebBrowser'),
  (idType: TRxLabel; nmType: 'TRxLabel'),
  (idType: TRxGIFAnimator; nmType: 'TRxGIFAnimator')

  //(idType: ; nmType: ),
  );


Type
  TComponentsRepository = class
  public
    Constructor Create;
    procedure FindComponentClass(Reader: TReader; const ClassName: string; var ComponentClass: TComponentClass);
  end;

var
  ComponentsRepository: TComponentsRepository;

Implementation

{TComponentsRepository}
Constructor TComponentsRepository.Create;
begin
Inherited Create;
end;

procedure TComponentsRepository.FindComponentClass(Reader: TReader; const ClassName: string; var ComponentClass: TComponentClass);
var
  I: integer;
begin
for I:=0 to ComponentsCount-1 do
  if SameText(Components[I].nmType,ClassName)
   then begin
    ComponentClass:=Components[I].idType;
    Exit;
    end;
end;

Initialization
ComponentsRepository:=TComponentsRepository.Create;

Finalization
ComponentsRepository.Free;
end.
