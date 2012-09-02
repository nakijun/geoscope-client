/// - {$H-}
unit unit3DReflector;

interface

uses
  UnitUpdateableObjects,
  FunctionalitySOAPInterface,
  Windows, SyncObjs,ActiveX, Messages, SysUtils, Classes, Graphics, unitOpenGL3DSpace,
  OpenGLEx, Geometry, Types3DS, File3DS, Controls, Forms, Dialogs, ExtDlgs,
  ExtCtrls, StdCtrls, Buttons, Mask, DBCtrls, Db, DBTables, ComCtrls,
  Printers, ToolWin, ShellAPI, Gauges, 
  UnitProxySpace, GlobalSpaceDefines, unitReflector, ImgList, Menus, RXSplit,
  RXCtrls, RxMenus, Math;

Const
  REFLECTORProfile = DefaultProfile+'\3DREFLECTOR';

Type
  TFName=String[8];
  TTblName = String[10];

type
  TReflectionWindow = class
  private
    Space: TProxySpace;

    function getScale: Extended;
  public
    NodesCount: integer;
    X0,Y0,X1,Y1,X2,Y2,X3,Y3,X4,Y4,X5,Y5,X6,Y6,X7,Y7: Extended;
    Xcenter,Ycenter: Extended;
    Xmn,Ymn,Xmx,Ymx: smallint;
    Xmd,Ymd: word;
    HorRange,VertRange: Extended;
    ContainerCoord: TContainerCoord;

    Constructor Create(pSpace: TProxySpace; const pReflectionWindowStruc: TReflectionWindowStrucEx);

    procedure Update;
    procedure AssignWindow(const ReflectionWindowStruc: TReflectionWindowStrucEx);
    procedure GetWindow(const flReal: boolean; var vReflectionWindowStruc: TReflectionWindowStrucEx);
    function SpaceCoordsIsEqual(An: TReflectionWindow): boolean;
    function IsEqual(An: TReflectionWindow): boolean;
    procedure Assign(Srs: TReflectionWindow);
    procedure Normalize;
    function IsObjectVisible(const Obj: TSpaceObj): boolean; overload;
    function IsObjectOutside(const Obj_ContainerCoord: TContainerCoord): boolean;
    function IsObjectVisible(const ptrObj: TPtr): boolean; overload;
    function IsObjectVisible(const Obj_ContainerSquare: Extended; const Obj_ContainerCoord: TContainerCoord; const ptrObj: TPtr): boolean; overload;
    procedure GetMaxMin(var Xmin,Ymin,Xmax,Ymax: Extended);
    property Scale: Extended read GetScale;
  end;

  TItemListVisibleObj = record
    ptrNextObj: pointer;
    ptrObj: TPtr;
    end;

 TListVisibleObj = class
    private
      ptrList: pointer;
      countObj: integer;
    public
      Constructor Create;
      destructor Destroy; override;
      procedure InsertObj(ptrptrItem: pointer; ptrVisObj: TPtr);
      procedure DeleteObj(ptrPredItem: pointer);
      function  FindObj(ptrObj: TPtr; var ptrItem: pointer): boolean;
      procedure MoveList(Srs: TListVisibleObj);
      procedure EmptyList;
    end;

const
  tnReflectorConfiguration = REFLECTORProfile+'\'+'Config';

  clEmptySpace = clBlack;
  clSelectedObj = $004040FF;
  psSelectedObj = psSolid;
  clHandleObj = clWhite;
  clActiveHandleObj = clRed;
  clSpecFigureReflSelectedObj = clWhite;
  psSpecFigureReflSelectedObj = psDash;
  pwSpecFigureReflSelectedObj = 1;
  clSpecFigureReflNewObj = clWhite;
  psSpecFigureReflNewObj = psDash;
  pwSpecFigureReflNewObj = 1;
  clHints = clWhite;
  fsHints = 8;
  SizeRotateArea = 50;
  KfChgScale = 0.005;
  TReflector_maxReflLevel = 100;
  ID_ShowConfiguration = WM_USER+1;

type
  TGL3DReflector = class;

  TReflectorConfiguration = class
  private
    Reflector: TGL3DReflector;

    procedure UpdateByReflector;
  public
    //. active camera parameters
    Translate_X: Extended;
    Translate_Y: Extended;
    Translate_Z: Extended;
    Rotate_AngleX: Extended;
    Rotate_AngleY: Extended;
    Rotate_AngleZ: Extended;
    //. reflector layout config
    Left: integer;
    Top: integer;
    Width: integer;
    Height: integer;
    //. reflector flags
    flHideControlBars: boolean;
    flHideControlPage: boolean;
    flHideBookmarksPage: boolean;
    flHideEditPage: boolean;
    flHideViewPage: boolean;
    flHideOtherPage: boolean;
    flHideCreateButton: boolean;
    flDisableNavigate: boolean;
    flDisableMoveNavigate: boolean;

    Constructor Create(pReflector: TGL3DReflector);
    destructor Destroy; override;
    procedure Open;
    procedure Save;
    procedure Validate;
    procedure ValidateFlags;
  end;

  TCamera = class;

  TCameras = class(TList)
  public
    Reflector: TGL3DReflector;
    ActiveCamera: TCamera;

    Constructor Create(pReflector: TGL3DReflector);
    Destructor Destroy; override;
    procedure Clear;
    function CreateCamera: TCamera;
    procedure DestroyCamera(var Camera: TCamera);
    procedure Select(Camera: TCamera);
  end;

  TCameraProjectionType = (cptOrtho,cptFrustum,cptPerspective);
  TCameraClippingPlanes = record
    Left,Right,Bottom,Top: Extended;
    Near,Far: Extended;
  end;

  TEyeAxis = record
    X0,Y0,Z0: Extended;
    L,M,N: Extended;
  end;

  TCamera = class
  private
    procedure Update;
  public
    Reflector: TGL3DReflector;
    ProjectionType: TCameraProjectionType;
    Translate_X: Extended;
    Translate_Y: Extended;
    Translate_Z: Extended;
    Rotate_AngleX: Extended;
    Rotate_AngleY: Extended;
    Rotate_AngleZ: Extended;
    ProjectionViewPort: TRectangle;
    ProjectionScale: Extended;
    //. calculated fields
    ClippingPlanes: TCameraClippingPlanes;
    EyeAxis: TEyeAxis;
    ProjectionPlane: TPlane;
    ProjectionScalePowerOf4: Extended;

    Constructor Create(pReflector: TGL3DReflector);
    procedure Validate; //. validate reflector image by camera
    procedure SetFrustum(const pNear,pFar: Extended);
    procedure Move(const dX,dY,dZ: Extended);
    procedure Rotate(const dAngleX,dAngleY,dAngleZ: Extended);
    procedure RotateAroundXY(const pX,pY: Extended; const Angle: Extended);
    procedure SetPosition(const X,Y,Z: Extended);
    procedure SetRotates(const AngleX,AngleY,AngleZ: Extended);
    procedure Setup(const  X,Y,Z: Extended; const AngleX,AngleY,AngleZ: Extended);
    procedure ChangeViewPort(const NewViewPort: TRectangle);
    function Is2DObjectVisiable(const Xmin,Ymin,Xmax,Ymax: Extended; const SquareFactor: Extended): boolean;
    procedure UpdateReflectionWindow(ReflectionWindow: TReflectionWindow);
  end;

  TReflecting = class;

  TGL3DReflector = class(TAbstractReflector)
    ImageListButtons: TImageList;
    StatusPanel: TPanel;
    RxLabel1: TRxLabel;
    edCenterX: TEdit;
    RxLabel2: TRxLabel;
    edCenterY: TEdit;
    Bevel1: TBevel;
    lbReflectionStatus: TLabel;
    Bevel2: TBevel;
    lbSelectedObjName: TRxLabel;
    sbSelectedObjAtCenter: TSpeedButton;
    sbSelectedObjFix: TSpeedButton;
    ToolBar1: TToolBar;
    tbSelectedObjects: TToolButton;
    Menu: TCoolBar;
    ToolBar: TToolBar;
    tbGetTypesManager: TToolButton;
    tbCreateObject: TToolButton;
    ToolBar4: TToolBar;
    ToolButtonEditVisiblePropsObj: TToolButton;
    tbDetailCreate: TToolButton;
    ToolButtonChangeObj: TToolButton;
    ToolButtonCancelPutObj: TToolButton;
    ToolButtonDeleteObj: TToolButton;
    ToolButtonDeletePoint: TToolButton;
    ToolBar2: TToolBar;
    tbElectedPlaces: TToolButton;
    tbElectedObjects: TToolButton;
    ToolBar5: TToolBar;
    ToolButtonPrint: TToolButton;
    ToolBar3: TToolBar;
    tbReflectorConfig: TToolButton;
    ToolButton4: TToolButton;
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ToolButtonPrintClick(Sender: TObject);
    procedure tbElectedPlacesClick(Sender: TObject);
    procedure tbElectedObjectsClick(Sender: TObject);
    procedure tbGetTypesManagerClick(Sender: TObject);
    procedure tbReflectingConfigClick(Sender: TObject);
    procedure sbSelectedObjAtCenterClick(Sender: TObject);
    procedure tbSelectedObjectsClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure FormDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure FormPaint(Sender: TObject);
    procedure tbCreateObjectClick(Sender: TObject);
    procedure edCenterKeyPress(Sender: TObject; var Key: Char);
    procedure FormMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    flReflectionChanged: boolean;

    flMouseRightButtonPressed: boolean;
    flMouseLeftButtonPressed: boolean;
    FXMsLast: integer;
    FYMsLast: integer;
    MouseButtonPressedPosition_X: integer;
    MouseButtonPressedPosition_Y: integer;

    FptrObjDist: TPtr;

    ObjectManager: TForm;
    popupCreateObject: TPopupMenu;

    procedure CreateParams(var Params: TCreateParams); override;
    procedure FormResize(Sender: TObject);
    procedure wmSysCommand(var Message: TMessage); message WM_SYSCOMMAND;
    procedure wmCM_MOUSELEAVE(var Message: TMessage); message CM_MOUSELEAVE;
    procedure WMEraseBkgnd(var Message: TWMEraseBkgnd); message WM_ERASEBKGND;
    procedure ChangeWidthHeight(pWidth,pHeight: integer);
    procedure setPtrSelectedObj(Value: TPtr); override;
  public
    { Public declarations }
    Configuration: TReflectorConfiguration;

    Cameras: TCameras;
    ReflectionWindow: TReflectionWindow;

    Reflecting: TReflecting;

    PanelProps: TForm;
    // LoadedConnectors: TObject;

    //. selected obj
    idSelectedObj: integer;
    SelectedObj_flMoving: boolean;
    //.
    ptrSelectedPointObj: TPtr;

    Constructor Create(pSpace: TProxySpace; pid: integer);
    destructor Destroy; override;
    procedure Loaded; override;

    procedure SelectObj(ptrObj: TPtr); override;
    procedure ShowObjAtCenter(ptrObj: TPtr); override;

    procedure ShowCenterCoords;

    procedure PrintReflection;

    procedure SelectedObj__TPanelProps_Show; override;

    procedure RevisionReflectLocal(const ptrObj: TPtr; const Act: TRevisionAct); override;
    procedure RevisionReflect(const ptrObj: TPtr; const Act: TRevisionAct); override;

    function ReflectionID: longword; override;

    //. эксперименальные
    procedure XOYMoveObjectByReflection(const ptrObj: TPtr; const OrgPoint_X,OrgPoint_Y: integer; const FinPoint_X,FinPoint_Y: integer);

    procedure GetShiftForClone(const OrgPoint: TPoint; out ShiftX,ShiftY: TCrd); override;
  end;

  TObjWinRefl = record
    Xmn,Ymn,
    Xmx,Ymx: smallint;
  end;


  TNumHome = string[4];
  TNumCorps = string[2];
  TNumApartment = string[4];

  TVisibleObjectsProvider = class (TThread)
  private
    Space: TProxySpace;
    RemoteManager: ISpaceRemoteManager;

    procedure Execute; override;
  public
    evtVisibleObjectsGet: THandle;
    evtVisibleObjectsGot: THandle;
    VisibleObjectsGet_X0,VisibleObjectsGet_Y0,
    VisibleObjectsGet_X1,VisibleObjectsGet_Y1,
    VisibleObjectsGet_X2,VisibleObjectsGet_Y2,
    VisibleObjectsGet_X3,VisibleObjectsGet_Y3: Double;
    VisibleObjectsGet_Scale: Double;
    VisibleObjectsGet_MinVisibleSquare: integer;
    VisibleObjectsGet_Data: TByteArray;
    flCallExtendedFunction: boolean;

    Constructor Create(pSpace: TProxySpace);
    destructor Destroy; override;
    procedure GetVisibleObjects(X0: Double; Y0: Double; X1: Double; Y1: Double; X2: Double; Y2: Double; X3: Double; Y3: Double; Scale: Double; MinVisibleSquare: integer; out Data: TByteArray);
    procedure GetVisibleObjectsEx(X0: Double; Y0: Double; X1: Double; Y1: Double; X2: Double; Y2: Double; X3: Double; Y3: Double; Scale: Double; MinVisibleSquare: integer; out Data: TByteArray);
  end;

  TDeletingDump = class;
  TReFormingLays = class;
  TRevising = class;

  TItemLayReflect = record
    ptrNext: pointer;
    ptrObject: TPtr;
    Window: TObjWinRefl;
  end;

  TLayReflect = record
    ptrNext: pointer;
    flLay: boolean; //. если true, то значит слой является основным слоем, а не подслоем
    flTransfered: boolean;
    Objects: pointer;
    ObjectsCount: integer;
    flCompleted: boolean;
  end;

  TReflecting = class(TThread)
  private
    flReflecting: boolean;
    flReflectingCancel: boolean;
    VisibleObjectsProvider: TVisibleObjectsProvider;
  public
    Reflector: TGL3DReflector;
    Lock: TCriticalSection;
    Lays: pointer;
    LaysObjectsCount: integer;
    Scene: TScene;
    Cfg: TObject;
    flReflectNeeded: boolean;
    evtQueryReflect: THandle;
    DeletingDump: TDeletingDump;
    ReFormingLays: TReFormingLays;
    Revising: TRevising;
    ReflectionID: longword;

    Constructor Create(pReflector: TGL3DReflector);
    destructor Destroy; override;

    procedure Validate; //. делает действительными внутренние структуры (BMP,BMPForLimitedReflection,Revising.BMP)
    procedure Obj_GetReflWindow(const ptrObj: TPtr; var Xmin,Ymin,Xmax,Ymax: smallint); overload;
    procedure Obj_GetReflWindow(const Obj_ContainerCoord: TContainerCoord; var Xmn,Ymn,Xmx,Ymx: smallint); overload;
    procedure Execute; override;
    procedure Reflecting;
    procedure ReflectLimitedByTime(const ReflectTimeInterval: integer);
    procedure Reset;
    procedure Reflect;
    procedure ReFresh;
    procedure RecalcReflect;
    procedure RevisionReflect(ptrObj: TPtr; const Act: TRevisionAct);
  end;

  TDeletingDump = class(TThread)
  private
    Reflecting: TReflecting;
  public
    DumpLays: pointer;
    evtQueryDelete: THandle;

    Constructor Create(pReflecting: TReflecting);
    procedure DeletingDump;
    procedure Execute; override;
    destructor Destroy; override;
  end;

  EUnnecessaryExecuting = class(Exception);

  TReFormingLays = class(TThread)
  private
    Reflecting: TReflecting;
  public
    evtQueryReForm: THandle;
    flReforming: boolean;
    flReformingCancel: boolean;

    Constructor Create(pReflecting: TReflecting);
    procedure ReForming;
    procedure PrepareLaysFromRemoteSpace;
    procedure Execute; override;
    destructor Destroy; override;
  end;

  TItemRevising = record
    ptrNext: pointer;
    flValid: boolean;
    ptrObj: TPtr;
    Act: TRevisionAct;
  end;

  TRevising = class(TThread)
  private
    Reflecting: TReflecting;
    flRevising: boolean;
    flCancelRevising: boolean;
    Objects: pointer;
  public
    evtQueryRevision: THandle;

    Constructor Create(pReflecting: TReflecting);
    destructor Destroy; override;
    procedure ReflLays_InsertObj(const ptrptrLay: pointer; const ptrObj: TPtr; const Lay,SubLay: integer; const Obj_Window: TObjWinRefl);
    function ReflLays_RemoveObj(ptrLay: pointer; const ptrObj: TPtr; var Obj_Window: TObjWinRefl): boolean;
    procedure AddObject(pPtrObj: TPtr; const pAct: TRevisionAct);
    procedure Items_Clear;
    procedure Revising;
    procedure Execute; override;
    procedure Reset;
  end;


