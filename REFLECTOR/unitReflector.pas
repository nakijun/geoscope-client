
{*******************************************************}
{                                                       }
{                 "Virtual Town" project                }
{                                                       }
{               Copyright (c) 1998-2011 PAS             }
{                                                       }
{Authors: Alex Ponomarev <AlxPonom@mail.ru>             }
{                                                       }
{  This program is free software under the GPL (>= v2)  }
{ Read the file COPYING coming with project for details }
{*******************************************************}

unit unitReflector;

interface

uses
  UnitUpdateableObjects,
  {$IFNDEF EmbeddedServer}
  FunctionalitySOAPInterface,
  {$ELSE}
  SpaceInterfacesImport,
  {$ENDIF}
  Windows, SyncObjs,ActiveX, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ExtDlgs,
  GDIPOBJ, GDIPAPI, //. GDI+ support
  ExtCtrls, StdCtrls, Buttons, Mask, DBCtrls, Db, DBClient, DBTables, Variants, MSXML, ComCtrls,
  Printers, ToolWin, ShellAPI, Gauges,
  GlobalSpaceDefines, UnitProxySpace, ImgList, Menus, RXSplit,
  RXCtrls, RxMenus, Math,
  unitEditingOrCreatingObjectPanel, unitInplaceHintPanel,
  ShellCtrls, Animate, GIFCtrl;

Const
  REFLECTORProfile = DefaultProfile+'\REFLECTOR';

Type
  TReflectorState = (rsCreating,rsDestroying,rsWorking);
  
  {basic AbstractReflector object}
  TAbstractReflector = class(TForm)
  public
    Space: TProxySpace;
    State: TReflectorState;
    id: integer;
    FptrSelectedObj: TPtr;
    fmSelectedObjects: TForm;

    procedure RevisionReflectLocal(const ptrObj: TPtr; const Act: TRevisionAct); virtual; abstract;
    procedure RevisionReflect(const ptrObj: TPtr; const Act: TRevisionAct); virtual; abstract;
    function ReflectionID: longword; virtual; abstract;
    procedure SelectObj(ptrObj: TPtr); virtual; abstract;
    procedure SelectedObj__TPanelProps_Show; virtual; abstract;
    procedure ShowObjAtCenter(ptrObj: TPtr); virtual; abstract;
    procedure setPtrSelectedObj(Value: TPtr); virtual; abstract;
    procedure GetShiftForClone(const OrgPoint: TPoint; out ShiftX,ShiftY: TCrd); virtual; abstract;
    //. security procedure
    procedure CheckUserObjWrite(const ptrObj: TPtr);
    //. check visualization clone for acceptable
    function IsObjectCloneAcceptable(const idTObj,idObj: integer): boolean;
    //. own properties
    property ptrSelectedObj: TPtr read FptrSelectedObj write setPtrSelectedObj;
  end;

  {user reflector, which saved into the database}
  TUserReflectorType = (urt2DReflector,urtGL3DReflector);

Type
  TReflectionWindowStruc = packed record
    X0,Y0,X1,Y1,X2,Y2,X3,Y3: TCrd;
    Xmn,Ymn,Xmx,Ymx: smallint;
  end;

  TReflectionWindowStrucDouble = packed record
    X0,Y0,X1,Y1,X2,Y2,X3,Y3: Double;
    Xmn,Ymn,Xmx,Ymx: smallint;
  end;

  TReflectionWindowStrucEx = packed record
    X0,Y0,X1,Y1,X2,Y2,X3,Y3: Extended;
    Xmn,Ymn,Xmx,Ymx: smallint;
  end;

  TReflectionWindow = class
  private
    Space: TProxySpace;

    function getScale: Extended; virtual;
  public
    Lock: TCriticalSection;
    X0,Y0,X1,Y1,X2,Y2,X3,Y3: Extended; 
    Xcenter,Ycenter: Extended;
    Xmn,Ymn,Xmx,Ymx: smallint;
    Xmd,Ymd: word;
    _Scale: Extended;
    HorRange,VertRange: Extended;
    ContainerCoord: TContainerCoord;
    _VisibleFactor: integer;
    DynamicHints_VisibleFactor: double;
    InvisibleLayNumbersArray: TByteArray;
    _ActualityInterval: TComponentActualityInterval;

    Constructor Create(pSpace: TProxySpace; const pReflectionWindowStruc: TReflectionWindowStruc); overload;
    Constructor Create(pSpace: TProxySpace; const pReflectionWindowStruc: TReflectionWindowStrucDouble); overload;
    Constructor Create(pSpace: TProxySpace; const pReflectionWindowStruc: TReflectionWindowStrucEx); overload;
    Destructor Destroy; override;

    procedure Update;
    procedure AssignWindow(const ReflectionWindowStruc: TReflectionWindowStruc); overload;
    procedure AssignWindow(const ReflectionWindowStruc: TReflectionWindowStrucDouble); overload;
    procedure AssignWindow(const ReflectionWindowStruc: TReflectionWindowStrucEx); overload;
    procedure GetWindow(const flReal: boolean; out vReflectionWindowStruc: TReflectionWindowStruc); overload;
    procedure GetWindow(const flReal: boolean; out vReflectionWindowStruc: TReflectionWindowStrucDouble); overload;
    procedure GetWindow(const flReal: boolean; out vReflectionWindowStruc: TReflectionWindowStrucEx); overload;
    function SpaceCoordsIsEqual(An: TReflectionWindow): boolean;
    function IsEqual(An: TReflectionWindow): boolean;
    procedure Assign(Srs: TReflectionWindow);
    procedure Normalize;
    function ConvertScrExtendCrd2RealCrd(const SX,SY: Extended; out X,Y: TCrd): boolean;
    procedure ConvertRealCrd2ScrExtendCrd(X,Y: Extended;  out Xs,Ys: Extended);
    function IsObjectVisible(const Obj: TSpaceObj): boolean; overload;
    function IsObjectOutside(const Obj_ContainerCoord: TContainerCoord): boolean;
    function IsObjectVisible(const ptrObj: TPtr): boolean; overload;
    function IsObjectVisible(const Obj_ContainerSquare: Extended; const Obj_ContainerCoord: TContainerCoord; const ptrObj: TPtr): boolean; overload;
    procedure GetMaxMin(out Xmin,Ymin,Xmax,Ymax: Extended);
    procedure GetParams(out Xmin,Ymin,Xmax,Ymax: Extended; out oScale: Extended; out oVisibleFactor: integer);
    function getVisibleFactor: integer;
    procedure setVisibleFactor(Value: integer);
    function HashCode: Extended;
    function  GetActualityInterval(): TComponentActualityInterval;
    procedure SetActualityInterval(const Value: TComponentActualityInterval);

    property Scale: Extended read GetScale;
    property VisibleFactor: integer read getVisibleFactor write setVisibleFactor;
  end;

  TScrPointRefl = record
    X,
    Y: extended;
  end;

  TFigure = class
  public
    Count: word;
    Points: Array[0..TSpaceObj_maxPointsCount-1] of TPoint;
    flagLoop: boolean;
    Color: TColor;
    flagFill: boolean;
    ColorFill: TColor;
    Width: integer;
    Style: TPenStyle;

    Constructor Create(pflagLoop: boolean);
    procedure Reset;
    procedure Insert(const Point: TPoint);
    function PointIsInside(const Point: TPoint): boolean;
  end;

const
  tnReflectorConfiguration = REFLECTORProfile+'\'+'Config';

  HintsVisibleObjects_maxCount = 1000;

  clEmptySpace = TColor($00040000);
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
  KfChgScale = 0.007;
  TFigureWinRefl_MaxNodeCount = 100000; //. must be greater than TSpaceObj_maxPointsCount 
  TReflector_maxReflLevel = 100;
  TUserDynamicHint_ObjChange_Time = 90{seconds};
  TUserDynamicHint_ObjChange_TimeCounter = 10*TUserDynamicHint_ObjChange_Time;
  TUserDynamicHint_ObjChange_TimeDelta = TUserDynamicHint_ObjChange_Time*1.0/(24*3600);
  //. reflector messages
  ID_ShowConfiguration = WM_USER+1;
  WM_LIMITEDREFLECT = WM_USER+2;
  WM_BEGINCREATEOBJECT = WM_USER+3;
  WM_DELETESPUTNIK = WM_USER+4;
  WM_DELETEOBJECTEDITOR = WM_USER+5;
  WM_DELETESELECTION = WM_USER+6;
  WM_SHOWPROGRESSBAR = WM_USER+7;
  WM_HIDEPROGRESSBAR = WM_USER+8;
  WM_UPDATEPROGRESSBAR = WM_USER+9;
  WM_REFLECTOBJECTEDITOR = WM_USER+10;
  WM_VALIDATEREFLECTIONMOUSEELEMENTS = WM_USER+11;

type
  TReflectorStyle = (rsNative = 0,rsSpaceViewing = 1);
  
  TReflectorMode = (rmBrowsing = 0,rmEditing = 1);

  TReflector = class;

  TReflectorConfiguration = class
  private
    Reflector: TReflector;
    ConfigurationFileName: string;

    function UpdateByReflector(): boolean;
  public
    //. reflection window config
    ReflectionWindowStruc: TReflectionWindowStruc;
    ReflectionWindow_VisibilityFactor: integer;
    //. reflector layout config
    Left: integer;
    Top: integer;
    Width: integer;
    Height: integer;
    //. reflector flags
    flDisableObjectChanging: boolean;
    flHideControlBars: boolean;
    flHideControlPage: boolean;
    flHideBookmarksPage: boolean;
    flHideEditPage: boolean;
    flHideViewPage: boolean;
    flHideOtherPage: boolean;
    flHideCreateButton: boolean;
    flDisableNavigate: boolean;
    flDisableMoveNavigate: boolean;
    flHideCoordinateMeshPage: boolean;
    flCoordinateMeshEnabled: boolean;
    CoordinateMeshStep: Extended;
    flCreateObjectsGallery: boolean;
    flElectedObjectsGallery: boolean;
    flNavigator: boolean;
    flGeoPanel: boolean;
    Style: TReflectorStyle;
    Mode: TReflectorMode;

    Constructor Create(pReflector: TReflector);
    destructor Destroy; override;
    procedure Open;
    procedure Save;
    procedure Validate;
    procedure ValidateFlags;
  end;

  TpopupDetailCreate = class(TPopupMenu)
  private
    Reflector: TReflector;
    DetailsTypes: TList;
    procedure MeasureItem(Sender: TObject; ACanvas: TCanvas; var Width, Height: Integer);
  public
    Constructor Create(pReflector: TReflector);
    Destructor Destroy; override;
    procedure Update;
    procedure Clear;
    procedure Popup(Sender: TObject);
    procedure ItemClick(Sender: TObject);
  end;

  TReflectionMesh = class
  private
    FflEnabled: boolean;
    BindingAccumulator_dX: Extended;
    BindingAccumulator_dY: Extended;

    procedure setflEnabled(Value: boolean);
  public
    Reflector: TReflector;

    ofsX: Extended;
    ofsY: Extended;
    stepX: Extended;
    stepY: Extended;

    Constructor Create(pReflector: TReflector);
    procedure SetParams(const pofsX,pofsY: Extended; const pstepX,pstepY: Extended);
    procedure ReflectInBMP(BMP: TBitmap);
    procedure BindReflectionWindowCenter(Direction_dX,Direction_dY: Extended);
    property flEnabled: boolean read FflEnabled write setflEnabled;
  end;

  TPulsedSelection = class(TTimer)
  private
    Reflector: TReflector;
    flActivated: boolean;
    ptrSelectedObj: TPtr;
    TicksCount: integer;

    procedure Process(Sender: TObject);
    procedure ReflectObject(const Color: TColor; const flNativeColors: boolean);
  public
    Constructor Create(pReflector: TReflector);
    Destructor Destroy; override;
    procedure Activate(const pPtrSelectedObj: TPtr);
    procedure Deactivate;
  end;

  TFigureWinRefl = class;
  THintObj = class
  public
    Figure: TFigureWinRefl;
    Hint: string;
    AlreadyReflected: boolean;

    Constructor Create(pPtrObj: TPtr; pReflector: TReflector);
    procedure GetMarginsFigure(var Xmn,Ymn,Xmx,Ymx: integer);
    destructor Destroy; override;
  end;

  THintsVisibleObjects = class
  private
    FReflector: TReflector;
    Count: integer;
    FItems: Array[0..HintsVisibleObjects_maxCount-1] of THintObj;
    CntDoneShow: integer;
    flCancel: boolean;

    procedure Get;
    function getItem(Index: integer): THintObj;
    procedure InsertObj(ptrObj: TPtr);
    procedure IncCntDoneAndShowProgress;
  public

    Constructor Create(pReflector: TReflector);
    procedure TryShow;
    procedure Show;
    property Items[Index: integer]: THintObj read getItem; default;
    destructor Destroy; override;
  end;

  TUserDynamicHintTrackItem = record
    Next: pointer;
    TimeStamp: TDateTime;
    X,Y: TCrd;
  end;

  TUserDynamicHint = record
    Next: pointer;
    idTObj: integer;
    idObj: integer;
    ptrObj: TPtr;
    Obj_flChange: boolean;
    Obj_LastChangeTime: TDateTime;
    flEnabled: boolean;
    flTracking: boolean;
    Track: pointer;
    TrackNodesCount: integer;
    BackgroundColor: TColor;
    flAlwaysCheckVisibility: boolean;
    InfoImage: TBitmap;
    InfoString: string;
    InfoStringFontName: string;
    InfoStringFontSize: integer;
    InfoStringFontColor: TColor;
    flVisible: boolean;
    BindingX: double;
    BindingY: double;
    DirectionBindingX: double;
    DirectionBindingY: double;
    idTOwner: integer;
    idOwner: integer;
    idOwnerCoType: integer;
    OwnerStatusBar: TObject;
  end;

  TDynamicHints = class;

  TUserDynamicHints = class
  private
    FileName: string;
    TracksFileName: string;
    ItemsTracksChangesCount: integer;

    function CreateItem: pointer;
    procedure DestroyItem(var ptrDestroyItem: pointer);
    function CreateOwnerStatusBar(const idTOwner,idOwner: integer; const idCoType: integer; const Stream: TMemoryStream): TObject;
    procedure DoOnItemStatusBarChange();
    procedure DoOnItemChangeStatusChange();
    procedure ConvertNode(X,Y: Extended; out Xs,Ys: Extended);
  public
    DynamicHints: TDynamicHints;
    Items: Pointer;
    Items_flChanged: boolean;
    flVisible: boolean;
    BackgroundColor: TColor;
    OwnerStatusBarWidth: integer;
    fmUserHintsPanel: TForm;

    Constructor Create(const pDynamicHints: TDynamicHints);
    Destructor Destroy; override;
    procedure Clear;
    procedure Load;
    procedure Save;
    function AddItem(const pidTObj,pidObj: integer; const pBackgroundColor: TColor; const pInfoImage: TBitmap; const pInfoString: string; const pInfoStringFontName: string; const pInfoStringFontSize: integer; const pInfoStringFontColor: TColor): pointer;
    procedure RemoveItem(const ptrItem: pointer);
    procedure RemoveItemByObjPtr(const ptrObj: TPtr);
    procedure EnableDisableItem(const ptrItem: pointer; const flEnabled: boolean);
    procedure EnableDisableItemTrack(const ptrItem: pointer; const pflTracking: boolean);
    procedure EnableDisableAlwaysCheckVisibility(const ptrItem: pointer; const pflAlwaysCheckVisibility: boolean);
    procedure SetItem(const ptrItem: pointer; const pBackgroundColor: TColor; const pInfoImage: TBitmap; const pInfoString: string; const pInfoStringFontName: string; const pInfoStringFontSize: integer; const pInfoStringFontColor: TColor);
    procedure UpdateItemChangeState(const pptrObj: TPtr);
    procedure ClearItemTrack(const ptrItem: pointer);
    procedure SupplyVisualizationPtr(const ptrItem: pointer);
    function GetItemAtPoint(const P: Windows.TPoint; out ptrItem: pointer): boolean;
    procedure SetItemAsVisible(const pptrObj: TPtr; const pFigureWinRefl: TFigureWinRefl);
    procedure AddItemTrackItem(const pptrObj: TPtr);
    procedure EnableDisableItems(const pflEnabled: boolean);
    procedure ClearItemsVisibleState;
    procedure ShowVisibleItems(const BMP: TBitmap; const ptrCancelFlag: pointer; const BestBeforeTime: TDateTime);
    procedure UpdateItemsChangeState(const MinTime: TDateTime);
    procedure ShowControlPanel();
    procedure UpdateReflectorView();
    procedure BindingPoints_Shift(const dX,dY: Extended);
    procedure BindingPoints_Scale(const Xc,Yc: Extended; const Scale: Extended);
    procedure BindingPoints_Rotate(const Xc,Yc: Extended; const Angle: Extended);
    //. item tracks routines
    procedure LoadItemsTracks;
    procedure ClearItemsTracks;
    procedure SaveItemsTracks;
    procedure EnableDisableItemsTracking(const pflEnabled: boolean);
    procedure ShowItemsTracks(const BMP: TBitmap; const ptrCancelFlag: pointer; const BestBeforeTime: TDateTime);
    procedure CheckItemsVisibility(const ActualityInterval: TComponentActualityInterval; const ptrCancelFlag: pointer);
  end;

  TDynamicHint = record
    Next: pointer;
    flValid: boolean;
    id: integer;
    ptrObj: TPtr;
    Level: word;
    //.
    flInfoIsUpdated: boolean;
    InfoImageDATAFileID: integer;
    InfoString: string;
    InfoStringFontName: shortstring;
    InfoStringFontSize: integer;
    InfoStringFontColor: TColor;
    {///- InfoText: THintVisualizationParsedDataInfoTextString;
    InfoTextFontName: THintVisualizationParsedDataFontNameString;
    InfoTextFontSize: integer;
    InfoTextFontColor: TColor;}
    InfoComponent: TID;
    ///- StatusInfoText: THintVisualizationParsedDataStatusInfoTextString;
    Transparency: integer;
    //.
    Extent: TRect;
    Space_BindingPointX: Extended;
    Space_BindingPointY: Extended;
    Space_BaseSquare: Extended;
    BindingPointX: Extended;
    BindingPointY: Extended;
    BaseSquare: integer;
  end;

  TDynamicHints = class
  private
    Items: pointer;
    Items_Count: integer;
  public
    Reflector: TReflector;
    Lock: TCriticalSection;
    Items_MaxCount: integer;
    flEnabled: boolean;
    VisibleFactor: Extended;
    UserDynamicHints: TUserDynamicHints;

    Constructor Create(const pReflector: TReflector);
    Destructor Destroy; override;
    procedure Clear;
    function IsEmpty: boolean;
    procedure EnqueueItemForShow(const ptrHintObj: TPtr; const idHintVisualization: integer; const pBindingPointX,pBindingPointY: Extended; const pBaseSquare: integer);
    function GetItem(const ptrHintObj: TPtr): pointer;
    function IsItemExist(const ptrHintObj: TPtr): boolean;
    function RemoveItem(const ptrHintObj: TPtr): boolean;
    procedure ShowItems(const BMP: TBitmap; const ptrCancelFlag: pointer; const BestBeforeTime: TDateTime);
    function GetHintExtent(const ptrHintObj: TPtr; out Extent: TRect): boolean;
    function GetItemAtPoint(const P: Windows.TPoint; out ptrItem: pointer): boolean;
    procedure ReformFromReflectingLays;
    procedure FormItems(const BMP: TBitmap; const ptrCancelFlag: pointer);
    function GetVisibleFactor(): Extended;
    procedure SetVisibleFactor(const Value: Extended);
    procedure BindingPoints_Shift(const dX,dY: Extended);
    procedure BindingPoints_Scale(const Xc,Yc: Extended; const Scale: Extended);
    procedure BindingPoints_Rotate(const Xc,Yc: Extended; const Angle: Extended);

    function CreateItem: pointer;
    procedure DestroyItem(var ptrDestroy: pointer);
    procedure Item_SetBindingPoint(const ptrItem: pointer; const pBindingPointX,pBindingPointY: Extended; const pBaseSquare: integer);
    procedure Item_UpdateInfo(const ptrItem: pointer);
    procedure Item_UpdateExtent(const BMP: TBitmap; const ptrItem: pointer; const ptrNewExtent: pointer = nil);
    procedure Item_Show(const ptrItem: pointer; const BMP: TBitmap);
  end;

  TEditingOrCreatingObject = class;

  TEditingMode = (emNone,emMoving,emScaling,emLScaling,emLTScaling,emTScaling,emTRScaling,emRScaling,emRDScaling,emDScaling,emDLScaling,emRotating,emWidthScaling);

  TEditingHandle = record
    Enabled: boolean;
    X,Y: Extended;
    LRSize: Extended;
    TDSize: Extended;
    R: Extended;
    dR: Extended;
    Color: TColor;
  end;

  TEditingObjectHandles = class
  private
    Xmin,Ymin: Extended;
    Xmax,Ymax: Extended;
    EditingOrCreatingObject: TEditingOrCreatingObject;
  public
    Handles: array[TEditingMode] of TEditingHandle;
    
    Constructor Create(pEditingOrCreatingObject: TEditingOrCreatingObject);
    Destructor Destroy;
    procedure Reflect(Canvas: TCanvas);
    function CheckEditingMode(const pX,pY: integer): TEditingMode;
  end;

  TEditingOrCreatingObjectRW = class(TReflectionWindow)
  private
    flUseInheritedGetScaleMethod: boolean;
    FScale: Extended;
    function getScale: Extended; override;
  end;

  TCreateCompletionObject = class  
  public
    EditingOrCreatingObject: TEditingOrCreatingObject;

    Constructor Create(const pEditingOrCreatingObject: TEditingOrCreatingObject);
    procedure DoOnCreateClone(const idTClone,idClone: integer); virtual;
  end;

  TEditingOrCreatingObject = class
  private
    ReflectionWindow: TEditingOrCreatingObjectRW;
    FigureWinRefl: TFigureWinRefl;
    AdditiveFigureWinRefl: TFigureWinRefl;
    BMP: TBitmap;
    AlphaChanelBMP: TBitmap;
    LastEditingPointX: integer;
    LastEditingPointY: integer;
    Updater: TTimer;
    Updater_dT: Extended;
    flUpdatePanelPos: boolean;
    AdditionalObjectsList: TList;

    procedure Obj_GetP0Offset(const ptrObj: TPtr; const X,Y: Extended;  out dX,dY: Extended);
    procedure Obj_GetBindPoint(const ptrObj: TPtr; out X,Y: TCrd);
    procedure Figure_ChangeScale(Figure: TFigureWinRefl; const Xc,Yc: Extended; const Scale: Extended);
    procedure Figure_Rotate(Figure: TFigureWinRefl; const Xc,Yc: Extended; const Angle: Extended);
    procedure DoOnUpdate(Sender: TObject);
  public
    Reflector: TReflector;
    flCreating: boolean;
    flDisableScaling: boolean;
    flDisableRotating: boolean;
    idTPrototype: integer;
    idPrototype: integer;
    PrototypePtr: TPtr;
    flBinded: boolean;
    Mode: TEditingMode;
    TranparencyCf: Extended;
    Xorg: TCrd;
    Yorg: TCrd;
    X: TCrd;
    Y: TCrd;
    Scale: Extended;
    Angle: Extended;
    BindMarkerX: Extended;
    BindMarkerY: Extended;
    Rmax: Extended;
    Rmaxscr: Extended;
    Handles: TEditingObjectHandles;
    Panel: TfmEditingOrCreatingObjectPanel;
    LoadFileAfterCreate: WideString;
    CreateCompletionObject: TCreateCompletionObject; 

    Constructor Create(pReflector: TReflector; const pflCreating: boolean; const pidTPrototype,pidPrototype: integer; const pPrototypePtr: TPtr; const pflDisableScaling: boolean = false; const pflDisableRotating: boolean = false);
    Destructor Destroy; override;
    procedure SetForEdit(const pPrototypePtr: TPtr);
    function IsEditing: boolean;
    procedure DoAlign;
    function SetEditingMode(const pX,pY: integer): TEditingMode; overload;
    procedure SetEditingMode(const pX,pY: integer; const pMode: TEditingMode); overload;
    procedure StopEditing;
    procedure ProcessEditingPoint(const pX,pY: integer);
    procedure SetPosition(const pX,pY: TCrd);
    procedure Reset;
    procedure AlignToFormatObj;
    procedure UseInsideObjects(const flUse: boolean);
    procedure ClonePrototype(const idTPrototype,idPrototype: integer; out idClone: integer);
    procedure CloneEditingObject(out idTClone,idClone: integer);
    function Commit: integer;
    procedure ExportAsXML(const FileName: string);
    procedure Reflect(PrimaryBMP: TBitmap);
    function _Reflect(PrimaryBMP: TBitmap): boolean;
  end;

  TObjectEditorHandle = record
    X: integer;
    Y: integer;
    NodeIndex: integer;
    flSelected: boolean;
    flChanged: boolean;
  end;

  TObjectEditorWorkWindow = record
    Xmn,Ymn,
    Xmx,Ymx: SmallInt;
  end;

  TObjectEditor = class
  private
    Reflector: TReflector;
    FigureWinRefl: TFigureWinRefl;
    AdditiveFigureWinRefl: TFigureWinRefl;
    WorkWindow: TObjectEditorWorkWindow;
    HandleSize: integer;
    Handles: TList;
    EditingMode: TEditingMode;
    EditingHandle: pointer;
    EditingWidthScale: Extended;

    procedure UpdateWorkWindow;
    procedure ReflectWorkWindow;
    procedure RestoreWorkWindow;
    procedure Handles_Prepare;
    procedure Handles_Clear;
    function Handles_GetTwoNearestHandles(const pX,pY: integer; out Handle0,Handle1: pointer; out Dist: Extended): boolean;
    procedure RecalculateFiguresForNodeChanged;
    procedure RecalculateFiguresForWidthChanged;
    function Line_GetPointDist(const X0,Y0,X1,Y1: integer; const X,Y: integer; out D: Extended): boolean;
    function Object_GetNodePtrByIndex(const NodeIndex: integer): TPtr;
    procedure _Reflect;
  public
    ptrObject: TPtr;
    
    Constructor Create(const pReflector: TReflector; const pptrObject: TPtr);
    Destructor Destroy; override;
    procedure Reflect;
    function CheckEditingMode(const pX,pY: integer): TEditingMode;
    function SetEditingMode(const pX,pY: integer): TEditingMode;
    procedure ProcessEditingPoint(const pX,pY: integer);
    function GetSelectedHandleIndex: integer;
    procedure StopEditing;
    function IsEditing: boolean;
  end;

  TSelectedRegion = class
  private
    Rectangle: TRect;
    Reflector: TReflector;
    ReflectionID: integer;

    Constructor Create(pReflector: TReflector);
    Destructor Destroy; override;
    procedure Clear;
    procedure Paint;
    function flSet(): boolean;
    procedure SetBegin(pX,pY: integer);
    procedure SetEnd(pX,pY: integer);
    procedure SetReflectorWindow;
  end;

  TLastPlace = record
    ptrNext: pointer;
    Window: TReflectionWindowStrucEx;
  end;

  TObjectTrackItem = record
    Next: pointer;
    X: TCrd;
    Y: TCrd;
    TimeStamp: TDateTime;
  end;

  TObjectTrack = class
  private
    Lock: TCriticalSection;
  public
    Items: pointer;

    Constructor Create;
    Destructor Destroy;
    procedure Clear;
    procedure AddItem(const pX,pY: TCrd);
  end;

  TObjectHighlighting = class
  private
    Lock: TCriticalSection;
    Reflector: TReflector;
    ObjectPtr: TPtr;
    ObjectWindow_flExists: boolean;
    ObjectWindow: TRect;
    HighlightLineWidth: integer;
    FWR: TFigureWinRefl;
    AFWR: TFigureWinRefl;
    Processor: TTimer;

    Constructor Create(const pReflector: TReflector);
    Destructor Destroy; override;
    procedure Clear();
    procedure HighlightObject(const pObjectPtr: TPtr);
    procedure ShowRibberLine(const pCanvas: TCanvas; const pFigureWinRefl: TFigureWinRefl; const pAdditiveFigureWinRefl: TFigureWinRefl);
    procedure ProcessObject;
    procedure UpdateHighlightObject;
    procedure RestoreObject;
    procedure Processor_DoOnTime(Sender: TObject);
  end;

  TInplaceHint = class(TThread)
  private
    Reflector: TReflector;
    Space: TProxySpace;
    ObjPtr: TPtr;
    ObjPosX: integer;
    ObjPosY: integer;
    Panel: TInplaceHintPanel;
    flRestartDelaying: boolean;
    //.
    HintText: string;
    //.
    ThreadException: Exception;

    Constructor Create(const pReflector: TReflector; const pObjPtr: TPtr; const pObjPosX,pObjPosY: integer);
    Destructor Destroy(); override;
    procedure ForceDestroy(); //. for use on process termination
    procedure Execute(); override;
    procedure RestartDelaying();
    procedure SetObjPosition(const pObjPosX,pObjPosY: integer);
    function IsHintPanelExist(): boolean;
    procedure DoOnLoadingStart();
    procedure DoOnLoadingFinish();
    procedure DoOnException();
    procedure DoTerminate; override;
    procedure Finalize();
    procedure Cancel();
    procedure CancelAndHide();
  end;

  TReflecting = class;

  TReflector = class(TAbstractReflector)
    PanelProgressShowHints: TPanel;
    LabelProgressShowHints: TLabel;
    GaugeProgressShowHints: TGauge;
    ImageListButtons: TImageList;
    BeginZoneChangeScaleView: TRxSplitter;
    BeginZoneRotateView: TRxSplitter;
    StatusPanel: TPanel;
    RxLabel1: TRxLabel;
    edCenterCrd: TEdit;
    Bevel1: TBevel;
    Bevel2: TBevel;
    lbSelectedObjName: TRxLabel;
    sbSelectedObjAtCenter: TSpeedButton;
    sbSelectedObjFix: TSpeedButton;
    ToolBar1: TToolBar;
    tbSelectedObjects: TToolButton;
    Bevel3: TBevel;
    pnlReflectingStatus: TPanel;
    lbReflectionStatus: TLabel;
    gaugeReflectingProgress: TGauge;
    pnlControl: TPanel;
    sbImport: TSpeedButton;
    ddCreateObject: TSpeedButton;
    sbCreateObject: TSpeedButton;
    pnlBookmarks: TPanel;
    sbElectedPlaces: TSpeedButton;
    ddElectedPlaces: TSpeedButton;
    sbElectedObjects: TSpeedButton;
    ddElectedObjects: TSpeedButton;
    pnlView: TPanel;
    sbConfig: TSpeedButton;
    sbHints: TSpeedButton;
    pnlSelectedObjectEdit: TPanel;
    sbSelectedObjectProps: TSpeedButton;
    sbSelectedObjectCreateDetail: TSpeedButton;
    sbSelectedObjectDetailProps: TSpeedButton;
    sbSelectedObjectDestroyPoint: TSpeedButton;
    Bevel4: TBevel;
    sbShowDesigner: TSpeedButton;
    pnlCoordinateMesh: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edCoordinateMeshStep: TEdit;
    cbCoordinateMeshEnable: TCheckBox;
    pnlOther: TPanel;
    sbPrint: TSpeedButton;
    cbControl: TLabel;
    cbBookmarks: TLabel;
    cbView: TLabel;
    cbSelectedObjectEdit: TLabel;
    cbCoordinateMesh: TLabel;
    cbOther: TLabel;
    Bevel6: TBevel;
    sbShowHintsCancel: TSpeedButton;
    cbEditing: TCheckBox;
    Bevel7: TBevel;
    cbEditingAdvanced: TCheckBox;
    sbHistoryBack: TSpeedButton;
    HistoryTimer: TTimer;
    sbHistoryNext: TSpeedButton;
    cbAutoAlign: TCheckBox;
    sbDoAlign: TSpeedButton;
    Timer100Msec: TTimer;
    cbWatcher: TCheckBox;
    pnlCompass: TPanel;
    gaCompass: TRxGIFAnimator;
    lbCompassAngle: TLabel;
    cbCompass: TCheckBox;
    sbAlignToNorth: TSpeedButton;
    pnlDynamicHints: TPanel;
    tbDynamicHintsVisibility: TTrackBar;
    sbSelectedObjectStandaloneEditor: TSpeedButton;
    sbGeoCoordinates: TSpeedButton;
    sbShowHideCreateObjectGallery: TSpeedButton;
    sbElectedObjectsGallery: TSpeedButton;
    cbObjectTrack: TCheckBox;
    sbUserDynamicHints: TSpeedButton;
    tbVisibilityFactor: TTrackBar;
    sbNavigator: TSpeedButton;
    RxLabel2: TRxLabel;
    cbStyle: TComboBox;
    Bevel5: TBevel;
    sbReflectionWindowActualityInterval: TSpeedButton;
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure sbSelectedObjAtCenterClick(Sender: TObject);
    procedure tbSelectedObjectsClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure FormDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure FormPaint(Sender: TObject);
    procedure edCenterKeyPress(Sender: TObject; var Key: Char);
    procedure FormMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbCoordinateMeshEnableClick(Sender: TObject);
    procedure edCoordinateMeshStepKeyPress(Sender: TObject; var Key: Char);
    procedure sbCreateObjectClick(Sender: TObject);
    procedure ddCreateObjectClick(Sender: TObject);
    procedure sbElectedPlacesClick(Sender: TObject);
    procedure ddElectedPlacesClick(Sender: TObject);
    procedure sbElectedObjectsClick(Sender: TObject);
    procedure ddElectedObjectsClick(Sender: TObject);
    procedure sbConfigClick(Sender: TObject);
    procedure sbHintsClick(Sender: TObject);
    procedure sbSelectedObjectPropsClick(Sender: TObject);
    procedure sbSelectedObjectDetailPropsClick(Sender: TObject);
    procedure sbSelectedObjectDestroyPointClick(Sender: TObject);
    procedure sbShowDesignerClick(Sender: TObject);
    procedure sbPrintClick(Sender: TObject);
    procedure cbControlMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cbBookmarksMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cbViewMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cbSelectedObjectEditMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cbCoordinateMeshMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure sbSelectedObjectCreateDetailClick(Sender: TObject);
    procedure sbShowHintsCancelClick(Sender: TObject);
    procedure cbEditingClick(Sender: TObject);
    procedure FormDblClick(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure cbEditingAdvancedClick(Sender: TObject);
    procedure sbHistoryBackClick(Sender: TObject);
    procedure HistoryTimerTimer(Sender: TObject);
    procedure sbHistoryNextClick(Sender: TObject);
    procedure cbAutoAlignClick(Sender: TObject);
    procedure sbDoAlignClick(Sender: TObject);
    procedure Timer100MsecTimer(Sender: TObject);
    procedure sbImportClick(Sender: TObject);
    procedure cbCompassClick(Sender: TObject);
    procedure sbAlignToNorthClick(Sender: TObject);
    procedure tbDynamicHintsVisibilityChange(Sender: TObject);
    procedure sbSelectedObjectStandaloneEditorClick(Sender: TObject);
    procedure sbGeoCoordinatesClick(Sender: TObject);
    procedure sbShowHideCreateObjectGalleryClick(Sender: TObject);
    procedure sbElectedObjectsGalleryClick(Sender: TObject);
    procedure cbObjectTrackClick(Sender: TObject);
    procedure sbUserDynamicHintsClick(Sender: TObject);
    procedure tbVisibilityFactorChange(Sender: TObject);
    procedure sbConfigMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sbNavigatorClick(Sender: TObject);
    procedure cbStyleChange(Sender: TObject);
    procedure sbReflectionWindowActualityIntervalClick(Sender: TObject);
  private
    { Private declarations }
    FStyle: TReflectorStyle;
    FMode: TReflectorMode;

    FflagMsMoveView: boolean;
    FflagMsChangeScaleView: boolean;
    FflagMsRotateView: boolean;
    flReflectionChanged: boolean;
    flReflectionAligned: boolean;

    CompassAngle: Extended;

    FptrObjDist: TPtr;

    flProcessingOnClick: boolean;

    //. step rotation var
    RotateAngleStep: Extended;
    RotateAngleAccumulator: Extended;

    //. reflection history
    LastPlacesPtr: pointer;
    NextPlacesPtr: pointer;

    //.
    OverObjectPtr: TPtr;

    fmImportComponents: TForm;
    ObjectManager: TForm;
    fmDesigner: TForm;
    flToolsVisible: boolean;
    Hints: THintsVisibleObjects;
    fmReflectorDynamicHintTextWindow: TForm;
    popupCreateObject: TPopupMenu;
    popupElectedPlaces: TPopupMenu;
    popupElectedObjects: TPopupMenu;
    popupDetailCreate: TPopupMenu;
    //.
    Watcher_ObjPtr: TPtr;
    Watcher_BindingPoint: TPoint;
    Watcher_ReflectionWindowXc: Extended;
    Watcher_ReflectionWindowYc: Extended;
    ObjectTrack: TObjectTrack;
    //.
    InplaceHint_ObjPtr: TPtr;
    InplaceHint: TInplaceHint;

    procedure CreateParams(var Params: TCreateParams); override;
    procedure wmSysCommand(var Message: TMessage); message WM_SYSCOMMAND;
    procedure wmCM_MOUSELEAVE(var Message: TMessage); message CM_MOUSELEAVE;
    procedure wmLimitedReflect(var Message: TMessage); message WM_LIMITEDREFLECT;
    procedure wmBeginCreateObject(var Message: TMessage); message WM_BEGINCREATEOBJECT;
    procedure wmDeleteSputnik(var Message: TMessage); message WM_DELETESPUTNIK;
    procedure wmDeleteObjectEditor(var Message: TMessage); message WM_DELETEOBJECTEDITOR;
    procedure wmDeleteSelection(var Message: TMessage); message WM_DELETESELECTION;
    procedure wmReforming_ShowProgressBar(var Message: TMessage); message WM_SHOWPROGRESSBAR;
    procedure wmReforming_HideProgressBar(var Message: TMessage); message WM_HIDEPROGRESSBAR;
    procedure wmReforming_UpdateProgressBar(var Message: TMessage); message WM_UPDATEPROGRESSBAR;
    procedure wmDropFiles(var msg : TMessage); message WM_DROPFILES;
    procedure wmReflectObjectEditor(var Message: TMessage); message WM_REFLECTOBJECTEDITOR;
    procedure wmValidateReflectionMouseElements(var Message: TMessage); message WM_VALIDATEREFLECTIONMOUSEELEMENTS;
    procedure ChangeWidthHeight(pWidth,pHeight: integer);
    procedure setStyle(Value: TReflectorStyle);
    procedure setMode(Value: TReflectorMode);
    procedure setPtrSelectedObj(Value: TPtr); override;

    procedure Menu_Show;
    procedure Menu_Hide;
    procedure pnlControl_Minimize;
    procedure pnlControl_Restore;
    procedure pnlBookmarks_Minimize;
    procedure pnlBookmarks_Restore;
    procedure pnlView_Minimize;
    procedure pnlView_Restore;
    procedure pnlSelectedObjectEdit_Minimize;
    procedure pnlSelectedObjectEdit_Restore;
    procedure pnlCoordinateMesh_Minimize;
    procedure pnlCoordinateMesh_Restore;
    procedure pnlOther_Minimize;
    procedure pnlOther_Restore;

    procedure LastPlaces_Destroy;
    procedure NextPlaces_Destroy;
    procedure LastPlaces_Insert(const pWindow: TReflectionWindowStrucEx);
    function  LastPlaces_IsPlaceExist(const pWindow: TReflectionWindowStrucEx): boolean;

    procedure DoOnMouseOver(const X,Y: integer);
    procedure DoOnFileDropped(FName: string);
    procedure DoOnDraggedVisualizationLeaveGallery(const Sender: TForm; const VisualizationPtr: TPtr; const X,Y: integer);
    procedure ValidateReflectionMouseElements();

    procedure UpdateCompass;
    procedure UpdateGeoCompass;
  public
    { Public declarations }
    Configuration: TReflectorConfiguration;

    ReflectionWindow: TReflectionWindow;
    ReflectionWindow_ActualityIntervalPanel: TForm;

    Reflecting: TReflecting;
    BMPBuffer: TBitmap;

    ptrSelectedPointObj: TPtr;
    ObjectHighlighting: TObjectHighlighting;
    PulsedSelection: TPulsedSelection;
    OverObj_flDblClick: boolean;
    PanelPropsNeeded: boolean;
    PanelProps: TForm;

    //. mouse
    FXMsLast: integer;
    FYMsLast: integer;
    flMouseMoving: boolean;
    flLeftButtonDown: boolean;
    LeftButtonDownPos: Windows.TPoint;
    MouseShiftState: TShiftState;

    //. coordinate mesh
    CoordinateMesh: TReflectionMesh;

    //.
    fmCreateObjectGallery: TForm;
    fmElectedObjectsGallery: TForm;
    Navigator: TForm;

    //.
    EditingOrCreatingObject: TEditingOrCreatingObject;
    ObjectEditor: TObjectEditor;

    SelectedRegion: TSelectedRegion;

    DynamicHints: TDynamicHints;

    //. geo space converter
    XYToGeoCrdConverter: TForm;

    //. for primary background map
    PrimMap_Exist: boolean;
    PrimMap_Fixing: boolean;
    PrimMap_PosX,
    PrimMap_PosY: integer;
    PrimMap_Image: TImage;

    Constructor Create(pSpace: TProxySpace; pid: integer);
    destructor Destroy; override;
    procedure Loaded; override;

    procedure FormResize(Sender: TObject);
    
    procedure SelectObj(ptrObj: TPtr); override;
    procedure ShowObjAtCenter(ptrObj: TPtr); override;

    procedure PutHandle(Canvas: TCanvas; X,Y: integer;flagActive: boolean);
    procedure PutLine(Canvas: TCanvas; Xs0,Ys0, Xs1,Ys1: integer);

    procedure ShowMarkCenter(Canvas: TCanvas);
    procedure ShowXYToGeoCrdConverterElements(Canvas: TCanvas; const ptrCancelFlag: pointer; const BestBeforeTime: TDateTime);
    procedure ShowObjectTrack(Canvas: TCanvas);
    procedure DoOnPositionChange;

    procedure SetVisibilityFactor(const Factor: integer);
    procedure ShiftReflection(VertShift,HorShift: Extended);
    procedure PixShiftReflection(const VertShift,HorShift: integer);
    procedure SetReflection(const X,Y: Extended);
    procedure SetReflectionByWindow(const pWindow: TReflectionWindowStrucEx);
    procedure ShiftingSetReflection(const X,Y: Extended);
    procedure RotateReflection(Angle: Extended);
    procedure ChangeScaleReflection(const ScaleFactor: Extended);
    function DoAlignReflection: boolean;
    procedure PrintReflection;
    procedure _PaintReflectionWindow();
    procedure PaintReflectionWindow();

    procedure LastPlaces_Back;
    procedure LastPlaces_Next;
    
    function SelectPointObject(X,Y: Extended): boolean;
    procedure MoveSelectedPoint(newX,newY: TCrd);
    procedure DeleteSelectedPointObj;
    procedure DeleteSelectedObj;
    procedure ChangeVisiblePropsSelectedObj;
    procedure SelectedObj__TPanelProps_Show; override;
    procedure SelectedObjDblClick;

    procedure OverObjDblClick;

    function ConvertScrCrd2RealCrd(const SX,SY: word; out X,Y: TCrd): boolean;
    function ConvertScrExtendCrd2RealCrd(const SX,SY: extended; out X,Y: TCrd): boolean;

    procedure ReflectHint;

    procedure RevisionReflectLocal(const ptrObj: TPtr; const Act: TRevisionAct); override;
    procedure RevisionReflect(const ptrObj: TPtr; const Act: TRevisionAct); override;

    function ReflectionID: longword; override;

    //. для поиска объектов с потерянным изображением
    procedure ShowAbondonedObjects(IDType: integer);

    //. для первичной карты
    function PrimMap_Init: boolean;
    procedure PrimMap_Fix;
    procedure PrimMap_Free;
    procedure PrimMap_Shift(dX,dY: integer);
    procedure PrimMap_Destroy;

    //. эксперименальные
    procedure GetShiftForClone(const OrgPoint: TPoint; out ShiftX,ShiftY: TCrd); override;


    function GetObjAsOwnerComponent(ptrObj: TPtr; out oidTObj,oidObj: integer): boolean;
    
    function BeginCreateObject(const idTPrototype,idPrototype: integer; const NewLayID: integer; const pflDisableScaling: boolean = false; const pflDisableRotating: boolean = false): TEditingOrCreatingObject;

    //. own properties
    property Style: TReflectorStyle read FStyle write setStyle;
    property Mode: TReflectorMode read FMode write setMode;
    property ptrSelectedObj: TPtr read FptrSelectedObj write setPtrSelectedObj;
  end;

  TObjWinRefl = record
    Xmn,Ymn,
    Xmx,Ymx: smallint;
  end;

  TNode = record
    X,Y: Extended;
  end;

  TScreenNode = Windows.TPoint;

  TSide = record
    Node0,
    Node1: TNode;
  end;

  TWindowLimit = record
    Vol: integer;
  end;

  TWindow = class
  private
    function getLimit: TWindowLimit;
    function getLimit_Node0: TNode;
    function getLimit_Node1: TNode;
    function getOppositeLimit: TWindowLimit;
    function getIndexPredLimit: integer;
    function getIndexNextLimit: integer;
  public
    Limits: array[0..3] of TWindowLimit;
    IndexLimit: integer;
    Constructor Create(const Left,Up,Right,Down: integer);
    procedure SetLimits(const Left,Up,Right,Down: integer);
    procedure NextLimit;
    procedure PredLimit;
    property Limit: TWindowLimit read getLimit;
    property OppositeLimit: TWindowLimit read getOppositeLimit;
    property Limit_Node0: TNode read getLimit_Node0;
    property Limit_Node1: TNode read getLimit_Node1;
    property IndexPredLimit: integer read getIndexPredLimit;
    property IndexNextLimit: integer read getIndexNextLimit;
    function NodeVisible(const Node: TNode): boolean;
    function GetPointCrossed(const SideFigure: TSide; var Point: TNode): boolean;
    function FindPointCrossed(const Side: TSide; const NumLimits: word; var Point: TNode): boolean;
    function CrossedLimitRightLine(const Side: TSide): boolean;
    function CrossedLimitRightRightLine(const Side: TSide): boolean;
    function CrossedLimitLeftLine(const Side: TSide): boolean;
    function CrossedLimitLeftLeftLine(const Side: TSide): boolean;
    function Strike(const Side: TSide): boolean;
    function Distance(const Node: TNode): Extended;
  end;

  TFigureWinRefl = class
  private
    function getNode: TNode;
  public
    ptrObj: TPtr;
    idTObj: integer;
    idObj: integer;
    flagLoop: boolean;
    Color: TColor;
    flagFill: boolean;
    ColorFill: TColor;
    Width: TSpaceObjLineWidth;
    Style: TPenStyle;
    flPolyLine: boolean;
    flSelected: boolean;
    SelectedPoint_Index: integer;

    Count: integer;
    Nodes: array[0..TFigureWinRefl_MaxNodeCount-1] of TNode;
    CountScreenNodes: integer;
    ScreenNodes: array[0..TFigureWinRefl_MaxNodeCount-1] of TScreenNode;
    ScreenWidth: integer;
    Position: integer;

    Constructor Create;
    procedure Clear;
    procedure Reset;
    procedure Insert(const Node: TNode);
    procedure Next;
    procedure AttractToLimits(const Window: TWindow; const ptrWindowFilledFlag: pointer = nil);
    procedure Optimize;
    function ValidateAsPolyLine(Scale: Extended): boolean; // преобразует фигуру, если flagLoop = false
    procedure Assign(F: TFigureWinRefl);
    function PointIsInside(const Point: TScreenNode): boolean;
    function ScreenNodes_GetMinMax(out Xmn,Ymn,Xmx,Ymx: integer): boolean;
    function ScreenNodes_GetAveragePoint(out X,Y: Extended): boolean;
    function ScreenNodes_PolylineLength(out Length: Extended): boolean;
    function Nodes_GetMinMax(out Xmn,Ymn,Xmx,Ymx: Extended): boolean;
    function Nodes_GetAveragePoint(out X,Y: Extended): boolean;
    property Node: TNode read getNode;
  end;

  TDeletingDump = class;
  TReFormingLays = class;
  TRevising = class;

  TItemLayReflect = record
    ptrNext: pointer;
    ptrObject: TPtr;
    Window: TObjWinRefl;
    Flags_ReflectionWindowIsFilled: boolean;
    ObjUpdating: TThread;
  end;

  TLayReflect = record
    ptrNext: pointer;
    flLay: boolean; //. если true, то значит слой является основным слоем, а не подслоем
    Objects: pointer;
    ObjectsCount: integer;
  end;

  TLastReflectedBitmap = class
  private
    BMP: TBitmap;
    BMP_flSet: boolean;
    Transformatrix: XForm;
    Transformatrix_dX: Extended;
    Transformatrix_dY: Extended;
    Transformatrix_Scaling: Extended;
    Transformatrix_Rotating: Extended;
    Transformatrix_flIdentity: boolean;

    Constructor Create;
    Destructor Destroy; override;
    procedure BMP_SetFrom(const pBMP: TBitmap);
    function BMP_IsSet(): boolean;
    procedure BMP_Clear();
    procedure BMP_ReflectWithTransformation(const pCanvas: TCanvas);
    procedure Transformatrix_SetIdentity();
    function Transformatrix_IsIdentity(): boolean;
    procedure Transformatrix_Move(const dX,dY: single);
    procedure Transformatrix_Scale(const dX,dY: single; const Scale: single);
    procedure Transformatrix_Rotate(const dX,dY: single; const Angle: single);
  end;

  TBriefReflectingType = (brtTimeLimited,brtPartialWithLastReflection);

  TReflectingConfiguration = class
  private
    Reflecting: TReflecting;
    FileName: string;
  public
    BriefReflectingType: TBriefReflectingType;
    BriefReflectingType__TimeLimited_MaxReflectingTime: integer;
    BriefReflectingType__PartialWithLastReflection_MaxReflectingLay: integer;

    Constructor Create(const pReflecting: TReflecting);
    procedure Load();
    procedure Save();
  end;

  TReflecting = class(TThread)
  private
    flReflectingCancel: boolean;
    FigureWinRefl: TFigureWinRefl;
    AdditiveFigureWinRefl: TFigureWinRefl;
  public
    Lock: TCriticalSection;
    Reflector: TReflector;
    flReflecting: boolean;
    flBriefReflecting: boolean;
    Lays: pointer;
    LaysObjectsCount: integer;
    WindowRefl: TWindow;
    Configuration: TReflectingConfiguration;
    ObjectConfiguration: TObject;
    BMP: TBitmap;
    BMP_PixData: pointer;
    LastReflectedBitmap: TLastReflectedBitmap;
    evtQueryReflect: THandle;
    ObjectCreating_Visualisation: TObjectVisualization;
    DeletingDump: TDeletingDump;
    ReFormingLays: TReFormingLays;
    Revising: TRevising;
    ReflectionID: integer;
    ReflectionFrameID: integer;

    Constructor Create(pReflector: TReflector);
    procedure Validate;
    procedure Obj_GetReflWindow(const ptrObj: TPtr; var Xmin,Ymin,Xmax,Ymax: smallint); overload;
    procedure Obj_GetReflWindow(const Obj_ContainerCoord: TContainerCoord; var Xmn,Ymn,Xmx,Ymx: smallint); overload;
    procedure Obj_PrepareFigures(const ptrObject: TPtr; pReflectionWindow: TReflectionWindow; pWindowRefl: TWindow;  pFigureWinRefl,pAdditiveFigureWinRefl: TFigureWinRefl; const ptrWindowFilledFlag: pointer = nil);
    procedure Obj_FigureReflect(const pFigureWinRefl,pAdditiveFigureWinRefl: TFigureWinRefl; pAttractionWindow: TWindow; pCanvas: TCanvas; const flPolylineDashing: boolean; var Obj_Window: TObjWinRefl; const ptrObjUpdating: pointer; const ptrCancelFlag: pointer; const ValidityTime: TDateTime);
    class procedure Obj_ComponentContext_DrawHint(const Space: TProxySpace; const pFigureWinRefl,pAdditiveFigure: TFigureWinRefl; const pCanvas: TCanvas);
    procedure Execute; override;
    procedure Reflecting;
    procedure ReflectLimitedByTime(const ReflectTimeInterval: integer; const ExceptObjPtr: TPtr = nilPtr);
    procedure ReflectPartiallyWithLastReflectedWindow(const MaxReflectingLay: integer);
    procedure BMP_Init(BMP: TBitmap);
    procedure BMP_Reflect(BMP: TBitmap; const flShowDynamicHints: boolean; const ptrCancelFlag: pointer; const BestBeforeTime: TDateTime);
    procedure CancelRRR; //. it cancels Reforming+Reflecting+Revising
    procedure Reflect;
    procedure ResetReflect();
    procedure ForceReflect;
    procedure ReFresh;
    procedure RecalcReflect;
    procedure RevisionReflect(ptrObj: TPtr; const Act: TRevisionAct);
    function GetObjByPoint(const Point: TPoint; const ExceptObjPtr: TPtr; out ptrObj: TPtr): boolean;

    destructor Destroy; override;
  end;


  TDeletingDump = class(TThread)
  private
    Reflecting: TReflecting;
    Lock: TCriticalSection;
  public
    DumpLays: pointer;
    evtQueryDelete: THandle;

    Constructor Create(pReflecting: TReflecting);
    procedure DeletingDump;
    procedure Execute; override;
    destructor Destroy; override;
    class procedure ForceDelete(const ptrptrLay: pointer);
  end;

  EUnnecessaryExecuting = class(Exception);

  TReFormingLays = class(TThread)
  private
    Reflecting: TReflecting;
    {$IFNDEF EmbeddedServer}
    GlobalSpaceManager: ISpaceManager;
    GlobalSpaceRemoteManager: ISpaceRemoteManager;
    {$ENDIF}
  public
    evtQueryReForm: THandle;
    flReforming: boolean;
    flReformingCancel: boolean;

    Constructor Create(pReflecting: TReflecting);
    procedure ReForming;
    procedure PrepareLays;
    procedure ReformLaysFromLocalContext(const ptrCancelFlag: pointer; const BestBeforeTime: TDateTime = MaxDouble);
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
    flDisabled: boolean;
    flRevising: boolean;
    flCancelRevising: boolean;
    Objects: pointer;
  public
    Lock: TCriticalSection;
    evtQueryRevision: THandle;

    Constructor Create(pReflecting: TReflecting);
    destructor Destroy; override;
    procedure ReflLays_InsertObj(const ptrptrLay: pointer; const ptrObj: TPtr; const Lay,SubLay: integer; const Obj_Window: TObjWinRefl);
    function ReflLays_RemoveObj(ptrLay: pointer; const ptrObj: TPtr; out Obj_Lay,Obj_SubLay: integer; out Obj_Window: TObjWinRefl): boolean;
    function ReflLays_GetObjParams(ptrLay: pointer; const ptrObj: TPtr; out Obj_Lay,Obj_SubLay: integer; out Obj_Window: TObjWinRefl): boolean;
    function ReflLays_SetObjParams(ptrLay: pointer; const ptrObj: TPtr; const Obj_Window: TObjWinRefl; out Obj_OldWindow: TObjWinRefl): boolean;
    procedure AddObject(pPtrObj: TPtr; const pAct: TRevisionAct);
    procedure Items_Clear;
    procedure Revising;
    procedure Execute; override;
    procedure Cancel;
    procedure Reset;
    procedure Disable;
    procedure Enable;
  end;

const
  ReflectorStyleStrings: array[TReflectorStyle] of string = ('NORMAL','SIMPLE');

implementation

uses
  unitEventLog,
  ComObj,
  ShlObj,
  RichEdit,
  unitLinearMemory,
  Functionality,
  {$IFDEF ExternalTypes}
  SpaceTypes,
  {$ELSE}
  TypesDefines,
  TypesFunctionality,
  {$ENDIF}
  unitTextInput,
  unitXYToGeoCrdConvertor,
  unitObjectModel,
  unitGeoObjectTrackDecoding, 
  unitSpaceObjPanelProps,
  unitReflectorObjectStandaloneEditor,
  ObjectActionsList,
  unitImportComponents,
  unitSpaceDesigner,
  unitCreatingObjects,
  unitElectedPlaces,
  unitElectedObjects,
  unitSelectedObjects,
  unitReflectorCfg,
  unitObjectReflectingCfg,
  unitReflectorSuperLays,
  unitReflectorDinamicHintTextWindow,
  unitUserHintPanel,
  unitUserHintsPanel,
  unitReflectorNavigator,
  unitVisualizationsGallery,
  unitElectedObjectsGallery,
  unitTimeIntervalSlider,
  unitReflectionWindowActualityIntervalPanel;


{$R *.DFM}



{$I Reflecting.inc}

{TAbstractReflector}
procedure TAbstractReflector.CheckUserObjWrite(const ptrObj: TPtr);
var
  ptrRootObj: TPtr;
  RootObj: TSpaceObj;
begin
{/// + ptrRootObj:=Space.Obj_RootPtr(ptrObj);
Space.ReadObj(RootObj,SizeOf(RootObj), ptrRootObj);
if RootObj.idObj = 0 then Raise Exception.Create('access is denied'); //. =>
with TComponentFunctionality_Create(RootObj.idTObj,RootObj.idObj) do
try
try
CheckUserOperation(idWriteOperation);
except
  Raise Exception.Create('access is denied'); //. =>
  end;
finally
Release;
end;}
end;

function TAbstractReflector.IsObjectCloneAcceptable(const idTObj,idObj: integer): boolean;
var
  S: Extended;

  function IsVisualizationAcceptable(VisualizationFunctionality: TBase2DVisualizationFunctionality): boolean;

    function IsObjAcceptable(const ptrObj: TPtr; const ShiftX,ShiftY: TCrd): boolean;

      procedure ProcessObj(const ptrObj: TPtr; const ShiftX,ShiftY: TCrd);
      var
        Obj: TSpaceObj;
        ptrOwnerObj: TPtr;
      begin
      //.
      Result:=NOT (Space.Obj_HasNodeInside(ptrObj, ShiftX,ShiftY, false) OR Space.Obj_IsForbiddenPrivateArea(ptrObj, ShiftX,ShiftY, false));
      if NOT Result then Exit; //. ->
      //.
      Space.ReadObj(Obj,SizeOf(Obj), ptrObj);
      ptrOwnerObj:=Obj.ptrListOwnerObj;
      While ptrOwnerObj <> nilPtr do begin
        ProcessObj(ptrOwnerObj, ShiftX,ShiftY);
        if NOT Result then Exit; //. ->
        Space.ReadObj(ptrOwnerObj,SizeOf(TPtr), ptrOwnerObj);
        end;
      end;

    begin
    Result:=true;
    ProcessObj(ptrObj, ShiftX,ShiftY);
    end;

  var
    ptrObj: TPtr;
    Obj: TSpaceObj;
    OrgPoint: TPoint;
    ShiftX,ShiftY: TCrd;
  begin
  Result:=true;
  with VisualizationFunctionality do begin
  //. check user space square
  {/// - transferred into the server
  try
  S:=S+Square;
  Space.CheckUserSpaceSquare(S);
  except
    Result:=false;
    Exit; //. ->
    end;}
  //.
  ptrObj:=Ptr;
  if ptrObj <> nilPtr then begin
    Space.ReadObj(Obj,SizeOf(Obj), ptrObj);
    if Obj.ptrFirstPoint <> nilPtr
     then begin
      Space.ReadObj(OrgPoint,SizeOf(OrgPoint), Obj.ptrFirstPoint);
      GetShiftForClone(OrgPoint, ShiftX,ShiftY);
      Result:=Result AND IsObjAcceptable(ptrObj, ShiftX,ShiftY);
      end;
    end;
  end;
  end;

var
  ObjFunctionality: TComponentFunctionality;
  Components: TComponentsList;
  I: integer;
begin
Result:=true;
S:=0;
ObjFunctionality:=TComponentFunctionality_Create(idTObj,idObj);
try
//. check self
with ObjFunctionality do begin
if ObjectIsInheritedFrom(ObjFunctionality,TBase2DVisualizationFunctionality)
 then Result:=Result AND IsVisualizationAcceptable(TBase2DVisualizationFunctionality(ObjFunctionality));
//.
if Result
 then begin //. check own components
  GetComponentsList(Components);
  try
  for I:=0 to Components.Count-1 do begin
    Result:=Result AND IsObjectCloneAcceptable(TItemComponentsList(Components[I]^).idTComponent,TItemComponentsList(Components[I]^).idComponent);
    if NOT Result then Break; //. >
    end;
  finally
  Components.Destroy;
  end;
  end;
end;
finally
ObjFunctionality.Release;
end;
end;


{TReflectionWindow}
Constructor TReflectionWindow.Create(pSpace: TProxySpace; const pReflectionWindowStruc: TReflectionWindowStruc);
var
  Window: TReflectionWindowStrucEx;
begin
with pReflectionWindowStruc do begin
Window.X0:=X0; Window.Y0:=Y0;
Window.X1:=X1; Window.Y1:=Y1;
Window.X2:=X2; Window.Y2:=Y2;
Window.X3:=X3; Window.Y3:=Y3;
Window.Xmn:=Xmn; Window.Ymn:=Ymn;
Window.Xmx:=Xmx; Window.Ymx:=Ymx;
end;
Create(pSpace,Window);
end;

Constructor TReflectionWindow.Create(pSpace: TProxySpace; const pReflectionWindowStruc: TReflectionWindowStrucDouble);
var
  Window: TReflectionWindowStrucEx;
begin
with pReflectionWindowStruc do begin
Window.X0:=X0; Window.Y0:=Y0;
Window.X1:=X1; Window.Y1:=Y1;
Window.X2:=X2; Window.Y2:=Y2;
Window.X3:=X3; Window.Y3:=Y3;
Window.Xmn:=Xmn; Window.Ymn:=Ymn;
Window.Xmx:=Xmx; Window.Ymx:=Ymx;
end;
Create(pSpace,Window);
end;

Constructor TReflectionWindow.Create(pSpace: TProxySpace; const pReflectionWindowStruc: TReflectionWindowStrucEx);
begin
Inherited Create();
Lock:=TCriticalSection.Create();
Space:=pSpace;
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
Normalize();
_VisibleFactor:=4*4;
DynamicHints_VisibleFactor:=100.0;
SetLength(InvisibleLayNumbersArray,0);
//.
_ActualityInterval.BeginTimestamp:=0.0;
_ActualityInterval.EndTimestamp:=MaxDouble;
end;

Destructor TReflectionWindow.Destroy;
begin
Lock.Free();
Inherited;
end;

procedure TReflectionWindow.Update;
begin
Lock.Enter;
try
Xcenter:=(X0+X2)/2.0;
Ycenter:=(Y0+Y2)/2.0;
Xmd:=round((Xmx+Xmn)/2.0);
Ymd:=round((Ymx+Ymn)/2.0);
_Scale:=(Xmx-Xmn)/(Sqrt(sqr(X1-X0)+sqr(Y1-Y0))/cfTransMeter);
HorRange:=Sqrt(sqr(X1-X0)+sqr(Y1-Y0));
VertRange:=Sqrt(sqr(X3-X0)+sqr(Y3-Y0));
GetMaxMin(ContainerCoord.Xmin,ContainerCoord.Ymin,ContainerCoord.Xmax,ContainerCoord.Ymax);
finally
Lock.Leave;
end;
end;

function TReflectionWindow.SpaceCoordsIsEqual(An: TReflectionWindow): boolean;
begin
Lock.Enter;
try
Result:=((X0 = An.X0) AND (Y0 = An.Y0) AND  (X1 = An.X1) AND (Y1 = An.Y1) AND  (X2 = An.X2) AND (Y2 = An.Y2) AND  (X3 = An.X3) AND (Y3 = An.Y3));
finally
Lock.Leave;
end;
end;

function TReflectionWindow.IsEqual(An: TReflectionWindow): boolean;
begin
Lock.Enter;
try
Result:=((X0 = An.X0) AND (Y0 = An.Y0) AND  (X1 = An.X1) AND (Y1 = An.Y1) AND  (X2 = An.X2) AND (Y2 = An.Y2) AND  (X3 = An.X3) AND (Y3 = An.Y3) AND
         (Xmn = An.Xmn) AND (Ymn = An.Ymn) AND (Xmx = An.Xmx) AND (Ymx = An.Ymx))
finally
Lock.Leave;
end;
end;

procedure TReflectionWindow.Assign(Srs: TReflectionWindow);
begin
Lock.Enter;
try
Space:=Srs.Space;
X0:=Srs.X0;Y0:=Srs.Y0;
X1:=Srs.X1;Y1:=Srs.Y1;
X2:=Srs.X2;Y2:=Srs.Y2;
X3:=Srs.X3;Y3:=Srs.Y3;
Xcenter:=Srs.Xcenter;Ycenter:=Srs.Ycenter;
Xmn:=Srs.Xmn;Ymn:=Srs.Ymn;
Xmx:=Srs.Xmx;Ymx:=Srs.Ymx;
Xmd:=Srs.Xmd;Ymd:=Srs.Ymd;
_Scale:=Srs._Scale;
HorRange:=Srs.HorRange;
VertRange:=Srs.VertRange;
ContainerCoord:=Srs.ContainerCoord;
_VisibleFactor:=Srs._VisibleFactor;
DynamicHints_VisibleFactor:=Srs.DynamicHints_VisibleFactor;
finally
Lock.Leave;
end;
end;

procedure TReflectionWindow.AssignWindow(const ReflectionWindowStruc: TReflectionWindowStruc);
begin
Lock.Enter;
try
X0:=ReflectionWindowStruc.X0*cfTransMeter;Y0:=ReflectionWindowStruc.Y0*cfTransMeter;
X1:=ReflectionWindowStruc.X1*cfTransMeter;Y1:=ReflectionWindowStruc.Y1*cfTransMeter;
X2:=ReflectionWindowStruc.X2*cfTransMeter;Y2:=ReflectionWindowStruc.Y2*cfTransMeter;
X3:=ReflectionWindowStruc.X3*cfTransMeter;Y3:=ReflectionWindowStruc.Y3*cfTransMeter;
Xmn:=ReflectionWindowStruc.Xmn;Ymn:=ReflectionWindowStruc.Ymn;
Xmx:=ReflectionWindowStruc.Xmx;Ymx:=ReflectionWindowStruc.Ymx;
Update;
finally
Lock.Leave;
end;
end;

procedure TReflectionWindow.AssignWindow(const ReflectionWindowStruc: TReflectionWindowStrucDouble);
begin
Lock.Enter;
try
X0:=ReflectionWindowStruc.X0*cfTransMeter;Y0:=ReflectionWindowStruc.Y0*cfTransMeter;
X1:=ReflectionWindowStruc.X1*cfTransMeter;Y1:=ReflectionWindowStruc.Y1*cfTransMeter;
X2:=ReflectionWindowStruc.X2*cfTransMeter;Y2:=ReflectionWindowStruc.Y2*cfTransMeter;
X3:=ReflectionWindowStruc.X3*cfTransMeter;Y3:=ReflectionWindowStruc.Y3*cfTransMeter;
Xmn:=ReflectionWindowStruc.Xmn;Ymn:=ReflectionWindowStruc.Ymn;
Xmx:=ReflectionWindowStruc.Xmx;Ymx:=ReflectionWindowStruc.Ymx;
Update;
finally
Lock.Leave;
end;
end;

procedure TReflectionWindow.AssignWindow(const ReflectionWindowStruc: TReflectionWindowStrucEx);
begin
Lock.Enter;
try
X0:=ReflectionWindowStruc.X0*cfTransMeter;Y0:=ReflectionWindowStruc.Y0*cfTransMeter;
X1:=ReflectionWindowStruc.X1*cfTransMeter;Y1:=ReflectionWindowStruc.Y1*cfTransMeter;
X2:=ReflectionWindowStruc.X2*cfTransMeter;Y2:=ReflectionWindowStruc.Y2*cfTransMeter;
X3:=ReflectionWindowStruc.X3*cfTransMeter;Y3:=ReflectionWindowStruc.Y3*cfTransMeter;
Xmn:=ReflectionWindowStruc.Xmn;Ymn:=ReflectionWindowStruc.Ymn;
Xmx:=ReflectionWindowStruc.Xmx;Ymx:=ReflectionWindowStruc.Ymx;
Update;
finally
Lock.Leave;
end;
end;

procedure TReflectionWindow.GetWindow(const flReal: boolean; out vReflectionWindowStruc: TReflectionWindowStruc);
begin
Lock.Enter;
try
if (flReal)
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
finally
Lock.Leave;
end;
end;

procedure TReflectionWindow.GetWindow(const flReal: boolean; out vReflectionWindowStruc: TReflectionWindowStrucDouble);
begin
Lock.Enter;
try
if (flReal)
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
finally
Lock.Leave;
end;
end;

procedure TReflectionWindow.GetWindow(const flReal: boolean; out vReflectionWindowStruc: TReflectionWindowStrucEx);
begin
Lock.Enter;
try
if (flReal)
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
finally
Lock.Leave;
end;
end;

function TReflectionWindow.getScale: Extended;
begin
Lock.Enter;
try
Result:=_Scale;
finally
Lock.Leave;
end;
end;

procedure TReflectionWindow.Normalize;
var
  diffX1X0,diffY1Y0: Extended;
  b: Extended;
  V: Extended;
  S0_X3,S0_Y3,S1_X3,S1_Y3: Extended;
  S0_X2,S0_Y2,S1_X2,S1_Y2: Extended;
begin
Lock.Enter;
try
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
Update();
finally
Lock.Leave;
end;
end;

function TReflectionWindow.ConvertScrExtendCrd2RealCrd(const SX,SY: extended; out X,Y: TCrd): boolean;
var
   VS,HS,diffX0X3,diffY0Y3,diffX0X1,diffY0Y1, ofsX,ofsY: Extended;
begin
Result:=false;
Lock.Enter;
try
VS:=-(SY-Ymn)/(Ymx-Ymn);
HS:=-(SX-Xmn)/(Xmx-Xmn);
//.
diffX0X3:=(X0-X3);diffY0Y3:=(Y0-Y3);
diffX0X1:=(X0-X1);diffY0Y1:=(Y0-Y1);
//.
ofsX:=(diffX0X1)*HS+(diffX0X3)*VS;
ofsY:=(diffY0Y1)*HS+(diffY0Y3)*VS;
//.
X:=(X0+ofsX)/cfTransMeter;
Y:=(Y0+ofsY)/cfTransMeter;
finally
Lock.Leave;
end;
Result:=true;
end;

procedure TReflectionWindow.ConvertRealCrd2ScrExtendCrd(X,Y: Extended;  out Xs,Ys: Extended);
var
  RW: TReflectionWindowStrucEx;
  QdA2: Extended;
  X_C,X_QdC,X_A1,X_QdB2: Extended;
  Y_C,Y_QdC,Y_A1,Y_QdB2: Extended;
begin
with RW do begin
GetWindow(false, RW);
//.
X:=X*cfTransMeter;
Y:=Y*cfTransMeter;
QdA2:=sqr(X-X0)+sqr(Y-Y0);
//.
X_QdC:=sqr(X1-X0)+sqr(Y1-Y0);
X_C:=Sqrt(X_QdC);
X_QdB2:=sqr(X-X1)+sqr(Y-Y1);
X_A1:=(X_QdC-X_QdB2+QdA2)/(2*X_C);
//.
Y_QdC:=sqr(X3-X0)+sqr(Y3-Y0);
Y_C:=Sqrt(Y_QdC);
Y_QdB2:=sqr(X-X3)+sqr(Y-Y3);
Y_A1:=(Y_QdC-Y_QdB2+QdA2)/(2*Y_C);
//.
Xs:=Xmn+X_A1/X_C*(Xmx-Xmn);
Ys:=Ymn+Y_A1/Y_C*(Ymx-Ymn);
end;
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

  procedure TreatePoint(const X0,Y0,X1,Y1,X2,Y2,X3,Y3,Xcenter,Ycenter: Extended; Xl,Yl: Extended; flagLoop,flagFill: boolean); 
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

    if GetPointCrossLineAndMargin(Xl0,Yl0,Xl,Yl, X3,Y3,X0,Y0, Xc,Yc)
     then
      if TreatePointAndLine(Xc,Yc) then GoTo MExit;

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
  RW: TReflectionWindowStrucEx;
  Xc,Yc: Extended;
begin
Result:=false;
//.
Lock.Enter;
try
GetWindow(false, RW);
Xc:=Xcenter;
Yc:=Ycenter;
finally
Lock.Leave;
end;
//.
flagVisibleObjLine:=false;
ptrPoint:=Obj.ptrFirstPoint;
cntLinesUpCenter:=0;
cntLinesDownCenter:=0;
flagPreSet:=true;
while ptrPoint <> nilPtr do begin
  Space.ReadObj(Point,SizeOf(TPoint), ptrPoint);
  try TreatePoint(RW.X0,RW.Y0,RW.X1,RW.Y1,RW.X2,RW.Y2,RW.X3,RW.Y3,Xc,Yc, Point.X,Point.Y, Obj.flagLoop,Obj.flagFill); except end;
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
    try TreatePoint(RW.X0,RW.Y0,RW.X1,RW.Y1,RW.X2,RW.Y2,RW.X3,RW.Y3,Xc,Yc, Point.X,Point.Y, Obj.flagLoop,Obj.flagFill) except end;
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
    try TreatePoint(RW.X0,RW.Y0,RW.X1,RW.Y1,RW.X2,RW.Y2,RW.X3,RW.Y3,Xc,Yc, Nodes[I].X,Nodes[I].Y, true,true); except end;
    if flagVisibleObjLine
     then begin
      Result:=true;
      Destroy;
      Exit;// ->
      end;
    end;
  try TreatePoint(RW.X0,RW.Y0,RW.X1,RW.Y1,RW.X2,RW.Y2,RW.X3,RW.Y3,Xc,Yc, Nodes[0].X,Nodes[0].Y, true,true); except end;
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

  procedure TreatePoint(const X0,Y0,X1,Y1,X2,Y2,X3,Y3,Xcenter,Ycenter: Extended; Xl,Yl: Extended);
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

    if GetPointCrossLineAndMargin(Xl0,Yl0,Xl,Yl, X3,Y3,X0,Y0, Xc,Yc)
     then
      if TreatePointAndLine(Xc,Yc) then GoTo MExit;

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

var
  RW: TReflectionWindowStrucEx;
  Xc,Yc: Extended;
begin
Result:=false;
//.
Lock.Enter;
try
GetWindow(false, RW);
Xc:=Xcenter;
Yc:=Ycenter;
finally
Lock.Leave;
end;
//.
with Obj_ContainerCoord do begin
flagVisibleObjLine:=false;
cntLinesUpCenter:=0;
cntLinesDownCenter:=0;
flagPreSet:=true;
try TreatePoint(RW.X0,RW.Y0,RW.X1,RW.Y1,RW.X2,RW.Y2,RW.X3,RW.Y3,Xc,Yc, Xmin,Ymin); except end;
try TreatePoint(RW.X0,RW.Y0,RW.X1,RW.Y1,RW.X2,RW.Y2,RW.X3,RW.Y3,Xc,Yc, Xmax,Ymin); except end;
if flagVisibleObjLine then Exit; //. ->
try TreatePoint(RW.X0,RW.Y0,RW.X1,RW.Y1,RW.X2,RW.Y2,RW.X3,RW.Y3,Xc,Yc, Xmax,Ymax); except end;
if flagVisibleObjLine then Exit; //. ->
try TreatePoint(RW.X0,RW.Y0,RW.X1,RW.Y1,RW.X2,RW.Y2,RW.X3,RW.Y3,Xc,Yc, Xmin,Ymax); except end;
if flagVisibleObjLine then Exit; //. ->
try TreatePoint(RW.X0,RW.Y0,RW.X1,RW.Y1,RW.X2,RW.Y2,RW.X3,RW.Y3,Xc,Yc, Xmin,Ymin); except end;
if flagVisibleObjLine then Exit; //. ->
if (((cntLinesUpCenter MOD 2) > 0) AND ((cntLinesDownCenter MOD 2) > 0)) then Exit; //. ->
end;
Result:=true;
end;

procedure TReflectionWindow.GetMaxMin(out Xmin,Ymin,Xmax,Ymax: Extended);
begin
Lock.Enter;
try
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
//.
Xmin:=Xmin/CfTransMeter;
Ymin:=Ymin/CfTransMeter;
Xmax:=Xmax/CfTransMeter;
Ymax:=Ymax/CfTransMeter;
finally
Lock.Leave;
end;
end;

procedure TReflectionWindow.GetParams(out Xmin,Ymin,Xmax,Ymax: Extended; out oScale: Extended; out oVisibleFactor: integer);
begin
Lock.Enter;
try
GetMaxMin(Xmin,Ymin,Xmax,Ymax);
oScale:=_Scale;
oVisibleFactor:=_VisibleFactor;
finally
Lock.Leave;
end;
end;

function TReflectionWindow.getVisibleFactor: integer;
begin
Lock.Enter;
try
Result:=_VisibleFactor;
finally
Lock.Leave;
end;
end;

procedure TReflectionWindow.setVisibleFactor(Value: integer);
begin
Lock.Enter;
try
_VisibleFactor:=Value;
finally
Lock.Leave;
end;
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
//.
Lock.Enter;
try
if (Obj_ContainerSquare*Sqr(_Scale) < _VisibleFactor{фактор минимально видимой площади}) then Exit; //. ->
if (ContainerCoord_IsObjectOutside(ContainerCoord, Obj_ContainerCoord)) then Exit; //. ->
finally
Lock.Leave;
end;
if (IsObjectOutside(Obj_ContainerCoord)) then Exit; //. ->
if (NOT IsObjectVisible(ptrObj){окончательная проверка на видимость}) then Exit; //. ->
//.
Result:=true;
end;

function TReflectionWindow.HashCode: Extended;
begin
Lock.Enter;
try
Result:=X0*Y0+X1*Y1;
finally
Lock.Leave;
end;
end;

function TReflectionWindow.GetActualityInterval(): TComponentActualityInterval;
begin
Lock.Enter;
try
Result:=_ActualityInterval;
finally
Lock.Leave;
end;
if (Result.BeginTimestamp = NullTimestamp) then Result.BeginTimestamp:=(Now-TimeZoneDelta); 
end;

procedure TReflectionWindow.SetActualityInterval(const Value: TComponentActualityInterval);
begin
Lock.Enter;
try
_ActualityInterval:=Value;
finally
Lock.Leave;
end;
end;


{TPulsedSelection}
Constructor TPulsedSelection.Create(pReflector: TReflector);
begin
Inherited Create(nil);
Enabled:=false;
Interval:=150;
Reflector:=pReflector;
flActivated:=false;
ptrSelectedObj:=nilPtr;
TicksCount:=0;
OnTimer:=Process;
end;

Destructor TPulsedSelection.Destroy;
begin
Deactivate;
Inherited;
end;

procedure TPulsedSelection.ReflectObject(const Color: TColor; const flNativeColors: boolean);

  function ProcessObject(const ptrObj: TPtr): boolean;
  var
    CC: TContainerCoord;
    CS: Extended;
    Window: TObjWinRefl;
    Obj: TSpaceObj;
    ptrOwnerObj: TPtr;
    FWR: TFigureWinRefl;
    AFWR: TFigureWinRefl;

    procedure ShowRibberLine(pCanvas: TCanvas; pFigureWinRefl: TFigureWinRefl;pAdditiveFigureWinRefl: TFigureWinRefl);
    begin
    pCanvas.Lock;
    try
    with pCanvas.Pen do begin
    Width:=1;
    Style:=psDot;
    if Frac(TicksCount/2) > 0
     then begin
      Color:=clWhite;
      pCanvas.Brush.Color:=clRed;
      end
     else begin
      Color:=clRed;
      pCanvas.Brush.Color:=clWhite;
      end;
    end;
    if (pAdditiveFigureWinRefl.CountScreenNodes > 0)
     then with pAdditiveFigureWinRefl do begin
      pCanvas.PolyLine(Slice(ScreenNodes, CountScreenNodes));
      end
     else
      if (pFigureWinRefl.CountScreenNodes > 0)
       then with pFigureWinRefl do begin
        pCanvas.PolyLine(Slice(ScreenNodes, CountScreenNodes));
        end;
    finally
    pCanvas.UnLock;
    end;
    end;


  begin
  Result:=false;
  with Reflector do begin
  //. check object existance
  if (NOT Reflector.Space.Obj_IsCached(ptrSelectedObj)) then Exit; //. ->
  //. check for object visibility
  with CC do begin
  if (NOT Space.Obj_GetMinMax(Xmin,Ymin,Xmax,Ymax, ptrObj)) then Raise Exception.Create('can not get object container'); //. =>
  CS:=(Xmax-Xmin)*(Ymax-Ymin);
  end;
  if (Reflecting.Reflector.ReflectionWindow.IsObjectVisible(CS,CC,ptrObj))
   then begin //. reflect object
    with Reflecting do begin
    FWR:=TFigureWinRefl.Create;
    AFWR:=TFigureWinRefl.Create;
    try
    Obj_PrepareFigures(ptrObj, ReflectionWindow,WindowRefl,  FWR,AFWR);
    ShowRibberLine(Reflector.Canvas, FWR,AFWR);
    finally
    AFWR.Destroy;
    FWR.Destroy;
    end;
    end;
    end;
  Result:=true;
  Exit; //. ->
  Space.ReadObj(Obj,SizeOf(Obj), ptrObj);
  //. process own objects
  ptrOwnerObj:=Obj.ptrListOwnerObj;
  while ptrOwnerObj <> nilPtr do begin
   if (NOT ProcessObject(ptrOwnerObj)) then Exit; //. ->
   Space.ReadObj(ptrOwnerObj,SizeOf(TPtr), ptrOwnerObj);
   end;
  end;
  Result:=true;
  end;

begin
if ptrSelectedObj = nilPtr then Exit; //. ->
try
ProcessObject(ptrSelectedObj);
except
  //. catch exceptions when object is destroyed
  end;
end;

procedure TPulsedSelection.Process(Sender: TObject);
begin
if NOT (Reflector.Reflecting.flReflecting OR Reflector.Reflecting.flBriefReflecting OR Reflector.Reflecting.Revising.flRevising)
 then begin
  ReflectObject(0,true);
  Inc(TicksCount);
  end;
end;

procedure TPulsedSelection.Activate(const pPtrSelectedObj: TPtr);
begin
if flActivated then Deactivate;
ptrSelectedObj:=pPtrSelectedObj;
Enabled:=true;
flActivated:=true;
end;

procedure TPulsedSelection.Deactivate;
begin
if (Reflector.Reflecting = nil) then Exit; //. ->
if NOT flActivated then Exit; //. ->
if NOT (Reflector.Reflecting.flReflecting OR Reflector.Reflecting.flBriefReflecting OR Reflector.Reflecting.Revising.flRevising)
 then
  if (Reflector.Space.Obj_IsCached(ptrSelectedObj))
   then Reflector.Reflecting.RevisionReflect(ptrSelectedObj, actReFresh)
   else Reflector.RePaint();
Enabled:=false;
flActivated:=false;
end;


{TObjectHighlighting}
Constructor TObjectHighlighting.Create(const pReflector: TReflector);
begin
Inherited Create;
Lock:=TCriticalSection.Create;
Reflector:=pReflector;
ObjectWindow_flExists:=false;
ObjectPtr:=nilPtr;
HighlightLineWidth:=3;
FWR:=TFigureWinRefl.Create;
AFWR:=TFigureWinRefl.Create;
Processor:=TTimer.Create(nil);
Processor.Enabled:=false;
Processor.OnTimer:=Processor_DoOnTime;
end;

Destructor TObjectHighlighting.Destroy;
begin
RestoreObject;
AFWR.Free;
FWR.Free;
Lock.Free;
Inherited;
end;

procedure TObjectHighlighting.Clear();
begin
RestoreObject();
end;

procedure TObjectHighlighting.HighlightObject(const pObjectPtr: TPtr);
begin
if ((Reflector.Mode <> rmBrowsing) OR (pObjectPtr = ObjectPtr)) then Exit; //. ->
//.
Lock.Enter;
try
try
RestoreObject();
except
  //. catch exceptions when object is destroyed
  end;
finally
Lock.Leave;
end;
//.
Processor.Enabled:=false;
ObjectPtr:=pObjectPtr;
Processor.Interval:=333; //. highlight pre-delay
Processor.Enabled:=true;
end;

procedure TObjectHighlighting.ShowRibberLine(const pCanvas: TCanvas; const pFigureWinRefl: TFigureWinRefl; const pAdditiveFigureWinRefl: TFigureWinRefl);
var
  PW: integer;
  PM: TPenMode;
begin
with pCanvas.Pen do begin
PW:=Width;
PM:=Mode;
try
Width:=HighlightLineWidth;
Style:=psSolid;
Color:=TColor($007777FF);
Mode:=pmXor;
if (pAdditiveFigureWinRefl.CountScreenNodes > 0)
 then with pAdditiveFigureWinRefl do pCanvas.PolyLine(Slice(ScreenNodes, CountScreenNodes))
 else
  if (pFigureWinRefl.CountScreenNodes > 0) then with pFigureWinRefl do pCanvas.PolyLine(Slice(ScreenNodes, CountScreenNodes));
finally
Width:=PW;
Mode:=PM;
end;
Width:=1;
Style:=psSolid;
Color:=clRed;
if (pAdditiveFigureWinRefl.CountScreenNodes > 0)
 then with pAdditiveFigureWinRefl do pCanvas.PolyLine(Slice(ScreenNodes, CountScreenNodes))
 else
  if (pFigureWinRefl.CountScreenNodes > 0) then with pFigureWinRefl do pCanvas.PolyLine(Slice(ScreenNodes, CountScreenNodes));
end;
end;

procedure TObjectHighlighting.ProcessObject;
var
  CC: TContainerCoord;
  CS: Extended;
  Window: TObjWinRefl;
  Obj: TSpaceObj;
  ptrOwnerObj: TPtr;
  Xmn,Ymn, Xmx,Ymx: Integer;
begin
if (ObjectPtr = nilPtr)
 then begin
  ObjectWindow_flExists:=false;
  Exit; //. ->
  end;
with Reflector do begin
//. check object existance
if (NOT Space.Obj_IsCached(ObjectPtr)) then Exit; //. ->
//. check for object visibility
with CC do begin
if (NOT Space.Obj_GetMinMax(Xmin,Ymin,Xmax,Ymax, ObjectPtr)) then Raise Exception.Create('can not get object container'); //. =>
CS:=(Xmax-Xmin)*(Ymax-Ymin);
end;
if (ReflectionWindow.IsObjectVisible(CS,CC,ObjectPtr))
 then begin //. reflect object
  Lock.Enter;
  try
  Reflector.Canvas.Lock;
  try
  with Reflecting do begin
  Obj_PrepareFigures(ObjectPtr, ReflectionWindow,WindowRefl,  FWR,AFWR);
  ShowRibberLine(Canvas, FWR,AFWR);
  //.
  if (AFWR.CountScreenNodes > 0)
   then begin
    AFWR.ScreenNodes_GetMinMax(Xmn,Ymn,Xmx,Ymx);
    ObjectWindow.Left:=Xmn-HighlightLineWidth; ObjectWindow.Top:=Ymn-HighlightLineWidth;
    ObjectWindow.Right:=Xmx+HighlightLineWidth; ObjectWindow.Bottom:=Ymx+HighlightLineWidth;
    ObjectWindow_flExists:=true;
    end
   else
    if (FWR.CountScreenNodes > 0)
     then begin
      FWR.ScreenNodes_GetMinMax(Xmn,Ymn,Xmx,Ymx);
      ObjectWindow.Left:=Xmn-HighlightLineWidth; ObjectWindow.Top:=Ymn-HighlightLineWidth;
      ObjectWindow.Right:=Xmx+HighlightLineWidth; ObjectWindow.Bottom:=Ymx+HighlightLineWidth;
      ObjectWindow_flExists:=true;
      end
     else ObjectWindow_flExists:=false;
  end;
  finally
  Reflector.Canvas.UnLock;
  end;
  finally
  Lock.Leave;
  end;
  end;
end;
end;

procedure TObjectHighlighting.UpdateHighlightObject;
begin
if ((Reflector.Mode <> rmBrowsing) OR (ObjectPtr = nilPtr)) then Exit; //. ->
RestoreObject();
Processor_DoOnTime(nil);
end;

procedure TObjectHighlighting.RestoreObject;
var
  Xmn,Ymn, Xmx,Ymx: Integer;
begin
if (Reflector.Reflecting = nil) then Exit; //. ->
if (ObjectWindow_flExists)
 then begin
  if (NOT Reflector.Reflecting.flReflecting)
   then begin
    Xmn:=ObjectWindow.Left; Ymn:=ObjectWindow.Top;
    Xmx:=ObjectWindow.Right; Ymx:=ObjectWindow.Bottom;
    //.
    Lock.Enter;
    try
    Reflector.BMPBuffer.Canvas.Lock;
    try
    Reflector.Canvas.Lock;
    try
    BitBlt(Reflector.Canvas.Handle, Xmn, Ymn, Xmx-Xmn,Ymx-Ymn,  Reflector.BMPBuffer.Canvas.Handle, Xmn,Ymn, SRCCOPY);
    finally
    Reflector.Canvas.UnLock;
    end;
    finally
    Reflector.BMPBuffer.Canvas.UnLock;
    end;
    finally
    Lock.Leave;
    end;
    end;
  ObjectWindow_flExists:=false;
  end;
//.
ObjectPtr:=nilPtr;
end;

procedure TObjectHighlighting.Processor_DoOnTime(Sender: TObject);
begin
Lock.Enter;
try
try
ProcessObject();
except
  //. catch exceptions when object is destroyed
  end;
finally
Lock.Leave;
end;
//. stop processor
Processor.Enabled:=false;
end;


{TInplaceHint}
Constructor TInplaceHint.Create(const pReflector: TReflector; const pObjPtr: TPtr; const pObjPosX,pObjPosY: integer);
begin
Reflector:=pReflector;
Space:=Reflector.Space;
ObjPtr:=pObjPtr;
ObjPosX:=pObjPosX;
ObjPosY:=pObjPosY;
Panel:=nil;
flRestartDelaying:=false;
FreeOnTerminate:=true;
Inherited Create(false);
end;

Destructor TInplaceHint.Destroy();
begin
Cancel();
Inherited;
end;

procedure TInplaceHint.ForceDestroy();
begin
TerminateThread(Handle,0);
Destroy();
end;

procedure TInplaceHint.RestartDelaying();
begin
flRestartDelaying:=true;
end;

procedure TInplaceHint.SetObjPosition(const pObjPosX,pObjPosY: integer);
begin
ObjPosX:=pObjPosX;
ObjPosY:=pObjPosY;
//.
if (Panel <> nil) then Panel.SetPosition(ObjPosX,ObjPosY);
end;

function TInplaceHint.IsHintPanelExist(): boolean;
begin
Result:=((Panel <> nil) AND (Panel.Visible));
end;

procedure TInplaceHint.Execute();
const
  BeforeHintDelay = 10*1{seconds};
  HintVisibilityTimeout = 10*30{seconds};
var
  I: integer;
  idTOwner,idOwner: integer;
  HintInfo: TByteArray;
begin
CoInitializeEx(nil,COINIT_MULTITHREADED);
try
if (Terminated) then Exit; //. ->
try
for I:=0 to BeforeHintDelay-1 do begin
  Sleep(100);
  if (Terminated) then Exit; //. ->
  end;
//.
Synchronize(DoOnLoadingStart);
//. loading hint
with TComponentFunctionality_Create(Space.Obj_IDType(ObjPtr),Space.Obj_ID(ObjPtr)) do
try
if (GetOwner({out}idTOwner,idOwner))
 then begin
  if (idTOwner <> idTCoComponent)
   then with TComponentFunctionality_Create(idTOwner,idOwner) do
    try
    if (GetHintInfo(1{simple info},1{txt format},{out} HintInfo))
     then begin
      SetLength(HintText,Length(HintInfo));
      if (Length(HintInfo) > 0) then Move(Pointer(@HintInfo[0])^,Pointer(@HintText[1])^,Length(HintInfo));
      HintText:=Name+#$0D#$0A+#$0D#$0A+HintText;
      end
     else HintText:='';
    finally
    Release();
    end
   else with TCoComponentFunctionality(TComponentFunctionality_Create(idTOwner,idOwner)) do
    try
    if (Space.Plugins__CoComponent_GetHintInfo(Space.UserName,Space.UserPassword, idOwner,idCoType(), 1{simple info},1{txt format},{out} HintInfo))
     then begin
      SetLength(HintText,Length(HintInfo));
      if (Length(HintInfo) > 0) then Move(Pointer(@HintInfo[0])^,Pointer(@HintText[1])^,Length(HintInfo));
      end
     else HintText:=Hint;
    finally
    Release();
    end;
  end
 else HintText:=''; ///? Hint
finally
Release();
end;
if (HintText = '') then Exit; //. ->
//.
while (flRestartDelaying) do begin
  flRestartDelaying:=false;
  //.
  for I:=0 to BeforeHintDelay-1 do begin
    Sleep(100);
    if (flRestartDelaying) then Break; //. >
    if (Terminated) then Exit; //. ->
    end;
  end;
//.
if (Terminated) then Exit; //. ->
Synchronize(DoOnLoadingFinish);
//. keep hint panel visible for a time
for I:=0 to HintVisibilityTimeout-1 do begin
  Sleep(100);
  if (Terminated) then Break; //. >
  end;   
except
  on E: Exception do begin
    ThreadException:=Exception.Create(E.Message);
    Synchronize(DoOnException);
    end;
  end;
finally
CoUnInitialize;
end;
end;

procedure TInplaceHint.DoOnLoadingStart();
begin
Screen.Cursor:=crAppStart;
end;

procedure TInplaceHint.DoOnLoadingFinish();
begin
Screen.Cursor:=crDefault;
//.
if (Terminated) then Exit; //. ->
Panel:=TInplaceHintPanel.Create(Reflector,'',ObjPosX,ObjPosY);
Panel.Parent:=Reflector;
Panel.Show();
Panel.SendToBack();
Panel.SetHintText(HintText);
end;

procedure TInplaceHint.DoOnException();
begin
if (Terminated) then Exit; //. ->
if (Reflector.Space.State <> psstWorking) then Exit; //. ->
Application.MessageBox(PChar('error while loading object hint, '+ThreadException.Message),'error',MB_ICONEXCLAMATION+MB_OK);
end;

procedure TInplaceHint.DoTerminate();
begin
Synchronize(Finalize);
end;

procedure TInplaceHint.Finalize();
begin
FreeAndNil(Panel);
Screen.Cursor:=crDefault;
//.
if (Reflector = nil) then Exit; //. ->
//.
if (Reflector.InplaceHint = Self) then Reflector.InplaceHint:=nil;
end;

procedure TInplaceHint.Cancel();
begin
Terminate();
end;

procedure TInplaceHint.CancelAndHide();
begin
Terminate();
FreeAndNil(Panel);
end;


{TReflectorConfiguration}
Constructor TReflectorConfiguration.Create(pReflector: TReflector);
begin
Inherited Create;
Reflector:=pReflector;
ConfigurationFileName:='Reflector'+'\'+IntToStr(Reflector.id)+'\'+'ReflectorConfiguration.xml';
Open();
end;

destructor TReflectorConfiguration.Destroy;
begin
Inherited;
end;

procedure TReflectorConfiguration.Open;
var
  FileStream: TFileStream;
  MemoryStream: TMemoryStream;
  BA: TByteArray;

  procedure ReadFromStream(Stream: TStream);
  var
    SI: smallint;
  begin
  try
  with Stream do begin
  //. read Reflection window
  Read(ReflectionWindowStruc,SizeOf(ReflectionWindowStruc));
  //. read Reflector layout
  Read(Left,SizeOf(Left));
  Read(Top,SizeOf(Top));
  Read(Width,SizeOf(Width));
  Read(Height,SizeOf(Height));
  //. 
  Read(flDisableObjectChanging,SizeOf(flDisableObjectChanging));
  Read(flHideControlBars,SizeOf(flHideControlBars));
  Read(flHideControlPage,SizeOf(flHideControlPage));
  Read(flHideBookmarksPage,SizeOf(flHideBookmarksPage));
  Read(flHideEditPage,SizeOf(flHideEditPage));
  Read(flHideViewPage,SizeOf(flHideViewPage));
  Read(flHideOtherPage,SizeOf(flHideOtherPage));
  Read(flHideCreateButton,SizeOf(flHideCreateButton));
  Read(flDisableNavigate,SizeOf(flDisableNavigate));
  Read(flDisableMoveNavigate,SizeOf(flDisableMoveNavigate));
  Read(flHideCoordinateMeshPage,SizeOf(flHideCoordinateMeshPage));
  Read(flCoordinateMeshEnabled,SizeOf(flCoordinateMeshEnabled));
  Read(CoordinateMeshStep,SizeOf(CoordinateMeshStep));
  //.
  {///? try
  Read(flNavigator,SizeOf(flNavigator));
  except
    flNavigator:=false;
    end;
  try
  Read(flGeoPanel,SizeOf(flGeoPanel));
  except
    flGeoPanel:=false;
    end;
  try
  Read(SI,SizeOf(SI));
  Style:=TReflectorStyle(SI);
  except
    Style:=rsSpaceViewing;
    end;
  try
  Read(SI,SizeOf(SI));
  Mode:=TReflectorMode(SI);
  except
    Mode:=rmBrowsing;
    end;}
  end;
  except
    On E: Exception do EventLog.WriteMajorEvent('ReflectorConfiguration','Cannot read reflector configuration (idReflector = '+IntToStr(Reflector.ID)+').',E.Message);
    end;
  end;

  procedure LoadLocalConfiguration();
  var
    Doc: IXMLDOMDocument;
    VersionNode: IXMLDOMNode;
    Version: integer;
    Node: IXMLDOMNode;
  begin
  with TProxySpaceUserProfile.Create(Reflector.Space) do
  try
  if (FileExists(ProfileFolder+'\'+ConfigurationFileName))
   then begin
    SetProfileFile(ConfigurationFileName);
    Doc:=CoDomDocument.Create;
    Doc.Set_Async(false);
    Doc.Load(ProfileFile);
    VersionNode:=Doc.documentElement.selectSingleNode('/ROOT/Version');
    if VersionNode <> nil
     then Version:=VersionNode.nodeTypedValue
     else Version:=0;
    if (Version <> 0) then Exit; //. ->
    //.
    Node:=Doc.documentElement.selectSingleNode('/ROOT/ReflectionWindow/VisibilityFactor');
    ReflectionWindow_VisibilityFactor:=Node.nodeTypedValue;
    //.
    Node:=Doc.documentElement.selectSingleNode('/ROOT/CreateObjectsGallery/Visible');
    if (Node <> nil) then flCreateObjectsGallery:=Node.nodeTypedValue else flCreateObjectsGallery:=false;
    //.
    Node:=Doc.documentElement.selectSingleNode('/ROOT/ElectedObjectsGallery/Visible');
    if (Node <> nil) then flElectedObjectsGallery:=Node.nodeTypedValue else flElectedObjectsGallery:=false;
    //.
    Node:=Doc.documentElement.selectSingleNode('/ROOT/NavigatorPanel/Visible');
    if (Node <> nil) then flNavigator:=Node.nodeTypedValue else flNavigator:=true;
    //.
    Node:=Doc.documentElement.selectSingleNode('/ROOT/GeoPanel/Visible');
    if (Node <> nil) then flGeoPanel:=Node.nodeTypedValue else flGeoPanel:=true;
    //.
    Node:=Doc.documentElement.selectSingleNode('/ROOT/Style');
    if (Node <> nil) then Style:=Node.nodeTypedValue else Style:=rsSpaceViewing;
    //.
    Node:=Doc.documentElement.selectSingleNode('/ROOT/Mode');
    if (Node <> nil) then Mode:=Node.nodeTypedValue else Mode:=rmBrowsing;
    end;
  finally
  Destroy;
  end;
  end;

begin
//. inital configuration
ReflectionWindow_VisibilityFactor:=4*4;
flCreateObjectsGallery:=false;
flElectedObjectsGallery:=false;
flNavigator:=true;
flGeoPanel:=true;
Style:=rsSpaceViewing;
Mode:=rmBrowsing;
//. read default configuration
FileStream:=TFileStream.Create(Reflector.Space.WorkLocale+tnReflectorConfiguration,fmOpenRead);
try
ReadFromStream(FileStream);
finally
FileStream.Destroy;
end;
//. read remote configuration
if (NOT Reflector.Space.flOffline)
 then //. read user-defined config
  {$IFNDEF EmbeddedServer}
  if (GetISpaceUserReflector(Reflector.Space.SOAPServerURL).Get_Config(Reflector.Space.UserName,Reflector.Space.UserPassword,Reflector.id,{out} BA))
  {$ELSE}
  if (SpaceUserReflector_Get_Config(Reflector.Space.UserName,Reflector.Space.UserPassword,Reflector.id,{out} BA))
  {$ENDIF}
   then begin
    MemoryStream:=TMemoryStream.Create();
    try
    ByteArray_PrepareStream(BA,TStream(MemoryStream));
    ReadFromStream(MemoryStream);
    finally
    MemoryStream.Destroy();
    end;
    end;
//. read local configuration
LoadLocalConfiguration();
end;

procedure TReflectorConfiguration.Save;
var
  FileStream: TFileStream;
  MemoryStream: TMemoryStream;
  BA: TByteArray;

  procedure WriteIntoStream(Stream: TStream);
  var
    SI: SmallInt;
  begin
  with Stream do begin
  //. write Reflection window
  Write(ReflectionWindowStruc,SizeOf(ReflectionWindowStruc));
  //. write Reflector layout
  Write(Left,SizeOf(Left));
  Write(Top,SizeOf(Top));
  Write(Width,SizeOf(Width));
  Write(Height,SizeOf(Height));
  //. 
  Write(flDisableObjectChanging,SizeOf(flDisableObjectChanging));
  Write(flHideControlBars,SizeOf(flHideControlBars));
  Write(flHideControlPage,SizeOf(flHideControlPage));
  Write(flHideBookmarksPage,SizeOf(flHideBookmarksPage));
  Write(flHideEditPage,SizeOf(flHideEditPage));
  Write(flHideViewPage,SizeOf(flHideViewPage));
  Write(flHideOtherPage,SizeOf(flHideOtherPage));
  Write(flHideCreateButton,SizeOf(flHideCreateButton));
  Write(flDisableNavigate,SizeOf(flDisableNavigate));
  Write(flDisableMoveNavigate,SizeOf(flDisableMoveNavigate));
  Write(flHideCoordinateMeshPage,SizeOf(flHideCoordinateMeshPage));
  Write(flCoordinateMeshEnabled,SizeOf(flCoordinateMeshEnabled));
  Write(CoordinateMeshStep,SizeOf(CoordinateMeshStep));
  //.
  {///? Write(flNavigator,SizeOf(flNavigator));
  Write(flGeoPanel,SizeOf(flGeoPanel));
  SI:=SmallInt(Style);
  Write(SI,SizeOf(SI));
  SI:=SmallInt(Mode);
  Write(SI,SizeOf(SI));}
  end;
  end;

  procedure SaveLocalConfiguration();
  var
    Doc: IXMLDOMDocument;
    PI: IXMLDOMProcessingInstruction;
    Root: IXMLDOMElement;
    VersionNode: IXMLDOMElement;
    Node,SubNode: IXMLDOMElement;
  begin
  Doc:=CoDomDocument.Create;
  Doc.Set_Async(false);
  PI:=Doc.createProcessingInstruction('xml', 'version=''1.0''');
  Doc.insertBefore(PI, Doc.childNodes.Item[0]);
  Root:=Doc.createElement('ROOT');
  Root.setAttribute('xmlns:dt', 'urn:schemas-microsoft-com:datatypes');
  Doc.documentElement:=Root;
  VersionNode:=Doc.createElement('Version');
  VersionNode.nodeTypedValue:=0;
  Root.appendChild(VersionNode);
  //.
  Node:=Doc.createElement('ReflectionWindow');
  SubNode:=Doc.createElement('VisibilityFactor');
  SubNode.nodeTypedValue:=ReflectionWindow_VisibilityFactor;
  Node.appendChild(SubNode);
  Root.appendChild(Node);
  //.
  Node:=Doc.createElement('CreateObjectsGallery');
  SubNode:=Doc.createElement('Visible');
  SubNode.nodeTypedValue:=flCreateObjectsGallery;
  Node.appendChild(SubNode);
  Root.appendChild(Node);
  //.
  Node:=Doc.createElement('ElectedObjectsGallery');
  SubNode:=Doc.createElement('Visible');
  SubNode.nodeTypedValue:=flElectedObjectsGallery;
  Node.appendChild(SubNode);
  Root.appendChild(Node);
  //.
  Node:=Doc.createElement('NavigatorPanel');
  SubNode:=Doc.createElement('Visible');
  SubNode.nodeTypedValue:=flNavigator;
  Node.appendChild(SubNode);
  Root.appendChild(Node);
  //.
  Node:=Doc.createElement('GeoPanel');
  SubNode:=Doc.createElement('Visible');
  SubNode.nodeTypedValue:=flGeoPanel;
  Node.appendChild(SubNode);
  Root.appendChild(Node);
  //.
  Node:=Doc.createElement('Style');
  Node.nodeTypedValue:=Style;
  Root.appendChild(Node);
  //.
  Node:=Doc.createElement('Mode');
  Node.nodeTypedValue:=Mode;
  Root.appendChild(Node);
  //. save xml document
  with TProxySpaceUserProfile.Create(Reflector.Space) do
  try
  ProfileFile:=ProfileFolder+'\'+ConfigurationFileName;
  ForceDirectories(ExtractFilePath(ProfileFile));
  Doc.Save(ProfileFile);
  finally
  Destroy;
  end;
  end;

var
  R: boolean;
begin
R:=UpdateByReflector();
//. write default config
{///- FileStream:=TFileStream.Create(Reflector.Space.WorkLocale+tnReflectorConfiguration,fmOpenWrite);
try
WriteIntoStream(FileStream);
finally
FileStream.Destroy;
end;}
//. write local configuraton
if (R)
 then SaveLocalConfiguration();
//. write remote configuraton
if (NOT Reflector.Space.flOffline)
 then begin //. write user defined config
  MemoryStream:=TMemoryStream.Create;
  try
  WriteIntoStream(MemoryStream);
  ByteArray_PrepareFromStream(BA,TStream(MemoryStream));
  {$IFNDEF EmbeddedServer}
  GetISpaceUserReflector(Reflector.Space.SOAPServerURL).Set_Config(Reflector.Space.UserName,Reflector.Space.UserPassword,Reflector.id,BA);
  {$ELSE}
  SpaceUserReflector_Set_Config(Reflector.Space.UserName,Reflector.Space.UserPassword,Reflector.id,BA);
  {$ENDIF}
  finally
  MemoryStream.Destroy;
  end;
  end;
end;

procedure TReflectorConfiguration.Validate;

  function VisibilityFactorValue(VisibilityFactor: integer): integer;
  begin
  Result:=0;
  while (VisibilityFactor > 0) do begin
    VisibilityFactor:=(VisibilityFactor SHR 1);
    Inc(Result);
    end;
  Dec(Result);
  if (Result < 0) then Result:=0;
  end;

begin
//. change layout by config
Reflector.Left:=Left;
Reflector.Top:=Top;
Reflector.Width:=Width;
Reflector.Height:=Height;
//.
Reflector.ReflectionWindow.VisibleFactor:=ReflectionWindow_VisibilityFactor;
Reflector.tbVisibilityFactor.Position:=Reflector.tbVisibilityFactor.Max-VisibilityFactorValue(Reflector.ReflectionWindow.VisibleFactor);
//. setting by Reflector Flags
ValidateFlags;
//. validate coordinate-mesh params
//. dont need make Reflector.CoordinateMesh.flEnabled:=flCoordinateMeshEnabled because follow do that
Reflector.CoordinateMesh.SetParams(0,0, CoordinateMeshStep,CoordinateMeshStep);
Reflector.cbCoordinateMeshEnable.Checked:=flCoordinateMeshEnabled;
Reflector.edCoordinateMeshStep.Text:=FormatFloat('0,0',CoordinateMeshStep);
//.
Reflector.sbShowHideCreateObjectGallery.Down:=flCreateObjectsGallery;
Reflector.sbShowHideCreateObjectGalleryClick(nil);
//.
Reflector.sbElectedObjectsGallery.Down:=flElectedObjectsGallery;
Reflector.sbElectedObjectsGalleryClick(nil);
//.
Reflector.sbNavigator.Down:=flNavigator;
Reflector.sbNavigatorClick(nil);
//.
Reflector.sbGeoCoordinates.Down:=flGeoPanel;
Reflector.sbGeoCoordinatesClick(nil);
//.
Reflector.Style:=Style;
Reflector.cbStyle.ItemIndex:=Integer(Reflector.Style);
//.
Reflector.Mode:=Mode;
end;

procedure TReflectorConfiguration.ValidateFlags;
begin
//. setting by Reflector Flags
with Reflector do begin
if flHideControlBars
 then begin
  Menu_Hide;
  StatusPanel.Hide;
  end
 else begin
  //. new menu
  if flHideControlPage
   then
    pnlControl_Minimize
   else begin
    if flHideCreateButton
     then sbCreateObject.Visible:=false
     else sbCreateObject.Visible:=true;
    pnlControl_Restore;
    end;
  if flHideBookmarksPage
   then pnlBookmarks_Minimize
   else pnlBookmarks_Restore;
  if flHideViewPage
   then pnlView_Minimize
   else pnlView_Restore;
  if flHideEditPage
   then pnlSelectedObjectEdit_Minimize
   else pnlSelectedObjectEdit_Restore;
  if flHideCoordinateMeshPage
   then pnlCoordinateMesh_Minimize
   else pnlCoordinateMesh_Restore;
  if flHideOtherPage
   then pnlOther_Minimize
   else pnlOther_Restore;
  Menu_Show;
  StatusPanel.Visible:=true;
  end;
end;
end;

function TReflectorConfiguration.UpdateByReflector(): boolean;
var
  EV: Extended;
begin
Result:=false;
if (Left <> Reflector.Left)
 then begin
  Left:=Reflector.Left;
  Result:=true;
  end;
if (Top <> Reflector.Top)
 then begin
  Top:=Reflector.Top;
  Result:=true;
  end;
if (Width <> Reflector.Width)
 then begin
  Width:=Reflector.Width;
  Result:=true;
  end;
if (Height <> Reflector.Height)
 then begin
  Height:=Reflector.Height;
  Result:=true;
  end;
//.
if (ReflectionWindow_VisibilityFactor <> Reflector.ReflectionWindow.VisibleFactor)
 then begin
  ReflectionWindow_VisibilityFactor:=Reflector.ReflectionWindow.VisibleFactor;
  Result:=true;
  end;
//.
if (flCoordinateMeshEnabled <> Reflector.cbCoordinateMeshEnable.Checked)
 then begin
  flCoordinateMeshEnabled:=Reflector.cbCoordinateMeshEnable.Checked;
  Result:=true;
  end;
try
EV:=StrToFloat(Reflector.edCoordinateMeshStep.Text);
if (CoordinateMeshStep <> EV)
 then begin
  CoordinateMeshStep:=EV;
  Result:=true;
  end;
except
  end;
if (flCreateObjectsGallery <> Reflector.sbShowHideCreateObjectGallery.Down)
 then begin
  flCreateObjectsGallery:=Reflector.sbShowHideCreateObjectGallery.Down;
  Result:=true;
  end;
if (flElectedObjectsGallery <> Reflector.sbElectedObjectsGallery.Down)
 then begin
  flElectedObjectsGallery:=Reflector.sbElectedObjectsGallery.Down;
  Result:=true;
  end;
if (flNavigator <> Reflector.sbNavigator.Down)
 then begin
  flNavigator:=Reflector.sbNavigator.Down;
  Result:=true;
  end;
if (flGeoPanel <> Reflector.sbGeoCoordinates.Down)
 then begin
  flGeoPanel:=Reflector.sbGeoCoordinates.Down;
  Result:=true;
  end;
if (Style <> Reflector.Style)
 then begin
  Style:=Reflector.Style;
  Result:=true;
  end;
if (Mode <> Reflector.Mode)
 then begin
  Mode:=Reflector.Mode;
  Result:=true;
  end;
end;


const
  ixLeft = 0;
  ixUp = 1;
  ixRight = 2;
  ixDown = 3;

{TWindow}
Constructor TWindow.Create(const Left,Up,Right,Down: integer);
begin
Inherited Create;
SetLimits(Left,Up,Right,Down);
end;

procedure TWindow.SetLimits(const Left,Up,Right,Down: integer);
begin
IndexLimit:=0;
Limits[ixLeft].Vol:=Left;
Limits[ixUp].Vol:=Up;
Limits[ixRight].Vol:=Right;
Limits[ixDown].Vol:=Down;
end;

function TWindow.getLimit: TWindowLimit;
begin
Result:=Limits[IndexLimit];
end;

function TWindow.getOppositeLimit: TWindowLimit;
begin
inc(IndexLimit,2);
if IndexLimit >= 4 then dec(IndexLimit,4);
Result:=Limits[IndexLimit];
end;

function TWindow.getLimit_Node0: TNode;
begin
case IndexLimit of
ixLeft: begin
  Result.X:=Limits[ixLeft].Vol;
  Result.Y:=Limits[ixDown].Vol;
  end;
ixUp: begin
  Result.X:=Limits[ixLeft].Vol;
  Result.Y:=Limits[ixUp].Vol;
  end;
ixRight: begin
  Result.X:=Limits[ixRight].Vol;
  Result.Y:=Limits[ixUp].Vol;
  end;
ixDown: begin
  Result.X:=Limits[ixRight].Vol;
  Result.Y:=Limits[ixDown].Vol;
  end;
end;
end;

function TWindow.getLimit_Node1: TNode;
begin
case IndexLimit of
ixLeft: begin
  Result.X:=Limits[ixLeft].Vol;
  Result.Y:=Limits[ixUp].Vol;
  end;
ixUp: begin
  Result.X:=Limits[ixRight].Vol;
  Result.Y:=Limits[ixUp].Vol;
  end;
ixRight: begin
  Result.X:=Limits[ixRight].Vol;
  Result.Y:=Limits[ixDown].Vol;
  end;
ixDown: begin
  Result.X:=Limits[ixLeft].Vol;
  Result.Y:=Limits[ixDown].Vol;
  end;
end;
end;

procedure TWindow.NextLimit;
begin
if IndexLimit >= 3
 then IndexLimit:=0
 else Inc(IndexLimit);
end;

procedure TWindow.PredLimit;
begin
if IndexLimit <= 0
 then IndexLimit:=3
 else Dec(IndexLimit);
end;

function TWindow.getIndexPredLimit: integer;
begin
if IndexLimit <= 0
 then Result:=3
 else Result:=IndexLimit-1;
end;

function TWindow.getIndexNextLimit: integer;
begin
if IndexLimit >= 3
 then Result:=0
 else Result:=IndexLimit+1;
end;

function TWindow.NodeVisible(const Node: TNode): boolean;
begin
with Node do begin
if ((Limits[ixLeft].Vol <= X) AND (X <= Limits[ixRight].Vol))
     AND
   ((Limits[ixUp].Vol <= Y) AND (Y <= Limits[ixDown].Vol))
 then Result:=true
 else Result:=false;
end;
end;

function TWindow.GetPointCrossed(const SideFigure: TSide; var Point: TNode): boolean;
var
  SideWin: TSide;
  Xcr,Ycr: extended;
begin
Result:=false;
with SideFigure do begin
case IndexLimit of
ixLeft:
  begin
  if {((Node0.X <= Limits[ixLeft].Vol) AND (Limits[ixLeft].Vol < Node1.X)) OR
     ((Node0.X >= Limits[ixLeft].Vol) AND (Limits[ixLeft].Vol > Node1.X))}
     (Limits[ixLeft].Vol-Node0.X)*(Limits[ixLeft].Vol-Node1.X) <= 0
   then
    if Node0.X <> Node1.X
     then begin
      Ycr:=Node0.Y+((Node1.Y-Node0.Y)/(Node1.X-Node0.X))*(Limits[ixLeft].Vol-Node0.X);
      if (Limits[ixUp].Vol <= Ycr) AND (Ycr <= Limits[ixDown].Vol)
       then
        begin
        Point.X:=Limits[ixLeft].Vol;
        Point.Y:=Ycr;
        Result:=true;
        end;
      end;
  end;
ixUp:
  begin
  if ((Node0.Y <= Limits[ixUp].Vol) AND (Limits[ixUp].Vol < Node1.Y)) OR
     ((Node0.Y >= Limits[ixUp].Vol) AND (Limits[ixUp].Vol > Node1.Y))
   then
    if Node0.Y <> Node1.Y
     then begin
      Xcr:=Node0.X+((Node1.X-Node0.X)/(Node1.Y-Node0.Y))*(Limits[ixUp].Vol-Node0.Y);
      if (Limits[ixLeft].Vol <= Xcr) AND (Xcr <= Limits[ixRight].Vol)
       then
        begin
        Point.X:=Xcr;
        Point.Y:=Limits[ixUp].Vol;
        Result:=true;
        end;
      end;
  end;
ixRight:
  begin
  if {((Node0.X <= Limits[ixRight].Vol) AND (Limits[ixRight].Vol < Node1.X)) OR
     ((Node0.X >= Limits[ixRight].Vol) AND (Limits[ixRight].Vol > Node1.X))}
     (Limits[ixRight].Vol-Node0.X)*(Limits[ixRight].Vol-Node1.X) <= 0
   then
    if Node0.X <> Node1.X
     then begin
      Ycr:=Node0.Y+((Node1.Y-Node0.Y)/(Node1.X-Node0.X))*(Limits[ixRight].Vol-Node0.X);
      if (Limits[ixUp].Vol <= Ycr) AND (Ycr <= Limits[ixDown].Vol)
       then
        begin
        Point.X:=Limits[ixRight].Vol;
        Point.Y:=Ycr;
        Result:=true;
        end;
      end;
  end;
ixDown:
  begin
  if ((Node0.Y <= Limits[ixDown].Vol) AND (Limits[ixDown].Vol < Node1.Y)) OR
     ((Node0.Y >= Limits[ixDown].Vol) AND (Limits[ixDown].Vol > Node1.Y))
   then
    if Node0.Y <> Node1.Y
     then begin
      Xcr:=Node0.X+((Node1.X-Node0.X)/(Node1.Y-Node0.Y))*(Limits[ixDown].Vol-Node0.Y);
      if (Limits[ixLeft].Vol <= Xcr) AND (Xcr <= Limits[ixRight].Vol)
       then
        begin
        Point.X:=Xcr;
        Point.Y:=Limits[ixDown].Vol;
        Result:=true;
        end;
      end;
  end;
end;
end;
end;

function TWindow.FindPointCrossed(const Side: TSide; const NumLimits: word; var Point: TNode): boolean;
var
  I: word;
begin
Result:=false;
for I:=0 to NumLimits-1 do
  begin
  if GetPointCrossed(Side, Point)
   then begin
    Result:=true;
    Exit
    end
   else NextLimit;
  end;
end;

function TWindow.CrossedLimitRightLine(const Side: TSide): boolean;
var
  Xcr,Ycr: Extended;
begin
result:=false;
with Side do begin
case IndexLimit of
ixLeft: begin
  if ((Node0.Y <= Limits[ixUp].Vol) AND (Limits[ixUp].Vol < Node1.Y)) OR
     ((Node0.Y >= Limits[ixUp].Vol) AND (Limits[ixUp].Vol > Node1.Y))
   then
    if Node0.Y <> Node1.Y
     then begin
      Xcr:=Node0.X+((Node1.X-Node0.X)/(Node1.Y-Node0.Y))*(Limits[ixUp].Vol-Node0.Y);
      if (Xcr < Limits[ixLeft].Vol)
       then Result:=true;
      end;
  end;
ixUp: begin
  if ((Node0.X <= Limits[ixRight].Vol) AND (Limits[ixRight].Vol < Node1.X)) OR
     ((Node0.X >= Limits[ixRight].Vol) AND (Limits[ixRight].Vol > Node1.X))
   then
    if Node0.X <> Node1.X
     then begin
      Ycr:=Node0.Y+((Node1.Y-Node0.Y)/(Node1.X-Node0.X))*(Limits[ixRight].Vol-Node0.X);
      if (Ycr < Limits[ixUp].Vol)
       then Result:=true;
      end;
  end;
ixRight: begin
  if ((Node0.Y <= Limits[ixDown].Vol) AND (Limits[ixDown].Vol < Node1.Y)) OR
     ((Node0.Y >= Limits[ixDown].Vol) AND (Limits[ixDown].Vol > Node1.Y))
   then
    if Node0.Y <> Node1.Y
     then begin
      Xcr:=Node0.X+((Node1.X-Node0.X)/(Node1.Y-Node0.Y))*(Limits[ixDown].Vol-Node0.Y);
      if (Xcr > Limits[ixRight].Vol)
       then Result:=true;
      end;
  end;
ixDown: begin
  if ((Node0.X <= Limits[ixLeft].Vol) AND (Limits[ixLeft].Vol < Node1.X)) OR
     ((Node0.X >= Limits[ixLeft].Vol) AND (Limits[ixLeft].Vol > Node1.X))
   then
    if Node0.X <> Node1.X
     then begin
      Ycr:=Node0.Y+((Node1.Y-Node0.Y)/(Node1.X-Node0.X))*(Limits[ixLeft].Vol-Node0.X);
      if (Ycr > Limits[ixDown].Vol)
       then Result:=true;
      end;
  end;
end;
end;
end;

function TWindow.CrossedLimitRightRightLine(const Side: TSide): boolean;
var
  Xcr,Ycr: Extended;
begin
result:=false;
with Side do begin
case IndexLimit of
ixLeft: begin
  if ((Node0.X <= Limits[ixLeft].Vol) AND (Limits[ixLeft].Vol < Node1.X)) OR
     ((Node0.X >= Limits[ixLeft].Vol) AND (Limits[ixLeft].Vol > Node1.X))
   then
    if Node0.X <> Node1.X
     then begin
      Ycr:=Node0.Y+((Node1.Y-Node0.Y)/(Node1.X-Node0.X))*(Limits[ixLeft].Vol-Node0.X);
      if (Ycr < Limits[ixUp].Vol)
       then Result:=true;
      end;
  end;
ixUp: begin
  if ((Node0.Y <= Limits[ixUp].Vol) AND (Limits[ixUp].Vol < Node1.Y)) OR
     ((Node0.Y >= Limits[ixUp].Vol) AND (Limits[ixUp].Vol > Node1.Y))
   then
    if Node0.Y <> Node1.Y
     then begin
      Xcr:=Node0.X+((Node1.X-Node0.X)/(Node1.Y-Node0.Y))*(Limits[ixUp].Vol-Node0.Y);
      if (Xcr > Limits[ixRight].Vol)
       then Result:=true;
      end;
  end;
ixRight: begin
  if ((Node0.X <= Limits[ixRight].Vol) AND (Limits[ixRight].Vol < Node1.X)) OR
     ((Node0.X >= Limits[ixRight].Vol) AND (Limits[ixRight].Vol > Node1.X))
   then
    if Node0.X <> Node1.X
     then begin
      Ycr:=Node0.Y+((Node1.Y-Node0.Y)/(Node1.X-Node0.X))*(Limits[ixRight].Vol-Node0.X);
      if (Ycr > Limits[ixDown].Vol)
       then Result:=true;
      end;
  end;
ixDown: begin
  if ((Node0.Y <= Limits[ixDown].Vol) AND (Limits[ixDown].Vol < Node1.Y)) OR
     ((Node0.Y >= Limits[ixDown].Vol) AND (Limits[ixDown].Vol > Node1.Y))
   then
    if Node0.Y <> Node1.Y
     then begin
      Xcr:=Node0.X+((Node1.X-Node0.X)/(Node1.Y-Node0.Y))*(Limits[ixDown].Vol-Node0.Y);
      if (Xcr < Limits[ixLeft].Vol)
       then Result:=true;
      end;
  end;
end;
end;
end;

function TWindow.CrossedLimitLeftLine(const Side: TSide): boolean;
var
  Xcr,Ycr: Extended;
begin
result:=false;
with Side do begin
case IndexLimit of
ixLeft: begin
  if ((Node0.Y <= Limits[ixDown].Vol) AND (Limits[ixDown].Vol < Node1.Y)) OR
     ((Node0.Y >= Limits[ixDown].Vol) AND (Limits[ixDown].Vol > Node1.Y))
   then
    if Node0.Y <> Node1.Y
     then begin
      Xcr:=Node0.X+((Node1.X-Node0.X)/(Node1.Y-Node0.Y))*(Limits[ixDown].Vol-Node0.Y);
      if (Xcr < Limits[ixLeft].Vol)
       then Result:=true;
      end;
  end;
ixUp: begin
  if ((Node0.X <= Limits[ixLeft].Vol) AND (Limits[ixLeft].Vol < Node1.X)) OR
     ((Node0.X >= Limits[ixLeft].Vol) AND (Limits[ixLeft].Vol > Node1.X))
   then
    if Node0.X <> Node1.X
     then begin
      Ycr:=Node0.Y+((Node1.Y-Node0.Y)/(Node1.X-Node0.X))*(Limits[ixLeft].Vol-Node0.X);
      if (Ycr < Limits[ixUp].Vol)
       then Result:=true;
      end;
  end;
ixRight: begin
  if ((Node0.Y <= Limits[ixUp].Vol) AND (Limits[ixUp].Vol < Node1.Y)) OR
     ((Node0.Y >= Limits[ixUp].Vol) AND (Limits[ixUp].Vol > Node1.Y))
   then
    if Node0.Y <> Node1.Y
     then begin
      Xcr:=Node0.X+((Node1.X-Node0.X)/(Node1.Y-Node0.Y))*(Limits[ixUp].Vol-Node0.Y);
      if (Xcr > Limits[ixRight].Vol)
       then Result:=true;
      end;
  end;
ixDown: begin
  if ((Node0.X <= Limits[ixRight].Vol) AND (Limits[ixRight].Vol < Node1.X)) OR
     ((Node0.X >= Limits[ixRight].Vol) AND (Limits[ixRight].Vol > Node1.X))
   then
    if Node0.X <> Node1.X
     then begin
      Ycr:=Node0.Y+((Node1.Y-Node0.Y)/(Node1.X-Node0.X))*(Limits[ixRight].Vol-Node0.X);
      if (Ycr > Limits[ixDown].Vol)
       then Result:=true;
      end;
  end;
end;
end;
end;

function TWindow.CrossedLimitLeftLeftLine(const Side: TSide): boolean;
var
  Xcr,Ycr: Extended;
begin
result:=false;
with Side do begin
case IndexLimit of
ixLeft: begin
  if ((Node0.X <= Limits[ixLeft].Vol) AND (Limits[ixLeft].Vol < Node1.X)) OR
     ((Node0.X >= Limits[ixLeft].Vol) AND (Limits[ixLeft].Vol > Node1.X))
   then
    if Node0.X <> Node1.X
     then begin
      Ycr:=Node0.Y+((Node1.Y-Node0.Y)/(Node1.X-Node0.X))*(Limits[ixLeft].Vol-Node0.X);
      if (Ycr > Limits[ixDown].Vol)
       then Result:=true;
      end;
  end;
ixUp: begin
  if ((Node0.Y <= Limits[ixUp].Vol) AND (Limits[ixUp].Vol < Node1.Y)) OR
     ((Node0.Y >= Limits[ixUp].Vol) AND (Limits[ixUp].Vol > Node1.Y))
   then
    if Node0.Y <> Node1.Y
     then begin
      Xcr:=Node0.X+((Node1.X-Node0.X)/(Node1.Y-Node0.Y))*(Limits[ixUp].Vol-Node0.Y);
      if (Xcr < Limits[ixLeft].Vol)
       then Result:=true;
      end;
  end;
ixRight: begin
  if ((Node0.X <= Limits[ixRight].Vol) AND (Limits[ixRight].Vol < Node1.X)) OR
     ((Node0.X >= Limits[ixRight].Vol) AND (Limits[ixRight].Vol > Node1.X))
   then
    if Node0.X <> Node1.X
     then begin
      Ycr:=Node0.Y+((Node1.Y-Node0.Y)/(Node1.X-Node0.X))*(Limits[ixRight].Vol-Node0.X);
      if (Ycr < Limits[ixUp].Vol)
       then Result:=true;
      end;
  end;
ixDown: begin
  if ((Node0.Y <= Limits[ixDown].Vol) AND (Limits[ixDown].Vol < Node1.Y)) OR
     ((Node0.Y >= Limits[ixDown].Vol) AND (Limits[ixDown].Vol > Node1.Y))
   then
    if Node0.Y <> Node1.Y
     then begin
      Xcr:=Node0.X+((Node1.X-Node0.X)/(Node1.Y-Node0.Y))*(Limits[ixDown].Vol-Node0.Y);
      if (Xcr > Limits[ixRight].Vol)
       then Result:=true;
      end;
  end;
end;
end;
end;

function TWindow.Strike(const Side: TSide): boolean;
var
  Diag0,Diag1: TSide;
  Node: TNode;
begin
Result:=false;
{Diag0.Node0.X:=Limits[ixLeft].Vol;
Diag0.Node0.Y:=Limits[iUp].Vol;
Diag0.Node1.X:=Limits[ixRight].Vol;
Diag0.Node1.Y:=Limits[ixDown].Vol;
Diag1.Node0.X:=Limits[ixRight].Vol;
Diag1.Node0.Y:=Limits[iUp].Vol;
Diag1.Node1.X:=Limits[ixLeft].Vol;
Diag1.Node1.Y:=Limits[ixDown].Vol;
with Side do begin
if (No)*() <= 0
end;}
if FindPointCrossed(Side,4, Node)
 then begin
  NextLimit;
  if FindPointCrossed(Side,3, Node) then Result:=true;
  end
end;

function TWindow.Distance(const Node: TNode): Extended;
begin
case IndexLimit of
ixLeft: Result:=abs(Node.X-Limits[ixLeft].Vol);
ixUp: Result:=abs(Node.Y-Limits[ixUp].Vol);
ixRight: Result:=abs(Node.X-Limits[ixRight].Vol);
ixDown: Result:=abs(Node.Y-Limits[ixDown].Vol);
end;
end;



{TFigureWinRefl}
Constructor TFigureWinRefl.Create;
begin
Inherited Create;
Clear;
end;

procedure TFigureWinRefl.Clear;
begin
Count:=0;
CountScreenNodes:=0;
flPolyLine:=false;
flSelected:=false;
SelectedPoint_Index:=-1;
Reset;
end;

procedure TFigureWinRefl.Reset;
begin
Position:=0;
end;

procedure TFigureWinRefl.Insert(const Node: TNode);
begin
if (Count >= Length(Nodes)) then Raise Exception.Create('! FigureWinRefl has too many nodes'); //. =>
Nodes[Count]:=Node;
inc(Count);
end;

procedure TFigureWinRefl.Next;
begin
inc(Position);
if Position >= Count then Position:=0;
end;

function TFigureWinRefl.GetNode: TNode;
begin
Result:=Nodes[Position];
end;

procedure TFigureWinRefl.Assign(F: TFigureWinRefl);
var
  I: integer;
begin
idTObj:=F.idTObj;
idObj:=F.idObj;
flagLoop:=F.flagLoop;
Color:=F.Color;
flagFill:=F.flagFill;
ColorFill:=F.ColorFill;
Width:=F.Width;
Style:=F.Style;

Count:=F.Count;
for I:=0 to Count-1 do Nodes[I]:=F.Nodes[I];
CountScreenNodes:=F.CountScreenNodes;
for I:=0 to CountScreenNodes-1 do ScreenNodes[I]:=F.ScreenNodes[I];
Position:=F.Position;
end;

function TFigureWinRefl.PointIsInside(const Point: TScreenNode): boolean;
var
  cntCrossedAbove,cntCrossedBelow: integer;

  procedure ProcessSide(const P0,P1: TNode);
  var
    Ycr: Extended;
  begin
  with Point do begin
  if ((P0.X <= X) AND (X < P1.X) OR
      (P0.X >= X) AND (X > P1.X))
   then
    if (P0.X <> P1.X)
     then begin
      Ycr:=P0.Y+((P1.Y-P0.Y)/(P1.X-P0.X))*(X-P0.X);
      if (Ycr >= Y)
       then inc(cntCrossedAbove)
       else inc(cntCrossedBelow);
      end;
  end;
  end;

var
  I: integer;
  P0,P1: TNode;
begin
Result:=false;
if (NOT flagLoop) then Exit; //. ->
cntCrossedAbove:=0;
cntCrossedBelow:=0;
for I:=0 to Count-2 do begin
  P0:=Nodes[I];
  P1:=Nodes[I+1];
  ProcessSide(P0,P1);
  end;
P0:=P1;
P1:=Nodes[0];
ProcessSide(P0,P1);
if ((cntCrossedAbove MOD 2) > 0) AND ((cntCrossedBelow MOD 2) > 0) then Result:=true;
end;

(*function TFigureWinRefl.ValidateAsPolyLine(Scale: Extended): boolean; // преобразует фигуру, усли flagLoop = false
type
  TLn = record
    flNull: boolean;
    A: Extended;
    B: Extended;
    flVertical: boolean;
  end;

  TLine = record
    X0,Y0,
    X1,Y1: Extended;

  end;

var
  PrimCount: integer;
  flLastNode: boolean;
  LastNode: TNode;
  NewNode,NewNode1: TNode;

  procedure GetTerminators(const Line: TLine; const X,Y: Extended; const Dist: Extended; var T,T1: TNode);
  var
    Line_Length: Extended;
    diffX1X0,diffY1Y0: Extended;
    V: Extended;
    S0_X3,S0_Y3,S1_X3,S1_Y3: Extended;
  begin
  with Line do begin
  diffX1X0:=X1-X0;
  diffY1Y0:=Y1-Y0;
  if Abs(diffY1Y0) > Abs(diffX1X0)
   then begin
    V:=Dist/Sqrt(1+Sqr(diffX1X0/diffY1Y0));
    T.X:=(V)+X;
    T.Y:=(-V)*(diffX1X0/diffY1Y0)+Y;
    T1.X:=(-V)+X;
    T1.Y:=(V)*(diffX1X0/diffY1Y0)+Y;
    end
   else begin
    if (diffX1X0 = 0)
     then begin
      T.X:=X;T.Y:=Y;
      T1.X:=X;T1.Y:=Y;
      Exit; ///??? проверь последствия
      end;
    V:=Dist/Sqrt(1+Sqr(diffY1Y0/diffX1X0));
    T.Y:=(V)+Y;
    T.X:=(-V)*(diffY1Y0/diffX1X0)+X;
    T1.Y:=(-V)+Y;
    T1.X:=(V)*(diffY1Y0/diffX1X0)+X;
    end;
  end;
  end;

  procedure TreateNode(Index: integer; const LinePred,LineNext: TLine; const Width: Extended);
  var
    LinePred_dX1X0,LinePred_dY1Y0,LineNext_dX0X1,LineNext_dY0Y1: Extended;
    ALFA,BETTA,GAMMA,SinGAMMA: Extended;
    LinePred_Len,LineNext_Len: Extended;
    LinePred_Shift,LineNext_Shift: Extended;
    OfsX,OfsY: Extended;
    MirrorIndex: integer;
  begin
  LinePred_dX1X0:=LinePred.X1-LinePred.X0;LinePred_dY1Y0:=LinePred.Y1-LinePred.Y0;
  LineNext_dX0X1:=LineNext.X0-LineNext.X1;LineNext_dY0Y1:=LineNext.Y0-LineNext.Y1;
  LinePred_Len:=Sqrt(sqr(LinePred_dX1X0)+sqr(LinePred_dY1Y0));
  LineNext_Len:=Sqrt(sqr(LineNext_dX0X1)+sqr(LineNext_dY0Y1));
  if (LinePred_Len = 0) OR (LineNext_Len = 0) then Exit;
  if LinePred_dX1X0 <> 0 then ALFA:=Arctan(LinePred_dY1Y0/LinePred_dX1X0) else ALFA:=PI/2;
  if LineNext_dX0X1 <> 0 then BETTA:=Arctan(LineNext_dY0Y1/LineNext_dX0X1) else BETTA:=PI/2;
  GAMMA:=Abs(BETTA-ALFA);SinGAMMA:=Sin(GAMMA);
  if SinGAMMA = 0 then Exit;
  LinePred_Shift:=Width/SinGAMMA;
  LineNext_Shift:=LinePred_Shift;
  OfsX:=(LinePred_dX1X0/LinePred_Len)*LinePred_Shift+(LineNext_dX0X1/LineNext_Len)*LineNext_Shift;
  OfsY:=(LinePred_dY1Y0/LinePred_Len)*LinePred_Shift+(LineNext_dY0Y1/LineNext_Len)*LineNext_Shift;
  NewNode:=Nodes[Index];NewNode1:=Nodes[Index];
  with NewNode do begin
  X:=X+OfsX;
  Y:=Y+OfsY;
  end;
  with NewNode1 do begin
  X:=X-OfsX;
  Y:=Y-OfsY;
  end;
  MirrorIndex:=2*PrimCount-1-Index;
  if (NOT flLastNode) OR (Abs((NewNode.X-LastNode.X)*LinePred_dY1Y0-(NewNode.Y-LastNode.Y)*LinePred_dX1X0) < Abs((NewNode1.X-LastNode.X)*LinePred_dY1Y0-(NewNode1.Y-LastNode.Y)*LinePred_dX1X0))
   then begin
    Nodes[Index]:=NewNode;
    Nodes[MirrorIndex]:=NewNode1;inc(Count);
    LastNode:=NewNode;
    flLastNode:=true;
    end
   else begin
    Nodes[Index]:=NewNode1;
    Nodes[MirrorIndex]:=NewNode;inc(Count);
    LastNode:=NewNode1;
    flLastNode:=true;
    end;
  end;

var
  W: Extended;
  LineFirst,LinePred,LineNext: TLine;
  I: integer;

begin
Result:=false;
ScreenWidth:=0;
if (Count > 1)
 then begin
  flPolyLine:=true;
  PrimCount:=Count;
  W:=Width*Scale;
  if (W < 1) then Exit; //. ->
  ScreenWidth:=Trunc(W);
  W:=W/2.0;
  ColorFill:=Color;
  flagFill:=true;
  LineFirst.X0:=Nodes[0].X;LineFirst.Y0:=Nodes[0].Y;LineFirst.X1:=Nodes[1].X;LineFirst.Y1:=Nodes[1].Y;
  LinePred:=LineFirst;LineNext.X0:=LinePred.X1;LineNext.Y0:=LinePred.Y1;
  flLastNode:=false;
  if NOT flagLoop
   then begin
    GetTerminators(LinePred,LinePred.X0,LinePred.Y0,W, NewNode,NewNode1);
    Nodes[0]:=NewNode;
    Nodes[2*PrimCount-1]:=NewNode1;inc(Count);
    LastNode:=NewNode;
    flLastNode:=true;
    end;
  if PrimCount > 2
   then begin
    I:=1;
    repeat
      LineNext.X1:=Nodes[I+1].X;LineNext.Y1:=Nodes[I+1].Y;
      TreateNode(I, LinePred,LineNext,W);
      LinePred:=LineNext;LineNext.X0:=LineNext.X1;LineNext.Y0:=LineNext.Y1;
      inc(I);
    until I >= PrimCount-1;
    LineNext.X1:=LineFirst.X0;LineNext.Y1:=LineFirst.Y0;
    if flagLoop
     then begin
      TreateNode(I, LinePred,LineNext,W);
      LinePred:=LineNext;LineNext.X0:=LineNext.X1;LineNext.Y0:=LineNext.Y1;
      LineNext.X1:=LineFirst.X1;LineNext.Y1:=LineFirst.Y1;
      I:=0;
      TreateNode(I, LinePred,LineNext,W);
      Nodes[Count]:=Nodes[PrimCount];Nodes[Count+1]:=Nodes[PrimCount-1];inc(Count,2);
      Result:=true;
      Exit; // -->
      end;
    end;
  // обработка концов линии
  GetTerminators(LinePred,LinePred.X1,LinePred.Y1,W, NewNode,NewNode1);
  if (NOT flLastNode) OR (Abs((NewNode.X-LastNode.X)*(LinePred.Y1-LinePred.Y0)-(NewNode.Y-LastNode.Y)*(LinePred.X1-LinePred.X0)) < Abs((NewNode1.X-LastNode.X)*(LinePred.Y1-LinePred.Y0)-(NewNode1.Y-LastNode.Y)*(LinePred.X1-LinePred.X0)))
   then begin
    Nodes[PrimCount-1]:=NewNode;
    Nodes[PrimCount]:=NewNode1;inc(Count);
    end
   else begin
    Nodes[PrimCount-1]:=NewNode1;
    Nodes[PrimCount]:=NewNode;inc(Count);
    end;
  flagLoop:=true;
  Result:=true;
  end;
end;*)


function TFigureWinRefl.ValidateAsPolyLine(Scale: Extended): boolean;
type
  TLn = record
    A: Extended;
    B: Extended;
  end;

  TLine = record
    X0,Y0,
    X1,Y1: Extended;
    dX: Extended;
    dY: Extended;
    P: Extended;
    BP: TNode;
  end;

var
  PrimCount: integer;
  NewNode,NewNode1: TNode;

  procedure ProcessLine(var Line: TLine; const Dist: Extended);
  var
    D: Extended;
    xS,yS: integer;
    T: TNode;
  begin
  Line.dX:=(Line.X1-Line.X0);
  Line.dY:=(Line.Y1-Line.Y0);
  if (Abs(Line.dY) > Abs(Line.dX))
   then begin
    D:=Line.dX/Line.dY;
    Line.P:=Dist/Sqrt(1+Sqr(D));
    if (Line.dX >= 0) then yS:=+1 else yS:=-1;
    if (Line.dY >= 0) then xS:=-1 else xS:=+1;
    Line.BP.X:=xS*Line.P+Line.X0;
    Line.BP.Y:=yS*Line.P*Abs(D)+Line.Y0;
    end
   else
    if (Line.dX <> 0)
     then begin
      D:=Line.dY/Line.dX;
      Line.P:=Dist/Sqrt(1+Sqr(D));
      if (Line.dY >= 0) then xS:=-1 else xS:=+1;
      if (Line.dX >= 0) then yS:=+1 else yS:=-1;
      Line.BP.Y:=yS*Line.P+Line.Y0;
      Line.BP.X:=xS*Line.P*Abs(D)+Line.X0;
      end
     else begin
      Line.BP.Y:=Line.Y0;
      Line.BP.X:=Line.X0;
      end;
  end;

  procedure TreateNode(Index: integer; var LinePred,LineNext: TLine; const Dist: Extended);
  var
    Ln0: TLn;
    Ln1: TLn;
    diffA: Extended;
    MirrorIndex: integer;
  begin
  if ((LinePred.dX <> 0) AND (LineNext.dX <> 0))
   then begin
    Ln0.A:=(LinePred.dY/LinePred.dX);
    Ln0.B:=(LinePred.BP.Y-LinePred.BP.X*Ln0.A);
    Ln1.A:=(LineNext.dY/LineNext.dX);
    Ln1.B:=(LineNext.BP.Y-LineNext.BP.X*Ln1.A);
    diffA:=(Ln1.A-Ln0.A);
    if (DiffA <> 0)
     then begin
      NewNode.X:=((Ln0.B-Ln1.B)/diffA);
      NewNode.Y:=Ln0.A*NewNode.X+Ln0.B;
      NewNode1.X:=(2*LinePred.X1-NewNode.X);
      NewNode1.Y:=(2*LinePred.Y1-NewNode.Y);
      end
     else begin
      NewNode.X:=LineNext.BP.X;
      NewNode.Y:=LineNext.BP.Y;
      NewNode1.X:=(2*LinePred.X1-NewNode.X);
      NewNode1.Y:=(2*LinePred.Y1-NewNode.Y); 
      end;
    end
   else
    if (LinePred.dX <> 0)
     then begin
      Ln0.A:=(LinePred.dY/LinePred.dX);
      Ln0.B:=(LinePred.BP.Y-LinePred.BP.X*Ln0.A);
      NewNode.X:=LineNext.BP.X;
      NewNode.Y:=Ln0.A*NewNode.X+Ln0.B;
      NewNode1.X:=(2*LinePred.X1-NewNode.X);
      NewNode1.Y:=(2*LinePred.Y1-NewNode.Y);
      end
     else
      if (LineNext.dX <> 0)
       then begin
        Ln1.A:=(LineNext.dY/LineNext.dX);
        Ln1.B:=(LineNext.BP.Y-LineNext.BP.X*Ln1.A);
        NewNode.X:=LinePred.BP.X;
        NewNode.Y:=Ln1.A*NewNode.X+Ln1.B;
        NewNode1.X:=(2*LinePred.X1-NewNode.X);
        NewNode1.Y:=(2*LinePred.Y1-NewNode.Y);
        end
       else begin
        NewNode.X:=LineNext.BP.X;
        NewNode.Y:=LineNext.BP.Y;
        NewNode1.X:=(2*LinePred.X1-NewNode.X); 
        NewNode1.Y:=(2*LinePred.Y1-NewNode.Y); 
        end;
  MirrorIndex:=2*PrimCount-1-Index;
  Nodes[Index]:=NewNode;
  Nodes[MirrorIndex]:=NewNode1; inc(Count);
  end;

var
  W: Extended;
  FirstLine,LinePred,LineNext: TLine;
  I: integer;
  E: Extended;
begin
Result:=false;
try
ScreenWidth:=0;
if (Count > 1)
 then begin
  flPolyLine:=true;
  PrimCount:=Count;
  W:=Width*Scale;
  if (W < 1) then Exit; //. ->
  ScreenWidth:=Trunc(W);
  W:=W/2.0;
  FirstLine.X0:=Nodes[0].X; FirstLine.Y0:=Nodes[0].Y; FirstLine.X1:=Nodes[1].X; FirstLine.Y1:=Nodes[1].Y;
  LinePred:=FirstLine;
  ProcessLine(LinePred,W);
  if NOT flagLoop
   then begin
    NewNode.X:=LinePred.BP.X;
    NewNode.Y:=LinePred.BP.Y;
    NewNode1.X:=(2*LinePred.X0-NewNode.X);
    NewNode1.Y:=(2*LinePred.Y0-NewNode.Y);
    Nodes[0]:=NewNode;
    Nodes[2*PrimCount-1]:=NewNode1; inc(Count);
    end;
  LineNext.X0:=LinePred.X1; LineNext.Y0:=LinePred.Y1;
  I:=1;
  if (PrimCount > 2)
   then
    repeat
      LineNext.X1:=Nodes[I+1].X; LineNext.Y1:=Nodes[I+1].Y;
      ProcessLine(LineNext,W);
      TreateNode(I, LinePred,LineNext,W);
      LinePred:=LineNext; LineNext.X0:=LineNext.X1; LineNext.Y0:=LineNext.Y1;
      inc(I);
    until I >= PrimCount-1;
  if NOT flagLoop
   then begin
    LineNext.X1:=LinePred.X0; LineNext.Y1:=LinePred.Y0;
    ProcessLine(LineNext,W);
    NewNode.X:=LineNext.BP.X;
    NewNode.Y:=LineNext.BP.Y;
    NewNode1.X:=(2*LineNext.X0-NewNode.X);
    NewNode1.Y:=(2*LineNext.Y0-NewNode.Y);
    Nodes[PrimCount]:=NewNode;
    Nodes[PrimCount-1]:=NewNode1; inc(Count);
    end
   else
    if (I > 1)
     then begin
      LineNext.X1:=FirstLine.X0; LineNext.Y1:=FirstLine.Y0;
      ProcessLine(LineNext,W);
      TreateNode(I, LinePred,LineNext,W);
      LinePred:=LineNext;
      LineNext.X0:=LineNext.X1; LineNext.Y0:=LineNext.Y1;
      LineNext.X1:=FirstLine.X1; LineNext.Y1:=FirstLine.Y1;
      ProcessLine(LineNext,W);
      TreateNode(0, LinePred,LineNext,W);
      Nodes[Count]:=Nodes[PrimCount]; Nodes[Count+1]:=Nodes[PrimCount-1]; inc(Count,2);
      end
     else Exit; //. ->
  //. done !
  ColorFill:=Color;
  flagFill:=true;
  flagLoop:=true;
  Result:=true;
  end;
finally
if (NOT Result) then Clear();
end;
end;

procedure TFigureWinRefl.AttractToLimits(const Window: TWindow; const ptrWindowFilledFlag: pointer = nil);
Label MNewWork,MNewAttrLine,MLineReturnToWin,MLimitSpace,MRightAngleSpace,MLeftAngleSpace,MLimit_NextNode;

  procedure ScreenNodes_Insert(const Node: TNode; const flLimitNode: boolean);
  var
    SN: TScreenNode;
  begin
  SN.X:=Round(Node.X);
  SN.Y:=Round(Node.Y);
  if flLimitNode
   then
    if (ScreenNodes[CountScreenNodes-1].X = SN.X) AND (ScreenNodes[CountScreenNodes-1].Y = SN.Y)
     then Dec(CountScreenNodes)
     else begin
      ScreenNodes[CountScreenNodes]:=SN;
      inc(CountScreenNodes);
      end
   else begin
    //. предохраниться от ситуации, когда узел равен узлу окна
    with SN,Window do begin
    if (X = Limits[ixLeft].Vol) AND (Y = Limits[ixUp].Vol)
     then begin Dec(X);Dec(Y) end
     else
      if (X = Limits[ixRight].Vol) AND (Y = Limits[ixUp].Vol)
       then begin Inc(X);Dec(Y) end
       else
        if (X = Limits[ixRight].Vol) AND (Y = Limits[ixDown].Vol)
         then begin Inc(X);Inc(Y) end
         else
          if (X = Limits[ixLeft].Vol) AND (Y = Limits[ixDown].Vol)
           then begin Dec(X);Inc(Y) end;
    end;
    ScreenNodes[CountScreenNodes]:=SN;
    inc(CountScreenNodes);
    end
  end;

var
  CountForSides: integer;
  curNode: integer;
  Side: TSide;
  cntCrossedLine,cntCrossedOppositeLine: integer;
  Node0_Dist0,Node0_Dist1: Extended;
  NewNode,NewNode1: TNode;
  SaveIndex: integer;
  PosOwnerNode: integer;
begin
if (ptrWindowFilledFlag <> nil) then Boolean(ptrWindowFilledFlag^):=false;
with Window do begin
CountScreenNodes:=0;
curNode:=0;
CountForSides:=Count;
Reset();
if (flagLoop) then Inc(CountForSides);
if NOT NodeVisible(Node)
 then
  begin
  cntCrossedLine:=0;
  cntCrossedOppositeLine:=0;
  repeat
    Side.Node0:=Node;
    inc(curNode);
    if curNode >= CountForSides then Break;
    Next;
    Side.Node1:=Node;
    if NodeVisible(Node)
     then begin
      FindPointCrossed(Side,4, NewNode);
      if flagLoop then
       if CrossedLimitRightLine(Side) OR CrossedLimitLeftLine(Side)
        then curNode:=0
        else curNode:=1;
      GoTo MLineReturnToWin
      end
     else
      if Strike(Side)
       then begin
        FindPointCrossed(Side,4, NewNode1);
        SaveIndex:=IndexLimit;
        NextLimit;
        FindPointCrossed(Side,3, NewNode);
        Node0_Dist1:=Sqrt(sqr(NewNode1.X-Side.Node0.X)+sqr(NewNode1.Y-Side.Node0.Y));
        Node0_Dist0:=Sqrt(sqr(NewNode.X-Side.Node0.X)+sqr(NewNode.Y-Side.Node0.Y));
        if Node0_Dist1 < Node0_Dist0
         then begin
          IndexLimit:=SaveIndex;
          NewNode:=NewNode1;
          end;
        if flagLoop then
         if CrossedLimitRightLine(Side) OR CrossedLimitLeftLine(Side)
          then curNode:=0
          else curNode:=1;
        GoTo MLineReturnToWin
        end
       else begin
        if CrossedLimitRightLine(Side)
         then inc(cntCrossedLine)
         else begin
          PredLimit;
          if CrossedLimitLeftLeftLine(Side)
           then inc(cntCrossedOppositeLine);
          NextLimit;
          end;
        end;
  until false;
  begin
  //. фигура окно не пересекает
  if ((cntCrossedLine MOD 2) > 0) AND ((cntCrossedOppositeLine MOD 2) > 0) AND flagLoop
   then begin //. Фигура окружает окно
    NewNode.X:=Window.Limits[ixLeft].Vol;
    NewNode.Y:=Window.Limits[ixUp].Vol;
    ScreenNodes_Insert(NewNode, false);
    NewNode.X:=Window.Limits[ixRight].Vol;
    ScreenNodes_Insert(NewNode, false);
    NewNode.Y:=Window.Limits[ixDown].Vol;
    ScreenNodes_Insert(NewNode, false);
    NewNode.X:=Window.Limits[ixLeft].Vol;
    ScreenNodes_Insert(NewNode, false);
    if (ptrWindowFilledFlag <> nil) then Boolean(ptrWindowFilledFlag^):=true;
    end;
  Exit; //. ->
  end;
  end;

MNewWork: ;
  //. собираем видимые точки}
  Repeat
    Side.Node0:=Node;
    NewNode.X:=Node.X;
    NewNode.Y:=Node.Y;
    ScreenNodes_Insert(NewNode, false);
    inc(curNode);
    Next;
    if curNode >= CountForSides
     then
      {if flagLoop AND NOT NodeVisible(Node)
       then Break}
       Exit; //. фигура закончилась в окне
  Until NOT NodeVisible(Node);
  Side.Node1:=Node;

  //. Исследование поведения линии вне окна
  FindPointCrossed(Side,4, NewNode);
  MNewAttrLine:
  ScreenNodes_Insert(NewNode, false);
  PosOwnerNode:=CountScreenNodes;
  if CrossedLimitRightLine(Side)
   then GoTo MRightAngleSpace
   else
    if CrossedLimitLeftLine(Side)
     then GoTo MLeftAngleSpace;
  repeat
    {Линия в пространстве предела}
    MLimitSpace: ;
    Side.Node0:=Node;
    inc(curNode);
    if curNode >= CountForSides
     then begin //. Линия здесь закончилась
      if NOT flagLoop then CountScreenNodes:=PosOwnerNode;
      Exit
      end;
    Next;
    Side.Node1:=Node;
    if GetPointCrossed(Side, NewNode)
     then begin //. Линия вернулась в окно
      MLineReturnToWin:
      ScreenNodes_Insert(NewNode, false);
      NextLimit;
      if FindPointCrossed(Side,3, NewNode)
       then GoTo MNewAttrLine
       else GoTo MNewWork;
      end
     else
      if CrossedLimitRightLine(Side)
       then begin //. линия пересекла правую границу предела
        if CrossedLimitRightRightLine(Side)
         then begin //. линия пересекла и правую границу правого угла
          NewNode.X:=Limit_Node1.X;
          NewNode.Y:=Limit_Node1.Y;
          ScreenNodes_Insert(NewNode, true);

          NextLimit;
          if CrossedLimitRightLine(Side)
           then GoTo MRightAngleSpace;
          //. осталась в новом пространстве предела
          end
         else begin //. Линия осталась в пространстве правого угла
          MRightAngleSpace:
          repeat
            Side.Node0:=Node;
            inc(curNode);
            if curNode >= CountForSides
             then begin //. Линия здесь закончилась
              if NOT flagLoop then CountScreenNodes:=PosOwnerNode;
              Exit
              end;
            Next;
            Side.Node1:=Node;
            if CrossedLimitRightRightLine(Side)
             then begin //. линия пересекла правую границу правого угла
              NewNode.X:=Limit_Node1.X;
              NewNode.Y:=Limit_Node1.Y;
              ScreenNodes_Insert(NewNode, true);
              NextLimit;

              if GetPointCrossed(Side, NewNode)
               then GoTo MLineReturnToWin //. Линия вернулась в окно
               else
                if CrossedLimitRightLine(Side)
                 then begin //. линия пересекла и левую границу правого угла
                  if CrossedLimitRightRightLine(Side)
                   then begin //. линия пересекла и правую границу правого угла
                    NewNode.X:=Limit_Node1.X;
                    NewNode.Y:=Limit_Node1.Y;
                    ScreenNodes_Insert(NewNode, true);
                    NextLimit;

                    if Not CrossedLimitRightLine(Side)
                     then GoTo MLimit_NextNode; {осталась в новом пространстве предела}
                    end;
                  end
                 else GoTo MLimit_NextNode;
              end
             else
              if CrossedLimitRightLine(Side)
               then begin //. линия пересекла левую границу угла
                if GetPointCrossed(Side, NewNode)
                 then GoTo MLineReturnToWin //. Линия вернулась в окно
                 else
                  if CrossedLimitLeftLine(Side)
                   then begin //. линия пересекла правую границу левого угла
                    if CrossedLimitLeftLeftLine(Side)
                     then begin //. линия пересекла и левую границу левого угла
                      NewNode.X:=Limit_Node0.X;
                      NewNode.Y:=Limit_Node0.Y;
                      ScreenNodes_Insert(NewNode, true);
                      PredLimit;

                      if Not CrossedLimitLeftLine(Side)
                       then GoTo MLimit_NextNode {осталась в новом пространстве предела}
                       else GoTo MLeftAngleSpace
                      end
                     else GoTo MLeftAngleSpace;
                    end
                   else GoTo MLimit_NextNode; {осталась в новом пространстве предела}
                end;
          until false;
          //. фигура закончилась в пространстве угла
          end;
        end
       else
        if CrossedLimitLeftLine(Side)
         then begin //. линия пересекла левую границу предела
          if CrossedLimitLeftLeftLine(Side)
           then begin //. линия пересекла и левую границу левого угла
            NewNode.X:=Limit_Node0.X;
            NewNode.Y:=Limit_Node0.Y;
            ScreenNodes_Insert(NewNode, true);

            PredLimit;
            if CrossedLimitLeftLine(Side)
             then GoTo MLeftAngleSpace;
            //. осталась в новом пространстве предела
            end
           else begin //. Линия осталась в пространстве левого угла
            MLeftAngleSpace:
            repeat
              Side.Node0:=Node;
              inc(curNode);
              if curNode >= CountForSides
               then begin //. Линия здесь закончилась
                if NOT flagLoop then CountScreenNodes:=PosOwnerNode;
                Exit
                end;
              Next;
              Side.Node1:=Node;
              if CrossedLimitLeftLeftLine(Side)
               then begin //. линия пересекла левую границу левого угла
                NewNode.X:=Limit_Node0.X;
                NewNode.Y:=Limit_Node0.Y;
                ScreenNodes_Insert(NewNode, true);
                PredLimit;

                if GetPointCrossed(Side, NewNode)
                 then GoTo MLineReturnToWin //. Линия вернулась в окно
                 else
                  if CrossedLimitLeftLine(Side)
                   then begin //. линия пересекла и правую границу левого угла
                    if CrossedLimitLeftLeftLine(Side)
                     then begin //. линия пересекла и левую границу левого угла
                      NewNode.X:=Limit_Node0.X;
                      NewNode.Y:=Limit_Node0.Y;
                      ScreenNodes_Insert(NewNode, true);
                      PredLimit;

                      if Not CrossedLimitLeftLine(Side)
                       then GoTo MLimit_NextNode; {осталась в новом пространстве предела}
                      end;
                     end
                   else GoTo MLimit_NextNode;
                end
               else
                if CrossedLimitLeftLine(Side)
                 then begin //. линия пересекла правую границу угла
                  if GetPointCrossed(Side, NewNode)
                   then GoTo MLineReturnToWin //. Линия вернулась в окно
                   else
                    if CrossedLimitRightLine(Side)
                     then begin //. линия пересекла правую границу левого угла
                      if CrossedLimitRightRightLine(Side)
                       then begin //. линия пересекла и правую границу правого угла
                        NewNode.X:=Limit_Node1.X;
                        NewNode.Y:=Limit_Node1.Y;
                        ScreenNodes_Insert(NewNode, true);
                        NextLimit;

                        if Not CrossedLimitRightLine(Side)
                         then GoTo MLimit_NextNode {осталась в новом пространстве предела}
                         else GoTo MRightAngleSpace
                        end
                       else GoTo MRightAngleSpace;
                      end
                     else GoTo MLimit_NextNode; {осталась в новом пространстве предела}
                  end;
            until false;
            end;
          end;

    MLimit_NextNode: ;
  until false;
end;
end;

procedure TFigureWinRefl.Optimize;
var
  SrsIndex,DistIndex: integer;
  LastNode: TScreenNode;
begin
if CountScreenNodes < 2 then Exit; //. ->
LastNode:=ScreenNodes[0];
SrsIndex:=1;
DistIndex:=1;
repeat
  if NOT ((ScreenNodes[SrsIndex].X = LastNode.X) AND (ScreenNodes[SrsIndex].Y = LastNode.Y)) 
   then begin
    ScreenNodes[DistIndex]:=ScreenNodes[SrsIndex];
    Inc(DistIndex);
    LastNode:=ScreenNodes[SrsIndex];
    end;
  Inc(SrsIndex);
until SrsIndex >= CountScreenNodes;
if DistIndex = 1 then DistIndex:=0;
CountScreenNodes:=DistIndex;
end;

function TFigureWinRefl.ScreenNodes_GetMinMax(out Xmn,Ymn,Xmx,Ymx: integer): boolean;
var
  I: integer;
  Cnt: integer;
begin
Result:=false;
Cnt:=CountScreenNodes;
if (flagLoop) then Dec(Cnt);
if (Cnt <= 0) then Exit; //. ->
Xmn:=ScreenNodes[0].X; Ymn:=ScreenNodes[0].Y;
Xmx:=Xmn; Ymx:=Ymn;
for I:=1 to Cnt-1 do begin
  if ScreenNodes[I].X < Xmn
   then
    Xmn:=ScreenNodes[I].X
   else
    if ScreenNodes[I].X > Xmx
     then Xmx:=ScreenNodes[I].X;
  if ScreenNodes[I].Y < Ymn
   then
    Ymn:=ScreenNodes[I].Y
   else
    if ScreenNodes[I].Y > Ymx
     then Ymx:=ScreenNodes[I].Y;
  end;
Result:=true;
end;

function TFigureWinRefl.ScreenNodes_GetAveragePoint(out X,Y: Extended): boolean;
var
  I: integer;
  Cnt: integer;
begin
Result:=false;
Cnt:=CountScreenNodes;
if (flagLoop) then Dec(Cnt);
if (Cnt <= 0) then Exit; //. ->
X:=0; Y:=0;
for I:=0 to Cnt-1 do begin
  X:=X+ScreenNodes[I].X;
  Y:=Y+ScreenNodes[I].Y;
  end;
X:=X/Cnt;
Y:=Y/Cnt;
Result:=true;
end;

function TFigureWinRefl.ScreenNodes_PolylineLength(out Length: Extended): boolean;
var
  I: integer;
begin
Result:=false;
Length:=0;
for I:=0 to CountScreenNodes-2 do Length:=Length+Sqrt(sqr(ScreenNodes[I+1].X-ScreenNodes[I].X)+sqr(ScreenNodes[I+1].Y-ScreenNodes[I].Y));
Result:=true;
end;

function TFigureWinRefl.Nodes_GetMinMax(out Xmn,Ymn,Xmx,Ymx: Extended): boolean;
var
  I: integer;
begin
Result:=false;
if (Count = 0) then Exit; //. ->
Xmn:=Nodes[0].X; Ymn:=Nodes[0].Y;
Xmx:=Xmn; Ymx:=Ymn;
for I:=1 to Count-1 do begin
  if Nodes[I].X < Xmn
   then
    Xmn:=Nodes[I].X
   else
    if Nodes[I].X > Xmx
     then Xmx:=Nodes[I].X;
  if Nodes[I].Y < Ymn
   then
    Ymn:=Nodes[I].Y
   else
    if Nodes[I].Y > Ymx
     then Ymx:=Nodes[I].Y;
  end;
Result:=true;
end;

function TFigureWinRefl.Nodes_GetAveragePoint(out X,Y: Extended): boolean;
var
  I: integer;
begin
Result:=false;
X:=0; Y:=0;
if (Count = 0) then Exit; //. ->
for I:=0 to Count-1 do begin
  X:=X+Nodes[I].X;
  Y:=Y+Nodes[I].Y;
  end;
X:=X/Count;
Y:=Y/Count;
Result:=true;
end;


{TFigure}
Constructor TFigure.Create(pflagLoop: boolean);
begin
Inherited Create;
flagLoop:=pflagLoop;
Reset;
end;

procedure TFigure.Reset;
begin
Count:=0;
end;

procedure TFigure.Insert(const Point: TPoint);
begin
if (Count >= TSpaceObj_maxPointsCount) then Raise Exception.Create('! too many nodes.'); //. =>
Points[Count]:=Point;
inc(Count);
end;

function TFigure.PointIsInside(const Point: TPoint): boolean;
var
  cntCrossedAbove,cntCrossedBelow: integer;

  procedure TreateSide(P0,P1: TPoint);
  var
    Ycr: Extended;
  begin
  with Point do begin
  if (P0.X <= X) AND (X < P1.X) OR
     (P0.X >= X) AND (X > P1.X)
   then
    if P0.X <> P1.X
     then begin
      Ycr:=P0.Y+((P1.Y-P0.Y)/(P1.X-P0.X))*(X-P0.X);
      if Ycr >= Y
       then inc(cntCrossedAbove)
       else inc(cntCrossedBelow);
      end;
  end;
  end;

var
  I: integer;
  P0,P1: TPoint;
begin
Result:=false;
if not flagLoop then Exit;
cntCrossedAbove:=0;
cntCrossedBelow:=0;
for I:=0 to Count-2 do
  begin
  P0:=Points[I];
  P1:=Points[I+1];
  TreateSide(P0,P1);
  end;
P0:=Points[Count-1];
P1:=Points[0];
TreateSide(P0,P1);
if ((cntCrossedAbove MOD 2) > 0) AND ((cntCrossedBelow MOD 2) > 0)
 then Result:=true;
end;

{TpopupDetailCreate}
Constructor TpopupDetailCreate.Create(pReflector: TReflector);
begin
Reflector:=pReflector;
Inherited Create(Reflector);
TypesSystem.QueryTypes(TTBase2DVisualizationFunctionality, DetailsTypes);
OnPopup:=Popup;
AutoHotKeys:=maManual;
Images:=TypesImageList;
end;

Destructor TpopupDetailCreate.Destroy;
begin
Clear;
DetailsTypes.Free;
Inherited;
end;

procedure TpopupDetailCreate.Update;
var
  I: integer;
  idTDetail: integer;
  DetailTypeFunctionality: TTypeFunctionality;
  newMenuItem: TMenuItem;
begin
Clear;
for I:=0 to DetailsTypes.Count-1 do begin
  idTDetail:=Integer(DetailsTypes[I]);
  if idTDetail <> idTLay2DVisualization
   then
    try
    DetailTypeFunctionality:=TTypeFunctionality_Create(idTDetail);
    try
    if TTBaseVisualizationFunctionality(DetailTypeFunctionality).CanCreateAsDetail
     then with DetailTypeFunctionality do begin
      newMenuItem:=TMenuItem.Create(Self);
      with newMenuItem do begin
      Tag:=idTDetail;
      Caption:=DetailTypeFunctionality.Name;
      ImageIndex:=ImageList_Index;
      OnClick:=ItemClick;
      OnMeasureItem:=MeasureItem;
      end;
      end;
    finally
    DetailTypeFunctionality.Release;
    end;
    Items.Add(newMenuItem);
    except
      end;
  end;
end;

procedure TpopupDetailCreate.Clear;
begin
Items.Clear;
end;

procedure TpopupDetailCreate.Popup(Sender: TObject);
begin
Update;
end;

procedure TpopupDetailCreate.ItemClick(Sender: TObject);
var
  DetailTypeFunctionality: TTBase2DVisualizationFunctionality;
  ptrOwner: TPtr;
  Owner: TSpaceObj;
  ObjectVisualization: TObjectVisualization;
  idDetail: integer;
begin
if Reflector.ptrSelectedObj = nilPtr
 then begin
  ShowMessage('! owner not selected.');
  Exit;
  end;
ptrOwner:=Reflector.ptrSelectedObj;
DetailTypeFunctionality:=TTBase2DVisualizationFunctionality(TTypeFunctionality_Create((Sender as TMenuItem).Tag));
with DetailTypeFunctionality do
try
Reflector:=Self.Reflector;
idDetail:=CreateInstanceEx(ObjectVisualization, ptrOwner);
with TBase2DVisualizationFunctionality(TComponentFunctionality_Create(idDetail)) do
try
//. select new detail in reflector and show detail props panel
if ((Reflector <> nil) AND (Reflector is TReflector))
 then begin
  with TReflector(Reflector) do begin
  SelectObj(Ptr);
  //. show editing control elements
  if (Mode = rmEditing)
   then begin
    cbEditing.Checked:=false;
    cbEditing.Checked:=true;
    end
   else cbEditing.Checked:=true;
  end;
  //.
  with TAbstractSpaceObjPanelProps(TPanelProps_Create(false, 0,nil,nilObject)) do begin
  Left:=Round((Screen.Width-Width)/2);
  Top:=Screen.Height-Height-20;
  OnKeyDown:=Reflector.OnKeyDown;
  OnKeyUp:=Reflector.OnKeyUp;
  Show;
  end;
  end;
finally
Release;
end;
//.
finally
Release;
end;
end;

procedure TpopupDetailCreate.MeasureItem(Sender: TObject; ACanvas: TCanvas; var Width, Height: Integer);
begin
ACanvas.Font.Size:=14;
Height:=Images.Height+3;
end;


{TReflectionMesh}
Constructor TReflectionMesh.Create(pReflector: TReflector);
begin
Inherited Create;
ofsX:=0;
ofsY:=0;
stepX:=1*cfTransMeter;
stepY:=1*cfTransMeter;
BindingAccumulator_dX:=0;
BindingAccumulator_dY:=0;
Reflector:=pReflector;
FflEnabled:=false;
end;

procedure TReflectionMesh.SetParams(const pofsX,pofsY: Extended; const pstepX,pstepY: Extended);
begin
ofsX:=pofsX*cfTransMeter;
ofsY:=pofsY*cfTransMeter;
stepX:=pstepX*cfTransMeter;
stepY:=pstepX*cfTransMeter;
if flEnabled
 then begin
  //. work around application frozen
  if (Reflector.Reflecting.flReflecting OR Reflector.Reflecting.flBriefReflecting) then Exit; //. ->
  //.
  Reflector.Reflecting.ReFresh;
  end;
end;

procedure TReflectionMesh.setflEnabled(Value: boolean);
begin
FflEnabled:=Value;
//. work around application frozen
if (Reflector.Reflecting.flReflecting OR Reflector.Reflecting.flBriefReflecting) then Exit; //. ->
//.
Reflector.Reflecting.ReFresh;
end;

procedure TReflectionMesh.ReflectInBMP(BMP: TBitmap);
type
  TPoint = record
    X,Y: Extended;
  end;
var
  WLP,WTP,WRP,WBP: TPoint;

  procedure ReorderWindowPoints(const ReflectionWindow: TReflectionWindow; var WLP,WTP,WRP,WBP: TPoint);
  const
    WindowsNodesCount = 4;
  var
    RW: TReflectionWindowStrucEx;
    WindowsNodes: array[0..WindowsNodesCount-1] of TPoint;
    NodeIndex: integer;
    MinX,MinX_Y: Extended;
    I: integer;
  begin
  ReflectionWindow.GetWindow(false, RW);
  WindowsNodes[0].X:=RW.X0; WindowsNodes[0].Y:=RW.Y0;
  WindowsNodes[1].X:=RW.X1; WindowsNodes[1].Y:=RW.Y1;
  WindowsNodes[2].X:=RW.X2; WindowsNodes[2].Y:=RW.Y2;
  WindowsNodes[3].X:=RW.X3; WindowsNodes[3].Y:=RW.Y3;
  //.
  MinX:=WindowsNodes[0].X; MinX_Y:=WindowsNodes[0].Y;
  NodeIndex:=0;
  for I:=1 to WindowsNodesCount-1 do
    if (WindowsNodes[I].X < MinX) OR ((WindowsNodes[I].X = MinX) AND (WindowsNodes[I].Y < MinX_Y))
     then begin
      MinX:=WindowsNodes[I].X;
      MinX_Y:=WindowsNodes[I].Y;
      NodeIndex:=I;
      end;
  //.
  WLP:=WindowsNodes[NodeIndex];
  Inc(NodeIndex); if NodeIndex >= WindowsNodesCount then NodeIndex:=0;
  WTP:=WindowsNodes[NodeIndex];
  Inc(NodeIndex); if NodeIndex >= WindowsNodesCount then NodeIndex:=0;
  WRP:=WindowsNodes[NodeIndex];
  Inc(NodeIndex); if NodeIndex >= WindowsNodesCount then NodeIndex:=0;
  WBP:=WindowsNodes[NodeIndex];
  end;

  procedure GetYParams(const WTP,WBP: TPoint; const X: Extended;  var YOrigin: Extended; var YSteps: integer);
  var
    TYc,BYc: Extended;

    procedure GetCrossPointY(const P0,P1: TPoint; const X: Extended;  var Yc: Extended);
    begin
    Yc:=P0.Y+(X-P0.X)*((P1.Y-P0.Y)/(P1.X-P0.X));
    end;

  begin
  //. get YOrigin
  if X < WBP.X
   then GetCrossPointY(WLP,WBP, X,  BYc)
   else GetCrossPointY(WBP,WRP, X,  BYc);
  YOrigin:=ofsY+(Trunc((BYc-ofsY)/stepY))*stepY;
  //. get YSteps
  if X < WTP.X
   then GetCrossPointY(WLP,WTP, X,  TYc)
   else GetCrossPointY(WTP,WRP, X,  TYc);
  YSteps:=Trunc((TYc-YOrigin)/stepY)+1;
  end;

  procedure ReflectNode(const X,Y: Extended);

    procedure GetReflectionCoords(X,Y: Extended; var Xr,Yr: integer);
    var
      RW: TreflectionWindowStrucEx;
      X_A,X_B,X_C,X_D: Extended;
      Y_A,Y_B,Y_C,Y_D: Extended;
      XC,YC,diffXCX0,diffYCY0,X_L,Y_L: Extended;
    begin
    Reflector.ReflectionWindow.GetWindow(false, RW);
    with Reflector,RW do begin
    X_A:=Y1-Y0;X_B:=X0-X1;X_D:=-(X0*X_A+Y0*X_B);
    Y_A:=Y3-Y0;Y_B:=X0-X3;Y_D:=-(X0*Y_A+Y0*Y_B);
    XC:=(Y_A*X+Y_B*(Y+X_D/X_B))/(Y_A-(X_A*Y_B/X_B));
    if X_B <> 0 then YC:=-(X_A*XC+X_D)/X_B else YC:=(Y_B*Y+Y_A*(X+X_D/X_A))/(Y_B-(X_B*Y_A/X_A));
    diffXCX0:=XC-X0;
    diffYCY0:=YC-Y0;
    X_L:=Sqrt(sqr(diffXCX0)+sqr(diffYCY0));
    if (X_B <> 0)
     then begin
      if (((-X_B) > 0) AND ((diffXCX0) < 0)) OR (((-X_B) < 0) AND ((diffXCX0) > 0))
       then X_L:=-X_L;
      end
     else
      if ((X_A > 0) AND ((diffYCY0) < 0)) OR ((X_A < 0) AND ((diffYCY0) > 0))
       then X_L:=-X_L;

    XC:=(X_A*X+X_B*(Y+Y_D/Y_B))/(X_A-(Y_A*X_B/Y_B));
    if Y_B <> 0 then YC:=-(Y_A*XC+Y_D)/Y_B else YC:=(X_B*Y+X_A*(X+Y_D/Y_A))/(X_B-(Y_B*X_A/Y_A));
    diffXCX0:=XC-X0;
    diffYCY0:=YC-Y0;
    Y_L:=Sqrt(sqr(diffXCX0)+sqr(diffYCY0));
    if (Y_B <> 0)
     then begin
      if (((-Y_B) > 0) AND ((diffXCX0) < 0)) OR (((-Y_B) < 0) AND ((diffXCX0) > 0))
       then Y_L:=-Y_L;
      end
     else
      if ((Y_A > 0) AND ((diffYCY0) < 0)) OR ((Y_A < 0) AND ((diffYCY0) > 0))
       then Y_L:=-Y_L;

    Xr:=Xmn+Round(X_L/Sqrt(sqr(X_A)+sqr(X_B))*(Xmx-Xmn));
    Yr:=Ymn+Round(Y_L/Sqrt(sqr(Y_A)+sqr(Y_B))*(Ymx-Ymn));
    end;
    end;

  var
    Xr,Yr: integer;
  begin
  GetReflectionCoords(X,Y, Xr,Yr);
  with BMP.Canvas do begin
  Pixels[Xr,Yr]:=clWhite;
  end;
  end;

var
  XOrigin,YOrigin: Extended;
  XSteps,YSteps: integer;
  X,Y: Extended;
  I,J: integer;
begin
BMP.Canvas.Lock;
try
//. checking for validity of mesh
with Reflector.ReflectionWindow do
while (((stepX/cfTransMeter)*Scale < 8) OR ((stepY/cfTransMeter)*Scale < 8)) do begin
  stepX:=stepX*2;
  stepY:=stepY*2;
  end;
with Reflector.ReflectionWindow do
while (((stepX/cfTransMeter)*Scale >= 16) OR ((stepY/cfTransMeter)*Scale >= 16)) do begin
  stepX:=stepX/2;
  stepY:=stepY/2;
  end;
//.
ReorderWindowPoints(Reflector.ReflectionWindow, WLP,WTP,WRP,WBP);
XOrigin:=ofsX+(Trunc((WLP.X-ofsX)/stepX))*stepX;
XSteps:=Trunc((WRP.X-XOrigin)/stepX)+1;
X:=XOrigin;
for I:=0 to XSteps-1 do begin
  GetYParams(WTP,WBP, X,  YOrigin,YSteps);
  Y:=YOrigin;
  for J:=0 to YSteps-1 do begin
    ReflectNode(X,Y);
    Y:=Y+stepY;
    end;
  X:=X+stepX;
  end;
finally
BMP.Canvas.UnLock;
end;
end;

procedure TReflectionMesh.BindReflectionWindowCenter(Direction_dX,Direction_dY: Extended);
var
  DirectionLength: Extended;
  StepLength: Extended;
  StepCount: integer;
  StepCriterium: Extended;
  Xc,Yc: Extended;
  shiftX,shiftY: Extended;
  NodeX,NodeY: Extended;
begin
with Reflector.ReflectionWindow do begin
DirectionLength:=Sqrt(sqr(Direction_dX)+sqr(Direction_dY));
StepLength:=stepX;
StepCriterium:=StepLength/3;
if DirectionLength <= StepCriterium
 then begin
  BindingAccumulator_dX:=BindingAccumulator_dX+Direction_dX;
  BindingAccumulator_dY:=BindingAccumulator_dY+Direction_dY;
  if Sqrt(sqr(BindingAccumulator_dX)+sqr(BindingAccumulator_dY)) <= StepCriterium then Exit; //. ->
  Direction_dX:=BindingAccumulator_dX;
  Direction_dY:=BindingAccumulator_dY;
  DirectionLength:=Sqrt(sqr(Direction_dX)+sqr(Direction_dY));
  BindingAccumulator_dX:=0;
  BindingAccumulator_dY:=0;
  end;
if DirectionLength > StepLength
 then StepCount:=Round(DirectionLength/StepLength)
 else StepCount:=1;
Lock.Enter;
try
Xc:=Xcenter+StepLength*StepCount*(Direction_dX/DirectionLength);
Yc:=Ycenter+StepLength*StepCount*(Direction_dY/DirectionLength);
NodeX:=ofsX+Round((Xc-ofsX)/stepX)*stepX;
NodeY:=ofsY+Round((Yc-ofsY)/stepY)*stepY;
shiftX:=NodeX-Xcenter;
shiftY:=NodeY-Ycenter;
//. reflection window coords updating
X0:=X0+shiftX; Y0:=Y0+shiftY;
X1:=X1+shiftX; Y1:=Y1+shiftY;
X2:=X2+shiftX; Y2:=Y2+shiftY;
X3:=X3+shiftX; Y3:=Y3+shiftY;
Update;
finally
Lock.Leave;
end;
end;
end;


//. TObjectTrack
Constructor TObjectTrack.Create;
begin
Inherited Create;
Lock:=TCriticalSection.Create;
Items:=nil;
end;

Destructor TObjectTrack.Destroy;
begin
Clear;
Lock.Free;
Inherited;
end;

procedure TObjectTrack.Clear;
var
  ptrDestroyItem: pointer;
begin
Lock.Enter;
try
while (Items <> nil) do begin
  ptrDestroyItem:=Items;
  Items:=TObjectTrackItem(ptrDestroyItem^).Next;
  FreeMem(ptrDestroyItem,SizeOf(TObjectTrackItem));
  end;
finally
Lock.Leave;
end;
end;

procedure TObjectTrack.AddItem(const pX,pY: TCrd);
var
  ptrNewItem: pointer;
begin
Lock.Enter;
try
if ((Items <> nil) AND ((TObjectTrackItem(Items^).X = pX) AND (TObjectTrackItem(Items^).Y = pY))) then Exit; //. ->
//.
GetMem(ptrNewItem,SizeOf(TObjectTrackItem));
with TObjectTrackItem(ptrNewItem^) do begin
X:=pX;
Y:=pY;
TimeStamp:=Now;
end;
TObjectTrackItem(ptrNewItem^).Next:=Items;
Items:=ptrNewItem;
finally
Lock.Leave;
end;
end;


//. TReflector
Constructor TReflector.Create(pSpace: TProxySpace; pid: integer);
var
  IUnk: IUnknown;
  SysMenu:THandle;
  popupSelectedObjects: TpopupSelectedObjects;
begin
State:=rsCreating;
Inherited Create(nil);
Space:=pSpace;
id:=pid;
FMode:=rmBrowsing;
FStyle:=rsSpaceViewing;
Configuration:=TReflectorConfiguration.Create(Self);
//.
with cbStyle do begin
Items.Clear;
Items.Add(ReflectorStyleStrings[rsNative]);
Items.Add(ReflectorStyleStrings[rsSpaceViewing]);
end;
//. 
FptrSelectedObj:=nilPtr;
ptrSelectedPointObj:=nilPtr;
sbSelectedObjAtCenter.Enabled:=false;
lbSelectedObjName.Caption:='';
//.
ObjectHighlighting:=TObjectHighlighting.Create(Self);
PulsedSelection:=TPulsedSelection.Create(Self);
fmSelectedObjects:=TfmSelectedObjects.Create(Self);
PanelProps:=nil;
PanelPropsNeeded:=false;
//. 
flReflectionChanged:=false;
flReflectionAligned:=false;
FflagMsChangeScaleView:=false;
FflagMsRotateView:=false;
FflagMsMoveView:=false;
//.
flProcessingOnClick:=false;
//.
RotateAngleStep:=0; //. deny step rotation
//.
flMouseMoving:=false;
flLeftButtonDown:=false;
MouseShiftState:=[];
//.
EditingOrCreatingObject:=nil;
ObjectEditor:=nil;
//.
SelectedRegion:=nil;
//.
LastPlacesPtr:=nil;
NextPlacesPtr:=nil;
//.
OverObjectPtr:=nilPtr;
//.
fmImportComponents:=nil;
//.
fmCreateObjectGallery:=nil;
fmElectedObjectsGallery:=nil;
//.
{$IFDEF ExternalTypes}
ObjectManager:=Types__TObjectsManager_Create;
{$ENDIF}
//.
SysMenu:=GetSystemMenu(Handle,False);
InsertMenu(SysMenu,0,MF_BYPOSITION,ID_ShowConfiguration, 'Show Configuration');
//.
DragAcceptFiles(Handle, true);
//.
DynamicHints:=TDynamicHints.Create(Self);
fmReflectorDynamicHintTextWindow:=TfmReflectorDynamicHintTextWindow.Create(Self);
//.
popupCreateObject:=TpopupCreateObject.Create(Self);
popupElectedPlaces:=TpopupElectedPlaces.Create(Self);
popupElectedObjects:=TpopupElectedObjects.Create(Self);
popupSelectedObjects:=TpopupSelectedObjects.Create(Self);
tbSelectedObjects.DropdownMenu:=popupSelectedObjects;
popupDetailCreate:=TpopupDetailCreate.Create(Self);
//.
CoordinateMesh:=TReflectionMesh.Create(Self);
BMPBuffer:=TBitmap.Create;
BMPBuffer.HandleType:=bmDIB;
BMPBuffer.PixelFormat:=pf24bit;
ReflectionWindow:=TReflectionWindow.Create(Space,Configuration.ReflectionWindowStruc);
ReflectionWindow_ActualityIntervalPanel:=nil; 
TReflecting.Create(Self);
//.
OnPaint:=FormPaint;
OnResize:=FormResize;
//.
Navigator:=TfmReflectorNavigator.Create(Self);
//.                                                    
XYToGeoCrdConverter:=TfmXYToGeoCrdConvertor.Create(Self);
XYToGeoCrdConverter.Parent:=Self;
//.
Watcher_ObjPtr:=nilPtr;
//.
ObjectTrack:=TObjectTrack.Create();
//.
InplaceHint_ObjPtr:=nilPtr;
InplaceHint:=nil;
//. naming
if (NOT Space.flOffline)
{$IFNDEF EmbeddedServer}
 then Caption:=GetISpaceUserReflector(Space.SOAPServerURL).getName(Space.UserName,Space.UserPassword,id)
{$ELSE}
 then Caption:=SpaceUserReflector_getName(Space.UserName,Space.UserPassword,id)
{$ENDIF}
 else Caption:='Offline view';
//.
Configuration.Validate();
//.
UpdateCompass;
UpdateGeoCompass();
//.
State:=rsWorking;
end;

destructor TReflector.Destroy;
var
  I: integer;
  Component: TComponent;
begin
State:=rsDestroying;
//.
TTypesSystem(Space.TypesSystem).DoOnReflectorRemoval(Self);
//.
HistoryTimer.Enabled:=false;
Timer100Msec.Enabled:=false;
try
Reflecting.Free;
Reflecting:=nil;
//.
if (InplaceHint <> nil)
 then begin
  InplaceHint.Cancel();
  InplaceHint.Reflector:=nil;
  InplaceHint:=nil;
  end;
ObjectTrack.Free;
XYToGeoCrdConverter.Free;
fmSelectedObjects.Free;
PulsedSelection.Free;
ObjectHighlighting.Free;
fmDesigner.Free;
fmReflectorDynamicHintTextWindow.Free;
ObjectManager.Free;
LastPlaces_Destroy;
SelectedRegion.Free;
EditingOrCreatingObject.Free;
ObjectEditor.Free;
try PanelProps.Free; except end;
CoordinateMesh.Free;
DynamicHints.Free;
DragAcceptFiles(Handle, false);
popupCreateObject.Free;
finally
if (PrimMap_Exist) then PrimMap_Destroy();
with ReflectionWindow do begin
Lock.Enter;
try
X0:=X0/cfTransMeter;
Y0:=Y0/cfTransMeter;
X1:=X1/cfTransMeter;
Y1:=Y1/cfTransMeter;
X2:=X2/cfTransMeter;
Y2:=Y2/cfTransMeter;
X3:=X3/cfTransMeter;
Y3:=Y3/cfTransMeter;
//.
Normalize();
//.
Configuration.ReflectionWindowStruc.X0:=X0; Configuration.ReflectionWindowStruc.Y0:=Y0;
Configuration.ReflectionWindowStruc.X1:=X1; Configuration.ReflectionWindowStruc.Y1:=Y1;
Configuration.ReflectionWindowStruc.X2:=X2; Configuration.ReflectionWindowStruc.Y2:=Y2;
Configuration.ReflectionWindowStruc.X3:=X3; Configuration.ReflectionWindowStruc.Y3:=Y3;
Configuration.ReflectionWindowStruc.Xmn:=Xmn; Configuration.ReflectionWindowStruc.Ymn:=Ymn;
Configuration.ReflectionWindowStruc.Xmx:=Xmx; Configuration.ReflectionWindowStruc.Ymx:=Ymx;
finally
Lock.Leave;
end;
end;
Configuration.Save();
//.
ReflectionWindow_ActualityIntervalPanel.Free();
ReflectionWindow.Free();
BMPBuffer.Free;
Configuration.Free;
end;
Inherited;
end;

procedure TReflector.PrintReflection;
var
  R: TRect;
  BMP: TBitmap;
begin
TReflecting(Reflecting).BMP.SaveToFile('PrintedMap.bmp');
BMP:=TBitmap.Create;
with BMP do begin
LoadFromFile('PrintedMap.bmp');
end;
with R do begin
Left:=0;
Top:=0;
Right:=Left+{FPrimary}BMP.Width*3;
Bottom:=Top+{FPrimary}BMP.Height*3;
end;
with Printer do begin
Title:='Map';
BeginDoc;
Canvas.CopyMode:=cmSrcCopy;
Canvas.StretchDraw(R,{FPrimary}Bmp);
EndDoc;
end;
BMP.Destroy;
end;

procedure TReflector.SetVisibilityFactor(const Factor: integer);
begin
ReflectionWindow.VisibleFactor:=Factor;
//.
if (Space.State <> psstCreating) then TReflecting(Reflecting).RecalcReflect();
end;

procedure TReflector.ShiftReflection(VertShift,HorShift: Extended);
var
   ofsX,ofsY: Extended;
   diffX0X3,diffY0Y3, diffX0X1,diffY0Y1: real;
begin
Reflecting.CancelRRR(); //. cancel reforming,reflecting,revising
//.
VertShift:=VertShift*cfTransMeter;
HorShift:=HorShift*cfTransMeter;
//.
with ReflectionWindow do begin
Lock.Enter;
try
diffX0X3:=X0-X3; diffY0Y3:=Y0-Y3;
diffX0X1:=X0-X1; diffY0Y1:=Y0-Y1;
//.
ofsX:=(diffX0X1)*HorShift/HorRange+(diffX0X3)*VertShift/VertRange;
ofsY:=(diffY0Y1)*HorShift/HorRange+(diffY0Y3)*VertShift/VertRange;
X0:=X0+ofsX;Y0:=Y0+ofsY;
X1:=X1+ofsX;Y1:=Y1+ofsY;
X2:=X2+ofsX;Y2:=Y2+ofsY;
X3:=X3+ofsX;Y3:=Y3+ofsY;
Xcenter:=Xcenter+ofsX;Ycenter:=Ycenter+ofsY;
Update;
finally
Lock.Leave;
end;
end;
//.
if (Reflecting.Configuration.BriefReflectingType = brtPartialWithLastReflection)
 then begin
  Reflecting.LastReflectedBitmap.Transformatrix_Move(ofsX,ofsY);
  DynamicHints.BindingPoints_Shift(ofsX,ofsY);
  end;
//.
if (XYToGeoCrdConverter <> nil) then TfmXYToGeoCrdConvertor(XYToGeoCrdConverter).GeoObjectTracks.ClearSelectedItems(); 
//.
TReflecting(Reflecting).RecalcReflect;
//.
DoOnPositionChange();
//.
UpdateCompass();
UpdateGeoCompass();
//.
flReflectionChanged:=true;
flReflectionAligned:=false;
end;

procedure TReflector.PixShiftReflection(const VertShift,HorShift: integer);
var
   VS,HS,ofsX,ofsY: Extended;
   diffX0X3,diffY0Y3, diffX0X1,diffY0Y1: real;
begin
Reflecting.CancelRRR(); //. cancel reforming,reflecting,revising
//.
with ReflectionWindow do begin
Lock.Enter;
try
VS:=VertShift/(Ymx-Ymn);
HS:=HorShift/(Xmx-Xmn);
//.
diffX0X3:=X0-X3;diffY0Y3:=Y0-Y3;
diffX0X1:=X0-X1;diffY0Y1:=Y0-Y1;
finally
Lock.Leave;
end;
//.
ofsX:=(diffX0X1)*HS+(diffX0X3)*VS;
ofsY:=(diffY0Y1)*HS+(diffY0Y3)*VS;
if (NOT CoordinateMesh.flEnabled)
 then begin
  Lock.Enter;
  try
  X0:=X0+ofsX;Y0:=Y0+ofsY;
  X1:=X1+ofsX;Y1:=Y1+ofsY;
  X2:=X2+ofsX;Y2:=Y2+ofsY;
  X3:=X3+ofsX;Y3:=Y3+ofsY;
  Xcenter:=Xcenter+ofsX;Ycenter:=Ycenter+ofsY;
  Update;
  finally
  Lock.Leave;
  end;
  end
 else
  CoordinateMesh.BindReflectionWindowCenter(ofsX,ofsY);
end;
//.
if (PrimMap_Exist AND PrimMap_Fixing) then PrimMap_Shift(HorShift,VertShift);
//.
if (Reflecting.Configuration.BriefReflectingType = brtPartialWithLastReflection)
 then begin
  Reflecting.LastReflectedBitmap.Transformatrix_Move(HorShift,VertShift);
  DynamicHints.BindingPoints_Shift(HorShift,VertShift);
  end;
//.
if (XYToGeoCrdConverter <> nil) then TfmXYToGeoCrdConvertor(XYToGeoCrdConverter).GeoObjectTracks.ClearSelectedItems(); 
//.
TReflecting(Reflecting).RecalcReflect();
//.
DoOnPositionChange();
//.
UpdateCompass();
UpdateGeoCompass();
//.
flReflectionChanged:=true;
flReflectionAligned:=false;
end;

procedure TReflector.SetReflection(const X,Y: Extended);
var
  W: TReflectionWindowStrucEx;
  ofsX,ofsY: Extended;
begin
Reflecting.CancelRRR(); //. cancel reforming,reflecting,revising
//. save history
ReflectionWindow.GetWindow(true, W);
LastPlaces_Insert(W);
//.
with ReflectionWindow do begin
Lock.Enter;
try
ofsX:=X*cfTransMeter-XCenter;
ofsY:=Y*cfTransMeter-YCenter;
X0:=X0+ofsX;Y0:=Y0+ofsY;
X1:=X1+ofsX;Y1:=Y1+ofsY;
X2:=X2+ofsX;Y2:=Y2+ofsY;
X3:=X3+ofsX;Y3:=Y3+ofsY;
Update;
finally
Lock.Leave;
end;
end;
//.
if (Reflecting.Configuration.BriefReflectingType = brtPartialWithLastReflection)
 then begin
  Reflecting.LastReflectedBitmap.BMP_Clear();
  DynamicHints.Clear();
  end;
//.
if (XYToGeoCrdConverter <> nil) then TfmXYToGeoCrdConvertor(XYToGeoCrdConverter).GeoObjectTracks.ClearSelectedItems(); 
//.
Reflecting.RecalcReflect();
//.
DoOnPositionChange();
//.
UpdateCompass();
UpdateGeoCompass();
//.
flReflectionChanged:=true;
flReflectionAligned:=false;
end;

procedure TReflector.SetReflectionByWindow(const pWindow: TReflectionWindowStrucEx);
var
  W: TReflectionWindowStrucEx;
begin
Reflecting.CancelRRR(); //. cancel reforming,reflecting,revising
//. save history
ReflectionWindow.GetWindow(true, W);
LastPlaces_Insert(W);
//.
with ReflectionWindow do begin
Lock.Enter;
try
X0:=pWindow.X0*cfTransMeter;Y0:=pWindow.Y0*cfTransMeter;
X1:=pWindow.X1*cfTransMeter;Y1:=pWindow.Y1*cfTransMeter;
X2:=pWindow.X2*cfTransMeter;Y2:=pWindow.Y2*cfTransMeter;
X3:=pWindow.X3*cfTransMeter;Y3:=pWindow.Y3*cfTransMeter;
Normalize;
Update;
finally
Lock.Leave;
end;
end;
//.
if (Reflecting.Configuration.BriefReflectingType = brtPartialWithLastReflection)
 then begin
  Reflecting.LastReflectedBitmap.BMP_Clear();
  DynamicHints.Clear();
  end;
//.
if (XYToGeoCrdConverter <> nil) then TfmXYToGeoCrdConvertor(XYToGeoCrdConverter).GeoObjectTracks.ClearSelectedItems(); 
//.
Reflecting.RecalcReflect;
//.
DoOnPositionChange();
//.
UpdateCompass();
UpdateGeoCompass();
end;

procedure TReflector.ShiftingSetReflection(const X,Y: Extended);
var
  W: TReflectionWindowStrucEx;
  ofsX,ofsY: Extended;
  LastX,LastY: Extended;
  LastXScr,LastYScr: Extended;
  HorShift,VertShift: integer;
begin
Reflecting.CancelRRR(); //. cancel reforming,reflecting,revising
//. save history
ReflectionWindow.GetWindow(true, W);
LastPlaces_Insert(W);
//.
with ReflectionWindow do begin
Lock.Enter();
try
LastX:=X0/cfTransMeter;
LastY:=Y0/cfTransMeter;
//.
ofsX:=X*cfTransMeter-XCenter;
ofsY:=Y*cfTransMeter-YCenter;
X0:=X0+ofsX;Y0:=Y0+ofsY;
X1:=X1+ofsX;Y1:=Y1+ofsY;
X2:=X2+ofsX;Y2:=Y2+ofsY;
X3:=X3+ofsX;Y3:=Y3+ofsY;
Update();
//.
ConvertRealCrd2ScrExtendCrd(LastX,LastY,{out} LastXScr,LastYScr);
finally
Lock.Leave();
end;
end;
//.
HorShift:=Trunc(LastXScr);
VertShift:=Trunc(LastYScr);
//.
if (PrimMap_Exist AND PrimMap_Fixing) then PrimMap_Shift(HorShift,VertShift);
//.
if (Reflecting.Configuration.BriefReflectingType = brtPartialWithLastReflection)
 then begin
  Reflecting.LastReflectedBitmap.Transformatrix_Move(HorShift,VertShift);
  DynamicHints.BindingPoints_Shift(HorShift,VertShift);
  end;
//.
if (XYToGeoCrdConverter <> nil) then TfmXYToGeoCrdConvertor(XYToGeoCrdConverter).GeoObjectTracks.ClearSelectedItems(); 
//.
TReflecting(Reflecting).RecalcReflect();
//.
DoOnPositionChange();
//.
UpdateCompass();
UpdateGeoCompass();
//.
flReflectionChanged:=true;
flReflectionAligned:=false;
end;

procedure TReflector.RotateReflection(Angle: Extended);
var
   QdR,Qdl,dirRotate: Extended;

  procedure PrepCoord(var X,Y: Extended; DPX,DPY: Extended);
  var
     diffXXc,diffYYc,ofsXrt1,ofsYrt1,ofsXrt2,ofsYrt2,a,b,c: Extended;
  begin
  diffXXc:=(X-ReflectionWindow.Xcenter);diffYYc:=(Y-ReflectionWindow.Ycenter);
  a:=4.0*QdR;
  if abs(diffXXc) >= abs(diffYYc)
   then
    begin
    b:=4.0*Qdl*diffYYc;
    c:=Qdl*(Qdl-4.0*Sqr(diffXXc));

    ofsYrt1:=(-b+Sqrt(sqr(b)-4.0*a*c))/(2.0*a);
    ofsXrt1:=(-2.0*ofsYrt1*diffYYc-Qdl)/(2.0*diffXXc);

    ofsYrt2:=(-b-Sqrt(sqr(b)-4.0*a*c))/(2.0*a);
    ofsXrt2:=(-2.0*ofsYrt2*diffYYc-Qdl)/(2.0*diffXXc);

    if Sqrt(sqr((X+ofsXrt1)-DPX)+sqr((Y+ofsYrt1)-DPY))*DirRotate < Sqrt(sqr((X+ofsXrt2)-DPX)+sqr((Y+ofsYrt2)-DPY))*DirRotate
     then
      begin
      X:=X+ofsXrt1;
      Y:=Y+ofsYrt1;
      end
     else
      begin
      X:=X+ofsXrt2;
      Y:=Y+ofsYrt2;
      end;
    end
   else
    begin
    b:=4.0*Qdl*diffXXc;
    c:=Qdl*(Qdl-4.0*Sqr(diffYYc));

    ofsXrt1:=(-b+Sqrt(sqr(b)-4.0*a*c))/(2.0*a);
    ofsYrt1:=(-2.0*ofsXrt1*diffXXc-Qdl)/(2.0*diffYYc);

    ofsXrt2:=(-b-Sqrt(sqr(b)-4.0*a*c))/(2.0*a);
    ofsYrt2:=(-2.0*ofsXrt2*diffXXc-Qdl)/(2.0*diffYYc);

    if Sqrt(sqr((Y+ofsYrt1)-DPY)+sqr((X+ofsXrt1)-DPX))*DirRotate < Sqrt(sqr((Y+ofsYrt2)-DPY)+sqr((X+ofsXrt2)-DPX))*DirRotate
     then
      begin
      Y:=Y+ofsYrt1;
      X:=X+ofsXrt1;
      end
     else
      begin
      Y:=Y+ofsYrt2;
      X:=X+ofsXrt2;
      end;
    end;
  end;

var
  Xc,Yc: single;
begin
if (PrimMap_Exist AND PrimMap_Fixing) then Exit; //. ->
//.
Reflecting.CancelRRR(); //. cancel reforming,reflecting,revising
//.
if RotateAngleStep <> 0
 then
  if Abs(Angle) > RotateAngleStep
   then
    Angle:=Round(Angle/RotateAngleStep)*RotateAngleStep
   else begin
    RotateAngleAccumulator:=RotateAngleAccumulator+Angle;
    if Abs(RotateAngleAccumulator) < RotateAngleStep then Exit; //. ->
    Angle:=Round(RotateAngleAccumulator/RotateAngleStep)*RotateAngleStep;
    RotateAngleAccumulator:=0;
    end;
with ReflectionWindow do begin
Lock.Enter;
try
dirRotate:=Angle/abs(Angle);
{!!! algorithm working area} if Abs(Angle) > Pi/32 then Angle:=Pi/32*dirRotate;
QdR:=sqr(X0-Xcenter)+sqr(Y0-Ycenter);
Qdl:=QdR*sqr(2.0*Sin(Angle/2.0));
PrepCoord(X0,Y0, X1,Y1);
PrepCoord(X1,Y1, X2,Y2);
PrepCoord(X2,Y2, X3,Y3);
PrepCoord(X3,Y3, X0,Y0);
Update;
if ((X1 = X0) OR (Y1 = Y0)) OR ((X3 = X0) OR (Y3 = Y0))
 then begin //. avoid algorithm except point
  RotateReflection(PI/4000000);
  Exit; //. ->
  end;
Xc:=Xmd-Xmn; Yc:=Ymd-Ymn;
finally
Lock.Leave;
end;
end;
//.
if (Reflecting.Configuration.BriefReflectingType = brtPartialWithLastReflection)
 then begin
  Reflecting.LastReflectedBitmap.Transformatrix_Rotate(Xc,Yc,-Angle);
  DynamicHints.BindingPoints_Rotate(Xc,Yc,-Angle);
  end;
//.
if (XYToGeoCrdConverter <> nil) then TfmXYToGeoCrdConvertor(XYToGeoCrdConverter).GeoObjectTracks.ClearSelectedItems(); 
//.
TReflecting(Reflecting).RecalcReflect;
//.
flReflectionChanged:=true;
flReflectionAligned:=false;
//.
UpdateCompass;
UpdateGeoCompass();
end;

procedure TReflector.ChangeScaleReflection(const ScaleFactor: Extended);

  procedure PrepCoord(var X,Y: Extended);
  var
     diffXXc,diffYYc,ofsX,ofsY: Extended;
  begin
  diffXXc:=X-ReflectionWindow.Xcenter;diffYYc:=Y-ReflectionWindow.Ycenter;

  ofsX:=(diffXXc)*ScaleFactor;
  ofsY:=(diffYYc)*ScaleFactor;

  X:=X+ofsX;
  Y:=Y+ofsY;
  end;

var
  Xc,Yc: single;
  Sc: Extended;
begin
if (PrimMap_Exist AND PrimMap_Fixing) then Exit; //. ->
//.
Reflecting.CancelRRR(); //. cancel reforming,reflecting,revising
//.
with ReflectionWindow do begin
Lock.Enter;
try
PrepCoord(X0,Y0);
PrepCoord(X2,Y2);
PrepCoord(X1,Y1);
PrepCoord(X3,Y3);
Normalize();
//. (not needed, it is present in Normalize()) Update;
Xc:=Xmd-Xmn; Yc:=Ymd-Ymn;
finally
Lock.Leave;
end;
end;
//.
if (Reflecting.Configuration.BriefReflectingType = brtPartialWithLastReflection)
 then begin
  Sc:=1.0/(1+ScaleFactor);
  Reflecting.LastReflectedBitmap.Transformatrix_Scale(Xc,Yc,Sc);
  DynamicHints.BindingPoints_Scale(Xc,Yc,Sc);
  end;
//.
if (XYToGeoCrdConverter <> nil) then TfmXYToGeoCrdConvertor(XYToGeoCrdConverter).GeoObjectTracks.ClearSelectedItems(); 
//.
TReflecting(Reflecting).RecalcReflect;
//.
if ((XYToGeoCrdConverter <> nil) AND (XYToGeoCrdConverter.Visible)) then TfmXYToGeoCrdConvertor(XYToGeoCrdConverter).RecalculateReflectorCenterCrdAndScale;
if (ReflectionWindow_ActualityIntervalPanel <> nil) then TfmReflectionWindowActualityIntervalPanel(ReflectionWindow_ActualityIntervalPanel).PostUpdatePanel(); 
//.
flReflectionChanged:=true;
flReflectionAligned:=false;
end;

function TReflector.DoAlignReflection: boolean;

  procedure SetReflectionByObj(const ptrObj: TPtr);
  var
    Obj: TSpaceObj;
    ptrPoint: TPtr;
    P0,P1: TPoint;
    CELLs_X0,CELLs_Y0, CELLs_X1,CELLs_Y1: Extended;
    CELLs_Xcenter,CELLs_Ycenter: Extended;
    ALFA,BETTA,GAMMA: Extended;
  begin
  Space.ReadObj(Obj,SizeOf(Obj), ptrObj);
  if (Obj.Width = 0) then Raise Exception.Create('width is null'); //. =>
  ptrPoint:=Obj.ptrFirstPoint;
  if (ptrPoint = nilPtr) then Raise Exception.Create('could not get P0'); //. =>
  Space.ReadObj(P0,SizeOf(P0), ptrPoint);
  ptrPoint:=P0.ptrNextObj;
  if (ptrPoint = nilPtr) then Raise Exception.Create('could not get P1'); //. =>
  Space.ReadObj(P1,SizeOf(P1), ptrPoint);
  ptrPoint:=P1.ptrNextObj;
  if (ptrPoint <> nilPtr) then Raise Exception.Create('too many nodes'); //. =>
  CELLs_X0:=P0.X; CELLs_Y0:=P0.Y;
  CELLs_X1:=P1.X; CELLs_Y1:=P1.Y;
  CELLs_Xcenter:=(CELLs_X1+CELLs_X0)/2; CELLs_Ycenter:=(CELLs_Y1+CELLs_Y0)/2;
  with ReflectionWindow do begin
  Lock.Enter;
  try
  if (CELLs_X1-CELLs_X0) <> 0
   then
    ALFA:=Arctan((CELLs_Y1-CELLs_Y0)/(CELLs_X1-CELLs_X0))
   else
    if (CELLs_Y1-CELLs_Y0) >= 0
     then ALFA:=PI/2
     else ALFA:=-PI/2;
  if (X1-X0) <> 0
   then
    BETTA:=Arctan((Y1-Y0)/(X1-X0))
   else
    if (Y1-Y0) >= 0
     then BETTA:=PI/2
     else BETTA:=-PI/2;
  GAMMA:=(ALFA-BETTA);
  if (CELLs_X1-CELLs_X0)*(X1-X0) < 0
   then
    if (CELLs_Y1-CELLs_Y0)*(Y1-Y0) >= 0
     then GAMMA:=GAMMA-PI
     else GAMMA:=GAMMA+PI;
  finally
  Lock.Leave;
  end;
  end;
  /// ? SetReflection(CELLs_Xcenter,CELLs_Ycenter);
  GAMMA:=-GAMMA;
  if GAMMA < -PI
   then
    GAMMA:=GAMMA+2*PI
   else
    if GAMMA > PI
     then
      GAMMA:=GAMMA-2*PI;
  while Abs(GAMMA) > PI/32 do begin
    RotateReflection(PI/32*(GAMMA/Abs(GAMMA)));
    GAMMA:=GAMMA-PI/32*(GAMMA/Abs(GAMMA));
    //.
    /// ? Sleep(15);
    /// ? Application.ProcessMessages;
    end;
  RotateReflection(GAMMA);
  end;

var
  ptrReflLay: pointer;
  ptrItem: pointer;
  Obj: TSpaceObj;
  ptrPoint: TPtr;
  P0,P1: TPoint;
  S,LastMaxS,MaxS: Extended;
  ptrMaxSObj: TPtr;
begin
Result:=false;
//. search for the object of aligning
with Reflecting do begin
Lock.Enter;
try
ptrMaxSObj:=nilPtr;
ptrReflLay:=Lays;
while ptrReflLay <> nil do with TLayReflect(ptrReflLay^) do begin
  LastMaxS:=0; MaxS:=LastMaxS;
  ptrItem:=Objects;
  while ptrItem <> nil do begin
    with TItemLayReflect(ptrItem^) do begin
    if (NOT Space.Obj_IsCached(ptrObject)) then Exit; //. ->
    Space.ReadObj(Obj,SizeOf(Obj), ptrObject);
    if Obj.Width > 0
     then begin
      ptrPoint:=Obj.ptrFirstPoint;
      if ptrPoint <> nilPtr
       then begin
        Space.ReadObj(P0,SizeOf(P0), ptrPoint);
        ptrPoint:=P0.ptrNextObj;
        if ptrPoint <> nilPtr
         then begin
          Space.ReadObj(P1,SizeOf(P1), ptrPoint);
          ptrPoint:=P1.ptrNextObj;
          if ptrPoint = nilPtr
           then begin
            Obj_PrepareFigures(ptrObject, ReflectionWindow,WindowRefl, FigureWinRefl,AdditiveFigureWinRefl);
            if FigureWinRefl.Count = 2
             then begin
              S:=Sqrt(sqr(FigureWinRefl.ScreenNodes[1].X-FigureWinRefl.ScreenNodes[0].X)+sqr(FigureWinRefl.ScreenNodes[1].Y-FigureWinRefl.ScreenNodes[0].Y))*(Obj.Width*ReflectionWindow.Scale);
              if S > MaxS
               then begin
                LastMaxS:=MaxS;
                MaxS:=S;
                ptrMaxSObj:=ptrObject;
                end;
              end;
            end;
          end;
        end;
      end;
    end;
    //. go to next item
    ptrItem:=TItemLayReflect(ptrItem^).ptrNext;
    end;
  ptrReflLay:=ptrNext;
  end;
finally
Lock.Leave;
end;
end;
//.
if ptrMaxSObj = nilPtr then Exit; //. ->
//.
SetReflectionByObj(ptrMaxSObj);
flReflectionChanged:=true;
flReflectionAligned:=true;
Result:=true;
end;

procedure TReflector.ChangeWidthHeight(pWidth,pHeight: integer);

  procedure PixShiftPoint(const VertShift,HorShift: integer; var X,Y: TCrd);
  var
     VS,HS,ofsX,ofsY: Extended;
     diffX0X3,diffY0Y3, diffX0X1,diffY0Y1: real;
  begin
  with ReflectionWindow do begin
  VS:=VertShift*VertRange/(Ymx-Ymn);
  HS:=HorShift*HorRange/(Xmx-Xmn);
  //.
  diffX0X3:=X0-X3;diffY0Y3:=Y0-Y3;
  diffX0X1:=X0-X1;diffY0Y1:=Y0-Y1;
  //.
  ofsX:=(diffX0X1)*HS/HorRange+(diffX0X3)*VS/VertRange;
  ofsY:=(diffY0Y1)*HS/HorRange+(diffY0Y3)*VS/VertRange;
  //.
  X:=X+ofsX;Y:=Y+ofsY;
  end;
  end;

var
  X1new,Y1new,
  X2new,Y2new,
  X3new,Y3new: TCrd;
begin 
with ReflectionWindow do begin
Lock.Enter;
try
X1new:=X1;Y1new:=Y1;
X2new:=X2;Y2new:=Y2;
X3new:=X3;Y3new:=Y3;
PixShiftPoint(0,Xmx-pWidth, X1new,Y1new);
PixShiftPoint(Ymx-pHeight,Xmx-pWidth, X2new,Y2new);
PixShiftPoint(Ymx-pHeight,0, X3new,Y3new);
X1:=X1new;Y1:=Y1new;
X2:=X2new;Y2:=Y2new;
X3:=X3new;Y3:=Y3new;
Xmx:=Xmn+pWidth;
Ymx:=Ymn+pHeight;
Update;
finally
Lock.Leave;
end;
end;
//.
if (fmImportComponents <> nil)
 then with fmImportComponents do begin
  Left:=pnlControl.Left+pnlControl.Width;
  Width:=Self.ClientWidth-Left;
  end;
//.
if (fmCreateObjectGallery <> nil)
 then with fmCreateObjectGallery do begin
  Left:=pnlControl.Left+pnlControl.Width;
  Width:=Self.ClientWidth-Left;
  end;
//. изменяем специальные Control-ы
with BeginZoneChangeScaleView do begin
Left:=Self.ClientWidth-60;
Top:=0;
Height:=Self.Height-1-StatusPanel.Height;
end;
with BeginZoneRotateView do begin
Left:=Self.ClientWidth-30;
Top:=0;
Height:=Self.Height-1-StatusPanel.Height;
end;
with PanelProgressShowHints do begin
Left:=round((Self.ClientWidth-Width)/2);
Top:=-2;
end;
with StatusPanel do begin
Left:=0;
Width:=Self.ClientWidth;
Top:=Self.ClientHeight-Height;
end;
if (XYToGeoCrdConverter <> nil)
 then with XYToGeoCrdConverter do begin
  Left:=0;
  if (StatusPanel.Visible)
   then Top:=StatusPanel.Top-XYToGeoCrdConverter.Height
   else Top:=Self.ClientHeight-XYToGeoCrdConverter.Height;
  Width:=Self.ClientWidth;
  end;
if (fmElectedObjectsGallery <> nil)
 then with fmElectedObjectsGallery do begin
  Left:=pnlControl.Left+pnlControl.Width;
  Width:=Self.ClientWidth-Left;
  if ((XYToGeoCrdConverter <> nil) AND (XYToGeoCrdConverter.Visible))
   then Top:=XYToGeoCrdConverter.Top-Height
   else
    if (StatusPanel.Visible)
     then Top:=StatusPanel.Top-Height
     else Top:=ClientHeight-Height;
  end;
with pnlCompass do begin
Left:=BeginZoneChangeScaleView.Left-Width;
Top:=StatusPanel.Top-Height;
end;
if (Navigator <> nil) then TfmReflectorNavigator(Navigator).Align();
//.
BMPBuffer.Width:=Width;
BMPBuffer.Height:=Height;
//.
DoOnPositionChange();
//.
with TReflecting(Reflecting) do begin
Validate();
if (Space.State <> psstCreating) then RecalcReflect();
end;
end;

procedure TReflector.PutLine(Canvas: TCanvas; Xs0,Ys0, Xs1,Ys1: integer);
begin
with Canvas do begin
MoveTo(Xs0,Ys0);
LineTo(Xs1,Ys1);
end;
end;

procedure TReflector.PutHandle(Canvas: TCanvas; X,Y: integer;flagActive: boolean);
var
  oldColor: TColor;
begin
With Canvas do begin
Lock;
try
oldColor:=Pen.Color;
if not flagActive
 then
  Pen.Color:=clHandleObj
 else
  Pen.Color:=clActiveHandleObj;
MoveTo(X-1,Y-1);
LineTo(X+1,Y-1);
MoveTo(X-1,Y+1);
LineTo(X+1,Y+1);
MoveTo(X-1,Y-1);
LineTo(X-1,Y+1);
MoveTo(X+1,Y-1);
LineTo(X+1,Y+1);
MoveTo(X-2,Y-2);
LineTo(X+2,Y-2);
MoveTo(X-2,Y+2);
LineTo(X+2,Y+2);
MoveTo(X-2,Y-2);
LineTo(X-2,Y+2);
MoveTo(X+2,Y-2);
LineTo(X+2,Y+2);
Pen.Color:=oldColor;
finally
UnLock;
end;
end;
end;

procedure TReflector.ShowXYToGeoCrdConverterElements(Canvas: TCanvas; const ptrCancelFlag: pointer; const BestBeforeTime: TDateTime);

  procedure ConvertNode(X,Y: Extended; out Xs,Ys: Extended);
  var
    RW: TReflectionWindowStrucEx;
    QdA2: Extended;
    X_C,X_QdC,X_A1,X_QdB2: Extended;
    Y_C,Y_QdC,Y_A1,Y_QdB2: Extended;
  begin
  ReflectionWindow.GetWindow(false, RW);
  with RW do begin
  X:=X*cfTransMeter;
  Y:=Y*cfTransMeter;
  QdA2:=sqr(X-X0)+sqr(Y-Y0);
  X_QdC:=sqr(X1-X0)+sqr(Y1-Y0);
  X_C:=Sqrt(X_QdC);
  X_QdB2:=sqr(X-X1)+sqr(Y-Y1);
  X_A1:=(X_QdC-X_QdB2+QdA2)/(2*X_C);
  Y_QdC:=sqr(X3-X0)+sqr(Y3-Y0);
  Y_C:=Sqrt(Y_QdC);
  Y_QdB2:=sqr(X-X3)+sqr(Y-Y3);
  Y_A1:=(Y_QdC-Y_QdB2+QdA2)/(2*Y_C);
  Xs:=Xmn+X_A1/X_C*(Xmx-Xmn);
  Ys:=Ymn+Y_A1/Y_C*(Ymx-Ymn);
  end;
  end;

  procedure ShowCrdMesh;
  const
    MeshStep = 1/60.0;
    MeshMaxLines = 61;
  type
    TLatLong = record
      Lat,Long: Extended;
    end;

    function GetCrdStr(const Crd: Extended): string;
    var
      Degs,Mins: integer;
    begin
    Degs:=Trunc(Crd);
    Mins:=Round(Frac(Crd)*60.0);
    if (Mins = 60)
     then begin
      Inc(Degs);
      Mins:=0;
      end;
    Result:=IntToStr(Degs)+'°'+IntToStr(Mins)+'''';
    end;

  var
    RW: TReflectionWindowStrucEx;
    LLArray: array[0..3] of TLatLong;
    minLat,maxLat,
    minLong,maxLong: Extended;
    I: integer;
    SavedPenStyle: TPenStyle;
    SavedPenMode: TPenMode;
    SavedBrushStyle: TBrushStyle;
    LineFig: TFigureWinRefl;
    Lat,Long: Extended;
    X0,Y0, X1,Y1: Extended;
    Node: TNode;
    X,Y: integer;
    S: string;
  begin
  if (NOT ((XYToGeoCrdConverter <> nil) AND TfmXYToGeoCrdConvertor(XYToGeoCrdConverter).Visible AND TfmXYToGeoCrdConvertor(XYToGeoCrdConverter).sbCrdMesh.Down)) then Exit; //. ->
  ReflectionWindow.GetWindow(true, RW);
  with TfmXYToGeoCrdConvertor(XYToGeoCrdConverter) do begin
  if (NOT (ConvertXYToGeoCrd(RW.X0,RW.Y0, LLArray[0].Lat,LLArray[0].Long) AND ConvertXYToGeoCrd(RW.X1,RW.Y1, LLArray[1].Lat,LLArray[1].Long) AND ConvertXYToGeoCrd(RW.X2,RW.Y2, LLArray[2].Lat,LLArray[2].Long) AND ConvertXYToGeoCrd(RW.X3,RW.Y3, LLArray[3].Lat,LLArray[3].Long))) then Exit; //. ->
  end;
  //.
  minLong:=LLArray[0].Long; minLat:=LLArray[0].Lat;
  maxLong:=minLong; maxLat:=minLat;
  for I:=1 to Length(LLArray)-1 do with LLArray[I] do begin
    if Long < minLong
     then minLong:=Long
     else
      if Long > maxLong
       then maxLong:=Long;
    if Lat < minLat
     then minLat:=Lat
     else
      if Lat > maxLat
       then maxLat:=Lat;
    end;
  //.
  Canvas.Lock;
  SavedPenStyle:=Canvas.Pen.Style;
  SavedPenMode:=Canvas.Pen.Mode;
  SavedBrushStyle:=Canvas.Brush.Style;
  try
  Canvas.Pen.Mode:=pmXOR;
  LineFig:=TFigureWinRefl.Create;
  try
  if ((maxLat-minLat)/MeshStep <= MeshMaxLines)
   then begin
    Lat:=Trunc(minLat*60.0)/60.0;
    while (Lat <= maxLat) do begin
      with TfmXYToGeoCrdConvertor(XYToGeoCrdConverter) do begin
      if (NOT (ConvertGeoGrdToXY(Lat,minLong, X0,Y0) AND ConvertGeoGrdToXY(Lat,maxLong, X1,Y1))) then Exit; //. ->
      end;
      LineFig.Clear;
      ConvertNode(X0,Y0, Node.X,Node.Y);
      LineFig.Insert(Node);
      ConvertNode(X1,Y1, Node.X,Node.Y);
      LineFig.Insert(Node);
      LineFig.AttractToLimits(Reflecting.WindowRefl);
      LineFig.Optimize();
      if (LineFig.CountScreenNodes = 2)
       then begin
        Canvas.Pen.Style:=psDot;
        Canvas.Brush.Style:=bsClear;
        Canvas.Pen.Color:=clSilver;
        Canvas.Pen.Width:=1;
        Canvas.MoveTo(LineFig.ScreenNodes[0].X,LineFig.ScreenNodes[0].Y);
        Canvas.LineTo(LineFig.ScreenNodes[1].X,LineFig.ScreenNodes[1].Y);
        //.
        S:=GetCrdStr(Lat)+'  ';
        Canvas.Brush.Style:=bsClear;
        Canvas.Font.Color:=clWhite;
        Canvas.Font.Name:='Tahoma';
        Canvas.Font.Size:=10;
        if (LineFig.ScreenNodes[0].X > LineFig.ScreenNodes[1].X)
         then Y:=LineFig.ScreenNodes[0].Y
         else Y:=LineFig.ScreenNodes[1].Y;
        Y:=Y-Canvas.TextHeight(S);
        X:=RW.Xmx-Canvas.TextWidth(S);
        Canvas.TextOut(X,Y, S);
        end;
      //. next line
      Lat:=Lat+MeshStep;
      end;
    end;
  if ((maxLong-minLong)/MeshStep <= MeshMaxLines)
   then begin
    Long:=Trunc(minLong*60.0)/60.0;
    while (Long <= maxLong) do begin
      with TfmXYToGeoCrdConvertor(XYToGeoCrdConverter) do begin
      if (NOT (ConvertGeoGrdToXY(minLat,Long, X0,Y0) AND ConvertGeoGrdToXY(maxLat,Long, X1,Y1))) then Exit; //. ->
      end;
      LineFig.Clear;
      ConvertNode(X0,Y0, Node.X,Node.Y);
      LineFig.Insert(Node);
      ConvertNode(X1,Y1, Node.X,Node.Y);
      LineFig.Insert(Node);
      LineFig.AttractToLimits(Reflecting.WindowRefl);
      LineFig.Optimize();
      if (LineFig.CountScreenNodes = 2)
       then begin
        Canvas.Pen.Style:=psDot;
        Canvas.Brush.Style:=bsClear;
        Canvas.Pen.Color:=clSilver;
        Canvas.Pen.Width:=1;
        Canvas.MoveTo(LineFig.ScreenNodes[0].X,LineFig.ScreenNodes[0].Y);
        Canvas.LineTo(LineFig.ScreenNodes[1].X,LineFig.ScreenNodes[1].Y);
        //.
        S:=GetCrdStr(Long);
        Canvas.Brush.Style:=bsClear;
        Canvas.Font.Color:=clWhite;
        Canvas.Font.Name:='Tahoma';
        Canvas.Font.Size:=10;
        if (LineFig.ScreenNodes[0].Y < LineFig.ScreenNodes[1].Y)
         then X:=LineFig.ScreenNodes[0].X
         else X:=LineFig.ScreenNodes[1].X;
        Y:=0;
        Canvas.TextOut(X,Y, S);
        end;
      //. next line
      Long:=Long+MeshStep;
      end;
    end;
  finally
  LineFig.Destroy;
  end;
  finally
  Canvas.Brush.Style:=SavedBrushStyle;
  Canvas.Pen.Mode:=SavedPenMode;
  Canvas.Pen.Style:=SavedPenStyle;
  Canvas.Unlock;
  end;
  end;

  procedure ShowDistancesPaths;
  const
    NodeMarkerR = 4;

    function IsNodeVisible(const Xs,Ys: Extended): boolean;
    var
      RW: TReflectionWindowStrucEx;
    begin
    ReflectionWindow.GetWindow(false, RW);
    with RW do
    Result:=(((Xmn <= Xs) AND (Xs <= Xmx)) AND ((Ymn <= Ys) AND (Ys <= Ymx)));
    end;

    procedure ShowNodeMarker(const NX,NY: Extended; const NodeIndex: integer);
    begin
    Canvas.Pen.Style:=psSolid;
    Canvas.Pen.Color:=clMaroon;
    Canvas.Pen.Width:=2;
    Canvas.Brush.Style:=bsSolid;
    Canvas.Brush.Color:=clRed;
    Canvas.Ellipse(Round(NX)-NodeMarkerR,Round(NY)-NodeMarkerR,Round(NX)+NodeMarkerR,Round(NY)+NodeMarkerR);
    Canvas.Brush.Style:=bsClear;
    Canvas.Font.Color:=clWhite;
    Canvas.Font.Name:='Tahoma';
    Canvas.Font.Size:=10;
    Canvas.TextOut(Round(NX+NodeMarkerR),Round(NY+NodeMarkerR),'#'+IntToStr(NodeIndex));
    end;

  var
    SavedPenStyle: TPenStyle;
    SavedBrushStyle: TBrushStyle;
    ptrLastNode,ptrNode: pointer;
    NodeIndex: integer;
    LastNode_Xs,LastNode_Ys, Node_Xs,Node_Ys: Extended;
    LastNode_flVisible, Node_flVisible: boolean;
    R: Extended;
  begin
  if (NOT ((XYToGeoCrdConverter <> nil) AND (XYToGeoCrdConverter.Visible))) then Exit; //. ->
  Canvas.Lock;
  SavedPenStyle:=Canvas.Pen.Style;
  SavedBrushStyle:=Canvas.Brush.Style;
  try
  with TfmXYToGeoCrdConvertor(XYToGeoCrdConverter).DistanceNodes do begin
  Lock.Enter;
  try
  if (Nodes <> nil)
   then begin
    ptrLastNode:=Nodes;
    with TDistanceNode(ptrLastNode^) do ConvertNode(X,Y, LastNode_Xs,LastNode_Ys);
    LastNode_flVisible:=(IsNodeVisible(LastNode_Xs,LastNode_Ys));
    if (LastNode_flVisible) then ShowNodeMarker(LastNode_Xs,LastNode_Ys,0);
    ptrNode:=TDistanceNode(ptrLastNode^).ptrNext;
    if (ptrNode <> nil)
     then begin
      NodeIndex:=1;
      repeat
        with TDistanceNode(ptrNode^) do ConvertNode(X,Y, Node_Xs,Node_Ys);
        Node_flVisible:=IsNodeVisible(Node_Xs,Node_Ys);
        //. draw distance line
        if (LastNode_flVisible OR Node_flVisible)
         then begin
          Canvas.Pen.Style:=psDash;
          Canvas.Pen.Color:=clWhite;
          Canvas.Pen.Width:=1;
          Canvas.Brush.Style:=bsClear;
          Canvas.MoveTo(Round(LastNode_Xs),Round(LastNode_Ys));
          Canvas.LineTo(Round(Node_Xs),Round(Node_Ys));
          Canvas.Brush.Style:=bsClear;
          Canvas.Font.Color:=clWhite;
          Canvas.Font.Name:='Tahoma';
          Canvas.Font.Size:=10;
          Canvas.TextOut(Round((LastNode_Xs+Node_Xs)/2),Round((LastNode_Ys+Node_Ys)/2),' '+FormatFloat('0.000',TDistanceNode(ptrLastNode^).DistanceToNext)+' m ');
          end;
        //. draw nodes marks
        if (Node_flVisible) then ShowNodeMarker(Node_Xs,Node_Ys,NodeIndex);
        //. next interval
        ptrLastNode:=ptrNode;
        LastNode_Xs:=Node_Xs;
        LastNode_Ys:=Node_Ys;
        LastNode_flVisible:=Node_flVisible;
        ptrNode:=TDistanceNode(ptrLastNode^).ptrNext;
        Inc(NodeIndex);
      until (ptrNode = nil);
      end;
    //. draw current distance
    if (TfmXYToGeoCrdConvertor(XYToGeoCrdConverter).CurrentPos_flXYCalculated AND TfmXYToGeoCrdConvertor(XYToGeoCrdConverter).CurrentPos_flLatLongCalculated AND (TfmXYToGeoCrdConvertor(XYToGeoCrdConverter).CurrentPos_DistanceFromLastNode > 0))
     then begin
      with TDistanceNode(ptrLastNode^) do ConvertNode(X,Y, LastNode_Xs,LastNode_Ys);
      ConvertNode(TfmXYToGeoCrdConvertor(XYToGeoCrdConverter).CurrentPos_X,TfmXYToGeoCrdConvertor(XYToGeoCrdConverter).CurrentPos_Y, Node_Xs,Node_Ys);
      Canvas.Pen.Style:=psSolid;
      Canvas.Pen.Color:=clRed;
      Canvas.Pen.Width:=1;
      Canvas.MoveTo(Round(LastNode_Xs),Round(LastNode_Ys));
      Canvas.LineTo(Round(Node_Xs),Round(Node_Ys));
      R:=Sqrt(sqr(Node_Xs-LastNode_Xs)+sqr(Node_Ys-LastNode_Ys));
      Canvas.Pen.Style:=psDash;
      Canvas.Pen.Color:=clRed;
      Canvas.Pen.Width:=1;
      Canvas.Brush.Style:=bsClear;
      Canvas.Ellipse(Round(LastNode_Xs-R),Round(LastNode_Ys-R),Round(LastNode_Xs+R),Round(LastNode_Ys+R));
      Canvas.Brush.Style:=bsClear;
      Canvas.Font.Color:=clWhite;
      Canvas.Font.Name:='Tahoma';
      Canvas.Font.Size:=10;
      Canvas.TextOut(Round(Node_Xs),Round(Node_Ys),' '+FormatFloat('0.000',TfmXYToGeoCrdConvertor(XYToGeoCrdConverter).CurrentPos_DistanceFromLastNode)+' m ');
      end;
    end;
  finally
  Lock.Leave;
  end;
  end;
  finally
  Canvas.Brush.Style:=SavedBrushStyle;
  Canvas.Pen.Style:=SavedPenStyle;
  Canvas.Unlock;
  end;
  end;

  procedure ShowGeoObjectTracks(const ptrCancelFlag: pointer; const BestBeforeTime: TDateTime);
  begin
  if ((XYToGeoCrdConverter <> nil) AND (XYToGeoCrdConverter.Visible)) then TfmXYToGeoCrdConvertor(XYToGeoCrdConverter).GeoObjectTracks.ShowTracks(Canvas,ptrCancelFlag,BestBeforeTime);
  end;

begin
ShowCrdMesh();
ShowDistancesPaths();
ShowGeoObjectTracks(ptrCancelFlag,MaxDouble{show all tracks BestBeforeTime});
end;

procedure TReflector.ShowObjectTrack(Canvas: TCanvas);

  procedure ConvertNode(X,Y: Extended; out Xs,Ys: Extended);
  var
    RW: TReflectionWindowStrucEx;
    QdA2: Extended;
    X_C,X_QdC,X_A1,X_QdB2: Extended;
    Y_C,Y_QdC,Y_A1,Y_QdB2: Extended;
  begin
  ReflectionWindow.GetWindow(false, RW);
  with RW do begin
  X:=X*cfTransMeter;
  Y:=Y*cfTransMeter;
  QdA2:=sqr(X-X0)+sqr(Y-Y0);
  X_QdC:=sqr(X1-X0)+sqr(Y1-Y0);
  X_C:=Sqrt(X_QdC);
  X_QdB2:=sqr(X-X1)+sqr(Y-Y1);
  X_A1:=(X_QdC-X_QdB2+QdA2)/(2*X_C);
  Y_QdC:=sqr(X3-X0)+sqr(Y3-Y0);
  Y_C:=Sqrt(Y_QdC);
  Y_QdB2:=sqr(X-X3)+sqr(Y-Y3);
  Y_A1:=(Y_QdC-Y_QdB2+QdA2)/(2*Y_C);
  Xs:=Xmn+X_A1/X_C*(Xmx-Xmn);
  Ys:=Ymn+Y_A1/Y_C*(Ymx-Ymn);
  end;
  end;

  procedure ShowPath;
  const
    NodeMarkerR = 4;

    function IsNodeVisible(const Xs,Ys: Extended): boolean;
    var
      RW: TReflectionWindowStrucEx;
    begin
    ReflectionWindow.GetWindow(false, RW);
    with RW do
    Result:=(((Xmn <= Xs) AND (Xs <= Xmx)) AND ((Ymn <= Ys) AND (Ys <= Ymx)));
    end;

    procedure ShowNodeMarker(const NX,NY: Extended; const NTimeStamp: TDateTime; const NodeIndex: integer);
    var
      NodeStr: string;
    begin
    Canvas.Pen.Style:=psSolid;
    Canvas.Pen.Color:=clMaroon;
    Canvas.Pen.Width:=2;
    Canvas.Brush.Style:=bsSolid;
    Canvas.Brush.Color:=clRed;
    Canvas.Ellipse(Round(NX)-NodeMarkerR,Round(NY)-NodeMarkerR,Round(NX)+NodeMarkerR,Round(NY)+NodeMarkerR);
    //.
    if (NodeIndex > 0)
     then NodeStr:=FormatDateTime('HH:NN:SS',NTimeStamp)
     else NodeStr:=FormatDateTime('DD/MM/YY HH:NN:SS',NTimeStamp);
    Canvas.Brush.Style:=bsClear;
    Canvas.Font.Color:=clWhite;
    Canvas.Font.Name:='Tahoma';
    Canvas.Font.Size:=10;
    Canvas.TextOut(Round(NX+NodeMarkerR),Round(NY+NodeMarkerR),NodeStr);
    end;

  var
    SavedPenStyle: TPenStyle;
    SavedBrushStyle: TBrushStyle;
    ptrLastItem,ptrItem: pointer;
    NodeIndex: integer;
    LastNode_Xs,LastNode_Ys, Node_Xs,Node_Ys: Extended;
    LastNode_flVisible, Node_flVisible: boolean;
    R: Extended;
  begin
  Canvas.Lock;
  SavedPenStyle:=Canvas.Pen.Style;
  SavedBrushStyle:=Canvas.Brush.Style;
  try
  with ObjectTrack do begin
  Lock.Enter;
  try
  if (Items <> nil)
   then begin
    ptrLastItem:=Items;
    with TObjectTrackItem(ptrLastItem^) do ConvertNode(X,Y, LastNode_Xs,LastNode_Ys);
    LastNode_flVisible:=IsNodeVisible(LastNode_Xs,LastNode_Ys);
    if (LastNode_flVisible) then ShowNodeMarker(LastNode_Xs,LastNode_Ys,TObjectTrackItem(ptrLastItem^).TimeStamp,0);
    ptrItem:=TObjectTrackItem(ptrLastItem^).Next;
    if (ptrItem <> nil)
     then begin
      NodeIndex:=1;
      repeat
        with TObjectTrackItem(ptrItem^) do ConvertNode(X,Y, Node_Xs,Node_Ys);
        Node_flVisible:=IsNodeVisible(Node_Xs,Node_Ys);
        if (LastNode_flVisible OR Node_flVisible)
         then begin
          //. draw distance line
          Canvas.Pen.Style:=psSolid;
          Canvas.Pen.Color:=clRed;
          Canvas.Pen.Width:=2;
          Canvas.Brush.Style:=bsClear;
          Canvas.MoveTo(Round(LastNode_Xs),Round(LastNode_Ys));
          Canvas.LineTo(Round(Node_Xs),Round(Node_Ys));
          end;
        //. draw nodes marks
        if (Node_flVisible) then ShowNodeMarker(Node_Xs,Node_Ys,TObjectTrackItem(ptrItem^).TimeStamp,NodeIndex);
        //. next interval
        ptrLastItem:=ptrItem;
        LastNode_Xs:=Node_Xs;
        LastNode_Ys:=Node_Ys;
        LastNode_flVisible:=Node_flVisible;
        ptrItem:=TObjectTrackItem(ptrLastItem^).Next;
        Inc(NodeIndex);
      until (ptrItem = nil);
      end;
    end;
  finally
  Lock.Leave;
  end;
  end;
  finally
  Canvas.Brush.Style:=SavedBrushStyle;
  Canvas.Pen.Style:=SavedPenStyle;
  Canvas.Unlock;
  end;
  end;

begin
if (NOT cbObjectTrack.Checked) then Exit; //. ->
if (ObjectTrack = nil) then Exit; //. ->
ShowPath();
end;

procedure TReflector.ShowMarkCenter(Canvas: TCanvas);
const
  Length = 15;
begin
with ReflectionWindow,Canvas do begin
Pen.Color:=clWhite;
Pen.Style:=psDot;
Pen.Width:=1;
Brush.Color:=clBlack;
//.
ReflectionWindow.Lock.Enter;
try
PutLine(Canvas, Xmd,Ymd-1,Xmd,Ymd-1-Length);
PutLine(Canvas, Xmd+1,Ymd,Xmd+1+length,Ymd);
PutLine(Canvas, Xmd,Ymd+1,Xmd,Ymd+1+Length);
PutLine(Canvas, Xmd-1,Ymd,Xmd-1-length,Ymd);
finally
ReflectionWindow.Lock.Leave;
end;
end;
end;

procedure TReflector.DoOnPositionChange;
var
  Xc,Yc: Extended;
begin
with ReflectionWindow do begin
Lock.Enter;
try
Update;
Xc:=Xcenter/cfTransMeter;
Yc:=Ycenter/cfTransMeter;
finally
Lock.Leave;
end;
edCenterCrd.Text:=FormatFloat('0.###',Xc)+'; '+FormatFloat('0.###',Yc);
///test edCenterCrd.Text:=FormatFloat('0.#####',ReflectionWindow.Scale);
end;
if ((XYToGeoCrdConverter <> nil) AND (XYToGeoCrdConverter.Visible)) then TfmXYToGeoCrdConvertor(XYToGeoCrdConverter).RecalculateReflectorCenterCrdAndScale;
if (ReflectionWindow_ActualityIntervalPanel <> nil) then TfmReflectionWindowActualityIntervalPanel(ReflectionWindow_ActualityIntervalPanel).PostUpdatePanel(); 
end;

procedure TReflector.edCenterKeyPress(Sender: TObject; var Key: Char);

  procedure ParseString(const S: string; out X,Y: Extended);
  var
    NS: String;
    I: integer;
  begin
  I:=1;
  NS:='';
  for I:=1 to Length(S) do
    if S[I] <> ';'
     then NS:=NS+S[I]
     else Break;
  try
  X:=StrToFloat(NS);
  except
    Raise Exception.Create('could not recognize X'); //. =>
    end;
  if I = Length(S) then Raise Exception.Create('Y not found'); //. =>
  Inc(I);
  NS:='';
  for I:=I to Length(S) do NS:=NS+S[I];
  try
  Y:=StrToFloat(NS);
  except
    Raise Exception.Create('could not recognize Y'); //. =>
    end;
  end;

var
  Xc,Yc: Extended;
begin
if Key = #$0D
 then begin
  ParseString(edCenterCrd.Text,Xc,Yc);
  ShiftingSetReflection(Xc,Yc);
  end;
end;

procedure TReflector.MoveSelectedPoint(newX,newY: TCrd);
var
   SelPoint: TPoint;
   ptrSelPoint: TPtr;
   P: TPoint;
   Params: WideString;

  procedure AlignToFormatObj(var X,Y: TCrd);

    function GetNearestNode(FormatNodes: TList; out NX,NY: Extended): boolean;
    var
      I: integer;
      MinDistance,Distance: Extended;
    begin
    Result:=false;
    if (FormatNodes.Count = 0) then Raise Exception.Create('no format node found'); //. =>
    MinDistance:=Sqrt(sqr(TPoint(FormatNodes[1]^).X-TPoint(FormatNodes[0]^).X)+sqr(TPoint(FormatNodes[1]^).Y-TPoint(FormatNodes[0]^).Y));
    for I:=0 to FormatNodes.Count-1 do begin
      Distance:=Sqrt(sqr(TPoint(FormatNodes[I]^).X-X)+sqr(TPoint(FormatNodes[I]^).Y-Y));
      if Distance < MinDistance
       then begin
        NX:=TPoint(FormatNodes[I]^).X; NY:=TPoint(FormatNodes[I]^).Y;
        Result:=true;
        MinDistance:=Distance;
        end;
      end;
    end;

  var
    ptrReflLay: pointer;
    ptrItem: pointer;
    flDone: boolean;
    P: TPoint;
    ptrObj: TPtr;
    FormatNodes: TList;
    FormatSizeX,FormatSizeY: integer;
    NX,NY: Extended;
    ptrDestroyPoint: pointer;
    I: integer;
  begin
  P.X:=X; P.Y:=Y;
  with Reflecting do begin
  Lock.Enter;
  try
  flDone:=false;
  ptrReflLay:=Lays;
  while ptrReflLay <> nil do with TLayReflect(ptrReflLay^) do begin
    ptrItem:=Objects;
    while ptrItem <> nil do with TItemLayReflect(ptrItem^) do begin
      if (ptrObject <> ptrSelectedObj) AND Reflector.Space.Obj_IsCached(ptrObject) AND Reflector.Space.Obj_IsPointInside(P,ptrObject)
       then with TBase2DVisualizationFunctionality(TComponentFunctionality_Create(Space.Obj_IDType(ptrObject),Space.Obj_ID(ptrObject))) do
        try
        if GetFormatNodes(FormatNodes,FormatSizeX,FormatSizeY)
         then
          try
          if GetNearestNode(FormatNodes, NX,NY) then flDone:=true;
          finally
          for I:=0 to FormatNodes.Count-1 do begin
            ptrDestroyPoint:=FormatNodes[I];
            FreeMem(ptrDestroyPoint,SizeOf(TPoint));
            end;
          FormatNodes.Destroy;
          end
         else flDone:=false;
        finally
        Release;
        end;
      ptrItem:=ptrNext;
      end;
    ptrReflLay:=ptrNext;
    end;
  finally
  Lock.Leave;
  end;
  end;
  if flDone
   then begin
    X:=NX;
    Y:=NY;
    end;
  end;

  function SelectedNodeIndex: integer;
  var
    Obj: TSpaceObj;
    ptrPoint: TPtr;
    Point: TPoint;
  begin
  Space.ReadObj(Obj,SizeOf(Obj), ptrSelectedObj);
  Result:=0;
  ptrPoint:=Obj.ptrFirstPoint;
  while ptrPoint <> nilPtr do begin
    if ptrPoint = ptrSelectedPointObj then Exit; //. ->
    Space.ReadObj(Point,SizeOf(Point), ptrPoint);
    ptrPoint:=Point.ptrNextObj;
    Inc(Result);
    end;
  end;

begin
if ptrSelectedObj = nilPtr then Exit; //. ->
if ptrSelectedPointObj = nilPtr then Exit; //. ->
if (Mode <> rmEditing) OR cbEditingAdvanced.Checked OR Configuration.flDisableObjectChanging then Exit; //. ->
CheckUserObjWrite(ptrSelectedObj);
AlignToFormatObj(newX,newY);
with TBase2DVisualizationFunctionality(TComponentFunctionality_Create(Space.Obj_IDType(ptrSelectedObj),Space.Obj_ID(ptrSelectedObj))) do
try
SetNode(SelectedNodeIndex, newX,newY);
finally
Release;
end;
end;

function TReflector.SelectPointObject(X,Y: Extended): boolean;
const
     maxDistFromPointScr = 5;
     maxDist = 10000000000000000.0;
var
   IndicTrueExit: boolean;
   flFound: boolean;
   SelectedObj_ptrPoint: TPtr;

   ptrObjMinDist: TPtr;
   ptrBegPointObjMinDist: TPtr;
   minDist: TCrd;
   minDist_BegPointX,
   minDist_BegPointY,
   minDist_EndPointX,
   minDist_EndPointY: Extended;
   maxDistFromPoint: TCrd;
   ptrObjAroundAdown: TPtr;

  procedure GetDist(const X0,Y0,X1,Y1: Extended; const X,Y: Extended; var D: Extended);
  var
     C,QdC,A1,QdA2,QdB2,QdD: Extended;
  begin
  try
  QdC:=sqr(X1-X0)+sqr(Y1-Y0);
  C:=Sqrt(QdC);
  QdA2:=sqr(X-X0)+sqr(Y-Y0);
  QdB2:=sqr(X-X1)+sqr(Y-Y1);
  A1:=(QdC-QdB2+QdA2)/(2*C);
  QdD:=QdA2-Sqr(A1);
  if ((QdA2-QdD) < QdC) AND ((QdB2-QdD) < QdC)
   then D:=Sqrt(QdD)
   else D:=maxDist;
  except
    D:=maxDist;
    end;
  end;

  procedure ProcessObj(ptrObj: TPtr);
  var
   Obj: TSpaceObj;
   ActualityInterval: TComponentActualityInterval;
   ptrOwnerObj: TPtr;
   //.
   ptrBegPointObj,ptrEndPointObj: TPtr;
   FirstPointObj,BegPointObj,EndPointObj: TPoint;
   DistB,DistE: TCrd;
   Dist: Extended;
   P: TPoint;
  begin
  IndicTrueExit:=false;
  Space.ReadObj(Obj,SizeOf(TSpaceObj), ptrObj);
  //. check for actuality interval
  ActualityInterval:=ReflectionWindow.GetActualityInterval();
  if (NOT Space.Obj_ActualityInterval_IsActualForTimeInterval(Obj,ActualityInterval)) then Exit; //. ->
  //. check for HINTVisualization
  if (Obj.idTObj = idTHINTVisualization)
   then begin
    if (NOT ((Mode = rmEditing) OR (NOT DynamicHints.flEnabled) OR ((EditingOrCreatingObject <> nil) AND (EditingOrCreatingObject.PrototypePtr = ptrObj)))) then Exit; //. ->
    end;
  //.
  P.X:=X;P.Y:=Y;
  if Space.Obj_IsPointInside(P,ptrObj)
   then begin
    ptrObjAroundAdown:=ptrObj;
    {ptrSelectedPointObj:=nilPtr;
    IndicTrueExit:=false;
    ptrObjMinDist:=nilPtr;
    minDist:=1000000000000.0;}
    end;
  ptrBegPointObj:=Obj.ptrFirstPoint;
  if ptrBegPointObj = nilPtr then Exit;
  if not Space.ReadObj(BegPointObj,SizeOf(TPoint), ptrBegPointObj) then Exit;
  FirstPointObj:=BegPointObj;
  DistB:=Sqrt(sqr(X-BegPointObj.X)+sqr(Y-BegPointObj.Y));
  if (DistB < maxDistFromPoint)
   then
    begin
    ptrObjMinDist:=ptrObj;
    SelectedObj_ptrPoint:=ptrBegPointObj;
    IndicTrueExit:=true;
    Exit;
    end;
  EndPointObj:=BegPointObj;
  while EndPointObj.ptrNextObj <> Nilptr do begin
    ptrEndPointObj:=EndPointObj.ptrNextObj;
    Space.ReadObj(EndPointObj,SizeOf(TPoint), ptrEndPointObj);
    DistE:=Sqrt(sqr(X-EndPointObj.X)+sqr(Y-EndPointObj.Y));
    if DistE < maxDistFromPoint
    then
     begin
     ptrObjMinDist:=ptrObj;
     SelectedObj_ptrPoint:=ptrEndPointObj;
     IndicTrueExit:=true;
     Exit;
     end;
    try
    GetDist(BegPointObj.X,BegPointObj.Y,EndPointObj.X,EndPointObj.Y, X,Y, Dist);
    ///Dist:=(DistB+DistE)/Sqrt(sqr(BegPointObj.X-EndPointObj.X)+sqr(BegPointObj.Y-EndPointObj.Y));
    if (Dist < Obj.Width/2) AND (Dist < minDist) OR (Dist*ReflectionWindow.Scale < 10)
     then
      begin
      ptrObjMinDist:=ptrObj;
      ptrBegPointObjMinDist:=ptrBegPointObj;
      minDist_BegPointX:=BegPointObj.X;
      minDist_BegPointY:=BegPointObj.Y;
      minDist_EndPointX:=EndPointObj.X;
      minDist_EndPointY:=EndPointObj.Y;
      minDist:=Dist;
      flFound:=true;
      end;
    except
      end;
    BegPointObj:=EndPointObj;
    ptrBegPointObj:=ptrEndPointObj;
    DistB:=DistE;
  end;
  if Obj.flagLoop
   then
    begin
    EndPointObj:=FirstPointObj;
    DistE:=Sqrt(sqr(X-EndPointObj.X)+sqr(Y-EndPointObj.Y));
    if DistE < maxDistFromPoint
    then
     begin
     ptrObjMinDist:=ptrObj;
     SelectedObj_ptrPoint:=ptrEndPointObj;
     IndicTrueExit:=true;
     Exit;
     end;
    try
    GetDist(BegPointObj.X,BegPointObj.Y,EndPointObj.X,EndPointObj.Y, X,Y, Dist);
    ///Dist:=(DistB+DistE)/Sqrt(sqr(BegPointObj.X-EndPointObj.X)+sqr(BegPointObj.Y-EndPointObj.Y));
    if (Dist < Obj.Width/2) AND (Dist < minDist) OR (Dist*ReflectionWindow.Scale < 10)
     then begin
      ptrObjMinDist:=ptrObj;
      ptrBegPointObjMinDist:=ptrBegPointObj;
      minDist_BegPointX:=BegPointObj.X;
      minDist_BegPointY:=BegPointObj.Y;
      minDist_EndPointX:=EndPointObj.X;
      minDist_EndPointY:=EndPointObj.Y;
      minDist:=Dist;
      flFound:=true;
      end;
    except
      end;
     end;
  end;

var
   Obj: TSpaceObj;
   ptrNewPointObj: TPtr;
   NewPoint: TPoint;

  procedure Process;
  var
    ptrReflLay,ptrItem: pointer;
  begin
  if NOT sbSelectedObjFix.Down
   then with Reflecting do begin
    Lock.Enter;
    try
    ptrReflLay:=Lays;
    while ptrReflLay <> nil do with TLayReflect(ptrReflLay^) do begin
      ptrItem:=Objects;
      while ptrItem <> nil do begin
        if Space.Obj_IsCached(TItemLayReflect(ptrItem^).ptrObject) then ProcessObj(TItemLayReflect(ptrItem^).ptrObject);
        if IndicTrueExit then Exit;
        ptrItem:=TItemLayReflect(ptrItem^).ptrNext;
        end;
      ptrReflLay:=ptrNext;
      end;
    finally
    Lock.Leave;
    end;
    end
   else
    ProcessObj(ptrSelectedObj);
  end;

  function ObjNodeIndex(const ptrObj: TPtr; const ptrNode: TPtr): integer;
  var
    Obj: TSpaceObj;
    ptrPoint: TPtr;
    Point: TPoint;
  begin
  Space.ReadObj(Obj,SizeOf(Obj), ptrObj);
  Result:=0;
  ptrPoint:=Obj.ptrFirstPoint;
  while ptrPoint <> nilPtr do begin
    if ptrPoint = ptrNode then Exit; //. ->
    Space.ReadObj(Point,SizeOf(Point), ptrPoint);
    ptrPoint:=Point.ptrNextObj;
    Inc(Result);
    end;
  end;

  function ObjNodePtr(const ptrObj: TPtr; const NodeIndex: integer): TPtr;
  var
    Obj: TSpaceObj;
    I: integer;
    Point: TPoint;
  begin
  Space.ReadObj(Obj,SizeOf(Obj), ptrObj);
  Result:=nilPtr;
  I:=0;
  Result:=Obj.ptrFirstPoint;
  while Result <> nilPtr do begin
    if I = NodeIndex then Exit; //. ->
    Space.ReadObj(Point,SizeOf(Point), Result);
    Result:=Point.ptrNextObj;
    Inc(I);
    end;
  end;


var
  ptrLastSelectedObj: TPtr;
  Dist: Extended;
  SelectedObj: TSpaceObj;
  NewObjNodeIndex: integer;
begin
Result:=false; 

ptrLastSelectedObj:=ptrSelectedObj;

minDist:=maxDist;
ptrObjAroundAdown:=nilPtr;
ptrObjMinDist:=nilPtr;
flFound:=false;
with ReflectionWindow do maxDistFromPoint:=maxDistFromPointScr/Scale;

Process;

if IndicTrueExit
 then begin
  if (ptrSelectedObj <> ptrObjMinDist)
   then begin
    ptrSelectedObj:=ptrObjMinDist;
    ptrSelectedPointObj:=NilPtr;
    Reflecting.RevisionReflect(ptrLastSelectedObj,actRefresh);
    Reflecting.RevisionReflect(ptrSelectedObj,actRefresh);
    end
   else begin
    ptrSelectedPointObj:=SelectedObj_ptrPoint;
    Reflecting.RevisionReflect(ptrSelectedObj,actRefresh);
    end;
  Result:=true;
  Exit; //. ->
  end;

if NOT flFound
 then begin
  if (ptrSelectedObj <> ptrObjAroundAdown) AND (ptrObjAroundAdown <> nilPtr)
   then begin
    ptrSelectedObj:=ptrObjAroundAdown;
    ptrSelectedPointObj:=NilPtr;
    Reflecting.RevisionReflect(ptrLastSelectedObj,actRefresh);
    Reflecting.RevisionReflect(ptrSelectedObj,actRefresh);
    end
   else begin
    Reflecting.RevisionReflect(ptrSelectedObj,actRefresh);
    end;
  Result:=true;
  Exit; //. ->
  end;

if (ptrSelectedObj <> ptrObjMinDist)
 then begin
  ptrSelectedObj:=ptrObjMinDist;
  ptrSelectedPointObj:=NilPtr;
  Reflecting.RevisionReflect(ptrLastSelectedObj,actRefresh);
  Reflecting.RevisionReflect(ptrSelectedObj,actRefresh);
  Result:=true;
  Exit; //. ->
  end;

if (Mode <> rmEditing) OR cbEditingAdvanced.Checked OR Configuration.flDisableObjectChanging then Exit; //. ->
Space.ReadObj(SelectedObj,SizeOf(SelectedObj), ptrSelectedObj);
//. insert new point to the object
NewObjNodeIndex:=ObjNodeIndex(ptrObjMinDist,ptrBegPointObjMinDist)+1;
with TBase2DVisualizationFunctionality(TComponentFunctionality_Create(Space.Obj_IDType(ptrSelectedObj),Space.Obj_ID(ptrSelectedObj))) do
try
CreateNode(NewObjNodeIndex, X,Y);
finally
Release;
end;
ptrSelectedPointObj:=ObjNodePtr(ptrObjMinDist,NewObjNodeIndex);
TReflecting(Reflecting).RevisionReflect(ptrSelectedObj,actChange);
TReflectorsList(Space.ReflectorsList).RevisionReflect(ptrSelectedObj,actChange, ID);
//.
Result:=true;
end;

function TReflector.ConvertScrCrd2RealCrd(const SX,SY: word; out X,Y: TCrd): boolean;
var
   VS,HS,diffX0X3,diffY0Y3,diffX0X1,diffY0Y1, ofsX,ofsY: Extended;
begin
Result:=false;
with ReflectionWindow do begin
Lock.Enter;
try
if (NOT (((Xmn <= SX) AND (SX <= Xmx)) AND ((Ymn <= SY) AND (SY <= Ymx)))) then Exit; //. ->
VS:=-(SY-Ymn)/(Ymx-Ymn);
HS:=-(SX-Xmn)/(Xmx-Xmn);
//.
diffX0X3:=(X0-X3);diffY0Y3:=(Y0-Y3);
diffX0X1:=(X0-X1);diffY0Y1:=(Y0-Y1);
//.
ofsX:=(diffX0X1)*HS+(diffX0X3)*VS;
ofsY:=(diffY0Y1)*HS+(diffY0Y3)*VS;
//.
X:=(X0+ofsX)/cfTransMeter;
Y:=(Y0+ofsY)/cfTransMeter;
finally
Lock.Leave;
end;
end;
Result:=true;
end;

function TReflector.ConvertScrExtendCrd2RealCrd(const SX,SY: extended; out X,Y: TCrd): boolean;
begin
Result:=ReflectionWindow.ConvertScrExtendCrd2RealCrd(SX,SY,{out} X,Y);
end;

procedure TReflector.DeleteSelectedPointObj;

  function ObjNodeIndex(const ptrObj: TPtr; const ptrNode: TPtr): integer;
  var
    Obj: TSpaceObj;
    ptrPoint: TPtr;
    Point: TPoint;
  begin
  Space.ReadObj(Obj,SizeOf(Obj), ptrObj);
  Result:=0;
  ptrPoint:=Obj.ptrFirstPoint;
  while ptrPoint <> nilPtr do begin
    if ptrPoint = ptrNode then Exit; //. ->
    Space.ReadObj(Point,SizeOf(Point), ptrPoint);
    ptrPoint:=Point.ptrNextObj;
    Inc(Result);
    end;
  end;

var
  Params: WideString;
begin
if (Mode <> rmEditing) OR cbEditingAdvanced.Checked OR Configuration.flDisableObjectChanging then Exit;
if (ptrSelectedObj = nilPtr) OR (ptrSelectedPointObj = nilPtr) then Exit; //. ->
with TBase2DVisualizationFunctionality(TComponentFunctionality_Create(Space.Obj_IDType(ptrSelectedObj),Space.Obj_ID(ptrSelectedObj))) do
try
DestroyNode(ObjNodeIndex(ptrSelectedObj,ptrSelectedPointObj));
ptrSelectedPointObj:=nilPtr;
TReflecting(Reflecting).RevisionReflect(ptrSelectedObj,actChange);
TReflectorsList(Space.ReflectorsList).RevisionReflect(ptrSelectedObj,actChange, ID);
finally
Release;
end;
end;

procedure TReflector.SelectObj(ptrObj: TPtr);
var
  ptrLastSelectedObj: TPtr;
begin
ptrLastSelectedObj:=ptrSelectedObj;
ptrSelectedPointObj:=NilPtr;
ptrSelectedObj:=ptrObj;
if ptrLastSelectedObj <> nilPtr then Reflecting.RevisionReflect(ptrLastSelectedObj,actRefresh);
Reflecting.RevisionReflect(ptrSelectedObj,actReFresh);
end;

procedure TReflector.ShowObjAtCenter(ptrObj: TPtr);
var
  W: TReflectionWindowStrucEx;
  Obj: TSpaceObj;
  Point:TPoint;
  ofsX,ofsY: Extended;
begin
if (PrimMap_Exist AND PrimMap_Fixing) then Raise Exception.Create('function is unable in this mode'); //. =>
if (ptrObj = nilPtr) then Exit; //. ->
//.
Reflecting.CancelRRR(); //. cancel reforming,reflecting,revising
//. save history
ReflectionWindow.GetWindow(true, W);
LastPlaces_Insert(W);
//.
Space.ReadObj(Obj,SizeOf(TSpaceObj), ptrObj);
Space.ReadObj(Point,SizeOf(TPoint), Obj.ptrFirstPoint);
//.
ShiftingSetReflection(Point.X,Point.Y);
//. selecting
ptrSelectedPointObj:=NilPtr;
ptrSelectedObj:=ptrObj;
end;

procedure TReflector.SelectedObjDblClick;
var
  SC: TCursor;
  idTROOT,idROOT: integer;
begin
if (OverObjectPtr = nilPtr) then Exit; //. ->
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
if (NOT GetObjAsOwnerComponent(OverObjectPtr, idTROOT,idROOT))
 then Space.Obj_GetRoot(Space.Obj_IDType(OverObjectPtr),Space.Obj_ID(OverObjectPtr), idTROOT,idROOT);
if (idROOT <> 0)
 then with TBaseVisualizationFunctionality(TComponentFunctionality_Create(idTROOT,idROOT)) do
  try
  DoOnDblClick;
  finally
  Release;
  end;
finally
Screen.Cursor:=SC;
end;
end;

procedure TReflector.OverObjDblClick;
var
  SC: TCursor;
  idTROOT,idROOT: integer;
begin
if (OverObjectPtr = nilPtr) then Exit; //. ->
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
if (NOT GetObjAsOwnerComponent(OverObjectPtr, idTROOT,idROOT))
 then Space.Obj_GetRoot(Space.Obj_IDType(OverObjectPtr),Space.Obj_ID(OverObjectPtr), idTROOT,idROOT);
if (idROOT <> 0)
 then with TBaseVisualizationFunctionality(TComponentFunctionality_Create(idTROOT,idROOT)) do
  try
  DoOnDblClick;
  finally
  Release;
  end;
finally
Screen.Cursor:=SC;
end;
end;

procedure TReflector.Loaded;
begin
Inherited Loaded;
end;

procedure TReflector.FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);

  procedure MouseScalingHints_ShowAt(const X,Y: integer);
  const
    HintColor = clRed;
    Size = 8;
  var
    Rect: TRect;
  begin
  Rect.Left:=BeginZoneChangeScaleView.Left;
  Rect.Right:=BeginZoneRotateView.Left;
  Rect.Top:=Y-(Size DIV 2);
  Rect.Bottom:=Y+(Size DIV 2);
  Canvas.Pen.Width:=1;
  Canvas.Pen.Color:=HintColor;
  Canvas.Brush.Color:=HintColor;
  Canvas.Rectangle(Rect);
  end;

  procedure MouseRotatingHints_ShowAt(const X,Y: integer);
  const
    HintColor = clRed;
    Size = 8;
  var
    Xc,Yc: integer;
    X0,Y0,X1,Y1: integer;
    Points: array[0..3] of Windows.TPoint;
  begin
  X0:=BeginZoneRotateView.Left;
  X1:=Width;
  Xc:=(Width DIV 2);
  Yc:=(Height DIV 2);
  Y0:=Trunc(Yc+(X0-Xc)*((Y-Yc)/(X-Xc)));
  Y1:=Trunc(Yc+(X1-Xc)*((Y-Yc)/(X-Xc)));
  Points[0].X:=X0; Points[0].Y:=Y0+(Size DIV 2);
  Points[1].X:=X0; Points[1].Y:=Y0-(Size DIV 2);
  Points[2].X:=X1; Points[2].Y:=Y1-(Size DIV 2);
  Points[3].X:=X1; Points[3].Y:=Y1+(Size DIV 2);
  Canvas.Pen.Width:=1;
  Canvas.Pen.Color:=HintColor;
  Canvas.Brush.Color:=HintColor;
  Canvas.Polygon(Points);
  end;

const
  SelectedRegionMinSize = 20;
var
  dY: extended;
  RX,RY: TCrd;
  Lat,Long: Extended;
  ptrDynaHintItem,ptrUserDynaHintItem: pointer;
  flMouseOverReferencedDynaHint: boolean;
  InplaceHintShiftX,InplaceHintShiftY: integer;
begin
if (((Y-FYMsLast) = 0) AND ((X-FXMsLast) = 0)) then Exit; //. ->
try
flMouseMoving:=true;
case Style of
rsNative: begin
  if (FflagMsChangeScaleView)
   then begin
    dY:=(FYMsLast-Y);
    if (Abs(dY) > 25) then dY:=25*dY/Abs(dY);
    ChangeScaleReflection(dY*KfChgScale);
    //. draw marker
    MouseScalingHints_ShowAt(X,Y);
    //.
    Cursor:=crSizeNS;
    //.
    Exit; //. ->
    end
   else
    if (FflagMsRotateView)
     then begin
      RotateReflection((Pi/180)*(0.5*(FYMsLast-Y)+0.111));
      //. draw marker
      MouseRotatingHints_ShowAt(X,Y);
      //.
      Cursor:=crSizeNS;
      //.
      Exit; //. ->
      end
     else
      if (FflagMsMoveView)
       then begin
        PixShiftReflection(Y-FYMsLast,X-FXMsLast);
        //.
        Cursor:=crHandPoint;
        //.
        Exit; //. ->
        end;
  //.
  DynamicHints.Lock.Enter;
  try
  flMouseOverReferencedDynaHint:=(DynamicHints.flEnabled AND ((DynamicHints.GetItemAtPoint(Point(X,Y), ptrDynaHintItem) AND (TDynamicHint(ptrDynaHintItem^).InfoComponent.idObj <> 0)) OR (DynamicHints.UserDynamicHints.GetItemAtPoint(Point(X,Y), ptrDynaHintItem))));
  if (flMouseOverReferencedDynaHint)
   then begin
    if (ptrDynaHintItem <> nil) then OverObjectPtr:=TDynamicHint(ptrDynaHintItem^).ptrObj;
    if (ptrUserDynaHintItem <> nil) then OverObjectPtr:=TUserDynamicHint(ptrUserDynaHintItem^).ptrObj;
    end;
  finally
  DynamicHints.Lock.Leave;
  end;
  if (flMouseOverReferencedDynaHint)
   then begin
    if (NOT flLeftButtonDown)
     then begin
      ObjectHighlighting.Clear();
      //.
      Cursor:=crHandPoint;
      //.
      Exit; //. ->
      end;
    end
   else begin
    Cursor:=crDefault;
    if (NOT flLeftButtonDown)
     then begin
      if ((Mode = rmBrowsing) AND (SelectedRegion = nil)) then DoOnMouseOver(X,Y);
      end;
    end;
  //.
  if (ObjectEditor <> nil)
   then begin
      case ObjectEditor.CheckEditingMode(X,Y) of
      emMoving: Cursor:=crDrag;
      emWidthScaling: Cursor:=crSizeAll;
      else ;
      end;
      if (NOT flProcessingOnClick AND ObjectEditor.IsEditing) then ObjectEditor.ProcessEditingPoint(X,Y);
      end;
  //.
  if (EditingOrCreatingObject <> nil) 
   then begin
    case EditingOrCreatingObject.Handles.CheckEditingMode(X,Y) of
    emMoving: Cursor:=crDrag;
    emScaling: Cursor:=crSizeAll;
    emRotating: Cursor:=crSizeNS;
    else ;
    end;
    if (NOT flProcessingOnClick AND EditingOrCreatingObject.IsEditing) then EditingOrCreatingObject.ProcessEditingPoint(X,Y);
    end;
  if (flLeftButtonDown AND NOT flProcessingOnClick)
   then
    if ((SelectedRegion = nil) AND ((Abs(X-LeftButtonDownPos.X) >= SelectedRegionMinSize) OR (Abs(Y-LeftButtonDownPos.Y) >= SelectedRegionMinSize)) AND (ptrSelectedPointObj = nilPtr))
     then begin
      ObjectHighlighting.Clear;
      //.
      SelectedRegion.Free;
      SelectedRegion:=TSelectedRegion.Create(Self);
      SelectedRegion.SetBegin(LeftButtonDownPos.X,LeftButtonDownPos.Y);
      end
     else
      if (SelectedRegion <> nil) then SelectedRegion.SetEnd(X,Y);
  end;
rsSpaceViewing: begin
  if (FflagMsChangeScaleView)
   then begin
    dY:=(FYMsLast-Y);
    if (Abs(dY) > 25) then dY:=25*dY/Abs(dY);
    ChangeScaleReflection(dY*KfChgScale);
    //. draw marker
    MouseScalingHints_ShowAt(X,Y);
    //.
    Cursor:=crSizeNS;
    //.
    Exit; //. ->
    end
   else
    if (FflagMsRotateView)
     then begin
      RotateReflection((Pi/180)*(0.5*(FYMsLast-Y)+0.111));
      //. draw marker
      MouseRotatingHints_ShowAt(X,Y);
      //.
      Cursor:=crSizeNS;
      //.
      Exit; //. ->
      end
     else
      if (FflagMsMoveView)
       then begin
        PixShiftReflection(Y-FYMsLast,X-FXMsLast);
        //.
        Cursor:=crHandPoint;
        //.
        Exit; //. ->
        end;
  //.
  DynamicHints.Lock.Enter;
  try
  ptrDynaHintItem:=nil;
  ptrUserDynaHintItem:=nil;
  flMouseOverReferencedDynaHint:=(DynamicHints.flEnabled AND ((DynamicHints.GetItemAtPoint(Point(X,Y), ptrDynaHintItem) AND (TDynamicHint(ptrDynaHintItem^).InfoComponent.idObj <> 0)) OR (DynamicHints.UserDynamicHints.GetItemAtPoint(Point(X,Y), ptrUserDynaHintItem))));
  if (flMouseOverReferencedDynaHint)
   then begin
    if (ptrDynaHintItem <> nil) then OverObjectPtr:=TDynamicHint(ptrDynaHintItem^).ptrObj;
    if (ptrUserDynaHintItem <> nil) then OverObjectPtr:=TUserDynamicHint(ptrUserDynaHintItem^).ptrObj;
    end;
  finally
  DynamicHints.Lock.Leave;
  end;
  if (flMouseOverReferencedDynaHint)
   then begin
    ObjectHighlighting.Clear();
    //.
    Cursor:=crHandPoint;
    end
   else begin
    Cursor:=crDefault;
    //.
    if ((Mode = rmBrowsing) AND (SelectedRegion = nil))
     then begin
      DoOnMouseOver(X,Y);
      end;
    end;
  //.
  if ((NOT flMouseOverReferencedDynaHint) AND (EditingOrCreatingObject <> nil))
   then begin
    case EditingOrCreatingObject.Handles.CheckEditingMode(X,Y) of
    emMoving: Cursor:=crDrag;
    emScaling: Cursor:=crSizeAll;
    emRotating: Cursor:=crSizeNS;
    else ;
    end;
    if (NOT flProcessingOnClick AND EditingOrCreatingObject.IsEditing)
     then begin
      EditingOrCreatingObject.ProcessEditingPoint(X,Y);
      //.
      Exit; //. ->
      end;
    end;
  //.
  if ((NOT flMouseOverReferencedDynaHint) AND (XYToGeoCrdConverter <> nil))
   then begin
    if (TfmXYToGeoCrdConvertor(XYToGeoCrdConverter).GeoObjectTracks.SelectTrackStopOrMovementInterval(X,Y))
     then begin
      PaintReflectionWindow();
      //.
      if (InplaceHint <> nil) then InplaceHint.CancelAndHide();
      if (TfmXYToGeoCrdConvertor(XYToGeoCrdConverter).GeoObjectTracks.IsSelectedTrackNodeHinting) then TfmXYToGeoCrdConvertor(XYToGeoCrdConverter).GeoObjectTracks.ClearSelectedTrackNodeHint();
      //.
      TfmXYToGeoCrdConvertor(XYToGeoCrdConverter).GeoObjectTracks.StartSelectedTrackStopOrMovementIntervalHint(X,Y);
      end else
    if ((NOT TfmXYToGeoCrdConvertor(XYToGeoCrdConverter).GeoObjectTracks.IsSelectedTrackStopOrMovementInterval()) AND TfmXYToGeoCrdConvertor(XYToGeoCrdConverter).GeoObjectTracks.SelectTrackNode(X,Y))
     then begin
      PaintReflectionWindow();
      //.
      if (InplaceHint <> nil) then InplaceHint.CancelAndHide();
      if (TfmXYToGeoCrdConvertor(XYToGeoCrdConverter).GeoObjectTracks.IsSelectedTrackStopOrMovementIntervalHinting) then TfmXYToGeoCrdConvertor(XYToGeoCrdConverter).GeoObjectTracks.ClearSelectedTrackStopOrMovementIntervalHint();
      //.
      TfmXYToGeoCrdConvertor(XYToGeoCrdConverter).GeoObjectTracks.StartSelectedTrackNodeHint(X,Y);
      end;
    //.
    if (TfmXYToGeoCrdConvertor(XYToGeoCrdConverter).GeoObjectTracks.IsSelectedTrackNodeHinting()) then Exit; //. ->
    if (TfmXYToGeoCrdConvertor(XYToGeoCrdConverter).GeoObjectTracks.IsSelectedTrackStopOrMovementIntervalHinting()) then Exit; //. ->
    end;
  //. inplace hint
  if ((InplaceHint = nil) OR (InplaceHint.ObjPtr <> OverObjectPtr) OR InplaceHint.Terminated)
   then begin
    if (InplaceHint <> nil) then InplaceHint.CancelAndHide();
    if ((OverObjectPtr <> nilPtr) AND (OverObjectPtr <> InplaceHint_ObjPtr))
     then begin
      InplaceHintShiftX:=-2; ///? GetSystemMetrics(SM_CXCURSOR);
      InplaceHintShiftY:=-2; ///? GetSystemMetrics(SM_CYCURSOR);
      //.
      InplaceHint_ObjPtr:=OverObjectPtr;
      InplaceHint:=TInplaceHint.Create(Self, InplaceHint_ObjPtr, X+InplaceHintShiftX,Y+InplaceHintShiftY);
      end;
    end
   else begin
    InplaceHintShiftX:=-2; ///? GetSystemMetrics(SM_CXCURSOR);
    InplaceHintShiftY:=-2; ///? GetSystemMetrics(SM_CYCURSOR);
    //.
    if (NOT InplaceHint.IsHintPanelExist())
     then begin
      InplaceHint.RestartDelaying();
      //.
      InplaceHint.SetObjPosition(X+InplaceHintShiftX,Y+InplaceHintShiftY);
      end;
    end;
  end;
end;
finally
FXMsLast:=X;
FYMsLast:=Y;
end;
end;

procedure TReflector.FormMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  ptrOldSelectedPoint: TPtr;
  M: TEditingMode;
  Xbind,Ybind: TCrd;
  flNavigating: boolean;
begin
try
ReleaseCapture();
//.
case Style of
rsNative: begin
  flLeftButtonDown:=false;
  if (Button = mbLeft)
   then begin
    if (ObjectEditor <> nil)
     then begin
      if (ObjectEditor.EditingMode <> emNone) then ObjectEditor.StopEditing;
      M:=ObjectEditor.CheckEditingMode(X,Y);
      if (M <> emNone)
       then begin
        ObjectEditor.SetEditingMode(X,Y);
        Exit; //. ->
        end;
      end;
    if EditingOrCreatingObject <> nil
     then begin
      if EditingOrCreatingObject.Mode <> emNone then EditingOrCreatingObject.StopEditing;
      M:=EditingOrCreatingObject.Handles.CheckEditingMode(X,Y);
      if M <> emNone
       then begin
        EditingOrCreatingObject.SetEditingMode(X,Y);
        Exit; //. ->
        end;
      end;
    if (Mode <> rmEditing) OR Configuration.flDisableObjectChanging then ptrSelectedPointObj:=NilPtr;
    //.
    LeftButtonDownPos.X:=X;
    LeftButtonDownPos.Y:=Y;
    flLeftButtonDown:=true;
    end
   else begin
    if NOT Configuration.flDisableNavigate
     then
      if (X >= BeginZoneRotateView.Left)
       then
        begin
        FflagMsRotateView:=true;
        Cursor:=crSizeNS;
        end
       else
        if X >= BeginZoneChangeScaleView.Left
         then
          begin
          FflagMsChangeScaleView:=true;
          Cursor:=crSizeNS;
          end
         else
          if NOT Configuration.flDisableMoveNavigate
           then begin
            FflagMsMoveView:=true;
            Cursor:=crHandPoint;
            end;
    //.
    if (ptrSelectedPointObj <> nilPtr)
     then begin //. clear selected point
      ptrSelectedPointObj:=nilPtr;
      Reflecting.RevisionReflect(ptrSelectedObj,actRefresh);
      end;
    //.
    ObjectHighlighting.RestoreObject();
    FreeAndNil(SelectedRegion);
    end;
  end;
rsSpaceViewing: begin
  flNavigating:=true;
  if ((EditingOrCreatingObject <> nil) AND (Button = mbLeft))
   then begin
    if EditingOrCreatingObject.Mode <> emNone then EditingOrCreatingObject.StopEditing;
    M:=EditingOrCreatingObject.Handles.CheckEditingMode(X,Y);
    if (M <> emNone)
     then begin
      EditingOrCreatingObject.SetEditingMode(X,Y);
      flNavigating:=false;
      end;
    end;
   if (flNavigating)
    then begin
    if NOT Configuration.flDisableNavigate
     then
      if (X >= BeginZoneRotateView.Left)
       then
        begin
        Cursor:=crSizeNS;
        FflagMsRotateView:=true;
        end
       else
        if X >= BeginZoneChangeScaleView.Left
         then
          begin
          Cursor:=crSizeNS;
          FflagMsChangeScaleView:=true;
          end
         else
          if NOT Configuration.flDisableMoveNavigate
           then begin
            Cursor:=crHandPoint;
            FflagMsMoveView:=true;
            end;
    //.
    if (ptrSelectedPointObj <> nilPtr)
     then begin //. clear selected point
      ptrSelectedPointObj:=nilPtr;
      Reflecting.RevisionReflect(ptrSelectedObj,actRefresh);
      end;
    //.
    ObjectHighlighting.RestoreObject();
    FreeAndNil(SelectedRegion);
    //.
    if (Button = mbLeft)
     then begin
      LeftButtonDownPos.X:=X;
      LeftButtonDownPos.Y:=Y;
      flLeftButtonDown:=true;
      end;
    end;
  //.
  if (InplaceHint <> nil) then InplaceHint.CancelAndHide();
  if ((XYToGeoCrdConverter <> nil) AND TfmXYToGeoCrdConvertor(XYToGeoCrdConverter).GeoObjectTracks.IsSelectedTrackNodeHinting()) then TfmXYToGeoCrdConvertor(XYToGeoCrdConverter).GeoObjectTracks.ClearSelectedTrackNodeHint();
  if ((XYToGeoCrdConverter <> nil) AND TfmXYToGeoCrdConvertor(XYToGeoCrdConverter).GeoObjectTracks.IsSelectedTrackStopOrMovementIntervalHinting()) then TfmXYToGeoCrdConvertor(XYToGeoCrdConverter).GeoObjectTracks.ClearSelectedTrackStopOrMovementIntervalHint();
  end;
end;
finally
FXMsLast:=X;
FYMsLast:=Y;
MouseShiftState:=Shift;
flMouseMoving:=false;
end;
end;

procedure TReflector.FormMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

  function GetObjectUnderMouse(const X,Y: integer; out ptrObj: TPtr): boolean;
  var
    ActualityInterval: TComponentActualityInterval;
    P: TScreenNode;
    ptrReflLay: pointer;
    ptrItem: pointer;
    Obj: TSpaceObj;
  begin
  Result:=false;
  ActualityInterval:=ReflectionWindow.GetActualityInterval();
  P.X:=X; P.Y:=Y;
  Reflecting.Lock.Enter;
  try
  ptrReflLay:=Reflecting.Lays;
  while (ptrReflLay <> nil) do with TLayReflect(ptrReflLay^) do begin
    ptrItem:=Objects;
    while (ptrItem <> nil) do begin
      with TItemLayReflect(ptrItem^) do begin
      Space.ReadObjLocalStorage(Obj,SizeOf(Obj),ptrObject);
      if (Space.Obj_IsCached(Obj) AND Space.Obj_ActualityInterval_IsActualForTimeInterval(Obj,ActualityInterval) AND ((Obj.idTObj <> idTHINTVisualization) OR ((Mode = rmEditing) OR (NOT DynamicHints.flEnabled) OR ((EditingOrCreatingObject <> nil) AND (EditingOrCreatingObject.PrototypePtr = ptrObj)))))
       then begin
        Reflecting.Obj_PrepareFigures(ptrObject, ReflectionWindow,Reflecting.WindowRefl, Reflecting.FigureWinRefl,Reflecting.AdditiveFigureWinRefl);
        if (Reflecting.FigureWinRefl.flagLoop AND Reflecting.FigureWinRefl.flagFill AND (Reflecting.FigureWinRefl.CountScreenNodes > 2) AND Reflecting.FigureWinRefl.PointIsInside(P))
         then begin
          ptrObj:=ptrObject;
          Result:=true;
          end
         else
          if (Reflecting.AdditiveFigureWinRefl.CountScreenNodes > 0) AND Reflecting.AdditiveFigureWinRefl.PointIsInside(P)
           then begin
            ptrObj:=ptrObject;
            Result:=true;
            end;
        end;
      end;
      //. go to next item
      ptrItem:=TItemLayReflect(ptrItem^).ptrNext;
      end;
    ptrReflLay:=ptrNext;
    end;
  finally
  Reflecting.Lock.Leave;
  end;
  end;

  procedure ShowOwnerPanelProps(const idTOwner,idOwner: integer);
  begin
  with TComponentFunctionality_Create(idTOwner,idOwner) do
  try
  try PanelProps.Free; except end;
  PanelProps:=TPanelProps_Create(false, 0,nil,nilObject);
  with TAbstractSpaceObjPanelProps(PanelProps) do begin
  flFreeOnClose:=false;
  Left:=Round((Screen.Width-Width)/2);
  Top:=Screen.Height-Height-20;
  OnKeyDown:=Self.OnKeyDown;
  OnKeyUp:=Self.OnKeyUp;
  Show;
  end;
  lbSelectedObjName.Caption:=Name;
  finally
  Release;
  end;
  end;

var
  SC: TCursor;
  RX,RY: TCrd;
  NewSelectedObjectPtr: TPtr;
  ptrOldSelectedPoint: TPtr;
  idTROOT,idROOT: integer;
  ptrROOT: TPtr;
  CoComponentPanelProps: TForm;
  M: TEditingMode;
  Xbind,Ybind: TCrd;
  W: TReflectionWindowStrucEx;
begin           
try
case Style of
rsNative: begin
  SC:=Screen.Cursor;
  try
  Screen.Cursor:=crHourGlass;
  //.
  if (FflagMsChangeScaleView)
   then
    FflagMsChangeScaleView:=false
   else
    if (FflagMsRotateView)
     then
      FflagMsRotateView:=false
     else
      if (FflagMsMoveView) then FflagMsMoveView:=false;
  if (Button = mbLeft)
   then begin
    if (EditingOrCreatingObject <> nil) then EditingOrCreatingObject.StopEditing;
    if (ObjectEditor <> nil) then ObjectEditor.StopEditing;
    end;
  if (flLeftButtonDown)
   then
    try
    if (SelectedRegion <> nil)
     then begin
      SelectedRegion.SetReflectorWindow;
      SelectedRegion.Destroy;
      SelectedRegion:=nil;
      //. save history
      ReflectionWindow.GetWindow(true, W);
      LastPlaces_Insert(W);
      end
     else begin
      if (NOT flMouseMoving)
       then begin
        ConvertScrCrd2RealCrd(X,Y,RX,RY);
        PanelPropsNeeded:=false;
        if (Mode = rmBrowsing)
         then begin
          if (GetObjectUnderMouse(X,Y, NewSelectedObjectPtr))
           then begin
            ptrSelectedObj:=NewSelectedObjectPtr;
            ptrSelectedPointObj:=nilPtr;
            PanelPropsNeeded:=true;
            end
           else ptrSelectedObj:=nilPtr;
          end
         else 
          if (ptrSelectedObj <> nilPtr)
           then
            if ptrSelectedPointObj = nilPtr
             then begin
              ptrOldSelectedPoint:=ptrSelectedPointObj;
              SelectPointObject(RX,RY);
              //.
              //. no panel in editing mode if ptrSelectedPointObj = ptrOldSelectedPoint then PanelPropsNeeded:=true;
              end
             else begin
              MoveSelectedPoint(RX,RY);
              end
           else begin
            SelectPointObject(RX,RY);
            //. no panel in editing mode PanelPropsNeeded:=true;
            end;
        //.
        if (PanelPropsNeeded AND (NOT OverObj_flDblClick) AND NOT ((EditingOrCreatingObject <> nil) AND (EditingOrCreatingObject.Mode <> emNone)))
         then begin
          with TBaseVisualizationFunctionality(TComponentFunctionality_Create(Space.Obj_IDType(ptrSelectedObj),Space.Obj_ID(ptrSelectedObj))) do
          try
          GetOwnerByVisualization(idTROOT,idROOT,ptrROOT);
          finally
          Release;
          end;
          //. activate pulsed selection
          PulsedSelection.Activate(ptrROOT);
          //. 
          with TComponentFunctionality_Create(idTROOT,idROOT) do
          try
          if (idTObj <> idTCoComponent)
           then
            ShowOwnerPanelProps(idTObj,idObj)
           else begin
            CoComponentPanelProps:=nil;
            {$IFDEF ExternalTypes}
            Space.Log.OperationStarting('loading ..........');
            try
            try
            CoComponentPanelProps:=Space.Plugins___CoComponent__TPanelProps_Create(Functionality.CoComponentFunctionality_idCoType(idObj),idObj);
            except
              FreeAndNil(CoComponentPanelProps);
              end;
            finally
            Space.Log.OperationDone;
            end;
            {$ELSE}
            Space.Log.OperationStarting('loading ..........');
            try
            try
            CoComponentPanelProps:=Space.Plugins___CoComponent__TPanelProps_Create(TypesFunctionality.CoComponentFunctionality_idCoType(idObj),idObj);
            except
              FreeAndNil(CoComponentPanelProps);
              end;
            finally
            Space.Log.OperationDone;
            end;
            {$ENDIF}
            if (CoComponentPanelProps <> nil)
             then with CoComponentPanelProps do begin
              Left:=Round((Screen.Width-Width)/2);
              Top:=Screen.Height-Height-20;
              OnKeyDown:=Self.OnKeyDown;
              OnKeyUp:=Self.OnKeyUp;
              Show;
              end
             else begin
              /// -? Application.MessageBox(PChar('there is no plugin for this CoComponent (ID = '+IntToStr(idObj)+')'),'Warning');
              ShowOwnerPanelProps(idTObj,idObj);
              end;
            end;
          finally
          Release;
          end;
          end;
        //.
        if (Mode = rmEditing)
         then
          if (cbEditingAdvanced.Checked)
           then begin
            EditingOrCreatingObject.Free;
            EditingOrCreatingObject:=TEditingOrCreatingObject.Create(Self,false, 0,0,ptrSelectedObj);
            EditingOrCreatingObject.Obj_GetBindPoint(ptrSelectedObj, Xbind,Ybind);
            EditingOrCreatingObject.SetPosition(Xbind,Ybind);
            RevisionReflect(ptrSelectedObj,actRefresh);
            end
           else begin
            ObjectEditor.Free();
            ObjectEditor:=TObjectEditor.Create(Self,ptrSelectedObj);
            RevisionReflect(ptrSelectedObj,actRefresh);
            end;
        end;
      end;
    finally
    flLeftButtonDown:=false;
    end;
  finally
  Screen.Cursor:=SC;
  end;
  end;
rsSpaceViewing: begin
  if (FflagMsChangeScaleView)
   then
    FflagMsChangeScaleView:=false
   else
    if (FflagMsRotateView)
     then
      FflagMsRotateView:=false
     else
      if (FflagMsMoveView) then FflagMsMoveView:=false;
  if (Button = mbLeft)
   then begin
    if (EditingOrCreatingObject <> nil) then EditingOrCreatingObject.StopEditing;
    if (ObjectEditor <> nil) then ObjectEditor.StopEditing();
    end;
  if (flLeftButtonDown)
   then
    try
      if (NOT flMouseMoving)
       then begin
        ConvertScrCrd2RealCrd(X,Y,RX,RY);
        PanelPropsNeeded:=false;
        if (Mode = rmBrowsing)
         then begin
          if (GetObjectUnderMouse(X,Y, NewSelectedObjectPtr))
           then begin
            ptrSelectedObj:=NewSelectedObjectPtr;
            ptrSelectedPointObj:=nilPtr;
            PanelPropsNeeded:=true;
            end
           else ptrSelectedObj:=nilPtr;
          end;
        //.
        if (PanelPropsNeeded AND (NOT OverObj_flDblClick) AND NOT ((EditingOrCreatingObject <> nil) AND (EditingOrCreatingObject.Mode <> emNone)))
         then begin
          with TBaseVisualizationFunctionality(TComponentFunctionality_Create(Space.Obj_IDType(ptrSelectedObj),Space.Obj_ID(ptrSelectedObj))) do
          try
          GetOwnerByVisualization(idTROOT,idROOT,ptrROOT);
          finally
          Release;
          end;
          //. activate pulsed selection
          PulsedSelection.Activate(ptrROOT);
          //.
          with TComponentFunctionality_Create(idTROOT,idROOT) do
          try
          if (idTObj <> idTCoComponent)
           then
            ShowOwnerPanelProps(idTObj,idObj)
           else begin
            CoComponentPanelProps:=nil;
            {$IFDEF ExternalTypes}
            Space.Log.OperationStarting('loading ..........');
            try
            try
            CoComponentPanelProps:=Space.Plugins___CoComponent__TPanelProps_Create(Functionality.CoComponentFunctionality_idCoType(idObj),idObj);
            except
              FreeAndNil(CoComponentPanelProps);
              end;
            finally
            Space.Log.OperationDone();
            end;
            {$ELSE}
            Space.Log.OperationStarting('loading ..........');
            try
            try
            CoComponentPanelProps:=Space.Plugins___CoComponent__TPanelProps_Create(TypesFunctionality.CoComponentFunctionality_idCoType(idObj),idObj);
            except
              FreeAndNil(CoComponentPanelProps);
              end;
            finally
            Space.Log.OperationDone;
            end;
            {$ENDIF}
            if (CoComponentPanelProps <> nil)
             then with CoComponentPanelProps do begin
              Left:=Round((Screen.Width-Width)/2);
              Top:=Screen.Height-Height-20;
              OnKeyDown:=Self.OnKeyDown;
              OnKeyUp:=Self.OnKeyUp;
              Show;
              end
             else begin
              /// -? Application.MessageBox(PChar('there is no plugin for this CoComponent (ID = '+IntToStr(idObj)+')'),'Warning');
              ShowOwnerPanelProps(idTObj,idObj);
              end;
          end;
        finally
        Release();
        end;
        end;
        //.
        if (Mode = rmEditing)
         then
          if (cbEditingAdvanced.Checked)
           then begin
            EditingOrCreatingObject.Free;
            EditingOrCreatingObject:=TEditingOrCreatingObject.Create(Self,false, 0,0,ptrSelectedObj);
            EditingOrCreatingObject.Obj_GetBindPoint(ptrSelectedObj, Xbind,Ybind);
            EditingOrCreatingObject.SetPosition(Xbind,Ybind);
            RevisionReflect(ptrSelectedObj,actRefresh);
            end
           else begin
            ObjectEditor.Free();
            ObjectEditor:=TObjectEditor.Create(Self,ptrSelectedObj);
            RevisionReflect(ptrSelectedObj,actRefresh);
            end;
      end;
    finally
    flLeftButtonDown:=false;
    end;
  if (InplaceHint <> nil) then InplaceHint.CancelAndHide();
  end;
end;
finally
FXMsLast:=X;
FYMsLast:=Y;
MouseShiftState:=Shift;
flMouseMoving:=false;
end;
end;

procedure TReflector.FormMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
var
  dY: Extended;
begin
dY:=WheelDelta;
if Abs(dY) > 25 then dY:=25*dY/Abs(dY);
ChangeScaleReflection(dY*KfChgScale);
Handled:=true;
end;

procedure TReflector.wmCM_MOUSELEAVE(var Message: TMessage);
begin
FflagMsMoveView:=false;
FflagMsChangeScaleView:=false;
FflagMsRotateView:=false;
//.
if (flLeftButtonDown)
 then begin
  if (SelectedRegion <> nil)
   then begin
    SelectedRegion.Destroy;
    SelectedRegion:=nil;
    end;
  flLeftButtonDown:=false;
  end;
//.
ObjectHighlighting.RestoreObject();
//.
Cursor:=crDefault; 
end;

procedure TReflector.wmLimitedReflect(var Message: TMessage);
begin
try with Reflecting do ReflectLimitedByTime(-1); except end;
end;

function TReflector.BeginCreateObject(const idTPrototype,idPrototype: integer; const NewLayID: integer; const pflDisableScaling: boolean = false; const pflDisableRotating: boolean = false): TEditingOrCreatingObject;
var
  VCL: TComponentsList;
  RX,RY: TCrd;
begin
Result:=nil;
with TComponentFunctionality_Create(idTPrototype,idPrototype) do
try
QueryComponents(TBase2DVisualizationFunctionality, VCL);
try
if (VCL <> nil) AND (VCL.Count > 0)
 then with TBase2DVisualizationFunctionality(TComponentFunctionality_Create(TItemComponentsList(VCL[0]^).idTComponent,TItemComponentsList(VCL[0]^).idComponent)) do
  try
  EditingOrCreatingObject.Free;
  EditingOrCreatingObject:=TEditingOrCreatingObject.Create(TReflector(Reflector),true, idTPrototype,idPrototype,Ptr,pflDisableScaling,pflDisableRotating);
  EditingOrCreatingObject.CreateCompletionObject:=GetCreateCompletionObject(idTPrototype,idPrototype);
  Result:=EditingOrCreatingObject;
  //. setup new object for editing
  ReflectionWindow.Lock.Enter;
  try
  ConvertScrExtendCrd2RealCrd(ReflectionWindow.Xmd,ReflectionWindow.Ymd, RX,RY);
  finally
  ReflectionWindow.Lock.Leave;
  end;
  //.
  EditingOrCreatingObject.SetPosition(RX,RY);
  //.
  finally
  Release;
  end;
finally
VCL.Free;
end;
finally
Release;
end;
end;

procedure TReflector.wmBeginCreateObject(var Message: TMessage);
begin
BeginCreateObject(Message.WParam,Message.LParam,0);
end;

procedure TReflector.wmDeleteSputnik(var Message: TMessage);
begin
FreeAndNil(EditingOrCreatingObject);
end;

procedure TReflector.wmDeleteObjectEditor(var Message: TMessage);
begin
FreeAndNil(ObjectEditor);
end;

procedure TReflector.wmDeleteSelection(var Message: TMessage);
begin
ptrSelectedObj:=nilPtr;
end;

procedure TReflector.wmReforming_ShowProgressBar(var Message: TMessage);
begin
with gaugeReflectingProgress do begin
Progress:=0;
Show;
end;
lbReflectionStatus.Hide;
end;

procedure TReflector.wmReforming_HideProgressBar(var Message: TMessage);
begin
gaugeReflectingProgress.Hide;
if (NOT Space.flOffline)
 then pnlReflectingStatus.Color:=clBtnFace
 else pnlReflectingStatus.Color:=clYellow;
end;

procedure TReflector.wmReforming_UpdateProgressBar(var Message: TMessage);
begin
gaugeReflectingProgress.Progress:=Message.WParam;
end;

procedure TReflector.FormClick(Sender: TObject);
const
  WaitForDblClickCount = 7;

  procedure ShowPropsPanel(const idTObj,idObj: integer);
  begin
  with TComponentFunctionality_Create(idTObj,idObj) do
  try
  with TPanelProps_Create(false, 0,nil,nilObject) do begin
  Left:=Round((Screen.Width-Width)/2);
  Top:=Screen.Height-Height-20;
  OnKeyDown:=Self.OnKeyDown;
  OnKeyUp:=Self.OnKeyUp;
  Show;
  end;
  finally
  Release;
  end;
  end;

var
  SC: TCursor;
  I: integer;
  ptrDynaHintItem,ptrUserDynaHintItem: pointer;
  flUseDynamicHint: boolean;
  idTComponent,idComponent: integer;
  ptrComponent: TPtr;
  CoComponentPanelProps: TForm;
  ptrSelectedTrack,ptrSelectedTrackNode,ptrSelectedTrackStopOrMovementInterval: pointer;
  TimeInterval: TTimeInterval;
begin
case Style of
rsNative,rsSpaceViewing: begin
  if (flMouseMoving) then Exit; //. ->
  if (flProcessingOnClick) then Exit; //. ->
  try
  flProcessingOnClick:=true;
  try
  if (Style in [rsNative])
   then begin
    OverObj_flDblClick:=false;
    if (EditingOrCreatingObject = nil)
     then
      for I:=0 to WaitForDblClickCount-1 do begin
        Application.ProcessMessages;
        if (OverObj_flDblClick OR (SelectedRegion <> nil){ OR (ptrSelectedObj = nilPtr)}) then Exit; //. ->
        Sleep(30);
        end;
     end;
  SC:=Screen.Cursor;
  try
  Screen.Cursor:=crHourGlass;
  //.
  ptrUserDynaHintItem:=nil;
  ptrDynaHintItem:=nil;
  DynamicHints.Lock.Enter;
  try
  flUseDynamicHint:=(NOT (((EditingOrCreatingObject <> nil) AND (EditingOrCreatingObject.Mode <> emNone)) OR ((ObjectEditor <> nil) AND (ObjectEditor.EditingMode <> emNone))) AND DynamicHints.flEnabled AND ((DynamicHints.UserDynamicHints.GetItemAtPoint(Point(FXMsLast,FYMsLast), ptrUserDynaHintItem)) OR DynamicHints.GetItemAtPoint(Point(FXMsLast,FYMsLast), ptrDynaHintItem) AND (TDynamicHint(ptrDynaHintItem^).InfoComponent.idObj <> 0)));
  finally
  DynamicHints.Lock.Leave;
  end;
  if (flUseDynamicHint)
   then begin
    try
    if (ptrUserDynaHintItem <> nil)
     then begin
      if ((Mode = rmBrowsing) AND (NOT (ssCtrl in MouseShiftState)))
       then begin
        DynamicHints.Lock.Enter;
        try
        with TUserDynamicHint(ptrUserDynaHintItem^) do
        with TBaseVisualizationFunctionality(TComponentFunctionality_Create(Space.Obj_IDType(ptrObj),Space.Obj_ID(ptrObj))) do
        try
        GetOwnerByVisualization(idTComponent,idComponent,ptrComponent);
        finally
        Release;
        end;
        finally
        DynamicHints.Lock.Leave;
        end;
        end
       else with TfmUserHintPanel.Create() do //. show user-defines dinamic hint props panel
        try
        with DynamicHints.UserDynamicHints do begin
        DynamicHints.Lock.Enter;
        try
        with TUserDynamicHint(ptrUserDynaHintItem^) do begin
        Color:=BackgroundColor;
        edInfoText.Color:=BackgroundColor;
        if (InfoImage <> nil)
         then begin
          imgInfoImage.Picture.Bitmap.Canvas.Lock();
          try
          InfoImage.Canvas.Lock();
          try
          imgInfoImage.Picture.Bitmap.Assign(InfoImage);
          finally
          InfoImage.Canvas.Unlock();
          end;
          finally
          imgInfoImage.Picture.Bitmap.Canvas.Unlock();
          end;
          end;
        edInfoText.Text:=InfoString;
        edInfoText.Font.Name:=InfoStringFontName;
        edInfoText.Font.Size:=InfoStringFontSize;
        edInfoText.Font.Color:=InfoStringFontColor;
        cbTracking.Checked:=flTracking;
        cbAlwaysCheckVisibility.Checked:=flAlwaysCheckVisibility;
        end;
        finally
        DynamicHints.Lock.Leave;
        end;
        if (Accepted())
         then begin
          SetItem(ptrUserDynaHintItem, Color,imgInfoImage.Picture.Bitmap,edInfoText.Text,edInfoText.Font.Name,edInfoText.Font.Size,edInfoText.Font.Color);
          EnableDisableItemTrack(ptrUserDynaHintItem,cbTracking.Checked);
          EnableDisableAlwaysCheckVisibility(ptrUserDynaHintItem,cbAlwaysCheckVisibility.Checked);
          end;
        end;
        Exit; //. ->
        finally
        Destroy;
        end;
      end
     else begin
      if ((Mode = rmBrowsing) AND (NOT (ssCtrl in MouseShiftState)))
       then begin
        idTComponent:=TDynamicHint(ptrDynaHintItem^).InfoComponent.idType;
        idComponent:=TDynamicHint(ptrDynaHintItem^).InfoComponent.idObj;
        end
       else begin
        idTComponent:=idTHINTVisualization;
        idComponent:=TDynamicHint(ptrDynaHintItem^).id;
        end;
      end;
    if (idTComponent <> idTCoComponent)
     then ShowPropsPanel(idTComponent,idComponent)
     else begin
      CoComponentPanelProps:=nil;
      Space.Log.OperationStarting('loading ..........');
      try
      try
      CoComponentPanelProps:=Space.Plugins___CoComponent__TPanelProps_Create(TypesFunctionality.CoComponentFunctionality_idCoType(idComponent),idComponent);
      except
        FreeAndNil(CoComponentPanelProps);
        end;
      finally
      Space.Log.OperationDone;
      end;
      if CoComponentPanelProps <> nil
       then with CoComponentPanelProps do begin
        Left:=Round((Screen.Width-Width)/2);
        Top:=Screen.Height-Height-20;
        OnKeyDown:=Self.OnKeyDown;
        OnKeyUp:=Self.OnKeyUp;
        Show;
        end
       else ShowPropsPanel(idTComponent,idComponent);
      end;
    finally
    flLeftButtonDown:=false;
    end;
    Exit; //. ->
    end;
  //.
  if ((XYToGeoCrdConverter <> nil) AND TfmXYToGeoCrdConvertor(XYToGeoCrdConverter).GeoObjectTracks.IsSelectedTrackStopOrMovementInterval({out} ptrSelectedTrack,ptrSelectedTrackStopOrMovementInterval))
   then begin
    TimeInterval.Time:=TTrackStopsAndMovementsAnalysisInterval(ptrSelectedTrackStopOrMovementInterval).Position.TimeStamp;
    TimeInterval.Duration:=TTrackStopsAndMovementsAnalysisInterval(ptrSelectedTrackStopOrMovementInterval).Duration;
    TfmXYToGeoCrdConvertor(XYToGeoCrdConverter).GeoObjectTracks.GetTrackPanel(ptrSelectedTrack,TimeInterval).Show();
    flLeftButtonDown:=false;
    Exit; //. ->
    end else
  if ((XYToGeoCrdConverter <> nil) AND TfmXYToGeoCrdConvertor(XYToGeoCrdConverter).GeoObjectTracks.IsSelectedTrackNode({out} ptrSelectedTrack,ptrSelectedTrackNode))
   then begin
    TfmXYToGeoCrdConvertor(XYToGeoCrdConverter).GeoObjectTracks.GetTrackPanel(ptrSelectedTrack,TObjectTrackNode(ptrSelectedTrackNode^).TimeStamp).Show();
    flLeftButtonDown:=false;
    Exit; //. ->
    end ;
  //.
  if ((Mode = rmBrowsing) AND (OverObjectPtr <> nilPtr) AND (Cursor = crHandPoint) AND NOT (((EditingOrCreatingObject <> nil) AND (EditingOrCreatingObject.Mode <> emNone)) OR ((ObjectEditor <> nil) AND (ObjectEditor.EditingMode <> emNone))))
   then
    try
    with TBaseVisualizationFunctionality(TComponentFunctionality_Create(Space.Obj_idType(OverObjectPtr),Space.Obj_ID(OverObjectPtr))) do
    try
    if (DoOnClick)
     then begin
      flLeftButtonDown:=false;
      Exit; //. ->
      end;
    finally
    Release;
    end;
    except
      end;
  finally
  Screen.Cursor:=SC;
  end;
  finally
  flProcessingOnClick:=false;
  end;
  except
    flLeftButtonDown:=false;
    Raise; //. =>
    end;
  end;
end;
end;

procedure TReflector.FormDblClick(Sender: TObject);
begin
case Style of
rsNative,rsSpaceViewing: begin
  OverObj_flDblClick:=true;
  try
  OverObjDblClick;
  except
    //. catch any exception if double click action is failed
    end;
  end;
end;
end;

procedure TReflector.ChangeVisiblePropsSelectedObj;
var
  ptrObj: TPtr;
  Obj: TSpaceObj;
begin
if Configuration.flDisableObjectChanging then Exit; //. ->
ptrObj:=ptrSelectedObj;
with TSpaceObj_PanelProps.Create(Self,ptrObj) do Show;
end;

procedure TReflector.DeleteSelectedObj;
var
  ptrDelObj: TPtr;
  DetailTypeFunctionality: TTBase2DVisualizationFunctionality;
  DelObj: TSpaceObj;
begin
if ptrSelectedObj = nilPtr then Exit;
ptrDelObj:=ptrSelectedObj;
CheckUserObjWrite(ptrDelObj);
Space.ReadObj(DelObj,SizeOf(DelObj), ptrDelObj);
if DelObj.ptrListOwnerObj <> nilPtr
 then begin
  ShowMessage('! can not destroy detail (has owner details).');
  Exit;
  end;
if NOT Space.Obj_IsDetail(ptrDelObj)
 then begin
  ShowMessage('! can not destroy the object (user props-panel instead).');
  Exit;
  end;
DetailTypeFunctionality:=TTBase2DVisualizationFunctionality(TTypeFunctionality_Create(DelObj.idTObj));
with DetailTypeFunctionality do begin
Reflector:=Self;
DestroyInstance(DelObj.idObj);
Release;
end;
ptrSelectedObj:=nilPtr;
end;


function TReflector.PrimMap_Init: boolean;
var
  SaveDir: string;
  NameFileMap: string;
begin
Result:=false;
with TOpenPictureDialog.Create(nil) do begin
SaveDir:=GetCurrentDir;
if Execute
 then begin
  NameFileMap:=FileName;
  PrimMap_Image.Free;
  PrimMap_Image:=TImage.Create(nil);
  PrimMap_Image.Picture.LoadFromFile(NameFileMap);
  PrimMap_PosX:=0;
  PrimMap_PosY:=0;
  PrimMap_Free;
  PrimMap_Exist:=true;
  Result:=true;
  TReflecting(Reflecting).ReFresh;
  end;
SetCurrentDir(SaveDir);
Destroy;
end;
end;

procedure TReflector.PrimMap_Fix;
begin
PrimMap_Fixing:=true;
end;

procedure TReflector.PrimMap_Shift(dX,dY: integer);
begin
Dec(PrimMap_PosX,dX);
Dec(PrimMap_PosY,dY);
end;

procedure TReflector.PrimMap_Free;
begin
PrimMap_Fixing:=false;
end;

procedure TReflector.PrimMap_Destroy;
begin
PrimMap_Image.Free;
PrimMap_Image:=nil;
TReflecting(Reflecting).ReFresh;
PrimMap_Exist:=false;
end;


{HINTS}
type
  TExtent = record
    Xmn,Ymn: integer;
    Xmx,Ymx: integer;
  end;

function ExtentIsEmpty(const Extent: TExtent): boolean;
begin
with Extent do Result:=(Xmn = Xmx) OR (Ymn = Ymx);
end;

const
  Hint_minFontSize = 8;
  Hint_maxFontSize = 100;
  Hint_Color = clBlack;
  Hint_BkColor = TColor($004080FF);

{THintObj}
Constructor THintObj.Create(pPtrObj: TPtr; pReflector: TReflector);
var
  Obj: TSpaceObj;
  ptrPoint: TPtr;
  Point: TPoint;

  ptrOwnerObj: TPtr;

  idTOwner,idOwner: integer;

  procedure TreatePoint(X,Y: Extended);
  var
     C,QdC,A1,QdA2,QdB2,H: Extended;
     L: Extended;
     Node: TNode;
  begin
  with pReflector,ReflectionWindow do begin
  Lock.Enter;
  try
  X:=X*cfTransMeter;
  Y:=Y*cfTransMeter;
  QdC:=sqr(X1-X0)+sqr(Y1-Y0);
  C:=Sqrt(QdC);
  QdA2:=sqr(X-X0)+sqr(Y-Y0);
  QdB2:=sqr(X-X1)+sqr(Y-Y1);
  A1:=(QdC-QdB2+QdA2)/(2*C);
  Node.X:=Xmn+(A1/C*(Xmx-Xmn));
  QdC:=sqr(X3-X0)+sqr(Y3-Y0);
  C:=Sqrt(QdC);
  QdA2:=sqr(X-X0)+sqr(Y-Y0);
  QdB2:=sqr(X-X3)+sqr(Y-Y3);
  A1:=(QdC-QdB2+QdA2)/(2*C);
  Node.Y:=Ymn+(A1/C*(Ymx-Ymn));
  finally
  Lock.Leave;
  end;
  Figure.Insert(Node);
  end;
  end;

begin
Inherited Create;
Figure:=TFigureWinRefl.Create;
// получаем фигуру отображения
with pReflector,Figure do begin
Space.ReadObj(Obj,SizeOf(TSpaceObj), pPtrObj);
flagLoop:=Obj.flagLoop;
Color:=Obj.Color;
ColorFill:=Obj.ColorFill;
ptrPoint:=Obj.ptrFirstPoint;
While ptrPoint <> nilPtr do begin
 Space.ReadObj(Point,SizeOf(TPoint), ptrPoint);
 TreatePoint(Point.X,Point.Y);
 ptrPoint:=Point.ptrNextObj;
 end;
AttractToLimits(TReflecting(pReflector.Reflecting).WindowRefl);
end;
// для фигуры ищем подсказку
Hint:='';
try
if Obj.idObj <> 0
 then with TComponentFunctionality_Create(Obj.idTObj,Obj.idObj) do
  try
  if GetOwner(idTOwner,idOwner)
   then with TComponentFunctionality_Create(idTOwner,idOwner) do
    try
    Self.Hint:=Hint;
    if Self.Hint = '' then Self.Hint:=Name;
    finally
    Release;
    end;
  finally
  Release;
  end;
except
  Hint:='?';
  end;
AlreadyReflected:=false;
end;

destructor THintObj.Destroy;
begin
Figure.Free;
Inherited ;
end;

procedure THintObj.GetMarginsFigure(var Xmn,Ymn,Xmx,Ymx: integer);
var
  I: integer;
begin
with Figure do begin
Xmn:=ScreenNodes[0].X;Ymn:=ScreenNodes[0].Y;
Xmx:=Xmn;Ymx:=Ymn;
for I:=1 to Count-1 do begin
  if ScreenNodes[I].X < Xmn
   then Xmn:=ScreenNodes[I].X
   else
    if ScreenNodes[I].X > Xmx
     then Xmx:=ScreenNodes[I].X;
  if ScreenNodes[I].Y < Ymn
   then Ymn:=ScreenNodes[I].Y
   else
    if ScreenNodes[I].Y > Ymx
     then Ymx:=ScreenNodes[I].Y;
  end;
end;
end;


{THintsVisibleObjects}
Constructor THintsVisibleObjects.Create(pReflector: TReflector);
begin
Inherited Create;
FReflector:=pReflector;
CntDoneShow:=0;
FReflector.GaugeProgressShowHints.Progress:=0;
Get;
end;

destructor THintsVisibleObjects.Destroy;
var
  I: integer;
begin
for I:=0 to Count-1 do FItems[I].Free;
Inherited ;
end;

procedure THintsVisibleObjects.Get;
var
  ptrLay: pointer;
  ptrItem: pointer;
begin
with FReflector.Reflecting do begin
Lock.Enter;
try
ptrLay:=Lays;
while ptrLay <> nil do with TLayReflect(ptrLay^) do begin
  ptrItem:=Objects;
  while ptrItem <> nil do with TItemLayReflect(ptrItem^) do begin
    InsertObj(ptrObject);
    ptrItem:=ptrNext;
    end;
  ptrLay:=ptrNext;
  end;
finally
Lock.Leave;
end;
end;
end;

function THintsVisibleObjects.getItem(Index: integer): THintObj;
begin
Result:=FItems[Index];
end;

procedure THintsVisibleObjects.InsertObj(ptrObj: TPtr);
var
  HintObj: THintObj;
begin
HintObj:=THintObj.Create(ptrObj,FReflector);
if Count >= HintsVisibleObjects_maxCount then Exit;
FItems[Count]:=HintObj;
inc(Count);
end;

procedure THintsVisibleObjects.IncCntDoneAndShowProgress;
begin
Inc(CntDoneShow);
FReflector.GaugeProgressShowHints.Progress:=Round(CntDoneShow/Count*100);
/// - Application.ProcessMessages;
end;

procedure THintsVisibleObjects.TryShow;
var
  I: integer;

  function FigureHavePoint(const P: TScreenNode; IndexFig: integer; var flVisible: boolean): boolean;

    function PointInsideFigure(const P: TScreenNode; IndexFig: integer): boolean;
    var
      Side_P0,Side_P1: TScreenNode;
      cntCrossUp,cntCrossDown: integer;
      I: integer;

      procedure TreateSide;
      var
        Ycr: extended;
      begin
      if (P.X-Side_P0.X)*(P.X-Side_P1.X) <= 0
       then
        if (Side_P1.X-Side_P0.X) <> 0
         then begin
          Ycr:=Side_P0.Y+(P.X-Side_P0.X)*(Side_P1.Y-Side_P0.Y)/(Side_P1.X-Side_P0.X);
          if Ycr < P.Y
           then Inc(cntCrossUp)
           else Inc(cntCrossDown);
          end;
      end;

    begin
    Result:=false;
    with FItems[IndexFig].Figure do begin
    if NOT flagLoop then Exit; //. ->
    cntCrossUp:=0;
    cntCrossDown:=0;
    Side_P0:=ScreenNodes[0];
    for I:=1 to CountScreenNodes-1 do begin
      Side_P1:=ScreenNodes[I];
      TreateSide;
      Side_P0:=Side_P1;
      end;
    Side_P1:=ScreenNodes[0];
    TreateSide;
    if ((cntCrossUp MOD 2) > 0) AND ((cntCrossDown MOD 2) > 0)
     then Result:=true;
    end;
    end;

  var
    I: integer;
  begin
  Result:=false;
  if NOT PointInsideFigure(P, IndexFig) then Exit; //. ->
  flVisible:=true;
  for I:=IndexFig+1 to Count-1 do begin
    if PointInsideFigure(P, I)
     then begin
      flVisible:=false;
      Break; //. >
      end;
    end;
  Result:=true;
  end;

  function ExtentBetterAnother(const Extent,AnExtent: TExtent): boolean;
  var
    S_E,S_AnE: extended;
  begin //. находим лучше ли поле вывода Extent другого
  with Extent do S_E:=(Xmx-Xmn)*(Ymx-Ymn);
  with AnExtent do S_AnE:=(Xmx-Xmn)*(Ymx-Ymn);
  if S_E > S_AnE
   then Result:=true
   else Result:=false;
  end;

type
  TDirSearch = (dsLeftRight,dsRightLeft,dsUpDown,dsDownUp,dsLeftUp_RightDown,dsRightDown_LeftUp,dsRightUp_LeftDown,dsLeftDown_RightUp);

  procedure GetSingleColorLine(P0: TScreenNode; DirSearch: TDirSearch; BasePix: TColor; var P1: TScreenNode);
  var
    X,Y: integer;
    dX,dY: integer;
  begin
  with FReflector.BMPBuffer.Canvas do begin
  P1.X:=P0.X;P1.Y:=P0.Y;
  if BasePix = -1 then Exit;
  dX:=0;dY:=0;
  case DirSearch of
  dsLeftRight: begin
    dX:=1;
    end;
  dsRightLeft: begin
    dX:=-1;
    end;
  dsUpDown: begin
    dY:=1;
    end;
  dsDownUp: begin
    dY:=-1
    end;
  dsLeftUp_RightDown: begin
    dX:=1;
    dY:=1;
    end;
  dsRightDown_LeftUp: begin
    dX:=-1;
    dY:=-1;
    end;
  dsRightUp_LeftDown: begin
    dX:=-1;
    dY:=1;
    end;
  dsLeftDown_RightUp: begin
    dX:=1;
    dY:=-1;
    end;
  end;
  while Pixels[P1.X+dX,P1.Y+dY] = BasePix do begin
    Inc(P1.X,dX);Inc(P1.Y,dY);
    end;
  end;
  end;

  function GetExtentBMP(const PrimPoint: TScreenNode;const SuggestExtent: TExtent; var Extent: TExtent): boolean;

    procedure SearchBestExtent(PrimPoint: TScreenNode; SuggestExtent: TExtent; var BestExtent: TExtent);
    var
      ScaleSuggestExtent: extended;

      function GetExtentToHorzLine(pY,pXmn,pXmx: integer; BasePix: TColor; var Extent: TExtent): boolean;
      var
        Width,Height,NeededWidth,NeededHeight: integer;
        P0,P1,P2: TScreenNode;
      begin
      Result:=false;
      Width:=(pXmx-pXmn);
      NeededHeight:=round(Width*ScaleSuggestExtent);
      P0.X:=pXmx;P0.Y:=pY;
      GetSingleColorLine(P0,dsUpDown,BasePix, P1);
      Height:=(P1.Y-P0.Y);
      if Height < NeededHeight then Exit;
      P1.Y:=P0.Y+NeededHeight;
      GetSingleColorLine(P1,dsRightLeft,BasePix, P2);
      if (P1.X-P2.X) < Width then Exit;
      with Extent do begin
      Xmn:=pXmn;Ymn:=pY;
      Xmx:=pXmx;Ymx:=P1.y;
      end;
      Result:=true;
      end;

    var
      Extent: TExtent;
      Y,Xmn,Xmx: integer;
      P: TScreenNode;
      I: integer;
      BasePix: TColor;
    begin
    with BestExtent do begin
    Xmn:=0;Ymn:=0;
    Xmx:=0;Ymx:=0;
    end;
    with SuggestExtent do begin
    if (Xmx-Xmn) = 0 then Exit;
    ScaleSuggestExtent:=(Ymx-Ymn)/(Xmx-Xmn);
    end;
    Y:=PrimPoint.Y;
    Xmn:=PrimPoint.X;
    BasePix:=FReflector.BMPBuffer.Canvas.Pixels[PrimPoint.X,PrimPoint.Y];
     for I:=1 to 1 do begin
      GetSingleColorLine(PrimPoint,dsLeftRight,BasePix, P);
      Xmx:=P.X;
      if GetExtentToHorzLine(Y,Xmn,Xmx,BasePix, Extent)
       then
        if ExtentBetterAnother(Extent,BestExtent)
         then BestExtent:=Extent;

      Inc(Y,5);
      end;
    end;

  var
    BasePix: TColor;
    PrimPointNew: TScreenNode;
    Ext,BestExtent: TExtent;
  begin // ищем поле вывода Extent в битовом поле
  Result:=false;
  BasePix:=FReflector.BMPBuffer.Canvas.Pixels[PrimPoint.X,PrimPoint.Y];
  GetSingleColorLine(PrimPoint,dsRightLeft,BasePix, PrimPointNew);
  SearchBestExtent(PrimPointNew,SuggestExtent, BestExtent);
  GetSingleColorLine(PrimPoint,dsDownUp,BasePix, PrimPointNew);
  SearchBestExtent(PrimPointNew,SuggestExtent, Ext);
  if ExtentBetterAnother(Ext,BestExtent) then BestExtent:=Ext;
  Extent:=BestExtent;
  with FReflector.Canvas do begin
  Brush.Color:=Hint_BkColor;
  FrameRect(Rect(Extent.Xmn,Extent.Ymn,Extent.Xmx,Extent.Ymx));
  end;
  Result:=true;
  end;

  function L(P0,P1: TScreenNode): extended;
  begin
  Result:=Sqrt(sqr(P1.X-P0.X)+sqr(P1.Y-P0.Y));
  end;

  procedure GetPointShortestDistanceToLine(P0,P1: TScreenNode;Pe: TScreenNode; var Prs: TScreenNode);
  var
    dX,dY,D: extended;
    sqrA,sqrB: extended;
    X,Y: extended;
  begin
  dX:=(P1.X-P0.X);dY:=(P1.Y-P0.Y);
  sqrA:=sqr(Pe.X-P0.X)+sqr(Pe.Y-P0.Y);
  sqrB:=sqr(Pe.X-P1.X)+sqr(Pe.Y-P1.Y);
  if abs(dX) >= abs(dY)
   then begin
    if dX = 0
     then begin
      Prs:=P0;
      Exit;
      end;
    D:=dY/dX;
    X:=(2*dY*D*P0.X+sqr(dY)+(P0.X+P1.X)*dX-(sqrB-sqrA))/(2*dX*(1+sqr(D)));
    Y:=D*(X-P0.X)+P0.Y;
    if (X-P0.X)*(X-P1.X) <= 0
     then begin
      Prs.X:=round(X);
      Prs.Y:=round(Y);
      end
     else
      if abs(X-P0.X) < abs(X-P1.X)
       then Prs:=P0
       else Prs:=P1;
    end
   else begin
    D:=dX/dY;
    Y:=(2*dX*D*P0.Y+sqr(dX)+(P0.Y+P1.Y)*dY-(sqrB-sqrA))/(2*dY*(1+sqr(D)));
    X:=D*(Y-P0.Y)+P0.X;
    if (Y-P0.Y)*(Y-P1.Y) <= 0
     then begin
      Prs.X:=round(X);
      Prs.Y:=round(Y);
      end
     else
      if abs(Y-P0.Y) < abs(Y-P1.Y)
       then Prs:=P0
       else Prs:=P1;
    end;
  end;

  procedure GetShortestLineToExtent(P0,P1: TScreenNode;const Extent: TExtent; var Line_P0,Line_P1: TScreenNode);
  var
    Pe,P: TscreenNode;
    minLen: extended;
    BestLine_P0,
    BestLine_P1: TScreenNode;
  begin
  with Extent do begin
  Pe.X:=Xmn;Pe.Y:=Ymn;
  GetPointShortestDistanceToLine(P0,P1,Pe,P);
  BestLine_P0:=Pe;
  BestLine_P1:=P;
  minLen:=L(Pe,P);
  Pe.X:=Xmx;Pe.Y:=Ymn;
  GetPointShortestDistanceToLine(P0,P1,Pe,P);
  if L(Pe,P) < minLen
   then begin
    BestLine_P0:=Pe;
    BestLine_P1:=P;
    minLen:=L(Pe,P);
    end;
  Pe.X:=Xmx;Pe.Y:=Ymx;
  GetPointShortestDistanceToLine(P0,P1,Pe,P);
  if L(Pe,P) < minLen
   then begin
    BestLine_P0:=Pe;
    BestLine_P1:=P;
    minLen:=L(Pe,P);
    end;
  Pe.X:=Xmn;Pe.Y:=Ymx;
  GetPointShortestDistanceToLine(P0,P1,Pe,P);
  if L(Pe,P) < minLen
   then begin
    BestLine_P0:=Pe;
    BestLine_P1:=P;
    minLen:=L(Pe,P);
    end;
  end;
  Line_P0:=BestLine_P0;
  Line_P1:=BestLine_P1;
  end;

  function NearNodeExtent(P: TScreenNode; Extent: TExtent): TScreenNode;
  var
    minL: extended;

  var
    Pe: TScreenNode;
  begin
  with Extent do begin
  Pe.X:=Xmn;Pe.Y:=Ymn;
  minL:=L(P,Pe);
  Result:=Pe;
  Pe.X:=Xmx;Pe.Y:=Ymn;
  if L(P,Pe) < minL
   then begin
    Result:=Pe;
    minL:=L(P,Pe);
    end;
  Pe.X:=Xmx;Pe.Y:=Ymx;
  if L(P,Pe) < minL
   then begin
    Result:=Pe;
    minL:=L(P,Pe);
    end;
  Pe.X:=Xmn;Pe.Y:=Ymx;
  if L(P,Pe) < minL
   then begin
    Result:=Pe;
    minL:=L(P,Pe);
    end;
  end
  end;

  procedure GetBestExtentToPoint(P: TScreenNode; SuggestExtent: TExtent; NeedLimitation,NeedShiftOrigin: boolean; var BestExtent: TExtent);
  const
    IncWidthExtent = 7;
  var
    BasePix: TColor;
    P1,P2,P3,P01: TScreenNode;
    ScaleSuggestExtent: Extended;
    Width,Height,NeededWidth,NeededHeight: integer;
    I: integer;

    procedure Get(P: TScreenNode);
    begin
    if BasePix = -1 then Exit; //. ->
    I:=0;
    repeat
      GetSingleColorLine(P,dsLeftRight,BasePix, P1);
      Width:=P1.X-P.X;
      if Width < NeededWidth then Exit;
      P1.X:=P.X+NeededWidth;
      GetSingleColorLine(P1,dsUpDown,BasePix, P2);
      Height:=P2.Y-P1.Y;
      if Height < NeededWidth then Exit;
      P2.Y:=P1.Y+NeededHeight;
      GetSingleColorLine(P2,dsRightLeft,BasePix, P3);
      Width:=P2.X-P3.X;
      if Width < NeededWidth then Exit;
      P3.X:=P2.X-NeededHeight;
      GetSingleColorLine(P3,dsDownUp,BasePix, P01);
      Height:=P3.Y-p01.Y;
      if Height < NeededHeight then Exit;
      with BestExtent do begin
      Xmn:=P.X;Ymn:=P.Y;
      Xmx:=P2.X;Ymx:=P2.Y;
      end;
      Inc(NeededWidth,IncWidthExtent);
      Inc(NeededHeight,round(IncWidthExtent*ScaleSuggestExtent));
    inc(I);
    until (NeedLimitation AND (I >= 3));
    end;

  var
    PrimPoint: TScreenNode;
  begin
  with BestExtent do begin
  Xmn:=0;Ymn:=0;
  Xmx:=0;Ymx:=0;
  end;
  with SuggestExtent do begin
  NeededWidth:=(Xmx-Xmn);
  if NeededWidth = 0 then Exit; //. ->
  NeededHeight:=(Ymx-Ymn);
  ScaleSuggestExtent:=NeededHeight/NeededWidth;
  end;
  BasePix:=FReflector.BMPBuffer.Canvas.Pixels[P.X,P.Y];
  if NeedShiftOrigin
   then begin
    GetSingleColorLine(P,dsRightLeft,BasePix, PrimPoint);
    Get(PrimPoint);
    GetSingleColorLine(P,dsDownUp,BasePix, PrimPoint);
    Get(PrimPoint);
    end
   else
    Get(P);
    {with FReflector.Canvas do begin
    Brush.Color:=clWhite;
    FrameRect(Rect(BestExtent.Xmn,BestExtent.Ymn,BestExtent.Xmx,BestExtent.Ymx));
    end;}
  end;

  procedure GetBestExtentNearLine(P0,P1: TScreenNode;Step: integer;Ampl,AmplSign: integer;SuggestExtent: TExtent; var BestExtent: TExtent);
  var
    Pos,Limit,ofs: integer;
    Extent: TExtent;
    P: TScreenNode;
  begin
  with BestExtent do begin
  Xmn:=0;Ymn:=0;
  Xmx:=0;Ymx:=0;
  end;
  Pos:=P0.X;
  if abs(P1.X-P0.X) >= abs(P1.Y-P0.Y)
   then begin
    if (P1.X-P0.X) = 0 then Exit; //. ->
    if P0.X <= P1.X
     then Pos:=P0.X
     else Pos:=P1.X;
    if P1.X >= P0.X
     then Limit:=P1.X
     else Limit:=P0.X;
    repeat
      ofs:=AmplSign*Random(Ampl);
      P.X:=Pos;P.Y:=(P0.Y+round((Pos-P0.X)*(P1.Y-P0.Y)/(P1.X-P0.X)))+ofs;
      GetBestExtentToPoint(P,SuggestExtent,true,false, Extent);
      if ExtentBetterAnother(Extent,BestExtent)
       then BestExtent:=Extent;
      Inc(Pos,Step);
    until Pos >= Limit;
    end
   else begin
    if P0.Y<= P1.Y
     then Pos:=P0.Y
     else Pos:=P1.Y;
    if P1.Y >= P0.Y
     then Limit:=P1.Y
     else Limit:=P0.Y;
    repeat
      ofs:=AmplSign*Random(Ampl);
      P.Y:=Pos;P.X:=(P0.X+round((Pos-P0.Y)*(P1.X-P0.X)/(P1.Y-P0.Y)))+ofs;
      GetBestExtentToPoint(P,SuggestExtent,true,false, Extent);
      if ExtentBetterAnother(Extent,BestExtent)
       then BestExtent:=Extent;
      Inc(Pos,Step);
    until Pos >= Limit;
    end;
  end;

var
  Sz: TSize;
  SuggestExtent: TExtent;

  procedure TreateUnLoopedObject(Index: integer);


    procedure GetCenterLine(P0,P1: TScreenNode; var Pc: TscreenNode);
    var
      dX,dY: integer;
    begin
    dX:=P1.X-P0.X;dY:=P1.Y-P0.Y;
    if abs(dX) >= abs(dY)
     then begin
      if dX = 0
       then begin
        Pc:=P0;
        Exit;
        end;
      Pc.X:=round((P0.X+P1.X)/2);
      Pc.Y:=P0.Y+round((Pc.X-P0.X)*(P1.Y-P0.Y)/(P1.X-P0.X));
      end
     else begin
      Pc.Y:=round((P0.Y+P1.Y)/2);
      Pc.X:=P0.X+round((Pc.Y-P0.Y)*(P1.X-P0.X)/(P1.Y-P0.Y));
      end
    end;


  const
    StepSearch = 5;
  var
    AmplSearch: integer;
    I: integer;
    P0,P1: TScreenNode;
    Extent,BestExtent: TExtent;

    procedure ShowHint(Extent: TExtent; strHint: string; BrushColor: TColor);
    var
      HintFontSize,ValidHintFontSize: integer;
      HintSize: TSize;
      SaveFontSize: integer;
    begin
    with FReflector.BMPBuffer.Canvas do begin
    SaveFontSize:=Font.Size;
    ValidHintFontSize:=0;
    for HintFontSize:=Hint_minFontSize to Hint_maxFontSize do begin
      Font.Size:=HintFontSize;
      HintSize:=TextExtent(strHint);
      with Extent do
      if ((Xmx-Xmn) >= HintSize.cx) AND ((Ymx-Ymn) >= HintSize.cy)
       then begin
        ValidHintFontSize:=HintFontSize;
        end;
      end;
    if ValidHintFontSize > 0
     then begin
      Pen.Width:=1;
      Pen.Style:=psSolid;
      Pen.Color:=BrushColor;
      Brush.Color:=BrushColor;
      Rectangle(Extent.Xmn,Extent.Ymn,Extent.Xmx,Extent.Ymx);
      {if Brush.Color <> clWhite
       then Font.Color:=clWhite
       else Font.Color:=clBlack;}
      /// - TextFlags:=TextFlags+ETO_OPAQUE;
      Font.Size:=ValidHintFontSize;
      Font.Color:=Hint_Color;
      Font.Name:='Tahoma';
      TextRect(Rect(BestExtent.Xmn,BestExtent.Ymn,BestExtent.Xmx,BestExtent.Ymx),Extent.Xmn+1,Extent.Ymn,strHint);
      end;
    Font.Size:=SaveFontSize;
    end;
    FReflector.BMPBuffer.Canvas.Lock;
    try
    FReflector.Reflecting.BMP_Reflect(FReflector.BMPBuffer,true,nil,MaxDouble);
    finally
    FReflector.BMPBuffer.Canvas.Unlock;
    end;
    end;

    procedure ShowFastenLine;
    var
      P0,P1,Pc,Pe: TScreenNode;
      BestLine_Length: extended;
      BestLine_P0,BestLine_P1: TScreenNode;
      I: integer;

      procedure TreateSide(Side_P0,Side_P1: TScreenNode);
      var
        Line_P0,Line_P1: TScreenNode;
      begin
      GetShortestLineToExtent(Side_P0,Side_P1,BestExtent, Line_P0,Line_P1);
      if L(Line_P0,Line_P1) < BestLine_Length
       then begin
         BestLine_P0:=Line_P0;
         BestLine_P1:=Line_P1;
         BestLine_Length:=L(Line_P0,Line_P1)
         end;
      end;

    var
      Side_P0,Side_P1: TScreenNode;
    begin
    with FItems[Index].Figure do begin
    Side_P0:=ScreenNodes[0];
    BestLine_Length:=1000000;
    for I:=1 to CountScreenNodes-1 do begin
      Side_P1:=ScreenNodes[I];
      TreateSide(Side_P0,Side_P1);
      Side_P0:=Side_P1;
      end;
    with FReflector.BMPBuffer.Canvas do begin
    Pen.Color:=clWhite;
    Brush.Color:=clBlack;
    MoveTo(BestLine_P0.X,BestLine_P0.Y);
    LineTo(BestLine_P1.X,BestLine_P1.Y);
    Brush.Color:=clWhite;
    Ellipse(BestLine_P1.X-1,BestLine_P1.Y-1,BestLine_P1.X+1,BestLine_P1.Y+1)
    end;
    end;
    end;

  begin
  Randomize;
  with BestExtent do begin
  Xmn:=0;Ymn:=0;
  Xmx:=0;Ymx:=0;
  end;
  if FReflector.Width >= FReflector.Height
   then AmplSearch:=Round(FReflector.Width/4)
   else AmplSearch:=Round(FReflector.Height/4);
  with FItems[Index].Figure do begin
  P0:=ScreenNodes[0];
  for I:=1 to CountScreenNodes-1 do begin
    P1:=ScreenNodes[I];
    GetBestExtentNearLine(P0,P1,StepSearch,AmplSearch,1,SuggestExtent, Extent);
    if ExtentBetterAnother(Extent,BestExtent)
     then BestExtent:=Extent;
    GetBestExtentNearLine(P0,P1,StepSearch,AmplSearch,-1,SuggestExtent, Extent);
    if ExtentBetterAnother(Extent,BestExtent)
     then BestExtent:=Extent;
    P0:=P1;
    end;
  end;
  if NOT ExtentIsEmpty(BestExtent)
   then begin
    ShowHint(BestExtent, FItems[Index].Hint,Hint_BkColor);
    with FReflector.BMPBuffer.Canvas do begin
    Brush.Color:=clBlack;
    FrameRect(Rect(BestExtent.Xmn,BestExtent.Ymn,BestExtent.Xmx,BestExtent.Ymx));
    end;
    ShowFastenLine;
    FReflector.BMPBuffer.Canvas.Lock;
    try
    FReflector.Reflecting.BMP_Reflect(FReflector.BMPBuffer,true,nil,MaxDouble);
    finally
    FReflector.BMPBuffer.Canvas.Unlock;
    end;
    FItems[Index].AlreadyReflected:=true;
    IncCntDoneAndShowProgress;
    end;
  end;

  procedure TreateLoopedObject(Index: integer);
  const
    cntTryToGetExtent = 33;
  var
    Fig_Xmn,Fig_Ymn,Fig_Xmx,Fig_Ymx: integer;
    Fig_Width,Fig_Height: integer;
    RndOfsX,RndOfsY: integer;
    RndPoint: TScreenNode;
    flagVisiblePoint: boolean;
    J,cntTry: integer;
    Extent,BestExtent: TExtent;

    procedure TryShowHintNear;
    begin
    TreateUnLoopedObject(Index);
    end;

    procedure ShowHint(Extent: TExtent; strHint: string; BrushColor: TColor);
    var
      HintFontSize,ValidHintFontSize: integer;
      HintSize: TSize;
      SaveFontSize: integer;
    begin
    with FReflector.BMPBuffer.Canvas do begin
    SaveFontSize:=Font.Size;
    ValidHintFontSize:=0;
    for HintFontSize:=Hint_minFontSize to Hint_maxFontSize do begin
      Font.Size:=HintFontSize;
      HintSize:=TextExtent(strHint);
      with Extent do
      if ((Xmx-Xmn) >= HintSize.cx) AND ((Ymx-Ymn) >= HintSize.cy)
       then begin
        ValidHintFontSize:=HintFontSize;
        end;
      end;
    if ValidHintFontSize > 0
     then begin
      Font.Size:=ValidHintFontSize;
      Brush.Color:=BrushColor;
      if (Brush.Color = clWhite) OR (Brush.Color = clYellow) OR (Brush.Color = clAqua)
       then Font.Color:=clBlack
       else Font.Color:=clWhite;
      Font.Name:='Tahoma';
      TextOut(Extent.Xmn,Extent.Ymn,strHint);
      end;
    Font.Size:=SaveFontSize;
    end;
    FReflector.BMPBuffer.Canvas.Lock;
    try
    FReflector.Reflecting.BMP_Reflect(FReflector.BMPBuffer,true,nil,MaxDouble);
    finally
    FReflector.BMPBuffer.Canvas.Unlock;
    end;
    end;

  begin
  FItems[Index].GetMarginsFigure(Fig_Xmn,Fig_Ymn,Fig_Xmx,Fig_Ymx);
  Fig_Width:=Fig_Xmx-Fig_Xmn;Fig_Height:=Fig_Ymx-Fig_Ymn;
  if Fig_Width*Fig_Height < 7*7
   then begin
    TryShowHintNear; //. попытаемся вывести подсказку где нибудь в стороне от фигуры
    Exit; //. ->
    end;
  // несколько раз пытаемся получить поле вывода и выбираем лучшее
  with BestExtent do begin
  Xmn:=0;Ymn:=0;
  Xmx:=0;Ymx:=0;
  end;
  cntTry:=0;
  for J:=0 to 299 do begin
    if flCancel then Exit; //. ->
    RndOfsX:=Random(Fig_Width);RndOfsY:=Random(Fig_Height);
    RndPoint.X:=Fig_Xmn+RndOfsX;RndPoint.Y:=Fig_Ymn+RndOfsY;
    if FigureHavePoint(RndPoint,I, flagVisiblePoint)
     then begin //. получаем поле вывода с рекомендуемыми размерами
      if flagVisiblePoint
       then begin
        GetBestExtentToPoint(RndPoint,SuggestExtent,false,false, Extent);
        if ExtentBetterAnother(Extent,BestExtent)
         then BestExtent:=Extent;
        end;
      Inc(cntTry);
      if cntTry >= cntTryToGetExtent then Break; //. >
      {/// ? if FReflector.flReflectionChanged
       then begin
        flCancel:=true;
        Exit; //. ->
        end;}
      end;
    //.
    Application.ProcessMessages;
    end;
  if NOT ExtentIsEmpty(BestExtent)
   then begin
    ShowHint(BestExtent, FItems[Index].Hint,FItems[Index].Figure.ColorFill); //. выводим подсказку
    FItems[Index].AlreadyReflected:=true;
    IncCntDoneAndShowProgress;
    end
   else
    TryShowHintNear; //. попытаемся вывести подсказку где нибудь в стороне от фигуры
  end;

begin
Randomize;
for I:=0 to Count-1 do begin
  if flCancel then Exit; //. ->
  with FItems[I] do begin
  if (Hint = '') OR AlreadyReflected then Continue;
  with FReflector.BMPBuffer.Canvas do begin
  Font.Size:=Hint_minFontSize;
  Sz:=TextExtent(Hint);
  end;
  with SuggestExtent do begin
  Xmn:=0;Ymn:=0;
  Xmx:=Sz.cx;Ymx:=Sz.cy;
  end;
  if Figure.flagLoop
   then TreateLoopedObject(I) //. обрабатываем замкнутую фигуру
   else TreateUnLoopedObject(I); //. обраб. разомкнутую фигуру
  end;
  end;
end;

procedure THintsVisibleObjects.Show;
var
  I: integer;
  flAllReflected: boolean;
begin
FReflector.PanelProgressShowHints.Show;
Application.ProcessMessages;
try
flCancel:=false;
repeat
  TryShow;
  //. seek for all reflected
  flAllReflected:=true;
  for I:=0 to Count-1 do
   if (FItems[I].Hint <> '') AND NOT FItems[I].AlreadyReflected  
    then begin
     flAllReflected:=false;
     Break; //. >
     end;
  //.
  Application.ProcessMessages;
until flAllReflected OR flCancel;
finally
FReflector.PanelProgressShowHints.Hide;
end;
end;


{TReflector}
procedure TReflector.ReflectHint;
var
  SC: TCursor;
begin
if Hints <> nil then Exit; //. ->
SC:=Screen.Cursor;
Screen.Cursor:=crHourGlass;
try
Hints:=THintsVisibleObjects.Create(Self);
finally
Screen.Cursor:=SC;
end;
with Hints do
try
Show;
finally
Destroy;
Hints:=nil;
end;
end;

procedure TReflector.GetShiftForClone(const OrgPoint: TPoint; out ShiftX,ShiftY: TCrd);
begin
ReflectionWindow.Lock.Enter;
try
ShiftX:=ReflectionWindow.Xcenter/cfTransMeter-OrgPoint.X;
ShiftY:=ReflectionWindow.Ycenter/cfTransMeter-OrgPoint.Y;
finally
ReflectionWindow.Lock.Leave;
end;
end;

procedure TReflector.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
WindowState:=wsMinimized;
if (Space.ReflectorsList.Count = 1)
 then begin
  try
  Space.Free(); 
  except
    end;
  TerminateProcess(GetCurrentProcess,0); 
  end
 else CanClose:=false;
end;

procedure TReflector.ShowAbondonedObjects(IDType: integer);
var
  TableName: string;
  Key_: integer;
  flFound: boolean;

  {procedure TreateObj(ptrObj: TPtr);
  var
    Obj: TSpaceObj;
    ptrOwnerObj: TPtr;
  begin
  Space.ReadObj(Obj,SizeOf(Obj), ptrObj);
  if (Obj.IDType = IDType) AND (Obj.idObj = Key_)
   then begin
    flFound:=true;
    Exit;
    end;

  ptrOwnerObj:=Obj.ptrListOwnerObj;
  While ptrOwnerObj <> nilPtr do begin
   TreateObj(ptrOwnerObj);
   if flFound then Exit;
   Space.ReadObj(ptrOwnerObj,SizeOf(TPtr), ptrOwnerObj);
   end;
  end;}

begin
Exit;
///
(*case IDType of
idTMainLine: TableName:=tnTMainLine;
///
{IDTypeDistrLine: TableName:=NTableDistrLines;
IDTypeBox: TableName:=NTableBoxes;
IDTypeCableBox: TableName:=NTableCableBoxes;
IDTypeCase: TableName:=NTableCases;}
else Exit;
end;
with Space.TObjPropsQuery_Create do begin
EnterSQL('SELECT Key_ FROM '+TableName);
Open;
while NOT EOF do begin
  Key_:=FieldValues['Key_'];
  flFound:=false;
  TreateObj(Space.ptrRootObj);
  if NOT flFound
   then ShowMessage(''+TableName+' id = '+IntToStr(Key_));
  Next;
  end;
Destroy;
end;*)
end;

procedure TReflector.FormResize(Sender: TObject);
begin
ChangeWidthHeight(Width,Height);
end;

procedure TReflector.SelectedObj__TPanelProps_Show;
var
  ObjFunctionality: TComponentFunctionality;
  idTROOT,idROOT: integer;
  VisOwnerFunctionality: TComponentFunctionality;
  SC: TCursor;

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
    with OwnerFunctionality do
    try
    PanelProps:=TPanelProps_Create(false, 0,nil,nilObject);
    with TAbstractSpaceObjPanelProps(PanelProps) do begin
    flFreeOnClose:=false;
    Left:=Round((Screen.Width-Width)/2);
    Top:=Screen.Height-Height-20;
    OnKeyDown:=Self.OnKeyDown;
    OnKeyUp:=Self.OnKeyUp;
    Show;
    end;
    lbSelectedObjName.Caption:=Name;
    /// - if Visible then SetFocus;
    finally
    Release;
    end;
    Result:=true;
    end
  end;
  end;

begin
//. delete old
PanelProps.Free;
PanelProps:=nil;
//. create new
SC:=Screen.Cursor;
Screen.Cursor:=crHourGlass;
try
if NOT PanelProps_Show(Space.Obj_IDType(ptrSelectedObj),Space.Obj_ID(ptrSelectedObj))
 then begin
  ObjFunctionality:=TComponentFunctionality_Create(Space.Obj_IDType(ptrSelectedObj),Space.Obj_ID(ptrSelectedObj));
  with ObjFunctionality do
  try
  if idObj <> 0
   then begin
    if PanelProps <> nil then TAbstractSpaceObjPanelProps(PanelProps).flFreeOnClose:=true;
    PanelProps:=TPanelProps_Create(false, 0,nil,nilObject);
    with TAbstractSpaceObjPanelProps(PanelProps) do begin
    flFreeOnClose:=false;
    Left:=Round((Screen.Width-Width)/2);
    Top:=Screen.Height-Height-20;
    OnKeyDown:=Self.OnKeyDown;
    OnKeyUp:=Self.OnKeyUp;
    Show;
    end;
    end;
  lbSelectedObjName.Caption:=Name;
  finally
  Release;
  end;
  Space.Obj_GetRoot(Space.Obj_IDType(ptrSelectedObj),Space.Obj_ID(ptrSelectedObj), idTROOT,idROOT);
  if idROOT <> 0 then PanelProps_Show(idTROOT,idROOT);
  end;
finally
Screen.Cursor:=SC;
end;
/// - if Visible then SetFocus;
end;

procedure TReflector.wmSysCommand;
begin
case Message.wParam of
ID_ShowConfiguration: with TfmReflectorCfg.Create(Self) do
  try
  ShowModal;
  finally
  Destroy;
  end;
end;
inherited;
end;

procedure TReflector.setStyle(Value: TReflectorStyle);
begin
case Value of
rsNative: begin
  cbEditing.Enabled:=true;
  //.
  pnlControl_Restore();
  pnlSelectedObjectEdit_Restore();
  end;
rsSpaceViewing: begin
  if (cbEditing.Checked) then cbEditing.Checked:=false;
  cbEditing.Enabled:=false;
  //.
  pnlControl_Minimize();
  pnlSelectedObjectEdit_Minimize();
  end;
end;
cbEditingAdvanced.Enabled:=false;
FStyle:=Value;
end;

procedure TReflector.cbStyleChange(Sender: TObject);
begin
Style:=TReflectorStyle(cbStyle.ItemIndex);
edCenterCrd.SetFocus();
end;

procedure TReflector.setMode(Value: TReflectorMode);
begin
cbEditing.Checked:=(Value = rmEditing);
cbEditingAdvanced.Enabled:=cbEditing.Checked;
FMode:=Value;
end;

procedure TReflector.setPtrSelectedObj(Value: TPtr);
var
  Obj: TSpaceObj;
  ObjFunctionality: TBase2DVisualizationFunctionality;
  idTOwner,idOwner: integer;
  OwnerFunctionality: TComponentFunctionality;
  SelectedObj_Name: shortstring;
  LayFunctionality: TLay2DVisualizationFunctionality;
  Lay,SubLay: integer;
  idTROOT,idROOT: integer;

  procedure SelectedObjects_AddNew;
  begin
  TfmSelectedObjects(fmSelectedObjects).InsertNew(Obj.idTObj,Obj.idObj,SelectedObj_Name,Value);
  end;

begin
if (Value = FptrSelectedObj) then Exit; //. ->
try
if Value = nilPtr
 then begin
  //. удаление объекта из списка выделенных объектов, т.к. объект удален (ptrSelectedObj:=nilPtr)
  TfmSelectedObjects(fmSelectedObjects).RemoveObject(FptrSelectedObj);
  FptrSelectedObj:=Value;
  //. deactivate pulsed selection
  PulsedSelection.Activate(nilPtr);
  //.
  sbSelectedObjAtCenter.Enabled:=false;
  SelectedObj_Name:='';
  lbSelectedObjName.Caption:=SelectedObj_Name;
  Exit; //. ->
  end;
FptrSelectedObj:=Value;
//.
sbSelectedObjAtCenter.Enabled:=true;
//. for reading from internet
if Space.Status in [pssRemoted,pssRemotedBrief] then Exit; //. ->
Space.ReadObj(Obj,SizeOf(Obj), FptrSelectedObj);
if (Obj.idTObj = 0) OR (Obj.idObj = 0)
 then begin
  SelectedObj_Name:='< detail >';
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
finally
cbWatcher.Checked:=false;
cbObjectTrack.Checked:=false;
end;
end;

procedure TReflector.sbSelectedObjAtCenterClick(Sender: TObject);
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
    PanelProps.Free;
    PanelProps:=TPanelProps_Create(false, 0,nil,nilObject);
    with TAbstractSpaceObjPanelProps(PanelProps) do begin
    flFreeOnClose:=false;
    Left:=Round((Screen.Width-Width)/2);
    Top:=Screen.Height-Height-20;
    OnKeyDown:=Self.OnKeyDown;
    OnKeyUp:=Self.OnKeyUp;
    Show;
    end;
    lbSelectedObjName.Caption:=Name;
    /// - if Visible then SetFocus;
    finally
    Release;
    end
   else begin
    PanelProps.Free;
    PanelProps:=TPanelProps_Create(false, 0,nil,nilObject);
    with TAbstractSpaceObjPanelProps(PanelProps) do begin
    flFreeOnClose:=false;
    Left:=Round((Screen.Width-Width)/2);
    Top:=Screen.Height-Height-20;
    OnKeyDown:=Self.OnKeyDown;
    OnKeyUp:=Self.OnKeyUp;
    Show;
    end;
    lbSelectedObjName.Caption:=Name;
    /// - if Visible then SetFocus;
    end;
  finally
  Release;
  end;
end;

procedure TReflector.tbSelectedObjectsClick(Sender: TObject);
begin
TfmSelectedObjects(fmSelectedObjects).DoExecutting;
end;

procedure TReflector.FormActivate(Sender: TObject);
begin
TTypesSystem(Space.TypesSystem).Reflector:=Self;
end;

procedure TReflector.FormDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
if (Source is TListView) then Accept:=true;
end;

procedure TReflector.FormDragDrop(Sender, Source: TObject; X, Y: Integer);
var
  SelectedObj: TSpaceObj;
  idTUseObj,idUseObj: integer;
  flOwnerExist: boolean;
  idClone: integer;
begin
FXMsLast:=X;
FYMsLast:=Y;   
//.
if TListView(Source).Name = 'lvImport'
 then begin
  DoOnFileDropped(TShellListView(Source).SelectedFolder.PathName);
  end;
end;

procedure TReflector._PaintReflectionWindow();
begin
//. following portion is transferred from TReflecting.BMP_Reflect(...) with modification
BitBlt(Canvas.Handle, 0,0,BMPBuffer.Width,BMPBuffer.Height,  BMPBuffer.Canvas.Handle, 0,0, SRCCOPY);
//. paint selected track node marker 
if (XYToGeoCrdConverter <> nil)
 then with TfmXYToGeoCrdConvertor(XYToGeoCrdConverter).GeoObjectTracks do begin
   ShowSelectedTrackNode(Canvas);
   ShowSelectedTrackStopOrMovementInterval(Canvas);
   end;
//. post message to show ObjectEditor
if (ObjectEditor <> nil) then ObjectEditor.Reflect();
//. paint selected region on reflector
if (SelectedRegion <> nil) then SelectedRegion.Paint();
//. post message to draw EditingOrCreatingObject
if (EditingOrCreatingObject <> nil) then EditingOrCreatingObject.Reflect(BMPBuffer);
end;

procedure TReflector.PaintReflectionWindow();
begin
BMPBuffer.Canvas.Lock;
try
Canvas.Lock;
try
_PaintReflectionWindow();
finally
Canvas.UnLock;
end;
finally
BMPBuffer.Canvas.UnLock;
end;
end;

procedure TReflector.FormPaint(Sender: TObject);
var
  CH: HDC;
begin
CH:=Canvas.Handle; //. save handle of locked canvas
Canvas.Unlock; //. workaround. canvas is locked by native code
try
//. following portion is transferred from TReflecting.BMP_Reflect(...) with modification
BMPBuffer.Canvas.Lock;
try
Canvas.Lock;
try
Canvas.Handle:=CH; //. assign DC that locked with canvas by calling routine
//.
_PaintReflectionWindow();
finally
Canvas.UnLock;
end;
finally
BMPBuffer.Canvas.UnLock;
end;
finally
Canvas.Lock;
end;
end;

procedure TReflector.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

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
  Left:=Round((Screen.Width-Width)/2);
  Top:=Screen.Height-Height-20;
  OnKeyDown:=Self.OnKeyDown;
  OnKeyUp:=Self.OnKeyUp;
  Show;
  end;
  /// - if Visible then SetFocus;
  finally
  Release;
  end
  end;

begin
case Key of
VK_ESCAPE: begin
  CloseAllComponentPanels;
  Key:=0;
  end;
VK_F1: ShowComponentPanelsOfSelectedObj;
end;
end;

procedure TReflector.RevisionReflectLocal(const ptrObj: TPtr; const Act: TRevisionAct);
begin
TReflecting(Reflecting).RevisionReflect(ptrObj,Act);
end;

procedure TReflector.RevisionReflect(const ptrObj: TPtr; const Act: TRevisionAct);
var
  Params: WideString;
begin
RevisionReflectLocal(ptrObj,Act);
TReflectorsList(Space.ReflectorsList).RevisionReflect(ptrObj,Act, ID);
end;

function TReflector.ReflectionID: longword;
begin
Result:=Reflecting.ReflectionID;
end;

procedure TReflector.CreateParams(var Params: TCreateParams);
begin
inherited;
with Params do
// By using the CS_OWNDC flag we tell Windows not to reset all our settings every time
// we access the window's DC. This enables to activate our rendering context just once (when the
// window is created) and not every time a paint cycle occurs.
// The redraw flags are necessary because the window needs a repaint on size change (viewport
// depends on window size).
WindowClass.Style := WindowClass.Style or CS_OWNDC;
end;


Const
  MenuPanelMinimizeHeight = 14;

procedure TReflector.Menu_Show;
begin
pnlControl.Show;
pnlBookmarks.Show;
pnlView.Show;
pnlSelectedObjectEdit.Show;
pnlCoordinateMesh.Show;
pnlOther.Show;
end;

procedure TReflector.Menu_Hide;
begin
pnlControl.Hide;
pnlBookmarks.Hide;
pnlView.Hide;
pnlSelectedObjectEdit.Hide;
pnlCoordinateMesh.Hide;
pnlOther.Hide;
end;

procedure TReflector.pnlControl_Minimize;
var
  Shift: integer;
begin
pnlControl.Top:=0;
Shift:=pnlBookmarks.Top-(pnlControl.Top+MenuPanelMinimizeHeight);
pnlBookmarks.Top:=pnlBookmarks.Top-Shift;
pnlView.Top:=pnlView.Top-Shift;
pnlSelectedObjectEdit.Top:=pnlSelectedObjectEdit.Top-Shift;
pnlCoordinateMesh.Top:=pnlCoordinateMesh.Top-Shift;
pnlOther.Top:=pnlOther.Top-Shift;
cbControl.Font.Style:=cbControl.Font.Style-[fsBold];
cbControl.Font.Color:=clGray;
end;

procedure TReflector.pnlControl_Restore;
var
  Shift: integer;
begin
pnlControl.Top:=0;
Shift:=pnlBookmarks.Top-(pnlControl.Top+121);
pnlBookmarks.Top:=pnlBookmarks.Top-Shift;
pnlView.Top:=pnlView.Top-Shift;
pnlSelectedObjectEdit.Top:=pnlSelectedObjectEdit.Top-Shift;
pnlCoordinateMesh.Top:=pnlCoordinateMesh.Top-Shift;
pnlOther.Top:=pnlOther.Top-Shift;
cbControl.Font.Style:=cbControl.Font.Style+[fsBold];
cbControl.Font.Color:=clBlack;
end;

procedure TReflector.cbControlMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
if Button = mbLeft
 then
  if fsBold in cbControl.Font.Style
   then pnlControl_Minimize
   else pnlControl_Restore;
end;

procedure TReflector.sbCreateObjectClick(Sender: TObject);
var
  SC: TCursor;
begin
SC:=Screen.Cursor;
Screen.Cursor:=crHourGlass;
try
with TfmCreatingObjects.Create(Self) do Show;
finally
Screen.Cursor:=SC;
end;
end;

procedure TReflector.sbImportClick(Sender: TObject);
var
  SC: TCursor;
begin
if (sbImport.Down)
 then begin
  if ((fmCreateObjectGallery <> nil) AND (fmCreateObjectGallery.Visible)) then fmCreateObjectGallery.Hide();
  end
 else begin
  if (fmCreateObjectGallery <> nil) then fmCreateObjectGallery.Visible:=sbShowHideCreateObjectGallery.Down;
  end;
//.
if (fmImportComponents = nil)
 then begin
  SC:=Screen.Cursor;
  Screen.Cursor:=crHourGlass;
  try
  fmImportComponents:=TfmImportComponents.Create(Self);
  with fmImportComponents do begin
  Top:=0;
  Left:=pnlControl.Left+pnlControl.Width;
  Width:=Self.ClientWidth-Left;
  Parent:=Self;
  end;
  finally
  Screen.Cursor:=SC;
  end;
  end;
fmImportComponents.Visible:=sbImport.Down;
end;

procedure TReflector.ddCreateObjectClick(Sender: TObject);
begin
popupCreateObject.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TReflector.sbShowHideCreateObjectGalleryClick(Sender: TObject);
var
  SC: TCursor;
begin
if (sbShowHideCreateObjectGallery.Down)
 then begin
  if (fmImportComponents <> nil) then if (fmImportComponents.Visible) then fmImportComponents.Hide();
  //.
  if (fmCreateObjectGallery = nil)
   then begin
    fmCreateObjectGallery:=TfmVisualizationsGallery.Create(Self);
    with TfmVisualizationsGallery(fmCreateObjectGallery) do begin
    SC:=Screen.Cursor;
    Screen.Cursor:=crHourGlass;
    try
    PrepareFromReflectorCreateObjects();
    OnDraggedVisualizationLeaveGallery:=DoOnDraggedVisualizationLeaveGallery;
    Parent:=Self;
    Left:=pnlControl.Left+pnlControl.Width;
    Top:=0;
    Width:=Self.ClientWidth-Left;
    //.
    UpdateView();
    //.
    BringToFront();
    Show();
    finally
    Screen.Cursor:=SC;
    end;
    end;
    end
   else fmCreateObjectGallery.Show();
  end
 else begin
  if (fmCreateObjectGallery <> nil) then fmCreateObjectGallery.Hide();
  //. restore importing
  if (fmImportComponents <> nil) then fmImportComponents.Visible:=sbImport.Down;
  end;
end;

procedure TReflector.DoOnDraggedVisualizationLeaveGallery(const Sender: TForm; const VisualizationPtr: TPtr; const X,Y: integer);
var
  ptrROOT: TPtr;
  idTPrototype,idPrototype: integer;
  idTOwner,idOwner: integer;
  Xbind,Ybind: integer;
  RX,RY: TCrd;
  NewPosition: Windows.TPoint;
  dX,dY: integer;
begin
ptrROOT:=Space.Obj_GetRootPtr(VisualizationPtr);
with TComponentFunctionality_Create(Space.Obj_IDType(ptrRoot),Space.Obj_ID(ptrRoot)) do
try
idTPrototype:=idTObj;
idPrototype:=idObj;
if (GetROOTOwner(idTOwner,idOwner))
 then begin
  idTPrototype:=idTOwner;
  idPrototype:=idOwner;
  end;
finally
Release;
end;
//.
Xbind:=Sender.Left+X;
YBind:=Sender.Top+Y;
//.
FreeAndNil(EditingOrCreatingObject);
EditingOrCreatingObject:=TEditingOrCreatingObject.Create(Self,true, idTPrototype,idPrototype, VisualizationPtr);
EditingOrCreatingObject.CreateCompletionObject:=GetCreateCompletionObject(idTPrototype,idPrototype);
//. setup new object for editing
ConvertScrExtendCrd2RealCrd(Xbind,Ybind, RX,RY);
EditingOrCreatingObject.SetPosition(RX,RY);
//. emulate mouse button press
ReleaseCapture;
SetCapture(Handle);
NewPosition:=ClientToScreen(Point(Xbind,YBind));
Mouse.CursorPos:=NewPosition;
Mouse_Event(MOUSEEVENTF_LEFTDOWN, 0,0,0,0);
end;

procedure TReflector.ValidateReflectionMouseElements();
begin
PostMessage(Handle, WM_VALIDATEREFLECTIONMOUSEELEMENTS,0,0);
end;

procedure TReflector.sbElectedObjectsGalleryClick(Sender: TObject);
var
  SC: TCursor;
begin
if (fmElectedObjectsGallery = nil)
 then begin
  fmElectedObjectsGallery:=TfmElectedObjectsGallery.Create(Self);
  with TfmElectedObjectsGallery(fmElectedObjectsGallery) do begin
  SC:=Screen.Cursor;
  Screen.Cursor:=crHourGlass;
  try
  Update();
  Parent:=Self;
  Left:=pnlControl.Left+pnlControl.Width;
  Width:=Self.ClientWidth-Left;
  if ((XYToGeoCrdConverter <> nil) AND (XYToGeoCrdConverter.Visible))
   then Top:=XYToGeoCrdConverter.Top-Height
   else
    if (StatusPanel.Visible)
     then Top:=StatusPanel.Top-Height
     else Top:=ClientHeight-Height;
  //.
  finally
  Screen.Cursor:=SC;
  end;
  end;
  end;
if (sbElectedObjectsGallery.Down)
 then begin
  fmElectedObjectsGallery.BringToFront();
  fmElectedObjectsGallery.Show();
  //. hide navigator panel
  if ((sbNavigator.Down) AND (Navigator <> nil)) then Navigator.Hide();
  end
 else begin
  fmElectedObjectsGallery.Hide();
  FreeAndNil(fmElectedObjectsGallery);
  //. restore navigator panel
  if ((sbNavigator.Down) AND ((Navigator <> nil) AND (Navigator.Tag = 0))) then Navigator.Show();
  end;
end;

procedure TReflector.pnlBookmarks_Minimize;
var
  Shift: integer;
begin
Shift:=pnlView.Top-(pnlBookmarks.Top+MenuPanelMinimizeHeight);
pnlView.Top:=pnlView.Top-Shift;
pnlSelectedObjectEdit.Top:=pnlSelectedObjectEdit.Top-Shift;
pnlCoordinateMesh.Top:=pnlCoordinateMesh.Top-Shift;
pnlOther.Top:=pnlOther.Top-Shift;
cbBookmarks.Font.Style:=cbBookmarks.Font.Style-[fsBold];
cbBookmarks.Font.Color:=clGray;
end;

procedure TReflector.pnlBookmarks_Restore;
var
  Shift: integer;
begin
Shift:=pnlView.Top-(pnlBookmarks.Top+128);
pnlView.Top:=pnlView.Top-Shift;
pnlSelectedObjectEdit.Top:=pnlSelectedObjectEdit.Top-Shift;
pnlCoordinateMesh.Top:=pnlCoordinateMesh.Top-Shift;
pnlOther.Top:=pnlOther.Top-Shift;
cbBookmarks.Font.Style:=cbBookmarks.Font.Style+[fsBold];
cbBookmarks.Font.Color:=clBlack;
end;

procedure TReflector.cbBookmarksMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
if Button = mbLeft
 then
  if fsBold in cbBookmarks.Font.Style
   then pnlBookmarks_Minimize
   else pnlBookmarks_Restore;
end;

procedure TReflector.sbElectedPlacesClick(Sender: TObject);
var
  ptrObj: TPtr;
  ReflectionWindowStruc: TReflectionWindowStruc;
  SC: TCursor;
begin
SC:=Screen.Cursor;
Screen.Cursor:=crHourGlass;
try
with TfmElectedPlaces.Create(Self) do begin
if Select(ReflectionWindowStruc)
 then begin
  with ReflectionWindow do begin
  if (False) /// ? (Xmn = ReflectionWindowStruc.Xmn) AND (Ymn = ReflectionWindowStruc.Ymn) AND (Xmx = ReflectionWindowStruc.Xmx) AND (Ymx = ReflectionWindowStruc.Ymx)
   then begin
    Reflecting.CancelRRR(); //. cancel reforming,reflecting,revising
    //.
    ReflectionWindow.AssignWindow(ReflectionWindowStruc);
    //.
    if (Reflecting.Configuration.BriefReflectingType = brtPartialWithLastReflection)
     then begin
      Reflecting.LastReflectedBitmap.BMP_Clear();
      DynamicHints.Clear();
      end;
    //.
    if (XYToGeoCrdConverter <> nil) then TfmXYToGeoCrdConvertor(XYToGeoCrdConverter).GeoObjectTracks.ClearSelectedItems(); 
    //.
    Reflecting.RecalcReflect;
    //.
    DoOnPositionChange();
    //.
    UpdateCompass();
    UpdateGeoCompass();
    end
   else
    ShiftingSetReflection((ReflectionWindowStruc.X0+ReflectionWindowStruc.X2)/2,(ReflectionWindowStruc.Y0+ReflectionWindowStruc.Y2)/2)
  end;
  end;
Destroy;
end;
finally
Screen.Cursor:=SC;
end;
end;

procedure TReflector.ddElectedPlacesClick(Sender: TObject);
begin
popupElectedPlaces.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TReflector.sbElectedObjectsClick(Sender: TObject);
var
  SC: TCursor;
begin
SC:=Screen.Cursor;
Screen.Cursor:=crHourGlass;
try
with TfmElectedObjects.Create(Self) do Show;
finally
Screen.Cursor:=SC;
end;
end;

procedure TReflector.ddElectedObjectsClick(Sender: TObject);
begin
popupElectedObjects.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TReflector.pnlView_Minimize;
var
  Shift: integer;
begin
Shift:=pnlSelectedObjectEdit.Top-(pnlView.Top+MenuPanelMinimizeHeight);
pnlSelectedObjectEdit.Top:=pnlSelectedObjectEdit.Top-Shift;
pnlCoordinateMesh.Top:=pnlCoordinateMesh.Top-Shift;
pnlOther.Top:=pnlOther.Top-Shift;
cbView.Font.Style:=cbView.Font.Style-[fsBold];
cbView.Font.Color:=clGray;
end;

procedure TReflector.pnlView_Restore;
var
  Shift: integer;
begin
Shift:=pnlSelectedObjectEdit.Top-(pnlView.Top+128);
pnlSelectedObjectEdit.Top:=pnlSelectedObjectEdit.Top-Shift;
pnlCoordinateMesh.Top:=pnlCoordinateMesh.Top-Shift;
pnlOther.Top:=pnlOther.Top-Shift;
cbView.Font.Style:=cbView.Font.Style+[fsBold];
cbView.Font.Color:=clBlack;
end;

procedure TReflector.cbViewMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
if Button = mbLeft
 then
  if fsBold in cbView.Font.Style
   then pnlView_Minimize
   else pnlView_Restore;
end;

procedure TReflector.sbConfigMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  SC: TCursor;
begin
if (Button = mbRight)
 then begin
  SC:=Screen.Cursor;
  Screen.Cursor:=crHourGlass;
  try
  TObjectReflectingCfg(Reflecting.ObjectConfiguration).ShowEditor();
  finally
  Screen.Cursor:=SC;
  end;
  end;
end;

procedure TReflector.sbConfigClick(Sender: TObject);
begin
TReflectorSuperLays(TObjectReflectingCfg(Reflecting.ObjectConfiguration).ReflectorSuperLays).GetControlPanel().Show();
end;

procedure TReflector.sbReflectionWindowActualityIntervalClick(Sender: TObject);
begin
if (ReflectionWindow_ActualityIntervalPanel = nil) then ReflectionWindow_ActualityIntervalPanel:=TfmReflectionWindowActualityIntervalPanel.Create(Self);
//.
ReflectionWindow_ActualityIntervalPanel.Left:=((Screen.WorkAreaWidth-ReflectionWindow_ActualityIntervalPanel.Width) DIV 2);
ReflectionWindow_ActualityIntervalPanel.Top:=(((Screen.WorkAreaHeight DIV 2)-ReflectionWindow_ActualityIntervalPanel.Height) DIV 2);
//.
ReflectionWindow_ActualityIntervalPanel.Show();
end;

procedure TReflector.sbHintsClick(Sender: TObject);
begin
ReflectHint;
end;

procedure TReflector.pnlSelectedObjectEdit_Minimize;
var
  Shift: integer;
begin
Shift:=pnlCoordinateMesh.Top-(pnlSelectedObjectEdit.Top+MenuPanelMinimizeHeight);
pnlCoordinateMesh.Top:=pnlCoordinateMesh.Top-Shift;
pnlOther.Top:=pnlOther.Top-Shift;
cbSelectedObjectEdit.Font.Style:=cbSelectedObjectEdit.Font.Style-[fsBold];
cbSelectedObjectEdit.Font.Color:=clGray;
end;

procedure TReflector.pnlSelectedObjectEdit_Restore;
var
  Shift: integer;
begin
Shift:=pnlCoordinateMesh.Top-(pnlSelectedObjectEdit.Top+pnlSelectedObjectEdit.Height);
pnlCoordinateMesh.Top:=pnlCoordinateMesh.Top-Shift;
pnlOther.Top:=pnlOther.Top-Shift;
cbSelectedObjectEdit.Font.Style:=cbSelectedObjectEdit.Font.Style+[fsBold];
cbSelectedObjectEdit.Font.Color:=clBlack;
end;

procedure TReflector.cbSelectedObjectEditMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
if Button = mbLeft
 then
  if fsBold in cbSelectedObjectEdit.Font.Style
   then pnlSelectedObjectEdit_Minimize
   else pnlSelectedObjectEdit_Restore;
end;

procedure TReflector.sbSelectedObjectPropsClick(Sender: TObject);
var
  SC: TCursor;
begin
SC:=Screen.Cursor;
Screen.Cursor:=crHourGlass;
try
if ptrSelectedObj <> nilPtr then ChangeVisiblePropsSelectedObj;
finally
Screen.Cursor:=SC;
end;
end;

procedure TReflector.sbSelectedObjectStandaloneEditorClick(Sender: TObject);
begin
if (ptrSelectedObj = nilPtr) then Exit; //. ->
with TfmReflectorObjectStandaloneEditor.Create(Self,ptrSelectedObj) do
try
ShowModal();
finally
Destroy;
end;
end;

procedure TReflector.sbSelectedObjectCreateDetailClick(Sender: TObject);
begin
popupDetailCreate.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TReflector.sbSelectedObjectDetailPropsClick(Sender: TObject);

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
  Left:=Round((Screen.Width-Width)/2);
  Top:=Screen.Height-Height-20;
  OnKeyDown:=Self.OnKeyDown;
  OnKeyUp:=Self.OnKeyUp;
  Show;
  end;
  /// - if Visible then SetFocus;
  finally
  Release;
  end
  end;

begin
ShowComponentPanelsOfSelectedObj;
end;

procedure TReflector.sbSelectedObjectDestroyPointClick(Sender: TObject);
begin
DeleteSelectedPointObj;
end;

procedure TReflector.sbShowDesignerClick(Sender: TObject);
begin
if fmDesigner = nil then fmDesigner:=TfmSpaceDesigner.Create(Self);
fmDesigner.Show;
end;

procedure TReflector.pnlCoordinateMesh_Minimize;
var
  Shift: integer;
begin
Shift:=pnlOther.Top-(pnlCoordinateMesh.Top+MenuPanelMinimizeHeight);
pnlOther.Top:=pnlOther.Top-Shift;
cbCoordinateMesh.Font.Style:=cbCoordinateMesh.Font.Style-[fsBold];
cbCoordinateMesh.Font.Color:=clGray;
end;

procedure TReflector.pnlCoordinateMesh_Restore;
var
  Shift: integer;
begin
Shift:=pnlOther.Top-(pnlCoordinateMesh.Top+64);
pnlOther.Top:=pnlOther.Top-Shift;
cbCoordinateMesh.Font.Style:=cbCoordinateMesh.Font.Style+[fsBold];
cbCoordinateMesh.Font.Color:=clBlack;
end;

procedure TReflector.cbCoordinateMeshMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
if Button = mbLeft
 then
  if fsBold in cbCoordinateMesh.Font.Style
   then pnlCoordinateMesh_Minimize
   else pnlCoordinateMesh_Restore;
end;

procedure TReflector.cbCoordinateMeshEnableClick(Sender: TObject);
begin
CoordinateMesh.flEnabled:=cbCoordinateMeshEnable.Checked;
end;

procedure TReflector.edCoordinateMeshStepKeyPress(Sender: TObject; var Key: Char);
var
  Step: Extended;
begin
if Key = #$0D
 then begin
  Step:=StrToFloat(edCoordinateMeshStep.Text);
  CoordinateMesh.SetParams(0,0,Step,Step);
  CoordinateMesh.flEnabled:=true;
  cbCoordinateMeshEnable.Checked:=true;
  end;
end;

procedure TReflector.pnlOther_Minimize;
begin
end;

procedure TReflector.pnlOther_Restore;
begin
end;

procedure TReflector.sbPrintClick(Sender: TObject);
begin
if MessageDlg('do you want to print the current view ?', mtConfirmation, [mbNo,mbYes], 0) = mrYes then PrintReflection;
end;

procedure TReflector.sbShowHintsCancelClick(Sender: TObject);
begin
if Hints <> nil then Hints.flCancel:=true;
end;

procedure TReflector.cbEditingClick(Sender: TObject);
var
  Xbind,Ybind: TCrd;
begin
if cbEditing.Checked
 then begin
  FreeAndNil(EditingOrCreatingObject);
  FreeAndNil(ObjectEditor);
  if (ptrSelectedObj <> nilPtr)
   then
    if (cbEditingAdvanced.Checked)
     then begin
      EditingOrCreatingObject:=TEditingOrCreatingObject.Create(Self,false, 0,0,ptrSelectedObj);
      EditingOrCreatingObject.Obj_GetBindPoint(ptrSelectedObj, Xbind,Ybind);
      EditingOrCreatingObject.SetPosition(Xbind,Ybind);
      end
     else ObjectEditor:=TObjectEditor.Create(Self,ptrSelectedObj);
  Mode:=rmEditing;
  end
 else begin
  if ((EditingOrCreatingObject <> nil) AND NOT EditingOrCreatingObject.flCreating) then FreeAndNil(EditingOrCreatingObject);
  FreeAndNil(ObjectEditor);
  Mode:=rmBrowsing;
  end;
if (Mode = rmEditing)
 then cbEditingAdvanced.Enabled:=true
 else cbEditingAdvanced.Enabled:=false;
Reflecting.Reflect;
end;

procedure TReflector.cbEditingAdvancedClick(Sender: TObject);
var
  Xbind,Ybind: TCrd;
begin
if cbEditingAdvanced.Checked
 then begin
  FreeAndNil(ObjectEditor);
  FreeAndNil(EditingOrCreatingObject);
  if (ptrSelectedObj <> nilPtr)
   then begin
    EditingOrCreatingObject:=TEditingOrCreatingObject.Create(Self,false, 0,0,ptrSelectedObj);
    EditingOrCreatingObject.Obj_GetBindPoint(ptrSelectedObj, Xbind,Ybind);
    EditingOrCreatingObject.SetPosition(Xbind,Ybind);
    end;
  end
 else begin
  FreeAndNil(ObjectEditor);
  if (EditingOrCreatingObject <> nil) AND NOT EditingOrCreatingObject.flCreating then FreeAndNil(EditingOrCreatingObject);
  if (ptrSelectedObj <> nilPtr) then ObjectEditor:=TObjectEditor.Create(Self,ptrSelectedObj);
  end;
end;

procedure TReflector.cbObjectTrackClick(Sender: TObject);
begin
Reflecting.Reflect();
end;

procedure TReflector.cbAutoAlignClick(Sender: TObject);
begin
//.
end;

procedure TReflector.sbNavigatorClick(Sender: TObject);
begin
Navigator.Visible:=sbNavigator.Down;
if (Navigator.Visible) then Navigator.BringToFront();
end;

procedure TReflector.sbDoAlignClick(Sender: TObject);
begin
DoAlignReflection;
end;

procedure TReflector.cbCompassClick(Sender: TObject);
begin
pnlCompass.Visible:=cbCompass.Checked;
end;

procedure TReflector.sbGeoCoordinatesClick(Sender: TObject);
begin
if (XYToGeoCrdConverter <> nil)
 then begin
  if (sbGeoCoordinates.Down)
   then begin
    XYToGeoCrdConverter.Left:=0;
    if (StatusPanel.Visible)
     then XYToGeoCrdConverter.Top:=StatusPanel.Top-XYToGeoCrdConverter.Height
     else XYToGeoCrdConverter.Top:=ClientHeight-XYToGeoCrdConverter.Height;
    XYToGeoCrdConverter.Width:=Self.ClientWidth;
    XYToGeoCrdConverter.Visible:=true;
    if ((fmElectedObjectsGallery <> nil) AND (fmElectedObjectsGallery.Visible))
     then fmElectedObjectsGallery.Top:=XYToGeoCrdConverter.Top-fmElectedObjectsGallery.Height;
    end
   else begin
    XYToGeoCrdConverter.Visible:=false;
    if ((fmElectedObjectsGallery <> nil) AND (fmElectedObjectsGallery.Visible))
     then begin
      if (StatusPanel.Visible)
       then fmElectedObjectsGallery.Top:=StatusPanel.Top-fmElectedObjectsGallery.Height
       else fmElectedObjectsGallery.Top:=ClientHeight-fmElectedObjectsGallery.Height;
      end;
    end;
  end;
Reflecting.RecalcReflect();
end;

procedure TReflector.LastPlaces_Destroy;
var
  ptrDestroyItem: pointer;
begin
NextPlaces_Destroy;
while LastPlacesPtr <> nil do begin
  ptrDestroyItem:=LastPlacesPtr;
  LastPlacesPtr:=TLastPlace(ptrDestroyItem^).ptrNext;
  FreeMem(ptrDestroyItem,SizeOf(TLastPlace));
  end;
sbHistoryBack.Enabled:=false;
if (Navigator <> nil) then TfmReflectorNavigator(Navigator).sbHistoryBack.Enabled:=false;
end;

procedure TReflector.NextPlaces_Destroy;
var
  ptrDestroyItem: pointer;
begin
while NextPlacesPtr <> nil do begin
  ptrDestroyItem:=NextPlacesPtr;
  NextPlacesPtr:=TLastPlace(ptrDestroyItem^).ptrNext;
  FreeMem(ptrDestroyItem,SizeOf(TLastPlace));
  end;
sbHistoryNext.Enabled:=false;
if (Navigator <> nil) then TfmReflectorNavigator(Navigator).sbHistoryNext.Enabled:=false;
end;

procedure TReflector.LastPlaces_Back;
var
  W: TReflectionWindowStrucEx;
  ptrItem: pointer;
begin
ReflectionWindow.GetWindow(true, W);
while LastPlacesPtr <> nil do with TLastPlace(LastPlacesPtr^) do
  if NOT ((Window.X0 = W.X0) AND (Window.Y0 = W.Y0))
   then begin
    Reflecting.CancelRRR(); //. cancel reforming,reflecting,revising
    //.
    with ReflectionWindow do begin
    Lock.Enter;
    try
    X0:=Window.X0*cfTransMeter;Y0:=Window.Y0*cfTransMeter;
    X1:=Window.X1*cfTransMeter;Y1:=Window.Y1*cfTransMeter;
    X2:=Window.X2*cfTransMeter;Y2:=Window.Y2*cfTransMeter;
    X3:=Window.X3*cfTransMeter;Y3:=Window.Y3*cfTransMeter;
    Normalize;
    Update;
    finally
    Lock.Leave;
    end;
    end;
    //.
    if (Reflecting.Configuration.BriefReflectingType = brtPartialWithLastReflection)
     then begin
      Reflecting.LastReflectedBitmap.BMP_Clear();
      DynamicHints.Clear();
      end;
    //.
    if (XYToGeoCrdConverter <> nil) then TfmXYToGeoCrdConvertor(XYToGeoCrdConverter).GeoObjectTracks.ClearSelectedItems(); 
    //.
    Reflecting.RecalcReflect;
    //.
    DoOnPositionChange();
    //.
    UpdateCompass;
    UpdateGeoCompass();
    //.
    flReflectionChanged:=true;
    flReflectionAligned:=false;
    //.
    ptrItem:=LastPlacesPtr;
    LastPlacesPtr:=TLastPlace(ptrItem^).ptrNext;
    //. move to next queue
    TLastPlace(ptrItem^).ptrNext:=NextPlacesPtr;
    NextPlacesPtr:=ptrItem;
    //.
    Break; //. >
    end
   else begin
    ptrItem:=LastPlacesPtr;
    LastPlacesPtr:=TLastPlace(ptrItem^).ptrNext;
    //. move to next queue
    TLastPlace(ptrItem^).ptrNext:=NextPlacesPtr;
    NextPlacesPtr:=ptrItem;
    //.
    end;
if LastPlacesPtr = nil
 then begin
  sbHistoryBack.Enabled:=false;
  if (Navigator <> nil) then TfmReflectorNavigator(Navigator).sbHistoryBack.Enabled:=false;
  end;
if NextPlacesPtr <> nil
 then begin
  sbHistoryNext.Enabled:=true;
  if (Navigator <> nil) then TfmReflectorNavigator(Navigator).sbHistoryNext.Enabled:=true;
  end;
end;

procedure TReflector.LastPlaces_Next;
var
  W: TreflectionWindowStrucEx;
  ptrItem: pointer;
begin
ReflectionWindow.GetWindow(true, W);
while NextPlacesPtr <> nil do with TLastPlace(NextPlacesPtr^) do
  if NOT ((Window.X0 = W.X0) AND (Window.Y0 = W.Y0))
   then begin
    Reflecting.CancelRRR(); //. cancel reforming,reflecting,revising
    //.
    with ReflectionWindow do begin
    Lock.Enter;
    try
    X0:=Window.X0*cfTransMeter;Y0:=Window.Y0*cfTransMeter;
    X1:=Window.X1*cfTransMeter;Y1:=Window.Y1*cfTransMeter;
    X2:=Window.X2*cfTransMeter;Y2:=Window.Y2*cfTransMeter;
    X3:=Window.X3*cfTransMeter;Y3:=Window.Y3*cfTransMeter;
    Normalize;
    Update;
    finally
    Lock.Leave;
    end;
    end;
    //.
    if (Reflecting.Configuration.BriefReflectingType = brtPartialWithLastReflection)
     then begin
      Reflecting.LastReflectedBitmap.BMP_Clear();
      DynamicHints.Clear();
      end;
    //.
    if (XYToGeoCrdConverter <> nil) then TfmXYToGeoCrdConvertor(XYToGeoCrdConverter).GeoObjectTracks.ClearSelectedItems();
    //.
    Reflecting.RecalcReflect;
    //.
    DoOnPositionChange();
    //.
    UpdateCompass();
    UpdateGeoCompass();
    //.
    flReflectionChanged:=true;
    flReflectionAligned:=false;
    //.
    ptrItem:=NextPlacesPtr;
    NextPlacesPtr:=TLastPlace(ptrItem^).ptrNext;
    //. move to back queue
    TLastPlace(ptrItem^).ptrNext:=LastPlacesPtr;
    LastPlacesPtr:=ptrItem;
    //.
    Break; //. >
    end
   else begin
    ptrItem:=NextPlacesPtr;
    NextPlacesPtr:=TLastPlace(ptrItem^).ptrNext;
    //. move to back queue
    TLastPlace(ptrItem^).ptrNext:=LastPlacesPtr;
    LastPlacesPtr:=ptrItem;
    //.
    end;
if NextPlacesPtr = nil
 then begin
  sbHistoryNext.Enabled:=false;
  if (Navigator <> nil) then TfmReflectorNavigator(Navigator).sbHistoryNext.Enabled:=false;
  end;
if LastPlacesPtr <> nil
 then begin
  sbHistoryBack.Enabled:=true;
  if (Navigator <> nil) then TfmReflectorNavigator(Navigator).sbHistoryBack.Enabled:=true;
  end;
end;

procedure TReflector.LastPlaces_Insert(const pWindow: TReflectionWindowStrucEx);
var
  ptrPlace: pointer;
begin
NextPlaces_Destroy;
GetMem(ptrPlace,SizeOf(TLastPlace));
with TLastPlace(ptrPlace^) do begin
ptrNext:=LastPlacesPtr;
Window:=pWindow;
end;
LastPlacesPtr:=ptrPlace;
sbHistoryBack.Enabled:=true;
if (Navigator <> nil) then TfmReflectorNavigator(Navigator).sbHistoryBack.Enabled:=true;
end;

function TReflector.LastPlaces_IsPlaceExist(const pWindow: TReflectionWindowStrucEx): boolean;
var
  ptrPlace: pointer;
begin
Result:=false;
ptrPlace:=LastPlacesPtr;
while (ptrPlace <> nil) do with TLastPlace(ptrPlace^) do begin
  if
    (Window.X0 = pWindow.X0) AND (Window.Y0 = pWindow.Y0) AND
    (Window.X1 = pWindow.X1) AND (Window.Y1 = pWindow.Y1) AND
    (Window.X2 = pWindow.X2) AND (Window.Y2 = pWindow.Y2) AND
    (Window.X3 = pWindow.X3) AND (Window.Y3 = pWindow.Y3)
   then begin
    Result:=true;
    Exit; //. ->
    end;
  ptrPlace:=ptrNext;
  end;
end;

type
  TMyCriticalSection = class(TCriticalSection)
  private
    function TryEnter: boolean;
  end;

function TMyCriticalSection.TryEnter: boolean;
begin
Result:=TryEnterCriticalSection(FSection);
end;

procedure TReflector.DoOnMouseOver(const X,Y: integer);

  function GetObject(const X,Y: integer; out ptrObj: TPtr): boolean;
  var
    ActualityInterval: TComponentActualityInterval;
    P: TScreenNode;
    ptrReflLay: pointer;
    ptrItem: pointer;
  begin
  Result:=false;
  ActualityInterval:=ReflectionWindow.GetActualityInterval();
  P.X:=X; P.Y:=Y;
  if (NOT TMyCriticalSection(Reflecting.Lock).TryEnter()) then Exit; //. -> false exit if layers is locked (for example by a long time Reflecting process) ->
  try
  ptrReflLay:=Reflecting.Lays;
  while (ptrReflLay <> nil) do with TLayReflect(ptrReflLay^) do begin
    ptrItem:=Objects;
    while (ptrItem <> nil) do begin
      with TItemLayReflect(ptrItem^) do begin
      if (Space.Obj_IsCached(ptrObject) AND (((Window.Xmn < P.X) AND (P.X < Window.Xmx)) AND ((Window.Ymn < P.Y) AND (P.Y < Window.Ymx))) AND Space.Obj_ActualityInterval_IsActualForTimeInterval(ptrObject,ActualityInterval) AND ((Space.Obj_IDType(ptrObject) <> idTHINTVisualization) OR ((Mode = rmEditing) OR (NOT DynamicHints.flEnabled) OR ((EditingOrCreatingObject <> nil) AND (EditingOrCreatingObject.PrototypePtr = ptrObject)))))
       then begin
        Reflecting.Obj_PrepareFigures(ptrObject, ReflectionWindow,Reflecting.WindowRefl, Reflecting.FigureWinRefl,Reflecting.AdditiveFigureWinRefl);
        if (Reflecting.FigureWinRefl.flagLoop AND Reflecting.FigureWinRefl.flagFill AND (Reflecting.FigureWinRefl.CountScreenNodes > 2) AND Reflecting.FigureWinRefl.PointIsInside(P))
         then begin
          ptrObj:=ptrObject;
          Result:=true;
          end
         else
          if ((Reflecting.AdditiveFigureWinRefl.CountScreenNodes > 0) AND Reflecting.AdditiveFigureWinRefl.PointIsInside(P))
           then begin
            ptrObj:=ptrObject;
            Result:=true;
            end;
        end;
      end;
      //. go to next item
      ptrItem:=TItemLayReflect(ptrItem^).ptrNext;
      end;
    ptrReflLay:=ptrNext;
    end;
  finally
  Reflecting.Lock.Leave;
  end;
  end;

var
  ptrObj: TPtr;
  Obj: TSpaceObj;
begin
try
OverObjectPtr:=nilPtr;
try
if (GetObject(X,Y, ptrObj))
 then begin
  OverObjectPtr:=ptrObj;
  //.
  Space.ReadObj(Obj,SizeOf(Obj), ptrObj);
  with TBaseVisualizationFunctionality(TComponentFunctionality_Create(Obj.idTObj,Obj.idObj)) do
  try
  if (NOT DoOnOver()) then Cursor:=crDefault;
  finally
  Release();
  end;
  end;
finally
case Style of
rsNative: begin
  if ((ObjectEditor = nil) AND (EditingOrCreatingObject = nil))
   then ObjectHighlighting.HighlightObject(OverObjectPtr);
  end;
rsSpaceViewing: begin
  end;
end;
end;
except
  end;
end;

procedure TReflector.sbHistoryBackClick(Sender: TObject);
begin
LastPlaces_Back;
HistoryTimer.Enabled:=false;
HistoryTimer.Enabled:=true;
end;

procedure TReflector.sbHistoryNextClick(Sender: TObject);
begin
LastPlaces_Next;
HistoryTimer.Enabled:=false;
HistoryTimer.Enabled:=true;
end;

procedure TReflector.HistoryTimerTimer(Sender: TObject);
var
  W: TReflectionWindowStrucEx;
begin
ReflectionWindow.GetWindow(true, W);
if NOT LastPlaces_IsPlaceExist(W) then LastPlaces_Insert(W);
end;

procedure TReflector.Timer100MsecTimer(Sender: TObject);
const
  AutoAlignCount = 5;
  WatcherUpdateCount = 15;
var
  Obj: TSpaceObj;
  Point: TPoint;
begin
try
if ((Timer100Msec.Tag MOD AutoAlignCount) = 0) AND cbAutoAlign.Checked AND NOT flReflectionAligned then DoAlignReflection; if ((Timer100Msec.Tag MOD WatcherUpdateCount) = 0) AND cbWatcher.Checked AND (ptrSelectedObj <> nilPtr)  then
  try
  Space.ReadObj(Obj,SizeOf(Obj),ptrSelectedObj);
  if (Obj.ptrFirstPoint <> nilPtr)
   then begin
    Space.ReadObj(Point,SizeOf(Point),Obj.ptrFirstPoint);
    if (Watcher_ObjPtr = ptrSelectedObj)
     then begin
      if (NOT (((Watcher_BindingPoint.X = Point.X) AND (Watcher_BindingPoint.Y = Point.Y)) AND ((Watcher_ReflectionWindowXc = ReflectionWindow.Xcenter) AND (Watcher_ReflectionWindowYc = ReflectionWindow.Ycenter))))
       then begin
        ShowObjAtCenter(ptrSelectedObj);
        //.
        Watcher_BindingPoint:=Point;
        Watcher_ReflectionWindowXc:=ReflectionWindow.Xcenter;
        Watcher_ReflectionWindowYc:=ReflectionWindow.Ycenter;
        //.
        ObjectTrack.AddItem(Point.X,Point.Y);
        end;
      end
     else begin
      ShowObjAtCenter(ptrSelectedObj);
      //.
      Watcher_ObjPtr:=ptrSelectedObj;
      Watcher_BindingPoint:=Point;
      Watcher_ReflectionWindowXc:=ReflectionWindow.Xcenter;
      Watcher_ReflectionWindowYc:=ReflectionWindow.Ycenter;
      //.
      ObjectTrack.Clear();
      ObjectTrack.AddItem(Point.X,Point.Y);
      end;
    end;
  except
    end;
if ((Timer100Msec.Tag MOD TUserDynamicHint_ObjChange_TimeCounter) = 0)
 then DynamicHints.UserDynamicHints.UpdateItemsChangeState(Now-TUserDynamicHint_ObjChange_TimeDelta);
finally
Timer100Msec.Tag:=Timer100Msec.Tag+1;
end;
end;

procedure TReflector.DoOnFileDropped(FName: string);

  function IsLinkFile(const FileName: string): boolean;
  var
    Ext: string;
  begin
  Ext:=ANSIUpperCase(ExtractFileExt(FileName));
  Result:=(Ext = '.LNK');
  end;

  procedure GetLinkFileDistFile(var FileName: string);
  type
    TShellLinkInfoStruct = packed record
      FullPathAndNameOfLinkFile: array[0..MAX_PATH] of Char;
      FullPathAndNameOfFileToExecute: array[0..MAX_PATH] of Char;
      ParamStringsOfFileToExecute: array[0..MAX_PATH] of Char;
      FullPathAndNameOfWorkingDirectroy: array[0..MAX_PATH] of Char;
      Description: array[0..MAX_PATH] of Char;
      FullPathAndNameOfFileContiningIcon: array[0..MAX_PATH] of Char;
      IconIndex: Integer;
      HotKey: Word;
      ShowCommand: Integer;
      FindData: TWIN32FINDDATA;
    end;
  var
    I: integer;
    ShellLink: IShellLink;
    PersistFile: IPersistFile;
    AnObj: IUnknown;
    LinkInfo: TShellLinkInfoStruct;
  begin
  FillChar(LinkInfo, SizeOf(LinkInfo), #0);
  for I:=0 to Length(FileName)-1 do begin
    LinkInfo.FullPathAndNameOfLinkFile[I]:=FileName[I+1];
    ///LinkInfo.FullPathAndNameOfLinkFile[2*I+1]:=#0;
    end;
  //. access to the two interfaces of the object
  AnObj:=CreateComObject(CLSID_ShellLink);
  ShellLink:=AnObj as IShellLink;
  PersistFile :=AnObj as IPersistFile;
  //. Opens the specified file and initializes an object from the file contents.
  PersistFile.Load(PWChar(WideString(LinkInfo.FullPathAndNameOfLinkFile)), STGM_READ);
  with ShellLink do begin
  //. Retrieves the path and file name of a Shell link object.
  GetPath(@LinkInfo.FullPathAndNameOfFileToExecute,
    SizeOf(LinkInfo.FullPathAndNameOfFileToExecute),
    LinkInfo.FindData,
    SLGP_RAWPATH{SLGP_UNCPRIORITY});
  //. Retrieves the description string for a Shell link object.
  GetDescription(LinkInfo.Description,
    SizeOf(LinkInfo.Description));
  //. Retrieves the command-line arguments associated with a Shell link object.
  GetArguments(LinkInfo.ParamStringsOfFileToExecute,
    SizeOf(LinkInfo.ParamStringsOfFileToExecute));
  //. Retrieves the name of the working directory for a Shell link object.
  GetWorkingDirectory(LinkInfo.FullPathAndNameOfWorkingDirectroy,
    SizeOf(LinkInfo.FullPathAndNameOfWorkingDirectroy));
  //. Retrieves the location (path and index) of the icon for a Shell link object.
  GetIconLocation(LinkInfo.FullPathAndNameOfFileContiningIcon,
    SizeOf(LinkInfo.FullPathAndNameOfFileContiningIcon),
    LinkInfo.IconIndex);
  //. Retrieves the hot key for a Shell link object.
  GetHotKey(LinkInfo.HotKey);
  //. Retrieves the show (SW_) command for a Shell link object.
  GetShowCmd(LinkInfo.ShowCommand);
  //. get result
  FileName:=LinkInfo.FullPathAndNameOfFileToExecute;
  end;
  end;

  function IsImportFile(const FileName: string): boolean;
  var
    Ext: string;
  begin
  Ext:=ANSIUpperCase(ExtractFileExt(FileName));
  Result:=(Ext = '.XML');
  end;

  procedure ImportComponentsByFile(const FileName: string);
  var
    CL: TComponentsList;
    ObjFunctionality: TComponentFunctionality;
    VCL: TComponentsList;
    RX,RY: TCrd;
    I: integer;
    flMainVisualization: boolean;
    CoComponentPanelProps: TForm;
  begin
  Space.Log.OperationStarting('import components from file - "'+ExtractFileName(FileName)+'"');
  try
  TypesSystem.DoImportComponents(Space.UserName,Space.UserPassword, FileName, CL);
  try
  flMainVisualization:=true;
  for I:=0 to CL.Count-1 do with TItemComponentsList(CL[I]^) do begin
    ObjFunctionality:=TComponentFunctionality_Create(idTComponent,idComponent);
    with ObjFunctionality do
    try
    if ObjectIsInheritedFrom(ObjFunctionality,TBase2DVisualizationFunctionality)
     then with TBase2DVisualizationFunctionality(ObjFunctionality) do
      if flMainVisualization
       then begin
        FreeAndNil(EditingOrCreatingObject);
        EditingOrCreatingObject:=TEditingOrCreatingObject.Create(Self,false, idTObj,idObj,Ptr);
        //. setup new object for editing
        ConvertScrExtendCrd2RealCrd(FXMsLast,FYMsLast, RX,RY);
        EditingOrCreatingObject.SetPosition(RX,RY);
        EditingOrCreatingObject.DoAlign;
        //.
        flMainVisualization:=false;
        end
       else with EditingOrCreatingObject do begin
        if AdditionalObjectsList = nil then AdditionalObjectsList:=TComponentsList.Create;
        TComponentsList(AdditionalObjectsList).AddComponent(idTObj,idObj,0); 
        end
     else begin
      QueryComponents(TBase2DVisualizationFunctionality, VCL);
      if VCL <> nil
       then
        try
        if VCL.Count > 0
         then with TBase2DVisualizationFunctionality(TComponentFunctionality_Create(TItemComponentsList(VCL[0]^).idTComponent,TItemComponentsList(VCL[0]^).idComponent)) do
          try
          if flMainVisualization
           then begin
            FreeAndNil(EditingOrCreatingObject);
            EditingOrCreatingObject:=TEditingOrCreatingObject.Create(Self,false, idTObj,idObj,Ptr);
            //. setup new object for editing
            ConvertScrExtendCrd2RealCrd(FXMsLast,FYMsLast, RX,RY);
            EditingOrCreatingObject.SetPosition(RX,RY);
            EditingOrCreatingObject.DoAlign;
            //.
            flMainVisualization:=false;
            end
           else with EditingOrCreatingObject do begin
            if AdditionalObjectsList = nil then AdditionalObjectsList:=TComponentsList.Create;
            TComponentsList(AdditionalObjectsList).AddComponent(idTObj,idObj,0);
            end
          finally
          Release;
          end
         else
        finally
        VCL.Destroy;
        end;
      end;
    //. props panel showing
    CoComponentPanelProps:=nil;  
    if (idTObj = idTCoComponent)
     then begin
      Space.Log.OperationStarting('loading ..........');
      try
      try
      CoComponentPanelProps:=Space.Plugins___CoComponent__TPanelProps_Create(TypesFunctionality.CoComponentFunctionality_idCoType(idObj),idObj);
      except
        FreeAndNil(CoComponentPanelProps);
        end;
      if CoComponentPanelProps <> nil
       then with CoComponentPanelProps do begin
        Left:=Round((Screen.Width-Width)/2);
        Top:=Screen.Height-Height-20;
        Show;
        end;
      finally
      Space.Log.OperationDone;
      end;
      end;
    if CoComponentPanelProps = nil
     then with TPanelProps_Create(false, 0,nil,nilObject) do begin
      Left:=Round((Screen.Width-Width)/2);
      Top:=Screen.Height-Height-20;
      Show;
      end;
    finally
    Release;
    end;
    end;
  finally
  CL.Destroy;
  end;
  finally
  Space.Log.OperationDone;
  end;
  end;

  procedure StartCreateCoComponentByFile(const FileName: string);
  var
    idCoPrototype: integer;
    ObjFunctionality: TComponentFunctionality;
    VCL: TComponentsList;
    RX,RY: TCrd;
  begin
  if NOT Space.Plugins_CanCreateCoComponentByFile(FileName, idCoPrototype) then Raise Exception.Create('can not create the object: unsupported file type'); //. =>
  ObjFunctionality:=TComponentFunctionality_Create(idTCoComponent,idCoPrototype);
  with ObjFunctionality do
  try
  if ObjectIsInheritedFrom(ObjFunctionality,TBase2DVisualizationFunctionality)
   then with TBase2DVisualizationFunctionality(ObjFunctionality) do begin
    FreeAndNil(EditingOrCreatingObject);
    EditingOrCreatingObject:=TEditingOrCreatingObject.Create(Self,true, ObjFunctionality.idTObj,ObjFunctionality.idObj,Ptr);
    //. setup new object for editing
    ConvertScrExtendCrd2RealCrd(FXMsLast,FYMsLast, RX,RY);
    EditingOrCreatingObject.SetPosition(RX,RY);
    EditingOrCreatingObject.LoadFileAfterCreate:=FileName;
    end
   else begin
    QueryComponents(TBase2DVisualizationFunctionality, VCL);
    if VCL <> nil
     then
      try
      if VCL.Count > 0
       then with TBase2DVisualizationFunctionality(TComponentFunctionality_Create(TItemComponentsList(VCL[0]^).idTComponent,TItemComponentsList(VCL[0]^).idComponent)) do
        try
        FreeAndNil(EditingOrCreatingObject);
        EditingOrCreatingObject:=TEditingOrCreatingObject.Create(Self,true, ObjFunctionality.idTObj,ObjFunctionality.idObj,Ptr);
        //. setup new object for editing
        ConvertScrExtendCrd2RealCrd(FXMsLast,FYMsLast, RX,RY);
        EditingOrCreatingObject.SetPosition(RX,RY);
        EditingOrCreatingObject.LoadFileAfterCreate:=FileName;
        finally
        Release;
        end
       else
      finally
      VCL.Destroy;
      end;
    end
  finally
  Release;
  end
  end;

begin
if IsLinkFile(FName) then GetLinkFileDistFile(FName);
//. start operation
if IsImportFile(FName)
 then ImportComponentsByFile(FName)
 else StartCreateCoComponentByFile(FName);
end;
  
procedure TReflector.wmDropFiles(var Msg: TMessage);
var
  i,n: DWord;
  Size: DWord;
  FName: String;
  HDrop: DWord;
begin
HDrop:=Msg.WParam;
n:=DragQueryFile(HDrop,$FFFFFFFF,NIL,0);
for i:=0 to n-1 do begin
  Size:=DragQueryFile(HDrop,i,NIL,0);
  if Size < 255
   then begin
    SetLength(FName,Size);
    DragQueryFile(HDrop,i,@FName[1],Size + 1);
    //.
    DoOnFileDropped(FName);
    end;
  end;
Msg.Result:=0;
inherited;
end;

procedure TReflector.wmReflectObjectEditor(var Message: TMessage);
begin
if (ObjectEditor <> nil) then ObjectEditor._Reflect();
end;

procedure TReflector.wmValidateReflectionMouseElements(var Message: TMessage);
begin
case Style of
rsNative: begin
  ObjectHighlighting.UpdateHighlightObject();
  end;
rsSpaceViewing: begin
  end;
end;
DoOnMouseOver(FXMsLast,FYMsLast);
end;

procedure TReflector.UpdateCompass;
var
  Lat,Long, Lat1,Long1: Double;
  Angle: Extended;
  Grd: integer;
  Index: integer;
begin
if (NOT pnlCompass.Visible) then Exit; //. ->
ReflectionWindow.Lock.Enter;
try
Lat:=ReflectionWindow.Y0;
Long:=ReflectionWindow.X0;
Lat1:=ReflectionWindow.Y3;
Long1:=ReflectionWindow.X3;
finally
ReflectionWindow.Lock.Leave;
end;
//.
if (Lat1-Lat) <> 0
 then begin
  Angle:=Arctan((Long1-Long)/(Lat1-Lat));
  if ((Lat1-Lat) < 0) AND ((Long1-Long) > 0) then Angle:=Angle+PI else
  if ((Lat1-Lat) < 0) AND ((Long1-Long) < 0) then Angle:=Angle+PI else
  if ((Lat1-Lat) > 0) AND ((Long1-Long) < 0) then Angle:=Angle+2*PI;
  end
 else
  if (Long1-Long) >= 0
   then Angle:=PI/2
   else Angle:=3*PI/2;
Angle:=(2*PI-Angle)+PI;
while Angle > 2*PI do Angle:=Angle-2*PI;
CompassAngle:=Angle;
Index:=Round(gaCompass.Image.Count*(Angle/(2*PI)));
if Index = gaCompass.Image.Count then Index:=0;
gaCompass.FrameIndex:=Index;
gaCompass.Update;
Grd:=Round(Angle*180/PI); if Grd = 360 then Grd:=0;
lbCompassAngle.Caption:=IntToStr(Grd);
lbCompassAngle.Update();
end;

procedure TReflector.UpdateGeoCompass;
begin
if ((XYToGeoCrdConverter <> nil) AND (XYToGeoCrdConverter.Visible)) then TfmXYToGeoCrdConvertor(XYToGeoCrdConverter).UpdateCompass;
end;

procedure TReflector.sbAlignToNorthClick(Sender: TObject);
var
  Lat,Long, Lat1,Long1: Double;
  Angle: Extended;
  GAMMA: Extended;
begin
ReflectionWindow.Lock.Enter;
try
Lat:=ReflectionWindow.Y3;
Long:=ReflectionWindow.X3;
Lat1:=ReflectionWindow.Y0;
Long1:=ReflectionWindow.X0;
finally
ReflectionWindow.Lock.Leave;
end;
//.
if (Lat1-Lat) <> 0
 then begin
  Angle:=Arctan((Long1-Long)/(Lat1-Lat));
  if ((Lat1-Lat) < 0) AND ((Long1-Long) > 0) then Angle:=Angle+PI else
  if ((Lat1-Lat) < 0) AND ((Long1-Long) < 0) then Angle:=Angle+PI else
  if ((Lat1-Lat) > 0) AND ((Long1-Long) < 0) then Angle:=Angle+2*PI;
  end
 else
  if (Long1-Long) >= 0
   then Angle:=PI/2
   else Angle:=-PI/2;
GAMMA:=-Angle;
if GAMMA < -PI
 then
  GAMMA:=GAMMA+2*PI
 else
  if GAMMA > PI
   then
    GAMMA:=GAMMA-2*PI;
while Abs(GAMMA) > PI/32 do begin
  RotateReflection(PI/32*(GAMMA/Abs(GAMMA)));
  GAMMA:=GAMMA-PI/32*(GAMMA/Abs(GAMMA));
  //.
  /// ? Sleep(15);
  /// ? Application.ProcessMessages;
  end;
RotateReflection(GAMMA);
end;

function TReflector.GetObjAsOwnerComponent(ptrObj: TPtr; out oidTObj,oidObj: integer): boolean;
var
  ptrROOT: TPtr;
  ptrOwner: TPtr;
  idTOwner,idOwner: integer;
begin
Result:=false;
ptrROOT:=Space.Obj_GetRootPtr(ptrObj);
while ptrObj <> ptrROOT do begin
  with TComponentFunctionality_Create(Space.Obj_IDType(ptrObj),Space.Obj_ID(ptrObj)) do
  try
  if GetOwner(idTOwner,idOwner)
   then begin
    oidTObj:=idTObj;
    oidObj:=idObj;
    Result:=true;
    Exit; //. ->
    end;
  finally
  Release;
  end;
  ptrObj:=Space.Obj_Owner(ptrObj);
  end;
end;

procedure TReflector.tbVisibilityFactorChange(Sender: TObject);
begin
SetVisibilityFactor((1 SHL (tbVisibilityFactor.Max-tbVisibilityFactor.Position)));
end;

procedure TReflector.tbDynamicHintsVisibilityChange(Sender: TObject);
begin
with tbDynamicHintsVisibility do begin
DynamicHints.SetVisibleFactor((Max-Position)/Max);
end;
end;

procedure TReflector.sbUserDynamicHintsClick(Sender: TObject);
begin
DynamicHints.UserDynamicHints.ShowControlPanel();
end;





{TEditingObjectHandles}
Constructor TEditingObjectHandles.Create(pEditingOrCreatingObject: TEditingOrCreatingObject);
var
  I: TEditingMode;
begin
Inherited Create;
EditingOrCreatingObject:=pEditingOrCreatingObject;
//. setting handles
for I:=Low(TEditingMode) to High(TEditingMode) do Handles[I].Enabled:=false;
with Handles[emNone] do begin
Enabled:=true;
LRSize:=0;
TDSize:=0;
Color:=clNone;
end;
with Handles[emMoving] do begin
Enabled:=true;
Color:=clNone;
end;
with Handles[emScaling] do begin
Enabled:=(NOT EditingOrCreatingObject.flDisableScaling);
dR:=2;
Color:=clGray;
end;
with Handles[emRotating] do begin
Enabled:=(NOT EditingOrCreatingObject.flDisableRotating);
dR:=Handles[emScaling].dR*3;
Color:=clAqua;
end;
end;

Destructor TEditingObjectHandles.Destroy;
begin
Inherited;
end;

procedure TEditingObjectHandles.Reflect(Canvas: TCanvas);

  function NormalizeRToFitInScreen(const Rmaxscr: Extended): Extended;
  const
    FitFactor = 0.75;
    MinSizeLimit = 100;
  var
    MinSize: Extended;
    R: Extended;
  begin
  Result:=Rmaxscr;
  //.
  MinSize:=EditingOrCreatingObject.BindMarkerX;
  if (EditingOrCreatingObject.BindMarkerY < MinSize) then MinSize:=EditingOrCreatingObject.BindMarkerY;
  if ((EditingOrCreatingObject.Reflector.Width-EditingOrCreatingObject.BindMarkerX) < MinSize) then MinSize:=(EditingOrCreatingObject.Reflector.Width-EditingOrCreatingObject.BindMarkerX);
  if ((EditingOrCreatingObject.Reflector.Height-EditingOrCreatingObject.BindMarkerY) < MinSize) then MinSize:=(EditingOrCreatingObject.Reflector.Height-EditingOrCreatingObject.BindMarkerY);
  R:=MinSize*FitFactor;
  if (Rmaxscr > R)
   then begin
    {///? if (R >= MinSizeLimit)
     then Result:=R
     else Result:=MinSizeLimit;}
    Result:=R;
    end;
  end;

var
  _X,_Y: Extended;
begin
//.
with Handles[emMoving] do begin
X:=EditingOrCreatingObject.X;
Y:=EditingOrCreatingObject.Y;
R:=NormalizeRToFitInScreen(EditingOrCreatingObject.Rmaxscr);
end;
with Handles[emScaling] do begin
X:=EditingOrCreatingObject.X;
Y:=EditingOrCreatingObject.Y;
R:=Handles[emMoving].R+dR;
end;
with Handles[emRotating] do begin
X:=EditingOrCreatingObject.X;
Y:=EditingOrCreatingObject.Y;
R:=Handles[emScaling].R;
end;
//.
if (Handles[emMoving].Enabled)
 then with Handles[emMoving],Canvas do begin
  end;
if (true) //. show Scaling handle anyway as object handle (Handles[emScaling].Enabled)
 then with Handles[emScaling],Canvas do begin
  Pen.Color:=TColor($008080FF);
  Pen.Style:=psSolid;
  Pen.Width:=Round(2*dR);
  Brush.Style:=bsClear;
  Ellipse(Round(EditingOrCreatingObject.BindMarkerX-R),Round(EditingOrCreatingObject.BindMarkerY-R),Round(EditingOrCreatingObject.BindMarkerX+R),Round(EditingOrCreatingObject.BindMarkerY+R));
  Pen.Color:=clMaroon;
  Pen.Width:=1;
  Pen.Style:=psDot;
  Ellipse(Round(EditingOrCreatingObject.BindMarkerX-R-dR),Round(EditingOrCreatingObject.BindMarkerY-R-dR),Round(EditingOrCreatingObject.BindMarkerX+R+dR),Round(EditingOrCreatingObject.BindMarkerY+R+dR));
  Ellipse(Round(EditingOrCreatingObject.BindMarkerX-R+dR),Round(EditingOrCreatingObject.BindMarkerY-R+dR),Round(EditingOrCreatingObject.BindMarkerX+R-dR),Round(EditingOrCreatingObject.BindMarkerY+R-dR));
  end;
if (Handles[emRotating].Enabled)
 then with Handles[emRotating],Canvas do begin
  Pen.Style:=psSolid;
  Pen.Width:=1;
  Pen.Color:=TColor($00400080);
  Brush.Color:=TColor($008000FF);
  Brush.Style:=bsSolid;
  try
  _X:=EditingOrCreatingObject.BindMarkerX+R*Cos(EditingOrCreatingObject.Angle);
  _Y:=EditingOrCreatingObject.BindMarkerY+R*Sin(EditingOrCreatingObject.Angle);
  except
    /// ? sometimes exceptions here
    end;
  Ellipse(Rect(Round(_X-dR),Round(_Y-dR),Round(_X+dR),Round(_Y+dR)));
  end;
end;

function TEditingObjectHandles.CheckEditingMode(const pX,pY: integer): TEditingMode;
var
  I: TEditingMode;
  _R: Extended;
  _X,_Y: Extended;
begin
Result:=emNone;
for I:=emLScaling to High(TEditingMode) do with Handles[I] do
  if (Enabled AND
    ((0 <= (pX-X)) AND ((pX-X) <= LRSize)
     AND
      (0 <= (pY-Y)) AND ((pY-Y) <= TDSize)))
   then begin
    Result:=I;
    Exit; //. ->
    end;
with Handles[emRotating] do begin
_X:=EditingOrCreatingObject.BindMarkerX+R*Cos(EditingOrCreatingObject.Angle);
_Y:=EditingOrCreatingObject.BindMarkerY+R*Sin(EditingOrCreatingObject.Angle);
_R:=Sqrt(sqr(pX-EditingOrCreatingObject.BindMarkerX)+sqr(pY-EditingOrCreatingObject.BindMarkerY));
with Handles[emScaling] do
if (Enabled AND ((R-dR <= _R) AND (_R <= R+dR)))
 then
  Result:=emScaling
 else
  Result:=emNone;
with Handles[emMoving] do
if (Enabled AND (_R < R))
 then begin
  Result:=emMoving;
  Exit; //. ->
  end;
_R:=Sqrt(sqr(pX-_X)+sqr(pY-_Y));
if (Enabled AND (_R <= dR))
 then begin
  Result:=emRotating;
  Exit; //. ->
  end;
end;
end;


{TEditingOrCreatingObjectRW}
function TEditingOrCreatingObjectRW.getScale: Extended;
begin
if true // - NOT flUseInheritedGetScaleMethod
 then Result:=FScale
 else Result:=Inherited getScale;
end;


{TCreateCompletionObject}
Constructor TCreateCompletionObject.Create(const pEditingOrCreatingObject: TEditingOrCreatingObject);
begin
Inherited Create();
EditingOrCreatingObject:=pEditingOrCreatingObject;
end;

procedure TCreateCompletionObject.DoOnCreateClone(const idTClone,idClone: integer);
begin
end;


{TEditingOrCreatingObject}
Constructor TEditingOrCreatingObject.Create(pReflector: TReflector; const pflCreating: boolean; const pidTPrototype,pidPrototype: integer; const pPrototypePtr: TPtr; const pflDisableScaling: boolean = false; const pflDisableRotating: boolean = false);
var
  Obj: TSpaceObj;
  ReflectionWindowStruc: TReflectionWindowStrucEx;
begin
Inherited Create;
flCreating:=pflCreating;
flDisableScaling:=pflDisableScaling;
flDisableRotating:=pflDisableRotating;
flBinded:=false;
Reflector:=pReflector;
idTPrototype:=pidTPrototype;
idPrototype:=pidPrototype;
PrototypePtr:=pPrototypePtr;
Reflector.Space.ReadObj(Obj,SizeOf(Obj), PrototypePtr); //. check that prototype object is in context
Reflector.ReflectionWindow.GetWindow(false,ReflectionWindowStruc);
ReflectionWindow:=TEditingOrCreatingObjectRW.Create(Reflector.Space,ReflectionWindowStruc);
FigureWinRefl:=TFigureWinRefl.Create;
AdditiveFigureWinRefl:=TFigureWinRefl.Create;
BMP:=TBitmap.Create;
BMP.HandleType:=bmDIB;
BMP.PixelFormat:=pf24bit;
BMP.Width:=0;
AlphaChanelBMP:=TBitmap.Create;
AlphaChanelBMP.Width:=0;
//.
Handles:=TEditingObjectHandles.Create(Self);
//.
Panel:=TfmEditingOrCreatingObjectPanel.Create(Self);
//.
if (Reflector.Space.UserName <> 'ROOT') then Panel.cbUseInsideObjects.Enabled:=false;
//.
Xorg:=0; Yorg:=0;
X:=0; Y:=0;
Scale:=1;
Angle:=0;
//.
BindMarkerX:=0;
BindMarkerY:=0;
Rmax:=0;
Rmaxscr:=0;
Mode:=emNone;
TranparencyCf:=0.4;
//.
LoadFileAfterCreate:='';
//.
CreateCompletionObject:=nil; 
//.
AdditionalObjectsList:=nil;
//.
if (flCreating) then DoAlign();
//. reflect
Reflect(Reflector.BMPBuffer);
//.
Updater:=TTimer.Create(nil);
with Updater do begin
Interval:=100;
OnTimer:=DoOnUpdate;
Updater_dT:=0.1;
end;
end;

Destructor TEditingOrCreatingObject.Destroy;
var
  Xmn,Ymn, Xmx,Ymx: Integer;
begin
//.
Updater.Free;
//.
if ((Reflector.Reflecting <> nil) AND (Handles <> nil))
 then begin //. clear window
  Xmn:=Round(BindMarkerX-(Rmaxscr+2*Handles.Handles[emRotating].dR)); Ymn:=Round(BindMarkerY-(Rmaxscr+2*Handles.Handles[emRotating].dR));
  Xmx:=Round(BindMarkerX+(Rmaxscr+2*Handles.Handles[emRotating].dR)); Ymx:=Round(BindMarkerY+(Rmaxscr+2*Handles.Handles[emRotating].dR));
  //. reflect base
  Reflector.BMPBuffer.Canvas.Lock;
  try
  Reflector.Canvas.Lock;
  try
  BitBlt(Reflector.Canvas.Handle, Xmn, Ymn, Xmx-Xmn,Ymx-Ymn,  Reflector.BMPBuffer.Canvas.Handle, Xmn,Ymn, SRCCOPY);
  finally
  Reflector.Canvas.UnLock;
  end;
  finally
  Reflector.BMPBuffer.Canvas.UnLock;
  end;
  end;
//.
CreateCompletionObject.Free; 
AdditionalObjectsList.Free;
Panel.Free;
Handles.Free;
AlphaChanelBMP.Free;
BMP.Free;
FigureWinRefl.Free;
AdditiveFigureWinRefl.Free;
ReflectionWindow.Free;
Inherited;
end;

procedure TEditingOrCreatingObject.SetForEdit(const pPrototypePtr: TPtr);
var
  Xmn,Ymn, Xmx,Ymx: Integer;
  Xbind,Ybind: TCrd;
begin
//. clear old window
Xmn:=Round(BindMarkerX-(Rmaxscr+2*Handles.Handles[emRotating].dR)); Ymn:=Round(BindMarkerY-(Rmaxscr+2*Handles.Handles[emRotating].dR));
Xmx:=Round(BindMarkerX+(Rmaxscr+2*Handles.Handles[emRotating].dR)); Ymx:=Round(BindMarkerY+(Rmaxscr+2*Handles.Handles[emRotating].dR));
//. reflect base
Reflector.BMPBuffer.Canvas.Lock;
try
Reflector.Canvas.Lock;
try
BitBlt(Reflector.Canvas.Handle, Xmn, Ymn, Xmx-Xmn,Ymx-Ymn,  Reflector.BMPBuffer.Canvas.Handle, Xmn,Ymn, SRCCOPY);
finally
Reflector.Canvas.UnLock;
end;
finally
Reflector.BMPBuffer.Canvas.UnLock;
end;
//.
if (Panel.ObjPropsPanel <> nil)
 then begin
  Panel.sbShowObjProps.Down:=false;
  Panel.sbShowObjPropsClick(nil);
  end;
//.
flCreating:=false;
flBinded:=false;
PrototypePtr:=pPrototypePtr;
//.
Xorg:=0; Yorg:=0;
X:=0; Y:=0;
Scale:=1;
Angle:=0;
//.
BindMarkerX:=0;
BindMarkerY:=0;
Rmax:=0;
Rmaxscr:=0;
Mode:=emNone;
TranparencyCf:=0.4;
flUpdatePanelPos:=true;
//.
Obj_GetBindPoint(PrototypePtr, Xbind,Ybind);
SetPosition(Xbind,Ybind);
//. reflect
Reflect(Reflector.BMPBuffer);
end;

procedure TEditingOrCreatingObject.DoAlign;
const
  FitCoef = 0.15;
var
  Xmin,Ymin,Xmax,Ymax: Extended;
  ScaleCoef: Extended;
  Obj: TSpaceObj;
  Point0,Point1: TPoint;
  ALFA,BETTA,GAMMA: Extended;
begin
//. align scale
if (NOT flDisableScaling)
 then begin
  with Reflector do begin
  if (NOT Space.Obj_GetMinMax(Xmin,Ymin,Xmax,Ymax, PrototypePtr)) then Raise Exception.Create('can not get object container'); //. =>
  //.
  ReflectionWindow.Lock.Enter;
  try
  ScaleCoef:=((ReflectionWindow.Ymx-ReflectionWindow.Ymn)*FitCoef)/(Sqrt(sqr(Xmax-Xmin)+sqr(Ymax-Ymin))*ReflectionWindow.Scale);
  finally
  ReflectionWindow.Lock.Leave;
  end;
  end;
  Scale:=Scale*ScaleCoef;
  end;
//. align angle
if (NOT flDisableRotating)
 then begin
  with Reflector.Space do begin
  ReadObj(Obj,SizeOf(Obj), PrototypePtr);
  if Obj.ptrFirstPoint = nilPtr then Exit; //. ->
  ReadObj(Point0,SizeOf(Point0), Obj.ptrFirstPoint);
  if Point0.ptrNextObj = nilPtr then Exit; //. ->
  ReadObj(Point1,SizeOf(Point1), Point0.ptrNextObj);
  if Point1.ptrNextObj <> nilPtr then Exit; //. ->
  end;
  with Reflector.ReflectionWindow do begin
  Lock.Enter;
  try
  if (Point1.X-Point0.X) <> 0
   then
    ALFA:=Arctan((Point1.Y-Point0.Y)/(Point1.X-Point0.X))
   else
    if (Point1.Y-Point0.Y) >= 0
     then ALFA:=PI/2
     else ALFA:=-PI/2;
  if (X1-X0) <> 0
   then
    BETTA:=Arctan((Y1-Y0)/(X1-X0))
   else
    if (Y1-Y0) >= 0
     then BETTA:=PI/2
     else BETTA:=-PI/2;
  GAMMA:=(ALFA-BETTA);
  if (Point1.X-Point0.X)*(X1-X0) < 0
   then
    if (Point1.Y-Point0.Y)*(Y1-Y0) >= 0
     then GAMMA:=GAMMA-PI
     else GAMMA:=GAMMA+PI;
  finally
  Lock.Leave;
  end;
  end;
  Angle:=Angle+GAMMA;
  end;
end;

function TEditingOrCreatingObject.SetEditingMode(const pX,pY: integer): TEditingMode;
begin
Mode:=Handles.CheckEditingMode(pX,pY);
LastEditingPointX:=pX;
LastEditingPointY:=pY;
flBinded:=false;
Result:=Mode;
end;

procedure TEditingOrCreatingObject.SetEditingMode(const pX,pY: integer; const pMode: TEditingMode);
begin
Mode:=pMode;
LastEditingPointX:=pX;
LastEditingPointY:=pY;
flBinded:=false;
Reflect(Reflector.BMPBuffer);
end;

procedure TEditingOrCreatingObject.StopEditing;
begin
if Mode <> emNone
 then begin
  Mode:=emNone;
  AlignToFormatObj;
  Reflect(Reflector.BMPBuffer);
  end;
end;

function TEditingOrCreatingObject.IsEditing: boolean;
begin
Result:=(Mode <> emNone);
end;

procedure TEditingOrCreatingObject.ProcessEditingPoint(const pX,pY: integer);
var
  LX,LY, NewX,NewY: TCrd;
  LR,R: Extended;
  S: Extended;
  ALFA,BETTA,GAMMA: Extended;
begin
if (Mode = emNone) then Raise Exception.Create('no editing mode'); //. =>
case Mode of
emMoving: begin
  with Reflector.ReflectionWindow do begin
  Lock.Enter;
  try
  if NOT (((Xmn <= pX) AND (pX < Xmx)) AND ((Ymn <= pY) AND (pY < Ymx))) then Exit; //. ->
  finally
  Lock.Leave;
  end;
  end;
  //.
  Reflector.ConvertScrCrd2RealCrd(LastEditingPointX,LastEditingPointY, LX,LY);
  Reflector.ConvertScrCrd2RealCrd(pX,pY, NewX,NewY);
  X:=X+(NewX-LX);
  Y:=Y+(NewY-LY);
  end;
emScaling: begin
  LR:=Sqrt(sqr(LastEditingPointX-BindMarkerX)+sqr(LastEditingPointY-BindMarkerY));
  R:=Sqrt(sqr(pX-BindMarkerX)+sqr(pY-BindMarkerY));
  if LR <> 0
   then begin
    S:=R/LR;
    Scale:=Scale*S;
    end;
  end;
emRotating: begin
  if (pX-BindMarkerX) <> 0
   then begin
    GAMMA:=ArcTan((pY-BindMarkerY)/(pX-BindMarkerX));
    if (pX-BindMarkerX) < 0 then GAMMA:=GAMMA+PI;
    end
   else
    if (pY-BindMarkerY) >= 0
     then GAMMA:=PI/2
     else GAMMA:=-PI/2;
  Angle:=GAMMA;
  end;
else
  Raise Exception.Create('unprocessed editing mode'); //. =>
end;
//.
Reflect(Reflector.BMPBuffer);
//.
LastEditingPointX:=pX;
LastEditingPointY:=pY;
end;

procedure TEditingOrCreatingObject.SetPosition(const pX,pY: TCrd);
begin
Xorg:=pX;
Yorg:=pY;
X:=Xorg;
Y:=Yorg;
//.
Reflect(Reflector.BMPBuffer);
end;

procedure TEditingOrCreatingObject.Reset;
begin
Angle:=0;
Scale:=1;
X:=Xorg;
Y:=Yorg;
//.
Reflect(Reflector.BMPBuffer);
end;

procedure TEditingOrCreatingObject.AlignToFormatObj;

  function GetNearestNode(FormatNodes: TList; out NX,NY: Extended): boolean;
  var
    I: integer;
    MinDistance,Distance: Extended;
  begin
  Result:=false;
  if (FormatNodes.Count = 0) then Raise Exception.Create('no format node found'); //. =>
  MinDistance:=Sqrt(sqr(TPoint(FormatNodes[1]^).X-TPoint(FormatNodes[0]^).X)+sqr(TPoint(FormatNodes[1]^).Y-TPoint(FormatNodes[0]^).Y));
  for I:=0 to FormatNodes.Count-1 do begin
    Distance:=Sqrt(sqr(TPoint(FormatNodes[I]^).X-X)+sqr(TPoint(FormatNodes[I]^).Y-Y));
    if Distance < MinDistance
     then begin
      NX:=TPoint(FormatNodes[I]^).X; NY:=TPoint(FormatNodes[I]^).Y;
      Result:=true;
      MinDistance:=Distance;
      end;
    end;
  end;

  procedure DoAlignAngle(FormatNodes: TList);
  const
    AngleStep = PI/12;
  var
    Obj: TSpaceObj;
    Point0,Point1: TPoint;
    ALFA,BETTA,GAMMA: Extended;
    FA: Extended;
  begin
  //. align angle
  with Reflector.Space do begin
  ReadObj(Obj,SizeOf(Obj), PrototypePtr);
  if Obj.ptrFirstPoint = nilPtr then Exit; //. ->
  ReadObj(Point0,SizeOf(Point0), Obj.ptrFirstPoint);
  if Point0.ptrNextObj = nilPtr then Exit; //. ->
  ReadObj(Point1,SizeOf(Point1), Point0.ptrNextObj);
  if Point1.ptrNextObj <> nilPtr then Exit; //. ->
  end;
  if (Point1.X-Point0.X) <> 0
   then
    ALFA:=Arctan((Point1.Y-Point0.Y)/(Point1.X-Point0.X))
   else
    if (Point1.Y-Point0.Y) >= 0
     then ALFA:=PI/2
     else ALFA:=-PI/2;
  if (TPoint(FormatNodes[1]^).X-TPoint(FormatNodes[0]^).X) <> 0
   then
    BETTA:=Arctan((TPoint(FormatNodes[1]^).Y-TPoint(FormatNodes[0]^).Y)/(TPoint(FormatNodes[1]^).X-TPoint(FormatNodes[0]^).X))
   else
    if (TPoint(FormatNodes[1]^).Y-TPoint(FormatNodes[0]^).Y) >= 0
     then BETTA:=PI/2
     else BETTA:=-PI/2;
  GAMMA:=(ALFA-BETTA);
  if Abs(Point1.X-Point0.X) > Abs(Point1.Y-Point0.Y)
   then begin
    if (Point1.X-Point0.X)*(TPoint(FormatNodes[1]^).X-TPoint(FormatNodes[0]^).X) < 0 then GAMMA:=GAMMA+PI;
    end
   else begin
    if (Point1.Y-Point0.Y)*(TPoint(FormatNodes[1]^).Y-TPoint(FormatNodes[0]^).Y) < 0 then GAMMA:=GAMMA+PI;
    end;
  Angle:=Angle-GAMMA;
  FA:=Round(Angle/AngleStep)*AngleStep;
  Angle:=FA+GAMMA;
  end;

  procedure DoAlignScale(FormatNodes: TList);
  const
    CellFactor = 1/10;
  var
    CellSize: Extended;
    CellStep: Extended;
    Obj: TSpaceObj;
    Point0,Point1: TPoint;
    D,NewD: Extended;
    LastScale: Extended;
  begin
  CellSize:=Sqrt(sqr(TPoint(FormatNodes[1]^).X-TPoint(FormatNodes[0]^).X)+sqr(TPoint(FormatNodes[1]^).Y-TPoint(FormatNodes[0]^).Y));
  CellStep:=CellSize*CellFactor;
  LastScale:=Scale;
  with Reflector.Space do begin
  ReadObj(Obj,SizeOf(Obj), PrototypePtr);
  if Obj.ptrFirstPoint = nilPtr then Exit; //. ->
  ReadObj(Point0,SizeOf(Point0), Obj.ptrFirstPoint);
  if Point0.ptrNextObj = nilPtr then Exit; //. ->
  ReadObj(Point1,SizeOf(Point1), Point0.ptrNextObj);
  if Point1.ptrNextObj <> nilPtr
   then D:=2*Rmax
   else D:=Sqrt(sqr(Point1.X-Point0.X)+sqr(Point1.Y-Point0.Y));
  NewD:=Scale*D;
  end;
  NewD:=Round(NewD/CellStep)*CellStep;
  Scale:=NewD/D;
  if Scale <= 0 then Scale:=LastScale;
  end;
  
var
  P: TPoint;
  ptrObj: TPtr;
  FormatNodes: TList;
  FormatSizeX,FormatSizeY: integer;
  NX,NY: Extended;
  ptrDestroyPoint: pointer;
  I: integer;
begin
P.X:=X; P.Y:=Y;
if Reflector.Reflecting.GetObjByPoint(P,PrototypePtr, ptrObj)
 then with TBase2DVisualizationFunctionality(TComponentFunctionality_Create(Reflector.Space.Obj_IDType(ptrObj),Reflector.Space.Obj_ID(ptrObj))) do
  try
  if GetFormatNodes(FormatNodes,FormatSizeX,FormatSizeY)
   then
    try
    if GetNearestNode(FormatNodes, NX,NY)
     then begin
      //. align position
      X:=NX; Y:=NY;
      //. align angle
      if (NOT flDisableRotating) then DoAlignAngle(FormatNodes);
      //. align scale
      if (NOT flDisableScaling) then DoAlignScale(FormatNodes);
      end;
    finally
    for I:=0 to FormatNodes.Count-1 do begin
      ptrDestroyPoint:=FormatNodes[I];
      FreeMem(ptrDestroyPoint,SizeOf(TPoint));
      end;
    FormatNodes.Destroy;
    end;
  finally
  Release;
  end;
end;

procedure TEditingOrCreatingObject.UseInsideObjects(const flUse: boolean);
var
  Obj: TSpaceObj;
begin
FreeAndNil(AdditionalObjectsList);
if flUse
  then begin
  Reflector.Space.ReadObj(Obj,SizeOf(Obj), PrototypePtr);
  with TBase2DVisualizationFunctionality(TComponentFunctionality_Create(Obj.idTObj,Obj.idObj)) do
  try
  GetInsideObjectsList(TComponentsList(AdditionalObjectsList));
  finally
  Release;
  end;
  Reflector.Update;
  end;
end;

procedure TEditingOrCreatingObject.Reflect(PrimaryBMP: TBitmap);
begin
PostMessage(Panel.Handle, WM_UPDATE,Integer(PrimaryBMP),Integer(PrimaryBMP));
end;

function TEditingOrCreatingObject._Reflect(PrimaryBMP: TBitmap): boolean;
const
  MaxAdditionalObjectsCountToReflect = 33;

  procedure Obj_GetMaxR(const ptrObj: TPtr; const dX,dY: Extended;  var MaxR: Extended);

    procedure TreatePoint(const X,Y: Extended);
    var
      R: Extended;
    begin
    R:=Sqrt(sqr(X-Self.X)+sqr(Y-Self.Y));
    if R > MaxR then MaxR:=R;
    end;

  var
    Obj: TSpaceObj;
    ptrPoint: TPtr;
    Point: TPoint;
    I: integer;
    Node: TNodeSpaceObjPolyLinePolygon;
    ptrOwnerObj: TPtr;
  begin
  Reflector.Space.ReadObj(Obj,SizeOf(Obj), ptrObj);
  if Obj.Width > 0
   then with TSpaceObjPolylinePolygon.Create(Reflector.Space, Obj) do
    try
    if Count > 0 then for I:=0 to Count-1 do TreatePoint(Nodes[I].X+dX,Nodes[I].Y+dY);
    finally
    Destroy;
    end
   else begin
    ptrPoint:=Obj.ptrFirstPoint;
    while ptrPoint <> nilPtr do begin
     Reflector.Space.ReadObj(Point,SizeOf(Point), ptrPoint);
     TreatePoint(Point.X+dX,Point.Y+dY);
     ptrPoint:=Point.ptrNextObj;
     end;
    end;
  //. process own objects
  ptrOwnerObj:=Obj.ptrListOwnerObj;
  while ptrOwnerObj <> nilPtr do begin
    Obj_GetMaxR(ptrOwnerObj,dX,dY, MaxR);
    Reflector.Space.ReadObj(ptrOwnerObj,SizeOf(TPtr), ptrOwnerObj);
    end;
  end;

  procedure ConvertPoint(X,Y: Extended;  out Xs,Ys: Extended);
  var
    RW: TReflectionWindowStrucEx;
    QdA2: Extended;
    X_C,X_QdC,X_A1,X_QdB2: Extended;
    Y_C,Y_QdC,Y_A1,Y_QdB2: Extended;
  begin
  with Reflector,RW do begin
  ReflectionWindow.GetWindow(false, RW);
  //.
  X:=X*cfTransMeter;
  Y:=Y*cfTransMeter;
  QdA2:=sqr(X-X0)+sqr(Y-Y0);
  //.
  X_QdC:=sqr(X1-X0)+sqr(Y1-Y0);
  X_C:=Sqrt(X_QdC);
  X_QdB2:=sqr(X-X1)+sqr(Y-Y1);
  X_A1:=(X_QdC-X_QdB2+QdA2)/(2*X_C);
  //.
  Y_QdC:=sqr(X3-X0)+sqr(Y3-Y0);
  Y_C:=Sqrt(Y_QdC);
  Y_QdB2:=sqr(X-X3)+sqr(Y-Y3);
  Y_A1:=(Y_QdC-Y_QdB2+QdA2)/(2*Y_C);
  //.
  Xs:=Xmn+X_A1/X_C*(Xmx-Xmn);
  Ys:=Ymn+Y_A1/Y_C*(Ymx-Ymn);
  end;
  end;

  procedure ConvertPointAs3D(X,Y: Extended;  out Xs,Ys: Extended);
  var
    RW: TReflectionWindowStrucEx;
    X_A,X_B,X_C,X_D: Extended;
    Y_A,Y_B,Y_C,Y_D: Extended;
    XC,YC,diffXCX0,diffYCY0,X_L,Y_L: Extended;
  begin
  with Reflector,RW do begin
  ReflectionWindow.GetWindow(false, RW);
  //.
  X:=X*cfTransMeter;
  Y:=Y*cfTransMeter;
  //.
  X_A:=Y1-Y0;X_B:=X0-X1;X_D:=-(X0*X_A+Y0*X_B);
  Y_A:=Y3-Y0;Y_B:=X0-X3;Y_D:=-(X0*Y_A+Y0*Y_B);
  XC:=(Y_A*X+Y_B*(Y+X_D/X_B))/(Y_A-(X_A*Y_B/X_B));
  diffXCX0:=XC-X0;
  if X_B <> 0
   then begin
    YC:=-(X_A*XC+X_D)/X_B;
    diffYCY0:=YC-Y0;
    X_L:=Sqrt(sqr(diffXCX0)+sqr(diffYCY0));
    if (((-X_B) > 0) AND ((diffXCX0) < 0)) OR (((-X_B) < 0) AND ((diffXCX0) > 0)) then X_L:=-X_L;
    end
   else begin
    YC:=(Y_B*Y+Y_A*(X+X_D/X_A))/(Y_B-(X_B*Y_A/X_A));
    diffYCY0:=YC-Y0;
    X_L:=Sqrt(sqr(diffXCX0)+sqr(diffYCY0));
    if ((X_A > 0) AND ((diffYCY0) < 0)) OR ((X_A < 0) AND ((diffYCY0) > 0)) then X_L:=-X_L;
    end;
  XC:=(X_A*X+X_B*(Y+Y_D/Y_B))/(X_A-(Y_A*X_B/Y_B));
  diffXCX0:=XC-X0;
  if (Y_B <> 0)
   then begin
    YC:=-(Y_A*XC+Y_D)/Y_B;
    diffYCY0:=YC-Y0;
    Y_L:=Sqrt(sqr(diffXCX0)+sqr(diffYCY0));
    if (((-Y_B) > 0) AND ((diffXCX0) < 0)) OR (((-Y_B) < 0) AND ((diffXCX0) > 0)) then Y_L:=-Y_L;
    end
   else begin
    YC:=(X_B*Y+X_A*(X+Y_D/Y_A))/(X_B-(Y_B*X_A/Y_A));
    diffYCY0:=YC-Y0;
    Y_L:=Sqrt(sqr(diffXCX0)+sqr(diffYCY0));
    if ((Y_A > 0) AND ((diffYCY0) < 0)) OR ((Y_A < 0) AND ((diffYCY0) > 0)) then Y_L:=-Y_L;
    end;
  //.
  Xs:=Xmn+X_L/Sqrt(sqr(X_A)+sqr(X_B))*(Xmx-Xmn);
  Ys:=Ymn+Y_L/Sqrt(sqr(Y_A)+sqr(Y_B))*(Ymx-Ymn);
  end;
  end;

  procedure DoReflect(const pptrObj: TPtr; pCanvas: TCanvas; const dX,dY: TCrd; const OldClippingRegion: HRGN);
  var
    I: integer;

    procedure ProcessPoint(X,Y: Extended);
    var
      Node: TNode;
    begin
    ConvertPoint(X,Y,  Node.X,Node.Y);
    FigureWinRefl.Insert(Node)
    end;

    procedure AlternativeReflect;
    begin
    with pCanvas.Pen do begin
    Color:=FigureWinRefl.Color;
    Style:=psSolid;
    Width:=1;
    end;
    if (FigureWinRefl.CountScreenNodes > 0)
     then with FigureWinRefl do begin
      if flagLoop
       then begin
        if flagFill
         then begin
          if (ColorFill <> clNone)
           then begin
            pCanvas.Brush.Color:=ColorFill;
            pCanvas.Polygon(Slice(ScreenNodes, CountScreenNodes));
            end;
          end
         else begin
          pCanvas.PolyLine(Slice(ScreenNodes, CountScreenNodes));
          end;
        end;
      end;
    if (AdditiveFigureWinRefl.CountScreenNodes > 0)
     then with AdditiveFigureWinRefl do begin
      if (ColorFill <> clNone)
       then begin
        pCanvas.Pen.Width:=1;
        pCanvas.Brush.Color:=ColorFill;
        pCanvas.Polygon(Slice(ScreenNodes, CountScreenNodes));
        end;
      end;
    end;

  var
    Obj,Detail: TSpaceObj;
    flClipping: boolean;
    flClipVisible: boolean;
    ClippingRegion,Rgn: HRGN;
    ptrPoint: TPtr;
    Point: TPoint;
    flReflected: boolean;
    ptrOwnerObj: TPtr;
  begin
  with Reflector do begin
  Space.ReadObj(Obj,SizeOf(TSpaceObj), pptrObj);
  //. clipping if necessary
  flClipping:=false;
  flClipVisible:=false;
  if (Obj.Color = clNone)
   then begin
    ptrOwnerObj:=Obj.ptrListOwnerObj;
    while (ptrOwnerObj <> nilPtr) do begin
      Space.ReadObj(Detail,SizeOf(Detail),ptrOwnerObj);
      if (Detail.flagLoop AND Detail.flagFill AND (Detail.ColorFill = clNone))
       then begin
        flClipping:=true;
        //. prepare clipping figure
        with FigureWinRefl do begin
        Clear;
        ptrObj:=ptrOwnerObj;
        idTObj:=Detail.idTObj;
        idObj:=Detail.idObj;
        flagLoop:=Detail.flagLoop;
        Color:=Detail.Color;
        flagFill:=Detail.flagFill;
        ColorFill:=Detail.ColorFill;
        Width:=Detail.Width;
        end;
        ptrPoint:=Detail.ptrFirstPoint;
        while ptrPoint <> nilPtr do begin
          Space.ReadObj(Point,SizeOf(Point), ptrPoint);
          ProcessPoint(Point.X+dX,Point.Y+dY);
          ptrPoint:=Point.ptrNextObj;
          end;
        //. scaling and rotating
        if Scale <> 1 then Figure_ChangeScale(FigureWinRefl,BindMarkerX,BindMarkerY, Scale);
        if Angle <> 0 then Figure_Rotate(FigureWinRefl,BindMarkerX,BindMarkerY, Angle);
        FigureWinRefl.AttractToLimits(Reflecting.WindowRefl);
        //.
        if (FigureWinRefl.CountScreenNodes > 0)
         then
          if (NOT flClipVisible)
           then begin
            ClippingRegion:=CreatePolygonRgn(FigureWinRefl.ScreenNodes, FigureWinRefl.CountScreenNodes, ALTERNATE);
            flClipVisible:=true;
            end
           else begin
            Rgn:=CreatePolygonRgn(FigureWinRefl.ScreenNodes, FigureWinRefl.CountScreenNodes, ALTERNATE);
            CombineRgn(ClippingRegion, ClippingRegion,Rgn, RGN_XOR);
            DeleteObject(Rgn);
            end;
        end;
      //.
      ptrOwnerObj:=Detail.ptrNextObj;
      end;
    if (flClipVisible) then ExtSelectClipRgn(pCanvas.Handle, ClippingRegion, RGN_AND);
    end;
  end;
  //.
  if (NOT flClipping OR flClipVisible)
   then begin
    with Reflector do begin
    with FigureWinRefl do begin
    Clear;
    ptrObj:=pptrObj;
    idTObj:=Obj.idTObj;
    idObj:=Obj.idObj;
    flagLoop:=Obj.flagLoop;
    Color:=Obj.Color;
    flagFill:=Obj.flagFill;
    ColorFill:=Obj.ColorFill;
    Width:=Obj.Width;
    end;
    AdditiveFigureWinRefl.Clear;
    ptrPoint:=Obj.ptrFirstPoint;
    while ptrPoint <> nilPtr do begin
      Reflector.Space.ReadObj(Point,SizeOf(Point), ptrPoint);
      ProcessPoint(Point.X+dX,Point.Y+dY);
      ptrPoint:=Point.ptrNextObj;
      end;
    //. scaling and rotating
    if Scale <> 1 then Figure_ChangeScale(FigureWinRefl,BindMarkerX,BindMarkerY, Scale);
    if Angle <> 0 then Figure_Rotate(FigureWinRefl,BindMarkerX,BindMarkerY, Angle);
    //.
    if Obj.Width > 0
     then with AdditiveFigureWinRefl do begin
      Assign(FigureWinRefl);
      if ValidateAsPolyLine(ReflectionWindow.Scale*Scale) then AttractToLimits(Reflecting.WindowRefl);
      end;
    FigureWinRefl.AttractToLimits(Reflecting.WindowRefl);
    end;
    //. reflecting
    ReflectionWindow.Lock.Enter;
    try
    ReflectionWindow.Assign(Self.Reflector.ReflectionWindow);
    ReflectionWindow.FScale:=Self.Reflector.ReflectionWindow.Scale*Scale;
    finally
    ReflectionWindow.Lock.Leave;
    end;
    try
    flReflected:=false;
    with TBase2DVisualizationFunctionality(TComponentFunctionality_Create(Obj.idTObj,Obj.idObj)) do
    try
    Reflector:=Self.Reflector;
    flReflected:=Reflect(FigureWinRefl,AdditiveFigureWinRefl,ReflectionWindow,Self.Reflector.Reflecting.WindowRefl,pCanvas,nil);
    finally
    Release;
    end
    except
      end;
    if NOT  flReflected then AlternativeReflect;
    end;
  //. end of clipping
  if (flClipVisible)
   then begin
    SelectClipRgn(pCanvas.Handle, OldClippingRegion);
    DeleteObject(ClippingRegion);
    end;
  //. process own objects
  ptrOwnerObj:=Obj.ptrListOwnerObj;
  while ptrOwnerObj <> nilPtr do begin
    DoReflect(ptrOwnerObj,pCanvas,dX,dY,OldClippingRegion);
    Reflector.Space.ReadObj(ptrOwnerObj,SizeOf(TPtr), ptrOwnerObj);
    end;
  end;

var
  BLENDFUNCTIONPARAMS: _BLENDFUNCTION;
  Xbind,Ybind: TCrd;
  dX,dY: TCrd;
  Xmn,Ymn, Xmx,Ymx: Integer;
  _Xmn,_Ymn, _Xmx,_Ymx: Integer;
  I: integer;
  OldClippingRegion: HRGN;
  Cnt: integer;
const
  BindMarkerColor = clRed;
  BindMarkerSize = 10;
begin
Result:=false;
//.
if (NOT Reflector.Space.Obj_IsCached(PrototypePtr)) then Exit; //. ->
//.
Reflector.Reflecting.Lock.Enter;
try
if NOT BMP.Canvas.TryLock then Exit; //. ->
try
if flBinded then with Reflector do ConvertScrCrd2RealCrd(Round(BindMarkerX),Round(BindMarkerY), X,Y);
//.
Xmn:=Round(BindMarkerX-(Rmaxscr+2*Handles.Handles[emRotating].dR)); Ymn:=Round(BindMarkerY-(Rmaxscr+2*Handles.Handles[emRotating].dR));
Xmx:=Round(BindMarkerX+(Rmaxscr+2*Handles.Handles[emRotating].dR)); Ymx:=Round(BindMarkerY+(Rmaxscr+2*Handles.Handles[emRotating].dR));
//.
ConvertPoint(X,Y, BindMarkerX,BindMarkerY);
Obj_GetBindPoint(PrototypePtr, Xbind,Ybind);
dX:=(X-Xbind);
dY:=(Y-Ybind);
Rmax:=0; Obj_GetMaxR(PrototypePtr,dX,dY, Rmax);
Rmaxscr:=(Rmax*Reflector.ReflectionWindow.Scale)*Scale;
//.
_Xmn:=Round(BindMarkerX-(Rmaxscr+2*Handles.Handles[emRotating].dR)); _Ymn:=Round(BindMarkerY-(Rmaxscr+2*Handles.Handles[emRotating].dR));
_Xmx:=Round(BindMarkerX+(Rmaxscr+2*Handles.Handles[emRotating].dR)); _Ymx:=Round(BindMarkerY+(Rmaxscr+2*Handles.Handles[emRotating].dR));
if _Xmn < Xmn then Xmn:=_Xmn; if _Ymn < Ymn then Ymn:=_Ymn;
if _Xmx > Xmx then Xmx:=_Xmx; if _Ymx > Ymx then Ymx:=_Ymx;
//.
if (NOT ((BMP.Width = Reflector.Width) AND (BMP.Height = Reflector.Height)))
 then with BMP do begin
  Width:=Reflector.Width;
  Height:=Reflector.Height;
  end;
//.
PrimaryBMP.Canvas.Lock;
try
BitBlt(BMP.Canvas.Handle, Xmn,Ymn, Xmx-Xmn,Ymx-Ymn,  PrimaryBMP.Canvas.Handle, Xmn,Ymn, SRCCOPY);
finally
PrimaryBMP.Canvas.UnLock;
end;
//. reflect handles
Handles.Reflect(BMP.Canvas);
//. reflect in special BMP
AlphaChanelBMP.Canvas.Lock;
try
if NOT ((AlphaChanelBMP.Width = Reflector.Width) AND (AlphaChanelBMP.Height = Reflector.Height))
 then with AlphaChanelBMP do begin
  Width:=Reflector.Width;
  Height:=Reflector.Height;
  end;
with AlphaChanelBMP do begin
Canvas.Brush.Color:=clBlack;
Canvas.Pen.Color:=Canvas.Brush.Color;
Canvas.Rectangle(0,0,Width,Height);
end;
//.
if (GetClipRgn(AlphaChanelBMP.Canvas.Handle, OldClippingRegion) = -1) then OldClippingRegion:=0;
try
DoReflect(PrototypePtr,AlphaChanelBMP.Canvas,dX,dY,OldClippingRegion);
if (AdditionalObjectsList <> nil)
 then begin
  if (AdditionalObjectsList.Count <= MaxAdditionalObjectsCountToReflect)
   then Cnt:=AdditionalObjectsList.Count
   else Cnt:=MaxAdditionalObjectsCountToReflect;
  for I:=0 to Cnt-1 do with TItemComponentsList(AdditionalObjectsList[I]^) do
    try
    with TBase2DVisualizationFunctionality(TComponentFunctionality_Create(idTComponent,idComponent)) do
    try
    DoReflect(Ptr,AlphaChanelBMP.Canvas,dX,dY,OldClippingRegion);
    finally
    Release;
    end;
    except
      end;
  end;
finally
SelectClipRgn(AlphaChanelBMP.Canvas.Handle, 0);
if (OldClippingRegion <> 0) then DeleteObject(OldClippingRegion);
end;
//.
with BLENDFUNCTIONPARAMS do begin
BlendOp:=AC_SRC_OVER;
BlendFlags:=0;
SourceConstantAlpha:=Round(TranparencyCf*High(SourceConstantAlpha));
AlphaFormat:=AC_SRC_NO_ALPHA; ///? AC_SRC_NO_PREMULT_ALPHA;
end;
with AlphaChanelBMP do begin
if _Xmn < 0 then _Xmn:=0; if _Ymn < 0 then _Ymn:=0;
if _Xmx > Width then _Xmx:=Width; if _Ymx > Height then _Ymx:=Height;
end;
//.
if (GetClipRgn(BMP.Canvas.Handle, OldClippingRegion) = -1) then OldClippingRegion:=0;
try
if (NOT Windows.AlphaBlend(BMP.Canvas.Handle, _Xmn,_Ymn, _Xmx-_Xmn,_Ymx-_Ymn,  AlphaChanelBMP.Canvas.Handle, _Xmn,_Ymn, _Xmx-_Xmn,_Ymx-_Ymn,  BLENDFUNCTIONPARAMS))
 then begin
  DoReflect(PrototypePtr,BMP.Canvas,dX,dY,OldClippingRegion);
  if AdditionalObjectsList <> nil
   then begin
    if (AdditionalObjectsList.Count <= MaxAdditionalObjectsCountToReflect)
     then Cnt:=AdditionalObjectsList.Count
     else Cnt:=MaxAdditionalObjectsCountToReflect;
    for I:=0 to Cnt-1 do with TItemComponentsList(AdditionalObjectsList[I]^) do with TBase2DVisualizationFunctionality(TComponentFunctionality_Create(idTComponent,idComponent)) do
      try
      try
      DoReflect(Ptr,BMP.Canvas,dX,dY,OldClippingRegion);
      finally
      Release;
      end;
      except
        end;
    end;
  end;
finally
SelectClipRgn(BMP.Canvas.Handle, 0);
if (OldClippingRegion <> 0) then DeleteObject(OldClippingRegion);
end;
finally
AlphaChanelBMP.Canvas.UnLock;
end;
//. reflect bind point
with BMP.Canvas do begin
Pen.Color:=BindMarkerColor;
MoveTo(Trunc(BindMarkerX-BindMarkerSize/2),Trunc(BindMarkerY-BindMarkerSize/2));
LineTo(Trunc(BindMarkerX+BindMarkerSize/2),Trunc(BindMarkerY+BindMarkerSize/2));
MoveTo(Trunc(BindMarkerX-BindMarkerSize/2),Trunc(BindMarkerY+BindMarkerSize/2));
LineTo(Trunc(BindMarkerX+BindMarkerSize/2),Trunc(BindMarkerY-BindMarkerSize/2));
end;
//. check for exit
if ((Reflector.Reflecting.flReflecting AND Reflector.Reflecting.flReflectingCancel) OR (Reflector.Reflecting.Revising.flRevising AND Reflector.Reflecting.Revising.flCancelRevising) OR (Reflector.Reflecting.ReFormingLays.flReforming AND Reflector.Reflecting.ReFormingLays.flReformingCancel)) then Exit; //. ->
//. reflect out
Reflector.Canvas.Lock;
try
BitBlt(Reflector.Canvas.Handle, Xmn, Ymn, Xmx-Xmn,Ymx-Ymn,  BMP.Canvas.Handle, Xmn,Ymn, SRCCOPY);
finally
Reflector.Canvas.UnLock;
end;
//.
finally
BMP.Canvas.UnLock;
end;
finally
Reflector.Reflecting.Lock.Leave;
end;
Result:=true;
end;

procedure TEditingOrCreatingObject.ClonePrototype(const idTPrototype,idPrototype: integer; out idClone: integer);

  procedure CheckUserSpaceSquare(const CF: TComponentFunctionality);
  var
    S: Extended;

    procedure _CheckUserSpaceSquare(const idTObj,idObj: integer);

      procedure ProcessVisualization(VisualizationFunctionality: TBase2DVisualizationFunctionality);
      var
        ptrObj: TPtr;
        Obj: TSpaceObj;
        OrgPoint: TPoint;
        ShiftX,ShiftY: TCrd;
      begin
      with VisualizationFunctionality do begin
      S:=S+Square*Sqr(Self.Scale);
      Space.CheckUserMaxSpaceSquarePerObject(UserName,UserPassword, S);
      Space.CheckUserSpaceSquare(UserName,UserPassword, S);
      end;
      end;

    var
      ObjFunctionality: TComponentFunctionality;
      Components: TComponentsList;
      I: integer;
    begin
    ObjFunctionality:=TComponentFunctionality_Create(idTObj,idObj);
    try
    //. check self
    with ObjFunctionality do begin
    {/// ? UserName:=CF.UserName;
    UserPassword:=CF.UserPassword;}
    flUserSecurityDisabled:=true;
    if ObjectIsInheritedFrom(ObjFunctionality,TBase2DVisualizationFunctionality) then ProcessVisualization(TBase2DVisualizationFunctionality(ObjFunctionality));
    //. process components
    GetComponentsList(Components);
    try
    for I:=0 to Components.Count-1 do _CheckUserSpaceSquare(TItemComponentsList(Components[I]^).idTComponent,TItemComponentsList(Components[I]^).idComponent);
    finally
    Components.Destroy;
    end;
    end;
    finally
    ObjFunctionality.Release;
    end;
    end;

  begin
  S:=0;
  _CheckUserSpaceSquare(CF.idTObj,CF.idObj);
  end;

var
  CF: TComponentFunctionality;
  VCL: TComponentsList;
  I: integer;
  Xbind,Ybind: TCrd;
  flUserSecurityDisabledOld: boolean;
begin
CF:=TComponentFunctionality_Create(idTPrototype,idPrototype);
with CF do
try
//. check for acceptable
QueryComponents(TBase2DVisualizationFunctionality, VCL);
try
if (VCL <> nil)
 then
  for I:=0 to VCL.Count-1 do with TBase2DVisualizationFunctionality(TComponentFunctionality_Create(TItemComponentsList(VCL[I]^).idTComponent,TItemComponentsList(VCL[I]^).idComponent)) do
    try
    Obj_GetBindPoint(Ptr, Xbind,Ybind);
    CheckPlace(Xbind,Ybind,Self.Scale,-Self.Angle, (X-Xbind),(Y-Ybind));
    finally
    Release;
    end
  else
   if ObjectIsInheritedFrom(CF,TBase2DVisualizationFunctionality)
    then with TBase2DVisualizationFunctionality(CF) do begin
     Obj_GetBindPoint(Ptr, Xbind,Ybind);
     CheckPlace(Xbind,Ybind,Self.Scale,-Self.Angle, (X-Xbind),(Y-Ybind));
     end;
finally
VCL.Free;
end;
//. check for user space
Space.CheckUserDATASize(UserName,UserPassword, DATASize);
CheckUserSpaceSquare(CF);
//.
finally
Release;
end;
//.
Reflector.Reflecting.Revising.Lock.Enter;
try
Reflector.Reflecting.Revising.Suspend;
finally
Reflector.Reflecting.Revising.Lock.Leave;
end;
try
CF:=CreateObject(Reflector, idTPrototype,idPrototype);
with CF do
try
QueryComponents(TBase2DVisualizationFunctionality, VCL);
try
if (VCL <> nil) AND (VCL.Count > 0)
 then with TBase2DVisualizationFunctionality(TComponentFunctionality_Create(TItemComponentsList(VCL[0]^).idTComponent,TItemComponentsList(VCL[0]^).idComponent)) do
  try
  CheckUserOperation(idWriteOperation);
  flUserSecurityDisabledOld:=flUserSecurityDisabled;
  flUserSecurityDisabled:=true;
  try
  Obj_GetBindPoint(Ptr, Xbind,Ybind);
  Transform(Xbind,Ybind, Self.Scale, -Self.Angle, (X-Xbind),(Y-Ybind));
  finally
  flUserSecurityDisabled:=flUserSecurityDisabledOld;
  end;
  finally
  Release;
  end
 else
  if ObjectIsInheritedFrom(CF,TBase2DVisualizationFunctionality)
   then with TBase2DVisualizationFunctionality(CF) do begin
    CheckUserOperation(idWriteOperation);
    flUserSecurityDisabledOld:=flUserSecurityDisabled;
    flUserSecurityDisabled:=true;
    try
    Obj_GetBindPoint(Ptr, Xbind,Ybind);
    Transform(Xbind,Ybind, Self.Scale, -Self.Angle, (X-Xbind),(Y-Ybind));
    finally
    flUserSecurityDisabled:=flUserSecurityDisabledOld;
    end;
    end;
finally
VCL.Free;
end;
//.
idClone:=idObj;
finally
Release;
end
finally
Reflector.Reflecting.Revising.Lock.Enter;
try
Reflector.Reflecting.Revising.Resume;
finally
Reflector.Reflecting.Revising.Lock.Leave;
end;
end;
end;

procedure TEditingOrCreatingObject.CloneEditingObject(out idTClone,idClone: integer);
var
  Obj: TSpaceObj;
  idTROOT,idROOT,idROOTClone: integer;
begin
try
idROOT:=0;
Reflector.Space.ReadObj(Obj,SizeOf(Obj),PrototypePtr);
if NOT Reflector.GetObjAsOwnerComponent(PrototypePtr, idTROOT,idROOT)
 then Reflector.Space.Obj_GetRoot(Obj.idTObj,Obj.idObj, idTROOT,idROOT);
if (idROOT = 0) then Raise Exception.Create('can not get root owner'); //. =>
if ((Obj.idTObj = idTROOT) AND (Obj.idObj = idROOT))
 then with TComponentFunctionality_Create(idTROOT,idROOT) do
  try
  if GetROOTOwner(idTROOT,idROOT)
   then begin
    ClonePrototype(idTROOT,idROOT, idROOTClone);
    with TComponentFunctionality_Create(idTROOT,idROOTClone) do
    try
    if (NOT QueryComponent(Obj.idTObj, idTClone,idClone)) then Raise Exception.Create('could not query component idTObj = '+IntToStr(Obj.idTObj)); //. =>
    finally
    Release;
    end;
    end
   else begin
    ClonePrototype(idTObj,idObj, idClone);
    idTClone:=idTObj;
    end;
  finally
  Release;
  end
 else begin
  ClonePrototype(Obj.idTObj,Obj.idObj, idClone);
  idTClone:=Obj.idTObj;
  end;
except
  On E: Exception do Raise Exception.Create(E.Message);
  end;
end;

function TEditingOrCreatingObject.Commit: integer;

  function LoadComponentFromFile(const idTComponent,idComponent: integer; const FileName: WideString): boolean;
  begin
  Result:=false;
  case idTComponent of
  idTCoComponent: Result:=Reflector.Space.Plugins__CoComponent_LoadByFile(idComponent,FileName);
  end;
  end;

var
  idClone: integer;
  VCL: TComponentsList;
  Xbind,Ybind: TCrd;
  flUserSecurityDisabledOld: boolean;
  I: integer;
begin
try
if (flCreating)
 then begin
  ClonePrototype(idTPrototype,idPrototype, idClone);
  //.
  if (CreateCompletionObject <> nil) then CreateCompletionObject.DoOnCreateClone(idTPrototype,idClone);
  //.
  Result:=idClone;
  //.
  Reflector.Update();
  //.
  if (LoadFileAfterCreate <> '') AND NOT LoadComponentFromFile(idTPrototype,idClone,LoadFileAfterCreate) then Raise Exception.Create('could not load component from file'); //. =>
  end
 else begin
  Reflector.Reflecting.Revising.Lock.Enter;
  try
  Self.Reflector.Reflecting.Revising.Suspend;
  finally
  Reflector.Reflecting.Revising.Lock.Leave;
  end;
  try
  with TBase2DVisualizationFunctionality(TComponentFunctionality_Create(Reflector.Space.Obj_IDType(PrototypePtr),Reflector.Space.Obj_ID(PrototypePtr))) do
  try
  CheckUserOperation(idWriteOperation);
  Obj_GetBindPoint(Ptr, Xbind,Ybind);
  CheckPlace(Xbind,Ybind,Self.Scale,-Self.Angle, (X-Xbind),(Y-Ybind));
  //.
  flUserSecurityDisabledOld:=flUserSecurityDisabled;
  flUserSecurityDisabled:=true;
  try
  Transform(Xbind,Ybind, Self.Scale, -Self.Angle, (X-Xbind),(Y-Ybind));
  if (AdditionalObjectsList <> nil)
   then begin
    Reflector.Space.DisableUpdating();
    try
    for I:=0 to AdditionalObjectsList.Count-1 do with TItemComponentsList(AdditionalObjectsList[I]^) do with TBase2DVisualizationFunctionality(TComponentFunctionality_Create(idTComponent,idComponent)) do
      try
      try
      Transform(Xbind,Ybind, Self.Scale, -Self.Angle, (X-Xbind),(Y-Ybind));
      finally
      Release;
      end;
      except
        On E: Exception do EventLog.WriteMinorEvent('TEditingOrCreatingObject.Commit()','Error on transform of inside visualization ('+IntToStr(TItemComponentsList(AdditionalObjectsList[I]^).idTComponent)+';'+IntToStr(TItemComponentsList(AdditionalObjectsList[I]^).idComponent)+')',E.Message);
        end;
    finally
    Reflector.Space.EnableUpdating();
    end;
    end;
  Result:=idObj;
  finally
  flUserSecurityDisabled:=flUserSecurityDisabledOld;
  end;
  Obj_GetBindPoint(Ptr, Xorg,Yorg);
  Self.Angle:=0;
  Self.Scale:=1;
  finally
  Release;
  end;
  finally
  Reflector.Reflecting.Revising.Lock.Enter;
  try
  Self.Reflector.Reflecting.Revising.Resume;
  finally
  Reflector.Reflecting.Revising.Lock.Leave;
  end;
  end;
  end;
except
  On E: Exception do Raise Exception.Create(E.Message);
  end;
end;

procedure TEditingOrCreatingObject.ExportAsXML(const FileName: string);
var
  ComponentsList: TComponentsList;
  I: integer;
  idTROOT,idROOT: integer;
  idTOwner,idOwner: integer;
begin
if (flCreating) then Raise Exception.Create('can not export in this mode'); //. =>
ComponentsList:=TComponentsList.Create;
try
with Reflector.Space do begin
Log.OperationStarting('Exporting ...');
try
if NOT Reflector.GetObjAsOwnerComponent(PrototypePtr, idTROOT,idROOT)
 then Reflector.Space.Obj_GetROOT(Reflector.Space.Obj_IDType(PrototypePtr),Reflector.Space.Obj_ID(PrototypePtr), idTROOT,idROOT);
with TComponentFunctionality_Create(idTROOT,idROOT) do
try
if GetROOTOwner(idTOwner,idOwner)
 then ComponentsList.AddComponent(idTOwner,idOwner,0)
 else ComponentsList.AddComponent(idTObj,idObj,0);
finally
Release;
end;
if AdditionalObjectsList <> nil then for I:=0 to AdditionalObjectsList.Count-1 do with TItemComponentsList(AdditionalObjectsList[I]^) do with TComponentFunctionality_Create(idTComponent,idComponent) do
  try
  if GetROOTOwner(idTOwner,idOwner)
   then ComponentsList.AddComponent(idTOwner,idOwner,0)
   else ComponentsList.AddComponent(idTObj,idObj,0);
  finally
  Release;
  end;
Functionality.TypesSystem.DoExportComponents(UserName,UserPassword, ComponentsList, FileName);
finally
Log.OperationDone;
end;
end;
finally
ComponentsList.Destroy;
end;
ShowMessage('Object(s) exported to '+FileName);
end;

procedure TEditingOrCreatingObject.Obj_GetBindPoint(const ptrObj: TPtr; out X,Y: TCrd);
var
  Obj: TSpaceObj;
  CurPoint: integer;
  ptrPoint: TPtr;
  Point: TPoint;
  SumX,SumY: Extended;
begin
Reflector.Space.ReadObj(Obj,SizeOf(TSpaceObj), ptrObj);
ptrPoint:=Obj.ptrFirstPoint;
SumX:=0; SumY:=0;
CurPoint:=0;
while ptrPoint <> nilPtr do begin
  Reflector.Space.ReadObj(Point,SizeOf(Point), ptrPoint);
  SumX:=SumX+Point.X;
  SumY:=SumY+Point.Y;
  ptrPoint:=Point.ptrNextObj;
  Inc(CurPoint);
  end;
if (CurPoint = 0) then Raise Exception.Create('could not get bind point'); //. =>
X:=SumX/CurPoint;
Y:=SumY/CurPoint;
end;

procedure TEditingOrCreatingObject.Obj_GetP0Offset(const ptrObj: TPtr; const X,Y: Extended;  out dX,dY: Extended);
var
  Obj: TSpaceObj;
  CurPoint: integer;
  ptrPoint: TPtr;
  Point: TPoint;
begin
Reflector.Space.ReadObj(Obj,SizeOf(TSpaceObj), ptrObj);
ptrPoint:=Obj.ptrFirstPoint;
if (ptrPoint = nilPtr) then Raise Exception.Create('could not get P0 point'); //. =>
Reflector.Space.ReadObj(Point,SizeOf(Point), ptrPoint);
dX:=Point.X-X;
dY:=Point.Y-Y;
end;

procedure TEditingOrCreatingObject.Figure_ChangeScale(Figure: TFigureWinRefl; const Xc,Yc: Extended; const Scale: Extended);
var
  I: integer;
begin
with Figure do begin
for I:=0 to Count-1 do with Nodes[I] do begin
  X:=Xc+(X-Xc)*Scale;
  Y:=Yc+(Y-Yc)*Scale;
  end;
end;
end;

procedure TEditingOrCreatingObject.Figure_Rotate(Figure: TFigureWinRefl; const Xc,Yc: Extended; const Angle: Extended);
var
  I: integer;
  _X,_Y: Extended;
begin
with Figure do
for I:=0 to Count-1 do with Nodes[I] do begin
  _X:=Xc+(X-Xc)*Cos(Angle)+(Y-Yc)*(-Sin(Angle));
  _Y:=Yc+(X-Xc)*Sin(Angle)+(Y-Yc)*Cos(Angle);
  X:=_X;
  Y:=_Y;
  end;
end;

procedure TEditingOrCreatingObject.DoOnUpdate(Sender: TObject);
const
  UpdateCounter = 3;
  MinTranparencyCf = 0.8;
  MaxTranparencyCf = 0.4;
var
  I: integer;
begin
I:=1;
with Updater do begin
if (Tag MOD UpdateCounter) = 0
 then begin
  TranparencyCf:=TranparencyCf+Updater_dT;
  if Updater_dT > 0
   then begin
    if TranparencyCf > MinTranparencyCf
     then begin
      TranparencyCf:=MinTranparencyCf;
      Updater_dT:=-0.01;
      end;
    end
   else begin
    if TranparencyCf < MaxTranparencyCf
     then begin
      TranparencyCf:=MaxTranparencyCf;
      Updater_dT:=0.007;
      end;
    end;
  if (Panel <> nil) AND NOT Reflector.Reflecting.ReFormingLays.flReforming AND NOT Reflector.Reflecting.flReflecting AND NOT Reflector.Reflecting.flBriefReflecting
   then begin
    _Reflect(Reflector.BMPBuffer);
    end;
  end;
Tag:=Tag+1;
end;
end;


{TObjectEditor}
Constructor TObjectEditor.Create(const pReflector: TReflector; const pptrObject: TPtr);
begin
Inherited Create;
Reflector:=pReflector;
ptrObject:=pptrObject;
with WorkWindow do begin
Xmn:=-1; Ymn:=-1;
Xmx:=Xmn; Ymx:=Ymn;
end;
FigureWinRefl:=TFigureWinRefl.Create;
AdditiveFigureWinRefl:=TFigureWinRefl.Create;
Handles:=nil;
HandleSize:=8;
//.
EditingMode:=emNone;
EditingHandle:=nil;
EditingWidthScale:=1.0;
//.
Reflect;
end;

Destructor TObjectEditor.Destroy;
begin
//. clear working window
if ((WorkWindow.Xmn <> -1) AND (WorkWindow.Xmx <> -1)) then RestoreWorkWindow;
//.
Handles_Clear;
AdditiveFigureWinRefl.Free;
FigureWinRefl.Free;
Inherited;
end;

procedure TObjectEditor.Reflect;
begin
PostMessage(Reflector.Handle, WM_REFLECTOBJECTEDITOR,0,0);
end;

procedure TObjectEditor._Reflect;
begin
//. preparing figures
with Reflector do begin
if (Space.Obj_IsCached(ptrObject)) then Reflecting.Obj_PrepareFigures(ptrObject, ReflectionWindow,Reflecting.WindowRefl,  FigureWinRefl,AdditiveFigureWinRefl);
end;
//.
Handles_Prepare;
//.
UpdateWorkWindow;
//.
ReflectWorkWindow;
end;

procedure TObjectEditor.UpdateWorkWindow;
var
  I: integer;
begin
with WorkWindow do begin
Xmn:=-1; Ymn:=-1;
Xmx:=Xmn; Ymx:=Ymn;
if ((FigureWinRefl.CountScreenNodes = 0) AND (AdditiveFigureWinRefl.CountScreenNodes = 0)) then Exit; //. ->
//. calculating Min-Max
if (FigureWinRefl.CountScreenNodes > 0)
 then with FigureWinRefl do begin
  Xmn:=ScreenNodes[0].X; Ymn:=ScreenNodes[0].Y;
  Xmx:=Xmn; Ymx:=Ymn;
  for I:=1 to CountScreenNodes-1 do begin
    if ScreenNodes[I].X < Xmn
     then
      Xmn:=ScreenNodes[I].X
     else
      if ScreenNodes[I].X > Xmx
       then Xmx:=ScreenNodes[I].X;
    if ScreenNodes[I].Y < Ymn
     then
      Ymn:=ScreenNodes[I].Y
     else
      if ScreenNodes[I].Y > Ymx
       then Ymx:=ScreenNodes[I].Y;
    end;
  if (AdditiveFigureWinRefl.CountScreenNodes > 0)
   then with AdditiveFigureWinRefl do begin
    for I:=0 to CountScreenNodes-1 do begin
      if ScreenNodes[I].X < Xmn
       then
        Xmn:=ScreenNodes[I].X
       else
        if ScreenNodes[I].X > Xmx
         then Xmx:=ScreenNodes[I].X;
      if ScreenNodes[I].Y < Ymn
       then
        Ymn:=ScreenNodes[I].Y
       else
        if ScreenNodes[I].Y > Ymx
         then Ymx:=ScreenNodes[I].Y;
      end;
    end;
  end
 else
  if (AdditiveFigureWinRefl.CountScreenNodes > 0)
   then with AdditiveFigureWinRefl do begin
    Xmn:=ScreenNodes[0].X; Ymn:=ScreenNodes[0].Y;
    Xmx:=Xmn; Ymx:=Ymn;
    for I:=1 to CountScreenNodes-1 do begin
      if ScreenNodes[I].X < Xmn
       then
        Xmn:=ScreenNodes[I].X
       else
        if ScreenNodes[I].X > Xmx
         then Xmx:=ScreenNodes[I].X;
      if ScreenNodes[I].Y < Ymn
       then
        Ymn:=ScreenNodes[I].Y
       else
        if ScreenNodes[I].Y > Ymx
         then Ymx:=ScreenNodes[I].Y;
      end;
    end;
Xmn:=Xmn-Round(HandleSize/2); Ymn:=Ymn-Round(HandleSize/2);
Xmx:=Xmx+Round(HandleSize/2); Ymx:=Ymx+Round(HandleSize/2);
end;
end;

procedure TObjectEditor.ReflectWorkWindow;
const
  FigureColor = clWhite;
  AdditiveFigureColor = $0080FFFF;
  HandleColor = clYellow;
  SelectedHandleColor = clRed;
  HandleBorderColor = clBlack;

  procedure Handles_Reflect;
  var                                     
    I: integer;
    R: TRect;
  begin
  if (Handles <> nil)
   then with Reflector.Canvas do
    for I:=0 to Handles.Count-1 do with TObjectEditorHandle(Handles[I]^) do begin
      Pen.Width:=1;
      Pen.Color:=HandleBorderColor;
      if (NOT flSelected)
       then Brush.Color:=HandleColor
       else Brush.Color:=SelectedHandleColor;
      R.Left:=X-Round(HandleSize/2);
      R.Top:=Y-Round(HandleSize/2);
      R.Right:=R.Left+HandleSize;
      R.Bottom:=R.Top+HandleSize;
      //.
      FillRect(R);
      Rectangle(R);
      end;
  end;

begin
//. reflecting figures ...
Reflector.Canvas.Lock;
try
if (AdditiveFigureWinRefl.CountScreenNodes > 0)
 then with AdditiveFigureWinRefl do begin
  with Reflector.Canvas.Pen do begin
  Style:=psSolid;
  Width:=3;
  Color:=AdditiveFigureColor;
  end;
  Reflector.Canvas.PolyLine(Slice(ScreenNodes, CountScreenNodes));
  with Reflector.Canvas.Pen do begin
  Style:=psSolid;
  Width:=1;
  Color:=FigureColor;
  end;
  Reflector.Canvas.PolyLine(Slice(ScreenNodes, CountScreenNodes));
  end;
if (FigureWinRefl.CountScreenNodes > 0)
 then with FigureWinRefl do begin
  with Reflector.Canvas.Pen do begin
  Width:=1;
  Style:=psSolid;
  Color:=FigureColor;
  end;
  Reflector.Canvas.PolyLine(Slice(ScreenNodes, CountScreenNodes));
  end;
//. preparing and reflecting node handles
Handles_Reflect;
//.
finally
Reflector.Canvas.UnLock;
end;
end;

procedure TObjectEditor.RestoreWorkWindow;
begin
if (Reflector.Reflecting = nil) then Exit; //. ->
with WorkWindow do begin
Reflector.BMPBuffer.Canvas.Lock;
try
Reflector.Canvas.Lock;
try
BitBlt(Reflector.Canvas.Handle, Xmn,Ymn, (Xmx-Xmn+1),(Ymx-Ymn+1),  Reflector.BMPBuffer.Canvas.Handle, Xmn,Ymn, SRCCOPY);
finally
Reflector.Canvas.UnLock;
end;
finally
Reflector.BMPBuffer.Canvas.UnLock;
end;
end;
end;

function TObjectEditor.CheckEditingMode(const pX,pY: integer): TEditingMode;
var
  I: integer;
  H0,H1: pointer;
  Dist: Extended;
  WidthDist: Extended;
begin
Result:=emNone;
if (Handles <> nil)
 then begin
  for I:=0 to Handles.Count-1 do with TObjectEditorHandle(Handles[I]^) do
    if ((Abs(pX-X) < Round(HandleSize/2)) AND (Abs(pY-Y) < Round(HandleSize/2)))
     then begin
      Result:=emMoving;
      Exit; //. ->
      end;
  if (Handles_GetTwoNearestHandles(pX,pY,  H0,H1, Dist))
   then begin
    WidthDist:=(FigureWinRefl.Width*Reflector.ReflectionWindow.Scale)/2;
    if (Abs(Dist-WidthDist) < (HandleSize/2))
     then begin
      Result:=emWidthScaling;
      Exit; //. ->
      end;
    end;
  end;
end;

function TObjectEditor.SetEditingMode(const pX,pY: integer): TEditingMode;

  procedure DeselectAllHandles(const Handles: TList);
  var
    I: integer;
  begin
  for I:=0 to Handles.Count-1 do with TObjectEditorHandle(Handles[I]^) do flSelected:=false;
  end;

var
  I: integer;
  H0,H1: pointer;
  Dist: Extended;
  WidthDist: Extended;
begin
EditingMode:=emNone;
try
if (Handles <> nil)
 then begin
  for I:=0 to Handles.Count-1 do with TObjectEditorHandle(Handles[I]^) do
    if ((Abs(pX-X) < Round(HandleSize/2)) AND (Abs(pY-Y) < Round(HandleSize/2)))
     then begin
      EditingHandle:=Handles[I];
      //.
      DeselectAllHandles(Handles);
      TObjectEditorHandle(EditingHandle^).flSelected:=true;
      TObjectEditorHandle(EditingHandle^).flChanged:=false;
      //.
      Reflector.ptrSelectedObj:=ptrObject;
      Reflector.ptrSelectedPointObj:=Object_GetNodePtrByIndex(TObjectEditorHandle(EditingHandle^).NodeIndex);
      //.
      ReflectWorkWindow;
      //.
      EditingMode:=emMoving;
      Exit; //. ->
      end;
  if (Handles_GetTwoNearestHandles(pX,pY,  H0,H1, Dist))
   then begin
    WidthDist:=(FigureWinRefl.Width*Reflector.ReflectionWindow.Scale)/2;
    if (Abs(Dist-WidthDist) < (HandleSize/2))
     then begin
      if (FigureWinRefl.Width = 0.0)
       then begin
        FigureWinRefl.Width:=1.0;
        WidthDist:=(FigureWinRefl.Width*Reflector.ReflectionWindow.Scale)/2;
        end;
      EditingWidthScale:=(Dist/WidthDist);
      EditingMode:=emWidthScaling;
      Exit; //. ->
      end;
    end;
  end;
finally
Result:=EditingMode;
end;
end;

function TObjectEditor.IsEditing: boolean;
begin
Result:=(EditingMode <> emNone);
end;

procedure TObjectEditor.ProcessEditingPoint(const pX,pY: integer);
var
  H0,H1: pointer;
  Dist: Extended;
  WidthDist: Extended;
begin
case EditingMode of
emMoving:
  if (EditingHandle <> nil)
   then with TObjectEditorHandle(EditingHandle^) do begin
    if (flChanged OR ((sqr(pX-X)+sqr(pY-Y)) > sqr(HandleSize)))
     then begin
      RestoreWorkWindow;
      //. changing
      X:=pX;
      Y:=pY;
      FigureWinRefl.Nodes[NodeIndex].X:=X;
      FigureWinRefl.Nodes[NodeIndex].Y:=Y;
      //.
      RecalculateFiguresForNodeChanged;
      //.
      ReflectWorkWindow;
      //.
      flChanged:=true;
      end;
    end;
emWidthScaling:
  if (Handles_GetTwoNearestHandles(pX,pY,  H0,H1, Dist))
   then begin
    if (Dist < 1.0) then Dist:=0.0;
    //.
    if (FigureWinRefl.Width = 0.0) then FigureWinRefl.Width:=1.0;
    WidthDist:=(FigureWinRefl.Width*Reflector.ReflectionWindow.Scale)/2;
    //.
    RestoreWorkWindow;
    //. changing
    EditingWidthScale:=(Dist/WidthDist);
    //.
    RecalculateFiguresForWidthChanged;
    //.
    ReflectWorkWindow;
    end;
end;
end;

function TObjectEditor.GetSelectedHandleIndex: integer;
var
  I: integer;
begin
Result:=-1;
if (Handles <> nil)
 then
  for I:=0 to Handles.Count-1 do
    if (TObjectEditorHandle(Handles[I]^).flSelected)
     then begin
      Result:=TObjectEditorHandle(Handles[I]^).NodeIndex;
      Exit; //. ->
      end;
end;

procedure TObjectEditor.StopEditing;

  procedure AlignToFormatObj(var X,Y: TCrd);

    function GetNearestNode(FormatNodes: TList; out NX,NY: Extended): boolean;
    var
      I: integer;
      MinDistance,Distance: Extended;
    begin
    Result:=false;
    if (FormatNodes.Count = 0) then Raise Exception.Create('no format node found'); //. =>
    MinDistance:=Sqrt(sqr(TPoint(FormatNodes[1]^).X-TPoint(FormatNodes[0]^).X)+sqr(TPoint(FormatNodes[1]^).Y-TPoint(FormatNodes[0]^).Y));
    for I:=0 to FormatNodes.Count-1 do begin
      Distance:=Sqrt(sqr(TPoint(FormatNodes[I]^).X-X)+sqr(TPoint(FormatNodes[I]^).Y-Y));
      if Distance < MinDistance
       then begin
        NX:=TPoint(FormatNodes[I]^).X; NY:=TPoint(FormatNodes[I]^).Y;
        Result:=true;
        MinDistance:=Distance;
        end;
      end;
    end;

  var
    ptrReflLay: pointer;
    ptrItem: pointer;
    flDone: boolean;
    P: TPoint;
    ptrObj: TPtr;
    FormatNodes: TList;
    FormatSizeX,FormatSizeY: integer;
    NX,NY: Extended;
    ptrDestroyPoint: pointer;
    I: integer;
  begin
  with Reflector do begin
  P.X:=X; P.Y:=Y;
  with Reflecting do begin
  Lock.Enter;
  try
  flDone:=false;
  ptrReflLay:=Lays;
  while ptrReflLay <> nil do with TLayReflect(ptrReflLay^) do begin
    ptrItem:=Objects;
    while ptrItem <> nil do with TItemLayReflect(ptrItem^) do begin
      if (ptrObject <> ptrSelectedObj) AND Reflector.Space.Obj_IsCached(ptrObject) AND Reflector.Space.Obj_IsPointInside(P,ptrObject)
       then with TBase2DVisualizationFunctionality(TComponentFunctionality_Create(Space.Obj_IDType(ptrObject),Space.Obj_ID(ptrObject))) do
        try
        if GetFormatNodes(FormatNodes,FormatSizeX,FormatSizeY)
         then
          try
          if GetNearestNode(FormatNodes, NX,NY) then flDone:=true;
          finally
          for I:=0 to FormatNodes.Count-1 do begin
            ptrDestroyPoint:=FormatNodes[I];
            FreeMem(ptrDestroyPoint,SizeOf(TPoint));
            end;
          FormatNodes.Destroy;
          end
         else flDone:=false;
        finally
        Release;
        end;
      ptrItem:=ptrNext;
      end;
    ptrReflLay:=ptrNext;
    end;
  finally
  Lock.Leave;
  end;
  end;
  if flDone
   then begin
    X:=NX;
    Y:=NY;
    end;
  end;
  end;

var
  newX,newY: TCrd;
begin
try
try
case EditingMode of
emMoving:
  if (EditingHandle <> nil)
   then with TObjectEditorHandle(EditingHandle^) do begin
    try
    if (flChanged)
     then begin
      Reflector.ptrSelectedPointObj:=nilPtr;
      //.
      Reflector.ConvertScrCrd2RealCrd(X,Y, newX,newY);
      AlignToFormatObj(newX,newY);
      with TBase2DVisualizationFunctionality(TComponentFunctionality_Create(Reflector.Space.Obj_IDType(ptrObject),Reflector.Space.Obj_ID(ptrObject))) do
      try
      SetNode(NodeIndex, newX,newY);
      finally
      Release;
      end;
      //.
      flSelected:=false;
      flChanged:=false;
      end;
    finally
    EditingHandle:=nil;
    end;
    end;
emWidthScaling:
  if (EditingWidthScale <> 1)
   then begin
    try
    with TBase2DVisualizationFunctionality(TComponentFunctionality_Create(Reflector.Space.Obj_IDType(ptrObject),Reflector.Space.Obj_ID(ptrObject))) do
    try
    Width:=(FigureWinRefl.Width*EditingWidthScale);
    finally
    Release;
    end;
    finally
    EditingWidthScale:=1.0;
    end;
    end;
end;
finally
EditingMode:=emNone;
end;
except
  RestoreWorkWindow;
  //.
  Reflect;
  //.
  Raise; //. =>
  end;
end;

procedure TObjectEditor.Handles_Prepare;
var
  I: integer;
  ptrNewHandle: pointer;
begin
Handles_Clear;
with FigureWinRefl do
for I:=0 to Count-1 do with Nodes[I] do begin
  Reflector.ReflectionWindow.Lock.Enter;
  try
  if (((X-Reflector.ReflectionWindow.Xmn)*(X-Reflector.ReflectionWindow.Xmx) < 0) AND ((Y-Reflector.ReflectionWindow.Ymn)*(Y-Reflector.ReflectionWindow.Ymx) < 0))
   then begin
    if (Handles = nil) then Handles:=TList.Create;
    GetMem(ptrNewHandle,SizeOf(TObjectEditorHandle));
    TObjectEditorHandle(ptrNewHandle^).X:=Round(X);
    TObjectEditorHandle(ptrNewHandle^).Y:=Round(Y);
    TObjectEditorHandle(ptrNewHandle^).NodeIndex:=I;
    TObjectEditorHandle(ptrNewHandle^).flSelected:=false;
    Handles.Add(ptrNewHandle);
    end;
  finally
  Reflector.ReflectionWindow.Lock.Leave;
  end;
  end;
end;

procedure TObjectEditor.Handles_Clear;
var
  ptrDestroyHandle: pointer;
  I: integer;
begin
if (Handles <> nil)
 then begin
  for I:=0 to Handles.Count-1 do begin
    ptrDestroyHandle:=Handles[I];
    FreeMem(ptrDestroyHandle,SizeOf(TObjectEditorHandle));
    end;
  FreeAndNil(Handles);
  EditingHandle:=nil;
  end;
end;

function TObjectEditor.Handles_GetTwoNearestHandles(const pX,pY: integer; out Handle0,Handle1: pointer; out Dist: Extended): boolean;
var
  I: integer;
  MinDist,D: Extended;
begin
Result:=false;
if (Handles <> nil)
 then begin
  Handle0:=nil;
  Handle1:=nil;
  MinDist:=MaxExtended;
  for I:=0 to Handles.Count-2 do
    if (Line_GetPointDist(TObjectEditorHandle(Handles[I]^).X,TObjectEditorHandle(Handles[I]^).Y,TObjectEditorHandle(Handles[I+1]^).X,TObjectEditorHandle(Handles[I+1]^).Y, pX,pY, D))
     then
      if (D < MinDist)
       then begin
        Handle0:=Handles[I];
        Handle1:=Handles[I+1];
        MinDist:=D;
        end;
  if ((FigureWinRefl.flagLoop) AND (TObjectEditorHandle(Handles[0]^).NodeIndex = 0) AND (TObjectEditorHandle(Handles[Handles.Count-1]^).NodeIndex = (FigureWinRefl.Count-1)))
   then
    if (Line_GetPointDist(TObjectEditorHandle(Handles[Handles.Count-1]^).X,TObjectEditorHandle(Handles[Handles.Count-1]^).Y,TObjectEditorHandle(Handles[0]^).X,TObjectEditorHandle(Handles[0]^).Y, pX,pY, D))
     then
      if (D < MinDist)
       then begin
        Handle0:=Handles[Handles.Count-1];
        Handle1:=Handles[0];
        MinDist:=D;
        end;
  Result:=((Handle0 <> nil) AND (Handle1 <> nil));
  if (Result) then Dist:=MinDist;
  end;
end;

procedure TObjectEditor.RecalculateFiguresForNodeChanged;
begin
FigureWinRefl.AttractToLimits(Reflector.Reflecting.WindowRefl, nil);
FigureWinRefl.Optimize;
//.
if FigureWinRefl.Width > 0
 then with AdditiveFigureWinRefl do begin
  Assign(FigureWinRefl);
  if ValidateAsPolyLine(Reflector.ReflectionWindow.Scale)
   then begin
    AttractToLimits(Reflector.Reflecting.WindowRefl, nil);
    Optimize;
    end;
  end;
//.
UpdateWorkWindow;
end;

procedure TObjectEditor.RecalculateFiguresForWidthChanged;
begin
FigureWinRefl.AttractToLimits(Reflector.Reflecting.WindowRefl, nil);
FigureWinRefl.Optimize;
if FigureWinRefl.Width > 0
 then with AdditiveFigureWinRefl do begin
  Assign(FigureWinRefl);
  if ValidateAsPolyLine(Reflector.ReflectionWindow.Scale*EditingWidthScale)
   then begin
    AttractToLimits(Reflector.Reflecting.WindowRefl, nil);
    Optimize;
    end;
  end;
//.
UpdateWorkWindow;
end;

function TObjectEditor.Line_GetPointDist(const X0,Y0,X1,Y1: integer; const X,Y: integer; out D: Extended): boolean;
var
   C,QdC,A1,QdA2,QdB2,QdD: Extended;
begin
QdC:=sqr(X1-X0)+sqr(Y1-Y0);
C:=Sqrt(QdC);
QdA2:=sqr(X-X0)+sqr(Y-Y0);
QdB2:=sqr(X-X1)+sqr(Y-Y1);
A1:=(QdC-QdB2+QdA2)/(2*C);
QdD:=QdA2-Sqr(A1);
if ((QdA2-QdD) < QdC) AND ((QdB2-QdD) < QdC)
 then begin
  D:=Sqrt(QdD);
  Result:=true;
  end
 else Result:=false;
end;

function TObjectEditor.Object_GetNodePtrByIndex(const NodeIndex: integer): TPtr;
var
  Obj: TSpaceObj;
  ptrPoint: TPtr;
  Point: TPoint;
  Index: integer;
begin
Result:=nilPtr;
with Reflector do begin
Space.ReadObjLocalStorage(Obj,SizeOf(TSpaceObj), ptrObject);
ptrPoint:=Obj.ptrFirstPoint;
Index:=0;
while ptrPoint <> nilPtr do begin
  Space.ReadObjLocalStorage(Point,SizeOf(Point), ptrPoint);
  if (Index = NodeIndex)
   then begin
    Result:=ptrPoint;
    Exit; //. ->
    end;
  //.
  Inc(Index);
  ptrPoint:=Point.ptrNextObj;
  end;
end;
end;


{TSelectedRegion}
Constructor TSelectedRegion.Create(pReflector: TReflector);
begin
Inherited Create;
Reflector:=pReflector;
with Rectangle do begin
Left:=0;
Top:=0;
Right:=Left;
Bottom:=Top;
end;
ReflectionID:=-1;
end;

Destructor TSelectedRegion.Destroy;
begin
Clear;
Inherited;
end;

procedure TSelectedRegion.Clear;
var
  L,T: integer;
begin
if (Reflector.Reflecting = nil) then Exit; //. ->
with Rectangle do if (Left = Right) OR (Top = Bottom) then Exit; //. ->
//.
if (Rectangle.Left < Rectangle.Right) then L:=Rectangle.Left else L:=Rectangle.Right;
if (Rectangle.Top < Rectangle.Bottom) then T:=Rectangle.Top else T:=Rectangle.Bottom;
//.
if (ReflectionID = Reflector.Reflecting.ReflectionFrameID)
 then begin
  Reflector.BMPBuffer.Canvas.Lock;
  try
  Reflector.Canvas.Lock;
  try
  BitBlt(Reflector.Canvas.Handle, L,T,Abs(Rectangle.Right-Rectangle.Left)+1,Abs(Rectangle.Bottom-Rectangle.Top)+1,  Reflector.BMPBuffer.Canvas.Handle, L,T, SRCCOPY);
  finally
  Reflector.Canvas.UnLock;
  end;
  finally
  Reflector.BMPBuffer.Canvas.UnLock;
  end;
  end;
//.
with Rectangle do begin
Right:=Left;
Bottom:=Top;
end;
end;

procedure TSelectedRegion.Paint;
var
  PS: TPenStyle;
  PM: TPenMode;
  BS: TBrushStyle;
  CM: TCopyMode;
begin
with Rectangle do if (Left = Right) OR (Top = Bottom) then Exit; //. ->
//.
Reflector.Canvas.Lock;
try
ReflectionID:=Reflector.Reflecting.ReflectionFrameID;
//.
with Reflector.Canvas do begin
PS:=Pen.Style;
try
PM:=Pen.Mode;
try
BS:=Brush.Style;
try
Pen.Color:=clWhite;
Pen.Style:=psDashDotDot;
Brush.Color:=clBlack;
Brush.Style:=bsClear;
Rectangle(Self.Rectangle);
finally
Brush.Style:=BS;
end;
finally
Pen.Mode:=PM;
end;
finally
Pen.Style:=PS;
end;
end;
finally
Reflector.Canvas.UnLock;
end;
end;

function TSelectedRegion.flSet(): boolean;
begin
with Rectangle do Result:=((Left = Right) OR (Top = Bottom));
end;

procedure TSelectedRegion.SetBegin(pX,pY: integer);
begin
Clear;
//.
with Rectangle do begin
Left:=pX;
Top:=pY;
Right:=Left;
Bottom:=Top;
end;
Paint;
end;

procedure TSelectedRegion.SetEnd(pX,pY: integer);
begin
Clear;
//.
with Rectangle do begin
Right:=pX;
Bottom:=pY;
end;
Paint;
end;

procedure TSelectedRegion.SetReflectorWindow;
var
  Ex: integer;
  F,_f,dX,dY: Extended;
  _Xmn,_Ymn,_Xmx,_Ymx: Extended;
  _X0,_Y0, _X1,_Y1, _X2,_Y2, _X3,_Y3: TCrd;
begin
with Rectangle do if (Left = Right) OR (Top = Bottom) then Exit; //. ->
//.
Reflector.Reflecting.CancelRRR(); //. cancel reforming,reflecting,revising
//.
with Reflector.ReflectionWindow do begin
Lock.Enter;
try
F:=(Xmx-Xmn)/(Ymx-Ymn);
with Rectangle do begin
if Left > Right then begin Ex:=Left; Left:=Right; Right:=Ex; end;
if Top > Bottom then begin Ex:=Top; Top:=Bottom; Bottom:=Ex; end;
_f:=(Right-Left)/(Bottom-Top);
if F > _f
 then begin
  _Ymn:=Top;
  _Ymx:=Bottom;
  dX:=(F*(Bottom-Top)-(Right-Left))/2;
  _Xmn:=Left-dX;
  _Xmx:=Right+dX;
  end
 else begin
  _Xmn:=Left;
  _Xmx:=Right;
  dY:=((Right-Left)/F-(Bottom-Top))/2;
  _Ymn:=Top-dY;
  _Ymx:=Bottom+dY;
  end
end;
Reflector.ConvertScrExtendCrd2RealCrd(_Xmn,_Ymn, _X0,_Y0);
Reflector.ConvertScrExtendCrd2RealCrd(_Xmx,_Ymn, _X1,_Y1);
Reflector.ConvertScrExtendCrd2RealCrd(_Xmx,_Ymx, _X2,_Y2);
Reflector.ConvertScrExtendCrd2RealCrd(_Xmn,_Ymx, _X3,_Y3);
X0:=_X0*cfTransMeter;Y0:=_Y0*cfTransMeter;
X1:=_X1*cfTransMeter;Y1:=_Y1*cfTransMeter;
X2:=_X2*cfTransMeter;Y2:=_Y2*cfTransMeter;
X3:=_X3*cfTransMeter;Y3:=_Y3*cfTransMeter;
Update;
finally
Lock.Leave;
end;
end;
//.
Clear;
//. show new view
with Reflector do begin
//.
if (Reflecting.Configuration.BriefReflectingType = brtPartialWithLastReflection)
 then begin
  Reflecting.LastReflectedBitmap.BMP_Clear();
  DynamicHints.Clear();
  end;
//.
if (XYToGeoCrdConverter <> nil) then TfmXYToGeoCrdConvertor(XYToGeoCrdConverter).GeoObjectTracks.ClearSelectedItems(); 
//.
Reflecting.RecalcReflect;
//.
DoOnPositionChange();
//.
UpdateCompass();
UpdateGeoCompass();
//.
flReflectionChanged:=true;
end;
end;


{TDynamicHints}
Constructor TDynamicHints.Create(const pReflector: TReflector);
begin
Inherited Create;
Lock:=TCriticalSection.Create();
Reflector:=pReflector;
Items:=nil;
Items_Count:=0;
Items_MaxCount:=200;
flEnabled:=true;
VisibleFactor:=1;
UserDynamicHints:=TUserDynamicHints.Create(Self);
end;

Destructor TDynamicHints.Destroy;
begin
UserDynamicHints.Free();
Clear();
Lock.Free();
Inherited;
end;

procedure TDynamicHints.Clear;
var
  ptrDestroyItem: pointer;
begin
Lock.Enter;
try
while (Items <> nil) do begin
  ptrDestroyItem:=Items;
  Items:=TDynamicHint(ptrDestroyItem^).Next;
  //.
  DestroyItem(ptrDestroyItem);
  end;
Items_Count:=0;
finally
Lock.Leave;
end;
end;

function TDynamicHints.IsEmpty: boolean;
begin
Lock.Enter;
try
Result:=(Items = nil);
finally
Lock.Leave;
end;
end;

procedure TDynamicHints.EnqueueItemForShow(const ptrHintObj: TPtr; const idHintVisualization: integer; const pBindingPointX,pBindingPointY: Extended; const pBaseSquare: integer);
var
  flItemFound: boolean;
  ptrItem: pointer;
begin
if (NOT flEnabled) then Exit; //. ->
flItemFound:=false;
Lock.Enter;
try
ptrItem:=Items;
while (ptrItem <> nil) do
  if (TDynamicHint(ptrItem^).ptrObj = ptrHintObj)
   then begin
    flItemFound:=true;
    Break; //. >
    end
   else ptrItem:=TDynamicHint(ptrItem^).Next;
//.
if (NOT flItemFound)
 then begin
  ptrItem:=CreateItem();
  with TDynamicHint(ptrItem^) do begin
  id:=idHintVisualization;
  ptrObj:=ptrHintObj;
  end;
  //.
  TDynamicHint(ptrItem^).Next:=Items;
  Items:=ptrItem;
  Inc(Items_Count);
  end;
Item_SetBindingPoint(ptrItem, pBindingPointX,pBindingPointY, pBaseSquare);
finally
Lock.Leave;
end;                                
end;

procedure TDynamicHints.ShowItems(const BMP: TBitmap; const ptrCancelFlag: pointer; const BestBeforeTime: TDateTime);
var
  ptrItem: pointer;
begin
if (NOT flEnabled) then Exit; //. ->
//.
Lock.Enter;
try
//.
ptrItem:=Items;
while (ptrItem <> nil) do begin
  Item_Show(ptrItem, BMP);
  //.
  if (ptrCancelFlag <> nil)
   then begin
    Sleep(0); //. exit from the current thread to alow the cancel flag to be set
    if (Boolean(ptrCancelFlag^)) then Raise EUnnecessaryExecuting.Create(''); //. =>
    end;
  //.
  if (Now > BestBeforeTime) then Break; //. >
  //. next
  ptrItem:=TDynamicHint(ptrItem^).Next;
  end;
//. show visible user hints here 
UserDynamicHints.ShowVisibleItems(BMP,ptrCancelFlag,BestBeforeTime);
finally
Lock.Leave;
end;
end;

function TDynamicHints.GetHintExtent(const ptrHintObj: TPtr; out Extent: TRect): boolean;
var
  ptrItem: pointer;
begin
Result:=false;
Lock.Enter;
try
ptrItem:=Items;
while (ptrItem <> nil) do begin
  if (TDynamicHint(ptrItem^).ptrObj = ptrHintObj)
   then begin
    Extent:=TDynamicHint(ptrItem^).Extent;
    Result:=true;
    Exit; //. ->
    end;
  //. next
  ptrItem:=TDynamicHint(ptrItem^).Next;
  end;
finally
Lock.Leave;
end;
end;

function TDynamicHints.GetItemAtPoint(const P: TScreenNode; out ptrItem: pointer): boolean;
var
  _ptrItem: pointer;
begin
Result:=false;
ptrItem:=nil;
Lock.Enter;
try
_ptrItem:=Items;
while (_ptrItem <> nil) do begin
  with TDynamicHint(_ptrItem^).Extent do
  if (((Left <= P.X) AND (P.X <= Right)) AND ((Top <= P.Y) AND (P.Y <= Bottom)))
   then ptrItem:=_ptrItem;
  //. next
  _ptrItem:=TDynamicHint(_ptrItem^).Next;
  end;
finally
Lock.Leave;
end;
Result:=(ptrItem <> nil);
end;

function TDynamicHints.IsItemExist(const ptrHintObj: TPtr): boolean;
begin
Result:=(GetItem(ptrHintObj) <> nil);
end;

function TDynamicHints.GetItem(const ptrHintObj: TPtr): pointer;
begin
Lock.Enter;
try
Result:=Items;
while (Result <> nil) do begin
  if (TDynamicHint(Result^).ptrObj = ptrHintObj) then Exit; //. ->
  //. next
  Result:=TDynamicHint(Result^).Next;
  end;
finally
Lock.Leave;
end;
end;

function TDynamicHints.RemoveItem(const ptrHintObj: TPtr): boolean;
var
  ptrptrHintItem,ptrHintItem: pointer;
begin
Result:=false;
Lock.Enter;
try
ptrptrHintItem:=@Items;
while (Pointer(ptrptrHintItem^) <> nil) do begin
  ptrHintItem:=Pointer(ptrptrHintItem^);
  if (TDynamicHint(ptrHintItem^).ptrObj = ptrHintObj)
   then begin
    Pointer(ptrptrHintItem^):=TDynamicHint(ptrHintItem^).Next;
    DestroyItem(ptrHintItem);
    Dec(Items_Count);
    Result:=true;
    Exit; //. ->
    end
   else ptrptrHintItem:=@TDynamicHint(ptrHintItem^).Next;
  end;
finally
Lock.Leave;
end;
end;

procedure TDynamicHints.ReformFromReflectingLays;
label
  CheckExitLabel;
var
  ptrptrHintItem,ptrHintItem: pointer;
  ptrLay: pointer;
  ptrItem: pointer;
  flItemFound: boolean;
begin
with Reflector.Reflecting do begin
Lock.Enter;
try
Self.Lock.Enter;
try
ptrptrHintItem:=@Items;
while (Pointer(ptrptrHintItem^) <> nil) do begin
  ptrHintItem:=Pointer(ptrptrHintItem^);
  //.
  flItemFound:=false;
  ptrLay:=Lays;
  while (ptrLay <> nil) do with TLayReflect(ptrLay^) do begin
    ptrItem:=Objects;
    while (ptrItem <> nil) do with TItemLayReflect(ptrItem^) do begin
      if (ptrObject = TDynamicHint(ptrHintItem^).ptrObj)
       then begin
        flItemFound:=true;
        GoTo CheckExitLabel; //. >
        end;
      ptrItem:=ptrNext;
      end;
    ptrLay:=ptrNext;
    end;
  CheckExitLabel: ;
  //.
  if (NOT flItemFound)
   then begin
    Pointer(ptrptrHintItem^):=TDynamicHint(ptrHintItem^).Next;
    DestroyItem(ptrHintItem);
    Dec(Items_Count);
    end
   else ptrptrHintItem:=@TDynamicHint(ptrHintItem^).Next;
  end;
//. clear visible state for items of user hints 
UserDynamicHints.ClearItemsVisibleState();
finally
Self.Lock.Leave;
end;
finally
Lock.Leave;
end;
end;
end;

procedure TDynamicHints.FormItems(const BMP: TBitmap; const ptrCancelFlag: pointer);

  function CalculateItemExtentNoIntersection(const ptrCalcItem: pointer; var NewExtent: TRect): boolean;
  var
    ptrItem: pointer;
  begin
  Result:=false;
  NewExtent:=TDynamicHint(ptrCalcItem^).Extent;
  Result:=false;
  ptrItem:=Items;
  while (ptrItem <> nil) do begin
    if (ptrItem <> ptrCalcItem)
     then with TDynamicHint(ptrItem^).Extent do begin
      if (NOT ((Left > NewExtent.Right) OR (Top > NewExtent.Bottom) OR (Right < NewExtent.Left) OR (Bottom < NewExtent.Top)))
       then begin
        if ((Left > NewExtent.Left) AND (Left < NewExtent.Right)) then begin NewExtent.Right:=Left; Result:=true; end;
        end;
      end;
    //. next
    ptrItem:=TDynamicHint(ptrItem^).Next;
    end;
  end;

var
  RW_Xmd,RW_Ymd: integer;
  NewItems: pointer;
  ptrptrItem,ptrItem: pointer;
  I: integer;
  NewExtent: TRect;
begin
RW_Xmd:=(BMP.Width SHR 1);
RW_Ymd:=(BMP.Height SHR 1);
//.
Lock.Enter;
try
//. order items from Max to Min square and remove out of limit items
if (Items_Count > Items_MaxCount)
 then begin
  NewItems:=nil;
  while (Items <> nil) do begin
    ptrItem:=Items;
    Items:=TDynamicHint(ptrItem^).Next;
    //.
    with TDynamicHint(ptrItem^).Extent do
    ptrptrItem:=@NewItems;
    while ((Pointer(ptrptrItem^) <> nil) AND (TDynamicHint(Pointer(ptrptrItem^)^).BaseSquare > TDynamicHint(ptrItem^).BaseSquare)) do
      ptrptrItem:=@TDynamicHint(Pointer(ptrptrItem^)^).Next;
    while ((Pointer(ptrptrItem^) <> nil) AND (TDynamicHint(Pointer(ptrptrItem^)^).BaseSquare = TDynamicHint(ptrItem^).BaseSquare)) do
      if ((sqr(TDynamicHint(Pointer(ptrptrItem^)^).BindingPointX-RW_Xmd)+sqr(TDynamicHint(Pointer(ptrptrItem^)^).BindingPointY-RW_Ymd)) < (sqr(TDynamicHint(ptrItem^).BindingPointX-RW_Xmd)+sqr(TDynamicHint(ptrItem^).BindingPointY-RW_Ymd)))
       then ptrptrItem:=@TDynamicHint(Pointer(ptrptrItem^)^).Next
       else Break; //. >
    TDynamicHint(ptrItem^).Next:=Pointer(ptrptrItem^);
    Pointer(ptrptrItem^):=ptrItem;
    end;
  ptrItem:=NewItems;
  for I:=0 to Items_MaxCount-2 do ptrItem:=TDynamicHint(ptrItem^).Next;
  //. remove out of limit items
  Items:=TDynamicHint(ptrItem^).Next;
  TDynamicHint(ptrItem^).Next:=nil;
  Clear();
  //.
  Items:=NewItems;
  Items_Count:=Items_MaxCount;
  end;
//.
ptrItem:=Items;
while (ptrItem <> nil) do begin
  if (NOT TDynamicHint(ptrItem^).flInfoIsUpdated) then Item_UpdateInfo(ptrItem);
  //.
  if (ptrCancelFlag <> nil)
   then begin
    Sleep(0); //. exit from the current thread to alow the cancel flag to be set
    if (Boolean(ptrCancelFlag^)) then Raise EUnnecessaryExecuting.Create(''); //. =>
    end;
  //. next
  ptrItem:=TDynamicHint(ptrItem^).Next;
  end;
{///- not needed because of updating extents in ShowItems
//. form items extents
ptrItem:=Items;
while (ptrItem <> nil) do begin
  Item_UpdateExtent(BMP,ptrItem);
  //.
  if (ptrCancelFlag <> nil)
   then begin
    Sleep(0); //. exit from the current thread to alow the cancel flag to be set
    if (Boolean(ptrCancelFlag^)) then Raise EUnnecessaryExecuting.Create(''); //. =>
    end;
  //. next
  ptrItem:=TDynamicHint(ptrItem^).Next;
  end;}
//. correct item's extents
(*///?ptrItem:=Items;
while (ptrItem <> nil) do begin
  if (CalculateItemExtentNoIntersection(ptrItem, NewExtent))
   then Item_UpdateExtent(ptrItem, @NewExtent);
  //.
  if (ptrCancelFlag <> nil)
   then begin
    Sleep(0); //. exit from the current thread to alow the cancel flag to be set
    if (Boolean(ptrCancelFlag^)) then Raise EUnnecessaryExecuting.Create(''); //. =>
    end;
  //. next
  ptrItem:=TDynamicHint(ptrItem^).Next;
  end;*)
finally
Lock.Leave;
end;
end;

function TDynamicHints.GetVisibleFactor(): Extended;
begin
Lock.Enter;
try
Result:=VisibleFactor;
finally
Lock.Leave;
end;
end;

procedure TDynamicHints.SetVisibleFactor(const Value: Extended);
begin
if (Value = 0)
 then begin
  if (VisibleFactor > 0)
   then begin
    flEnabled:=false;
    with Reflector.Reflecting do ReFresh();
    end;
  end
 else begin
  if (VisibleFactor = 0)
   then begin
    flEnabled:=true;
    Reflector.Reflecting.ReFresh();
    end
   else with Reflector.Reflecting do ReFresh();
  end;
Lock.Enter;
try
VisibleFactor:=Value;
finally
Lock.Leave;
end;
end;

procedure TDynamicHints.BindingPoints_Shift(const dX,dY: Extended);
var
  W,H: integer;
  ptrItem: pointer;
begin
Lock.Enter;
try
ptrItem:=Items;
while (ptrItem <> nil) do with TDynamicHint(ptrItem^) do begin
  BindingPointX:=BindingPointX+dX;
  BindingPointY:=BindingPointY+dY;
  W:=(Extent.Right-Extent.Left); H:=(Extent.Bottom-Extent.Top);
  Extent.Left:=Round(BindingPointX); Extent.Bottom:=Round(BindingPointY);
  Extent.Right:=Extent.Left+W; Extent.Top:=Extent.Bottom-H;
  //. next
  ptrItem:=Next;
  end;
UserDynamicHints.BindingPoints_Shift(dX,dY);
finally
Lock.Leave;
end;
end;

procedure TDynamicHints.BindingPoints_Scale(const Xc,Yc: Extended; const Scale: Extended);
var
  W,H: integer;
  ptrItem: pointer;
begin
Lock.Enter;
try
ptrItem:=Items;
while (ptrItem <> nil) do with TDynamicHint(ptrItem^) do begin
  BindingPointX:=Xc+(BindingPointX-Xc)*Scale;
  BindingPointY:=Yc+(BindingPointY-Yc)*Scale;
  W:=(Extent.Right-Extent.Left); H:=(Extent.Bottom-Extent.Top);
  Extent.Left:=Round(BindingPointX); Extent.Bottom:=Round(BindingPointY);
  Extent.Right:=Extent.Left+W; Extent.Top:=Extent.Bottom-H;
  //. next
  ptrItem:=Next;
  end;
UserDynamicHints.BindingPoints_Scale(Xc,Yc,Scale);
finally
Lock.Leave;
end;
end;

procedure TDynamicHints.BindingPoints_Rotate(const Xc,Yc: Extended; const Angle: Extended);
var
  W,H: integer;
  ptrItem: pointer;
  _X,_Y: Extended;
begin
Lock.Enter;
try
ptrItem:=Items;
while (ptrItem <> nil) do with TDynamicHint(ptrItem^) do begin
  _X:=Xc+(BindingPointX-Xc)*Cos(Angle)+(BindingPointY-Yc)*(-Sin(Angle));
  _Y:=Yc+(BindingPointX-Xc)*Sin(Angle)+(BindingPointY-Yc)*Cos(Angle);
  BindingPointX:=_X;
  BindingPointY:=_Y;
  W:=(Extent.Right-Extent.Left); H:=(Extent.Bottom-Extent.Top);
  Extent.Left:=Round(BindingPointX); Extent.Bottom:=Round(BindingPointY);
  Extent.Right:=Extent.Left+W; Extent.Top:=Extent.Bottom-H;
  //. next
  ptrItem:=Next;
  end;
UserDynamicHints.BindingPoints_Rotate(Xc,Yc,Angle);
finally
Lock.Leave;
end;
end;

function TDynamicHints.CreateItem: pointer;
begin
GetMem(Result,SizeOf(TDynamicHint));
FillChar(Result^,SizeOf(TDynamicHint), 0);
end;

procedure TDynamicHints.DestroyItem(var ptrDestroy: pointer);
begin
with TDynamicHint(ptrDestroy^) do begin
InfoString:='';
InfoStringFontName:='';
{///- InfoText:='';
InfoTextFontName:='';
StatusInfoText:='';}
end;
FreeMem(ptrDestroy,SizeOf(TDynamicHint));
ptrDestroy:=nil;
end;

procedure TDynamicHints.Item_UpdateInfo(const ptrItem: pointer);
var
  ptrCacheItem: pointer;
  DATAFilePtr: pointer;
  MS: TMemoryStream;
begin
//. init
with TDynamicHint(ptrItem^) do begin
InfoString:='';
end;
//.
SystemTHINTVisualization.Lock.Enter;
try
if NOT TSystemTHINTVisualization(SystemTHINTVisualization).Cash.GetItem(TDynamicHint(ptrItem^).id, ptrCacheItem) then Exit; //. ->
//.
with TDynamicHint(ptrItem^),TItemTHINTVisualizationCash(ptrCacheItem^) do begin
InfoImageDATAFileID:=idDATAFile;
InfoString:=ParsedDataV1.InfoString;
InfoStringFontName:=ParsedDataV1.InfoStringFontName;
InfoStringFontSize:=ParsedDataV1.InfoStringFontSize;
InfoStringFontColor:=ParsedDataV1.InfoStringFontColor;
{///- InfoText:=ParsedDataV1.InfoText;
InfoTextFontName:=ParsedDataV1.InfoTextFontName;
InfoTextFontSize:=ParsedDataV1.InfoTextFontSize;
InfoTextFontColor:=ParsedDataV1.InfoTextFontColor;}
InfoComponent:=ParsedDataV1.InfoComponent;
///- StatusInfoText:=ParsedDataV1.StatusInfoText;
Transparency:=ParsedDataV1.Transparency;
//.
flInfoIsUpdated:=true;
end;
finally
SystemTHINTVisualization.Lock.Leave;
end;
end;

procedure TDynamicHints.Item_UpdateExtent(const BMP: TBitmap; const ptrItem: pointer; const ptrNewExtent: pointer = nil);
var
  DATAFilePtr: pointer;
  TW: integer;
begin
try
with TDynamicHint(ptrItem^) do begin
//. update extent
if (ptrNewExtent = nil)
 then with Extent do begin
  Left:=Trunc(BindingPointX);
  Bottom:=Trunc(BindingPointY);
  Right:=Left;
  Top:=Bottom;
  //. resize by InfoImage
  if ((InfoImageDATAFileID <> 0) AND TSystemTHINTVisualization(SystemTHINTVisualization).Cash.DATAFileRepository.DATAFile_Lock(InfoImageDATAFileID,{out} DATAFilePtr))
   then with THINTVisualizationDATAFile(DATAFilePtr^) do
    try
    Right:=Right+DATA.Width;
    Top:=Top-DATA.Height;
    finally
    TSystemTHINTVisualization(SystemTHINTVisualization).Cash.DATAFileRepository.DATAFile_Unlock(DATAFilePtr);
    end;
  //.
  with BMP.Canvas do begin
  if (Font.Name <> InfoStringFontName) then Font.Name:=InfoStringFontName;
  if (Font.Size <> InfoStringFontSize) then Font.Size:=InfoStringFontSize;
  TW:=TextWidth(InfoString);
  end;
  Right:=Right+TW;
  end
 else TDynamicHint(ptrItem^).Extent:=TRect(ptrNewExtent^);
end;
except
  end;
end;
procedure TDynamicHints.Item_SetBindingPoint(const ptrItem: pointer; const pBindingPointX,pBindingPointY: Extended; const pBaseSquare: integer);
begin
TDynamicHint(ptrItem^).BindingPointX:=pBindingPointX;
TDynamicHint(ptrItem^).BindingPointY:=pBindingPointY;
TDynamicHint(ptrItem^).BaseSquare:=pBaseSquare;
end;

procedure TDynamicHints.Item_Show(const ptrItem: pointer; const BMP: TBitmap);

  procedure DrawTextNOT(const hDC: HDC; const Font: TFont; const Text: string; const X, Y: integer);
  begin
  with TBitmap.Create() do
  try
  Canvas.Lock();
  try
  Canvas.Font.Assign(Font);
  with Canvas.TextExtent(Text) do begin
  Width:=cx;
  Height:=cy;
  end;
  Canvas.Brush.Color := clBlack;
  Canvas.FillRect(Rect(0, 0, Width, Height));
  Canvas.Font.Color := clWhite;
  Canvas.TextOut(0, 0, Text);
  BitBlt(hDC, X, Y, Width, Height, Canvas.Handle, 0, 0, SRCINVERT);
  finally
  Canvas.Unlock();
  end;
  finally
  Destroy();
  end;
  end;

var
  DATAFilePtr: pointer;
  OldBkMode: integer;
begin 
try
with TDynamicHint(ptrItem^) do begin
//. 
with Extent do begin
Left:=Trunc(BindingPointX);
Bottom:=Trunc(BindingPointY);
Right:=Left;
Top:=Bottom;
end;
//.
BMP.Canvas.Lock();
try
if ((InfoImageDATAFileID <> 0) AND TSystemTHINTVisualization(SystemTHINTVisualization).Cash.DATAFileRepository.DATAFile_Lock(InfoImageDATAFileID,{out} DATAFilePtr))
 then with THINTVisualizationDATAFile(DATAFilePtr^) do
  try
  with Extent do begin
  Right:=Right+DATA.Width;
  Top:=Top-DATA.Height;
  end;
  DATA.Canvas.Lock();
  try
  TransparentBlt(BMP.Canvas.Handle, Extent.Left,Extent.Top,DATA.Width,DATA.Height, DATA.Canvas.Handle, 0,0,DATA.Width,DATA.Height, DATA.Canvas.Pixels[0,0]);
  finally
  DATA.Canvas.Unlock();
  end;
  finally
  TSystemTHINTVisualization(SystemTHINTVisualization).Cash.DATAFileRepository.DATAFile_Unlock(DATAFilePtr);
  end;
//.
with BMP.Canvas do begin
OldBkMode:=SetBkMode(Handle, TRANSPARENT);
if (Font.Name <> InfoStringFontName) then Font.Name:=InfoStringFontName;
if (Font.Size <> InfoStringFontSize) then Font.Size:=InfoStringFontSize;
if (InfoComponent.idObj <> 0) then Font.Style:=[fsUnderline] else Font.Style:=[];
//.
Font.Color:=clBlack;
TextOut(Extent.Right+1,Extent.Top+1, InfoString);
Font.Color:=InfoStringFontColor;
TextOut(Extent.Right,Extent.Top, InfoString);
SetBkMode(Handle, OldBkMode);
//.
with Extent do Right:=Right+TextWidth(InfoString);
end;
finally
BMP.Canvas.Unlock();
end;
end;
except
  end;
end;

{TUserDynamicHints}
Constructor TUserDynamicHints.Create(const pDynamicHints: TDynamicHints);
begin
Inherited Create;
DynamicHints:=pDynamicHints;
FileName:='Reflector'+'\'+IntToStr(DynamicHints.Reflector.id)+'\'+'UserHints.xml';
TracksFileName:='Reflector'+'\'+IntToStr(DynamicHints.Reflector.id)+'\'+'UserHintsTracks.xml';
BackgroundColor:=clSilver;
OwnerStatusBarWidth:=3*5;
Items:=nil;
flVisible:=false;
Items_flChanged:=false;
ItemsTracksChangesCount:=0;
Load();
//. load tracks
LoadItemsTracks();
//.
fmUserHintsPanel:=TfmUserHintsPanel.Create(Self);
end;

Destructor TUserDynamicHints.Destroy;
begin
fmUserHintsPanel.Free();
//.
if (Items_flChanged)
 then Save();
if (ItemsTracksChangesCount > 0)
 then SaveItemsTracks(); //. save tracks
//.
Clear();
Inherited;
end;

function TUserDynamicHints.CreateItem: pointer;
begin
GetMem(Result,SizeOf(TUserDynamicHint));
FillChar(Result^,SizeOf(TUserDynamicHint), 0);
TUserDynamicHint(Result^).ptrObj:=nilPtr;
end;

procedure TUserDynamicHints.DestroyItem(var ptrDestroyItem: pointer);
begin
ClearItemTrack(ptrDestroyItem);
with TUserDynamicHint(ptrDestroyItem^) do begin
InfoImage.Free;
SetLength(InfoString,0);
SetLength(InfoStringFontName,0);
FreeAndNil(OwnerStatusBar);
end;
FreeMem(ptrDestroyItem,SizeOf(TUserDynamicHint));
end;

function TUserDynamicHints.CreateOwnerStatusBar(const idTOwner,idOwner: integer; const idCoType: integer; const Stream: TMemoryStream): TObject;
begin
if (idTOwner <> idTCoComponent)
 then begin
  end
 else with DynamicHints.Reflector.Space do begin
  Result:=Plugins__CoComponent_TStatusBar_Create(UserName,UserPassword,idOwner,idCoType,DoOnItemStatusBarChange);
  try
  if (Result <> nil)
   then
    if ((Stream <> nil) AND Context_flLoaded)
     then begin
      if (NOT TAbstractComponentStatusBar(Result).LoadFromStream(Stream))
       then begin
        TAbstractComponentStatusBar(Result).Update();
        Items_flChanged:=true;
        end;
      end
     else begin
      TAbstractComponentStatusBar(Result).Update();
      Items_flChanged:=true;
      end;
  except
    FreeAndNil(Result);
    //.
    Raise; //. =>
    end;
  end;
end;

procedure TUserDynamicHints.DoOnItemStatusBarChange();
begin
Items_flChanged:=true;
//.
DynamicHints.Reflector.Reflecting.ReFresh();
end;

procedure TUserDynamicHints.Clear;
var
  ptrRemoveItem: pointer;
begin
DynamicHints.Lock.Enter;
try
while (Items <> nil) do begin
  ptrRemoveItem:=Items;
  Items:=TUserDynamicHint(ptrRemoveItem^).Next;
  //.
  DestroyItem(ptrRemoveItem);
  end;
finally
DynamicHints.Lock.Leave;
end;
end;

procedure TUserDynamicHints.Load;

  procedure SetInfoImage(DATA: Variant; out InfoImage: TBitmap);
  var
    DATASize: integer;
    DATAPtr: pointer;
    _InfoImage: TMemoryStream;
  begin
  InfoImage:=nil;
  try
  if (DATA <> null)
   then begin
    DATASize:=VarArrayHighBound(DATA,1)+1;
    DATAPtr:=VarArrayLock(DATA);
    try
    InfoImage:=TBitmap.Create;
    _InfoImage:=TMemoryStream.Create;
    try
    with _InfoImage do begin
    Size:=DATASize;
    Write(DATAPtr^,DATASize);
    Position:=0;
    end;
    InfoImage.LoadFromStream(_InfoImage);
    finally
    _InfoImage.Destroy;
    end;
    finally
    VarArrayUnLock(DATA);
    end;
    end;
  except
    FreeAndNil(InfoImage);
    Raise; //. =>
    end;
  end;

  procedure GetOwnerStatusBarDataStream(DATA: Variant; out DataStream: TMemoryStream);
  var
    DATASize: integer;
    DATAPtr: pointer;
  begin
  DataStream:=nil;
  try
  if (DATA <> null)
   then begin
    DATASize:=VarArrayHighBound(DATA,1)+1;
    DATAPtr:=VarArrayLock(DATA);
    try
    DataStream:=TMemoryStream.Create();
    with DataStream do begin
    Size:=DATASize;
    Write(DATAPtr^,DATASize);
    Position:=0;
    end;
    finally
    VarArrayUnLock(DATA);
    end;
    end;
  except
    FreeAndNil(DataStream);
    Raise; //. =>
    end;
  end;

var
  Doc: IXMLDOMDocument;
  VersionNode: IXMLDOMNode;
  Version: integer;
  SpacePackIDNode: IXMLDOMNode;
  SpacePackID: integer;
  ItemsNode: IXMLDOMNode;
  I: integer;
  ItemNode: IXMLDOMNode;
  ptrptrNewItem: pointer;
  ptrNewItem: pointer;
  VisualizationPtrNode: IXMLDOMNode;
  _InfoImage: Variant;
  OwnerNode,idOwnerCoTypeNode,StatusBarDataNode: IXMLDOMNode;
  OwnerStatusBarDataStream: TMemoryStream;
begin
Items_flChanged:=false;
//.
DynamicHints.Lock.Enter();
try
Clear();
with TProxySpaceUserProfile.Create(DynamicHints.Reflector.Space) do
try
if (FileExists(ProfileFolder+'\'+FileName))
 then begin
  SetProfileFile(FileName);
  Doc:=CoDomDocument.Create;
  Doc.Set_Async(false);
  Doc.Load(ProfileFile);
  VersionNode:=Doc.documentElement.selectSingleNode('/ROOT/Version');
  if (VersionNode <> nil)
   then Version:=VersionNode.nodeTypedValue
   else Version:=0;
  if (Version <> 0) then Exit; //. ->
  SpacePackIDNode:=Doc.documentElement.selectSingleNode('/ROOT/SpacePackID');
  if (SpacePackIDNode <> nil) then SpacePackID:=SpacePackIDNode.nodeTypedValue else SpacePackID:=-1;
  ptrptrNewItem:=@Items;
  ItemsNode:=Doc.documentElement.selectSingleNode('/ROOT/Items');
  for I:=0 to ItemsNode.childNodes.length-1 do begin
    ItemNode:=ItemsNode.childNodes[I];
    //. create new item and insert
    ptrNewItem:=CreateItem();
    try
    with TUserDynamicHint(ptrNewItem^) do begin
    Next:=nil;
    flVisible:=false;
    idTObj:=ItemNode.selectSingleNode('idTVisualization').nodeTypedValue;
    idObj:=ItemNode.selectSingleNode('idVisualization').nodeTypedValue;
    //.
    ptrObj:=nilPtr;
    VisualizationPtrNode:=ItemNode.selectSingleNode('VisualizationPtr');
    if ((SpacePackID = DynamicHints.Reflector.Space.SpacePackID) AND (VisualizationPtrNode <> nil))
     then ptrObj:=VisualizationPtrNode.nodeTypedValue;
    SupplyVisualizationPtr(ptrNewItem);
    //.
    flEnabled:=ItemNode.selectSingleNode('Enabled').nodeTypedValue;
    flTracking:=ItemNode.selectSingleNode('Tracking').nodeTypedValue;
    Track:=nil;
    TrackNodesCount:=0;
    BackgroundColor:=ItemNode.selectSingleNode('BackgroundColor').nodeTypedValue;
    if (ItemNode.selectSingleNode('AlwaysCheckVisibility') <> nil) then flAlwaysCheckVisibility:=ItemNode.selectSingleNode('AlwaysCheckVisibility').nodeTypedValue;
    _InfoImage:=ItemNode.selectSingleNode('InfoImage').nodeTypedValue;
    SetInfoImage(_InfoImage, InfoImage);
    if (InfoImage <> nil)
     then begin
      InfoImage.TransparentColor:=InfoImage.Canvas.Pixels[0,InfoImage.Height-1];
      InfoImage.Transparent:=true;
      end;
    InfoString:=ItemNode.selectSingleNode('InfoString').nodeTypedValue;
    InfoStringFontName:=ItemNode.selectSingleNode('InfoStringFontName').nodeTypedValue;
    InfoStringFontSize:=ItemNode.selectSingleNode('InfoStringFontSize').nodeTypedValue;
    InfoStringFontColor:=ItemNode.selectSingleNode('InfoStringFontColor').nodeTypedValue;
    //.
    OwnerNode:=ItemNode.selectSingleNode('Owner');
    OwnerStatusBarDataStream:=nil;
    try
    if (OwnerNode <> nil)
     then begin
      idTOwner:=OwnerNode.selectSingleNode('TID').nodeTypedValue;
      idOwner:=OwnerNode.selectSingleNode('ID').nodeTypedValue;
      //.
      idOwnerCoTypeNode:=OwnerNode.selectSingleNode('CoTypeID');
      if (idOwnerCoTypeNode <> nil)
       then idOwnerCoType:=idOwnerCoTypeNode.nodeTypedValue
       else idOwnerCoType:=0;
      //.
      StatusBarDataNode:=OwnerNode.selectSingleNode('StatusBarData');
      if (StatusBarDataNode <> nil) then GetOwnerStatusBarDataStream(StatusBarDataNode.nodeTypedValue,{out} OwnerStatusBarDataStream);
      end
     else with TComponentFunctionality_Create(idTObj,idObj) do
      try
      GetOwner({out} idTOwner,idOwner);
      if (idTOwner = idTCoComponent)
       then with TCoComponentFunctionality(TComponentFunctionality_Create(idTCoComponent,idOwner)) do
        try
        idOwnerCoType:=idCoType();
        finally
        Release();
        end
       else idOwnerCoType:=0;
      //.
      Items_flChanged:=true;
      finally
      Release();
      end;
    if (idOwner <> 0) then OwnerStatusBar:=CreateOwnerStatusBar(idTOwner,idOwner,idOwnerCoType,OwnerStatusBarDataStream);
    finally
    OwnerStatusBarDataStream.Free();
    end;
    end;
    //.
    Pointer(ptrptrNewItem^):=ptrNewItem;
    ptrptrNewItem:=@TUserDynamicHint(ptrNewItem^).Next;
    except
      DestroyItem(ptrNewItem);
      end;
    end;
  end;
finally
Destroy();
end;
finally
DynamicHints.Lock.Leave();
end;
end;

procedure TUserDynamicHints.Save;

  function GetInfoImageDATA(const DATA: TBitmap): OLEVariant;
  var
    _DATA: TMemoryStream;
    DATAPtr: pointer;
  begin
  if (DATA <> nil)
   then begin
    _DATA:=TMemoryStream.Create;
    try
    DATA.SaveToStream(_DATA);
    _DATA.Position:=0;
    with _DATA do begin
    Result:=VarArrayCreate([0,Size-1],varByte);
    DATAPtr:=VarArrayLock(Result);
    try
    Read(DATAPtr^,Size);
    finally
    VarArrayUnLock(Result);
    end;
    end;
    finally
    _DATA.Destroy;
    end;
    end
   else Result:=Null;
  end;

  function GetOwnerStatusBarDataStreamOLEVariant(const DataStream: TMemoryStream): OLEVariant;
  var
    DATAPtr: pointer;
  begin
  if (DataStream <> nil)
   then begin
    DataStream.Position:=0;
    with DataStream do begin
    Result:=VarArrayCreate([0,Size-1],varByte);
    DATAPtr:=VarArrayLock(Result);
    try
    Read(DATAPtr^,Size);
    finally
    VarArrayUnLock(Result);
    end;
    end;
    end
   else Result:=Null;
  end;

var
  Doc: IXMLDOMDocument;
  PI: IXMLDOMProcessingInstruction;
  Root: IXMLDOMElement;
  VersionNode: IXMLDOMElement;
  SpacePackIDNode: IXMLDOMElement;
  ItemsNode: IXMLDOMElement;
  ptrItem: pointer;
  I: integer;
  ItemNode: IXMLDOMElement;
  //.
  PropNode,PropSubNode: IXMLDOMElement;
  OwnerStatusBarDataStream: TMemoryStream;
begin
DynamicHints.Lock.Enter;
try
Doc:=CoDomDocument.Create;
Doc.Set_Async(false);
PI:=Doc.createProcessingInstruction('xml', 'version=''1.0''');
Doc.insertBefore(PI, Doc.childNodes.Item[0]);
Root:=Doc.createElement('ROOT');
Root.setAttribute('xmlns:dt', 'urn:schemas-microsoft-com:datatypes');
Doc.documentElement:=Root;
VersionNode:=Doc.createElement('Version');
VersionNode.nodeTypedValue:=0;
Root.appendChild(VersionNode);
SpacePackIDNode:=Doc.createElement('SpacePackID');
SpacePackIDNode.nodeTypedValue:=DynamicHints.Reflector.Space.SpacePackID;
Root.appendChild(SpacePackIDNode);
ItemsNode:=Doc.createElement('Items');
Root.appendChild(ItemsNode);
I:=0;
ptrItem:=Items;
while (ptrItem <> nil) do with TUserDynamicHint(ptrItem^) do begin
  //. create item
  ItemNode:=Doc.CreateElement('Item'+IntToStr(I));
  //.
  PropNode:=Doc.CreateElement('idTVisualization');       PropNode.nodeTypedValue:=idTObj;                  ItemNode.appendChild(PropNode);
  PropNode:=Doc.CreateElement('idVisualization');        PropNode.nodeTypedValue:=idObj;                   ItemNode.appendChild(PropNode);
  PropNode:=Doc.CreateElement('VisualizationPtr');       PropNode.nodeTypedValue:=ptrObj;                  ItemNode.appendChild(PropNode);
  PropNode:=Doc.CreateElement('Enabled');                PropNode.nodeTypedValue:=flEnabled;               ItemNode.appendChild(PropNode);
  PropNode:=Doc.CreateElement('Tracking');               PropNode.nodeTypedValue:=flTracking;              ItemNode.appendChild(PropNode);
  PropNode:=Doc.CreateElement('BackgroundColor');        PropNode.nodeTypedValue:=BackgroundColor;         ItemNode.appendChild(PropNode);
  PropNode:=Doc.CreateElement('AlwaysCheckVisibility');  PropNode.nodeTypedValue:=flAlwaysCheckVisibility; ItemNode.appendChild(PropNode);
  //.
  PropNode:=Doc.CreateElement('InfoImage');
  PropNode.Set_dataType('bin.base64');
  PropNode.nodeTypedValue:=GetInfoImageDATA(InfoImage);
  ItemNode.appendChild(PropNode);
  //.
  PropNode:=Doc.CreateElement('InfoString');             PropNode.nodeTypedValue:=InfoString;          ItemNode.appendChild(PropNode);
  PropNode:=Doc.CreateElement('InfoStringFontName');     PropNode.nodeTypedValue:=InfoStringFontName;  ItemNode.appendChild(PropNode);
  PropNode:=Doc.CreateElement('InfoStringFontSize');     PropNode.nodeTypedValue:=InfoStringFontSize;  ItemNode.appendChild(PropNode);
  PropNode:=Doc.CreateElement('InfoStringFontColor');    PropNode.nodeTypedValue:=InfoStringFontColor; ItemNode.appendChild(PropNode);
  //.
  PropNode:=Doc.CreateElement('Owner');
    PropSubNode:=Doc.CreateElement('TID');
    PropSubNode.nodeTypedValue:=idTOwner;
    PropNode.appendChild(PropSubNode);
    PropSubNode:=Doc.CreateElement('ID');
    PropSubNode.nodeTypedValue:=idOwner;
    PropNode.appendChild(PropSubNode);
    if (idOwnerCoType <> 0)
     then begin
      PropSubNode:=Doc.CreateElement('CoTypeID');
      PropSubNode.nodeTypedValue:=idOwnerCoType;
      PropNode.appendChild(PropSubNode);
      end;
    if (OwnerStatusBar <> nil)
     then begin
      PropSubNode:=Doc.CreateElement('StatusBarData');
      PropSubNode.Set_dataType('bin.base64');
      OwnerStatusBarDataStream:=TMemoryStream.Create();
      try
      TAbstractComponentStatusBar(OwnerStatusBar).SaveToStream(OwnerStatusBarDataStream);
      PropSubNode.nodeTypedValue:=GetOwnerStatusBarDataStreamOLEVariant(OwnerStatusBarDataStream);
      finally
      OwnerStatusBarDataStream.Destroy();
      end;
      PropNode.appendChild(PropSubNode);
      end;
  ItemNode.appendChild(PropNode);
  //. add item
  ItemsNode.appendChild(ItemNode);
  //. next item
  Inc(I);
  ptrItem:=Next;
  end;
//. save xml document
with TProxySpaceUserProfile.Create(DynamicHints.Reflector.Space) do
try
ProfileFile:=ProfileFolder+'\'+FileName;
ForceDirectories(ExtractFilePath(ProfileFile));
Doc.Save(ProfileFile);
finally
Destroy;
end;
finally
DynamicHints.Lock.Leave;
end;
Items_flChanged:=false;
end;

function TUserDynamicHints.AddItem(const pidTObj,pidObj: integer; const pBackgroundColor: TColor; const pInfoImage: TBitmap; const pInfoString: string; const pInfoStringFontName: string; const pInfoStringFontSize: integer; const pInfoStringFontColor: TColor): pointer;
var
  ptrptrItem: pointer;
  ptrNewItem: pointer;
begin
DynamicHints.Lock.Enter;
try
ptrptrItem:=@Items;
while (Pointer(ptrptrItem^) <> nil) do with TUserDynamicHint(Pointer(ptrptrItem^)^) do begin
  ///- if ((idTObj = pidTObj) AND (idObj = pidObj)) then Raise Exception.Create('such item is already exists'); //. =>
  ptrptrItem:=@Next;
  end;
ptrNewItem:=CreateItem();
try
with TUserDynamicHint(ptrNewItem^) do begin
Next:=nil;
idTObj:=pidTObj;
idObj:=pidObj;
flEnabled:=true;
flTracking:=false;
BackgroundColor:=pBackgroundColor;  
InfoImage:=TBitmap.Create;
InfoImage.Canvas.Lock();
try
pInfoImage.Canvas.Lock();
try
InfoImage.Assign(pInfoImage);
finally
pInfoImage.Canvas.Unlock();
end;
InfoImage.TransparentColor:=InfoImage.Canvas.Pixels[0,0];
InfoImage.Transparent:=true;
finally
InfoImage.Canvas.Unlock();
end;
InfoString:=pInfoString;
InfoStringFontName:=pInfoStringFontName;
InfoStringFontSize:=pInfoStringFontSize;
InfoStringFontColor:=pInfoStringFontColor;
//.
SupplyVisualizationPtr(ptrNewItem);
flVisible:=false;
//.
with TComponentFunctionality_Create(idTObj,idObj) do
try
GetOwner({out} idTOwner,idOwner);
if (idTOwner = idTCoComponent)
 then with TCoComponentFunctionality(TComponentFunctionality_Create(idTCoComponent,idOwner)) do
 try
 idOwnerCoType:=idCoType();
 finally
 Release();
 end;
finally
Release();
end;
if (idOwner <> 0) then OwnerStatusBar:=CreateOwnerStatusBar(idTOwner,idOwner,idOwnerCoType,nil);
end;
Pointer(ptrptrItem^):=ptrNewItem;
Result:=ptrNewItem;
except
  DestroyItem(ptrNewItem);
  Raise; //. =>
  end;
//.
Save();
Inc(ItemsTracksChangesCount);
finally
DynamicHints.Lock.Leave;
end;
UpdateReflectorView();
end;

procedure TUserDynamicHints.RemoveItem(const ptrItem: pointer);
var
  flRemoved: boolean;
  ptrptrItem: pointer;
  ptrRemoveItem: pointer;
begin
flRemoved:=false;
DynamicHints.Lock.Enter;
try
ptrptrItem:=@Items;
while (Pointer(ptrptrItem^) <> nil) do begin
  ptrRemoveItem:=Pointer(ptrptrItem^);
  if (ptrRemoveItem = ptrItem)
   then begin
    Pointer(ptrptrItem^):=TUserDynamicHint(ptrRemoveItem^).Next;
    DestroyItem(ptrRemoveItem);
    flRemoved:=true;
    Break; //. >
    end
   else ptrptrItem:=@TUserDynamicHint(ptrRemoveItem^).Next;
  end;
//.
if (flRemoved)
 then begin
  Save();
  Inc(ItemsTracksChangesCount);
  end;
finally
DynamicHints.Lock.Leave;
end;
if (flRemoved) then UpdateReflectorView();
end;

procedure TUserDynamicHints.RemoveItemByObjPtr(const ptrObj: TPtr);
var
  flRemoved: boolean;
  ptrptrItem: pointer;
  ptrRemoveItem: pointer;
begin
flRemoved:=false;
DynamicHints.Lock.Enter;
try
ptrptrItem:=@Items;
while (Pointer(ptrptrItem^) <> nil) do begin
  ptrRemoveItem:=Pointer(ptrptrItem^);
  if (TUserDynamicHint(ptrRemoveItem^).ptrObj = ptrObj)
   then begin
    Pointer(ptrptrItem^):=TUserDynamicHint(ptrRemoveItem^).Next;
    DestroyItem(ptrRemoveItem);
    flRemoved:=true;
    Break; //. >
    end
   else ptrptrItem:=@TUserDynamicHint(ptrRemoveItem^).Next;
  end;
//.
if (flRemoved)
 then begin
  Save();
  Inc(ItemsTracksChangesCount);
  end;
finally
DynamicHints.Lock.Leave;
end;
end;

procedure TUserDynamicHints.EnableDisableItem(const ptrItem: pointer; const flEnabled: boolean);
begin
DynamicHints.Lock.Enter;
try
if (TUserDynamicHint(ptrItem^).flEnabled = flEnabled) then Exit; //. ->
TUserDynamicHint(ptrItem^).flEnabled:=flEnabled;
//.
Save();
finally
DynamicHints.Lock.Leave;
end;
UpdateReflectorView();
end;

procedure TUserDynamicHints.EnableDisableItemTrack(const ptrItem: pointer; const pflTracking: boolean);
begin
DynamicHints.Lock.Enter;
try
if (TUserDynamicHint(ptrItem^).flTracking = pflTracking) then Exit; //. ->
TUserDynamicHint(ptrItem^).flTracking:=pflTracking;
///? if (TUserDynamicHint(ptrItem^).flTracking) then ClearItemTrack(ptrItem);
//.
Save();
finally
DynamicHints.Lock.Leave;
end;
UpdateReflectorView();
end;

procedure TUserDynamicHints.EnableDisableAlwaysCheckVisibility(const ptrItem: pointer; const pflAlwaysCheckVisibility: boolean);
begin
DynamicHints.Lock.Enter;
try
if (TUserDynamicHint(ptrItem^).flAlwaysCheckVisibility = pflAlwaysCheckVisibility) then Exit; //. ->
TUserDynamicHint(ptrItem^).flAlwaysCheckVisibility:=pflAlwaysCheckVisibility;
//.
Save();
finally
DynamicHints.Lock.Leave;
end;
UpdateReflectorView();
end;

procedure TUserDynamicHints.SetItem(const ptrItem: pointer; const pBackgroundColor: TColor; const pInfoImage: TBitmap; const pInfoString: string; const pInfoStringFontName: string; const pInfoStringFontSize: integer; const pInfoStringFontColor: TColor);
var
  _flEnabled: boolean;
begin
DynamicHints.Lock.Enter;
try
with TUserDynamicHint(ptrItem^) do begin
BackgroundColor:=pBackgroundColor;
InfoImage:=TBitmap.Create;
InfoImage.Canvas.Lock();
try
pInfoImage.Canvas.Lock();
try
InfoImage.Assign(pInfoImage);
finally
pInfoImage.Canvas.Unlock();
end;
InfoImage.TransparentColor:=InfoImage.Canvas.Pixels[0,0];
InfoImage.Transparent:=true;
finally
InfoImage.Canvas.Unlock();
end;
InfoString:=pInfoString;
InfoStringFontName:=pInfoStringFontName;
InfoStringFontSize:=pInfoStringFontSize;
InfoStringFontColor:=pInfoStringFontColor;
_flEnabled:=flEnabled;
end;
//.
Save();
finally
DynamicHints.Lock.Leave;
end;
if (_flEnabled) then UpdateReflectorView();
end;

procedure TUserDynamicHints.UpdateItemChangeState(const pptrObj: TPtr);
var
  ptrItem: pointer;
begin
DynamicHints.Lock.Enter;
try
ptrItem:=Items;
while (ptrItem <> nil) do with TUserDynamicHint(ptrItem^) do begin
  if (ptrObj = pptrObj)
   then begin
    Obj_flChange:=true;
    Obj_LastChangeTime:=Now;
    //.
    Exit; //. ->
    end;
  //. next
  ptrItem:=Next;
  end;
finally
DynamicHints.Lock.Leave;
end;
end;

procedure TUserDynamicHints.SupplyVisualizationPtr(const ptrItem: pointer);
begin
DynamicHints.Lock.Enter;
try
with TUserDynamicHint(ptrItem^) do
if (ptrObj = nilPtr)
 then
  try
  ptrObj:=DynamicHints.Reflector.Space.TObj_Ptr(idTObj,idObj);
  except
    ptrObj:=nilPtr;
    end;
finally
DynamicHints.Lock.Leave;
end;
end;

procedure TUserDynamicHints.ClearItemTrack(const ptrItem: pointer);
var
  ptrRemoveTrackItem: pointer;
begin
DynamicHints.Lock.Enter;
try
with TUserDynamicHint(ptrItem^) do begin
while (Track <> nil) do begin
  ptrRemoveTrackItem:=Track;
  Track:=TUserDynamicHintTrackItem(ptrRemoveTrackItem^).Next;
  FreeMem(ptrRemoveTrackItem,SizeOf(TUserDynamicHintTrackItem));
  end;
TrackNodesCount:=0;
end;
finally
DynamicHints.Lock.Leave;
end;
end;

function TUserDynamicHints.GetItemAtPoint(const P: Windows.TPoint; out ptrItem: pointer): boolean;
var
  _ptrItem: pointer;
  TextX,TextY: integer;
  ItemRect: TRect;
  TE: TSize;
begin
Result:=false;
ptrItem:=nil;
DynamicHints.Lock.Enter;
try
_ptrItem:=Items;
while (_ptrItem <> nil) do with TUserDynamicHint(_ptrItem^) do begin
  if (flEnabled AND flVisible)
   then with TUserDynamicHint(_ptrItem^),DynamicHints.Reflector.BMPBuffer do begin //. must be the same as show item algorithm
    Canvas.Lock;
    try
    Canvas.Font.Name:=InfoStringFontName;
    Canvas.Font.Size:=InfoStringFontSize;
    Canvas.Font.Color:=InfoStringFontColor;
    if (InfoImage <> nil)
     then begin
      if (
        ((BindingX <= P.X) AND (P.X <= (BindingX+InfoImage.Width))) AND
        (((BindingY-InfoImage.Height) <= P.Y) AND (P.Y <= BindingY))
      )
       then ptrItem:=_ptrItem;
      TextX:=Trunc(BindingX)+InfoImage.Width;
      TextY:=Trunc(BindingY)-Round((InfoImage.Height+Canvas.TextHeight(InfoString))/2);
      end
     else begin
      TextX:=Trunc(BindingX);
      TextY:=Trunc(BindingY)-Canvas.TextHeight(InfoString);
      end;
    if ((ptrItem <> _ptrItem) AND (OwnerStatusBar <> nil))
     then begin
      if (
        ((TextX <= P.X) AND (P.X <= (TextX+OwnerStatusBarWidth))) AND
        (((BindingY-InfoImage.Height) <= P.Y) AND (P.Y <= BindingY))
      )
       then ptrItem:=_ptrItem;
      TextX:=TextX+OwnerStatusBarWidth;
      end;
    if ((ptrItem <> _ptrItem) AND (InfoString <> ''))
     then begin
      TE:=Canvas.TextExtent(InfoString);
      if (
        ((TextX <= P.X) AND (P.X <= (TextX+TE.cx))) AND
        ((TextY <= P.Y) AND (P.Y <= (TextY+TE.cy)))
      )
       then ptrItem:=_ptrItem;
      end;
    finally
    Canvas.UnLock;
    end;
    end;
  //. next
  _ptrItem:=Next;
  end;
finally
DynamicHints.Lock.Leave;
end;
Result:=(ptrItem <> nil);
end;

procedure TUserDynamicHints.SetItemAsVisible(const pptrObj: TPtr; const pFigureWinRefl: TFigureWinRefl);
var
  ptrItem: pointer;
  X,Y: Extended;
begin
DynamicHints.Lock.Enter;
try
ptrItem:=Items;
while (ptrItem <> nil) do with TUserDynamicHint(ptrItem^) do begin
  if (flEnabled AND NOT flAlwaysCheckVisibility AND (ptrObj = pptrObj))
   then begin
    pFigureWinRefl.Nodes_GetAveragePoint({out} X,Y);
    BindingX:=X;
    BindingY:=Y;
    if ((pFigureWinRefl.Width > 0) AND (pFigureWinRefl.Count > 1))
     then begin
      DirectionBindingX:=pFigureWinRefl.Nodes[1].X;
      DirectionBindingY:=pFigureWinRefl.Nodes[1].Y;
      end;
    flVisible:=true;
    Self.flVisible:=true;
    Break; //. >
    end;
  //. next
  ptrItem:=Next;
  end;
finally
DynamicHints.Lock.Leave;
end;
end;

procedure TUserDynamicHints.AddItemTrackItem(const pptrObj: TPtr);
const
  TrackNodesMaxCount = 1000;
  TrackNodesRemoveDelta = (TrackNodesMaxCount SHR 1);
var
  ptrItem: pointer;
  X,Y: Extended;
  Obj: TSpaceObj;
  FirstPoint: TPoint;
  ptrNewTrackItem: pointer;
  I: integer;
  ptrptrTrackItem: pointer;
  RemoveTrack: pointer;
  ptrRemoveTrackItem: pointer;
begin
DynamicHints.Lock.Enter;
try
ptrItem:=Items;
while (ptrItem <> nil) do with TUserDynamicHint(ptrItem^) do begin
  if (flEnabled AND (ptrObj = pptrObj) AND flTracking)
   then begin
    DynamicHints.Reflector.Space.ReadObj(Obj,SizeOf(Obj),ptrObj);
    if (Obj.ptrFirstPoint <> nilPtr)
     then begin
      DynamicHints.Reflector.Space.ReadObj(FirstPoint,SizeOf(FirstPoint),Obj.ptrFirstPoint);
      if (Track <> nil)
       then with TUserDynamicHintTrackItem(Track^) do
        if ((X = FirstPoint.X) AND (Y = FirstPoint.Y)) then Break; //. >
      GetMem(ptrNewTrackItem,SizeOf(TUserDynamicHintTrackItem));
      with TUserDynamicHintTrackItem(ptrNewTrackItem^) do begin
      Next:=Track;
      TimeStamp:=Now;
      X:=FirstPoint.X;
      Y:=FirstPoint.Y;
      end;
      Track:=ptrNewTrackItem;
      Inc(TrackNodesCount);
      if (TrackNodesCount > (TrackNodesMaxCount+TrackNodesRemoveDelta))
       then begin //. remove tile items
        ptrptrTrackItem:=@Track;
        for I:=0 to TrackNodesMaxCount-1 do ptrptrTrackItem:=@TUserDynamicHintTrackItem(Pointer(ptrptrTrackItem^)^).Next;
        //.
        RemoveTrack:=Pointer(ptrptrTrackItem^);
        Pointer(ptrptrTrackItem^):=nil;
        //.
        while (RemoveTrack <> nil) do begin
          ptrRemoveTrackItem:=RemoveTrack;
          RemoveTrack:=TUserDynamicHintTrackItem(ptrRemoveTrackItem^).Next;
          FreeMem(ptrRemoveTrackItem,SizeOf(TUserDynamicHintTrackItem));
          end;
        //.
        TrackNodesCount:=TrackNodesMaxCount;
        end;
      end;
    Break; //. >
    end;
  //. next
  ptrItem:=Next;
  end;
finally
DynamicHints.Lock.Leave;
end;
end;

procedure TUserDynamicHints.EnableDisableItems(const pflEnabled: boolean);
var
  ptrItem: pointer;
begin
DynamicHints.Lock.Enter;
try
ptrItem:=Items;
while (ptrItem <> nil) do with TUserDynamicHint(ptrItem^) do begin
  flEnabled:=pflEnabled;
  //. next
  ptrItem:=Next;
  end;
//.
Save();
finally
DynamicHints.Lock.Leave;
end;
UpdateReflectorView();
end;

procedure TUserDynamicHints.ClearItemsVisibleState;
var
  ptrItem: pointer;
begin
DynamicHints.Lock.Enter;
try
ptrItem:=Items;
while (ptrItem <> nil) do with TUserDynamicHint(ptrItem^) do begin
  flVisible:=false;
  //. next
  ptrItem:=Next;
  end;
Self.flVisible:=true;
finally
DynamicHints.Lock.Leave;
end;
end;

procedure TUserDynamicHints.ShowVisibleItems(const BMP: TBitmap; const ptrCancelFlag: pointer; const BestBeforeTime: TDateTime);

  procedure Item_Show(const ptrItem: pointer);
  const
    DirectionMarkerColor = clRed;
    DirectionMarkerColor1 = clBlack;
    DirectionMarkerL = 24;
    DirectionMarkerR = 4;

    procedure GetTerminators(const X0,Y0,X1,Y1: Extended; const X,Y: Extended; const Dist: Extended; out TX,TY,T1X,T1Y: Extended);
    var
      Line_Length: Extended;
      diffX1X0,diffY1Y0: Extended;
      V: Extended;
      S0_X3,S0_Y3,S1_X3,S1_Y3: Extended;
    begin
    diffX1X0:=X1-X0;
    diffY1Y0:=Y1-Y0;
    if Abs(diffY1Y0) > Abs(diffX1X0)
     then begin
      V:=Dist/Sqrt(1+Sqr(diffX1X0/diffY1Y0));
      TX:=(V)+X;
      TY:=(-V)*(diffX1X0/diffY1Y0)+Y;
      T1X:=(-V)+X;
      T1Y:=(V)*(diffX1X0/diffY1Y0)+Y;
      end
     else begin
      if diffX1X0 = 0
       then begin
        TX:=X;TY:=Y;
        T1X:=X;T1Y:=Y;
        Exit; ///??? проверь последствия
        end;
      V:=Dist/Sqrt(1+Sqr(diffY1Y0/diffX1X0));
      TY:=(V)+Y;
      TX:=(-V)*(diffY1Y0/diffX1X0)+X;
      T1Y:=(-V)+Y;
      T1X:=(V)*(diffY1Y0/diffX1X0)+X;
      end;
    end;

  var
    TextX,TextY,TextHeight: integer;
    OldBkMode: integer;
    StatusBarHeight: integer;
    StatusBarMS: TMemoryStream;
    StatusBarBMP: TBitmap;
    L,AL,dX,dY: Extended;
    TX,TY,T1X,T1Y: Extended;
    Triangle: array[0..2] of Windows.TPoint;
  begin
  with TUserDynamicHint(ptrItem^),BMP do begin
  Canvas.Lock();
  try
  Canvas.Brush.Color:=BackgroundColor;
  Canvas.Font.Name:=InfoStringFontName;
  Canvas.Font.Size:=InfoStringFontSize;
  TextHeight:=Canvas.TextHeight(InfoString);
  if (InfoImage <> nil)
   then begin
    InfoImage.Canvas.Lock();
    try
    Canvas.Draw(Trunc(BindingX),Trunc(BindingY)-InfoImage.Height,InfoImage);
    finally
    InfoImage.Canvas.UnLock();
    end;
    TextX:=Trunc(BindingX)+InfoImage.Width;
    TextY:=Trunc(BindingY)-Round((InfoImage.Height+TextHeight)/2);
    StatusBarHeight:=InfoImage.Height;
    end
   else begin
    TextX:=Trunc(BindingX);
    TextY:=Trunc(BindingY)-TextHeight;
    StatusBarHeight:=TextHeight;
    end;
  if (OwnerStatusBar <> nil)
   then begin
    TAbstractComponentStatusBar(OwnerStatusBar).GetBitmapStream(OwnerStatusBarWidth,StatusBarHeight, 0{simple status bar},{out} StatusBarMS);
    try
    StatusBarBMP:=TBitmap.Create();
    try
    StatusBarBMP.LoadFromStream(StatusBarMS);
    StatusBarBMP.Canvas.Lock();
    try
    Canvas.Draw(TextX,Trunc(BindingY)-StatusBarHeight,StatusBarBMP);
    finally
    StatusBarBMP.Canvas.UnLock();
    end;
    finally
    StatusBarBMP.Destroy();
    end;
    finally
    StatusBarMS.Destroy();
    end;
    TextX:=TextX+OwnerStatusBarWidth;
    end;
  if (InfoString <> '')
   then begin
    if (BackgroundColor = clNone) then OldBkMode:=Windows.SetBkMode(Canvas.Handle, Windows.TRANSPARENT);
    try
    Canvas.Font.Color:=clBlack;
    Canvas.TextOut(TextX+1,TextY+1,InfoString);
    Canvas.Font.Color:=InfoStringFontColor;
    Canvas.TextOut(TextX,TextY,InfoString);
    finally
    if (BackgroundColor = clNone) then Windows.SetBkMode(Canvas.Handle, OldBkMode);
    end;
    end;
  if ((OwnerStatusBar <> nil) AND TAbstractComponentStatusBar(OwnerStatusBar).Status_IsOnline() AND TAbstractComponentStatusBar(OwnerStatusBar).Status_LocationIsAvailable() AND Obj_flChange)
   then begin //. show direction marker
    dX:=BindingX-DirectionBindingX; dY:=BindingY-DirectionBindingY;
    if ((dX <> 0) OR (dY <> 0))
     then begin
      L:=Sqrt(sqr(dX)+sqr(dY)); AL:=DirectionMarkerL;
      dX:=AL*dX/L; dY:=AL*dY/L;
      GetTerminators(DirectionBindingX,DirectionBindingY,BindingX,BindingY, BindingX,BindingY, DirectionMarkerR, {out} TX,TY,T1X,T1Y);
      //.
      Triangle[0].X:=Trunc(TX); Triangle[0].Y:=Trunc(TY);
      Triangle[1].X:=Trunc(T1X); Triangle[1].Y:=Trunc(T1Y);
      Triangle[2].X:=Trunc(BindingX+dX); Triangle[2].Y:=Trunc(BindingY+dY);
      //.
      Canvas.Brush.Style:=bsClear;
      Canvas.Pen.Style:=psSolid;
      Canvas.Pen.Color:=DirectionMarkerColor;
      Canvas.Pen.Width:=3;
      Canvas.Polygon(Triangle);
      Canvas.Pen.Color:=DirectionMarkerColor1;
      Canvas.Pen.Width:=1;
      Canvas.Polygon(Triangle);
      end;
    end;
  finally
  Canvas.UnLock();
  end;
  end;
  end;

var
  ptrItem: pointer;
begin
if (NOT flVisible) then Exit; //. ->
DynamicHints.Lock.Enter;
try
//. show item tracks
ShowItemsTracks(BMP,ptrCancelFlag,BestBeforeTime);
//. show visible items
ptrItem:=Items;
while (ptrItem <> nil) do with TUserDynamicHint(ptrItem^) do begin
  if (flEnabled AND flVisible) then Item_Show(ptrItem);
  //.
  if (ptrCancelFlag <> nil)
   then begin
    Sleep(0); //. exit from the current thread to alow the cancel flag to be set
    if (Boolean(ptrCancelFlag^)) then Raise EUnnecessaryExecuting.Create(''); //. =>
    end;
  //.
  if (Now > BestBeforeTime) then Break; //. >
  //. next
  ptrItem:=Next;
  end;
finally
DynamicHints.Lock.Leave;
end;
end;

procedure TUserDynamicHints.UpdateItemsChangeState(const MinTime: TDateTime);
var
  ptrItem: pointer;
  flUpdateReflection: boolean;
begin
flUpdateReflection:=false;
DynamicHints.Lock.Enter;
try
ptrItem:=Items;
while (ptrItem <> nil) do with TUserDynamicHint(ptrItem^) do begin
  if (Obj_flChange AND (Obj_LastChangeTime < MinTime))
   then begin
    Obj_flChange:=false;
    flUpdateReflection:=true;
    end;
  //. next
  ptrItem:=Next;
  end;
finally
DynamicHints.Lock.Leave;
end;
if (flUpdateReflection) then DoOnItemChangeStatusChange();
end;

procedure TUserDynamicHints.DoOnItemChangeStatusChange();
begin
DynamicHints.Reflector.Reflecting.ReFresh();
end;

procedure TUserDynamicHints.LoadItemsTracks;
var
  Doc: IXMLDOMDocument;
  VersionNode: IXMLDOMNode;
  Version: integer;
  ItemsNode: IXMLDOMNode;
  ptrItem: pointer;
  ItemNode: IXMLDOMNode;
  I: integer;
  TrackNode: IXMLDOMNode;
  ptrNewTrackItem: pointer;
  ptrptrLastTrack: pointer;
  TS: double;
begin
DynamicHints.Lock.Enter;
try
ClearItemsTracks();
with TProxySpaceUserProfile.Create(DynamicHints.Reflector.Space) do
try
if (FileExists(ProfileFolder+'\'+TracksFileName))
 then begin
  SetProfileFile(TracksFileName);
  Doc:=CoDomDocument.Create;
  Doc.Set_Async(false);
  Doc.Load(ProfileFile);
  VersionNode:=Doc.documentElement.selectSingleNode('/ROOT/Version');
  if VersionNode <> nil
   then Version:=VersionNode.nodeTypedValue
   else Version:=0;
  if (Version <> 0) then Exit; //. ->
  ItemsNode:=Doc.documentElement.selectSingleNode('/ROOT/Tracks');
  ptrItem:=Items;
  while (ptrItem <> nil) do with TUserDynamicHint(ptrItem^) do begin
    ItemNode:=ItemsNode.selectSingleNode('T'+IntToStr(idTObj)+'-'+IntToStr(idObj));
    if (ItemNode <> nil)
     then begin
      ptrptrLastTrack:=@Track; 
      for I:=0 to ItemNode.childNodes.length-1 do begin
        TrackNode:=ItemNode.childNodes[I];
        //. create new track item and insert
        GetMem(ptrNewTrackItem,SizeOf(TUserDynamicHintTrackItem));
        with TUserDynamicHintTrackItem(ptrNewTrackItem^) do begin
        Next:=nil;
        TS:=TrackNode.selectSingleNode('TimeStamp').nodeTypedValue;
        TimeStamp:=TDateTime(TS);
        X:=TrackNode.selectSingleNode('X').nodeTypedValue;
        Y:=TrackNode.selectSingleNode('Y').nodeTypedValue;
        end;
        Pointer(ptrptrLastTrack^):=ptrNewTrackItem;
        Inc(TrackNodesCount);
        ptrptrLastTrack:=@TUserDynamicHintTrackItem(ptrNewTrackItem^).Next;
        end;
      end;
    //. next
    ptrItem:=Next;
    end;
  end;
finally
Destroy;
end;
ItemsTracksChangesCount:=0;
finally
DynamicHints.Lock.Leave;
end;
end;

procedure TUserDynamicHints.ClearItemsTracks;
var
  ptrItem: pointer;
  ptrRemoveTrackItem: pointer;
begin
DynamicHints.Lock.Enter;
try
ptrItem:=Items;
while (ptrItem <> nil) do with TUserDynamicHint(ptrItem^) do begin
  while (Track <> nil) do begin
    ptrRemoveTrackItem:=Track;
    Track:=TUserDynamicHintTrackItem(ptrRemoveTrackItem^).Next;
    FreeMem(ptrRemoveTrackItem,SizeOf(TUserDynamicHintTrackItem));
    end;
  TrackNodesCount:=0;
  //. next
  ptrItem:=Next;
  end;
finally
DynamicHints.Lock.Leave;
end;
end;

procedure TUserDynamicHints.SaveItemsTracks;
var
  Doc: IXMLDOMDocument;
  PI: IXMLDOMProcessingInstruction;
  Root: IXMLDOMElement;
  VersionNode: IXMLDOMElement;
  ItemsNode: IXMLDOMElement;
  ptrItem: pointer;
  TrackNode: IXMLDOMElement;
  ptrTrackItem: pointer;
  I: integer;
  NodeNode: IXMLDOMElement;
  //.
  TS: double;
  PropNode: IXMLDOMElement;
begin
DynamicHints.Lock.Enter;
try
Doc:=CoDomDocument.Create;
Doc.Set_Async(false);
PI:=Doc.createProcessingInstruction('xml', 'version=''1.0''');
Doc.insertBefore(PI, Doc.childNodes.Item[0]);
Root:=Doc.createElement('ROOT');
Root.setAttribute('xmlns:dt', 'urn:schemas-microsoft-com:datatypes');
Doc.documentElement:=Root;
VersionNode:=Doc.createElement('Version');
VersionNode.nodeTypedValue:=0;
Root.appendChild(VersionNode);
ItemsNode:=Doc.createElement('Tracks');
Root.appendChild(ItemsNode);
ptrItem:=Items;
while (ptrItem <> nil) do with TUserDynamicHint(ptrItem^) do begin
  if (Track <> nil)
   then begin
    //. create track 
    TrackNode:=Doc.CreateElement('T'+IntToStr(idTObj)+'-'+IntToStr(idObj));
    //.
    I:=0;
    ptrTrackItem:=Track;
    repeat
      NodeNode:=Doc.CreateElement('N'+IntToStr(I)); //. create track item
      TS:=TUserDynamicHintTrackItem(ptrTrackItem^).TimeStamp;
      PropNode:=Doc.CreateElement('TimeStamp');       PropNode.nodeTypedValue:=TS;                                                             NodeNode.appendChild(PropNode);
      PropNode:=Doc.CreateElement('X');               PropNode.nodeTypedValue:=TUserDynamicHintTrackItem(ptrTrackItem^).X;                     NodeNode.appendChild(PropNode);
      PropNode:=Doc.CreateElement('Y');               PropNode.nodeTypedValue:=TUserDynamicHintTrackItem(ptrTrackItem^).Y;                     NodeNode.appendChild(PropNode);
      //. add track item
      TrackNode.appendChild(NodeNode);
      //. Next
      ptrTrackItem:=TUserDynamicHintTrackItem(ptrTrackItem^).Next;
      Inc(I);
    until (ptrTrackItem = nil);
    //. add track
    ItemsNode.appendChild(TrackNode);
    end;
  //. Next 
  ptrItem:=Next;
  end;
//. save xml document
with TProxySpaceUserProfile.Create(DynamicHints.Reflector.Space) do
try
ProfileFile:=ProfileFolder+'\'+TracksFileName;
ForceDirectories(ExtractFilePath(ProfileFile));
Doc.Save(ProfileFile);
finally
Destroy;
end;
ItemsTracksChangesCount:=0;
finally
DynamicHints.Lock.Leave;
end;
end;

procedure TUserDynamicHints.EnableDisableItemsTracking(const pflEnabled: boolean);
var
  ptrItem: pointer;
begin
DynamicHints.Lock.Enter;
try
ptrItem:=Items;
while (ptrItem <> nil) do with TUserDynamicHint(ptrItem^) do begin
  flTracking:=pflEnabled;
  //. next
  ptrItem:=Next;
  end;
//.
Save();
finally
DynamicHints.Lock.Leave;
end;
UpdateReflectorView();
end;

procedure TUserDynamicHints.ConvertNode(X,Y: Extended; out Xs,Ys: Extended);
var
  RW: TReflectionWindowStrucEx;
  QdA2: Extended;
  X_C,X_QdC,X_A1,X_QdB2: Extended;
  Y_C,Y_QdC,Y_A1,Y_QdB2: Extended;
begin
DynamicHints.Reflector.ReflectionWindow.GetWindow(false, RW);
with RW do begin
X:=X*cfTransMeter;
Y:=Y*cfTransMeter;
QdA2:=sqr(X-X0)+sqr(Y-Y0);
X_QdC:=sqr(X1-X0)+sqr(Y1-Y0);
X_C:=Sqrt(X_QdC);
X_QdB2:=sqr(X-X1)+sqr(Y-Y1);
X_A1:=(X_QdC-X_QdB2+QdA2)/(2*X_C);
Y_QdC:=sqr(X3-X0)+sqr(Y3-Y0);
Y_C:=Sqrt(Y_QdC);
Y_QdB2:=sqr(X-X3)+sqr(Y-Y3);
Y_A1:=(Y_QdC-Y_QdB2+QdA2)/(2*Y_C);
Xs:=Xmn+X_A1/X_C*(Xmx-Xmn);
Ys:=Ymn+Y_A1/Y_C*(Ymx-Ymn);
end;
end;

procedure TUserDynamicHints.ShowItemsTracks(const BMP: TBitmap; const ptrCancelFlag: pointer; const BestBeforeTime: TDateTime);

  procedure ShowTrack(const ItemPtr: pointer);
  const
    NodeMarkerR = 4;

    function IsNodeVisible(const Xs,Ys: Extended): boolean;
    var
      RW: TReflectionWindowStrucEx;
    begin
    DynamicHints.Reflector.ReflectionWindow.GetWindow(false, RW);
    with RW do
    Result:=(((Xmn <= Xs) AND (Xs <= Xmx)) AND ((Ymn <= Ys) AND (Ys <= Ymx)));
    end;

    procedure ShowNodeMarker(const Canvas: TCanvas; const NX,NY: Extended; const NTimeStamp: TDateTime; const NodeIndex: integer);
    var
      NodeStr: string;
    begin
    Canvas.Pen.Style:=psSolid;
    Canvas.Pen.Color:=clMaroon;
    Canvas.Pen.Width:=2;
    Canvas.Brush.Style:=bsSolid;
    Canvas.Brush.Color:=clRed;
    Canvas.Ellipse(Round(NX)-NodeMarkerR,Round(NY)-NodeMarkerR,Round(NX)+NodeMarkerR,Round(NY)+NodeMarkerR);
    //.
    if (NodeIndex > 0)
     then NodeStr:=FormatDateTime('HH:NN:SS',NTimeStamp)
     else NodeStr:=FormatDateTime('DD/MM/YY HH:NN:SS',NTimeStamp);
    Canvas.Brush.Style:=bsClear;
    Canvas.Font.Color:=clWhite;
    Canvas.Font.Name:='Tahoma';
    Canvas.Font.Size:=10;
    Canvas.TextOut(Round(NX+NodeMarkerR),Round(NY+NodeMarkerR),NodeStr);
    end;

  var
    SavedPenStyle: TPenStyle;
    SavedBrushStyle: TBrushStyle;
    ptrLastItem,ptrItem: pointer;
    NodeIndex: integer;
    LastNode_Xs,LastNode_Ys, Node_Xs,Node_Ys: Extended;
    LastNode_flVisible, Node_flVisible: boolean;
    R: Extended;
  begin
  with BMP do begin
  Canvas.Lock;
  SavedPenStyle:=Canvas.Pen.Style;
  SavedBrushStyle:=Canvas.Brush.Style;
  try
  with TUserDynamicHint(ItemPtr^) do 
  if (Track <> nil)
   then begin
    ptrLastItem:=Track;
    with TUserDynamicHintTrackItem(ptrLastItem^) do ConvertNode(X,Y, LastNode_Xs,LastNode_Ys);
    LastNode_flVisible:=IsNodeVisible(LastNode_Xs,LastNode_Ys);
    ptrItem:=TUserDynamicHintTrackItem(ptrLastItem^).Next;
    if (ptrItem <> nil)
     then begin
      if (LastNode_flVisible) then ShowNodeMarker(Canvas, LastNode_Xs,LastNode_Ys,TUserDynamicHintTrackItem(ptrLastItem^).TimeStamp,0);
      NodeIndex:=1;
      repeat
        with TUserDynamicHintTrackItem(ptrItem^) do ConvertNode(X,Y, Node_Xs,Node_Ys);
        Node_flVisible:=IsNodeVisible(Node_Xs,Node_Ys);
        if (LastNode_flVisible OR Node_flVisible)
         then begin
          //. draw distance line
          Canvas.Pen.Style:=psSolid;
          Canvas.Pen.Color:=InfoStringFontColor;
          Canvas.Pen.Width:=2;
          Canvas.Brush.Style:=bsClear;
          Canvas.MoveTo(Round(LastNode_Xs),Round(LastNode_Ys));
          Canvas.LineTo(Round(Node_Xs),Round(Node_Ys));
          end;
        //. draw nodes marks
        if (Node_flVisible) then ShowNodeMarker(Canvas, Node_Xs,Node_Ys,TUserDynamicHintTrackItem(ptrItem^).TimeStamp,NodeIndex);
        //. next interval
        ptrLastItem:=ptrItem;
        LastNode_Xs:=Node_Xs;
        LastNode_Ys:=Node_Ys;
        LastNode_flVisible:=Node_flVisible;
        ptrItem:=TUserDynamicHintTrackItem(ptrLastItem^).Next;
        Inc(NodeIndex);
      until (ptrItem = nil);
      end;
    end;
  finally
  Canvas.Brush.Style:=SavedBrushStyle;
  Canvas.Pen.Style:=SavedPenStyle;
  Canvas.Unlock;
  end;
  end;
  end;

var
  ptrItem: pointer;
begin
DynamicHints.Lock.Enter;
try
ptrItem:=Items;
while (ptrItem <> nil) do with TUserDynamicHint(ptrItem^) do begin
  if (flEnabled AND flTracking) then ShowTrack(ptrItem);
  //.
  if (ptrCancelFlag <> nil)
   then begin
    Sleep(0); //. exit from the current thread to alow the cancel flag to be set
    if (Boolean(ptrCancelFlag^)) then Raise EUnnecessaryExecuting.Create(''); //. =>
    end;
  //.
  if (Now > BestBeforeTime) then Break; //. >
  //. next
  ptrItem:=Next;
  end;
finally
DynamicHints.Lock.Leave;
end;
end;

procedure TUserDynamicHints.CheckItemsVisibility(const ActualityInterval: TComponentActualityInterval; const ptrCancelFlag: pointer);

  procedure CheckVisibility(const ItemPtr: pointer);

    function IsNodeVisible(const Xs,Ys: Extended): boolean;
    var
      RW: TReflectionWindowStrucEx;
    begin
    DynamicHints.Reflector.ReflectionWindow.GetWindow(false, RW);
    with RW do
    Result:=(((Xmn <= Xs) AND (Xs <= Xmx)) AND ((Ymn <= Ys) AND (Ys <= Ymx)));
    end;

  var
    Obj: TSpaceObj;
    FirstPoint,SecondPoint: TPoint;
    Xs,Ys: Extended;    
  begin
  with TUserDynamicHint(ItemPtr^) do begin
  DynamicHints.Reflector.Space.ReadObj(Obj,SizeOf(Obj),ptrObj);
  if (NOT DynamicHints.Reflector.Space.Obj_ActualityInterval_IsActualForTimeInterval(Obj,ActualityInterval))
   then begin
    flVisible:=false;
    Exit; //. ->
    end;
  if (Obj.ptrFirstPoint <> nilPtr)
   then begin
    DynamicHints.Reflector.Space.ReadObj(FirstPoint,SizeOf(FirstPoint),Obj.ptrFirstPoint);
    ConvertNode(FirstPoint.X,FirstPoint.Y,{out} Xs,Ys);
    flVisible:=IsNodeVisible(Xs,Ys);
    if (flVisible)
     then begin
      BindingX:=Xs;
      BindingY:=Ys;
      if ((Obj.Width > 0) AND (FirstPoint.ptrNextObj <> nilPtr))
       then begin
        DynamicHints.Reflector.Space.ReadObj(SecondPoint,SizeOf(SecondPoint),FirstPoint.ptrNextObj);
        ConvertNode(SecondPoint.X,SecondPoint.Y,{out} Xs,Ys);
        DirectionBindingX:=Xs;
        DirectionBindingY:=Ys;
        end
       else begin
        DirectionBindingX:=BindingX;
        DirectionBindingY:=BindingY;
        end;
      end;
    end;
  end;
  end;

var
  ptrItem: pointer;
begin
DynamicHints.Lock.Enter;
try
ptrItem:=Items;
while (ptrItem <> nil) do with TUserDynamicHint(ptrItem^) do begin
  if (flEnabled AND (ptrObj <> nilPtr) AND flAlwaysCheckVisibility) then CheckVisibility(ptrItem);
  //.
  if (ptrCancelFlag <> nil)
   then begin
    Sleep(0); //. exit from the current thread to alow the cancel flag to be set
    if (Boolean(ptrCancelFlag^)) then Raise EUnnecessaryExecuting.Create(''); //. =>
    end;
  //. next
  ptrItem:=Next;
  end;
finally
DynamicHints.Lock.Leave;
end;
end;

procedure TUserDynamicHints.ShowControlPanel;
begin
fmUserHintsPanel.ShowModal();
end;

procedure TUserDynamicHints.UpdateReflectorView;
begin
DynamicHints.Reflector.Reflecting.RecalcReflect();
end;

procedure TUserDynamicHints.BindingPoints_Shift(const dX,dY: Extended);
var
  ptrItem: pointer;
begin
DynamicHints.Lock.Enter;
try
ptrItem:=Items;
while (ptrItem <> nil) do with TUserDynamicHint(ptrItem^) do begin
  BindingX:=(BindingX+dX);
  BindingY:=(BindingY+dY);
  //.
  DirectionBindingX:=(DirectionBindingX+dX);
  DirectionBindingY:=(DirectionBindingY+dY);
  //. next
  ptrItem:=Next;
  end;
finally
DynamicHints.Lock.Leave;
end;
end;

procedure TUserDynamicHints.BindingPoints_Scale(const Xc,Yc: Extended; const Scale: Extended);
var
  ptrItem: pointer;
begin
DynamicHints.Lock.Enter;
try
ptrItem:=Items;
while (ptrItem <> nil) do with TUserDynamicHint(ptrItem^) do begin
  BindingX:=(Xc+(BindingX-Xc)*Scale);
  BindingY:=(Yc+(BindingY-Yc)*Scale);
  //.
  DirectionBindingX:=(Xc+(DirectionBindingX-Xc)*Scale);
  DirectionBindingY:=(Yc+(DirectionBindingY-Yc)*Scale);
  //. next
  ptrItem:=Next;
  end;
finally
DynamicHints.Lock.Leave;
end;
end;

procedure TUserDynamicHints.BindingPoints_Rotate(const Xc,Yc: Extended; const Angle: Extended);
var
  ptrItem: pointer;
  _X,_Y: Extended;
begin
DynamicHints.Lock.Enter;
try
ptrItem:=Items;
while (ptrItem <> nil) do with TUserDynamicHint(ptrItem^) do begin
  _X:=Xc+(BindingX-Xc)*Cos(Angle)+(BindingY-Yc)*(-Sin(Angle));
  _Y:=Yc+(BindingX-Xc)*Sin(Angle)+(BindingY-Yc)*Cos(Angle);
  BindingX:=_X;
  BindingY:=_Y;
  //.
  _X:=Xc+(DirectionBindingX-Xc)*Cos(Angle)+(DirectionBindingY-Yc)*(-Sin(Angle));
  _Y:=Yc+(DirectionBindingX-Xc)*Sin(Angle)+(DirectionBindingY-Yc)*Cos(Angle);
  DirectionBindingX:=_X;
  DirectionBindingY:=_Y;
  //. next
  ptrItem:=Next;
  end;
finally
DynamicHints.Lock.Leave;
end;
end;


end.


