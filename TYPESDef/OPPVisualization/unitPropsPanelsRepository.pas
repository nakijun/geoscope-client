unit unitPropsPanelsRepository;

interface

uses
  Windows, Messages, SysUtils, SyncObjs, GlobalSpaceDefines, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

const
  WM_GETPROPSPANEL = WM_USER+1;
  WM_SETPROPSPANEL = WM_USER+2;
  WM_HIDEPROPSPANEL = WM_USER+3;
  WM_PAINTPROPSPANEL = WM_USER+4;

type
  TVisiblePanelsListItem = record
    ptrObj: TPtr;
    PropsPanel: TForm;
  end;

  TfmPropsPanelRepository = class;
  
  TPropsPanelsTracking = class(TTimer)
  private
    fmPropsPanelRepository: TfmPropsPanelRepository;
    Constructor Create(pfmPropsPanelRepository: TfmPropsPanelRepository);
    procedure Execute(Sender: TObject);
  end;

  TfmPropsPanelRepository = class(TForm)
  private
    { Private declarations }
    PropsPanelsTracking: TPropsPanelsTracking;
  public
    { Public declarations }
    VisiblePanelsList: TList;

    NewPropsPanel: TForm;
    NewPropsPanelBMP: TBitmap;

    SetPropsPanel_Panel: TForm;
    SetPropsPanel_ptrObj: TPtr;
    SetPropsPanel_Left: integer;
    SetPropsPanel_Top: integer;
    SetPropsPanel_Reflector: TForm;

    HidePropsPanel_Panel: TForm;

    PaintPropsPanel_Panel: TForm;
    PaintPropsPanel_BMP: TBitmap;

    Constructor Create(AOwner: TComponent); override;
    Destructor Destroy; override;

    procedure wmGetPropsPanel(var Message: TMessage); message WM_GETPROPSPANEL;
    procedure wmSetPropsPanel(var Message: TMessage); message WM_SETPROPSPANEL;
    procedure wmHidePropsPanel(var Message: TMessage); message WM_HIDEPROPSPANEL;
    procedure wmPaintPropsPanel(var Message: TMessage); message WM_PAINTPROPSPANEL;
  end;

var
  fmPropsPanelRepository: TfmPropsPanelRepository = nil;

implementation
Uses
  unitReflector, Functionality, TypesDefines, TypesFunctionality, SpaceObjInterpretation;

{$R *.dfm}


Constructor TPropsPanelsTracking.Create(pfmPropsPanelRepository: TfmPropsPanelRepository);
begin
Inherited Create(nil);
fmPropsPanelRepository:=pfmPropsPanelRepository;
Interval:=100;
OnTimer:=Execute;
end;

procedure TPropsPanelsTracking.Execute(Sender: TObject);
var
  I,J: integer;
  ptrItem: pointer;
  ptrLay,ptrLayItem: pointer;
  ReflectorsList: TList;
  flFound: boolean;
  M: TMessage;
begin
with fmPropsPanelRepository do
if VisiblePanelsList.Count > 0
 then begin
  I:=0;
  while I < VisiblePanelsList.Count do with TSpaceObjPanelProps(TVisiblePanelsListItem(VisiblePanelsList[I]^).PropsPanel).ObjFunctionality do begin
    ReflectorsList:=TList.Create;
    try
    SystemTOPPVisualization.Lock.Enter;
    try
    ptrItem:=TTOPPVisualizationCash(SystemTOPPVisualization.Cash).FItems;
    while ptrItem <> nil do with TItemTOPPVisualizationCash(ptrItem^) do begin
      if flLock AND (PropsPanel <> nil) AND PropsPanel.Visible AND (PropsPanel = TVisiblePanelsListItem(VisiblePanelsList[I]^).PropsPanel)
       then ReflectorsList.Add(LockReflector);
      //.
      ptrItem:=ptrNext;
      end;
    finally
    SystemTOPPVisualization.Lock.Leave;
    end;
    //.
    flFound:=false;
    for J:=0 to ReflectorsList.Count-1 do
      try
      if ObjectIsInheritedFrom(ReflectorsList[J],TReflector)
       then with TReflector(ReflectorsList[J]).Reflecting do begin
        Lock.Enter;
        try
        ptrLay:=Lays;
        while ptrLay <> nil do with TLayReflect(ptrLay^) do begin
          ptrLayItem:=Objects;
          while ptrLayItem <> nil do with TItemLayReflect(ptrLayItem^) do begin
            if ptrObject = TVisiblePanelsListItem(VisiblePanelsList[I]^).ptrObj
             then begin
              flFound:=true;
              Break; //. >
              end;
            ptrLayItem:=ptrNext;
            end;
          if flFound then Break; //. >
          ptrLay:=ptrNext;
          end;
        finally
        Lock.Leave;
        end;
        if flFound then Break; //. >
        end;
      except
        end;
    finally
    ReflectorsList.Destroy;
    end;
    if NOT flFound
     then begin
      HidePropsPanel_Panel:=TVisiblePanelsListItem(VisiblePanelsList[I]^).PropsPanel;
      wmHidePropsPanel(M);
      end
     else
      Inc(I);
    end;
  end;
end;