implementation
uses
  unitEventLog,
  unitLinearMemory,
  Functionality,
  unitNodesApproximator,
  {$IFDEF ExternalTypes}
  SpaceTypes,
  {$ENDIF}
  unitTextInput,
  unitSpaceObjPanelProps,
  ObjectActionsList,
  unitSpaceDesigner,
  unitCreatingObjects,
  unitElected3DPlaces,
  unitElectedObjects,
  unitSelectedObjects,
  unitObject3DReflectingCfg,
  unit3DReflectorCfg;

{$R *.DFM}



{$I Reflecting.inc}


{TReflectionWindow}
Constructor TReflectionWindow.Create(pSpace: TProxySpace; const pReflectionWindowStruc: TReflectionWindowStrucEx);
begin
Inherited Create;
Space:=pSpace;
NodesCount:=4;
X0:=pReflectionWindowStruc.X0*cfTransMeter;
Y0:=pReflectionWindowStruc.Y0*cfTransMeter;
X1:=pReflectionWindowStruc.X1*cfTransMeter;
Y1:=pReflectionWindowStruc.Y1*cfTransMeter;
X2:=pReflectionWindowStruc.X2*cfTransMeter;
Y2:=pReflectionWindowStruc.Y2*cfTransMeter;
X3:=pReflectionWindowStruc.X3*cfTransMeter;
Y3:=pReflectionWindowStruc.Y3*cfTransMeter;
Xmn:=pReflectionWindowStruc.Xmn;
Ymn:=pReflectionWindowStruc.Ymn;
Xmx:=pReflectionWindowStruc.Xmx;
Ymx:=pReflectionWindowStruc.Ymx;
Update;
end;

procedure TReflectionWindow.Update;
begin
Xcenter:=(X0+X2)/2;
Ycenter:=(Y0+Y2)/2;
Xmd:=round((Xmx+Xmn)/2);
Ymd:=round((Ymx+Ymn)/2);
HorRange:=Sqrt(sqr(X1-X0)+sqr(Y1-Y0));
VertRange:=Sqrt(sqr(X3-X0)+sqr(Y3-Y0));
GetMaxMin(ContainerCoord.Xmin,ContainerCoord.Ymin,ContainerCoord.Xmax,ContainerCoord.Ymax);
end;

function TReflectionWindow.SpaceCoordsIsEqual(An: TReflectionWindow): boolean;
begin
Result:=((X0 = An.X0) AND (Y0 = An.Y0) AND  (X1 = An.X1) AND (Y1 = An.Y1) AND  (X2 = An.X2) AND (Y2 = An.Y2) AND  (X3 = An.X3) AND (Y3 = An.Y3));
end;

function TReflectionWindow.IsEqual(An: TReflectionWindow): boolean;
begin
Result:=((X0 = An.X0) AND (Y0 = An.Y0) AND  (X1 = An.X1) AND (Y1 = An.Y1) AND  (X2 = An.X2) AND (Y2 = An.Y2) AND  (X3 = An.X3) AND (Y3 = An.Y3) AND
         (Xmn = An.Xmn) AND (Ymn = An.Ymn) AND (Xmx = An.Xmx) AND (Ymx = An.Ymx))
end;

procedure TReflectionWindow.Assign(Srs: TReflectionWindow);
begin
Space:=Srs.Space;
NodesCount:=Srs.NodesCount;
X0:=Srs.X0;Y0:=Srs.Y0;
X1:=Srs.X1;Y1:=Srs.Y1;
X2:=Srs.X2;Y2:=Srs.Y2;
X3:=Srs.X3;Y3:=Srs.Y3;
X4:=Srs.X0;Y4:=Srs.Y0;
X5:=Srs.X1;Y5:=Srs.Y1;
X6:=Srs.X2;Y6:=Srs.Y2;
X7:=Srs.X3;Y7:=Srs.Y3;
Xcenter:=Srs.Xcenter;Ycenter:=Srs.Ycenter;
Xmn:=Srs.Xmn;Ymn:=Srs.Ymn;
Xmx:=Srs.Xmx;Ymx:=Srs.Ymx;
Xmd:=Srs.Xmd;Ymd:=Srs.Ymd;
HorRange:=Srs.HorRange;
VertRange:=Srs.VertRange;
ContainerCoord:=Srs.ContainerCoord;
end;

procedure TReflectionWindow.GetWindow(const flReal: boolean; var vReflectionWindowStruc: TReflectionWindowStrucEx);
begin
if flReal
 then begin
  vReflectionWindowStruc.X0:=X0/cfTransMeter;vReflectionWindowStruc.Y0:=Y0/cfTransMeter;
  vReflectionWindowStruc.X1:=X1/cfTransMeter;vReflectionWindowStruc.Y1:=Y1/cfTransMeter;
  vReflectionWindowStruc.X2:=X2/cfTransMeter;vReflectionWindowStruc.Y2:=Y2/cfTransMeter;
  vReflectionWindowStruc.X3:=X3/cfTransMeter;vReflectionWindowStruc.Y3:=Y3/cfTransMeter;
  end
 else begin
  vReflectionWindowStruc.X0:=X0;vReflectionWindowStruc.Y0:=Y0;
  vReflectionWindowStruc.X1:=X1;vReflectionWindowStruc.Y1:=Y1;
  vReflectionWindowStruc.X2:=X2;vReflectionWindowStruc.Y2:=Y2;
  vReflectionWindowStruc.X3:=X3;vReflectionWindowStruc.Y3:=Y3;
  end;
vReflectionWindowStruc.Xmn:=Xmn;vReflectionWindowStruc.Ymn:=Ymn;
vReflectionWindowStruc.Xmx:=Xmx;vReflectionWindowStruc.Ymx:=Ymx;
end;

procedure TReflectionWindow.AssignWindow(const ReflectionWindowStruc: TReflectionWindowStrucEx);
begin
NodesCount:=4;
X0:=ReflectionWindowStruc.X0*cfTransMeter;Y0:=ReflectionWindowStruc.Y0*cfTransMeter;
X1:=ReflectionWindowStruc.X1*cfTransMeter;Y1:=ReflectionWindowStruc.Y1*cfTransMeter;
X2:=ReflectionWindowStruc.X2*cfTransMeter;Y2:=ReflectionWindowStruc.Y2*cfTransMeter;
X3:=ReflectionWindowStruc.X3*cfTransMeter;Y3:=ReflectionWindowStruc.Y3*cfTransMeter;
Xmn:=ReflectionWindowStruc.Xmn;Ymn:=ReflectionWindowStruc.Ymn;
Xmx:=ReflectionWindowStruc.Xmx;Ymx:=ReflectionWindowStruc.Ymx;
Update;
end;

function TReflectionWindow.getScale: Extended;
begin
Result:=(Xmx-Xmn)/(Sqrt(sqr(X1-X0)+sqr(Y1-Y0))/cfTransMeter);
end;

procedure TReflectionWindow.Normalize;
var
  diffX1X0,diffY1Y0: Extended;
  b: Extended;
  V: Extended;
  S0_X3,S0_Y3,S1_X3,S1_Y3: Extended;
  S0_X2,S0_Y2,S1_X2,S1_Y2: Extended;
begin
diffX1X0:=X1-X0;
diffY1Y0:=Y1-Y0;
b:=Sqrt(sqr(diffX1X0)+sqr(diffY1Y0))*(Ymx-Ymn)/(Xmx-Xmn);
if Abs(diffY1Y0) > Abs(diffX1X0)
 then begin
  V:=b/Sqrt(1+Sqr(diffX1X0/diffY1Y0));
  S0_X3:=(V)+X0;
  S0_Y3:=(-V)*(diffX1X0/diffY1Y0)+Y0;
  S1_X3:=(-V)+X0;
  S1_Y3:=(V)*(diffX1X0/diffY1Y0)+Y0;

  S0_X2:=(V)+X1;
  S0_Y2:=(-V)*(diffX1X0/diffY1Y0)+Y1;
  S1_X2:=(-V)+X1;
  S1_Y2:=(V)*(diffX1X0/diffY1Y0)+Y1;
  end
 else begin
  V:=b/Sqrt(1+Sqr(diffY1Y0/diffX1X0));
  S0_Y3:=(V)+Y0;
  S0_X3:=(-V)*(diffY1Y0/diffX1X0)+X0;
  S1_Y3:=(-V)+Y0;
  S1_X3:=(V)*(diffY1Y0/diffX1X0)+X0;

  S0_Y2:=(V)+Y1;
  S0_X2:=(-V)*(diffY1Y0/diffX1X0)+X1;
  S1_Y2:=(-V)+Y1;
  S1_X2:=(V)*(diffY1Y0/diffX1X0)+X1;
  end;
if Sqrt(sqr(X3-S0_X3)+sqr(Y3-S0_Y3)) < Sqrt(sqr(X3-S1_X3)+sqr(Y3-S1_Y3))
 then begin
  X3:=S0_X3;
  Y3:=S0_Y3;
  end
 else begin
  X3:=S1_X3;
  Y3:=S1_Y3;
  end;
if Sqrt(sqr(X2-S0_X2)+sqr(Y2-S0_Y2)) < Sqrt(sqr(X2-S1_X2)+sqr(Y2-S1_Y2))
 then begin
  X2:=S0_X2;
  Y2:=S0_Y2;
  end
 else begin
  X2:=S1_X2;
  Y2:=S1_Y2;
  end;
Update;
end;

function TReflectionWindow.IsObjectVisible(const ptrObj: TPtr): boolean;
var
  Obj: TSpaceObj;
begin
Result:=false;
Space.ReadObj(Obj,SizeOf(TSpaceObj), ptrObj);
Result:=IsObjectVisible(Obj);
end;

function TReflectionWindow.IsObjectVisible(const Obj: TSpaceObj): boolean;
var
  flagVisibleObjLine: boolean;
  cntLinesUpCenter,
  cntLinesDownCenter: word;
  ptrptrItemList,ptrItemList: pointer;
  ptrPoint: TPtr;
  Point: TPoint;
  Xl0,Yl0: TCrd;
  flagPreSet: boolean;

  procedure TreatePoint(Xl,Yl: Extended; flagLoop,flagFill: boolean); pascal;
  label MExit;

    function GetPointCrossLineAndMargin(const Xl0,Yl0,Xl1,Yl1, Xm0,Ym0,Xm1,Ym1: Extended; var Xc,Yc: Extended): boolean;
    var
       dXl,dXm,dYl,dYm,Diff,X,Y: Extended;
    begin
    GetPointCrossLineAndMargin:=false;
    dXl:=Xl1-Xl0;dYl:=Yl1-Yl0;
    dXm:=Xm1-Xm0;dYm:=Ym1-Ym0;
    Diff:=dXl*dYm-dYl*dXm;
    if Diff=0 then Exit;
    X:=((Yl1-Ym1)*dXm*dXl+Xm1*dYm*dXl-Xl1*dYl*dXm)/Diff;
    if abs(Xm0-Xm1) > abs(Ym0-Ym1)
     then
      begin
      if (((X > Xm0) and (X > Xm1)) or ((X < Xm0) and (X < Xm1))) or ((X-Xm1) = 0) then Exit;
      Y:=((Xl1-Xm1)*dYm*dYl+Ym1*dXm*dYl-Yl1*dXl*dYm)/(-Diff);
      end
     else
      begin
      Y:=((Xl1-Xm1)*dYm*dYl+Ym1*dXm*dYl-Yl1*dXl*dYm)/(-Diff);
      if (((Y > Ym0) and (Y > Ym1)) or ((Y < Ym0) and (Y < Ym1))) or ((Y-Ym1) = 0) then Exit;
      end;

    Xc:=X;
    Yc:=Y;
    GetPointCrossLineAndMargin:=true;
    end;

    var
     FlagUseOutLinePoint0: boolean;
     OutLinePoint0X,
     OutLinePoint0Y,
     OutLinePoint1X,
     OutLinePoint1Y: Extended;

    function TreatePointAndLine(Xc,Yc: Extended): boolean;
    var
       C,QdC,A1,QdA2,QdB2,H: Extended;
       L: Extended;
       Xs0,Ys0,Xs1,Ys1: word;

    begin
    Result:=false;
    if FlagUseOutLinePoint0
     then
      begin
      Result:=true;
      OutLinePoint1X:=Xc;
      OutLinePoint1Y:=Yc;

      if abs(Xl-Xl0)>abs(Yl-Yl0)
       then
        begin
        if ((OutLinePoint0X <= Xl0) and (Xl0 < OutLinePoint1X)) or ((OutLinePoint0X >= Xl0) and (Xl0 > OutLinePoint1X))
         then
          begin
          if ((OutLinePoint0X <= Xl) and (Xl < OutLinePoint1X)) or ((OutLinePoint0X >= Xl) and (Xl > OutLinePoint1X))
           then
            begin
            OutLinePoint0X:=Xl0;
            OutLinePoint1X:=Xl;
            OutLinePoint0Y:=Yl0;
            OutLinePoint1Y:=Yl;
            end
           else
            begin
            if ((OutLinePoint0X > Xl0) and (OutLinePoint0X > Xl)) or ((OutLinePoint0X < Xl0) and (OutLinePoint0X < Xl))
             then
              begin
              OutLinePoint0X:=Xl0;
              OutLinePoint0Y:=Yl0;
              end
             else
              begin
              OutLinePoint1X:=Xl0;
              OutLinePoint1Y:=Yl0;
              end
            end
          end
         else
          begin
          if ((OutLinePoint0X <= Xl) and (Xl < OutLinePoint1X)) or ((OutLinePoint0X >= Xl) and (Xl > OutLinePoint1X))
           then
            begin
            if ((OutLinePoint1X > Xl0) and (OutLinePoint1X > Xl)) or ((OutLinePoint1X < Xl0) and (OutLinePoint1X < Xl))
             then
              begin
              OutLinePoint1X:=Xl;
              OutLinePoint1Y:=Yl;
              end
             else
              begin
              OutLinePoint0X:=Xl;
              OutLinePoint0Y:=Yl;
              end
            end
           else
            if not ( (((Xl0 < OutLinePoint0X) and (OutLinePoint0X < Xl)) or ((Xl0 > OutLinePoint1X) and (OutLinePoint0X > Xl))) and (((OutLinePoint1X < Xl0) and (OutLinePoint0X > Xl)) or ((OutLinePoint1X > Xl0) and (OutLinePoint0X < Xl))) ) then Exit;
          end;
        end
       else
        begin
        if ((OutLinePoint0Y <= Yl0) and (Yl0 < OutLinePoint1Y)) or ((OutLinePoint0Y >= Yl0) and (Yl0 > OutLinePoint1Y))
         then
          begin
          if ((OutLinePoint0Y <= Yl) and (Yl < OutLinePoint1Y)) or ((OutLinePoint0Y >= Yl) and (Yl > OutLinePoint1Y))
           then
            begin
            OutLinePoint0X:=Xl0;
            OutLinePoint1X:=Xl;
            OutLinePoint0Y:=Yl0;
            OutLinePoint1Y:=Yl;
            end
           else
            begin
            if ((OutLinePoint0Y > Yl0) and (OutLinePoint0Y > Yl)) or ((OutLinePoint0Y < Yl0) and (OutLinePoint0Y < Yl))
             then
              begin
              OutLinePoint0X:=Xl0;
              OutLinePoint0Y:=Yl0;
              end
             else
              begin
              OutLinePoint1X:=Xl0;
              OutLinePoint1Y:=Yl0;
              end
            end
          end
         else
          begin
          if ((OutLinePoint0Y <= Yl) and (Yl < OutLinePoint1Y)) or ((OutLinePoint0Y >= Yl) and (Yl > OutLinePoint1Y))
           then
            begin
            if ((OutLinePoint1Y > Yl0) and (OutLinePoint1Y > Yl)) or ((OutLinePoint1Y < Yl0) and (OutLinePoint1Y < Yl))
             then
              begin
              OutLinePoint1X:=Xl;
              OutLinePoint1Y:=Yl;
              end
             else
              begin
              OutLinePoint0X:=Xl;
              OutLinePoint0Y:=Yl;
              end
            end
           else
            if not ( (((Yl0 < OutLinePoint0Y) and (OutLinePoint0Y < Yl)) or ((Yl0 > OutLinePoint1Y) and (OutLinePoint0Y > Yl))) and (((OutLinePoint1Y < Yl0) and (OutLinePoint0Y > Yl)) or ((OutLinePoint1Y > Yl0) and (OutLinePoint0Y < Yl))) ) then Exit;
          end;
        end;

      flagVisibleObjLine:=true;
      end
     else
      begin
      OutLinePoint0X:=Xc;
      OutLinePoint0Y:=Yc;
      FlagUseOutLinePoint0:=true;
      end;
    end;


  var
     Xc,Yc: Extended;
     dX: extended;
  begin
  Xl:=Xl*cfTransMeter;
  Yl:=Yl*cfTransMeter;
  if not flagPreSet
   then begin
    flagUseOutLinePoint0:=false;
    if GetPointCrossLineAndMargin(Xl0,Yl0,Xl,Yl, X0,Y0,X1,Y1, Xc,Yc)
     then
      TreatePointAndLine(Xc,Yc);

    if GetPointCrossLineAndMargin(Xl0,Yl0,Xl,Yl, X1,Y1,X2,Y2, Xc,Yc)
     then
      if TreatePointAndLine(Xc,Yc) then GoTo MExit;

    if GetPointCrossLineAndMargin(Xl0,Yl0,Xl,Yl, X2,Y2,X3,Y3, Xc,Yc)
     then
      if TreatePointAndLine(Xc,Yc) then GoTo MExit;

    case NodesCount of
    4: begin
      if GetPointCrossLineAndMargin(Xl0,Yl0,Xl,Yl, X3,Y3,X0,Y0, Xc,Yc)
       then
        if TreatePointAndLine(Xc,Yc) then GoTo MExit;
      end;
    5: begin
      if GetPointCrossLineAndMargin(Xl0,Yl0,Xl,Yl, X3,Y3,X4,Y4, Xc,Yc)
       then
        if TreatePointAndLine(Xc,Yc) then GoTo MExit;
      if GetPointCrossLineAndMargin(Xl0,Yl0,Xl,Yl, X4,Y4,X0,Y0, Xc,Yc)
       then
        if TreatePointAndLine(Xc,Yc) then GoTo MExit;
      end;
    6: begin
      if GetPointCrossLineAndMargin(Xl0,Yl0,Xl,Yl, X3,Y3,X4,Y4, Xc,Yc)
       then
        if TreatePointAndLine(Xc,Yc) then GoTo MExit;
      if GetPointCrossLineAndMargin(Xl0,Yl0,Xl,Yl, X4,Y4,X5,Y5, Xc,Yc)
       then
        if TreatePointAndLine(Xc,Yc) then GoTo MExit;
      if GetPointCrossLineAndMargin(Xl0,Yl0,Xl,Yl, X5,Y5,X0,Y0, Xc,Yc)
       then
        if TreatePointAndLine(Xc,Yc) then GoTo MExit;
      end;
    7: begin
      if GetPointCrossLineAndMargin(Xl0,Yl0,Xl,Yl, X3,Y3,X4,Y4, Xc,Yc)
       then
        if TreatePointAndLine(Xc,Yc) then GoTo MExit;
      if GetPointCrossLineAndMargin(Xl0,Yl0,Xl,Yl, X4,Y4,X5,Y5, Xc,Yc)
       then
        if TreatePointAndLine(Xc,Yc) then GoTo MExit;
      if GetPointCrossLineAndMargin(Xl0,Yl0,Xl,Yl, X5,Y5,X6,Y6, Xc,Yc)
       then
        if TreatePointAndLine(Xc,Yc) then GoTo MExit;
      if GetPointCrossLineAndMargin(Xl0,Yl0,Xl,Yl, X6,Y6,X0,Y0, Xc,Yc)
       then
        if TreatePointAndLine(Xc,Yc) then GoTo MExit;
      end;
    8: begin
      if GetPointCrossLineAndMargin(Xl0,Yl0,Xl,Yl, X3,Y3,X4,Y4, Xc,Yc)
       then
        if TreatePointAndLine(Xc,Yc) then GoTo MExit;
      if GetPointCrossLineAndMargin(Xl0,Yl0,Xl,Yl, X4,Y4,X5,Y5, Xc,Yc)
       then
        if TreatePointAndLine(Xc,Yc) then GoTo MExit;
      if GetPointCrossLineAndMargin(Xl0,Yl0,Xl,Yl, X5,Y5,X6,Y6, Xc,Yc)
       then
        if TreatePointAndLine(Xc,Yc) then GoTo MExit;
      if GetPointCrossLineAndMargin(Xl0,Yl0,Xl,Yl, X6,Y6,X7,Y7, Xc,Yc)
       then
        if TreatePointAndLine(Xc,Yc) then GoTo MExit;
      if GetPointCrossLineAndMargin(Xl0,Yl0,Xl,Yl, X7,Y7,X0,Y0, Xc,Yc)
       then
        if TreatePointAndLine(Xc,Yc) then GoTo MExit;
      end;
    end;

    MExit:
    {проверка пересечения линии и оси X , проходящей через точку Xcenter,Ycenter}
    if (NOT flagVisibleObjLine) AND flagLoop AND flagFill
     then begin
      if (Xcenter-Xl0)*(Xcenter-Xl) <= 0
       then begin
        dX:=Xl-Xl0;
        if dX <> 0
         then begin
          Yc:=Yl0+(Xcenter-Xl0)*(Yl-Yl0)/dX;
          if Yc >= Ycenter
           then
            inc(cntLinesUpCenter)
           else
            inc(cntLinesDownCenter);
          end;
        end;
      end;

    Xl0:=Xl;
    Yl0:=Yl;
    end
   else begin
    Xl0:=Xl;
    Yl0:=Yl;
    flagPreSet:=false;
    end
  end;

var
  I: integer;
begin
Result:=false;
flagVisibleObjLine:=false;
ptrPoint:=Obj.ptrFirstPoint;
cntLinesUpCenter:=0;
cntLinesDownCenter:=0;
flagPreSet:=true;
while ptrPoint <> nilPtr do begin
  Space.ReadObj(Point,SizeOf(TPoint), ptrPoint);
  try TreatePoint(Point.X,Point.Y, Obj.flagLoop,Obj.flagFill); except end;
  if flagVisibleObjLine
   then begin
    Result:=true;
    Exit; //. ->
    end;
  ptrPoint:=Point.ptrNextObj;
  end;
if Obj.flagLoop
 then begin
  ptrPoint:=Obj.ptrFirstPoint;
  if ptrPoint <> nilPtr
   then begin
    Space.ReadObj(Point,SizeOf(TPoint), ptrPoint);
    try TreatePoint(Point.X,Point.Y, Obj.flagLoop,Obj.flagFill) except end;
    if flagVisibleObjLine
     then begin
      Result:=true;
      Exit; //. ->
      end;
    end;
  if (Obj.flagFill AND (((cntLinesUpCenter MOD 2) > 0) AND ((cntLinesDownCenter MOD 2) > 0)))
   then begin
    Result:=true;
    Exit;// ->
    end;
  end;
if Obj.Width > 0
 then with TSpaceObjPolylinePolygon.Create(Space,Obj) do begin
  flagVisibleObjLine:=false;
  cntLinesUpCenter:=0;
  cntLinesDownCenter:=0;
  flagPreSet:=true;
  for I:=0 to Count-1 do begin
    try TreatePoint(Nodes[I].X,Nodes[I].Y, true,true); except end;
    if flagVisibleObjLine
     then begin
      Result:=true;
      Destroy;
      Exit;// ->
      end;
    end;
  try TreatePoint(Nodes[0].X,Nodes[0].Y, true,true); except end;
  if flagVisibleObjLine
   then begin
    Result:=true;
    Destroy;
    Exit;// ->
    end;
  if (((cntLinesUpCenter MOD 2) > 0) AND ((cntLinesDownCenter MOD 2) > 0))
   then Result:=true;
  Destroy;
  end;
end;