{TPropsPanelsTracking}
Constructor TfmPropsPanelRepository.Create(AOwner: TComponent);
begin
Inherited Create(AOwner);
VisiblePanelsList:=TList.Create;
PropsPanelsTracking:=TPropsPanelsTracking.Create(Self);
end;

Destructor TfmPropsPanelRepository.Destroy;
var
  I: integer;
  ptrItem: pointer;
begin
PropsPanelsTracking.Free;
for I:=0 to VisiblePanelsList.Count-1 do FreeMem(VisiblePanelsList[I],SizeOf(TVisiblePanelsListItem));
VisiblePanelsList.Free;
if (SystemTOPPVisualization <> nil)
 then begin //. erase all props panels of TypeSystem
  SystemTOPPVisualization.Lock.Enter;
  try
  ptrItem:=TTOPPVisualizationCash(SystemTOPPVisualization.Cash).FItems;
  while ptrItem <> nil do with TItemTOPPVisualizationCash(ptrItem^) do begin
    if (PropsPanel <> nil)
     then begin
      PropsPanel.Free;
      PropsPanel:=nil;
      end;
    //.
    ptrItem:=ptrNext;
    end;
  finally
  SystemTOPPVisualization.Lock.Leave;
  end;
  end;
//.
Inherited;
end;

procedure TfmPropsPanelRepository.wmGetPropsPanel(var Message: TMessage);
var
  PropsPanel: TForm;
begin
//.
with TComponentFunctionality_Create(Integer(Message.WParam),Integer(Message.LParam)) do
try
Inc(Space.Log.OperationsCount); //. avoid progress bar show
try
PropsPanel:=TPanelProps_Create(false, 0,nil,nilObject);
finally
Dec(Space.Log.OperationsCount);
end;
with TSpaceObjPanelProps(PropsPanel) do begin
Hide;
Parent:=nil;
BorderStyle:=bsNone;
flFreeOnClose:=false;
NormalizeSize;
end;
finally
Release;
end;
//.
NewPropsPanelBMP:=TBitmap.Create;
NewPropsPanelBMP.Width:=PropsPanel.Width;
NewPropsPanelBMP.Height:=PropsPanel.Height;
NewPropsPanelBMP.Canvas.Lock;
try
PropsPanel.Update; /// ?
PropsPanel.PaintTo(NewPropsPanelBMP.Canvas.Handle,0,0);
finally
NewPropsPanelBMP.Canvas.UnLock;
end;
//.
NewPropsPanel:=PropsPanel;
end;

procedure TfmPropsPanelRepository.wmSetPropsPanel(var Message: TMessage);
var
  I: integer;
  ptrNewItem: pointer;
  flFound: boolean;
begin
try
with SetPropsPanel_Panel do begin
ParentWindow:=SetPropsPanel_Reflector.Handle;
Left:=SetPropsPanel_Left;
Top:=SetPropsPanel_Top;
OnMouseWheel:=SetPropsPanel_Reflector.OnMouseWheel;
OnKeyDown:=SetPropsPanel_Reflector.OnKeyDown;
OnKeyPress:=SetPropsPanel_Reflector.OnKeyPress;
Show;
SendToBack;
SetPropsPanel_Reflector.Update;
end;
//.
flFound:=false;
for I:=0 to VisiblePanelsList.Count-1 do
 if TVisiblePanelsListItem(VisiblePanelsList[I]^).PropsPanel = SetPropsPanel_Panel
  then begin
   flFound:=true;
   Break; //. >
   end;
if NOT flFound
 then begin
  GetMem(ptrNewItem,SizeOf(TVisiblePanelsListItem));
  with TVisiblePanelsListItem(ptrNewItem^) do begin
  ptrObj:=SetPropsPanel_ptrObj;
  PropsPanel:=SetPropsPanel_Panel;
  end;
  VisiblePanelsList.Add(ptrNewItem);
  end;
//.
except
  end;
end;

procedure TfmPropsPanelRepository.wmHidePropsPanel(var Message: TMessage);
var
  i: integer;
begin
try
HidePropsPanel_Panel.Hide;
for I:=0 to VisiblePanelsList.Count-1 do
 if TVisiblePanelsListItem(VisiblePanelsList[I]^).PropsPanel = HidePropsPanel_Panel
  then begin
   FreeMem(VisiblePanelsList[I],SizeOf(TVisiblePanelsListItem));
   VisiblePanelsList.Delete(I);
   Break; //. ->
   end;
except
  end;
end;

procedure TfmPropsPanelRepository.wmPaintPropsPanel(var Message: TMessage);
begin
PaintPropsPanel_BMP.Canvas.Lock;
try
PaintPropsPanel_Panel.Update; /// ?
PaintPropsPanel_Panel.PaintTo(PaintPropsPanel_BMP.Canvas,0,0);
finally
PaintPropsPanel_BMP.Canvas.UnLock;
end;
end;


Initialization
{$IFNDEF SOAPServer}
fmPropsPanelRepository:=TfmPropsPanelRepository.Create(nil);
with fmPropsPanelRepository do begin
Hide;
Parent:=nil;
end;
{$ENDIF}


Finalization
fmPropsPanelRepository.Free;

end.