function TReflectionWindow.IsObjectOutside(const Obj_ContainerCoord: TContainerCoord): boolean;
var
  flagVisibleObjLine: boolean;
  cntLinesUpCenter,
  cntLinesDownCenter: word;
  Xl0,Yl0: TCrd;
  flagPreSet: boolean;

  procedure TreatePoint(Xl,Yl: Extended);
  label MExit;

    function GetPointCrossLineAndMargin(Xl0,Yl0,Xl1,Yl1, Xm0,Ym0,Xm1,Ym1: Extended; var Xc,Yc: Extended): boolean;
    var
       dXl,dXm,dYl,dYm,Diff,X,Y: Extended;
    begin
    GetPointCrossLineAndMargin:=false;
    dXl:=Xl1-Xl0;dYl:=Yl1-Yl0;
    dXm:=Xm1-Xm0;dYm:=Ym1-Ym0;
    Diff:=dXl*dYm-dYl*dXm;
    if Diff=0 then Exit;
    X:=((Yl1-Ym1)*dXm*dXl+Xm1*dYm*dXl-Xl1*dYl*dXm)/Diff;
    if abs(Xm0-Xm1)>abs(Ym0-Ym1)
     then
      begin
      if (((X > Xm0) and (X > Xm1)) or ((X < Xm0) and (X < Xm1))) or ((X-Xm1) = 0) then Exit;
      Y:=((Xl1-Xm1)*dYm*dYl+Ym1*dXm*dYl-Yl1*dXl*dYm)/(-Diff);
      end
     else
      begin
      Y:=((Xl1-Xm1)*dYm*dYl+Ym1*dXm*dYl-Yl1*dXl*dYm)/(-Diff);
      if (((Y > Ym0) and (Y > Ym1)) or ((Y < Ym0) and (Y < Ym1))) or ((Y-Ym1) = 0) then Exit;
      end;

    Xc:=X;
    Yc:=Y;
    GetPointCrossLineAndMargin:=true;
    end;

    var
     FlagUseOutLinePoint0: boolean;
     OutLinePoint0X,
     OutLinePoint0Y,
     OutLinePoint1X,
     OutLinePoint1Y: Extended;

    function TreatePointAndLine(Xc,Yc: Extended): boolean;
    var
       C,QdC,A1,QdA2,QdB2,H: Extended;
       L: Extended;
       Xs0,Ys0,Xs1,Ys1: word;

    begin
    Result:=false;
    if FlagUseOutLinePoint0
     then
      begin
      Result:=true;
      OutLinePoint1X:=Xc;
      OutLinePoint1Y:=Yc;

      if abs(Xl-Xl0) > abs(Yl-Yl0)
       then
        begin
        if ((OutLinePoint0X <= Xl0) and (Xl0 < OutLinePoint1X)) or ((OutLinePoint0X >= Xl0) and (Xl0 > OutLinePoint1X))
         then
          begin
          if ((OutLinePoint0X <= Xl) and (Xl < OutLinePoint1X)) or ((OutLinePoint0X >= Xl) and (Xl > OutLinePoint1X))
           then
            begin
            OutLinePoint0X:=Xl0;
            OutLinePoint1X:=Xl;
            OutLinePoint0Y:=Yl0;
            OutLinePoint1Y:=Yl;
            end
           else
            begin
            if ((OutLinePoint0X > Xl0) and (OutLinePoint0X > Xl)) or ((OutLinePoint0X < Xl0) and (OutLinePoint0X < Xl))
             then
              begin
              OutLinePoint0X:=Xl0;
              OutLinePoint0Y:=Yl0;
              end
             else
              begin
              OutLinePoint1X:=Xl0;
              OutLinePoint1Y:=Yl0;
              end
            end
          end
         else
          begin
          if ((OutLinePoint0X <= Xl) and (Xl < OutLinePoint1X)) or ((OutLinePoint0X >= Xl) and (Xl > OutLinePoint1X))
           then
            begin
            if ((OutLinePoint1X > Xl0) and (OutLinePoint1X > Xl)) or ((OutLinePoint1X < Xl0) and (OutLinePoint1X < Xl))
             then
              begin
              OutLinePoint1X:=Xl;
              OutLinePoint1Y:=Yl;
              end
             else
              begin
              OutLinePoint0X:=Xl;
              OutLinePoint0Y:=Yl;
              end
            end
           else
            if not ( (((Xl0 < OutLinePoint0X) and (OutLinePoint0X < Xl)) or ((Xl0 > OutLinePoint1X) and (OutLinePoint0X > Xl))) and (((OutLinePoint1X < Xl0) and (OutLinePoint0X > Xl)) or ((OutLinePoint1X > Xl0) and (OutLinePoint0X < Xl))) ) then Exit;
          end;
        end
       else
        begin
        if ((OutLinePoint0Y <= Yl0) and (Yl0 < OutLinePoint1Y)) or ((OutLinePoint0Y >= Yl0) and (Yl0 > OutLinePoint1Y))
         then
          begin
          if ((OutLinePoint0Y <= Yl) and (Yl < OutLinePoint1Y)) or ((OutLinePoint0Y >= Yl) and (Yl > OutLinePoint1Y))
           then
            begin
            OutLinePoint0X:=Xl0;
            OutLinePoint1X:=Xl;
            OutLinePoint0Y:=Yl0;
            OutLinePoint1Y:=Yl;
            end
           else
            begin
            if ((OutLinePoint0Y > Yl0) and (OutLinePoint0Y > Yl)) or ((OutLinePoint0Y < Yl0) and (OutLinePoint0Y < Yl))
             then
              begin
              OutLinePoint0X:=Xl0;
              OutLinePoint0Y:=Yl0;
              end
             else
              begin
              OutLinePoint1X:=Xl0;
              OutLinePoint1Y:=Yl0;
              end
            end
          end
         else
          begin
          if ((OutLinePoint0Y <= Yl) and (Yl < OutLinePoint1Y)) or ((OutLinePoint0Y >= Yl) and (Yl > OutLinePoint1Y))
           then
            begin
            if ((OutLinePoint1Y > Yl0) and (OutLinePoint1Y > Yl)) or ((OutLinePoint1Y < Yl0) and (OutLinePoint1Y < Yl))
             then
              begin
              OutLinePoint1X:=Xl;
              OutLinePoint1Y:=Yl;
              end
             else
              begin
              OutLinePoint0X:=Xl;
              OutLinePoint0Y:=Yl;
              end
            end
           else
            if not ( (((Yl0 < OutLinePoint0Y) and (OutLinePoint0Y < Yl)) or ((Yl0 > OutLinePoint1Y) and (OutLinePoint0Y > Yl))) and (((OutLinePoint1Y < Yl0) and (OutLinePoint0Y > Yl)) or ((OutLinePoint1Y > Yl0) and (OutLinePoint0Y < Yl))) ) then Exit;
          end;
        end;

      flagVisibleObjLine:=true;
      end
     else
      begin
      OutLinePoint0X:=Xc;
      OutLinePoint0Y:=Yc;
      FlagUseOutLinePoint0:=true;
      end;
    end;


  var
     Xc,Yc: Extended;
     dX: extended;

  begin
  Xl:=Xl*cfTransMeter;
  Yl:=Yl*cfTransMeter;
  if not flagPreSet
   then begin
    flagUseOutLinePoint0:=false;
    if GetPointCrossLineAndMargin(Xl0,Yl0,Xl,Yl, X0,Y0,X1,Y1, Xc,Yc)
     then
      TreatePointAndLine(Xc,Yc);

    if GetPointCrossLineAndMargin(Xl0,Yl0,Xl,Yl, X1,Y1,X2,Y2, Xc,Yc)
     then
      if TreatePointAndLine(Xc,Yc) then GoTo MExit;

    if GetPointCrossLineAndMargin(Xl0,Yl0,Xl,Yl, X2,Y2,X3,Y3, Xc,Yc)
     then
      if TreatePointAndLine(Xc,Yc) then GoTo MExit;

    case NodesCount of
    4: begin
      if GetPointCrossLineAndMargin(Xl0,Yl0,Xl,Yl, X3,Y3,X0,Y0, Xc,Yc)
       then
        if TreatePointAndLine(Xc,Yc) then GoTo MExit;
      end;
    5: begin
      if GetPointCrossLineAndMargin(Xl0,Yl0,Xl,Yl, X3,Y3,X4,Y4, Xc,Yc)
       then
        if TreatePointAndLine(Xc,Yc) then GoTo MExit;
      if GetPointCrossLineAndMargin(Xl0,Yl0,Xl,Yl, X4,Y4,X0,Y0, Xc,Yc)
       then
        if TreatePointAndLine(Xc,Yc) then GoTo MExit;
      end;
    6: begin
      if GetPointCrossLineAndMargin(Xl0,Yl0,Xl,Yl, X3,Y3,X4,Y4, Xc,Yc)
       then
        if TreatePointAndLine(Xc,Yc) then GoTo MExit;
      if GetPointCrossLineAndMargin(Xl0,Yl0,Xl,Yl, X4,Y4,X5,Y5, Xc,Yc)
       then
        if TreatePointAndLine(Xc,Yc) then GoTo MExit;
      if GetPointCrossLineAndMargin(Xl0,Yl0,Xl,Yl, X5,Y5,X0,Y0, Xc,Yc)
       then
        if TreatePointAndLine(Xc,Yc) then GoTo MExit;
      end;
    7: begin
      if GetPointCrossLineAndMargin(Xl0,Yl0,Xl,Yl, X3,Y3,X4,Y4, Xc,Yc)
       then
        if TreatePointAndLine(Xc,Yc) then GoTo MExit;
      if GetPointCrossLineAndMargin(Xl0,Yl0,Xl,Yl, X4,Y4,X5,Y5, Xc,Yc)
       then
        if TreatePointAndLine(Xc,Yc) then GoTo MExit;
      if GetPointCrossLineAndMargin(Xl0,Yl0,Xl,Yl, X5,Y5,X6,Y6, Xc,Yc)
       then
        if TreatePointAndLine(Xc,Yc) then GoTo MExit;
      if GetPointCrossLineAndMargin(Xl0,Yl0,Xl,Yl, X6,Y6,X0,Y0, Xc,Yc)
       then
        if TreatePointAndLine(Xc,Yc) then GoTo MExit;
      end;
    8: begin
      if GetPointCrossLineAndMargin(Xl0,Yl0,Xl,Yl, X3,Y3,X4,Y4, Xc,Yc)
       then
        if TreatePointAndLine(Xc,Yc) then GoTo MExit;
      if GetPointCrossLineAndMargin(Xl0,Yl0,Xl,Yl, X4,Y4,X5,Y5, Xc,Yc)
       then
        if TreatePointAndLine(Xc,Yc) then GoTo MExit;
      if GetPointCrossLineAndMargin(Xl0,Yl0,Xl,Yl, X5,Y5,X6,Y6, Xc,Yc)
       then
        if TreatePointAndLine(Xc,Yc) then GoTo MExit;
      if GetPointCrossLineAndMargin(Xl0,Yl0,Xl,Yl, X6,Y6,X7,Y7, Xc,Yc)
       then
        if TreatePointAndLine(Xc,Yc) then GoTo MExit;
      if GetPointCrossLineAndMargin(Xl0,Yl0,Xl,Yl, X7,Y7,X0,Y0, Xc,Yc)
       then
        if TreatePointAndLine(Xc,Yc) then GoTo MExit;
      end;
    end;

    MExit:
    {проверка пересечения линии и оси X , проходящей через точку Xcenter,Ycenter}
    if NOT flagVisibleObjLine
     then begin
      if (Xcenter-Xl0)*(Xcenter-Xl) <= 0
       then begin
        dX:=Xl-Xl0;
        if dX <> 0
         then begin
          Yc:=Yl0+(Xcenter-Xl0)*(Yl-Yl0)/dX;
          if Yc >= Ycenter
           then
            inc(cntLinesUpCenter)
           else
            inc(cntLinesDownCenter);
          end;
        end;
      end;

    Xl0:=Xl;
    Yl0:=Yl;
    end
   else begin
    Xl0:=Xl;
    Yl0:=Yl;
    flagPreSet:=false;
    end
  end;

begin
Result:=false;
// поиск краев
with Obj_ContainerCoord do begin
flagVisibleObjLine:=false;
cntLinesUpCenter:=0;
cntLinesDownCenter:=0;
flagPreSet:=true;
try TreatePoint(Xmin,Ymin); except end;
try TreatePoint(Xmax,Ymin); except end;
if flagVisibleObjLine then Exit;
try TreatePoint(Xmax,Ymax); except end;
if flagVisibleObjLine then Exit;
try TreatePoint(Xmin,Ymax); except end;
if flagVisibleObjLine then Exit;
try TreatePoint(Xmin,Ymin); except end;
if flagVisibleObjLine then Exit;
if (((cntLinesUpCenter MOD 2) > 0) AND ((cntLinesDownCenter MOD 2) > 0)) then Exit;
end;
Result:=true;
end;

procedure TReflectionWindow.GetMaxMin(var Xmin,Ymin,Xmax,Ymax: Extended);
begin
Xmin:=X0;Ymin:=Y0;Xmax:=X0;Ymax:=Y0;
if X1 < Xmin
 then Xmin:=X1
 else
  if X1 > Xmax
   then Xmax:=X1;
if Y1 < Ymin
 then Ymin:=Y1
 else
  if Y1 > Ymax
   then Ymax:=Y1;
if X2 < Xmin
 then Xmin:=X2
 else
  if X2 > Xmax
   then Xmax:=X2;
if Y2 < Ymin
 then Ymin:=Y2
 else
  if Y2 > Ymax
   then Ymax:=Y2;
if X3 < Xmin
 then Xmin:=X3
 else
  if X3 > Xmax
   then Xmax:=X3;
if Y3 < Ymin
 then Ymin:=Y3
 else
  if Y3 > Ymax
   then Ymax:=Y3;
case NodesCount of
5: begin
  if X4 < Xmin
   then Xmin:=X4
   else
    if X4 > Xmax
     then Xmax:=X4;
  if Y4 < Ymin
   then Ymin:=Y4
   else
    if Y4 > Ymax
     then Ymax:=Y4;
  end;
6: begin
  if X4 < Xmin
   then Xmin:=X4
   else
    if X4 > Xmax
     then Xmax:=X4;
  if Y4 < Ymin
   then Ymin:=Y4
   else
    if Y4 > Ymax
     then Ymax:=Y4;
  if X5 < Xmin
   then Xmin:=X5
   else
    if X5 > Xmax
     then Xmax:=X5;
  if Y5 < Ymin
   then Ymin:=Y5
   else
    if Y5 > Ymax
     then Ymax:=Y5;
  end;
7: begin
  if X4 < Xmin
   then Xmin:=X4
   else
    if X4 > Xmax
     then Xmax:=X4;
  if Y4 < Ymin
   then Ymin:=Y4
   else
    if Y4 > Ymax
     then Ymax:=Y4;
  if X5 < Xmin
   then Xmin:=X5
   else
    if X5 > Xmax
     then Xmax:=X5;
  if Y5 < Ymin
   then Ymin:=Y5
   else
    if Y5 > Ymax
     then Ymax:=Y5;
  if X6 < Xmin
   then Xmin:=X6
   else
    if X6 > Xmax
     then Xmax:=X6;
  if Y6 < Ymin
   then Ymin:=Y6
   else
    if Y6 > Ymax
     then Ymax:=Y6;
  end;
8: begin
  if X4 < Xmin
   then Xmin:=X4
   else
    if X4 > Xmax
     then Xmax:=X4;
  if Y4 < Ymin
   then Ymin:=Y4
   else
    if Y4 > Ymax
     then Ymax:=Y4;
  if X5 < Xmin
   then Xmin:=X5
   else
    if X5 > Xmax
     then Xmax:=X5;
  if Y5 < Ymin
   then Ymin:=Y5
   else
    if Y5 > Ymax
     then Ymax:=Y5;
  if X6 < Xmin
   then Xmin:=X6
   else
    if X6 > Xmax
     then Xmax:=X6;
  if Y6 < Ymin
   then Ymin:=Y6
   else
    if Y6 > Ymax
     then Ymax:=Y6;
  if X7 < Xmin
   then Xmin:=X7
   else
    if X7 > Xmax
     then Xmax:=X7;
  if Y7 < Ymin
   then Ymin:=Y7
   else
    if Y7 > Ymax
     then Ymax:=Y7;
  end;
end;

Xmin:=Xmin/CfTransMeter;
Ymin:=Ymin/CfTransMeter;
Xmax:=Xmax/CfTransMeter;
Ymax:=Ymax/CfTransMeter;
end;

function ContainerCoord_IsObjectOutside(const Coords: TContainerCoord;const Obj_ContainerCoord: TContainerCoord): boolean;
begin
Result:=true;
with Obj_ContainerCoord do begin
if ((Xmax < Coords.Xmin) OR (Xmin > Coords.Xmax)
      OR
    (Ymax < Coords.Ymin) OR (Ymin > Coords.Ymax))
 then Exit; //. ->
end;
Result:=false;
end;

function TReflectionWindow.IsObjectVisible(const Obj_ContainerSquare: Extended; const Obj_ContainerCoord: TContainerCoord; const ptrObj: TPtr): boolean;
begin
Result:=false;
{/// - if Obj_ContainerSquare*Sqr(Scale) > Reflection_VisibleFactor //фактор минимально видимой площади
 then}
  if NOT ContainerCoord_IsObjectOutside(ContainerCoord, Obj_ContainerCoord)
   then
    if NOT IsObjectOutside(Obj_ContainerCoord)
     then
      if IsObjectVisible(ptrObj) //. окончательная проверка на видимость
       then Result:=true;
end;


{TReflectorConfig}
Constructor TReflectorConfiguration.Create(pReflector: TGL3DReflector);
begin
Inherited Create;
Reflector:=pReflector;
Open;
end;

destructor TReflectorConfiguration.Destroy;
begin
Save;
Inherited;
end;

procedure TReflectorConfiguration.Open;
var
  FileStream: TFileStream;
  MemoryStream: TMemoryStream;
  BA: TByteArray;

  procedure ReadFromStream(Stream: TStream);
  begin
  try
  with Stream do begin
  //. read active camera parameters
  Read(Translate_X,SizeOf(Translate_X));
  Read(Translate_Y,SizeOf(Translate_Y));
  Read(Translate_Z,SizeOf(Translate_Z));
  Read(Rotate_AngleX,SizeOf(Rotate_AngleX));
  Read(Rotate_AngleY,SizeOf(Rotate_AngleY));
  Read(Rotate_AngleZ,SizeOf(Rotate_AngleZ));
  //. read Reflector layout
  Read(Left,SizeOf(Left));
  Read(Top,SizeOf(Top));
  Read(Width,SizeOf(Width));
  Read(Height,SizeOf(Height));
  //. read reflector flags
  Read(flHideControlBars,SizeOf(flHideControlBars));
  Read(flHideControlPage,SizeOf(flHideControlPage));
  Read(flHideBookmarksPage,SizeOf(flHideBookmarksPage));
  Read(flHideEditPage,SizeOf(flHideEditPage));
  Read(flHideViewPage,SizeOf(flHideViewPage));
  Read(flHideOtherPage,SizeOf(flHideOtherPage));
  Read(flHideCreateButton,SizeOf(flHideCreateButton));
  Read(flDisableNavigate,SizeOf(flDisableNavigate));
  Read(flDisableMoveNavigate,SizeOf(flDisableMoveNavigate));
  end;
  except
    On E: Exception do EventLog.WriteMajorEvent('ReflectorConfiguration','Cannot read reflector all configuration (idReflector = '+IntToStr(Reflector.ID)+').',E.Message);
    end;
  end;

begin
//. read default
FileStream:=TFileStream.Create(tnReflectorConfiguration,fmOpenRead);
try
ReadFromStream(FileStream);
finally
FileStream.Destroy;
end;
//. read user-defined config
with GetISpaceUserReflector(Reflector.Space.SOAPServerURL) do
if Get_Config(Reflector.Space.UserName,Reflector.Space.UserPassword,Reflector.id,BA)
 then begin
  MemoryStream:=TMemoryStream.Create;
  try
  ByteArray_PrepareStream(BA,TStream(MemoryStream));
  ReadFromStream(MemoryStream);
  finally
  MemoryStream.Destroy;
  end;
  end;
end;
procedure TReflectorConfiguration.Save;
var
  FileStream: TFileStream;
  MemoryStream: TMemoryStream;
  BA: TByteArray;

  procedure WriteIntoStream(Stream: TStream);
  begin
  with Stream do begin
  //. write active camera parameters
  Write(Translate_X,SizeOf(Translate_X));
  Write(Translate_Y,SizeOf(Translate_Y));
  Write(Translate_Z,SizeOf(Translate_Z));
  Write(Rotate_AngleX,SizeOf(Rotate_AngleX));
  Write(Rotate_AngleY,SizeOf(Rotate_AngleY));
  Write(Rotate_AngleZ,SizeOf(Rotate_AngleZ));
  //. write Reflector layout
  Write(Left,SizeOf(Left));
  Write(Top,SizeOf(Top));
  Write(Width,SizeOf(Width));
  Write(Height,SizeOf(Height));
  //. write reflector flags
  Write(flHideControlBars,SizeOf(flHideControlBars));
  Write(flHideControlPage,SizeOf(flHideControlPage));
  Write(flHideBookmarksPage,SizeOf(flHideBookmarksPage));
  Write(flHideEditPage,SizeOf(flHideEditPage));
  Write(flHideViewPage,SizeOf(flHideViewPage));
  Write(flHideOtherPage,SizeOf(flHideOtherPage));
  Write(flHideCreateButton,SizeOf(flHideCreateButton));
  Write(flDisableNavigate,SizeOf(flDisableNavigate));
  Write(flDisableMoveNavigate,SizeOf(flDisableMoveNavigate));
 end;
  end;

begin
UpdateByReflector;
//. write default config
FileStream:=TFileStream.Create(tnReflectorConfiguration,fmOpenWrite);
try
WriteIntoStream(FileStream);
finally
FileStream.Destroy;
end;
//. write user defined config
MemoryStream:=TMemoryStream.Create;
try
WriteIntoStream(MemoryStream);
with GetISpaceUserReflector(Reflector.Space.SOAPServerURL) do begin
ByteArray_PrepareFromStream(BA,TStream(MemoryStream));
Set_Config(Reflector.Space.UserName,Reflector.Space.UserPassword,Reflector.id,BA);
end;
finally
MemoryStream.Destroy;
end;
end;

procedure TReflectorConfiguration.Validate;
begin
//. change layout by config
Reflector.Left:=Left;
Reflector.Top:=Top;
Reflector.Width:=Width;
Reflector.Height:=Height;
//. change active camera by config
Reflector.Cameras.ActiveCamera.Setup(Translate_X,Translate_Y,Translate_Z,Rotate_AngleX,Rotate_AngleY,Rotate_AngleZ);
//. setting by Reflector Flags
ValidateFlags;
end;

procedure TReflectorConfiguration.ValidateFlags;
begin
//. setting by Reflector Flags
with Reflector do begin
if flHideControlBars
 then begin
  Menu.Hide;
  StatusPanel.Hide;
  end
 else begin
  if flHideControlPage
   then Menu.Bands[0].Visible:=false
   else begin
    if flHideCreateButton
     then tbCreateObject.Visible:=false
     else tbCreateObject.Visible:=true;
    Menu.Bands[0].Visible:=true;
    end;
  if flHideBookmarksPage
   then Menu.Bands[1].Visible:=false
   else Menu.Bands[1].Visible:=true;
  if flHideEditPage
   then Menu.Bands[2].Visible:=false
   else Menu.Bands[2].Visible:=true;
  if flHideViewPage
   then Menu.Bands[3].Visible:=false
   else Menu.Bands[3].Visible:=true;
  if flHideOtherPage
   then Menu.Bands[4].Visible:=false
   else Menu.Bands[4].Visible:=true;
  Menu.Show;
  StatusPanel.Visible:=true;
  end;
end;
end;

procedure TReflectorConfiguration.UpdateByReflector;
begin
//. reflector layout settings
Left:=Reflector.Left;
Top:=Reflector.Top;
Width:=Reflector.Width;
Height:=Reflector.Height;
//. reflector active camera settings
with Reflector.Cameras do begin
Translate_X:=ActiveCamera.Translate_X;
Translate_Y:=ActiveCamera.Translate_Y;
Translate_Z:=ActiveCamera.Translate_Z;
Rotate_AngleX:=ActiveCamera.Rotate_AngleX;
Rotate_AngleY:=ActiveCamera.Rotate_AngleY;
Rotate_AngleZ:=ActiveCamera.Rotate_AngleZ;
end;
end;


{TGL3DReflector}
procedure TGL3DReflector.ChangeWidthHeight(pWidth,pHeight: integer);
var
  R: TRectangle;
begin
Width:=pWidth;
Height:=pHeight;
R.Left:=0; R.Top:=0;
R.Width:=Width; R.Height:=Height;
Cameras.ActiveCamera.ChangeViewPort(R);
with StatusPanel do begin
Left:=0;
Width:=Self.Width;
Top:=Self.ClientHeight-Height;
end;
ShowCenterCoords;
end;

procedure TGL3DReflector.ShowCenterCoords;
var
  T: Extended;
  Xs,Ys: Extended;
begin
with Cameras.ActiveCamera.EyeAxis do begin
T:=-Z0/N;
Xs:=X0+T*L;
Ys:=Y0+T*M;
edCenterX.Text:=FormatFloat('0.####',Xs);
edCenterY.Text:=FormatFloat('0.####',Ys);
end;
end;

procedure TGL3DReflector.edCenterKeyPress(Sender: TObject; var Key: Char);
var
  Xc,Yc: Extended;
begin
if Key = #$0D
 then begin
  /// ? still not emplemented 
  {Xc:=StrToFloat(edCenterX.Text);
  Yc:=StrToFloat(edCenterY.Text);
  SetReflection(Xc,Yc);}
  end;
end;



{реализация списка видимых объектов}
Constructor TListVisibleObj.Create;
begin
inherited Create;
ptrList:=nil;
countObj:=0;
end;

destructor TListVisibleObj.Destroy;
begin
EmptyList;
inherited Destroy;
end;

procedure TListVisibleObj.InsertObj(ptrptrItem: pointer; ptrVisObj: TPtr);
var
  ptrNewItem: pointer;
begin
GetMem(ptrNewItem,SizeOf(TItemListVisibleObj));
with TItemListVisibleObj(ptrNewItem^) do
begin
ptrNextObj:=TItemListVisibleObj(ptrptrItem^).ptrNextObj;
ptrObj:=ptrVisObj;
end;
TItemListVisibleObj(ptrptrItem^).ptrNextObj:=ptrNewItem;
inc(countObj);
end;

procedure TListVisibleObj.DeleteObj(ptrPredItem: pointer);
var
  ptrDelItem,ptrNextItem: pointer;
begin
ptrDelItem:=TItemListVisibleObj(ptrPredItem^).ptrNextObj;
if ptrDelItem = nil then Exit;
ptrNextItem:=TItemListVisibleObj(ptrDelItem^).ptrNextObj;
FreeMem(ptrDelItem,SizeOf(TItemListVisibleObj));
TItemListVisibleObj(ptrPredItem^).ptrNextObj:=ptrNextItem;
Dec(countObj);
end;

procedure TListVisibleObj.EmptyList;
var
  ptrDelItem,ptrNextItem: pointer;
begin
ptrNextItem:=ptrList;
While ptrNextItem <> nil do
  begin
  ptrDelItem:=ptrNextItem;
  ptrNextItem:=TItemListVisibleObj(ptrDelItem^).ptrNextObj;
  FreeMem(ptrDelItem, SizeOf(TItemListVisibleObj));
  end;
ptrList:=nil;
countObj:=0;
end;

procedure TListVisibleObj.MoveList(Srs: TListVisibleObj);
begin
EmptyList;
ptrList:=Srs.ptrList;
countObj:=Srs.CountObj;
Srs.ptrList:=nil;
Srs.CountObj:=0;
end;



function TListVisibleObj.FindObj(ptrObj: TPtr; var ptrItem: pointer): boolean; {assembler; register;}
(*asm
         PUSH ESI
         MOV ESI,FptrListVisibleObj

@M0:       CMP ESI,0
           JE @M2
           CMP [ESI+4],EAX {ItemListVisibleObjptrObj = ptrObj}
           JNE @M1
             MOV AL,true
             MOV [EDX],ESI
             JMP @M3
@M1:       MOV ESI,[ESI]
           JMP @M0

@M2:     MOV AL,false
@M3:     POP ESI
end;*)
var
  ptrItemList: pointer;
begin
Result:=false;
ptrItemList:=ptrList;
While ptrItemList <> nil do
  begin
  if TItemListVisibleObj(ptrItemList^).ptrObj = ptrObj
   then
    begin
    ptrItem:=ptrItemList;
    Result:=true;
    Exit;
    end;
  ptrItemList:=TItemListVisibleObj(ptrItemList^).ptrNextObj;
  end;
end;


//. TCameras
Constructor TCameras.Create(pReflector: TGL3DReflector);
begin
Inherited Create;
Reflector:=pReflector;
ActiveCamera:=CreateCamera;
end;

Destructor TCameras.Destroy;
begin
Clear;
Inherited;
end;

procedure TCameras.Clear;
var
  I: integer;
begin
ActiveCamera:=nil;
for I:=0 to Count-1 do TCamera(List[I]).Destroy;
Inherited Clear;
end;

function TCameras.CreateCamera: TCamera;
begin
Result:=TCamera.Create(Reflector);
Add(Result);
end;

procedure TCameras.DestroyCamera(var Camera: TCamera);
begin
if Camera = nil then Exit; //. ->
if Camera = ActiveCamera then Raise Exception.Create('can not destroy active camera'); //. =>
Remove(Camera);
Camera.Destroy;
Camera:=nil;
end;

procedure TCameras.Select(Camera: TCamera);
begin
if Camera = nil then Exit; //. ->
if Camera = ActiveCamera then Exit; //. ->
ActiveCamera:=Camera;
ActiveCamera.Validate;
end;

//. TCamera
Constructor TCamera.Create(pReflector: TGL3DReflector);
begin
Inherited Create;
Reflector:=pReflector;
ProjectionType:=cptOrtho;
Translate_X:=0;
Translate_Y:=0;
Translate_Z:=0;
Rotate_AngleX:=0;
Rotate_AngleY:=0;
Rotate_AngleZ:=0;
with ProjectionViewPort do begin
Left:=0; Width:=Reflector.Width;
Top:=0; Height:=Reflector.Height;
end;
ProjectionScale:=40;
ProjectionScalePowerOf4:=Sqr(Sqr(ProjectionScale));
with ClippingPlanes do begin
Left:=0; Right:=0; Bottom:=0; Top:=0;
Near:=0; Far:=0;
end;
end;

type
  TMatrix = array[0..3,0..3] of TGLFloat;
  
procedure TransformPointByMatrix(const TransforMatrix: TMatrix; var Point: T3DPoint);
var
  _X,_Y,_Z,_W: Extended;
begin
with Point do begin
_X:=X*TransforMatrix[0,0]+Y*TransforMatrix[1,0]+Z*TransforMatrix[2,0]+TransforMatrix[3,0];
_Y:=X*TransforMatrix[0,1]+Y*TransforMatrix[1,1]+Z*TransforMatrix[2,1]+TransforMatrix[3,1];
_Z:=X*TransforMatrix[0,2]+Y*TransforMatrix[1,2]+Z*TransforMatrix[2,2]+TransforMatrix[3,2];
_W:=X*TransforMatrix[0,3]+Y*TransforMatrix[1,3]+Z*TransforMatrix[2,3]+TransforMatrix[3,3];
X:=_X/_W; Y:=_Y/_W; Z:=_Z/_W;
end;
end;

procedure TCamera.Update;
var
  Range: Extended;
  M: TMatrix;
  EyePoint: T3DPoint;
  P0,P1,P2: T3DPoint;
  AvrPoint: T3DPoint;
begin
//. updating projection data
with ClippingPlanes do begin
Range:=(ProjectionViewPort.Width)/ProjectionScale;
Left:=-Range/2; Right:=Range/2;
Range:=(ProjectionViewPort.Height)/ProjectionScale;
Bottom:=-Range/2; Top:=Range/2;
end;
//.
with P0 do begin X:=ClippingPlanes.Left; Y:=ClippingPlanes.Top; Z:=-ClippingPlanes.Near; end;
with P1 do begin X:=ClippingPlanes.Right; Y:=ClippingPlanes.Top; Z:=-ClippingPlanes.Near; end;
with P2 do begin X:=ClippingPlanes.Right; Y:=ClippingPlanes.Bottom; Z:=-ClippingPlanes.Near; end;
//. updating eye axis
glMatrixMode(GL_MODELVIEW);
glPushMatrix;
glLoadIdentity;
glTranslatef(Translate_X,Translate_Y,Translate_Z);
glRotatef(Rotate_AngleZ, 0,0,1);
glRotatef(Rotate_AngleX, 1,0,0);
glRotatef(Rotate_AngleY, 0,1,0);
glGetFloatv(GL_MODELVIEW_MATRIX, @M);
glPopMatrix;
with EyePoint do begin X:=0; Y:=0; Z:=0; end;
//. getting point in center of projection window
with AvrPoint do begin X:=(P0.X+P2.X)/2; Y:=(P0.Y+P2.Y)/2; Z:=(P0.Z+P2.Z)/2; end;
//.
TransformPointByMatrix(M, EyePoint);
TransformPointByMatrix(M, AvrPoint);
with EyeAxis do begin
X0:=EyePoint.X; Y0:=EyePoint.Y; Z0:=EyePoint.Z;
L:=AvrPoint.X-X0;
M:=AvrPoint.Y-Y0;
N:=AvrPoint.Z-Z0;
end;
//. updating projection plane
with ProjectionPlane do begin
TransformPointByMatrix(M, P0);
TransformPointByMatrix(M, P1);
TransformPointByMatrix(M, P2);
A:=(P1.Y-P0.Y)*(P2.Z-P0.Z)-(P2.Y-P0.Y)*(P1.Z-P0.Z);
B:=(P2.X-P0.X)*(P1.Z-P0.Z)-(P1.X-P0.X)*(P2.Z-P0.Z);
C:=(P1.X-P0.X)*(P2.Y-P0.Y)-(P2.X-P0.X)*(P1.Y-P0.Y);
D:=-(A*P0.X+B*P0.Y+C*P0.Z);
end;
end;

procedure TCamera.Validate;
begin
with Reflector do begin
//. update reflection window
UpdateReflectionWindow(ReflectionWindow);
ReflectionWindow.Update;
//.
Reflecting.RecalcReflect;
ShowCenterCoords;
end;
end;

procedure TCamera.SetFrustum(const pNear,pFar: Extended);
begin
with ClippingPlanes do begin
Near:=pNear;
Far:=pFar;
end;
Update;
ProjectionType:=cptFrustum;
Validate;
end;

procedure TCamera.Move(const dX,dY,dZ: Extended);
begin
Translate_X:=Translate_X+dX;
Translate_Y:=Translate_Y+dY;
Translate_Z:=Translate_Z+dZ;
Update;
Validate;
end;

procedure TCamera.Rotate(const dAngleX,dAngleY,dAngleZ: Extended);
begin
Rotate_AngleX:=Rotate_AngleX+dAngleX;
Rotate_AngleY:=Rotate_AngleY+dAngleY;
Rotate_AngleZ:=Rotate_AngleZ+dAngleZ;
Update;
Validate;
end;

procedure TCamera.RotateAroundXY(const pX,pY: Extended; const Angle: Extended);
var
  dX,dY: Extended;
  R: boolean;
  TransforMatrix: TMatrix;
  P: T3DPoint;
begin
with EyeAxis do begin
dX:=X0-pX;
dY:=Y0-pY;
if Abs(dX) > Abs(dY)
 then R:=((-dX)*L < 0)
 else R:=((-dY)*M < 0);
end;
if R then Raise Exception.Create('can not rotate around beause center-point is invisible'); //. =>
glMatrixMode(GL_MODELVIEW);
glPushMatrix;
glLoadIdentity;
glRotatef(Angle, 0,0,1);
glTranslatef(dX,dY,0);
glGetFloatv(GL_MODELVIEW_MATRIX, @TransforMatrix);
glPopMatrix;
with P do begin X:=0; Y:=0; Z:=0; end;
TransformPointByMatrix(TransforMatrix, P);
dX:=P.X-dX;
dY:=P.Y-dY;
//. rotating
Translate_X:=Translate_X+dX;
Translate_Y:=Translate_Y+dY;
Rotate_AngleZ:=Rotate_AngleZ+Angle;
Update;
Validate;
end;


procedure TCamera.SetPosition(const X,Y,Z: Extended);
begin
Translate_X:=X;
Translate_Y:=Y;
Translate_Z:=Z;
Update;
Validate;
end;

procedure TCamera.SetRotates(const AngleX,AngleY,AngleZ: Extended);
begin
Rotate_AngleX:=AngleX;
Rotate_AngleY:=AngleY;
Rotate_AngleZ:=AngleZ;
Update;
Validate;
end;

procedure TCamera.Setup(const  X,Y,Z: Extended; const AngleX,AngleY,AngleZ: Extended);
begin
Translate_X:=X;
Translate_Y:=Y;
Translate_Z:=Z;
Rotate_AngleX:=AngleX;
Rotate_AngleY:=AngleY;
Rotate_AngleZ:=AngleZ;
Update;
Validate;
end;

procedure TCamera.ChangeViewPort(const NewViewPort: TRectangle);
begin
ProjectionViewPort:=NewViewPort;
Update;
Validate;
end;

function TCamera.Is2DObjectVisiable(const Xmin,Ymin,Xmax,Ymax: Extended; const SquareFactor: Extended): boolean;

  procedure GetProjectionPoint(var P: T3DPoint);
  var
    L,M,N: Extended;
    T: Extended;
  begin
  L:=P.X-EyeAxis.X0; M:=P.Y-EyeAxis.Y0; N:=P.Z-EyeAxis.Z0;
  with ProjectionPlane do T:=-(A*EyeAxis.X0+B*EyeAxis.Y0+C*EyeAxis.Z0+D)/(A*L+B*M+C*N);
  P.X:=EyeAxis.X0+L*T;
  P.Y:=EyeAxis.Y0+M*T;
  P.Z:=EyeAxis.Z0+N*T;
  end;

var
  P: T3DPoint;
  Projection_Xmin,Projection_Ymin,Projection_Zmin,
  Projection_Xmax,Projection_Ymax,Projection_Zmax: Extended;
  QdX,QdY,QdZ: Extended;
  QdS: Extended;
  Scale: Extended;

  procedure DoForPoint(const P: T3DPoint);
  begin
  if P.X < Projection_Xmin
   then
    Projection_Xmin:=P.X
   else
    if P.X > Projection_Xmax
     then Projection_Xmax:=P.X;
  if P.Y < Projection_Ymin
   then
    Projection_Ymin:=P.Y
   else
    if P.Y > Projection_Ymax
     then Projection_Ymax:=P.Y;
  if P.Z < Projection_Zmin
   then
    Projection_Zmin:=P.Z
   else
    if P.Z > Projection_Zmax
     then Projection_Zmax:=P.Z;
  end;

begin
//. getting extremums
try
with P do begin X:=Xmin; Y:=Ymin; Z:=0 end;
GetProjectionPoint(P);
Projection_Xmin:=P.X; Projection_Ymin:=P.Y; Projection_Zmin:=P.Z;
Projection_Xmax:=Projection_Xmin; Projection_Ymax:=Projection_Ymin; Projection_Zmax:=Projection_Zmin;
with P do begin X:=Xmin; Y:=Ymax; Z:=0 end;
GetProjectionPoint(P);
DoForPoint(P);
with P do begin X:=Xmax; Y:=Ymax; Z:=0 end;
GetProjectionPoint(P);
DoForPoint(P);
with P do begin X:=Xmax; Y:=Ymin; Z:=0 end;
GetProjectionPoint(P);
DoForPoint(P);
except
  Result:=true;
  end;
//. getting square of projection container
QdX:=Sqr(Projection_Xmax-Projection_Xmin);
QdY:=Sqr(Projection_Ymax-Projection_Ymin);
QdZ:=Sqr(Projection_Zmax-Projection_Zmin);
if QdX <> 0
 then
  QdS:=QdX*(QdY+QdZ)
 else
  QdS:=QdY*QdZ;
Result:=(QdS*ProjectionScalePowerOf4 >= SquareFactor);
end;

procedure TCamera.UpdateReflectionWindow(ReflectionWindow: TReflectionWindow);

  procedure GetCameraAxisEndProjection(const P0,P1: T3DPoint; var X,Y: Extended);
  const
    MaxAxisLength = 100000;
  var
    L,M,N: Extended;
    IntervalLength: Extended;
    Taxis,T: Extended;
  begin
  L:=P1.X-P0.X; M:=P1.Y-P0.Y; N:=P1.Z-P0.Z;
  IntervalLength:=Sqrt(sqr(P1.X-P0.X)+sqr(P1.Y-P0.Y)+sqr(P1.Z-P0.Z));
  Taxis:=MaxAxisLength/IntervalLength;
  if N <> 0
   then begin
    T:=-P0.Z/N;
    if T >= 0 then Taxis:=T;
    end;
  X:=P0.X+L*Taxis;
  Y:=P0.Y+M*Taxis;
  end;

var
  M: TMatrix;
  EyePoint: T3DPoint;
  P0,P1,P2,P3: T3DPoint;
  X,Y: Extended;
  ptrQueueItem: pointer;
begin
glMatrixMode(GL_MODELVIEW);
glPushMatrix;
glLoadIdentity;
glTranslatef(Translate_X,Translate_Y,Translate_Z);
glRotatef(Rotate_AngleZ, 0,0,1);
glRotatef(Rotate_AngleX, 1,0,0);
glRotatef(Rotate_AngleY, 0,1,0);
glGetFloatv(GL_MODELVIEW_MATRIX, @M);
glPopMatrix;
with EyePoint do begin X:=0; Y:=0; Z:=0; end;
with P0 do begin X:=ClippingPlanes.Left; Y:=ClippingPlanes.Top; Z:=-ClippingPlanes.Near; end;
with P1 do begin X:=ClippingPlanes.Right; Y:=ClippingPlanes.Top; Z:=-ClippingPlanes.Near; end;
with P2 do begin X:=ClippingPlanes.Right; Y:=ClippingPlanes.Bottom; Z:=-ClippingPlanes.Near; end;
with P3 do begin X:=ClippingPlanes.Left; Y:=ClippingPlanes.Bottom; Z:=-ClippingPlanes.Near; end;
TransformPointByMatrix(M, EyePoint);
TransformPointByMatrix(M, P0);
TransformPointByMatrix(M, P1);
TransformPointByMatrix(M, P2);
TransformPointByMatrix(M, P3);
with TNodesApproximator.Create do
try
//. add camera xoy-projection points
GetCameraAxisEndProjection(EyePoint,P0, X,Y);
AddNode(X,Y);
GetCameraAxisEndProjection(EyePoint,P1, X,Y);
AddNode(X,Y);
GetCameraAxisEndProjection(EyePoint,P2, X,Y);
AddNode(X,Y);
GetCameraAxisEndProjection(EyePoint,P3, X,Y);
AddNode(X,Y);
//. add camera window xoy-projection points
AddNode(P0.X,P0.Y);
AddNode(P1.X,P1.Y);
AddNode(P2.X,P2.Y);
AddNode(P3.X,P3.Y);
Calculate;
with ReflectionWindow do begin
ptrQueueItem:=ResultQueue;
try
with unitNodesApproximator.TNode(TQueueItem(ptrQueueItem^).ptrNode^) do begin X0:=X*cfTransMeter; Y0:=Y*cfTransMeter; end; ptrQueueItem:=TQueueItem(ptrQueueItem^).ptrNext;
with unitNodesApproximator.TNode(TQueueItem(ptrQueueItem^).ptrNode^) do begin X1:=X*cfTransMeter; Y1:=Y*cfTransMeter; end; ptrQueueItem:=TQueueItem(ptrQueueItem^).ptrNext;
with unitNodesApproximator.TNode(TQueueItem(ptrQueueItem^).ptrNode^) do begin X2:=X*cfTransMeter; Y2:=Y*cfTransMeter; end; ptrQueueItem:=TQueueItem(ptrQueueItem^).ptrNext;
with unitNodesApproximator.TNode(TQueueItem(ptrQueueItem^).ptrNode^) do begin X3:=X*cfTransMeter; Y3:=Y*cfTransMeter; end; ptrQueueItem:=TQueueItem(ptrQueueItem^).ptrNext;
except
  end;
NodesCount:=4;
if ptrQueueItem <> nil
 then begin
  with unitNodesApproximator.TNode(TQueueItem(ptrQueueItem^).ptrNode^) do begin X4:=X*cfTransMeter; Y4:=Y*cfTransMeter; end; ptrQueueItem:=TQueueItem(ptrQueueItem^).ptrNext;
  Inc(NodesCount);
  if ptrQueueItem <> nil
   then begin
    with unitNodesApproximator.TNode(TQueueItem(ptrQueueItem^).ptrNode^) do begin X5:=X*cfTransMeter; Y5:=Y*cfTransMeter; end; ptrQueueItem:=TQueueItem(ptrQueueItem^).ptrNext;
    Inc(NodesCount);
    if ptrQueueItem <> nil
     then begin
      with unitNodesApproximator.TNode(TQueueItem(ptrQueueItem^).ptrNode^) do begin X6:=X*cfTransMeter; Y6:=Y*cfTransMeter; end; ptrQueueItem:=TQueueItem(ptrQueueItem^).ptrNext;
      Inc(NodesCount);
      if ptrQueueItem <> nil
       then begin
        with unitNodesApproximator.TNode(TQueueItem(ptrQueueItem^).ptrNode^) do begin X7:=X*cfTransMeter; Y7:=Y*cfTransMeter; end; ptrQueueItem:=TQueueItem(ptrQueueItem^).ptrNext;
        Inc(NodesCount);
        end;
      end;
    end;
  end;
end;
finally
Destroy;
end;
end;

//. TGL3DReflector
Constructor TGL3DReflector.Create(pSpace: TProxySpace; pid: integer);
const
  VoidReflectionWindowStruc: TReflectionWindowStrucEx = (X0: 0; Y0: 0;  X1: 0; Y1: 0;  X2: 0; Y2: 0;  X3: 0; Y3: 0;    Xmn: 0;  Ymn: 0;  Xmx: 0;  Ymx: 0);
var
  IUnk: IUnknown;
  SysMenu:THandle;
  popupElectedPlaces: TpopupElectedPlaces;
  popupElectedObjects: TpopupElectedObjects;
  popupSelectedObjects: TpopupSelectedObjects;
begin
Inherited Create(nil);
Space:=pSpace;
id:=pid;

Cameras:=TCameras.Create(Self);

Configuration:=TReflectorConfiguration.Create(Self);

//. selected obj initialization
idSelectedObj:=0; //. nilObject
FptrSelectedObj:=nilPtr;
SelectedObj_flMoving:=false;
ptrSelectedPointObj:=nilPtr;
sbSelectedObjAtCenter.Enabled:=false;
lbSelectedObjName.Caption:='';
fmSelectedObjects:=TfmSelectedObjects.Create(Self);

//. инициализация управления
flReflectionChanged:=false;
flMouseRightButtonPressed:=false;
flMouseLeftButtonPressed:=false;

{$IFDEF ExternalTypes}
ObjectManager:=Types__TObjectsManager_Create;
{$ENDIF}

SysMenu:=GetSystemMenu(Handle,False);
InsertMenu(SysMenu,0,MF_BYPOSITION,ID_ShowConfiguration, 'Show Configuration');

popupCreateObject:=TpopupCreateObject.Create(Self);
tbCreateObject.DropdownMenu:=popupCreateObject;
popupElectedPlaces:=TpopupElectedPlaces.Create(Self);
tbElectedPlaces.DropdownMenu:=popupElectedPlaces;
popupElectedObjects:=TpopupElectedObjects.Create(Self);
tbElectedObjects.DropdownMenu:=popupElectedObjects;
popupSelectedObjects:=TpopupSelectedObjects.Create(Self);
tbSelectedObjects.DropdownMenu:=popupSelectedObjects;

ReflectionWindow:=TReflectionWindow.Create(Space,VoidReflectionWindowStruc);
TReflecting.Create(Self);

OnPaint:=FormPaint;
OnResize:=FormResize;

//. setting perspective
Cameras.ActiveCamera.SetFrustum(20,100000);

//. positioning as default
Cameras.ActiveCamera.Rotate(90,0,0);
Cameras.ActiveCamera.Move(0,0,20);

Configuration.Validate;

//. naming
Caption:=GetISpaceUserReflector(Space.SOAPServerURL).getName(Space.UserName,Space.UserPassword,id);
//.
end;

destructor TGL3DReflector.Destroy;
var
  I: integer;
  Component: TComponent;
begin
fmSelectedObjects.Free;
ObjectManager.Free;
try PanelProps.Free; except end;

Reflecting.Free;
popupCreateObject.Free;
ReflectionWindow.Free;
Configuration.Free;
Cameras.Free;
Inherited;
end;

procedure TGL3DReflector.PrintReflection;
begin
/// +
end;

procedure TGL3DReflector.SelectObj(ptrObj: TPtr);
var
  ptrLastSelectedObj: TPtr;
begin
ptrLastSelectedObj:=ptrSelectedObj;
ptrSelectedPointObj:=NilPtr;
ptrSelectedObj:=ptrObj;
if ptrLastSelectedObj <> nilPtr then Reflecting.RevisionReflect(ptrLastSelectedObj,actRefresh);
Reflecting.RevisionReflect(ptrSelectedObj,actReFresh);
end;

procedure TGL3DReflector.ShowObjAtCenter(ptrObj: TPtr);
var
  Obj: TSpaceObj;
  Point:TPoint;
  ofsX,ofsY: Extended;
begin
if ptrObj = nilPtr then Exit; //. ->
Space.ReadObj(Obj,SizeOf(TSpaceObj), ptrObj);
Space.ReadObj(Point,SizeOf(TPoint), Obj.ptrFirstPoint);
SelectObj(ptrObj);
//. positioning camera at object
with Cameras.ActiveCamera do begin
SetPosition(Point.X,Point.Y, 1000);
SetRotates(0,0,0);
end;
end;

procedure TGL3DReflector.Loaded;
begin
Inherited Loaded;
end;


procedure TGL3DReflector.FormMouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
const
  dAngle = 1;
  MoveCf = 10;
  maxL = 10;
var
  dX,dY: integer;
  cf: Extended;
  rdX,rdY: Extended;
  dA: Extended;
  L: Extended;

  procedure Get_RealdXdY(out vdX,vdY: Extended);
  var
    T: Extended;
    dX,dY,L: Extended;
  begin
  vdX:=0;
  vdY:=0;
  with Cameras.ActiveCamera.EyeAxis do begin
  if N = 0 then Exit; //. ->
  T:=Abs(Z0/N);
  dX:=T*L;
  dY:=T*M;
  end;
  L:=Sqrt(sqr(dX)+sqr(dY));
  if L = 0 then Exit; //. ->
  vdX:=dX/L;
  vdY:=dY/L;
  end;

begin
try
if flMouseRightButtonPressed
 then begin
  dX:=X-FXMsLast;
  dY:=Y-FYMsLast;
  if Abs(dY) > Abs(dX)
   then begin
    Get_RealdXdY(rdX,rdY);
    cf:=MoveCf;
    if ssCtrl in Shift then cf:=cf*10;
    rdX:=rdX*(-dY)*cf;
    rdY:=rdY*(-dY)*cf;
    Cameras.ActiveCamera.Move(rdX,rdY,0);
    end
   else begin
    dA:=dAngle*(-dX);
    Cameras.ActiveCamera.Rotate(0,0,dA);
    end;
  end
 else
  if flMouseLeftButtonPressed
   then begin //. perform moving
    if ptrSelectedObj <> nilPtr
     then begin
      if SelectedObj_flMoving
       then
        XOYMoveObjectByReflection(ptrSelectedObj, FXMsLast,FYMsLast, X,Y)
       else begin
        L:=Sqrt(sqr(MouseButtonPressedPosition_X-X)+sqr(MouseButtonPressedPosition_Y-Y));
        if L > maxL then SelectedObj_flMoving:=true;
        end;
      end;
    end;
finally
FXMsLast:=X;
FYMsLast:=Y;
end;
end;

procedure TGL3DReflector.FormMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  ptrObj: TPtr;
  RX,RY: TCrd;
  PanelPropsNeeded: boolean;
  idTROOT,idROOT: integer;
  idTOwner,idOwner: integer;
begin
try
case Button of
mbLeft: begin
  flMouseLeftButtonPressed:=true; //. do not replace
  ptrObj:=Reflecting.Scene.SelectObj(X,ClientHeight-Y);
  if (ptrObj <> nilPtr) AND (ptrObj <> ptrSelectedObj)
   then begin
    Space.Obj_GetRoot(Space.Obj_IDType(ptrObj),Space.Obj_ID(ptrObj), idTROOT,idROOT);
    if idROOT <> 0
     then with TComponentFunctionality_Create(idTROOT,idROOT) do
      try
      if GetOwner(idTOwner,idOwner)
       then with TComponentFunctionality_Create(idTOwner,idOwner) do
        try
        try PanelProps.Free; except end;
        PanelProps:=TPanelProps_Create(false, 0,nil,nilObject);
        with TAbstractSpaceObjPanelProps(PanelProps) do begin
        flFreeOnClose:=false;
        Left:=Self.Left+Round((Self.Width-Width)/2);
        Top:=Self.Top+Self.Height-Height-10;
        OnKeyDown:=Self.OnKeyDown;
        OnKeyUp:=Self.OnKeyUp;
        Show;
        end;
        finally
        Release;
        end
       else begin
        try PanelProps.Free; except end;
        PanelProps:=TPanelProps_Create(false, 0,nil,nilObject);
        with TAbstractSpaceObjPanelProps(PanelProps) do begin
        flFreeOnClose:=false;
        Left:=Self.Left+Round((Self.Width-Width)/2);
        Top:=Self.Top+Self.Height-Height-10;
        OnKeyDown:=Self.OnKeyDown;
        OnKeyUp:=Self.OnKeyUp;
        Show;
        end;
        end;
      finally
      Release;
      end;
    end;
  ptrSelectedObj:=ptrObj;
  Reflecting.Scene.RecompileReflect;
  end;
mbRight: begin
  flMouseRightButtonPressed:=true;
  end;
end;
finally
FXMsLast:=X;
FYMsLast:=Y;
MouseButtonPressedPosition_X:=X;
MouseButtonPressedPosition_Y:=Y;
end;
end;

procedure TGL3DReflector.FormMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
case Button of
mbRight: flMouseRightButtonPressed:=false;
mbLeft: begin
  flMouseLeftButtonPressed:=false;
  if SelectedObj_flMoving
   then with TComponentFunctionality_Create(Space.Obj_IDType(ptrSelectedObj),Space.Obj_ID(ptrSelectedObj)) do
    try
    DoOnComponentUpdate;
    finally
    Release;
    end;
  end;
end;
end;

procedure TGL3DReflector.FormMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
const
  cf = (1/120)*5;
begin
Cameras.ActiveCamera.Rotate((-WheelDelta)*cf,0,0);
Handled:=true;
end;

procedure TGL3DReflector.wmCM_MOUSELEAVE(var Message: TMessage);
begin
flMouseLeftButtonPressed:=false;
flMouseRightButtonPressed:=false;
Cursor:=crDefault;
end;

procedure TGL3DReflector.XOYMoveObjectByReflection(const ptrObj: TPtr; const OrgPoint_X,OrgPoint_Y: integer; const FinPoint_X,FinPoint_Y: integer);
var
  TransforMatrix: TMatrix;
  OrgPoint,FinPoint: T3DPoint;
  PN,T: Extended;
  X1,Y1, X2,Y2: Extended;
  dX,dY: Extended;
begin
if Space.Obj_ID(ptrObj) = 0 then Raise Exception.Create('can not move this object: own functionality not exist'); //. =>
with Cameras.ActiveCamera do begin
//. getting camera transformatrix
glMatrixMode(GL_MODELVIEW);
glPushMatrix;
glLoadIdentity;
glTranslatef(Translate_X,Translate_Y,Translate_Z);
glRotatef(Rotate_AngleZ, 0,0,1);
glRotatef(Rotate_AngleX, 1,0,0);
glRotatef(Rotate_AngleY, 0,1,0);
glGetFloatv(GL_MODELVIEW_MATRIX, @TransforMatrix);
glPopMatrix;
//. getting points space coords
with ClippingPlanes do begin
with OrgPoint do begin X:=Left+(OrgPoint_X-ProjectionViewport.Left)*((Right-Left)/ProjectionViewport.Width); Y:=Top-(OrgPoint_Y-ProjectionViewPort.Top)*((Top-Bottom)/ProjectionViewPort.Height); Z:=-ClippingPlanes.Near; end;
with FinPoint do begin X:=Left+(FinPoint_X-ProjectionViewport.Left)*((Right-Left)/ProjectionViewport.Width); Y:=Top-(FinPoint_Y-ProjectionViewPort.Top)*((Top-Bottom)/ProjectionViewPort.Height); Z:=-ClippingPlanes.Near; end;
end;
TransformPointByMatrix(TransforMatrix, OrgPoint);
TransformPointByMatrix(TransforMatrix, FinPoint);
end;
//. getting XOY plane shootpoints
with Cameras.ActiveCamera.EyeAxis do begin
PN:=(OrgPoint.Z-Z0);
if PN = 0 then Raise Exception.Create('object moving imposible: point is infinite'); //. =>
T:=-Z0/PN;
if T < 0 then Raise Exception.Create('object moving imposible: point is infinite'); //. =>
X1:=X0+T*(OrgPoint.X-X0);
Y1:=Y0+T*(OrgPoint.Y-Y0);
PN:=(FinPoint.Z-Z0);
if PN = 0 then Raise Exception.Create('object moving imposible: point is infinite'); //. =>
T:=-Z0/PN;
if T < 0 then Raise Exception.Create('object moving imposible: point is infinite'); //. =>
X2:=X0+T*(FinPoint.X-X0);
Y2:=Y0+T*(FinPoint.Y-Y0);
end;
//. moving
dX:=X2-X1;
dY:=Y2-Y1;
with TBaseVisualizationFunctionality(TComponentFunctionality_Create(Space.Obj_IDType(ptrObj),Space.Obj_ID(ptrObj))) do
try
Update; //. update own properties
try
SetPropertiesLocal(Scale, Translate_X+dX,Translate_Y+dY,Translate_Z, Rotate_AngleX,Rotate_AngleY,Rotate_AngleZ);
except
  on E: EAbstractError do Raise Exception.Create('can not move object: method is not implemented'); //. =>
  else
    Raise; //. =>
  end;
finally
Release;
end;
Reflecting.Scene.RecompileReflect;
end;

procedure TGL3DReflector.GetShiftForClone(const OrgPoint: TPoint; out ShiftX,ShiftY: TCrd);
var
  T: Extended;
  Xtarget,Ytarget: Extended;
begin
with Cameras.ActiveCamera.EyeAxis do begin
T:=-Z0/N;
Xtarget:=X0+T*L;
Ytarget:=Y0+T*M;
ShiftX:=Xtarget-OrgPoint.X;
ShiftY:=Ytarget-OrgPoint.Y;
end;
end;

procedure TGL3DReflector.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
CanClose:=false;
end;

procedure TGL3DReflector.FormResize(Sender: TObject);
begin
ChangeWidthHeight(Width,Height);
end;


procedure TGL3DReflector.SelectedObj__TPanelProps_Show;
var
  ObjFunctionality: TComponentFunctionality;
  idTROOT,idROOT: integer;
  VisOwnerFunctionality: TComponentFunctionality;

  function PanelProps_Show(const idTROOT,idROOT: integer): boolean;
  var
    ObjFunctionality: TComponentFunctionality;
    idTOwner,idOwner: integer;
    OwnerFunctionality: TComponentFunctionality;
  begin
  Result:=false;
  ObjFunctionality:=TComponentFunctionality_Create(idTROOT,idROOT);
  with ObjFunctionality do begin
  if GetOwner(idTOwner,idOwner)
   then begin
    OwnerFunctionality:=TComponentFunctionality_Create(idTOwner,idOwner);
    with OwnerFunctionality do begin
    PanelProps:=TPanelProps_Create(false, 0,nil,nilObject);
    with TAbstractSpaceObjPanelProps(PanelProps) do begin
    flFreeOnClose:=false;
    Left:=Self.Left+Round((Self.Width-Width)/2);
    Top:=Self.Top+Self.Height-Height-10;
    OnKeyDown:=Self.OnKeyDown;
    OnKeyUp:=Self.OnKeyUp;
    Show;
    end;
    Release;
    end;
    Result:=true;
    end
  end;
  end;

begin
try PanelProps.Free; except end;
PanelProps:=nil;
if NOT PanelProps_Show(Space.Obj_IDType(ptrSelectedObj),Space.Obj_ID(ptrSelectedObj))
 then begin
  ObjFunctionality:=TComponentFunctionality_Create(Space.Obj_IDType(ptrSelectedObj),Space.Obj_ID(ptrSelectedObj));
  with ObjFunctionality do begin
  if idObj <> 0
   then begin
    if PanelProps <> nil then TAbstractSpaceObjPanelProps(PanelProps).flFreeOnClose:=true;
    PanelProps:=TPanelProps_Create(false, 0,nil,nilObject);
    with TAbstractSpaceObjPanelProps(PanelProps) do begin
    flFreeOnClose:=false;
    Left:=Self.Left+Round((Self.Width-Width)/2);
    Top:=Self.Top+Self.Height-Height-10;
    OnKeyDown:=Self.OnKeyDown;
    OnKeyUp:=Self.OnKeyUp;
    Show;
    end;
    end;
  Release;
  end;
  Space.Obj_GetRoot(Space.Obj_IDType(ptrSelectedObj),Space.Obj_ID(ptrSelectedObj), idTROOT,idROOT);
  if idROOT <> 0 then PanelProps_Show(idTROOT,idROOT);
  end;
end;

procedure TGL3DReflector.ToolButtonPrintClick(Sender: TObject);
begin
if MessageDlg('Print selected region ?', mtConfirmation, [mbNo,mbYes], 0) = mrYes then PrintReflection;
end;

procedure TGL3DReflector.wmSysCommand;
begin
case Message.wParam of
ID_ShowConfiguration: with Tfm3DReflectorCfg.Create(Self) do
  try
  ShowModal;
  finally
  Destroy;
  end;
end;
inherited;
end;

procedure TGL3DReflector.tbElectedPlacesClick(Sender: TObject);
var
  ptrObj: TPtr;
  ElectedPlace: TElectedPlaceStruc;
begin
with TfmElected3DPlaces.Create(Self) do
try
if Select(ElectedPlace) then with ElectedPlace do Cameras.ActiveCamera.Setup(Translate_X,Translate_Y,Translate_Z,Rotate_AngleX,Rotate_AngleY,Rotate_AngleZ);
finally
Destroy;
end;
end;

procedure TGL3DReflector.tbElectedObjectsClick(Sender: TObject);
begin
with TfmElectedObjects.Create(Self) do Show;
end;

procedure TGL3DReflector.tbGetTypesManagerClick(Sender: TObject);
begin
with ObjectManager do begin
Left:=-12;
Top:=Round((Screen.Height-Height)/2);
Show;
end;
end;

procedure TGL3DReflector.tbReflectingConfigClick(Sender: TObject);
begin
TObjectReflectingCfg(Reflecting.Cfg).ShowEditor;
end;

procedure TGL3DReflector.setPtrSelectedObj(Value: TPtr);
var
  Obj: TSpaceObj;
  ObjFunctionality: TBase2DVisualizationFunctionality;
  idTOwner,idOwner: integer;
  OwnerFunctionality: TComponentFunctionality;
  SelectedObj_Name: shortstring;
  LayFunctionality: TLay2DVisualizationFunctionality;
  Lay,SubLay: integer;

  procedure SelectedObjects_AddNew;
  begin
  TfmSelectedObjects(fmSelectedObjects).InsertNew(Obj.idTObj,Obj.idObj,SelectedObj_Name,Value);
  end;

begin
if Value = FptrSelectedObj then Exit; //. ->
if Value = nilPtr
 then begin
  //. удаление объекта из списка выделенных объектов, т.к. объект удален (ptrSelectedObj:=nilPtr)
  TfmSelectedObjects(fmSelectedObjects).RemoveObject(FptrSelectedObj);

  FptrSelectedObj:=Value;

  sbSelectedObjAtCenter.Enabled:=false;
  SelectedObj_Name:='[no]';
  lbSelectedObjName.Caption:=SelectedObj_Name;
  Exit;
  end;
FptrSelectedObj:=Value;
SelectedObj_flMoving:=false;
sbSelectedObjAtCenter.Enabled:=true;
Space.ReadObj(Obj,SizeOf(Obj), FptrSelectedObj);
if (Obj.idTObj = 0) OR (Obj.idObj = 0)
 then begin
  SelectedObj_Name:='< Detail >';
  SelectedObjects_AddNew;
  lbSelectedObjName.Caption:=SelectedObj_Name;
  Exit;
  end;
ObjFunctionality:=TBase2DVisualizationFunctionality(TComponentFunctionality_Create(Obj.idTObj,Obj.idObj));
if ObjFunctionality <> nil
 then with ObjFunctionality do begin
  if GetOwner(idTOwner,idOwner)
   then begin
    OwnerFunctionality:=TComponentFunctionality_Create(idTOwner,idOwner);
    if OwnerFunctionality <> nil
     then with OwnerFunctionality do begin
      if Name <> ''
       then SelectedObj_Name:=Name
       else SelectedObj_Name:=TypeFunctionality.Name;
      Release;
      end
     else
      lbSelectedObjName.Caption:='?';
    end
   else begin
    if Name <> ''
     then SelectedObj_Name:=Name
     else SelectedObj_Name:=TypeFunctionality.Name;
    end;
  GetLayInfo(Lay,SubLay);
  LayFunctionality:=TLay2DVisualizationFunctionality(TComponentFunctionality_Create(idTLay2DVisualization,idLay));
  with LayFunctionality do begin
  SelectedObj_Name:=SelectedObj_Name+' (lay - '+Name+', sublay - '+IntToStr(SubLay)+')';
  Release;
  end;
  Release;
  end
 else
  SelectedObj_Name:='?';
SelectedObjects_AddNew;
lbSelectedObjName.Caption:=SelectedObj_Name;
end;

procedure TGL3DReflector.sbSelectedObjAtCenterClick(Sender: TObject);
var
  idTROOT,idROOT: integer;
  idTOwner,idOwner: integer;
begin
ShowObjAtCenter(FPtrSelectedObj);
Space.Obj_GetRoot(Space.Obj_IDType(ptrSelectedObj),Space.Obj_ID(ptrSelectedObj), idTROOT,idROOT);
if idROOT <> 0
 then with TComponentFunctionality_Create(idTROOT,idROOT) do
  try
  if GetOwner(idTOwner,idOwner)
   then with TComponentFunctionality_Create(idTOwner,idOwner) do
    try
    try PanelProps.Free; except end;
    PanelProps:=TPanelProps_Create(false, 0,nil,nilObject);
    with TAbstractSpaceObjPanelProps(PanelProps) do begin
    flFreeOnClose:=false;
    Left:=Self.Left+Round((Self.Width-Width)/2);
    Top:=Self.Top+Self.Height-Height-10;
    OnKeyDown:=Self.OnKeyDown;
    OnKeyUp:=Self.OnKeyUp;
    Show;
    end;
    finally
    Release;
    end
   else begin
    try PanelProps.Free; except end;
    PanelProps:=TPanelProps_Create(false, 0,nil,nilObject);
    with TAbstractSpaceObjPanelProps(PanelProps) do begin
    flFreeOnClose:=false;
    Left:=Self.Left+Round((Self.Width-Width)/2);
    Top:=Self.Top+Self.Height-Height-10;
    OnKeyDown:=Self.OnKeyDown;
    OnKeyUp:=Self.OnKeyUp;
    Show;
    end;
    end;
  finally
  Release;
  end;
end;

procedure TGL3DReflector.tbSelectedObjectsClick(Sender: TObject);
begin
TfmSelectedObjects(fmSelectedObjects).DoExecutting;
end;

procedure TGL3DReflector.FormActivate(Sender: TObject);
begin
{$IFDEF ExternalTypes}
SpaceTypes.setReflector(Self);
{$ENDIF}
end;

procedure TGL3DReflector.FormDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
if (Source is TListView) AND (TListView(Source).Owner is TfmElectedObjects) then Accept:=true;
end;

procedure TGL3DReflector.FormDragDrop(Sender, Source: TObject; X, Y: Integer);
var
  SelectedObj: TSpaceObj;
  idTUseObj,idUseObj: integer;
  flOwnerExist: boolean;
  idClone: integer;
begin
if (Source is TListView) AND (TListView(Source).Owner is TfmElectedObjects)
 then with TElectedObjectStruc((Source as TListView).Selected.Data^) do begin
  try
  with TComponentFunctionality_Create(idType,idObj) do begin
  //. check for clone acceptable
  if NOT IsObjectCloneAcceptable(idTObj,idObj) then Raise Exception.Create('can not create object (it will cover down objects)'); //. =>
  //.
  if ptrSelectedObj <> nilPtr
   then begin
    Space.ReadObj(SelectedObj,SizeOf(SelectedObj), ptrSelectedObj);
    with TComponentFunctionality_Create(SelectedObj.idTObj,SelectedObj.idObj) do begin
    if NOT GetOwner(idTUseObj,idUseObj)
     then begin
      idTUseObj:=SelectedObj.idTObj;
      idUseObj:=SelectedObj.idObj;
      end;
    Release;
    end;
    ToCloneUsingObject(idTUseObj,idUseObj, idClone);
    end
   else
    ToClone(idClone);
  end;
    except
    ShowMessage('! can not clone from selected object');
    end;
  end;
end;

procedure TGL3DReflector.FormPaint(Sender: TObject);
begin
Reflecting.Scene.RecompileReflect;
with lbReflectionStatus do begin
Color:=clGreen;
Repaint;
end;
end;

procedure TGL3DReflector.tbCreateObjectClick(Sender: TObject);
begin
with TfmCreatingObjects.Create(Self) do Show;
end;

procedure TGL3DReflector.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

  procedure CloseAllComponentPanels;
  var
    I: integer;
    TempList: TList;
  begin
  TempList:=TList.Create;
  try
  for I:=0 to Screen.FormCount-1 do TempList.Add(Screen.Forms[I]);
  for I:=0 to TempList.Count-1 do
    if ObjectIsInheritedFrom(TObject(TempList[I]),TAbstractSpaceObjPanelProps) then TAbstractSpaceObjPanelProps(TempList[I]).Close;
  finally
  TempList.Destroy;
  end;
  end;

  procedure ShowComponentPanelsOfSelectedObj;
  var
    SelectedObj: TSpaceObj;
  begin
  if ptrSelectedObj = nilPtr then Exit; //. ->
  Space.ReadObj(SelectedObj,SizeOf(SelectedObj), ptrSelectedObj);
  if SelectedObj.idObj = 0 then Exit; //. ->
  with TComponentFunctionality_Create(SelectedObj.idTObj,SelectedObj.idObj) do
  try
  with TAbstractSpaceObjPanelProps(TPanelProps_Create(false, 0,nil,nilObject)) do begin
  Left:=Self.Left+Round((Self.Width-Width)/2);
  Top:=Self.Top+Self.Height-Height-10;
  OnKeyDown:=Self.OnKeyDown;
  OnKeyUp:=Self.OnKeyUp;
  Show;
  end;
  finally
  Release;
  end
  end;

var
  dZ: extended;
  T, X,Y: Extended;
  Angle: Extended;
begin
case Key of
VK_ESCAPE: begin
  CloseAllComponentPanels;
  Key:=0;
  end;
VK_F1: ShowComponentPanelsOfSelectedObj;
VK_Subtract: begin
  dZ:=-3;
  if ssCtrl in Shift then dZ:=dZ*10;
  Cameras.ActiveCamera.Move(0,0,dZ);
  end;
VK_Add: begin
  dZ:=3;
  if ssCtrl in Shift then dZ:=dZ*10;
  Cameras.ActiveCamera.Move(0,0,dZ);
  end;
VK_SPACE: begin
  with Cameras.ActiveCamera.EyeAxis do begin
  T:=-Z0/N;
  X:=X0+T*L;
  Y:=Y0+T*M;
  end;
  Angle:=9;
  if ssShift in Shift then Angle:=-Angle;
  Cameras.ActiveCamera.RotateAroundXY(X,Y, Angle);
  end;
end;
end;

procedure TGL3DReflector.RevisionReflectLocal(const ptrObj: TPtr; const Act: TRevisionAct);
begin
TReflecting(Reflecting).RevisionReflect(ptrObj,Act);
end;

procedure TGL3DReflector.RevisionReflect(const ptrObj: TPtr; const Act: TRevisionAct);
var
  Params: WideString;
begin
RevisionReflectLocal(ptrObj,Act);
TReflectorsList(Space.ReflectorsList).RevisionReflect(ptrObj,Act, ID);
end;

function TGL3DReflector.ReflectionID: longword;
begin
Result:=Reflecting.ReflectionID;
end;

{ 3D OpenGL }
procedure TGL3DReflector.CreateParams(var Params: TCreateParams);
begin
inherited;
with Params do
// By using the CS_OWNDC flag we tell Windows not to reset all our settings every time
// we access the window's DC. This enables to activate our rendering context just once (when the
// window is created) and not every time a paint cycle occurs.
// The redraw flags are necessary because the window needs a repaint on size change (viewport
// depends on window size).
WindowClass.Style := WindowClass.Style or CS_OWNDC or CS_VREDRAW or CS_HREDRAW;
//. for placing window button into the taskbar
{/// ? Params.ExStyle  := Params.ExStyle or WS_Ex_AppWindow;
Params.WndParent:=0;}
end;

procedure TGL3DReflector.WMEraseBkgnd(var Message: TWMEraseBkgnd);
// avoids clearing the background (causes flickering and speed penalty), OpenGL will use the entire
// window anyway
begin
Message.Result := 1;
end;


end.


