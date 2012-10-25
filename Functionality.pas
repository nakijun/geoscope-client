
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

{$H+}
unit Functionality;
Interface
Uses
  Windows,  
  SysUtils,
  Classes,
  SyncObjs,
  SOAPHTTPTrans,
  DB, DBClient,
  Variants,
  Forms,
  Graphics,
  ExtCtrls,
  OpenGLEx,
  unitOpenGL3DSpace,
  GlobalSpaceDefines,
  unitIDsCach,
  {$IFNDEF EmbeddedServer}
  FunctionalitySOAPInterface,
  {$ELSE}
  SpaceInterfacesImport,
  {$ENDIF}
  unitProxySpace,
  unit3DReflector,
  unitReflector,
  MSXML;



Type
  //. Дескриптор объекта
  TObjectDescr = packed record
    idType: integer;
    idObj: integer;
  end;

Const
  //. an empty object
  nilObject: TObjectDescr = (idType: 0;idObj: 0);

  //. user component operations (tranferred from SecurityComponentOperations table)
  idCreateOperation = 1;
  idDestroyOperation = 2;
  idReadOperation = 3;
  idWriteOperation = 4;
  idCloneOperation = 5;
  idExecuteOperation = 6;
  idChangeSecurityOperation = 7;

  Function ObjectIsNil(const pObj: TObjectDescr): boolean; stdcall;

Type
  TProc = procedure of object;
  TFunctionality = class;
  TFunctionalityClass = class of TFunctionality;
  TFunctionality = class
  private
    RefCount: integer;
  public
    flDATAPresented: boolean;
    BestBeforeTime: TDateTime;

    Constructor Create; virtual;
    Destructor Destroy; override;

    procedure UpdateDATA; virtual;
    procedure ClearDATA; virtual; 
    
    function AddRef: integer; virtual;
    function Release: integer; virtual;
    function QueryFunctionality(RequiredFunctionalityClass: TFunctionalityClass; out F: TFunctionality): boolean; virtual; StdCall;
  end;

  TTypeFunctionality = class;
  TComponentFunctionality = class;

  {$I FunctionalityImportInterface.inc}

  TTypeSystem = class;

  TTypeFunctionalityClass = class of TTypeFunctionality;

  TUpdateProcOfTypeSystemPresentUpdater = procedure(const idObj: integer; const Operation: TComponentOperation) of object;

  TTypeSystemPresentUpdaterAbstract = class
  private
    DisableCount: integer;
  public
    TypeSystem: TTypeSystem;
  end;
  
  TTypeSystemPresentUpdater = class(TTypeSystemPresentUpdaterAbstract) //. обновитель представления системы типа
  public
    UpdateProc: TUpdateProcOfTypeSystemPresentUpdater;

    Constructor Create(pTypeSystem: TTypeSystem; pUpdateProc: TUpdateProcOfTypeSystemPresentUpdater);
    Destructor Destroy; override;
    procedure Disable; //. увеличивает счетчик блокировки
    function Enabled: boolean; //. проверяет блоктровку, если блокирован уменьшает счетчик блокировки на 1
    procedure Update(const idObj: integer; const Operation: TComponentOperation); //. обновляет представление
    procedure PartialUpdate(const idObj: integer; const Data: TByteArray); //. обновляет часть представления
  end;

  TTypesSystem = class;

  TComponentContextItem = class
  public
    Owner: TCID;
    Name: string;
    ActualityInterval: TComponentActualityInterval;

    procedure SaveToXML(Document: IXMLDOMDocument; ParentNode: IXMLDOMElement); virtual;
    procedure LoadFromXML(Node: IXMLDOMNode); virtual;
    procedure SaveToStream(const Stream: TStream); virtual;
    procedure LoadFromStream(const Stream: TStream); virtual;
  end;

  TComponentContext = class;
  TComponentTypeContext = class;

  TTypeSystem = class
  private
    FEnabled: boolean;
    PresentUpdaters: TThreadList;
    FIDStr: string[4];

    function getSpace: TProxySpace;
    procedure setEnabled(Value: boolean);
    function IDStr: shortstring;
  public
    Lock: TCriticalSection;
    TypesSystem: TTypesSystem;
    idType: integer;
    TableName: shortstring;
    TypeFunctionalityClass: TTypeFunctionalityClass;
    TypeContext: TComponentTypeContext;
    Items: TList;
    CachingList: TThreadList;

    Constructor Create(pTypesSystem: TTypesSystem); overload; virtual; abstract;
    Constructor Create; overload; virtual; abstract;
    Constructor CreateNew(pTypesSystem: TTypesSystem; const pidType: integer; const pTableName: string; const pTypeFunctionalityClass: TTypeFunctionalityClass); overload;
    Constructor CreateNew(const pidType: integer; const pTableName: string; const pTypeFunctionalityClass: TTypeFunctionalityClass); overload;
    Destructor Destroy; override;
    procedure Initialize; virtual;
    procedure DoOnComponentOperationLocal(const pidTObj,pidObj: integer; const Operation: TComponentOperation); virtual;
    procedure DoOnComponentPartialUpdateLocal(const pidTObj,pidObj: integer; const Data: TByteArray); virtual;
    procedure DoOnReflectorRemoval(const pReflector: TAbstractReflector); virtual;
    function TPresentUpdater_Create(pUpdateProc: TUpdateProcOfTypeSystemPresentUpdater): TTypeSystemPresentUpdater;
    function TContextTypeHolder_Create(): TTypeSystemPresentUpdater;
    //. implementation of objects caching
    procedure Caching_Start; virtual;
    procedure Caching_AddObject(const idObj: integer); virtual;
    procedure Caching_Finish; virtual;
    //.
    function  CreateContext(const Owner: TComponentContext): TComponentTypeContext; virtual;
    function  Context_CreateItem(): TComponentContextItem; virtual;
    procedure Context_RemoveItem(const idComponent: integer); virtual;
    procedure Context_UpdateItem(const ID: integer); virtual;
    procedure Context_UpdateByItemsList(const List: TList); virtual;
    procedure Context_DoOnComponentOperation(const ID: integer; const Operation: TComponentOperation); virtual;
    function  Context_IsItemExist(const idComponent: integer): boolean; virtual;
    procedure Context_GetItems(out IDs: TIDArray); virtual; //. if Length(IDs) = 1 and IDs[0] = 0 so cache contains all of type instances
    procedure Context_ClearItems(); virtual;
    procedure Context_ClearInactiveItems(); virtual;
    procedure Context_SaveDATA(Document: IXMLDOMDocument; ParentNode: IXMLDOMElement);
    procedure Context_LoadDATA(Node: IXMLDOMNode);
    procedure DoOnContextIsInitialized(); virtual;
    function  getContextItem(ID: integer): TComponentContextItem;
    procedure setContextItem(ID: integer; Value: TComponentContextItem);
    //.
    property Space: TProxySpace read getSpace;
    property Enabled: boolean read FEnabled write setEnabled;
    property Context[ID: integer]: TComponentContextItem read getContextItem write setContextItem; default;
  end;

  TItemTypeSystem = class
  private
    function getSpace: TProxySpace;
    function getidType: integer;
  public
    TypeSystem: TTypeSystem;

    Constructor Create(pTypeSystem: TTypeSystem); virtual;
    Destructor Destroy; override;

    property Space: TProxySpace read getSpace;
    property idType: integer read getidType;
  end;

  TReferencedObj = record
    ID: integer;
    RefCount: integer;
    NewID: integer;
  end;

  TItemComponentsList = record
    idTComponent: integer;
    idComponent: integer;
    id: integer;
  end;

  TComponentsList = class(TList)
  public
    Destructor Destroy; override;
    procedure AddComponent(const pidTComponent,pidComponent,pid: integer);
    procedure Delete(Index: Integer);
    procedure Clear;
  end;

  TCashTypeSystem = class(TItemTypeSystem)
  public
    procedure Update; overload; virtual; abstract;
    procedure Update(const idObj: integer; const Operation: TComponentOperation); overload;
    procedure UpdateLocal(const idObj: integer; const Operation: TComponentOperation); virtual; abstract;
    procedure UpdateLocalForPartialUpdate(const idObj: integer; const Data: TByteArray); virtual;
    procedure UpdateGlobal(const idObj: integer; const Operation: TComponentOperation);
    procedure RemoveItem(const pidObj: integer); virtual;
    procedure Empty; virtual;
    procedure SaveItemsDATA(Document: IXMLDOMDocument; ParentNode: IXMLDOMElement); virtual;
    procedure LoadItems(Node: IXMLDOMNode); virtual;
  end;

  TBaseVisualizationContextItem = class(TComponentContextItem);

  TBaseVisualizationTypeSystem = class(TTypeSystem)
  public
    function  Context_CreateItem(): TComponentContextItem; override;
    procedure Context_UpdateItem(const ID: integer); override;
    procedure Context_UpdateByItemsList(const List: TList); override;
    function InplaceHintEnabled(): boolean; virtual; 
  end;

  TItemStrobingVisuazationsReflectors = record
    ptrNext: pointer;
    ReflectorID: integer;
    ReflectionID: integer;
  end;

  TStrobingVisuazationsReflectors = class
  private
    FItems: pointer;
  public
    Constructor Create;
    Destructor Destroy; override;
    procedure Clear;
    procedure InsertItem(const pReflectorID: integer; const pReflectionID: integer);
    function GetItemByReflectorID(const pReflectorID: integer; out ptrItem: pointer): boolean;
    function ReflectorReflectionChanged(const pReflectorID: integer; const pReflectionID: integer): boolean;
  end;

  TItemStrobingVisualizations = record
    ptrNext: pointer;
    idTVisualization: integer;
    idVisualization: integer;
    StrobingInterval: integer;
    ptrObj: TPtr;
    StateData: longword;
    Reflectors: TStrobingVisuazationsReflectors;
  end;

  TStrobingVisualizations = class(TTimer)
  private
    Counter: integer;

    function GetPtrItem(const idTObj,idObj: integer): pointer;
    procedure RemoveItem(const idTObj,idObj: integer); 
    procedure Process(Sender: TObject);
    function Obj_StateData(const ptrObj: TPtr): longword;
  public
    TypesSystem: TTypesSystem;
    FItems: pointer;

    Constructor Create(pTypesSystem: TTypesSystem);
    Destructor Destroy; override;
    procedure Clear; 
    procedure Update;
    procedure DoOnComponentOperationLocal(const idTObj,idObj: integer; const Operation: TComponentOperation);
  end;

  //. конфигурация TypesSystem
  TDisabledTypes = class(TList)
  private
    TypesSystem: TTypesSystem;
  public
    Constructor Create(pTypesSystem: TTypesSystem);
    procedure Update;
    procedure Save;
    function IsTypeDisabled(const idType: integer): boolean;
    procedure InsertType(const idType: integer);
    procedure RemoveType(const idType: integer);
  end;

  TTypesSystemConfiguration = class
  private
    TypesSystem: TTypesSystem;
  public
    DisabledTypes: TDisabledTypes;

    Constructor Create(pTypesSystem: TTypesSystem);
    Destructor Destroy; override;
    procedure Open;
    procedure Validate;
  end;

  TUpdateProcOfTypesSystemPresentUpdater = procedure(const idTObj,idObj: integer; const Operation: TComponentOperation) of object;
  TTypesSystemPresentUpdater = class //. обновитель представления системы типов
  private
    DisableCount: integer;
  public
    TypesSystem: TTypesSystem;
    UpdateProc: TUpdateProcOfTypesSystemPresentUpdater;

    Constructor Create(pTypesSystem: TTypesSystem; pUpdateProc: TUpdateProcOfTypesSystemPresentUpdater);
    Destructor Destroy; override;
    procedure Disable; //. увеличивает счетчик блокировки
    function Enabled: boolean; //. проверяет блоктровку, если блокирован уменьшает счетчик блокировки на 1
    procedure Update(const idTObj,idObj: integer; const Operation: TComponentOperation); //. обновляет представление
    procedure PartialUpdate(const idTObj,idObj: integer; const Data: TByteArray); //. обновляет часть представления
  end;

  TComponentsTrackingItem = record
    ptrNext: pointer;
    FileName: shortstring;
    ChangedTime: TDateTime;
    idTObj: integer;
    idObj: integer;
  end;

  TComponentsTracking = class(TThread)
  private
    Lock: TCriticalSection;
    TypesSystem: TTypesSystem;
    Items: pointer;

    procedure Clear;
    procedure Execute; override;
    procedure Check;
  public
    Constructor Create(pTypesSystem: TTypesSystem);
    Destructor Destroy; override;
    procedure Insert(const pFileName: shortstring; const pCreatedTime: TDateTime; const pidTObj,pidObj: integer);
  end;

  ETypesSystemError = class(Exception);
  ETypeDisabled = class(ETypesSystemError);
  ETypeNotFound = class(ETypesSystemError);

  TTypesSystem = class(TList)
  private
    PresentUpdaters: TThreadList;
  public
    Space: TProxySpace;
    IDsCach: TIDsCach;
    Reflector: TAbstractReflector;

    ClipBoard_flExist: boolean;
    Clipboard_Instance_idTObj,
    Clipboard_Instance_idObj: integer;
    Clipboard_Instance_idPanelProps: integer;
    Configuration: TTypesSystemConfiguration;
    StrobingVisualizations: TStrobingVisualizations;
    ComponentsTracking: TComponentsTracking;
    //. Context
    Context: TComponentContext; 

    Constructor Create;
    Destructor Destroy; override;
    procedure Initialize;
    procedure Finalize;
    procedure FreeSystems;
    function QueryTypes(TypeFunctionalityClass: TFunctionalityClass; out vList: TList): boolean;
    procedure DoOnComponentOperationLocal(const idTObj,idObj: integer; const Operation: TComponentOperation);
    procedure DoOnComponentPartialUpdateLocal(const idTObj,idObj: integer; const Data: TByteArray);
    procedure DoOnComponentOperation(const idTObj,idObj: integer; const Operation: TComponentOperation);
    procedure DoOnComponentPartialUpdate(const idTObj,idObj: integer; const Data: TByteArray);
    procedure DoOnReflectorRemoval(const pReflector: TAbstractReflector); virtual; 
    function TPresentUpdater_Create(pUpdateProc: TUpdateProcOfTypesSystemPresentUpdater): TTypesSystemPresentUpdater;
    function TContextTypesHolder_Create(): TTypesSystemPresentUpdater;
    //. implementation of objects caching
    procedure Caching_Start;
    procedure Caching_AddObject(const idTObj,idObj: integer);
    procedure Caching_Finish;
    procedure Context_RemoveItem(const idTComponent,idComponent: integer);
    function  Context_IsItemExist(const idTComponent,idComponent: integer): boolean; overload;
    function  Context_IsItemExist(const idTComponent,idComponent: integer; out TS: TTypeSystem): boolean; overload;
    procedure Context_GetItems(out Components: TComponentsList);
    procedure Context_ClearItems();
    procedure Context_ClearInactiveItems();
    procedure Context_SaveDATA(Document: IXMLDOMDocument; ParentNode: IXMLDOMElement);
    procedure Context_LoadDATA(Node: IXMLDOMNode);
    procedure DoOnContextIsInitialized();
    //. export
    procedure DoExportComponents(const pUserName,pUserPassword: WideString; ComponentsList: TComponentsList; const ExportFileName: string);
    procedure DoImportComponents(const pUserName,pUserPassword: WideString; const ImportFileName: string; out ComponentsList: TComponentsList);
  end;

  TComponentContextItemHolder = record
    ptrNext: pointer;
    ID: integer;
    //.
    Item: TComponentContextItem;
  end;

  TComponentTypeContext = class
  private
    _Lock: TCriticalSection;
    ComponentContext: TComponentContext;
    Items: TIDsCach;
    ItemsCount: integer;
    ItemsHolders: pointer;

    function getItem(ID: integer): TComponentContextItem;
    procedure setItem(ID: integer; Value: TComponentContextItem);
  public
    TypeSystem: TTypeSystem;
    DataFlags: TComponentDataFlags;
    
    Constructor Create(const pComponentContext: TComponentContext; const pTypeSystem: TTypeSystem);
    Destructor Destroy; override;
    procedure Lock();
    procedure Unlock();
    procedure Empty();
    procedure SaveContextDATA(Document: IXMLDOMDocument; ParentNode: IXMLDOMElement);
    procedure LoadContextDATA(Node: IXMLDOMNode);
    procedure GetComponentIDs(out IDs: TIDArray);

    property Item[ID: integer]: TComponentContextItem read getItem write setItem; default;
  end;

  TComponentContext = class
  private
    TypesSystem: TTypesSystem;
    Items: TIDsCach;

    function getItem(TypeID,ID: integer): TComponentContextItem;
    procedure setItem(TypeID,ID: integer; Value: TComponentContextItem);
    function getTypeContext(TypeID: integer): TComponentTypeContext;
  public
    Constructor Create(const pTypesSystem: TTypesSystem);
    Destructor Destroy; override;
    procedure Clear();
    procedure SaveContextDATA(Document: IXMLDOMDocument; ParentNode: IXMLDOMElement);
    procedure LoadContextDATA(Node: IXMLDOMNode);

    //. property Item[TypeID,ID: integer]: TComponentContextItem read getItem write setItem; default;
    property TypeContext[TypeID: integer]: TComponentTypeContext read getTypeContext;
  end;

  TTypeImage = TBitmap;

  ETypeFunctionalityError = class(Exception);

//. Basis_Funtionalities

  TComponentData = packed record
    Owner: TID;
    Name: string;
    ActualityInterval: TComponentActualityInterval;
  end;

  TComponentDatas = array of TComponentData;

  TTypeFunctionality = class (TFunctionality)
  private
    RemotedFunctionality: TTypeFunctionalityRemoted;
  public
    TypeSystem: TTypeSystem;
    _UserName: WideString;
    _UserPassword: WideString;
    FImage: TTypeImage;
    flUserSecurityDisabled: boolean;

    Constructor Create; virtual;
    Destructor Destroy; override;
    function UserName: WideString;
    function UserPassword: WideString;
    function _CreateInstance: integer; virtual; stdcall;
    function CreateInstance: integer; virtual; stdcall;
    function CreateInstanceUsingObject(const idTUseObj,idUseObj: integer): integer; virtual; stdcall;
    procedure _DestroyInstance(const idObj: integer); virtual; stdcall;
    procedure DestroyInstance(const idObj: integer); virtual; stdcall;
    procedure GetInstanceList(out List: TList); overload; virtual; stdcall;
    procedure GetInstanceList(out List: TByteArray); overload; stdcall;
    procedure GetInstanceNames(const IDs: array of Int64; const IDs_Offset: integer; const IDs_Size: integer; var Names: TStringList); virtual; stdcall;
    procedure GetInstanceOwnerNames(const IDs: TByteArray; out Data: TByteArray); virtual; stdcall;
    procedure GetComponentDatas(const IDs: array of Int64; const IDs_Offset: integer; const IDs_Size: integer; const DataFlags: TComponentDataFlags; out Datas: TComponentDatas); virtual;
    procedure GetComponentOwnerDatas(const IDs: TByteArray; const DataFlags: TComponentDataFlags; out Data: TByteArray); virtual; stdcall;
    function CheckImportInstance(ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer; virtual; stdcall;
    function ImportInstance(ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer; virtual; stdcall;
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality; virtual; stdcall;
    procedure DoOnComponentOperation(const idTObj,idObj: integer; const Operation: TComponentOperation); //. обновляет систему типов после операции над компонентом

    function getSpace: TProxySpace;
    function getidType: integer;
    function getName: string; virtual; stdcall;
    function getImage: TTypeImage; virtual; stdcall;
    function getTableName: string;
    function getImageList_Index: integer; virtual; stdcall;

    property Space: TProxySpace read getSpace;
    property idType: integer read getidType;
    property TableName: string read getTableName;
    property Name: string read getName;
    property Image: TTypeImage read getImage;
    property ImageList_Index: integer read getImageList_Index;
  end;


  TAbstractSpaceObjPanelProps = class(TForm)
  public
    Lock: TCriticalSection;
    FflFreeOnClose: boolean;
    flUpdating: boolean;

    procedure Update; virtual;
    procedure _Update; virtual; abstract;
    procedure Show;
    procedure SaveChanges; virtual; abstract;
    procedure Controls_ClearPropData; virtual; abstract;

    procedure setflFreeOnClose(Value: boolean); virtual;
    property flFreeOnClose: boolean read FflFreeOnClose write setflFreeOnClose;
  end;

  TAbstractSpaceObjPanelsProps = class(TList)
  public
  end;

  TComponentStatusBarUpdateNotificationProc = procedure of object;

  TAbstractComponentStatusBar = class
  public
    idTComponent: integer;
    idComponent: integer;
    //.
    UpdateNotificationProc: TComponentStatusBarUpdateNotificationProc;

    Constructor Create(const pidTComponent,pidComponent: integer; const pUpdateNotificationProc: TComponentStatusBarUpdateNotificationProc);
    procedure Update(); virtual; abstract;
    procedure SaveToStream(const Stream: TMemoryStream); virtual; abstract;
    function  LoadFromStream(const Stream: TMemoryStream): boolean; virtual; abstract;
    function Status_IsOnline(): boolean; virtual; abstract;
    function Status_LocationIsAvailable(): boolean; virtual; abstract;
    procedure DrawOnCanvas(const Canvas: TCanvas; const Rect: TRect; const Version: integer); virtual; abstract;
    procedure GetBitmapStream(const pWidth,pHeight: integer; const Version: integer; out BitmapStream: TMemoryStream); virtual; 
  end;

  TComponentFileType = (cftNone,cftEXE,cftTXT,cft3DS,cftMAX,cftQDC,cftBMP,cftJPEG,cftWMF,cftEMF,cftPNG);

  TComponentsFilesRepository = class
  private
    Space: TProxySpace;
  public
    Constructor Create(pSpace: TProxySpace);
    function CreateFile(DATAStream: TMemoryStream; const DATAType: TComponentFileType): integer; overload;
    procedure DestroyFile(const id: integer);
    function File_AddRef(const id: integer): integer;
    function File_Release(const id: integer): integer;
    function File_Size(const id: integer): integer;
    procedure GetFile(const id: integer; out DATAStream: TClientBlobStream; out DATAType: TComponentFileType);
    procedure SetFile(const id: integer; DATAStream: TMemoryStream; const DATAType: TComponentFileType);
    function CloneFile(const id: integer): integer;
  end;

  TPanelsPropsRepository = class
  private
    Space: TProxySpace;
  public
    Constructor Create(pSpace: TProxySpace);
    function InsertPanelProps(Stream: TStream): integer;
    procedure RemovePanelProps(const id: integer);
    function PanelProps_AddRef(const id: integer): integer;
    function PanelProps_Release(const id: integer): integer;
    procedure GetPanelProps(const id: integer; out Stream: TClientBlobStream);
    procedure SetPanelProps(const id: integer; Stream: TStream);
    function ClonePanelProps(const id: integer): integer;
  end;

  TComponentPresentUpdater = class(TTypeSystemPresentUpdaterAbstract) //. обновитель представления компонента
  public
    idObj: integer;
    OffProc: TProc;
    UpdateProc: TProc;

    Constructor Create(pTypeSystem: TTypeSystem; const pidObj: integer; pUpdateProc: TProc; pOffProc: TProc);
    Destructor Destroy; override;
    procedure Disable; //. увеличивает счетчик блокировки
    function Enabled: boolean; //. проверяет блоктровку, если блокирован уменьшает счетчик блокировки на 1
    procedure Update; //. обновляет представление
    procedure PartialUpdate(const Data: TByteArray); //. обновляет часть представления
    procedure Off; //. выключает представление
  end;

  TComponentNotifyType = (ontComponentInserted,ontComponentRemoved,ontBecomeComponent,ontBecomeFree,ontVisualizationClick,ontVisualizationDblClick,ontVisualizationComponentIsChanged);
  TComponentNotifyResult = (cnrUnknown,cnrProcessed,cnrQueued,cnrUnprocessed);

  EComponentNotExist = class(Exception);

  TComponentFunctionality = class (TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    idObj: Int64;
    _UserName: WideString;
    _UserPassword: WideString;
    UserData: TByteArray;
    flUserSecurityDisabled: boolean;
    RemotedFunctionality: TComponentFunctionalityRemoted;

    _ComponentsCount: integer;
    _DefaultPanelPropsLeft: integer;
    _DefaultPanelPropsTop: integer;
    _DefaultPanelPropsWidth: integer;
    _DefaultPanelPropsHeight: integer;
    _DefaultPanelProps_IsCustomPanelPropsExist: boolean;
    _DefaultPanelProps_CustomPanelProps: TMemoryStream;
    

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); virtual;
    Destructor Destroy; override;

    procedure UpdateDATA; override;
    procedure ClearDATA; override;
    
    function UserName: WideString;
    function UserPassword: WideString;
    procedure SetUser(const pUserName: WideString; const pUserPassword: WideString);
    function UserProfileFolder(): string;
    function GetObjTID: integer; stdcall;
    function GetObjID: integer; stdcall;
    procedure Check; virtual; stdcall; //. проверяет есть ли сущность поставленная в соответствии с функциональностью
    function CreationTimestamp(): double;
    //. user security routines
    procedure CheckUserOperation(const idOperation: integer); virtual; //. obsolete
    function GetSecurityComponent(out idSecurityComponent: integer): boolean;
    procedure ChangeSecurity(const pidSecurityFile: integer);
    //. user data routines
    function IsUserDataExists(const DataName: string): boolean;
    function DeleteUserData(const DataName: string): boolean;
    procedure SetUserData(const DataName: string; const Data: TMemoryStream);
    procedure GetUserData(const DataName: string; out Data: TMemoryStream);
    //.
    procedure InsertComponent(const idTComponent,idComponent: integer;  out id: integer); virtual; stdcall;
    procedure CloneAndInsertComponent(const idTComponent,idComponent: integer; out idClone: integer; out id: integer); virtual; stdcall;
    procedure ImportAndInsertComponents(const ImportFileName: string; out ComponentsList: TComponentsList); virtual; stdcall;
    procedure DestroyComponent(const idTComponent,idComponent: integer); virtual; stdcall;
    procedure RemoveComponent(const idTComponent,idComponent: integer); virtual; stdcall;
    procedure _ToClone(out idClone: integer); virtual; stdcall;
    procedure ToClone(out idClone: integer); virtual; stdcall;
    procedure ToCloneUsingObject(const idTUseObj,idUseObj: integer; out idClone: integer); virtual; stdcall;
    function CanDestroy(out Reason: string): boolean; virtual; stdcall;
    function Notify(const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult; virtual; stdcall;
    function GetOwner(out idTOwner,idOwner: integer): boolean; virtual; stdcall;
    function SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean; virtual; stdcall;
    procedure DestroyComponents; virtual; stdcall;
    procedure RemoveSelfAsComponent; stdcall;
    function IsUnReferenced: boolean; virtual; stdcall;
    function IsEmpty: boolean; virtual; stdcall;
    function DATASize: integer; virtual; stdcall;
    procedure LoadFromFile(const FileName: string); virtual; stdcall; abstract;
    procedure LoadFromStream(const Stream: TStream); virtual; stdcall; abstract;
    procedure GetComponentsList(out ComponentsList: TComponentsList); overload; virtual; stdcall;
    procedure GetComponentsList(out ComponentsList: TByteArray); overload; virtual; stdcall;
    function QueryComponents(FunctionalityClass: TFunctionalityClass; out ComponentsList: TComponentsList): boolean; overload; virtual; stdcall;
    function QueryComponents(const idTNeededType: integer; out ComponentsList: TComponentsList): boolean; overload; virtual; stdcall;
    function QueryComponentsWithTag(const idTNeededType: integer; const pTag: integer; out ComponentsList: TComponentsList): boolean; overload; stdcall;
    function QueryComponentsWithTag(const idTNeededType: integer; const pTag: integer; out ComponentsList: TByteArray): boolean; overload; stdcall;
    function QueryComponent(const idTNeededType: integer; out idTComponent,idComponent: integer): boolean; virtual; stdcall;
    function QueryComponentWithTag(const pTag: integer; out idTComponent,idComponent: integer): boolean; overload; stdcall;
    function QueryComponentWithTag(const idTNeededType: integer; const pTag: integer; out idTComponent,idComponent: integer): boolean; overload; stdcall;
    function QueryComponentFunctionality(NeededFunctionalityClass: TFunctionalityClass; out Functionality: TFunctionality): boolean; virtual; stdcall;
    function ComponentsCount: integer; virtual; stdcall;
    function GetRootOwner(out idTOwner,idOwner: integer): boolean; virtual; stdcall;
    //.
    function TPresentUpdater_Create(pUpdateProc: TProc; pOffProc: TProc): TComponentPresentUpdater;
    function TContextComponentHolder_Create(): TComponentPresentUpdater;
    //. reality user rating
    procedure RealityRating_AddUserRate(const Rate: integer; const RateReason: WideString);
    procedure RealityRating_GetAverageRate(out AvrRate: double; out RateCount: integer);
    procedure RealityRating_GetData(out RatingData: TByteArray);
    //. component actuality interval
    function  ActualityInterval_Get(): TComponentActualityInterval;
    procedure ActualityInterval_GetTimestamps(out BeginTimestamp,EndTimestamp: double); 
    function  ActualityInterval_GetLocally(): TComponentActualityInterval; virtual;
    procedure ActualityInterval_SetEndTimestamp(const Value: double);
    function ActualityInterval_IsActualForTime(const pTime: double): boolean;
    function ActualityInterval_IsActualForTimeInterval(const pInterval: TComponentActualityInterval): boolean;
    function ActualityInterval_IsActualForTimeLocally(const pTime: double): boolean;
    function ActualityInterval_IsActualForTimeIntervalLocally(const pInterval: TComponentActualityInterval): boolean;
    procedure ActualityInterval_Actualize();
    procedure ActualityInterval_Deactualize();
    //. PanelProps routines
    procedure CreateNewPanelProps;
    procedure DestroyPanelProps;
    function IsPanelPropsExist: boolean;
    function GetPanelPropsLeftTop(out PanelProps_Left,PanelProps_Top: integer): boolean; virtual; stdcall;
    function GetPanelPropsWidthHeight(out PanelProps_Width,PanelProps_Height: integer): boolean; virtual; stdcall;
    procedure SetPanelPropsLeftTop(const PanelProps_OfsX,PanelProps_OfsY: integer); virtual; stdcall;
    procedure SetPanelPropsWidthHeight(const PanelProps_Width,PanelProps_Height: integer); virtual; stdcall;
    //. CustomPanelProps routines
    function IsCustomPanelPropsExist: boolean;
    function idCustomPanelProps: integer;
    function CustomPanelProps: TMemoryStream; overload;
    procedure SetCustomPanelProps(Stream: TStream; const flNewValue: boolean{если = true, то заменяет панелью с новым ID}); overload;
    procedure SetCustomPanelPropsByID(const idPanelProps: integer);
    procedure ReleaseCustomPanelProps;
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; virtual; stdcall;

    function getSpace: TProxySpace;
    function getidTObj: integer; virtual; stdcall;
    function getName: string; virtual; stdcall;
    procedure setName(Value: string); virtual; stdcall;
    function getHint: string; virtual; stdcall; 
    function getTag: integer; stdcall;
    procedure setTag(Value: integer); stdcall;
    function GetIconImage(out Image: TBitmap): boolean; virtual; stdcall;

    procedure DoOnComponentUpdate; virtual; stdcall; //. обновляет систему типов после изменения компонента

    procedure GetExportDATA(Document: IXMLDOMDocument; ParentNode: IXMLDOMElement; PropsPanelsList: TList; ComponentsFilesList: TList); virtual; stdcall;
    function _GetDataDocument(const DataModel: integer; const DataType: integer; const flWithComponents: boolean; var Document: TByteArray): boolean; virtual; stdcall;
    function GetDataDocument(const DataModel: integer; const DataType: integer; const flWithComponents: boolean; out Document: TByteArray): boolean; virtual; stdcall;
    function GetHintInfo(const InfoType: integer; const InfoFormat: integer; out HintInfo: TByteArray): boolean; virtual; stdcall;

    procedure NotifyOnComponentUpdate;

    function GetComponentDATA(const Version: integer): TByteArray; stdcall;
    procedure SetComponentDATA(const Data: TByteArray); stdcall;

    function getTypeSystem: TTypeSystem;
    function getTableName: string;

    property Space: TProxySpace read getSpace;
    property idTObj: integer read getidTObj;
    property TypeSystem: TTypeSystem read getTypeSystem;
    property Name: string read getName write setName;
    property Hint: string read getHint;
    property Tag: integer read getTag write setTag;
    property TableName: string read getTableName;
  end;

Const
  ComponentsFilesTypesExtensions: array[TComponentFileType] of string = ('','exe','txt','3ds','max','qdc','bmp','jpeg','wmf','emf','png');

Type
  {TProxyObject}
  TSystemTProxyObject = class(TTypeSystem)
  public
    Constructor Create; override;
    procedure DoOnComponentOperationLocal(const idTObj,idObj: integer; const Operation: TComponentOperation); override;
  end;

Var
  SystemTProxyObject: TSystemTProxyObject;

Type
  //. Используется как ссылка как, заместитель объекта
  TTProxyObjectFunctionality = class (TTypeFunctionality)
  private
    RemotedFunctionality: TTProxyObjectFunctionalityRemoted;
  public
    //. переопределяемые методы
    Constructor Create; override;
    Destructor Destroy; override;

    function _CreateInstance: integer; override; stdcall;
    procedure _DestroyInstance(const idObj: integer); override; stdcall;
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality; override; stdcall;
    function getName: string; override; stdcall;
    function getImage: TTypeImage; override; stdcall;
    property Name: string read getName;
    {новые методы}
  end;

  TProxyObjectFunctionality = class (TComponentFunctionality)
  public
    RemotedFunctionality: TProxyObjectFunctionalityRemoted;

    //. переопределяемые методы
    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer); override; stdcall;
    function CanDestroy(out Reason: string): boolean; override; stdcall;
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; override; stdcall;
    function getName: string; override; stdcall;
    function getHint: string; override; stdcall;
    property Name: string read getName;
    //. новые методы
    function GetReference(out idTOwner,idOwner: integer): boolean;
    procedure SetReference(const idTOwner,idOwner: integer);
  end;



Type //. функиональности объекта, видимого в рефлекторе
  TTBaseVisualizationFunctionality = class(TTypeFunctionality)
  private
    RemotedFunctionality: TTBaseVisualizationFunctionalityRemoted;
    NewInstancePtr: TPtr;
    NewInstanceOwnerPtr: TPtr;
  public
    FReflector: TAbstractReflector;

    Constructor Create; override;
    Destructor Destroy; override;

    procedure GetComponentOwnerDatas(const IDs: TByteArray; const DataFlags: TComponentDataFlags; out Data: TByteArray); override;

    function CanCreateAsDetail: boolean; virtual; stdcall;
    function ImportInstance(ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer; override;

    function getReflector: TAbstractReflector; virtual; stdcall; abstract;
    procedure setReflector(Value: TAbstractReflector); virtual; stdcall; abstract;
    property Reflector: TAbstractReflector read getReflector write setReflector;
  end;

  TBaseVisualizationFunctionality = class(TComponentFunctionality)
  private
    RemotedFunctionality: TBaseVisualizationFunctionalityRemoted;
  public
    FPtr: TPtr;
    FReflector: TAbstractReflector;
    Meshes: TMeshes;
    Scale: Double;
    Translate_X: Double;
    Translate_Y: Double;
    Translate_Z: Double;
    Rotate_AngleX: Double;
    Rotate_AngleY: Double;
    Rotate_AngleZ: Double;
    flDynamic: boolean;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure DestroyData; virtual; stdcall; abstract;
    procedure CloneData(out idClone: integer); virtual; stdcall; abstract;
    function Ptr: TPtr; stdcall;
    procedure DoOnChangeScale(const ChangeCoef: Double); virtual; stdcall;
    function IsUnReferenced: boolean; override; stdcall;
    function TVisualizationUpdating_Create(Reflecting: TReflecting): TObject; virtual; stdcall; abstract;

    procedure ReflectInScene(Scene: TScene); virtual; stdcall;
    procedure Scaling(const pScale: Double); virtual; stdcall; abstract;
    procedure SetPosition(const X,Y,Z: Double); virtual; stdcall; abstract;
    procedure Move(const dX,dY,dZ: Double); virtual; stdcall; abstract;
    procedure ChangeScale(const Xbind,Ybind: Double; const pScale: Double); virtual; stdcall; abstract;
    procedure Rotate(const Xbind,Ybind: Double; const Angle: Double); virtual; stdcall; abstract;
    procedure Transform(const Xbind,Ybind: Double; const pScale: Double; const Angle: Double; const dX,dY: Double); virtual; stdcall; abstract;
    procedure SetPropertiesLocal(const pScale, pTranslate_X,pTranslate_Y,pTranslate_Z, pRotate_AngleX,pRotate_AngleY,pRotate_AngleZ: Double); virtual; stdcall; abstract;

    procedure DoOnComponentUpdate; override; stdcall;
    function DoOnOver: boolean; virtual; stdcall;
    function DoOnClick: boolean; virtual; stdcall;
    function DoOnDblClick: boolean; virtual; stdcall;

    procedure GetExportDATA(Document: IXMLDOMDocument; ParentNode: IXMLDOMElement; PropsPanelsList: TList; ComponentsFilesList: TList); override;

    procedure GetOwnerByVisualization(out idTOwner,idOwner: integer; out ptrOwnerVisualization: TPtr); stdcall;
    
    function GetCoVisualizationSpaces(out List: TList): boolean; overload; stdcall;
    function GetCoVisualizationSpaces(out List: TByteArray): boolean; overload; stdcall; 

    function getReflector: TAbstractReflector; virtual; stdcall; abstract;
    procedure setReflector(Value: TAbstractReflector); virtual; stdcall; abstract;
    function getStrobing: boolean; stdcall;
    procedure setStrobing(Value: boolean); stdcall;
    function getStrobingInterval: integer; stdcall;
    procedure setStrobingInterval(Value: integer); stdcall;

    property Reflector: TAbstractReflector read getReflector write setReflector;
    property Strobing: boolean read getStrobing write setStrobing;
    property StrobingInterval: integer read getStrobingInterval write setStrobingInterval;
  end;

  {2DFunctionality}
  TTBase2DVisualizationFunctionality = class(TTBaseVisualizationFunctionality)
  private
    RemotedFunctionality: TTBase2DVisualizationFunctionalityRemoted;
  public
    Constructor Create; override;
    Destructor Destroy; override;
    
    function _CreateInstanceEx(pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; virtual; abstract;
    function CreateInstanceEx(pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer;
    procedure _DestroyInstance(const idObj: integer); override; stdcall;

    function CreateObj(pReflector: TAbstractReflector; pObjectVisualization: TObjectVisualization; const flAbsoluteCoords: boolean; const idTObj,idObj: integer; ptrOwner: TPtr): TPtr; stdcall; //. однозначно использует ptrOwner
    procedure DestroyObj(const ptrDestrObj: TPtr); stdcall; 

    procedure GetDisproportionObjects(const Factor: double; out ObjectsList: TByteArray); stdcall;

    function getReflector: TAbstractReflector; override; stdcall;
    procedure setReflector(Value: TAbstractReflector); override; stdcall;

    function StdObjectVisualization: TObjectVisualization; virtual; stdcall; abstract;
    property Reflector: TAbstractReflector read getReflector write setReflector;
  end;

  TBase2DVisualizationFunctionality = class(TBaseVisualizationFunctionality)
  private
    RemotedFunctionality: TBase2DVisualizationFunctionalityRemoted;
  public
    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    function Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; virtual; stdcall; abstract;
    function ReflectOnCanvas(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean; virtual; stdcall;
    procedure CreateClone(const ptrObj: TPtr; const ptrCloneOwner: TPtr; out idClone: integer); stdcall;
    procedure GetLayInfo(out Lay,SubLay: integer); stdcall;
    function GetDetailsList(out DetailsList: TComponentsList): boolean;
    function ReflectAsNotLoaded(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pCanvas: TCanvas): boolean;
    function ContainerFilled: boolean; virtual;

    procedure GetProps(out oflagLoop: boolean; out oColor: TColor; out oWidth: Double; out oflagFill: boolean; out oColorFill: TColor);
    procedure SetProps(const pflagLoop: boolean; const pColor: TColor; const pWidth: Double; const pflagFill: boolean; const pColorFill: TColor);

    procedure CreateNode(const CreateNodeIndex: integer; const X,Y: Double);
    procedure DestroyNode(const DestroyNodeIndex: integer);
    procedure SetNode(const SetNodeIndex: integer; const newX,newY: Double);
    procedure GetNodes(out Nodes: TByteArray); virtual;
    procedure SetNodes(const Nodes: TByteArray; const pWidth: double); virtual;

    procedure CheckPlace(const Xbind,Ybind: Double; const pScale: Double; const Angle: Double; const dX,dY: Double);
    procedure Move(const dX,dY,dZ: Double); override; stdcall;
    procedure SetPosition(const X,Y,Z: Double); override; stdcall;
    procedure ChangeScale(const Xbind,Ybind: Double; const pScale: Double); override; stdcall;
    procedure Rotate(const Xbind,Ybind: Double; const Angle: Double); override; stdcall;
    procedure ChangeLay(const NewLayID: integer); stdcall;
    procedure ChangeOwner(const ptrNewOwner: TPtr); stdcall;
    procedure Transform(const Xbind,Ybind: Double; const pScale: Double; const Angle: Double; const dX,dY: Double); override; stdcall;
    function Square: Double; overload;
    function Square(const ExceptPointPtr: TPtr; const ExceptPointValueX,ExceptPointValueY: TCrd; const NewWidth: Double; const pScale: Double): Double; overload;
    function GetFormatNodes(out NodesList: TList; out SizeX,SizeY: integer): boolean; virtual; stdcall;
    procedure GetInsideObjectsList(out List: TComponentsList); stdcall;

    function getReflector: TAbstractReflector; override; stdcall;
    procedure setReflector(Value: TAbstractReflector); override; stdcall;
    function getIdLay: integer; stdcall;
    function getWidth: Double;
    procedure setWidth(Value: Double);
    function getflUserSecurity: boolean;
    procedure setflUserSecurity(Value: boolean);
    function getflDetailsNoIndex: boolean;
    procedure setflDetailsNoIndex(Value: boolean);
    function getflNotifyOwnerOnChange: boolean;
    procedure setflNotifyOwnerOnChange(Value: boolean);

    property Reflector: TAbstractReflector read getReflector write setReflector;
    property idLay: integer read getIdLay;
    property Width: Double read getWidth write setWidth;
    property flUserSecurity: boolean read getflUserSecurity write setflUserSecurity;
    property flDetailsNoIndex: boolean read getflDetailsNoIndex write setflDetailsNoIndex;
    property flNotifyOwnerOnChange: boolean read getflNotifyOwnerOnChange write setflNotifyOwnerOnChange;
  end;

Type
    TTLay2DVisualizationCash = class;

    TSystemTLay2DVisualization = class(TTypeSystem)
    public
      Cash: TTLay2DVisualizationCash;

      Constructor Create; override;
      Destructor Destroy; override;
      procedure Initialize; override;
      procedure DoOnComponentOperationLocal(const idTObj,idObj: integer; const Operation: TComponentOperation); override;
      procedure Caching_Start; override;
      procedure Caching_AddObject(const idObj: integer); override;
      procedure Caching_Finish; override;
      function Context_IsItemExist(const idComponent: integer): boolean; override;
      procedure Context_GetItems(out IDs: TIDArray); override;
      procedure AddInvisibleLaysToNumbersArray(const Scale: Extended; var LayNumbersArray: TByteArray);
    end;

    TItemTLay2DVisualizationCash = packed record
      ptrNext: pointer;
      idObj: integer;

      Name: string;
      Number: integer;
      VisibleMinScale: double;
      VisibleMaxScale: double;
    end;

    TTLay2DVisualizationCash = class(TCashTypeSystem)
    private
      FItems: pointer;
      ItemsCount: word;

      function GetPtrItem(const pidObj: integer): pointer;
      procedure RemoveItem(const pidObj: integer); override;
    public

      Constructor Create(pTypeSystem: TTypeSystem); override;
      destructor Destroy; override;
      procedure Empty; override;
      procedure Update; override;
      procedure UpdateByObjectsList(List: TList);
      procedure UpdateLocal(const pidObj: integer; const Operation: TComponentOperation); override;
      procedure SaveItemsDATA(Document: IXMLDOMDocument; ParentNode: IXMLDOMElement); override;
      procedure LoadItems(Node: IXMLDOMNode); override;
      function GetItem(const pidObj: integer; out ptrItem: pointer): boolean;
      procedure GetItemsIDs(out IDs: TIDArray);
    end;

var
    SystemTLay2DVisualization: TSystemTLay2DVisualization;

Type
    TTLay2DVisualizationFunctionality = class (TTBase2DVisualizationFunctionality)
    private
      RemotedFunctionality: TTLay2DVisualizationFunctionalityRemoted;
    public
      //. переопределяемые методы
      Constructor Create; override;
      Destructor Destroy; override;

      function _CreateInstance: integer; override; stdcall;
      function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality; override; stdcall;
      function getName: string; override; stdcall;
      function getImage: TTypeImage; override; stdcall;
      property Name: string read getName;
      //. новые методы
      function _CreateInstanceEx(pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; override;
      function StdObjectVisualization: TObjectVisualization; override; stdcall;
    end;

    TLay2DVisualizationFunctionality = class (TBase2DVisualizationFunctionality)
    private
      RemotedFunctionality: TLay2DVisualizationFunctionalityRemoted;
    public
      //. переопределяемые методы
      Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
      Destructor Destroy; override;

      procedure DestroyData; override; stdcall;
      procedure _ToClone(out idClone: integer); override; stdcall;
      function CanDestroy(out Reason: string): boolean; override; stdcall;
      function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; override; stdcall;
      function GetOwner(out idTOwner,idOwner: integer): boolean; override; stdcall;
      function getName: string; override; stdcall;
      procedure setName(Value: string); override; stdcall;
      function getHint: string; override; stdcall;
      property Name: string read getName write setName;
      //. новые методы
      procedure CloneData(out idClone: integer); override; stdcall;
      function Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; override; stdcall;
      procedure GetObjectPointersList(out List: TList);
      function isEmpty: boolean;
      function getNumber: integer;
      procedure GetParams(out oName: string; out oVisibleMinScale: Double; out oVisibleMaxScale: Double); overload;
      procedure GetParams(out oName: string; out oNumber: integer; out oVisibleMinScale: Double; out oVisibleMaxScale: Double); overload;
      procedure SetParams(const pName: string; const pVisibleMinScale: Double; const pVisibleMaxScale: Double);
      property Number: integer read getNumber;
    end;


  {$I FunctionalityExportInterface.inc}

                                 
var
  TypesSystem: TTypesSystem;          

  
  function TTypeFunctionality_Create(const idType: integer): TTypeFunctionality; stdcall;
  function TComponentFunctionality_Create(const idTObj,idObj: integer): TComponentFunctionality; stdcall;
  function TTypeSystemPresentUpdater_Create(const idType: integer; pUpdateProc: TUpdateProcOfTypeSystemPresentUpdater): TTypeSystemPresentUpdater; stdcall;
  function TComponentPresentUpdater_Create(const idTObj,idObj: integer; pUpdateProc: TProc; pOffProc: TProc): TComponentPresentUpdater; stdcall;

  procedure TypesSystem_DoOnComponentOperationLocal(const idTObj,idObj: integer; const Operation: TComponentOperation); stdcall;
  procedure TypesSystem_DoOnComponentPartialUpdateLocal(const idTObj,idObj: integer; const Data: TByteArray); stdcall;

  function ObjectIsInheritedFrom(Obj: TObject; IC: TClass): boolean;
  function FunctionalityIsInheritedFrom(Functionality: TFunctionality; IC: TClass): boolean;

  {other}
  function ExtractID(const S: string): integer;

Implementation
Uses
  unitEventLog,
  Math,
  {$IFDEF ExternalTypes}
  SpaceTypes,
  {$ENDIF}
  unitLay2DVisualizationPanelProps;


Const
  SNotSupported = 'not supported';


//. getmem routine overriding
procedure GetMem(var P: pointer; Size: integer);
begin
System.GetMem(P,Size);
//. try to lock memory
/// ? VirtualLock(P,Size);
end;
//.


function ExtractID(const S: string): integer;
var
  R: string;
  I: integer;
begin
SetLength(R,Length(S)-2);
for I:=1 to Length(R) do R[I]:=S[I+2];
Result:=StrToInt(R);
end;


function FormatFloat(const Format: string; Value: Extended): string;
begin
DecimalSeparator:='.';
Result:=SysUtils.FormatFloat(Format,Value);
end;

function StrToFloat(const S: string): Extended;
begin
DecimalSeparator:='.';
Result:=SysUtils.StrToFloat(S);
end;


function ObjectIsInheritedFrom(Obj: TObject; IC: TClass): boolean;
begin
Result:=(Obj is IC);
end;

function FunctionalityIsInheritedFrom(Functionality: TFunctionality; IC: TClass): boolean;
begin
Result:=ObjectIsInheritedFrom(Functionality,IC);
end;


Function ObjectIsNil(const pObj: TObjectDescr): boolean; stdcall;
begin
Result:=((pObj.idType = 0) OR (pObj.idObj = 0));
end;







{$I FunctionalityImportImplementation.inc}







//. component functionality create global routines 
function TTypeFunctionality_Create(const idType: integer): TTypeFunctionality; stdcall;
var
  I: integer;
  TS: TTypeSystem;
begin
Result:=nil;
TS:=TypesSystem.IDsCach[idType];
if (TS <> nil)
 then begin
  if (TS.Enabled)
   then Result:=TS.TypeFunctionalityClass.Create
   else Raise ETypeDisabled.Create('type is disabled idType: '+IntToStr(idType)); //. =>
  Exit; //. ->
  end;
for I:=0 to TypesSystem.Count-1 do
  if (TTypeSystem(TypesSystem[I]).idType = idType)
   then begin
    if (TTypeSystem(TypesSystem[I]).Enabled)
     then Result:=TTypeSystem(TypesSystem[I]).TypeFunctionalityClass.Create
     else Raise ETypeDisabled.Create('type is disabled idType: '+IntToStr(idType)); //. =>
    Exit; //. ->
    end;
Raise ETypeNotFound.Create('type is not found idType: '+IntToStr(idType)); //. =>
end;

function TComponentFunctionality_Create(const idTObj,idObj: integer): TComponentFunctionality; stdCall;
var
  TypeFunctionality: TTypeFunctionality;
begin
TypeFunctionality:=TTypeFunctionality_Create(idTObj);
try
Result:=TypeFunctionality.TComponentFunctionality_Create(idObj);
finally
TypeFunctionality.Release;
end;
end;

function TTypeSystemPresentUpdater_Create(const idType: integer; pUpdateProc: TUpdateProcOfTypeSystemPresentUpdater): TTypeSystemPresentUpdater; stdcall;
var
  TypeFunctionality: TTypeFunctionality;
begin
TypeFunctionality:=TTypeFunctionality_Create(idType);
try
Result:=TypeFunctionality.TypeSystem.TPresentUpdater_Create(pUpdateProc);
finally
TypeFunctionality.Release;
end;
end;

function TComponentPresentUpdater_Create(const idTObj,idObj: integer; pUpdateProc: TProc; pOffProc: TProc): TComponentPresentUpdater; stdcall;
var
  TypeFunctionality: TTypeFunctionality;
  CF: TComponentFunctionality;
begin
Result:=nil;
TypeFunctionality:=TTypeFunctionality_Create(idTObj);
try
CF:=TypeFunctionality.TComponentFunctionality_Create(idObj);
try
Result:=CF.TPresentUpdater_Create(pUpdateProc,pOffProc);
finally
CF.Release;
end;
finally
TypeFunctionality.Release;
end;
end;



{TFunctionality}
Constructor TFunctionality.Create;
begin
Inherited Create;
flDATAPresented:=false;
BestBeforeTime:=MaxTimestamp;
RefCount:=1;
end;

Destructor TFunctionality.Destroy;
begin
ClearDATA;
Inherited;
end;

procedure TFunctionality.UpdateDATA;
begin
ClearDATA;
flDATAPresented:=true;
end;

procedure TFunctionality.ClearDATA;
begin
flDATAPresented:=false;
end;

function TFunctionality.AddRef: integer;
begin
Inc(RefCount);
Result:=RefCount;
end;

function TFunctionality.Release: integer;
begin
if Self = nil then Exit; //. ->
Dec(RefCount);
if RefCount = 0
 then begin Destroy; Result:=0 end
 else Result:=RefCount;
end;

function TFunctionality.QueryFunctionality(RequiredFunctionalityClass: TFunctionalityClass; out F: TFunctionality): boolean;
begin
Result:=false;
F:=nil;
end;


{TTypeSystemPresentUpdater}
Constructor TTypeSystemPresentUpdater.Create(pTypeSystem: TTypeSystem; pUpdateProc: TUpdateProcOfTypeSystemPresentUpdater);
begin
Inherited Create;
TypeSystem:=pTypeSystem;
UpdateProc:=pUpdateProc;
DisableCount:=0;
TypeSystem.PresentUpdaters.Add(Self);
end;

Destructor TTypeSystemPresentUpdater.Destroy;
begin
if (TypeSystem <> nil) then TypeSystem.PresentUpdaters.Remove(Self);
Inherited;
end;

procedure TTypeSystemPresentUpdater.Disable;
begin
Inc(DisableCount);
end;

function TTypeSystemPresentUpdater.Enabled: boolean;
begin
Result:=false;
if DisableCount > 0
 then begin
  Dec(DisableCount);
  Exit; //. ->
  end;
Result:=true;
end;

procedure TTypeSystemPresentUpdater.Update(const idObj: integer; const Operation: TComponentOperation);
begin
if Assigned(UpdateProc) then UpdateProc(idObj, Operation);
end;

procedure TTypeSystemPresentUpdater.PartialUpdate(const idObj: integer; const Data: TByteArray);
begin
Update(idObj,opUpdate);
end;


{TComponentContextItem}
procedure TComponentContextItem.SaveToXML(Document: IXMLDOMDocument; ParentNode: IXMLDOMElement);
var
  PropNode: IXMLDOMElement;
begin
PropNode:=Document.CreateElement('idTOwner');   PropNode.nodeTypedValue:=Owner.idType;                          ParentNode.appendChild(PropNode);
PropNode:=Document.CreateElement('idOwner');    PropNode.nodeTypedValue:=Owner.id;                              ParentNode.appendChild(PropNode);
PropNode:=Document.CreateElement('Name');       PropNode.nodeTypedValue:=Name;                                  ParentNode.appendChild(PropNode);
PropNode:=Document.CreateElement('CAI_B');      PropNode.nodeTypedValue:=ActualityInterval.BeginTimestamp;      ParentNode.appendChild(PropNode);
PropNode:=Document.CreateElement('CAI_E');      PropNode.nodeTypedValue:=ActualityInterval.EndTimestamp;        ParentNode.appendChild(PropNode);
end;

procedure TComponentContextItem.LoadFromXML(Node: IXMLDOMNode);
begin
try
Owner.idType:=Node.selectSingleNode('idTOwner').nodeTypedValue;
Owner.id:=Node.selectSingleNode('idOwner').nodeTypedValue;
Name:=Node.selectSingleNode('Name').nodeTypedValue;
ActualityInterval.BeginTimestamp:=Node.selectSingleNode('CAI_B').nodeTypedValue;
ActualityInterval.EndTimestamp:=Node.selectSingleNode('CAI_E').nodeTypedValue;
except
  Owner.idType:=0;
  Owner.id:=0;
  Name:='';
  ActualityInterval.BeginTimestamp:=NullTimestamp;
  ActualityInterval.EndTimestamp:=MaxTimestamp;
  end;
end;

procedure TComponentContextItem.SaveToStream(const Stream: TStream);
var
  C: word;
begin
Stream.Write(Owner,SizeOf(Owner));
C:=Length(Name);
Stream.Write(C,SizeOf(C));
if (C > 0) then Stream.Write(Pointer(@Name[1])^,C);
Stream.Write(ActualityInterval.BeginTimestamp,SizeOf(ActualityInterval.BeginTimestamp));
Stream.Write(ActualityInterval.EndTimestamp,SizeOf(ActualityInterval.EndTimestamp));
end;

procedure TComponentContextItem.LoadFromStream(const Stream: TStream);
var
  C: word;
begin
Stream.Read(Owner,SizeOf(Owner));
Stream.Read(C,SizeOf(C));
SetLength(Name,C);
if (C > 0) then Stream.Read(Pointer(@Name[1])^,C);
Stream.Read(ActualityInterval.BeginTimestamp,SizeOf(ActualityInterval.BeginTimestamp));
Stream.Read(ActualityInterval.EndTimestamp,SizeOf(ActualityInterval.EndTimestamp));
end;


{TTypeSystem}
Constructor TTypeSystem.CreateNew(pTypesSystem: TTypesSystem; const pidType: integer; const pTableName: string; const pTypeFunctionalityClass: TTypeFunctionalityClass);
begin
Inherited Create;
Lock:=TCriticalSection.Create;
TypesSystem:=pTypesSystem;
idType:=pidType;
TableName:=pTableName;
TypeFunctionalityClass:=pTypeFunctionalityClass;
FEnabled:=true;
Items:=TList.Create;
PresentUpdaters:=TThreadList.Create;
CachingList:=TThreadList.Create;
FIDStr:='';
TypesSystem.Add(Self);
TypesSystem.IDsCach[idType]:=Self;
end;

Constructor TTypeSystem.CreateNew(const pidType: integer; const pTableName: string; const pTypeFunctionalityClass: TTypeFunctionalityClass);
begin
CreateNew(Functionality.TypesSystem, pidType, pTableName, pTypeFunctionalityClass);
end;


Destructor TTypeSystem.Destroy;
var
  L: TList;
  I: integer;
begin
TypesSystem.IDsCach[idType]:=nil;
TypesSystem.Remove(Self);
CachingList.Free;
if (PresentUpdaters <> nil)
 then
  try
  L:=PresentUpdaters.LockList();
  try
  for I:=0 to L.Count-1 do TTypeSystemPresentUpdaterAbstract(L[I]).TypeSystem:=nil; //. detach updater
  finally
  PresentUpdaters.UnlockList();
  end;
  finally
  PresentUpdaters.Destroy;
  end;
Items.Free;
Lock.Free;
//.
Inherited;
end;

procedure TTypeSystem.Initialize;
begin
//. Do nothings
end;

function TTypeSystem.getSpace: TProxySpace;
begin
Result:=TypesSystem.Space;
end;

procedure TTypeSystem.DoOnComponentOperationLocal(const pidTObj,pidObj: integer; const Operation: TComponentOperation);
var
  I: integer;
  ExceptionMessage: string;
  _PresentUpdaters: TList;
begin 
if (pidTObj = idType)
 then begin
  //. update component context
  Context_DoOnComponentOperation(pidObj,Operation);
  //. обновляем кэши системы типа
  for I:=0 to Items.Count-1 do
    if (TObject(Items[I]) is TCashTypeSystem)
     then
      try
      TCashTypeSystem(Items[I]).UpdateLocal(pidObj,Operation);
      except
        on E: Exception do begin
          ExceptionMessage:=TypeFunctionalityClass.ClassName+'.TypeSystem.DoOnComponentOperationLocal(idTObj = '+IntToStr(pidTObj)+',idObj = '+IntToStr(pidObj)+', Operation = '+IntToStr(Integer(Operation))+')';
          EventLog.WriteMajorEvent('ComponentDataUpdating',ExceptionMessage,E.Message);
          end;
        end;
  //. Обновляем представления данного типа
  _PresentUpdaters:=TList.Create; //. временно создаем для того, чтобы предупредить ошибку индекса, когда один или несколько обновителей выйдет из списка
  try
  with PresentUpdaters.LockList do
  try
  _PresentUpdaters.Capacity:=Count;
  for I:=0 to Count-1 do _PresentUpdaters.Add(List[I]);
  finally
  PresentUpdaters.UnLockList;
  end;
  for I:=0 to _PresentUpdaters.Count-1 do
    if (TObject(_PresentUpdaters[I]) is TComponentPresentUpdater)
     then with TComponentPresentUpdater(_PresentUpdaters[I]) do begin
      if ((TComponentPresentUpdater(_PresentUpdaters[I]).idObj = pidObj) AND Enabled)
       then
        try
        case Operation of
        opUpdate: Update;
        opDestroy: Off;
        end;
        except
          on E: Exception do begin
            ExceptionMessage:=TypeFunctionalityClass.ClassName+'.TypeSystem.DoOnComponentOperationLocal(idTObj = '+IntToStr(pidTObj)+',idObj = '+IntToStr(pidObj)+', Operation = '+IntToStr(Integer(Operation))+')';
            EventLog.WriteMajorEvent('ComponentRepresentationUpdating',ExceptionMessage,E.Message);
            end;
          end;
      end
     else
      if (TObject(_PresentUpdaters[I]) is TTypeSystemPresentUpdater)
       then with TTypeSystemPresentUpdater(_PresentUpdaters[I]) do
        if (Enabled)
         then
          try
          Update(pidObj, Operation);
          except
            on E: Exception do begin
              ExceptionMessage:=TypeFunctionalityClass.ClassName+'.TypeSystem.DoOnComponentOperationLocal(idTObj = '+IntToStr(pidTObj)+',idObj = '+IntToStr(pidObj)+', Operation = '+IntToStr(Integer(Operation))+')';
              EventLog.WriteMajorEvent('TypeRepresentationUpdating',ExceptionMessage,E.Message);
              end;
            end;
  finally
  _PresentUpdaters.Destroy;
  end;
  end;
end;

procedure TTypeSystem.DoOnComponentPartialUpdateLocal(const pidTObj,pidObj: integer; const Data: TByteArray);
var
  I: integer;
  ExceptionMessage: string;
  _PresentUpdaters: TList;
begin
if (pidTObj = idType)
 then begin
  //. обновляем кэши системы типа
  for I:=0 to Items.Count-1 do
    if (TObject(Items[I]) is TCashTypeSystem)
     then
      try
      TCashTypeSystem(Items[I]).UpdateLocalForPartialUpdate(pidObj,Data);
      except
        on E: Exception do begin
          ExceptionMessage:=TypeFunctionalityClass.ClassName+'.TypeSystem.DoOnComponentPartialUpdateLocal(idTObj = '+IntToStr(pidTObj)+',idObj = '+IntToStr(pidObj)+')';
          EventLog.WriteMajorEvent('ComponentDataUpdating',ExceptionMessage,E.Message);
          end;
        end;
  //. Обновляем представления данного типа
  _PresentUpdaters:=TList.Create; //. временно создаем для того, чтобы предупредить ошибку индекса, когда один или несколько обновителей выйдет из списка
  try
  with PresentUpdaters.LockList do
  try
  _PresentUpdaters.Capacity:=Count;
  for I:=0 to Count-1 do _PresentUpdaters.Add(List[I]);
  finally
  PresentUpdaters.UnLockList;
  end;
  for I:=0 to _PresentUpdaters.Count-1 do
    if (TObject(_PresentUpdaters[I]) is TComponentPresentUpdater)
     then with TComponentPresentUpdater(_PresentUpdaters[I]) do begin
      if ((TComponentPresentUpdater(_PresentUpdaters[I]).idObj = pidObj) AND Enabled)
       then
        try
        PartialUpdate(Data);
        except
          on E: Exception do begin
            ExceptionMessage:=TypeFunctionalityClass.ClassName+'.TypeSystem.DoOnComponentPartialUpdateLocal(idTObj = '+IntToStr(pidTObj)+',idObj = '+IntToStr(pidObj)+')';
            EventLog.WriteMajorEvent('ComponentRepresentationUpdating',ExceptionMessage,E.Message);
            end;
          end;
      end
     else
      if (TObject(_PresentUpdaters[I]) is TTypeSystemPresentUpdater)
       then with TTypeSystemPresentUpdater(_PresentUpdaters[I]) do
        if (Enabled)
         then
          try
          PartialUpdate(pidObj,Data);
          except
            on E: Exception do begin
              ExceptionMessage:=TypeFunctionalityClass.ClassName+'.TypeSystem.DoOnComponentPartialUpdateLocal(idTObj = '+IntToStr(pidTObj)+',idObj = '+IntToStr(pidObj)+')';
              EventLog.WriteMajorEvent('TypeRepresentationUpdating',ExceptionMessage,E.Message);
              end;
            end;
  finally
  _PresentUpdaters.Destroy;
  end;
  end;
end;

procedure TTypeSystem.DoOnReflectorRemoval(const pReflector: TAbstractReflector); 
begin
end;

procedure TTypeSystem.setEnabled(Value: boolean);
begin
if Value = FEnabled then Exit; //. ->
if Value
 then TypesSystem.Configuration.DisabledTypes.RemoveType(idType)
 else TypesSystem.Configuration.DisabledTypes.InsertType(idType);
FEnabled:=Value;
end;

function TTypeSystem.IDStr: shortstring;
begin
FIDStr:='id';
Result:=FIDStr;
end;

procedure TTypeSystem.Caching_Start;
begin
end;

procedure TTypeSystem.Caching_AddObject(const idObj: integer);
begin
CachingList.Add(Pointer(idObj));
end;

procedure TTypeSystem.Caching_Finish;
var
  List: TList;
  LockedList: TList;
  I: integer;
begin
List:=TList.Create;
try
LockedList:=CachingList.LockList;
try
List.Capacity:=LockedList.Capacity;
for I:=0 to LockedList.Count-1 do List.Add(LockedList[I]);
LockedList.Clear;
finally
CachingList.UnLockList;
end;
if ((List.Count > 0) AND (TypesSystem.Context <> nil)) then Context_UpdateByItemsList(List);
finally
List.Destroy;
end;
end;

function TTypeSystem.CreateContext(const Owner: TComponentContext): TComponentTypeContext;
begin
Result:=TComponentTypeContext.Create(Owner,Self);
end;

function TTypeSystem.Context_CreateItem(): TComponentContextItem;
begin
Result:=TComponentContextItem.Create();
end;

procedure TTypeSystem.Context_RemoveItem(const idComponent: integer);
var
  I: integer;
begin
if (TypesSystem.Context <> nil) then Context[idComponent]:=nil;
//.
for I:=0 to Items.Count-1 do if (TObject(Items[I]) is TCashTypeSystem)
 then begin
  TCashTypeSystem(Items[I]).RemoveItem(idComponent);
  Exit; //. ->
  end;
end;

procedure TTypeSystem.Context_UpdateItem(const ID: integer);
begin
end;

procedure TTypeSystem.Context_UpdateByItemsList(const List: TList);
begin
end;

procedure TTypeSystem.Context_DoOnComponentOperation(const ID: integer; const Operation: TComponentOperation);
begin
case Operation of
opCreate,opUpdate:      Context_UpdateItem(ID);
opDestroy:              Context[ID]:=nil;
end;
end;

function TTypeSystem.Context_IsItemExist(const idComponent: integer): boolean;
begin
Result:=((TypesSystem.Context <> nil) AND (Context[idComponent] <> nil));
end;

procedure TTypeSystem.Context_GetItems(out IDs: TIDArray);
var
  CTC: TComponentTypeContext;
begin
SetLength(IDs,0);
if (TypesSystem.Context <> nil)
 then begin
  CTC:=TypesSystem.Context.TypeContext[idType];
  CTC.GetComponentIDs({out} IDs);
  end;
end;

procedure TTypeSystem.Context_ClearItems();
var
  I: integer;
begin
if (TypesSystem.Context <> nil) then TypesSystem.Context.TypeContext[idType].Empty();
//.
for I:=0 to Items.Count-1 do begin
  if (TObject(Items[I]) is TCashTypeSystem) then TCashTypeSystem(Items[I]).Empty();
  end;
end;

procedure TTypeSystem.Context_ClearInactiveItems();
begin
end;

procedure TTypeSystem.Context_SaveDATA(Document: IXMLDOMDocument; ParentNode: IXMLDOMElement);
var
  TypeNode,ItemsNode: IXMLDOMElement;
  I: integer;
begin
TypeNode:=Document.CreateElement('T'+IntToStr(idType));
ParentNode.appendChild(TypeNode);
//.
ItemsNode:=Document.CreateElement('Items');
TypeNode.appendChild(ItemsNode);
//. save items
for I:=0 to Items.Count-1 do
  if (TObject(Items[I]) is TCashTypeSystem)
   then begin
    TCashTypeSystem(Items[I]).SaveItemsDATA(Document, ItemsNode);
    Break; //. >
    end;
end;

procedure TTypeSystem.Context_LoadDATA(Node: IXMLDOMNode);
var
  TypeNode,ItemsNode: IXMLDOMNode;
  I: integer;
begin
TypeNode:=Node.selectSingleNode('T'+IntToStr(idType));
if (TypeNode = nil) then Exit; //. ->
//.
ItemsNode:=TypeNode.selectSingleNode('Items');
if (ItemsNode = nil) then Exit; //. ->
//. load items
for I:=0 to Items.Count-1 do
  if (TObject(Items[I]) is TCashTypeSystem)
   then begin
    TCashTypeSystem(Items[I]).LoadItems(ItemsNode);
    Break; //. >
    end;
end;

procedure TTypeSystem.DoOnContextIsInitialized();
begin
end;

function TTypeSystem.getContextItem(ID: integer): TComponentContextItem;
begin
Result:=TypeContext[ID];
end;

procedure TTypeSystem.setContextItem(ID: integer; Value: TComponentContextItem);
begin
TypeContext[ID]:=Value;
end;


{TItemTypeSystem}
Constructor TItemTypeSystem.Create(pTypeSystem: TTypeSystem);
begin
Inherited Create;
TypeSystem:=pTypeSystem;
TypeSystem.Items.Add(Self);
end;

Destructor TItemTypeSystem.Destroy;
begin
TypeSystem.Items.Remove(Self);
Inherited;
end;

function TItemTypeSystem.getSpace: TProxySpace;
begin
Result:=TypeSystem.Space;
end;

function TItemTypeSystem.getidType: integer;
begin
Result:=TypeSystem.idType;
end;


{TCashTypeSystem}
procedure TCashTypeSystem.UpdateGlobal(const idObj: integer; const Operation: TComponentOperation);
var
  Params: WideString;
begin
end;

procedure TCashTypeSystem.Update(const idObj: integer; const Operation: TComponentOperation);
begin
UpdateGlobal(idObj, Operation);
UpdateLocal(idObj, Operation);
end;

procedure TCashTypeSystem.UpdateLocalForPartialUpdate(const idObj: integer; const Data: TByteArray);
begin
end;

procedure TCashTypeSystem.RemoveItem(const pidObj: integer);
begin
end;

procedure TCashTypeSystem.Empty;
begin
end;

procedure TCashTypeSystem.SaveItemsDATA(Document: IXMLDOMDocument; ParentNode: IXMLDOMElement);
begin
end;

procedure TCashTypeSystem.LoadItems(Node: IXMLDOMNode);
begin
end; 


{TComponentPresentUpdater}
Constructor TComponentPresentUpdater.Create(pTypeSystem: TTypeSystem; const pidObj: integer; pUpdateProc: TProc; pOffProc: TProc);
begin
Inherited Create;
TypeSystem:=pTypeSystem;
idObj:=pidObj;
OffProc:=pOffProc;
UpdateProc:=pUpdateProc;
DisableCount:=0;
TypeSystem.PresentUpdaters.Add(Self);
end;

Destructor TComponentPresentUpdater.Destroy;
begin
if (TypeSystem <> nil) then TypeSystem.PresentUpdaters.Remove(Self);
Inherited;
end;

procedure TComponentPresentUpdater.Disable;
begin
Inc(DisableCount);
end;

function TComponentPresentUpdater.Enabled: boolean;
begin
Result:=false;
if (DisableCount > 0)
 then begin
  Dec(DisableCount);
  Exit;
  end;
Result:=true;
end;

procedure TComponentPresentUpdater.Update;
begin
if Assigned(UpdateProc) then UpdateProc;
end;

procedure TComponentPresentUpdater.Off;
begin
if Assigned(OffProc) then OffProc;
end;

procedure TComponentPresentUpdater.PartialUpdate(const Data: TByteArray);
begin
Update();
end;


{TTypesSystemConfiguration.DisabledTypes}
Constructor TDisabledTypes.Create(pTypesSystem: TTypesSystem);
begin
Inherited Create;
TypesSystem:=pTypesSystem;
end;

procedure TDisabledTypes.Update;
var
  MemoryStream: TMemoryStream;
  BA: TByteArray;           
  idType: integer;
begin
Clear;                       
//. read user defined configuration
if (NOT TypesSystem.Space.flOffline)
 then
  {$IFNDEF EmbeddedServer}
  if (GetISpaceUserProxySpace(TypesSystem.Space.SOAPServerURL).Get_TypesSystemConfig(TypesSystem.Space.UserName,TypesSystem.Space.UserPassword,TypesSystem.Space.idUserProxySpace,{out} BA))
  {$ELSE}
  if (SpaceUserProxySpace_Get_TypesSystemConfig(TypesSystem.Space.UserName,TypesSystem.Space.UserPassword,TypesSystem.Space.idUserProxySpace,{out} BA))
  {$ENDIF}
   then begin
    MemoryStream:=TMemoryStream.Create();
    try
    ByteArray_PrepareStream(BA,TStream(MemoryStream));
    while MemoryStream.Read(idType,SizeOf(idType)) = SizeOf(idType) do begin
      asm
         MOV EAX,idType
         NOT EAX
         RCR EAX,1
         MOV idType,EAX
      end;
      Add(Pointer(idType))
      end;
    finally
    MemoryStream.Destroy();
    end;
    end;
end;

procedure TDisabledTypes.Save;
var
  MemoryStream: TMemoryStream;
  BA: TByteArray;
  I: integer;
  idType: integer;
begin
MemoryStream:=TMemoryStream.Create();
try
for I:=0 to Count-1 do begin
  //. щифрование типа запрещенного объекта
  idType:=Integer(List[I]);
  asm
     MOV EAX,idType
     RCL EAX,1
     NOT EAX
     MOV idType,EAX
  end;
  MemoryStream.Write(idType,SizeOf(idType));
  end;
ByteArray_PrepareFromStream(BA,TStream(MemoryStream));
{$IFNDEF EmbeddedServer}
GetISpaceUserProxySpace(TypesSystem.Space.SOAPServerURL).Set_TypesSystemConfig(TypesSystem.Space.UserName,TypesSystem.Space.UserPassword,TypesSystem.Space.idUserProxySpace,{out} BA);
{$ELSE}
SpaceUserProxySpace_Set_TypesSystemConfig(TypesSystem.Space.UserName,TypesSystem.Space.UserPassword,TypesSystem.Space.idUserProxySpace,{out} BA);
{$ENDIF}
finally
MemoryStream.Destroy();
end;
end;

function TDisabledTypes.IsTypeDisabled(const idType: integer): boolean;
var
  I: integer;
begin
Result:=false;
for I:=0 to Count-1 do
  if Integer(List[I]) = idType
   then begin
    Result:=true;
    Exit;
    end;
end;

procedure TDisabledTypes.InsertType(const idType: integer);
begin
if IsTypeDisabled(idType) then Exit;
Add(Pointer(idType));
end;

procedure TDisabledTypes.RemoveType(const idType: integer);
begin
if NOT IsTypeDisabled(idType) then Exit;
Remove(Pointer(idType));
end;


{TTypesSystemConfiguration}
Constructor TTypesSystemConfiguration.Create(pTypesSystem: TTypesSystem);
begin
Inherited Create;
TypesSystem:=pTypesSystem;
DisabledTypes:=TDisabledTypes.Create(TypesSystem);
end;

Destructor TTypesSystemConfiguration.Destroy;
begin
DisabledTypes.Free;
Inherited;
end;

procedure TTypesSystemConfiguration.Open;
begin
DisabledTypes.Update;
end;

procedure TTypesSystemConfiguration.Validate;
var
  I: integer;
begin
//. type systems enabling
for I:=0 to TypesSystem.Count-1 do with TTypeSystem(TypesSystem[I]) do begin
  FEnabled:=NOT DisabledTypes.isTypeDisabled(idType);
  end;
end;

{TTypesSystemPresentUpdater}
Constructor TTypesSystemPresentUpdater.Create(pTypesSystem: TTypesSystem; pUpdateProc: TUpdateProcOfTypesSystemPresentUpdater);
begin
Inherited Create;
TypesSystem:=pTypesSystem;
UpdateProc:=pUpdateProc;
DisableCount:=0;
TypesSystem.PresentUpdaters.Add(Self);
end;

Destructor TTypesSystemPresentUpdater.Destroy;
begin
if (TypesSystem.PresentUpdaters <> nil) then TypesSystem.PresentUpdaters.Remove(Self);
Inherited;
end;

procedure TTypesSystemPresentUpdater.Disable;
begin
Inc(DisableCount);
end;

function TTypesSystemPresentUpdater.Enabled: boolean;
begin
Result:=false;
if DisableCount > 0
 then begin
  Dec(DisableCount);
  Exit; //. ->
  end;
Result:=true;
end;

procedure TTypesSystemPresentUpdater.Update(const idTObj,idObj: integer; const Operation: TComponentOperation);
begin
if Assigned(UpdateProc) then UpdateProc(idTObj,idObj, Operation);
end;

procedure TTypesSystemPresentUpdater.PartialUpdate(const idTObj,idObj: integer; const Data: TByteArray); //. обновляет часть представления
begin
Update(idTObj,idObj,opUpdate);
end;


{TComponentsTracking}
Constructor TComponentsTracking.Create(pTypesSystem: TTypesSystem);
begin
Lock:=TCriticalSection.Create;
TypesSystem:=pTypesSystem;
Items:=nil;
Inherited Create(true);
Priority:=tpIdle;
Resume;
end;

Destructor TComponentsTracking.Destroy;
begin
Inherited;
Check;
Clear;
Lock.Free;
end;

procedure TComponentsTracking.Clear;
var
  ptrDestroyItem: pointer;
begin
Lock.Enter;
try
while Items <> nil do begin
  ptrDestroyItem:=Items;
  Items:=TComponentsTrackingItem(ptrDestroyItem^).ptrNext;
  FreeMem(ptrDestroyItem,SizeOf(TComponentsTrackingItem));
  end;
finally
Lock.Leave;
end;
end;

procedure TComponentsTracking.Insert(const pFileName: shortstring; const pCreatedTime: TDateTime; const pidTObj,pidObj: integer);
var
  ptrNewItem: pointer;
begin
Lock.Enter;
try
GetMem(ptrNewItem,SizeOf(TComponentsTrackingItem));
with TComponentsTrackingItem(ptrNewItem^) do begin
ptrNext:=Items;
FileName:=pFileName;
ChangedTime:=pCreatedTime;
idTObj:=pidTObj;
idObj:=pidObj;
end;
Items:=ptrNewItem;
finally
Lock.Leave;
end;
end;

procedure TComponentsTracking.Check;
var
  ptrptrItem: pointer;
  ptrDestroyItem: pointer;
  Time: TDateTime;
begin
Lock.Enter;
try
ptrptrItem:=@Items;
while Pointer(ptrptrItem^) <> nil do with TComponentsTrackingItem(Pointer(ptrptrItem^)^) do begin
  if FileExists(FileName)
   then begin
    Time:=FileDateToDateTime(FileAge(FileName));
    if Time > ChangedTime
     then begin //. updating item
      with TComponentFunctionality_Create(idTObj,idObj) do
      try
      LoadFromFile(FileName);
      finally
      Release;
      end;
      ChangedTime:=Time;
      end;
    ptrptrItem:=@ptrNext;
    end
   else begin
    ptrDestroyItem:=Pointer(ptrptrItem^);
    Pointer(ptrptrItem^):=TComponentsTrackingItem(ptrDestroyItem^).ptrNext;
    FreeMem(ptrDestroyItem,SizeOf(TComponentsTrackingItem));
    end;
  end;
finally
Lock.Leave;
end;
end;

procedure TComponentsTracking.Execute;
const
  Interval = 100;
  IntervalCount = 10*2;
var
  I: integer;
begin
repeat
  if (I MOD IntervalCount) = 0 then Check; //. checking
  Sleep(Interval);
  Inc(I);
until Terminated;
end;


{TTypesSystem}
Constructor TTypesSystem.Create;
begin
Inherited Create;
IDsCach:=TIDsCach.Create;
ClipBoard_flExist:=false;
Clipboard_Instance_idPanelProps:=0;
Configuration:=TTypesSystemConfiguration.Create(Self);
StrobingVisualizations:=TStrobingVisualizations.Create(Self);
PresentUpdaters:=TThreadList.Create;
{$IFNDEF SOAPServer}
ComponentsTracking:=TComponentsTracking.Create(Self);
{$ENDIF}
end;

Destructor TTypesSystem.Destroy;
begin
ComponentsTracking.Free;
PresentUpdaters.Free;
FreeSystems;
StrobingVisualizations.Free;
Configuration.Free;
IDsCach.Free;
Inherited;
end;

procedure TTypesSystem.Initialize;
var
  I: integer;
begin
//. loading and validating configuration
Configuration.Open;
Configuration.Validate;
//. initializing
for I:=0 to Count-1 do with TTypeSystem(List[I]) do if (Enabled) then
  try
  Initialize();
  except
    On E: Exception do EventLog.WriteMajorEvent('TypeSystemInitialization','Error while initializing TypeSystem: '+TableName+'.',E.Message);
    end;
StrobingVisualizations.Update;
//. initialize Context
Context:=TComponentContext.Create(Self);
end;

procedure TTypesSystem.Finalize;
begin
StrobingVisualizations.Enabled:=false;
FreeSystems;
end;

procedure TTypesSystem.DoOnComponentOperationLocal(const idTObj,idObj: integer; const Operation: TComponentOperation);
var
  ComponentFunctionality: TComponentFunctionality;
  Obj: TSpaceObj;
  TS: TTypeSystem;
  I: integer;
  _PresentUpdaters: TList;
  ExceptionMessage: string;
begin
case Operation of
opDestroy: begin
  if ClipBoard_flExist   AND (Clipboard_Instance_idTObj = idTObj) AND (Clipboard_Instance_idObj = idObj)
   then ClipBoard_flExist:=false;
  end;
end;
//. сначала обновляем свою (idTObj) систему типов
TS:=IDsCach[idTObj];
if (TS <> nil)
 then
  TS.DoOnComponentOperationLocal(idTObj,idObj, Operation)
 else
  for I:=0 to Count-1 do
    if TTypeSystem(List[I]).idType = idTObj
     then begin
      TTypeSystem(List[I]).DoOnComponentOperationLocal(idTObj,idObj, Operation);
      Break;
      end;
//. далее ... остальные системы типов
for I:=0 to Count-1 do
  if TTypeSystem(List[I]).idType <> idTObj then TTypeSystem(List[I]).DoOnComponentOperationLocal(idTObj,idObj, Operation);
//.
StrobingVisualizations.DoOnComponentOperationLocal(idTObj,idObj, Operation);
//. Обновляем представления системы типов
_PresentUpdaters:=TList.Create; //. временно создаем для того, чтобы предупредить ошибку индекса, когда один или несколько обновителей выйдет из списка
try
with PresentUpdaters.LockList do
try
_PresentUpdaters.Capacity:=Count;
for I:=0 to Count-1 do _PresentUpdaters.Add(List[I]);
finally
PresentUpdaters.UnLockList;
end;
for I:=0 to _PresentUpdaters.Count-1 do
  if (TTypesSystemPresentUpdater(_PresentUpdaters[I]).Enabled)
   then
    try
    TTypesSystemPresentUpdater(_PresentUpdaters[I]).Update(idTObj,idObj, Operation);
    except
      on E: Exception do begin
        ExceptionMessage:='TypesSystem.DoOnComponentOperationLocal(idTObj = '+IntToStr(idTObj)+',idObj = '+IntToStr(idObj)+', Operation = '+IntToStr(Integer(Operation))+')';
        EventLog.WriteMajorEvent('TypesSystemRepresentationUpdating',ExceptionMessage,E.Message);
        end;
      end;
finally
_PresentUpdaters.Destroy;
end;
//. обновляем пользовательские плугины
Space.Plugins_DoOnComponentOperation(idTObj,idObj, Operation);
end;

procedure TTypesSystem.DoOnComponentPartialUpdateLocal(const idTObj,idObj: integer; const Data: TByteArray);
var
  TS: TTypeSystem;
  I: integer;
  _PresentUpdaters: TList;
  ExceptionMessage: string;
begin
//. сначала обновляем свою (idTObj) систему типов
TS:=IDsCach[idTObj];
if (TS <> nil)
 then
  TS.DoOnComponentPartialUpdateLocal(idTObj,idObj,Data)
 else
  for I:=0 to Count-1 do
    if TTypeSystem(List[I]).idType = idTObj
     then begin
      TTypeSystem(List[I]).DoOnComponentPartialUpdateLocal(idTObj,idObj,Data);
      Break;
      end;
//. далее ... остальные системы типов
for I:=0 to Count-1 do
  if TTypeSystem(List[I]).idType <> idTObj then TTypeSystem(List[I]).DoOnComponentPartialUpdateLocal(idTObj,idObj,Data);
//. Обновляем представления системы типов
_PresentUpdaters:=TList.Create; //. временно создаем для того, чтобы предупредить ошибку индекса, когда один или несколько обновителей выйдет из списка
try
with PresentUpdaters.LockList do
try
_PresentUpdaters.Capacity:=Count;
for I:=0 to Count-1 do _PresentUpdaters.Add(List[I]);
finally
PresentUpdaters.UnLockList;
end;
for I:=0 to _PresentUpdaters.Count-1 do
  if (TTypesSystemPresentUpdater(_PresentUpdaters[I]).Enabled)
   then
    try
    TTypesSystemPresentUpdater(_PresentUpdaters[I]).PartialUpdate(idTObj,idObj,Data);
    except
      on E: Exception do begin
        ExceptionMessage:='TypesSystem.DoOnComponentPartialUpdateLocal(idTObj = '+IntToStr(idTObj)+',idObj = '+IntToStr(idObj)+')';
        EventLog.WriteMajorEvent('TypesSystemRepresentationUpdating',ExceptionMessage,E.Message);
        end;
      end;
finally
_PresentUpdaters.Destroy;
end;
//. обновляем пользовательские плугины
///+++ to-do Space.Plugins_DoOnComponentOperation(idTObj,idObj, Operation);
end;

procedure TTypesSystem.DoOnReflectorRemoval(const pReflector: TAbstractReflector);
var
  I: integer;
begin
for I:=0 to Count-1 do if (TTypeSystem(List[I]).Enabled)
 then
  try
  TTypeSystem(List[I]).DoOnReflectorRemoval(pReflector);
  except
    On E: Exception do begin
      EventLog.WriteMajorEvent('DoOnReflectorRemoval','An exception has been raised for TypeSystem: '+TTypeSystem(List[I]).TableName,E.Message);
      Raise; //. =>
      end;
    end;
if (Self.Reflector = pReflector)
 then Self.Reflector:=nil;
end;

procedure TTypesSystem.DoOnComponentOperation(const idTObj,idObj: integer; const Operation: TComponentOperation);
begin
//. обновляем локальную систему типов (локальные подсистемы типов обновляются начиная с idTObj_подсистемы_типа)
DoOnComponentOperationLocal(idTObj,idObj, Operation);
end;

procedure TTypesSystem.DoOnComponentPartialUpdate(const idTObj,idObj: integer; const Data: TByteArray);
begin
//. обновляем локальную систему типов (локальные подсистемы типов обновляются начиная с idTObj_подсистемы_типа)
DoOnComponentPartialUpdateLocal(idTObj,idObj,Data);
end;

procedure TypesSystem_DoOnComponentOperationLocal(const idTObj,idObj: integer; const Operation: TComponentOperation); stdcall;
begin
TypesSystem.DoOnComponentOperationLocal(idTObj,idObj, Operation);
end;

procedure TypesSystem_DoOnComponentPartialUpdateLocal(const idTObj,idObj: integer; const Data: TByteArray); stdcall;
begin
TypesSystem.DoOnComponentPartialUpdateLocal(idTObj,idObj,Data);
end;


procedure TTypesSystem.FreeSystems;
begin
while (Count > 0) do TObject(List[0]).Free();
end;

function TTypesSystem.TPresentUpdater_Create(pUpdateProc: TUpdateProcOfTypesSystemPresentUpdater): TTypesSystemPresentUpdater;
begin
Result:=TTypesSystemPresentUpdater.Create(Self, pUpdateProc);
end;

function TTypesSystem.TContextTypesHolder_Create(): TTypesSystemPresentUpdater;
begin
Result:=TPresentUpdater_Create(nil);
end;

function TTypesSystem.QueryTypes(TypeFunctionalityClass: TFunctionalityClass; out vList: TList): boolean;
var
  I: integer;
  _Class: TClass;
begin
Result:=false;
vList:=nil;
for I:=0 to Count-1 do begin
  _Class:=TTypeSystem(List[I]).TypeFunctionalityClass;
  repeat
    if (_Class = TypeFunctionalityClass)
     then begin
      if vList = nil then vList:=TList.Create;
      vList.Add(Pointer(TTypeSystem(List[I]).idType));
      Result:=true;
      Break;
      end;
    _Class:=_Class.ClassParent;
  until _Class = nil;
  end;
end;

procedure TTypesSystem.Caching_Start;
var
  I: integer;
begin
for I:=0 to Count-1 do TTypeSystem(List[I]).Caching_Start;
end;

procedure TTypesSystem.Caching_AddObject(const idTObj,idObj: integer);
var
  TS: TTypeSystem;
  I: integer;
begin
if (idObj = 0) then Exit; //. ->
if (Context_IsItemExist(idTObj,idObj, TS)) then Exit; //. ->
if (TS = nil) then Exit; //. ->
//. add object
TS.Caching_AddObject(idObj);
end;

procedure TTypesSystem.Caching_Finish;
var
  I: integer;
begin
for I:=0 to Count-1 do if (TTypeSystem(List[I]).Enabled) then
  try
  TTypeSystem(List[I]).Caching_Finish();
  except
    On E: Exception do EventLog.WriteMajorEvent('TypeSystemCachingFinish','Unable to cache item(s) of '+TTypeSystem(List[I]).TableName,E.Message);
    end;
end;

procedure TTypesSystem.Context_RemoveItem(const idTComponent,idComponent: integer);
var
  TS: TTypeSystem;
  I: integer;
begin
TS:=TypesSystem.IDsCach[idTComponent];
if (TS <> nil)
 then begin
  if (TS.Enabled) then TS.Context_RemoveItem(idComponent);
  end
 else begin
  for I:=0 to Count-1 do with TTypeSystem(List[I]) do
    if (Enabled AND (idType = idTComponent))
     then begin
      TS:=TTypeSystem(List[I]);
      TS.Context_RemoveItem(idComponent);
      Break; //. >
      end;
  end;
end;

function TTypesSystem.Context_IsItemExist(const idTComponent,idComponent: integer): boolean;
var
  TS: TTypeSystem;
begin
Result:=Context_IsItemExist(idTComponent,idComponent, TS);
end;

function TTypesSystem.Context_IsItemExist(const idTComponent,idComponent: integer; out TS: TTypeSystem): boolean;
var
  I: integer;
begin
Result:=false;
TS:=TypesSystem.IDsCach[idTComponent];
if TS <> nil
 then begin
  if (TS.Enabled)
   then Result:=TS.Context_IsItemExist(idComponent)
   else TS:=nil;
  end
 else begin
  for I:=0 to Count-1 do with TTypeSystem(List[I]) do if (Enabled AND (idType = idTComponent)) then begin TS:=TTypeSystem(List[I]); Result:=TS.Context_IsItemExist(idComponent); Break; end;
  end;
end;

procedure TTypesSystem.Context_GetItems(out Components: TComponentsList);
var
  L: TList;
  I,J: integer;
  flTTypeSystemPresentUpdaterFound: boolean;
  CachedComponentsIDs: TIDArray;
begin
Components:=TComponentsList.Create;
try
L:=PresentUpdaters.LockList;
try
if (L.Count > 0)
 then begin
  Components.AddComponent(0,0,0);
  Exit; //. ->
  end;
finally
PresentUpdaters.UnlockList;
end;
for I:=0 to Count-1 do with TTypeSystem(List[I]) do begin
  Lock.Enter;
  try
  if (Enabled)
   then begin
    L:=PresentUpdaters.LockList;
    try
    flTTypeSystemPresentUpdaterFound:=false;
    for J:=0 to L.Count-1 do
      if (TObject(L[J]) is TTypeSystemPresentUpdater)
       then begin
        Components.AddComponent(idType,0,0);
        flTTypeSystemPresentUpdaterFound:=true;
        Break; //. >
        end;
    if (NOT flTTypeSystemPresentUpdaterFound)
     then
      for J:=0 to L.Count-1 do
        if (TObject(L[J]) is TComponentPresentUpdater)
         then with TComponentPresentUpdater(L[J]) do Components.AddComponent(idType,idObj,0);
    finally
    PresentUpdaters.UnLockList;
    end;
    //.
    if (NOT TypeFunctionalityClass.InheritsFrom(TTBaseVisualizationFunctionality))
     then begin //. add cached components except visualization components because these components are processed using Ptr of object
      Context_GetItems(CachedComponentsIDs);
      for J:=0 to Length(CachedComponentsIDs)-1 do Components.AddComponent(idType,CachedComponentsIDs[J],0);
      end;
    end;
  finally
  Lock.Leave;
  end;
  end;
except
  FreeAndNil(Components);
  Raise; //. =>
  end;
end;

procedure TTypesSystem.Context_ClearItems();
var
  I: integer;
begin
for I:=0 to Count-1 do with TTypeSystem(List[I]) do if (Enabled) then Context_ClearItems();
end;

procedure TTypesSystem.Context_ClearInactiveItems();
var
  I: integer;
begin
for I:=0 to Count-1 do if (TTypeSystem(List[I]).Enabled) then TTypeSystem(List[I]).Context_ClearInactiveItems();
end;

procedure TTypesSystem.Context_SaveDATA(Document: IXMLDOMDocument; ParentNode: IXMLDOMElement);
var
  ContextNode: IXMLDOMElement;
  I: integer;
begin
if (Context <> nil)
 then begin
  ContextNode:=Document.createElement('Context');
  Context.SaveContextDATA(Document,ContextNode);
  ParentNode.appendChild(ContextNode);
  end;
//.
for I:=0 to Count-1 do if (TTypeSystem(List[I]).Enabled) then TTypeSystem(List[I]).Context_SaveDATA(Document,ParentNode);
end;

procedure TTypesSystem.Context_LoadDATA(Node: IXMLDOMNode);
var
  ContextNode: IXMLDOMNode;
  I: integer;
begin
ContextNode:=Node.selectSingleNode('Context');
//. load type-system data first
if (Context <> nil)
 then begin
  if (ContextNode = nil) then Raise Exception.Create('no component context found'); //. =>
  Context.LoadContextDATA(ContextNode);
  end;
//.
for I:=0 to Count-1 do if (TTypeSystem(List[I]).Enabled) then
  try
  TTypeSystem(List[I]).Context_LoadDATA(Node);
  except
    On E: Exception do begin
      EventLog.WriteMajorEvent('Context_LoadDATA','Error during restoring items of '+TTypeSystem(List[I]).TableName+' from saved context',E.Message);
      Raise; //. =>
      end;
    end;
end;

procedure TTypesSystem.DoOnContextIsInitialized();
var
  I: integer;
begin
for I:=0 to Count-1 do if (TTypeSystem(List[I]).Enabled)
 then
  try
  TTypeSystem(List[I]).DoOnContextIsInitialized();
  except
    On E: Exception do begin
      EventLog.WriteMajorEvent('DoOnContextIsInitialized','An exception has been raised for TypeSystem: '+TTypeSystem(List[I]).TableName,E.Message);
      Raise; //. =>
      end;
    end;
end;

procedure TTypesSystem.DoExportComponents(const pUserName,pUserPassword: WideString; ComponentsList: TComponentsList; const ExportFileName: string);
var
  CL,BA: TByteArray;
  MS: TMemoryStream;
  I: integer;
begin
SetLength(CL,ComponentsList.Count*SizeOf(TItemComponentsList));
for I:=0 to ComponentsList.Count-1 do TItemComponentsList(Pointer(Integer(@CL[0])+I*SizeOf(TItemComponentsList))^):=TItemComponentsList(ComponentsList[I]^);
{$IFNDEF EmbeddedServer}
GetISpaceTypesSystemManager(Space.SOAPServerURL).ExportComponents(pUserName,pUserPassword, CL,{out} BA);
{$ELSE}
SpaceTypesSystemManager_ExportComponents(pUserName,pUserPassword, CL,{out} BA);
{$ENDIF}
ByteArray_CreateStream(BA, MS);
try
MS.SaveToFile(ExportFileName);
finally
MS.Destroy;
end;
end;

procedure TTypesSystem.DoImportComponents(const pUserName,pUserPassword: WideString; const ImportFileName: string; out ComponentsList: TComponentsList);
var
  MS: TMemoryStream;
  BA,CL: TByteArray;
  I: integer;
begin
MS:=TMemoryStream.Create();
try
MS.LoadFromFile(ImportFileName);
ByteArray_PrepareFromStream(BA,TStream(MS));
finally
MS.Destroy();
end;
{$IFNDEF EmbeddedServer}
GetISpaceTypesSystemManager(Space.SOAPServerURL).ImportComponents(pUserName,pUserPassword, BA,{out} CL);
{$ELSE}
SpaceTypesSystemManager_ImportComponents(pUserName,pUserPassword, BA,{out} CL);
{$ENDIF}
ComponentsList:=TComponentsList.Create();
try
for I:=0 to (Length(CL) DIV SizeOf(TItemComponentsList))-1 do with TItemComponentsList(Pointer(Integer(@CL[0])+I*SizeOf(TItemComponentsList))^) do ComponentsList.AddComponent(idTComponent,idComponent,0);
except
  FreeAndNil(ComponentsList);
  Raise; //. =>
  end;
//. update local TypesSystem and representations
Space.StayUpToDate();
end;


{TComponentTypeContext}
Constructor TComponentTypeContext.Create(const pComponentContext: TComponentContext; const pTypeSystem: TTypeSystem);
begin
Inherited Create();
_Lock:=TCriticalSection.Create;
//.
ComponentContext:=pComponentContext;
DataFlags:=COMPONENT_DATA_FLAG_ACTUALITYINTERVAL;
Items:=TIDsCach.Create();
ItemsCount:=0;
ItemsHolders:=nil;
TypeSystem:=pTypeSystem;
TypeSystem.TypeContext:=Self;
end;

Destructor TComponentTypeContext.Destroy;
begin
TypeSystem.TypeContext:=nil;
_Lock.Free();
Inherited;
end;

procedure TComponentTypeContext.Lock();
begin
_Lock.Enter();
end;

procedure TComponentTypeContext.Unlock();
begin
_Lock.Leave();
end;

procedure TComponentTypeContext.Empty();
var
  ptrDelItem: pointer;
begin
_Lock.Enter();
try
while (ItemsHolders <> nil) do begin
  ptrDelItem:=ItemsHolders;
  ItemsHolders:=TComponentContextItemHolder(ptrDelItem^).ptrNext;
  Items[TComponentContextItemHolder(ptrDelItem^).ID]:=nil;
  //.
  TComponentContextItemHolder(ptrDelItem^).Item.Free();
  FreeMem(ptrDelItem,SizeOf(TComponentContextItemHolder));
  end;
ItemsCount:=0;
finally
_Lock.Leave();
end;
end;

function TComponentTypeContext.getItem(ID: integer): TComponentContextItem;
var
  ptrptrItem: pointer;
begin
Result:=nil;
_Lock.Enter();
try
ptrptrItem:=Items[ID];
if (ptrptrItem = nil) then Exit; //. ->
Result:=TComponentContextItemHolder(Pointer(ptrptrItem^)^).Item;
finally
_Lock.Leave();
end;
end;

procedure TComponentTypeContext.setItem(ID: integer; Value: TComponentContextItem);
var
  ptrptrItem,ptrItem: pointer;
  RemoveItem: TObject;
  ptrRemoveItemHolder: pointer;
begin
RemoveItem:=nil;
ptrRemoveItemHolder:=nil;
//.
_Lock.Enter();
try
ptrptrItem:=Items[ID];
if (ptrptrItem = nil)
 then begin
  if (Value = nil) then Exit; //. ->
  //.
  GetMem(ptrItem,SizeOf(TComponentContextItemHolder));
  FillChar(ptrItem^,SizeOf(TComponentContextItemHolder), 0);
  TComponentContextItemHolder(ptrItem^).ID:=ID;
  TComponentContextItemHolder(ptrItem^).Item:=Value;
  //.
  TComponentContextItemHolder(ptrItem^).ptrNext:=ItemsHolders;
  if (ItemsHolders <> nil) then Items[TComponentContextItemHolder(ItemsHolders^).ID]:=ptrItem;
  ItemsHolders:=ptrItem;
  //.
  Items[ID]:=@ItemsHolders;
  //.
  Inc(ItemsCount);
  end
 else begin
  ptrItem:=Pointer(ptrptrItem^);
  //.
  RemoveItem:=TComponentContextItemHolder(ptrItem^).Item;
  //.
  if (Value <> nil)
   then TComponentContextItemHolder(ptrItem^).Item:=Value
   else begin
    Items[ID]:=nil;
    //.
    Pointer(ptrptrItem^):=TComponentContextItemHolder(ptrItem^).ptrNext;
    if (TComponentContextItemHolder(ptrItem^).ptrNext <> nil) then Items[TComponentContextItemHolder(TComponentContextItemHolder(ptrItem^).ptrNext^).ID]:=ptrptrItem;
    ptrRemoveItemHolder:=ptrItem;
    //.
    Dec(ItemsCount);
    end;
  end;
finally
_Lock.Leave();
end;
//.
if (RemoveItem <> nil) then RemoveItem.Destroy();
if (ptrRemoveItemHolder <> nil) then FreeMem(ptrItem,SizeOf(TComponentContextItemHolder));
end;

Type
  TMyMemoryStream = class(TMemoryStream)
  public
    property Capacity;
  end;

procedure TComponentTypeContext.SaveContextDATA(Document: IXMLDOMDocument; ParentNode: IXMLDOMElement);
const
  InitialStreamCapacity = 30*1024*1024;
var
  TypeNode,ItemTypeNode,ItemsNode: IXMLDOMElement;
  CCI: TComponentContextItem;
  MS: TMyMemoryStream;
  ptrItem: pointer;
  I: integer;
  _ID: Int64;
  OLEData: OLEVariant;
  DATAPtr: pointer;
begin
TypeNode:=Document.CreateElement('T'+IntToStr(TypeSystem.idType));
//.
ItemTypeNode:=Document.CreateElement('ItemType');
CCI:=TypeSystem.Context_CreateItem();
try
ItemTypeNode.nodeTypedValue:=CCI.ClassName;
finally
CCI.Destroy();
end;
TypeNode.appendChild(ItemTypeNode);
//.
MS:=TMyMemoryStream.Create();
try
MS.Capacity:=InitialStreamCapacity;
MS.Write(ItemsCount,SizeOf(ItemsCount));
//. save items
_Lock.Enter();
try
ptrItem:=ItemsHolders;
while (ptrItem <> nil) do with TComponentContextItemHolder(ptrItem^) do begin
  _ID:=ID;
  MS.Write(_ID,SizeOf(_ID));
  //. save item
  Item.SaveToStream(MS);
  //.
  ptrItem:=ptrNext;
  end;
finally
_Lock.Leave();
end;
//.
OLEData:=VarArrayCreate([0,MS.Size-1],varByte);
DATAPtr:=VarArrayLock(OLEData);
try
Move(MS.Memory^,DATAPtr^,MS.Size);
finally
VarArrayUnLock(OLEData);
end;
finally
MS.Destroy();
end;
ItemsNode:=Document.CreateElement('Items');
ItemsNode.Set_dataType('bin.base64');
ItemsNode.nodeTypedValue:=OLEData;
//.
TypeNode.appendChild(ItemsNode);
//.
ParentNode.appendChild(TypeNode);
end;

procedure TComponentTypeContext.LoadContextDATA(Node: IXMLDOMNode);
var
  TypeNode,ItemTypeNode,ItemsNode: IXMLDOMNode;
  ItemType: string;
  CCI: TComponentContextItem;
  I: integer;
  ID: integer;
  Item: TComponentContextItem;
  DATA: Variant;
  DATASize: integer;
  DATAPtr: pointer;
  MS: TMemoryStream;
  _ItemsCount: integer;
  _ID: Int64;
begin
_Lock.Enter();
try
Empty();
//.
TypeNode:=Node.selectSingleNode('T'+IntToStr(TypeSystem.idType));
if (TypeNode = nil) then Exit; //. ->
//.
ItemTypeNode:=TypeNode.selectSingleNode('ItemType');
ItemType:=ItemTypeNode.nodeTypedValue;
CCI:=TypeSystem.Context_CreateItem();
try
if (ItemType <> CCI.ClassName) then Raise Exception.Create('cannot load context data of type: '+TypeSystem.TableName+', unknown item type'); //. =>
finally
CCI.Destroy();
end;
//.
ItemsNode:=TypeNode.selectSingleNode('Items');
if (ItemsNode = nil) then Exit; //. ->
DATA:=ItemsNode.nodeTypedValue;
//. load items
if (DATA <> null)
 then begin
  DATASize:=VarArrayHighBound(DATA,1)+1;
  DATAPtr:=VarArrayLock(DATA);
  try
  MS:=TMemoryStream.Create();
  with MS do
  try
  Size:=DATASize;
  Write(DATAPtr^,DATASize);
  Position:=0;
  //.
  Read(_ItemsCount,SizeOf(_ItemsCount));
  for I:=0 to _ItemsCount-1 do begin
    Read(_ID,SizeOf(_ID));
    //.
    Item:=TypeSystem.Context_CreateItem();
    if (Item <> nil)
     then begin
      Item.LoadFromStream(MS);
      setItem(_ID, Item);
      end;
    end;
  finally
  Destroy();
  end;
  finally
  VarArrayUnLock(DATA);
  end;
  end;
finally
_Lock.Leave();
end;
end;

procedure TComponentTypeContext.GetComponentIDs(out IDs: TIDArray);
var
  Idx: integer;
  ptrItem: pointer;
begin
_Lock.Enter();
try
SetLength(IDs,ItemsCount);
Idx:=0;
ptrItem:=ItemsHolders;
while (ptrItem <> nil) do with TComponentContextItemHolder(ptrItem^) do begin
  IDs[Idx]:=ID; Inc(Idx);
  //.
  ptrItem:=ptrNext;
  end;
finally
_Lock.Leave();
end;
end;


{TComponentContext}
Constructor TComponentContext.Create(const pTypesSystem: TTypesSystem);
var
  I: integer;
  ComponentTypeContext: TComponentTypeContext;
begin
Inherited Create;
TypesSystem:=pTypesSystem;
//.
Items:=TIDsCach.Create();
//.
for I:=0 to TypesSystem.Count-1 do begin
  ComponentTypeContext:=TTypeSystem(TypesSystem[I]).CreateContext(Self); 
  Items[TTypeSystem(TypesSystem[I]).idType]:=ComponentTypeContext;
  end;
end;

Destructor TComponentContext.Destroy;
begin
Inherited;
end;

function TComponentContext.getItem(TypeID,ID: integer): TComponentContextItem;
var
  ComponentTypeContext: TComponentTypeContext;
begin
Result:=nil;
ComponentTypeContext:=Items[TypeID];
if (ComponentTypeContext = nil) then Raise Exception.Create('cannot get component context item, type is null, TypeID: '+IntToStr(TypeID));
Result:=ComponentTypeContext[ID];
end;

procedure TComponentContext.setItem(TypeID,ID: integer; Value: TComponentContextItem);
var
  ComponentTypeContext: TComponentTypeContext;
begin
ComponentTypeContext:=Items[TypeID];
if (ComponentTypeContext = nil) then Raise Exception.Create('cannot set component context item, type is null, TypeID: '+IntToStr(TypeID));
ComponentTypeContext[ID]:=Value;
end;

function TComponentContext.getTypeContext(TypeID: integer): TComponentTypeContext;
begin
Result:=Items[TypeID];
end;

procedure TComponentContext.Clear();
var
  I: integer;
  ComponentTypeContext: TComponentTypeContext;
begin
for I:=0 to TypesSystem.Count-1 do begin
  ComponentTypeContext:=Items[TTypeSystem(TypesSystem[I]).idType];
  if (ComponentTypeContext = nil) then Raise Exception.Create('cannot empty component type context, type is null, TypeID: '+IntToStr(TTypeSystem(TypesSystem[I]).idType));
  //.
  ComponentTypeContext.Empty();
  end;
end;

procedure TComponentContext.SaveContextDATA(Document: IXMLDOMDocument; ParentNode: IXMLDOMElement);
var
  VersionNode: IXMLDOMElement;
  I: integer;
  ComponentTypeContext: TComponentTypeContext;
begin
VersionNode:=Document.CreateElement('Version');
VersionNode.nodeTypedValue:=1; //. Version #1
ParentNode.appendChild(VersionNode);
//.
for I:=0 to TypesSystem.Count-1 do begin
  ComponentTypeContext:=Items[TTypeSystem(TypesSystem[I]).idType];
  if (ComponentTypeContext = nil) then Raise Exception.Create('cannot save component type context, type is null, TypeID: '+IntToStr(TTypeSystem(TypesSystem[I]).idType));
  //.
  ComponentTypeContext.SaveContextDATA(Document,ParentNode);
  end;
end;

procedure TComponentContext.LoadContextDATA(Node: IXMLDOMNode);
var
  VersionNode: IXMLDOMNode;
  Version: integer;
  I: integer;
  ComponentTypeContext: TComponentTypeContext;
begin
VersionNode:=Node.selectSingleNode('Version');
if (VersionNode <> nil)
 then Version:=VersionNode.nodeTypedValue
 else Version:=0;
if (Version <> 1) then Raise Exception.Create('unknown component context data, Version: '+IntToStr(Version));
//.
for I:=0 to TypesSystem.Count-1 do
  try
  ComponentTypeContext:=Items[TTypeSystem(TypesSystem[I]).idType];
  if (ComponentTypeContext = nil) then Raise Exception.Create('cannot load component type context, type is null, TypeID: '+IntToStr(TTypeSystem(TypesSystem[I]).idType));
  //.
  ComponentTypeContext.LoadContextDATA(Node);
  except
    On E: Exception do begin
      EventLog.WriteMajorEvent('TComponentContext.LoadContextDATA','Error during restoring items of '+TTypeSystem(TypesSystem[I]).TableName+' from saved context',E.Message);
      Raise; //. =>
      end;
    end;
end;


{TTypeFunctionality}
Constructor TTypeFunctionality.Create;
begin
Inherited Create;
FImage:=nil;
_UserName:='';
_UserPassword:='';
RemotedFunctionality:=TTypeFunctionalityRemoted.Create(Self);
end;

Destructor TTypeFunctionality.Destroy;
begin
RemotedFunctionality.Free;
FImage.Free;
Inherited;
end;

procedure TComponentFunctionality.UpdateDATA;
var
  CPP: TMemoryStream;
begin
Inherited;
_ComponentsCount:=ComponentsCount;
if NOT GetPanelPropsLeftTop(_DefaultPanelPropsLeft,_DefaultPanelPropsTop)
 then begin
  _DefaultPanelPropsLeft:=MaxInt;
  _DefaultPanelPropsTop:=MaxInt;
  end;
if NOT GetPanelPropsWidthHeight(_DefaultPanelPropsWidth,_DefaultPanelPropsHeight)
 then begin
  _DefaultPanelPropsWidth:=MaxInt;
  _DefaultPanelPropsHeight:=MaxInt;
  end;
if IsCustomPanelPropsExist
 then begin
  CPP:=CustomPanelProps;
  with CPP do
  try
  _DefaultPanelProps_CustomPanelProps:=TMemoryStream.Create;
  CPP.Position:=0;
  _DefaultPanelProps_CustomPanelProps.CopyFrom(CPP,CPP.Size);
  _DefaultPanelProps_CustomPanelProps.Position:=0;
  finally
  Destroy;
  end;
  _DefaultPanelProps_IsCustomPanelPropsExist:=true;
  end
 else
  _DefaultPanelProps_IsCustomPanelPropsExist:=false;
end;

procedure TComponentFunctionality.ClearDATA;
begin
FreeAndNil(_DefaultPanelProps_CustomPanelProps);
Inherited;
end;

function TTypeFunctionality.UserName: WideString;
begin
if (_UserName <> '')
 then Result:=_UserName
 else Result:=Space.UserName;
end;

function TTypeFunctionality.UserPassword: WideString;
begin
if (_UserName <> '')
 then Result:=_UserPassword
 else Result:=Space.UserPassword;
end;

function TTypeFunctionality.getSpace: TProxySpace;
begin
Result:=TypeSystem.Space;
end;

function TTypeFunctionality.getTableName: string;
begin
Result:=TypeSystem.TableName;
end;

function TTypeFunctionality.getidType: integer;
begin
Result:=TypeSystem.idType;
end;

function TTypeFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=TTypeImage.Create;
  try
  FImage.LoadFromFile('TypesDef\AbstractType\AbstractType.bmp');
  except
    end;
  end;
Result:=FImage;
end;

procedure TTypeFunctionality.DoOnComponentOperation(const idTObj,idObj: integer; const Operation: TComponentOperation);
begin
TypeSystem.TypesSystem.DoOnComponentOperation(idTObj,idObj, Operation);
end;

function TTypeFunctionality.getImageList_Index: integer; stdcall;
var
  I: integer;
begin
Result:=-1;
for I:=0 to TypeSystem.TypesSystem.Count-1 do
  if TTypeSystem(TypeSystem.TypesSystem[I]).idType = idType
   then begin
    Result:=I;
    Exit;
    end;
end;

function TTypeFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

function TTypeFunctionality.CreateInstance: integer;
begin
Result:=RemotedFunctionality.CreateInstance;
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TTypeFunctionality.CreateInstanceUsingObject(const idTUseObj,idUseObj: integer): integer;
begin
Result:=CreateInstance;
with TComponentFunctionality_Create(Result) do begin
try
if NOT SetComponentsUsingObject(idTUseObj,idUseObj)
 then begin
  DestroyInstance(Result);
  with Functionality.TComponentFunctionality_Create(idTUseObj,idUseObj) do begin
  try
  Raise Exception.Create('can not create the object using: '+Name);
  finally
  Release;
  end;
  end;
  end;
finally
Release
end;
end;
end;


procedure TTypeFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. = >
end;

procedure TTypeFunctionality.DestroyInstance(const idObj: integer);
begin
RemotedFunctionality.DestroyInstance(idObj);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TTypeFunctionality.GetInstanceList(out List: TList);
var
  BA: TByteArray;
begin
GetInstanceList(BA);
ByteArray_CreateList(BA, List);
end;

procedure TTypeFunctionality.GetInstanceList(out List: TByteArray);
begin
RemotedFunctionality.GetInstanceList(List);
end;

procedure TTypeFunctionality.GetInstanceNames(const IDs: array of Int64; const IDs_Offset: integer; const IDs_Size: integer; var Names: TStringList);
begin
Raise Exception.Create(SNotSupported);
end;

procedure TTypeFunctionality.GetInstanceOwnerNames(const IDs: TByteArray; out Data: TByteArray);
begin
RemotedFunctionality.GetInstanceOwnerNames(IDs,{out} Data);
end;

procedure TTypeFunctionality.GetComponentDatas(const IDs: array of Int64; const IDs_Offset: integer; const IDs_Size: integer; const DataFlags: TComponentDataFlags; out Datas: TComponentDatas);
begin
Raise Exception.Create(SNotSupported);
end;

procedure TTypeFunctionality.GetComponentOwnerDatas(const IDs: TByteArray; const DataFlags: TComponentDataFlags; out Data: TByteArray);
begin
RemotedFunctionality.GetComponentOwnerDatas(IDs,DataFlags,{out} Data);
end;

function TTypeFunctionality.ImportInstance(ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer;

  (* /// - function CreateInstanceByNode: integer;

    function GetEnvVar(const VarName: string): string;
    var
      I: integer;
    begin
    Result:='';
    try
    I:=GetEnvironmentVariable(PChar(VarName), nil, 0);
    if I > 0
     then begin
      SetLength(Result, I);
      GetEnvironmentVariable(Pchar(VarName), PChar(Result), I);
      SetLength(Result, Length(Result)-1);
      end;
    except
      Result:='';
      end;
    end;

  var
    V: Variant;
    DATASize: integer;
    DATAPtr: pointer;
    TempFileName: string;
  begin
  TempFileName:=GetEnvVar('SystemDrive')+'/UNLOAD.unl';
  try
  V:=ComponentNode.selectSingleNode('DATA/SQL') .nodeTypedValue;
  DATASize:=VarArrayHighBound(V,1);
  DATAPtr:=VarArrayLock(V);
  try
  with TMemoryStream.Create do
  try
  Write(DATAPtr^,DATASize);
  SaveToFile(TempFileName);
  finally
  Destroy;
  end;
  finally
  VarArrayUnLock(V);
  end;
  with Space.TObjPropsQuery_Create do
  try
  EnterSQL('LOCK TABLE '+TableName+' WRITE');
  ExecSQL;
  try
  EnterSQL('LOAD DATA INFILE '''+TempFileName+''' INTO TABLE '+TableName);
  ExecSQL;
  EnterSQL('SELECT Max('+TypeSystem.IDStr+') maxID FROM '+TableName);
  Open;
  Result:=FieldValues['maxID'];
  finally
  EnterSQL('UNLOCK TABLES');
  ExecSQL;
  end;
  finally
  Destroy;
  end;
  finally
  DeleteFile(TempFileName);
  end;
  end;

  function ExtractTypeNumber(const S: string): integer;
  var
    R: string;
    I: integer;
  begin
  R:='';
  for I:=2 to Length(S) do
    if ($30 <= Ord(S[I])) AND (Ord(S[I]) <= $39)
     then R:=R+S[I]
     else Break; //. >
  Result:=StrToInt(R);
  end;

  procedure GetPropsPanelParams(out idPanelProps: integer; out Left,Top,Width,Height: integer);
  var
    PropsPanelNode: IXMLDOMNode;
  begin
  PropsPanelNode:=ComponentNode.selectSingleNode('Representations/PropsPanels/Default');
  if PropsPanelNode <> nil
   then begin
    idPanelProps:=StrToInt(PropsPanelNode.selectSingleNode('ID').nodeTypedValue);
    Left:=StrToInt(PropsPanelNode.selectSingleNode('Left').nodeTypedValue);
    Top:=StrToInt(PropsPanelNode.selectSingleNode('Top').nodeTypedValue);
    Width:=StrToInt(PropsPanelNode.selectSingleNode('Width').nodeTypedValue);
    Height:=StrToInt(PropsPanelNode.selectSingleNode('Height').nodeTypedValue);
    end
   else begin
    idPanelProps:=0;
    Left:=-1;
    Top:=-1;
    Width:=-1;
    Height:=-1;
    end;
  end;*)

var
  idPanelProps: integer;
  Left,Top,Width,Height: integer;
  I: integer;
  ComponentsNode,OwnComponentNode: IXMLDOMNode;
  idTComponent,idComponent: integer;
  CID: integer;
begin
(*/// - Result:=CreateInstanceByNode;
GetPropsPanelParams(idPanelProps, Left,Top,Width,Height);
with TComponentFunctionality_Create(Result) do
try
flUserSecurityDisabled:=true;
//. creating components
ComponentsNode:=ComponentNode.selectSingleNode('Components');
if ComponentsNode <> nil
 then
  for I:=0 to ComponentsNode.childNodes.length-1 do begin
    OwnComponentNode:=ComponentsNode.childNodes[I];
    idTComponent:=ExtractTypeNumber(OwnComponentNode.NodeName);
    with TTypeFunctionality_Create(idTComponent) do
    try
    flUserSecurityDisabled:=true;
    idComponent:=ImportInstance(OwnComponentNode, PropsPanelsList,ComponentsFilesList);
    finally
    Release;
    end;
    //. insert prepeared component
    InsertComponent(idTComponent,idComponent, CID);
    end;
//. creating props-panel
if Left <> -1 then SetPanelPropsLeftTop(Left,Top);
if Width <> -1 then SetPanelPropsWidthHeight(Width,Height);
if idPanelProps <> 0
 then
  for I:=0 to PropsPanelsList.Count-1 do with TReferencedObj(PropsPanelsList[I]^) do
    if ID = idPanelProps
     then begin
      idPanelProps:=NewID;
      //. set props-panel id
      with Space.TObjPropsQuery_Create do
      try
      EnterSQL('UPDATE ObjectsPanelsProps SET idPanelProps = '+IntToStr(idPanelProps)+' WHERE (idTObj = '+IntToStr(idTObj)+' AND idObj = '+IntToStr(idObj)+')');
      ExecSQL;
      finally
      Destroy;
      end;
      //. inc ref counter
      Inc(RefCount);
      Break; //. >
      end;
//. обновляем систему типов
try DoOnComponentOperation(idTObj,idObj, opCreate); except end;
finally
Release;
end;*)
end;

function TTypeFunctionality.CheckImportInstance(ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer;
begin
end;

function TTypeSystem.TPresentUpdater_Create(pUpdateProc: TUpdateProcOfTypeSystemPresentUpdater): TTypeSystemPresentUpdater;
begin
Result:=TTypeSystemPresentUpdater.Create(Self, pUpdateProc);
end;

function TTypeSystem.TContextTypeHolder_Create(): TTypeSystemPresentUpdater;
begin
Result:=TPresentUpdater_Create(nil);
end;


{TBaseVisualizationTypeSystem}
function TBaseVisualizationTypeSystem.Context_CreateItem(): TComponentContextItem;
begin
Result:=TBaseVisualizationContextItem.Create();
end;

procedure TBaseVisualizationTypeSystem.Context_UpdateItem(const ID: integer);
var
  ItemsList: TList;
begin
ItemsList:=TList.Create();
try
ItemsList.Add(Pointer(ID));
Context_UpdateByItemsList(ItemsList);
finally
ItemsList.Destroy();
end;
end;

procedure TBaseVisualizationTypeSystem.Context_UpdateByItemsList(const List: TList);
var
  IC: integer;
  p: pointer;
  I: integer;
  ID: Int64;
  IDs: TByteArray;
  ItemsDatas: TByteArray;
  _idTOwner: Word;
  _idOwner: Int64;
  _OwnerNameLength: byte;
  _OwnerName: shortstring;
  _ActualityInterval: TComponentActualityInterval;
  ContextItem: TComponentContextItem;
begin
try
IC:=List.Count;
SetLength(IDs,SizeOf(IC)+IC*SizeOf(Int64));
p:=@IDs[0];
Integer(p^):=IC; Inc(DWord(p),SizeOf(IC));
for I:=0 to List.Count-1 do begin
  ID:=Integer(List[I]);
  Int64(p^):=ID;
  Inc(DWord(p),SizeOf(Int64));
  end;
with TTBaseVisualizationFunctionality(TTypeFunctionality_Create(idType)) do
try
GetComponentOwnerDatas(IDs,TypeContext.DataFlags,{out} ItemsDatas);
finally
Release();
end;
if (Length(ItemsDatas) > 0)
 then begin
  p:=@ItemsDatas[0];
  IC:=Integer(p^); Inc(DWord(p),SizeOf(IC));
  for I:=0 to IC-1 do begin
    ID:=Int64(p^); Inc(DWord(p),SizeOf(ID));
    _idTOwner:=integer(p^); Inc(DWord(p),SizeOf(_idTOwner));
    _idOwner:=Int64(p^); Inc(DWord(p),SizeOf(_idOwner));
    if ((TypeContext.DataFlags AND COMPONENT_DATA_FLAG_NAME) = COMPONENT_DATA_FLAG_NAME)
     then begin
      _OwnerNameLength:=Byte(p^); Inc(DWord(p),SizeOf(_OwnerNameLength));
      if (_OwnerNameLength > 0)
       then begin
        SetLength(_OwnerName,_OwnerNameLength);
        Move(p^, Pointer(@_OwnerName[1])^, _OwnerNameLength); Inc(DWord(p),_OwnerNameLength);
        end
       else _OwnerName:='';
      end
     else _OwnerName:='';
    if ((TypeContext.DataFlags AND COMPONENT_DATA_FLAG_ACTUALITYINTERVAL) = COMPONENT_DATA_FLAG_ACTUALITYINTERVAL)
     then begin
      _ActualityInterval.BeginTimestamp:=Double(p^); Inc(DWord(p),SizeOf(_ActualityInterval.BeginTimestamp));
      _ActualityInterval.EndTimestamp:=Double(p^); Inc(DWord(p),SizeOf(_ActualityInterval.EndTimestamp));
      end
     else begin
      _ActualityInterval.BeginTimestamp:=NullTimestamp;
      _ActualityInterval.EndTimestamp:=NullTimestamp;
      end;
    //.
    TypeContext.Lock();
    try
    ContextItem:=Context[ID];
    if (ContextItem <> nil)
     then with ContextItem do begin
      Owner.idType:=_idTOwner;
      Owner.id:=_idOwner;
      Name:=_OwnerName;
      ActualityInterval:=_ActualityInterval;
      end
     else begin
      ContextItem:=Context_CreateItem();
      //.
      with ContextItem do begin
      Owner.idType:=_idTOwner;
      Owner.id:=_idOwner;
      Name:=_OwnerName;
      ActualityInterval:=_ActualityInterval;
      end;
      //.
      Context[ID]:=ContextItem;
      end;
    finally
    TypeContext.Unlock();
    end;
    //.
    (*///??? with TTypeFunctionality_Create(_idTOwner) do
    try
    TypesSystem.Context.Lock();
    try
    ContextItem:=TypeSystem.Context[_idOwner];
    if (ContextItem <> nil)
     then ContextItem.Name:=_OwnerName
     else begin
      ContextItem:=TypeSystem.Context_CreateItem();
      //.
      ContextItem.Name:=_OwnerName;
      //.
      TypeSystem.Context[_idOwner]:=ContextItem;
      end;
    finally
    TypesSystem.Context.Unlock();
    end;
    finally
    Release();
    end;*)
    end;
  end;
except
  On E: Exception do EventLog.WriteMinorEvent('TBaseVisualizationTypeSystem.Context_UpdateByItemsList','Item(s) of '+TableName+' could not be cached',E.Message);
  end;
end;

function TBaseVisualizationTypeSystem.InplaceHintEnabled(): boolean;
begin
Result:=false;
end;


{TTypeFunctionality}
function TTypeFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
end;

function TTypeFunctionality.getName: string;
begin
Result:='Type';
end;



{TComponentsFilesRepository}
Constructor TComponentsFilesRepository.Create(pSpace: TProxySpace);
begin
Inherited Create;
Space:=pSpace;
end;

function TComponentsFilesRepository.CreateFile(DATAStream: TMemoryStream; const DATAType: TComponentFileType): integer;
begin
(* /// + with Space.TObjPropsQuery_Create do
try
case SQLServerType of
sqlInformix: EnterSQL('LOCK TABLE ComponentsFiles IN EXCLUSIVE MODE');
sqlMySQL: EnterSQL('LOCK TABLE ComponentsFiles WRITE');
else
  Raise Exception.Create('choosing sql server: unknown server');
end;
ExecSQL;
try
EnterSQL('INSERT INTO ComponentsFiles (RefCount,id) Values(0,0)');
ExecSQL;
EnterSQL('SELECT Max(id) MaxID FROM ComponentsFiles');
Open;
Result:=FieldValues['MaxID'];
finally
case SQLServerType of
sqlInformix: EnterSQL('UNLOCK TABLE ComponentsFiles');
sqlMySQL: EnterSQL('UNLOCK TABLES');
else
  Raise Exception.Create('choosing sql server: unknown server');
end;
ExecSQL;
end;
finally
Destroy;
end;
SetFile(Result, DATAStream,DATAType);*)
end;

procedure TComponentsFilesRepository.DestroyFile(const id: integer);
begin
(*/// + with Space.TObjPropsQuery_Create do
try
EnterSQL('DELETE FROM ComponentsFiles WHERE id = '+IntToStr(id));
ExecSQL;
finally
Destroy;
end;*)
end;

function TComponentsFilesRepository.File_AddRef(const id: integer): integer;
begin
(* /// + with Space.TObjPropsQuery_Create do
try
case SQLServerType of
sqlInformix: EnterSQL('LOCK TABLE ComponentsFiles IN EXCLUSIVE MODE');
sqlMySQL: EnterSQL('LOCK TABLE ComponentsFiles WRITE');
else
  Raise Exception.Create('choosing sql server: unknown server');
end;
ExecSQL;
try
EnterSQL('SELECT RefCount FROM ComponentsFiles WHERE id = '+IntToStr(id));
Open;
if FieldValues['RefCount'] = Null
 then Result:=0
 else Result:=FieldValues['RefCount'];
Close;
INC(Result);
EnterSQL('UPDATE ComponentsFiles SET RefCount  = '+IntToStr(Result)+' WHERE id = '+IntToStr(id));
ExecSQL;
finally
case SQLServerType of
sqlInformix: EnterSQL('UNLOCK TABLE ComponentsFiles');
sqlMySQL: EnterSQL('UNLOCK TABLES');
else
  Raise Exception.Create('choosing sql server: unknown server');
end;
ExecSQL;
end;
finally
Destroy;
end;*)
end;

function TComponentsFilesRepository.File_Release(const id: integer): integer;
begin
(*/// + with Space.TObjPropsQuery_Create do
try
case SQLServerType of
sqlInformix: EnterSQL('LOCK TABLE ComponentsFiles IN EXCLUSIVE MODE');
sqlMySQL: EnterSQL('LOCK TABLE ComponentsFiles WRITE');
else
  Raise Exception.Create('choosing sql server: unknown server');
end;
ExecSQL;
try
EnterSQL('SELECT RefCount FROM ComponentsFiles WHERE id = '+IntToStr(id));
Open;
if RecordCount > 0
 then begin
  Result:=FieldValues['RefCount'];
  Close;
  DEC(Result);
  if Result <= 0
   then DestroyFile(id)
   else begin //. обновляем число ссылок
    EnterSQL('UPDATE ComponentsFiles SET RefCount = '+IntToStr(Result)+' WHERE id = '+IntToStr(id));
    ExecSQL;
    end;
  end
 else
  Result:=0;
finally
case SQLServerType of
sqlInformix: EnterSQL('UNLOCK TABLE ComponentsFiles');
sqlMySQL: EnterSQL('UNLOCK TABLES');
else
  Raise Exception.Create('choosing sql server: unknown server');
end;
ExecSQL;
end;
finally
Destroy;
end;*)
end;

function TComponentsFilesRepository.File_Size(const id: integer): integer;
begin
(* /// + with Space.TObjPropsQuery_Create do 
try
EnterSQL('SELECT Length(DATA) Sz FROM ComponentsFiles WHERE id = '+IntToStr(id));
Open;
Result:=FieldValues['Sz'];
finally
Destroy;
end;*)
end;

procedure TComponentsFilesRepository.GetFile(const id: integer; out DATAStream: TClientBlobStream; out DATAType: TComponentFileType);
var
  DataField: TMemoField;
  DataTypeField: TIntegerField;
begin
(* /// + Query:=Space.TObjPropsQuery_Create;
try
DataField:=TMemoField.Create(Query);
DataTypeField:=TIntegerField.Create(Query);
with Query do begin
FetchOnDemand:=true;
EnterSQL('SELECT * FROM ComponentsFiles WHERE id = '+IntToStr(id));
with DataField do begin
FieldName:='DATA';
DataSet:=Query;
end;
with DataTypeField do begin
FieldName:='DATAType';
DataSet:=Query;
end;
Open;
if RecordCount > 0
 then begin
  if FieldValues['DATA'] <> null
   then DATAStream:=TClientBlobStream.Create(DATAField,bmRead)
   else DATAStream:=nil;
  DATAType:=TComponentFileType(Integer(FieldValues['DATAType']));
  end
 else begin
  DATAStream:=nil;
  DATAType:=cftNone;
  end;
end;
finally
Query.Destroy;
end;*)
end;

procedure TComponentsFilesRepository.SetFile(const id: integer; DATAStream: TMemoryStream; const DATAType: TComponentFileType);
var
  DATAField: TMemoField;
  WriteStream: TClientBlobStream;
begin
//. save data
(*/// + Query:=Space.TObjPropsQuery_Create;
try
DATAField:=TMemoField.Create(nil);
try
with DATAField do begin
FieldName:='DATA';
DataSet:=Query;
end;
with Query do begin
EnterSQL('SELECT * FROM ComponentsFiles WHERE id = '+IntToStr(id));
Open;
Edit;
WriteStream:=TClientBlobStream.Create(DATAField,bmWrite);
try
DATAStream.SaveToStream(WriteStream);
DATAField.LoadFromStream(WriteStream);
Post;
ApplyUpdates(0);
finally
WriteStream.Destroy;
end;
end;
finally
DATAField.Destroy;
end;
finally
Query.Destroy;
end;
//. save datatype
with Space.TObjPropsQuery_Create do
try
EnterSQL('UPDATE ComponentsFiles SET DataType = '+IntToStr(Integer(DATAType))+' WHERE id = '+IntToStr(id));
ExecSQL;
finally
Destroy;
end;*)
end;

function TComponentsFilesRepository.CloneFile(const id: integer): integer;
var
  DATAStream: TClientBlobStream;
  DATAType: TComponentFileType;
begin
GetFile(id, DATAStream,DATAType);
Result:=CreateFile(DATAStream,DATAType);
end;




{TPanelsPropsRepository}
Constructor TPanelsPropsRepository.Create(pSpace: TProxySpace);
begin
Inherited Create;
Space:=pSpace;
end;

function TPanelsPropsRepository.InsertPanelProps(Stream: TStream): integer;
begin
(*/// + with Space.TObjPropsQuery_Create do
try
EnterSQL('INSERT INTO PanelsProps (RefCount,id) Values(0,0)');
ExecSQL;
EnterSQL('SELECT Max(id) MaxID FROM PanelsProps');
Open;
Result:=FieldValues['MaxID'];
finally
Destroy;
end;
SetPanelProps(Result, Stream);*)
end;

procedure TPanelsPropsRepository.RemovePanelProps(const id: integer);
begin
{/// +with Space.TObjPropsQuery_Create do
try
EnterSQL('DELETE FROM PanelsProps WHERE id = '+IntToStr(id));
ExecSQL;
finally
Destroy;
end;}
end;

function TPanelsPropsRepository.PanelProps_AddRef(const id: integer): integer;
begin
{/// + with Space.TObjPropsQuery_Create do
try
EnterSQL('SELECT RefCount FROM PanelsProps WHERE id = '+IntToStr(id));
Open;
if FieldValues['RefCount'] = Null
 then Result:=0
 else Result:=FieldValues['RefCount'];
Close;
INC(Result);
EnterSQL('UPDATE PanelsProps SET RefCount  = '+IntToStr(Result)+' WHERE id = '+IntToStr(id));
ExecSQL;
finally
Destroy;
end;}
end;

function TPanelsPropsRepository.PanelProps_Release(const id: integer): integer;
begin
{/// + with Space.TObjPropsQuery_Create do
try
EnterSQL('SELECT RefCount FROM PanelsProps WHERE id = '+IntToStr(id));
Open;
if RecordCount > 0
 then begin
  Result:=FieldValues['RefCount'];
  Close;
  DEC(Result);
  if Result <= 0
   then RemovePanelProps(id)
   else begin //. обновляем число ссылок
    EnterSQL('UPDATE PanelsProps SET RefCount = '+IntToStr(Result)+' WHERE id = '+IntToStr(id));
    ExecSQL;
    end;
  end
 else
  Result:=0;
finally
Destroy;
end;}
end;

procedure TPanelsPropsRepository.GetPanelProps(const id: integer; out Stream: TClientBlobStream);
var
  BlobField: TMemoField;
begin
{/// + QueryProps:=Space.TObjPropsQuery_Create;
try
BlobField:=TMemoField.Create(nil);
try
with QueryProps do begin
FetchOnDemand:=true;
EnterSQL('SELECT Panel FROM PanelsProps WHERE id = '+IntToStr(id));
with BlobField do begin
FieldName:='Panel';
DataSet:=QueryProps;
end;
Open;
Stream:=TClientBlobStream.Create(BlobField,bmRead);
end;
finally
BlobField.Destroy;
end;
finally
QueryProps.Destroy;
end;}
end;

procedure TPanelsPropsRepository.SetPanelProps(const id: integer; Stream: TStream);
var
  BlobField: TMemoField;
begin
{/// + QueryProps:=Space.TObjPropsQuery_Create;
try
BlobField:=TMemoField.Create(nil);
try
with QueryProps do begin
EnterSQL('SELECT * FROM PanelsProps WHERE id = '+IntToStr(id));
with BlobField do begin
FieldName:='Panel';
DataSet:=QueryProps;
end;
Open;
if RecordCount > 0
 then begin
  Edit;
  BlobField.LoadFromStream(Stream);
  Post;
  if ApplyUpdates(0) > 0 then Raise Exception.Create('TPanelsPropsRepository.SetPanelProps: ApplyUpdates with errors');
  end
 else
  Raise Exception.Create('TPanelsPropsRepository.SetPanelProps: record not found id = '+IntToStr(id));
end;
finally
BlobField.Destroy;
end;
finally
QueryProps.Destroy;
end;}
end;

function TPanelsPropsRepository.ClonePanelProps(const id: integer): integer;
var
  Stream: TClientBlobStream;
begin
GetPanelProps(id, Stream);
Result:=InsertPanelProps(Stream);
end;





{TComponentsList}
Destructor TComponentsList.Destroy;
begin
Clear;
Inherited;
end;

procedure TComponentsList.AddComponent(const pidTComponent,pidComponent,pid: integer);
var
  ptrNewItem: pointer;
begin
GetMem(ptrNewItem,SizeOf(TItemComponentsList));
with TItemComponentsList(ptrNewItem^) do begin
idTComponent:=pidTComponent;
idComponent:=pidComponent;
id:=pid;
end;
Add(ptrNewItem);
end;

procedure TComponentsList.Delete(Index: Integer);
begin
FreeMem(Items[Index],SizeOf(TItemComponentsList));
Inherited Delete(Index);
end;

procedure TComponentsList.Clear;
var
  I: integer;
begin
for I:=0 to Count-1 do FreeMem(Items[I],SizeOf(TItemComponentsList));
Inherited Clear;
end;


{TAbstractSpaceObjPanelProps}
procedure TAbstractSpaceObjPanelProps.Update;
begin
try
if Lock <> nil then Lock.Enter;
try
flUpdating:=true;
try
_Update;
finally
flUpdating:=false;
end;
finally
if Lock <> nil then Lock.Leave;
end;
except
  On E: Exception do EventLog.WriteMajorEvent('PropsPanelUpdate','Unable to update a component properties panel.',E.Message);
  end;
end;

procedure TAbstractSpaceObjPanelProps.setflFreeOnClose(Value: boolean);
begin
FflFreeOnClose:=Value;
end;

procedure TAbstractSpaceObjPanelProps.Show;
begin
Inherited Show;
end;


{TAbstractComponentStatusBar}
Constructor TAbstractComponentStatusBar.Create(const pidTComponent,pidComponent: integer; const pUpdateNotificationProc: TComponentStatusBarUpdateNotificationProc);
begin
Inherited Create();
idTComponent:=pidTComponent;
idComponent:=pidComponent;
UpdateNotificationProc:=pUpdateNotificationProc;
end;

procedure TAbstractComponentStatusBar.GetBitmapStream(const pWidth,pHeight: integer; const Version: integer; out BitmapStream: TMemoryStream);
begin
BitmapStream:=TMemoryStream.Create();
try
with TBitmap.Create() do
try
Canvas.Lock();
try
Width:=pWidth;
Height:=pHeight;
//.
DrawOnCanvas(Canvas, Classes.Rect(0,0,pWidth,pHeight), Version);
finally
Canvas.Unlock();
end;
//.
SaveToStream(BitmapStream);
BitmapStream.Position:=0;
finally
Destroy();
end;
except
  FreeAndNil(BitmapStream);
  //.
  Raise; //. =>
  end;
end;


{TComponentFunctionality}
Constructor TComponentFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
TypeFunctionality.AddRef;
idObj:=pidObj;
_UserName:='';
_UserPassword:='';
RemotedFunctionality:=TComponentFunctionalityRemoted.Create(Self);
RefCount:=1;
end;

Destructor TComponentFunctionality.Destroy;
begin
RemotedFunctionality.Release;
TypeFunctionality.Release;
Inherited;
end;

function TComponentFunctionality.getidTObj: integer;
begin
Result:=TypeFunctionality.idType;
end;

function TComponentFunctionality.getSpace: TProxySpace;
begin
Result:=TypeFunctionality.Space;
end;

function TComponentFunctionality.UserName: WideString;
begin
if (_UserName <> '')
 then Result:=_UserName
 else Result:=Space.UserName;
end;

function TComponentFunctionality.UserPassword: WideString;
begin
if (_UserName <> '')
 then Result:=_UserPassword
 else Result:=Space.UserPassword;
end;

procedure TComponentFunctionality.SetUser(const pUserName: WideString; const pUserPassword: WideString);
begin
_UserName:=pUserName;
_UserPassword:=pUserPassword;
end;

function TComponentFunctionality.UserProfileFolder(): string;
begin
Result:=Space.WorkLocale+PathProfiles+'\'+IntToStr(Space.ID)+'\'+UserName()+'\'+IntToStr(Space.idUserProxySpace)+'\'+'Space'+'\'+'TypesSystem'+'\'+IntToStr(idTObj)+'\'+IntToStr(idObj);
end;

function TComponentFunctionality.GetObjTID: integer;
begin
Result:=idTObj;
end;

function TComponentFunctionality.GetObjID: integer;
begin
Result:=idObj;
end;

procedure TComponentFunctionality.Check;
begin
RemotedFunctionality.Check;
end;

procedure TComponentFunctionality.CheckUserOperation(const idOperation: integer);
begin
RemotedFunctionality.CheckUserOperation(idOperation);
end;

function TComponentFunctionality.GetSecurityComponent(out idSecurityComponent: integer): boolean;
begin
Result:=RemotedFunctionality.GetSecurityComponent(idSecurityComponent);
end;

procedure TComponentFunctionality.ChangeSecurity(const pidSecurityFile: integer);
begin
RemotedFunctionality.ChangeSecurity(pidSecurityFile);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TComponentFunctionality.IsUserDataExists(const DataName: string): boolean;
var
  Folder: string;
  FN: string;
begin
Folder:=UserProfileFolder();
FN:=Folder+'\'+DataName;
TypeSystem.Lock.Enter();
try
Result:=FileExists(FN);
finally
TypeSystem.Lock.Leave();
end;
end;

function TComponentFunctionality.DeleteUserData(const DataName: string): boolean;
var
  Folder: string;
  FN: string;
begin
Folder:=UserProfileFolder();
FN:=Folder+'\'+DataName;
TypeSystem.Lock.Enter();
try
Result:=DeleteFile(FN);
finally
TypeSystem.Lock.Leave();
end;
end;

procedure TComponentFunctionality.SetUserData(const DataName: string; const Data: TMemoryStream);
var
  Folder: string;
  FN: string;
begin
Folder:=UserProfileFolder();
FN:=Folder+'\'+DataName;
TypeSystem.Lock.Enter();
try
if (NOT DirectoryExists(Folder)) then ForceDirectories(Folder);
Data.SaveToFile(FN);
finally
TypeSystem.Lock.Leave();
end;
end;

procedure TComponentFunctionality.GetUserData(const DataName: string; out Data: TMemoryStream);
var
  Folder: string;
  FN: string;
begin
Data:=nil;
//.
Folder:=UserProfileFolder();
FN:=Folder+'\'+DataName;
TypeSystem.Lock.Enter();
try
if (FileExists(FN))
 then begin
  Data:=TMemoryStream.Create();
  try
  Data.LoadFromFile(FN);
  except
    FreeAndNil(Data);
    end;
  end;
finally
TypeSystem.Lock.Leave();
end;
end;

function TComponentFunctionality.Notify(const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult;
begin
Result:=cnrUnknown;
case NotifyType of
ontComponentInserted,ontComponentRemoved: begin
  DoOnComponentUpdate;
  Result:=cnrProcessed;
  end;
ontBecomeComponent,ontBecomeFree: begin
  DoOnComponentUpdate;
  Result:=cnrProcessed;
  end;
end;
end;

procedure TComponentFunctionality.InsertComponent(const idTComponent,idComponent: integer;  out id: integer);
begin
Raise Exception.Create(SNotSupported);
end;

procedure TComponentFunctionality.CloneAndInsertComponent(const idTComponent,idComponent: integer; out idClone: integer; out id: integer); 
begin
RemotedFunctionality.CloneAndInsertComponent(idTComponent,idComponent, idClone, id);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TComponentFunctionality.ImportAndInsertComponents(const ImportFileName: string; out ComponentsList: TComponentsList);
var
  MS: TMemoryStream;
  BA,CL: TByteArray;
  I: integer;
begin
MS:=TMemoryStream.Create;
try
MS.LoadFromFile(ImportFileName);
ByteArray_PrepareFromStream(BA,TStream(MS));
finally
MS.Destroy;
end;
RemotedFunctionality.ImportAndInsertComponents(BA,CL);
ComponentsList:=TComponentsList.Create;
try
for I:=0 to (Length(CL) DIV SizeOf(TItemComponentsList))-1 do with TItemComponentsList(Pointer(Integer(@CL[0])+I*SizeOf(TItemComponentsList))^) do ComponentsList.AddComponent(idTComponent,idComponent,0);
except
  FreeAndNil(ComponentsList);
  Raise; //. =>
  end;
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TComponentFunctionality.DestroyComponent(const idTComponent,idComponent: integer);
begin
RemotedFunctionality.DestroyComponent(idTComponent,idComponent);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TComponentFunctionality.RemoveComponent(const idTComponent,idComponent: integer);
begin
RemotedFunctionality.RemoveComponent(idTComponent,idComponent);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TComponentFunctionality.DestroyComponents;
begin
RemotedFunctionality.DestroyComponents;
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TComponentFunctionality.RemoveSelfAsComponent;
begin
RemotedFunctionality.RemoveSelfAsComponent;
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TComponentFunctionality.IsUnReferenced: boolean;
begin
Result:=RemotedFunctionality.IsUnReferenced;
end;

function TComponentFunctionality.IsEmpty: boolean;
begin
Result:=false;
end;

function TComponentFunctionality.DATASize: integer;
begin
Result:=RemotedFunctionality.DATASize;
end;

function TComponentFunctionality.SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
begin
Result:=RemotedFunctionality.SetComponentsUsingObject(idTUseObj,idUseObj);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TComponentFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TComponentFunctionality.ToClone(out idClone: integer);
begin
RemotedFunctionality.ToClone(idClone);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TComponentFunctionality.ToCloneUsingObject(const idTUseObj,idUseObj: integer; out idClone: integer);
begin
RemotedFunctionality.ToCloneUsingObject(idTUseObj,idUseObj, idClone);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TComponentFunctionality.CanDestroy(out Reason: string): boolean;
var
  ComponentsList: TComponentsList;
  ComponentFunctionality: TComponentFunctionality;
  I: integer;
begin
Result:=true;
Reason:='';
GetComponentsList(ComponentsList);
try
with ComponentsList do begin
for I:=0 to Count-1 do with TItemComponentsList(Items[I]^) do begin
  ComponentFunctionality:=TComponentFunctionality_Create(idTComponent,idComponent);
  with ComponentFunctionality do begin
  Result:=CanDestroy(Reason);
  Release;
  if NOT Result
   then begin
    Reason:='Component: '+TypeFunctionality.Name+' - '+Reason;
    Break;
    end;
  end;
  end;
end;
finally
ComponentsList.Destroy;
end;
end;

function TComponentFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=RemotedFunctionality.GetOwner(idTOwner,idOwner);
end;

function TComponentFunctionality.TPresentUpdater_Create(pUpdateProc: TProc; pOffProc: TProc): TComponentPresentUpdater;
begin
Result:=nil;
Result:=TComponentPresentUpdater.Create(TypeSystem,idObj, pUpdateProc,pOffProc);
end;

function TComponentFunctionality.TContextComponentHolder_Create(): TComponentPresentUpdater;
begin
Result:=TPresentUpdater_Create(nil,nil);
end;

function TComponentFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
end;

procedure TComponentFunctionality.CreateNewPanelProps;
begin
RemotedFunctionality.CreateNewPanelProps;
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TComponentFunctionality.DestroyPanelProps;
begin
RemotedFunctionality.DestroyPanelProps;
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TComponentFunctionality.IsPanelPropsExist: boolean;
begin
Result:=RemotedFunctionality.IsPanelPropsExist;
end;

function TComponentFunctionality.IsCustomPanelPropsExist: boolean;
begin
Result:=RemotedFunctionality.IsCustomPanelPropsExist;
end;

function TComponentFunctionality.CustomPanelProps: TMemoryStream;
var
  BA: TByteArray;
begin
Result:=TMemoryStream.Create;
try
BA:=RemotedFunctionality.CustomPanelProps1;
ByteArray_PrepareStream(BA, TStream(Result));
except
  Result.Destroy;
  Result:=nil;
  Raise; //. =>
  end;
end;

function TComponentFunctionality.idCustomPanelProps: integer;
begin
Result:=RemotedFunctionality.idCustomPanelProps;
end;

function TComponentFunctionality.GetPanelPropsLeftTop(out PanelProps_Left,PanelProps_Top: integer): boolean;
begin
Result:=RemotedFunctionality.GetPanelPropsLeftTop(PanelProps_Left,PanelProps_Top);
end;

function TComponentFunctionality.GetPanelPropsWidthHeight(out PanelProps_Width,PanelProps_Height: integer): boolean;
begin
Result:=RemotedFunctionality.GetPanelPropsWidthHeight(PanelProps_Width,PanelProps_Height);
end;

procedure TComponentFunctionality.SetCustomPanelProps(Stream: TStream; const flNewValue: boolean);
var
  BA: TByteArray;
begin
if (Stream.Size > 100*1024) then Raise Exception.Create('custom props-panel size is too long'); //. =>
ByteArray_PrepareFromStream(BA, TStream(Stream));
RemotedFunctionality.SetCustomPanelProps(BA,flNewValue);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TComponentFunctionality.SetCustomPanelPropsByID(const idPanelProps: integer);
begin
RemotedFunctionality.SetCustomPanelPropsByID(idPanelProps);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TComponentFunctionality.SetPanelPropsLeftTop(const PanelProps_OfsX,PanelProps_OfsY: integer);
begin
RemotedFunctionality.SetPanelPropsLeftTop(PanelProps_OfsX,PanelProps_OfsY);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TComponentFunctionality.SetPanelPropsWidthHeight(const PanelProps_Width,PanelProps_Height: integer);
begin
RemotedFunctionality.SetPanelPropsWidthHeight(PanelProps_Width,PanelProps_Height);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TComponentFunctionality.ReleaseCustomPanelProps;
begin
RemotedFunctionality.ReleaseCustomPanelProps;
//. update local TypesSystem and representations
Space.StayUpToDate;
end;




procedure TComponentFunctionality.GetComponentsList(out ComponentsList: TComponentsList);
var
  BA: TByteArray;
  I: integer;
  Item: TItemComponentsList; 
begin
RemotedFunctionality.GetComponentsList(BA);
ComponentsList:=TComponentsList.Create;
try
for I:=0 to (Length(BA) DIV SizeOf(TItemComponentsList))-1  do begin
  Item:=TItemComponentsList(Pointer(Integer(@BA[0])+I*SizeOf(TItemComponentsList))^);
  ComponentsList.AddComponent(Item.idTComponent,Item.idComponent,Item.id);
  end;
except
  ComponentsList.Destroy;
  ComponentsList:=nil;
  Raise; //. =>
  end;
end;

procedure TComponentFunctionality.GetComponentsList(out ComponentsList: TByteArray);
var
  CL: TComponentsList;
  I: integer;
begin
GetComponentsList(CL);
try
SetLength(ComponentsList,CL.Count*SizeOf(TItemComponentsList));
for I:=0 to CL.Count-1 do TItemComponentsList(Pointer(Integer(@ComponentsList[0])+I*SizeOf(TItemComponentsList))^):=TItemComponentsList(CL[I]^);
finally
CL.Destroy;
end;
end;

function TComponentFunctionality.QueryComponents(FunctionalityClass: TFunctionalityClass; out ComponentsList: TComponentsList): boolean;
var
  L: TComponentsList;
  I: integer;
  _FunctionalityClass: TClass;
begin
Result:=false;
ComponentsList:=nil;
GetComponentsList(L);
try
try
for I:=0 to L.Count-1 do with TItemComponentsList(L[I]^) do begin
  with TComponentFunctionality_Create(idTComponent,idComponent) do begin
  _FunctionalityClass:=ClassType;
  Release;
  end;
  while _FunctionalityClass <> nil do begin
    if ((_FunctionalityClass = FunctionalityClass) OR (_FunctionalityClass.ClassName = FunctionalityClass.ClassName))
     then begin
      if (ComponentsList = nil) then ComponentsList:=TComponentsList.Create;
      ComponentsList.AddComponent(idTComponent,idComponent,id);
      Result:=true;
      end;
    _FunctionalityClass:=_FunctionalityClass.ClassParent;
    end;
  end;
finally
L.Destroy;
end;
except
  ComponentsList.Destroy;
  ComponentsList:=nil;
  Raise; //. =>
  end;
end;


function TComponentFunctionality.QueryComponents(const idTNeededType: integer; out ComponentsList: TComponentsList): boolean;
var
  L: TComponentsList;
  I: integer;
  _FunctionalityClass: TClass;
begin
Result:=false;
ComponentsList:=nil;
GetComponentsList(L);
try
try
for I:=0 to L.Count-1 do with TItemComponentsList(L[I]^) do
  if (idTComponent = idTNeededType)
   then begin
    if ComponentsList  = nil then ComponentsList:=TComponentsList.Create;
    ComponentsList.AddComponent(idTComponent,idComponent,id);
    Result:=true;
    end;
finally
L.Destroy;
end;
except
  ComponentsList.Destroy;
  ComponentsList:=nil;
  Raise; //. =>
  end;
end;

function TComponentFunctionality.QueryComponentsWithTag(const idTNeededType: integer; const pTag: integer; out ComponentsList: TComponentsList): boolean;
var
  BA: TByteArray;
  I: integer;
  Item: TItemComponentsList; 
begin
Result:=QueryComponentsWithTag(idTNeededType,pTag, BA);
if (Result)
 then begin
  ComponentsList:=TComponentsList.Create;
  try
  for I:=0 to (Length(BA) DIV SizeOf(TItemComponentsList))-1  do begin
    Item:=TItemComponentsList(Pointer(Integer(@BA[0])+I*SizeOf(TItemComponentsList))^);
    ComponentsList.AddComponent(Item.idTComponent,Item.idComponent,Item.id);
    end;
  except
    FreeAndNil(ComponentsList);
    Raise; //. =>
    end;
  end
 else ComponentsList:=nil;
end;

function TComponentFunctionality.QueryComponentsWithTag(const idTNeededType: integer; const pTag: integer; out ComponentsList: TByteArray): boolean;
begin
Result:=RemotedFunctionality.QueryComponentsWithTag(idTNeededType,pTag, ComponentsList);
end;

function TComponentFunctionality.QueryComponent(const idTNeededType: integer; out idTComponent,idComponent: integer): boolean;
begin
Result:=RemotedFunctionality.QueryComponent(idTNeededType, idTComponent,idComponent);
end;

function TComponentFunctionality.QueryComponentWithTag(const pTag: integer; out idTComponent,idComponent: integer): boolean;
begin
Result:=RemotedFunctionality.QueryComponentWithTag(pTag, idTComponent,idComponent);
end;

function TComponentFunctionality.QueryComponentWithTag(const idTNeededType: integer; const pTag: integer; out idTComponent,idComponent: integer): boolean;
begin
Result:=RemotedFunctionality.QueryComponentWithTag1(idTNeededType,pTag, idTComponent,idComponent);
end;

function TComponentFunctionality.ComponentsCount: integer;
begin
Result:=RemotedFunctionality.ComponentsCount;
end;

function TComponentFunctionality.QueryComponentFunctionality(NeededFunctionalityClass: TFunctionalityClass; out Functionality: TFunctionality): boolean;
begin
Result:=false;
Functionality:=nil;
end;

function TComponentFunctionality.GetRootOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=RemotedFunctionality.GetRootOwner(idTOwner,idOwner);
end;

function TComponentFunctionality.getName: string;
begin
Result:='Component';
end;

procedure TComponentFunctionality.setName(Value: string);
begin
Raise Exception.Create('cannot write read-only property');
end;

function TComponentFunctionality.getHint: string;
begin
Result:='Component';
end;

function TComponentFunctionality.getTag: integer;
begin
Result:=RemotedFunctionality.getTag;
end;

procedure TComponentFunctionality.setTag(Value: integer);
begin
RemotedFunctionality.setTag(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TComponentFunctionality.GetIconImage(out Image: TBitmap): boolean;
begin
Image:=nil;
Result:=false;
end;

function TComponentFunctionality.getTypeSystem: TTypeSystem;
begin
Result:=TypeFunctionality.TypeSystem;
end;

function TComponentFunctionality.getTableName: string;
begin
Result:=TypeFunctionality.TableName;
end;

procedure TComponentFunctionality.DoOnComponentUpdate;
begin
TypeSystem.TypesSystem.DoOnComponentOperation(idTObj,idObj, opUpdate);
end;

procedure TComponentFunctionality.GetExportDATA(Document: IXMLDOMDocument; ParentNode: IXMLDOMElement; PropsPanelsList: TList; ComponentsFilesList: TList);

  (*/// - function GetSQLData: OLEVariant;

    function GetEnvVar(const VarName: string): string;
    var
      I: integer;
    begin
    Result:='';
    try
    I:=GetEnvironmentVariable(PChar(VarName), nil, 0);
    if I > 0
     then begin
      SetLength(Result, I);
      GetEnvironmentVariable(Pchar(VarName), PChar(Result), I);
      SetLength(Result, Length(Result)-1);
      end;
    except
      Result:='';
      end;
    end;

   procedure CorrectObjectID(Ptr: pointer; Size: integer);
    var
      I: integer;
    begin
    I:=Size-2;
    while I >= 0 do begin
      if ((Byte(Pointer(Integer(Ptr)+I)^) >= $30) AND (Byte(Pointer(Integer(Ptr)+I)^) <= $39))
       then Byte(Pointer(Integer(Ptr)+I)^):=$30
       else Exit; //. ->
      Dec(I);
      end;
    end;

  var
    TempFileName: string;
    DATAPtr: pointer;
  begin
  TempFileName:=GetEnvVar('SystemDrive')+'/UNLOAD.unl';
  try
  with Space.TObjPropsQuery_Create do
  try
  DeleteFile(TempFileName);
  EnterSQL('SELECT * INTO OUTFILE '''+TempFileName+''' FROM '+TableName+' WHERE '+TypeSystem.IDStr+' = '+IntToStr(idObj));
  ExecSQL;
  finally
  Destroy;
  end;
  with TMemoryStream.Create do
  try
  LoadFromFile(TempFileName);
  CorrectObjectID(Memory,Size);
  Result:=VarArrayCreate([0,Size-1],varByte);
  DATAPtr:=VarArrayLock(Result);
  try
  Read(DATAPtr^,Size);
  finally
  VarArrayUnLock(Result);
  end;
  finally
  Destroy;
  end;
  finally
  DeleteFile(TempFileName);
  end;
  end;*)

var
  ObjNode,DATANode,ComponentsNode: IXMLDOMElement;
  SQLDATANode: IXMLDOMElement;
  PropsPanelsNode,PropsPanelNode: IXMLDOMElement;
  RepresentationsNode: IXMLDOMNode;
  I: integer;
  ComponentsList: TComponentsList;

  idPanelProps: integer;
  PanelProps_Left: integer;
  PanelProps_Top: integer;
  PanelProps_Width: integer;
  PanelProps_Height: integer;
  PanelNode: IXMLDOMElement;
begin
(*/// - CheckUserOperation(idReadOperation);
//.
ObjNode:=Document.CreateElement('T'+IntToStr(idTObj)+'-'+IntToStr(idObj));
ParentNode.appendChild(ObjNode);
with ObjNode do begin
  //. export self
  DATANode:=Document.CreateElement('DATA');
  ObjNode.appendChild(DATANode);
  with DATANode do begin
    //. export sql data
    SQLDATANode:=Document.CreateElement('SQL');
    DATANode.appendChild(SQLDATANode);
    SQLDATANode.Set_dataType('bin.base64');
    SQLDATANode.nodeTypedValue:=GetSQLData;
  end;
  //. export components
  GetComponentsList(ComponentsList);
  try
  if ComponentsList.Count > 0
   then begin
    ComponentsNode:=Document.CreateElement('Components');
    ObjNode.appendChild(ComponentsNode);
    for I:=0 to ComponentsList.Count-1 do with TComponentFunctionality_Create(TItemComponentsList(ComponentsList[I]^).idTComponent,TItemComponentsList(ComponentsList[I]^).idComponent) do
      try
      flUserSecurityDisabled:=true;
      GetExportDATA(Document,ComponentsNode, PropsPanelsList,ComponentsFilesList);
      finally
      Release;
      end;
    end;
  finally
  ComponentsList.Destroy;
  end;
  //. export self properies panel
  PropsPanelNode:=Document.CreateElement('Default');
  with Space.TObjPropsQuery_Create do
  try
  EnterSQL('SELECT * FROM ObjectsPanelsProps WHERE (idTObj = '+IntToStr(idTObj)+' AND idObj = '+IntToStr(idObj)+')');
  Open;
  idPanelProps:=0;
  PanelProps_Left:=-1;
  PanelProps_Top:=-1;
  PanelProps_Width:=-1;
  PanelProps_Height:=-1;
  if RecordCount > 0
   then begin
    if FieldValues['idPanelProps'] <> null then idPanelProps:=FieldValues['idPanelProps'];
    if FieldValues['PanelProps_OfsX'] <> null then PanelProps_Left:=FieldValues['PanelProps_OfsX'];
    if FieldValues['PanelProps_OfsY'] <> null then PanelProps_Top:=FieldValues['PanelProps_OfsY'];
    if FieldValues['PanelProps_Width'] <> null then PanelProps_Width:=FieldValues['PanelProps_Width'];
    if FieldValues['PanelProps_Height'] <> null then PanelProps_Height:=FieldValues['PanelProps_Height'];
    end;
  finally
  Destroy;
  end;
  //.
  PanelNode:=Document.CreateElement('ID');
  PanelNode.Text:=IntToStr(idPanelProps);
  PropsPanelNode.appendChild(PanelNode);
  if idPanelProps <> 0 then PropsPanelsList.Add(Pointer(idPanelProps)); //. add panel id to the list
  //.
  PanelNode:=Document.CreateElement('Left');
  PanelNode.Text:=IntToStr(PanelProps_Left);
  PropsPanelNode.appendChild(PanelNode);
  PanelNode:=Document.CreateElement('Top');
  PanelNode.Text:=IntToStr(PanelProps_Top);
  PropsPanelNode.appendChild(PanelNode);
  PanelNode:=Document.CreateElement('Width');
  PanelNode.Text:=IntToStr(PanelProps_Width);
  PropsPanelNode.appendChild(PanelNode);
  PanelNode:=Document.CreateElement('Height');
  PanelNode.Text:=IntToStr(PanelProps_Height);
  PropsPanelNode.appendChild(PanelNode);
  //.
  RepresentationsNode:=ObjNode.selectSingleNode('Representations');
  if RepresentationsNode = nil
   then begin
    RepresentationsNode:=Document.CreateElement('Representations');
    ObjNode.appendChild(RepresentationsNode);
    end;
  PropsPanelsNode:=Document.CreateElement('PropsPanels');
  RepresentationsNode.appendChild(PropsPanelsNode);
  PropsPanelsNode.appendChild(PropsPanelNode);
end;*)
end;

function TComponentFunctionality._GetDataDocument(const DataModel: integer; const DataType: integer; const flWithComponents: boolean; var Document: TByteArray): boolean;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

function TComponentFunctionality.GetDataDocument(const DataModel: integer; const DataType: integer; const flWithComponents: boolean; out Document: TByteArray): boolean;
begin
Result:=RemotedFunctionality.GetDataDocument(DataModel,DataType,flWithComponents,{out} Document);
end;

function TComponentFunctionality.GetHintInfo(const InfoType: integer; const InfoFormat: integer; out HintInfo: TByteArray): boolean;
begin
HintInfo:=nil;
Result:=false;
end;

procedure TComponentFunctionality.NotifyOnComponentUpdate;
begin
RemotedFunctionality.NotifyOnComponentUpdate;
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TComponentFunctionality.GetComponentDATA(const Version: integer): TByteArray;
begin
Result:=RemotedFunctionality.GetComponentDATA(Version);
end;

procedure TComponentFunctionality.SetComponentDATA(const Data: TByteArray);
begin
RemotedFunctionality.SetComponentDATA(Data);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TComponentFunctionality.RealityRating_AddUserRate(const Rate: integer; const RateReason: WideString);
begin
RemotedFunctionality.RealityRating_AddUserRate(Rate,RateReason);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TComponentFunctionality.RealityRating_GetAverageRate(out AvrRate: double; out RateCount: integer);
begin
RemotedFunctionality.RealityRating_GetAverageRate({out} AvrRate,{out} RateCount);
end;

procedure TComponentFunctionality.RealityRating_GetData(out RatingData: TByteArray);
begin
RemotedFunctionality.RealityRating_GetData({out} RatingData);
end;

function TComponentFunctionality.CreationTimestamp(): double;
begin
Result:=RemotedFunctionality.CreationTimestamp();
end;

function TComponentFunctionality.ActualityInterval_Get(): TComponentActualityInterval;
begin
RemotedFunctionality.ActualityInterval_GetTimestamps({out} Result.BeginTimestamp,Result.EndTimestamp);
end;

procedure TComponentFunctionality.ActualityInterval_GetTimestamps(out BeginTimestamp,EndTimestamp: double);
begin
RemotedFunctionality.ActualityInterval_GetTimestamps({out} BeginTimestamp,EndTimestamp);
end;

function TComponentFunctionality.ActualityInterval_GetLocally(): TComponentActualityInterval;
var
  TypeContext: TComponentTypeContext;
  ContextItem: TComponentContextItem;
begin
Result.BeginTimestamp:=NullTimestamp;
Result.EndTimestamp:=NullTimestamp;
//.
TypeContext:=TTypesSystem(Space.TypesSystem).Context.TypeContext[idTObj];
TypeContext.Lock();
try
ContextItem:=TypeContext[idObj];
if (ContextItem <> nil) then Result:=ContextItem.ActualityInterval;
finally
TypeContext.Unlock();
end;
end;

procedure TComponentFunctionality.ActualityInterval_SetEndTimestamp(const Value: double);
begin
RemotedFunctionality.ActualityInterval_SetEndTimestamp(Value);
//. update local TypesSystem and representations
Space.StayUpToDate();
end;

function TComponentFunctionality.ActualityInterval_IsActualForTime(const pTime: double): boolean;
var
  AI: TComponentActualityInterval;
begin
AI:=ActualityInterval_Get();
Result:=((AI.BeginTimestamp <= pTime) AND (pTime <= AI.EndTimestamp));
end;

function TComponentFunctionality.ActualityInterval_IsActualForTimeInterval(const pInterval: TComponentActualityInterval): boolean;
var
  AI: TComponentActualityInterval;
begin
AI:=ActualityInterval_Get();
Result:=(NOT ((pInterval.BeginTimestamp > AI.EndTimestamp) OR (pInterval.EndTimestamp < AI.BeginTimestamp)));
end;

function TComponentFunctionality.ActualityInterval_IsActualForTimeLocally(const pTime: double): boolean;
var
  AI: TComponentActualityInterval;
begin
AI:=ActualityInterval_GetLocally();
Result:=((AI.BeginTimestamp <= pTime) AND (pTime <= AI.EndTimestamp));
end;

function TComponentFunctionality.ActualityInterval_IsActualForTimeIntervalLocally(const pInterval: TComponentActualityInterval): boolean;
var
  AI: TComponentActualityInterval;
begin
AI:=ActualityInterval_GetLocally();
Result:=(NOT ((pInterval.BeginTimestamp > AI.EndTimestamp) OR (pInterval.EndTimestamp < AI.BeginTimestamp)));
end;

procedure TComponentFunctionality.ActualityInterval_Actualize();
begin
RemotedFunctionality.ActualityInterval_Actualize();
//. update local TypesSystem and representations
Space.StayUpToDate();
end;

procedure TComponentFunctionality.ActualityInterval_Deactualize();
begin
RemotedFunctionality.ActualityInterval_Deactualize();
//. update local TypesSystem and representations
Space.StayUpToDate();
end;


// объект заместитель другого объекта
{TSystemTProxyObject}
Constructor TSystemTProxyObject.Create;
begin
CreateNew(idTProxyObject,tnTProxyObject,TTProxyObjectFunctionality);
end;

procedure TSystemTProxyObject.DoOnComponentOperationLocal(const idTObj,idObj: integer; const Operation: TComponentOperation);
begin
Inherited;
end;


{TTProxyObjectFunctionality}
Constructor TTProxyObjectFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTProxyObject;
RemotedFunctionality:=TTProxyObjectFunctionalityRemoted.Create(Self);
end;

Destructor TTProxyObjectFunctionality.Destroy;
begin
RemotedFunctionality.Free;
Inherited;
end;

function TTProxyObjectFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TTProxyObjectFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;

function TTProxyObjectFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TProxyObjectFunctionality.Create(Self, idComponent);
end;

function TTProxyObjectFunctionality.getName: string;
begin
Result:=nmTProxyObject;
end;

function TTProxyObjectFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TypesDef\ProxyObject\ProxyObject.bmp');
  except
    end;
  end;
Result:=FImage;
end;




{TProxyObjectFunctionality}
Constructor TProxyObjectFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited;
RemotedFunctionality:=TProxyObjectFunctionalityRemoted.Create(Self);
end;

Destructor TProxyObjectFunctionality.Destroy; 
begin
RemotedFunctionality.Release;
Inherited;
end;

procedure TProxyObjectFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;

function TProxyObjectFunctionality.CanDestroy(out Reason: string): boolean;
begin
Result:=Inherited CanDestroy(Reason);
end;

function TProxyObjectFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
var
  idTOwner,idOwner: integer;
  OwnerFunctionality: TComponentFunctionality;
  ProxyObjectDescr: TObjectDescr;
begin
Result:=nil;
if GetReference(idTOwner,idOwner) AND (idTOwner <> idTObj)
 then begin //. ваводим панель свойств объекта, на который указывает Proxy
  OwnerFunctionality:=TComponentFunctionality_Create(idTOwner,idOwner);
  with OwnerFunctionality do begin
  ProxyObjectDescr.idType:=Self.idTObj;
  ProxyObjectDescr.idObj:=Self.idObj;
  Result:=TPanelProps_Create(pflReadOnly, pidOwnerObjectProp,pOwnerPanelsProps, ProxyObjectDescr);
  Release;
  end;
  end
 else
  Raise Exception.Create('ProxyObject has no owner'); //. =>
  /// ? Result:=TProxyObjectPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,pOwnerPanelsProps,nilObject);
end;

function TProxyObjectFunctionality.getName: string;
var
  idTOwner,idOwner: integer;
  OwnerFunctaionality: TComponentFunctionality;
begin
Result:='';
if GetReference(idTOwner,idOwner)
 then begin
  OwnerFunctaionality:=TComponentFunctionality_Create(idTOwner,idOwner);
  with OwnerFunctaionality do begin
  Result:=Name;
  Release;
  end;
  end;
end;

function TProxyObjectFunctionality.getHint: string;
begin
Result:='';
end;


function TProxyObjectFunctionality.GetReference(out idTOwner,idOwner: integer): boolean;
begin
Result:=RemotedFunctionality.GetReference(idTOwner,idOwner);
end;

procedure TProxyObjectFunctionality.SetReference(const idTOwner,idOwner: integer);
begin
RemotedFunctionality.SetReference(idTOwner,idOwner);
end;




{TTBaseVisualizationFunctionality}
Constructor TTBaseVisualizationFunctionality.Create;
begin
Inherited;
FReflector:=nil;
NewInstancePtr:=nilPtr;
NewInstanceOwnerPtr:=nilPtr;
RemotedFunctionality:=TTBaseVisualizationFunctionalityRemoted.Create(Self);
end;

Destructor TTBaseVisualizationFunctionality.Destroy;
begin
RemotedFunctionality.Free;
Inherited;
end;

procedure TTBaseVisualizationFunctionality.GetComponentOwnerDatas(const IDs: TByteArray; const DataFlags: TComponentDataFlags; out Data: TByteArray);
begin
RemotedFunctionality.GetComponentOwnerDatas(IDs,DataFlags,{out} Data);
end;

function TTBaseVisualizationFunctionality.CanCreateAsDetail: boolean;
begin
Result:=true;
end;

function TTBaseVisualizationFunctionality.ImportInstance(ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer;

  (* /// - procedure ConvertNodeToCrd(Node: Variant;  out X,Y: TCrd);
  var
    WS: WideString;
    S: string;
    I: integer;
  begin
  WS:=Node;
  I:=1;
  S:='';
  while I < Length(WS) do
    if (($30 <= Ord(WS[I])) AND (Ord(WS[I]) <= $39)) OR (WS[I] = '.') OR (WS[I] = '+') OR (WS[I] = '-')
     then begin
      S:=S+WS[I];
      Inc(I);
      end
     else
      Break; //. >
  X:=StrToFloat(S);
  Inc(I);
  S:='';
  while I < Length(WS) do
    if (($30 <= Ord(WS[I])) AND (Ord(WS[I]) <= $39)) OR (WS[I] = '.') OR (WS[I] = '+') OR (WS[I] = '-')
     then begin
      S:=S+WS[I];
      Inc(I);
      end
     else
      Break; //. >
  Y:=StrToFloat(S);
  end;

  function ExtractTypeNumber(const S: string): integer;
  var
    R: string;
    I: integer;
  begin
  R:='';
  for I:=2 to Length(S) do
    if ($30 <= Ord(S[I])) AND (Ord(S[I]) <= $39)
     then R:=R+S[I]
     else Break; //. >
  Result:=StrToInt(R);
  end;*)

var
  SpaceDATANode: IXMLDOMNode;
  Obj: TSpaceObj;
  ObjLay: integer;
  LayPtr: TPtr;
  OwnerPtr: TPtr;
  ItemNode: IXMLDOMNode;
  NodesNode: IXMLDOMNode;
  ptrNewObj,ptrptrNewObj: TPtr;
  I: integer;
  CrdStr: WideString;
  ptrNewP,ptrptrNewP: TPtr;
  NewP: TPoint;
  Params: WideString;
  DetailsNode: IXMLDOMNode;
  DetailNode: IXMLDOMNode;
  idTDetail,idDetail: integer;
begin
(*/// - Result:=Inherited ImportInstance(ComponentNode, PropsPanelsList,ComponentsFilesList);
//.
SpaceDATANode:=ComponentNode.selectSingleNode('DATA/Space');
//. get lay info
ItemNode:=SpaceDATANode.selectSingleNode('Lay');
if ItemNode <> nil
 then ObjLay:=StrToInt(SpaceDATANode.selectSingleNode('Lay').nodeTypedValue)
 else ObjLay:=-1;
//. get loop flag
Obj.flagLoop:=Boolean(StrToInt(SpaceDATANode.selectSingleNode('flLoop').nodeTypedValue));
//. get color
Obj.Color:=TColor(StrToInt(SpaceDATANode.selectSingleNode('Color').nodeTypedValue));
//. get width
Obj.Width:=StrToFloat(SpaceDATANode.selectSingleNode('Width').nodeTypedValue);
//. get fill flag
Obj.flagFill:=Boolean(StrToInt(SpaceDATANode.selectSingleNode('flFill').nodeTypedValue));
//. get fill color
Obj.ColorFill:=TColor(StrToInt(SpaceDATANode.selectSingleNode('ColorFill').nodeTypedValue));
//. prepare and write obj body
Obj.ptrNextObj:=nilPtr;
Obj.idTObj:=idType;
Obj.idObj:=Result;
Obj.ptrFirstPoint:=nilPtr;
Obj.ptrListOwnerObj:=nilPtr;
if ObjLay <> -1
 then begin
  LayPtr:=Space.Lay_Ptr(ObjLay);
  if LayPtr = nilPtr
   then begin
    LayPtr:=Space.Lay_Ptr(Space.LaysCount-2);
    if LayPtr = nilPtr then Raise Exception.Create('could not get obj lay'); //. =>
    end;
  end
 else
  LayPtr:=nilPtr;
ptrNewObj:=nilPtr;
Space.WriteObj(Obj,SizeOf(Obj), ptrNewObj);
Dec(ptrNewObj,SizeOf(Obj));
//. get nodes(points)
ptrptrNewP:=ptrNewObj+ofsptrFirstPoint;
NodesNode:=SpaceDATANode.selectSingleNode('Nodes');
for I:=0 to NodesNode.childNodes.length-1 do begin
  ConvertNodeToCrd(NodesNode.ChildNodes[I].nodeTypedValue, NewP.X,NewP.Y);
  //. write node
  NewP.ptrNextObj:=nilPtr;
  ptrNewP:=nilPtr;
  Space.WriteObj(NewP,SizeOf(NewP), ptrNewP);
  Dec(ptrNewP,SizeOf(NewP));
  Space.WriteObj(ptrNewP,SizeOf(ptrNewP),ptrptrNewP);
  ptrptrNewP:=ptrNewP;
  end;
NewInstancePtr:=ptrNewObj;
if LayPtr <> nilPtr
 then OwnerPtr:=LayPtr
 else OwnerPtr:=NewInstanceOwnerPtr;
//. вставляем новый объект в список
ptrptrNewObj:=OwnerPtr+ofsptrListOwnerObj;
Skip2DVisualizationLays(Space, ptrptrNewObj);
InsertObjToList(ptrNewObj,ptrptrNewObj,Space);
{извещательная часть}
//. извещение GlobalSpace о создании компонента
try
if Space.GlobalSpaceNotifier <> nil
 then begin
  Space.GetSecurityParams(Params);
  try
  Space.GlobalSpaceNotifier.On2DVisualizationOperation(ptrNewObj, Integer(opCreate), Space.ID, Params);
  except
    InterfaceValidate(Space.GlobalSpaceNotifier,IID_ISpaceNotifier,Space.GlobalSpaceHost);
    Space.GlobalSpaceNotifier.On2DVisualizationOperation(ptrNewObj, Integer(opCreate), Space.ID, Params);
    end;
  end;
//. обновление отображений
Space.Partition_DoRevision(ptrNewObj, actInsert);
if TypesSystem.Reflector <> nil then TypesSystem.Reflector.RevisionReflect(ptrNewObj,actInsert);
except
  //. ловим исключения извещательной части, чтобы она не влияла на создание клона(возможны потери изображения при неудачи этой части)
  end;
//. обрабатываем собственные объекты
DetailsNode:=SpaceDATANode.selectSingleNode('Details');
if DetailsNode <> nil
 then
  for I:=0 to DetailsNode.childNodes.length-1 do begin
    DetailNode:=DetailsNode.childNodes[I];
    idTDetail:=ExtractTypeNumber(DetailNode.NodeName);
    with TTBaseVisualizationFunctionality(TTypeFunctionality_Create(idTDetail)) do
    try
    flUserSecurityDisabled:=true;
    NewInstanceOwnerPtr:=ptrNewObj;
    idDetail:=ImportInstance(DetailNode, PropsPanelsList,ComponentsFilesList);
    finally
    Release;
    end;
    end;*)
end;

{TBaseVisualizationFunctionality}
Constructor TBaseVisualizationFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited;
FPtr:=nilPtr;
FReflector:=nil;
Meshes:=nil;
Scale:=1.0;
Translate_X:=0;
Translate_Y:=0;
Translate_Z:=0;
Rotate_AngleX:=0;
Rotate_AngleY:=0;
Rotate_AngleZ:=0;
flDynamic:=false;
RemotedFunctionality:=TBaseVisualizationFunctionalityRemoted.Create(Self);
end;

Destructor TBaseVisualizationFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited
end;

function TBaseVisualizationFunctionality.Ptr: TPtr;
begin
if FPtr = nilPtr
 then begin
  FPtr:=Space.TObj_Ptr(idTObj,idObj);
  if (FPtr = nilPtr) then Raise Exception.Create('ptr of Base2DVisualizationFunctionality is nil'); //. =>
  end;
Result:=FPtr;
end;

procedure TBaseVisualizationFunctionality.ReflectInScene(Scene: TScene);
const
  ColorCoef = 350;
  Alfa = 1;
var
  Obj: TSpaceObj;
  ptrPoint: TPtr;
  Point: TPoint;

  procedure ReflectAsSelected;
  begin
  //. perform nodes
  glDisable(GL_LIGHTING);
  glDisable(GL_TEXTURE_2D);
  glEnable(GL_POINT_SMOOTH);
  glColor4f(10.0,0,0, 0.5);
  glPointSize(5);
  glBegin(GL_POINTS);
  try
  ptrPoint:=Obj.ptrFirstPoint;
  while ptrPoint <> nilPtr do begin
    Space.ReadObj(Point,SizeOf(Point), ptrPoint);
    glVertex3f(Point.X,Point.Y,0);
    ptrPoint:=Point.ptrNextObj;
    end;
  finally
  glEnd;
  glEnable(GL_LIGHTING);
  end;
  end;

begin
Space.ReadObj(Obj,SizeOf(Obj), Ptr);
glDisable(GL_LIGHTING);
glDisable(GL_TEXTURE_2D);
glLineWidth(1);
if Obj.flagLoop
 then glBegin(GL_LINE_LOOP)
 else glBegin(GL_LINE_STRIP);
glColor4f((Obj.Color MOD 256)/ColorCoef,((Obj.Color SHR 8) MOD 256)/ColorCoef,((Obj.Color SHR 16) MOD 256)/ColorCoef, Alfa);
try
ptrPoint:=Obj.ptrFirstPoint;
while ptrPoint <> nilPtr do begin
  Space.ReadObj(Point,SizeOf(Point), ptrPoint);
  glVertex3f(Point.X,Point.Y,0);
  ptrPoint:=Point.ptrNextObj;
  end;
finally
glEnd;
glEnable(GL_LIGHTING);
end;
if FPtr = TReflector(Scene.Reflector).ptrSelectedObj then ReflectAsSelected;
end;

procedure TBaseVisualizationFunctionality.DoOnChangeScale(const ChangeCoef: Double);
begin
//. do nothing
end;

function TBaseVisualizationFunctionality.IsUnReferenced: boolean;
begin
Result:=RemotedFunctionality.IsUnReferenced;
end;

function TBaseVisualizationFunctionality.DoOnOver: boolean;
begin
Result:=false;
end;

function TBaseVisualizationFunctionality.DoOnClick: boolean;
var
  idTOwner,idOwner: integer;
begin
Result:=false;
if GetOwner(idTOwner,idOwner)
 then with TComponentFunctionality_Create(idTOwner,idOwner) do
  try
  if Notify(ontVisualizationClick,Self.idTObj,Self.idObj) = cnrProcessed then Result:=true;
  finally
  Release;
  end;
end;

function TBaseVisualizationFunctionality.DoOnDblClick: boolean;
var
  idTOwner,idOwner: integer;
begin
Result:=false;
if GetOwner(idTOwner,idOwner)
 then with TComponentFunctionality_Create(idTOwner,idOwner) do
  try
  if Notify(ontVisualizationDblClick,Self.idTObj,Self.idObj) = cnrProcessed then Result:=true;
  finally
  Release;
  end;
end;

procedure TBaseVisualizationFunctionality.GetExportDATA(Document: IXMLDOMDocument; ParentNode: IXMLDOMElement; PropsPanelsList: TList; ComponentsFilesList: TList);
var
  DATANode,SpaceDATANode: IXMLDOMNode;
  Obj: TSpaceObj;
  ObjLay,ObjSubLay: integer;
  ItemNode: IXMLDOMNode;
  NodesNode: IXMLDOMNode;
  ptrPoint: TPtr;
  Point: TPoint;
  PointIndex: integer;
  CrdStr: WideString;
  ptrDetail: TPtr;
  Detail: TSpaceObj;
  DetailsNode: IXMLDOMElement;
begin
Inherited GetExportDATA(Document,ParentNode, PropsPanelsList,ComponentsFilesList);
//.
DATANode:=ParentNode.selectSingleNode('T'+IntToStr(idTObj)+'-'+IntToStr(idObj)+'/DATA');
SpaceDATANode:=Document.CreateElement('Space');
DATANode.appendChild(SpaceDATANode);
//. add lay info
Space.ReadObj(Obj,SizeOf(Obj),Ptr);
Space.Obj_GetLayInfo(Ptr, ObjLay,ObjSubLay);
if ObjSubLay = 0
 then begin
  ItemNode:=Document.CreateElement('Lay');
  ItemNode.nodeTypedValue:=IntToStr(ObjLay);
  SpaceDATANode.appendChild(ItemNode);
  end;
//. add loop flag
ItemNode:=Document.CreateElement('flLoop');
ItemNode.nodeTypedValue:=IntToStr(Integer(Obj.flagLoop));
SpaceDATANode.appendChild(ItemNode);
//. add color
ItemNode:=Document.CreateElement('Color');
ItemNode.nodeTypedValue:=IntToStr(Integer(Obj.Color));
SpaceDATANode.appendChild(ItemNode);
//. add width
ItemNode:=Document.CreateElement('Width');
ItemNode.nodeTypedValue:=FloatToStr(Obj.Width);
SpaceDATANode.appendChild(ItemNode);
//. add fill flag
ItemNode:=Document.CreateElement('flFill');
ItemNode.nodeTypedValue:=IntToStr(Integer(Obj.flagFill));
SpaceDATANode.appendChild(ItemNode);
//. add fill color
ItemNode:=Document.CreateElement('ColorFill');
ItemNode.nodeTypedValue:=IntToStr(Integer(Obj.ColorFill));
SpaceDATANode.appendChild(ItemNode);
//. add nodes(points)
NodesNode:=Document.CreateElement('Nodes');
SpaceDATANode.appendChild(NodesNode);
ptrPoint:=Obj.ptrFirstPoint;
PointIndex:=0;
while ptrPoint <> nilPtr do begin
  Space.ReadObj(Point,SizeOf(Point),ptrPoint);
  CrdStr:=FloatToStr(Point.X)+';'+FloatToStr(Point.Y);
  ItemNode:=Document.CreateElement('N'+IntToStr(PointIndex));
  ItemNode.nodeTypedValue:=CrdStr;
  NodesNode.appendChild(ItemNode);
  //. next node
  ptrPoint:=Point.ptrNextObj;
  Inc(PointIndex);
  end;
//. add detail objects
ptrDetail:=Obj.ptrListOwnerObj;
if ptrDetail <> nilPtr
 then begin
  DetailsNode:=Document.CreateElement('Details');
  SpaceDATANode.appendChild(DetailsNode);
  while ptrDetail <> nilPtr do begin
    Space.ReadObj(Detail,SizeOf(Detail), ptrDetail);
    with TComponentFunctionality_Create(Detail.idTObj,Detail.idObj) do
    try
    GetExportDATA(Document,DetailsNode, PropsPanelsList,ComponentsFilesList);
    finally
    Release;
    end;
    //. next detail
    ptrDetail:=Detail.ptrNextObj;
    end;
  end;
end;

procedure TBaseVisualizationFunctionality.GetOwnerByVisualization(out idTOwner,idOwner: integer; out ptrOwnerVisualization: TPtr);
begin
RemotedFunctionality.GetOwnerByVisualization(idTOwner,idOwner,ptrOwnerVisualization);
end;

function TBaseVisualizationFunctionality.GetCoVisualizationSpaces(out List: TList): boolean;
var
  BA: TByteArray;
begin
Result:=false;
List:=nil;
if (GetCoVisualizationSpaces({out} BA))
 then begin
  ByteArray_CreateList(BA,{out} List);
  Result:=true;
  end;
end;

function TBaseVisualizationFunctionality.GetCoVisualizationSpaces(out List: TByteArray): boolean;
begin
Result:=RemotedFunctionality.GetCoVisualizationSpaces({out} List);
end;
 
function TBaseVisualizationFunctionality.getStrobing: boolean;
begin
Result:=RemotedFunctionality.getStrobing;
end;

procedure TBaseVisualizationFunctionality.setStrobing(Value: boolean);
begin
RemotedFunctionality.setStrobing(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TBaseVisualizationFunctionality.getStrobingInterval: integer;
begin
Result:=RemotedFunctionality.getStrobingInterval;
end;

procedure TBaseVisualizationFunctionality.setStrobingInterval(Value: integer);
begin
RemotedFunctionality.setStrobingInterval(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;


procedure TBaseVisualizationFunctionality.DoOnComponentUpdate;
var
  ptrObj: TPtr;
begin
Inherited;
ptrObj:=Space.TObj_Ptr(idTObj,idObj);
if (ptrObj <> nilPtr) AND (Reflector <> nil) then Reflector.RevisionReflect(ptrObj, actChange);
end;


{TStrobingVisuazationsReflectors}
Constructor TStrobingVisuazationsReflectors.Create;
begin
Inherited Create;
FItems:=nil;
end;

Destructor TStrobingVisuazationsReflectors.Destroy;
begin
Clear;
Inherited;
end;

procedure TStrobingVisuazationsReflectors.Clear;
var
  ptrDestroyItem: pointer;
begin
while FItems <> nil do begin
  ptrDestroyItem:=FItems;
  FItems:=TItemStrobingVisuazationsReflectors(ptrDestroyItem^).ptrNext;
  FreeMem(ptrDestroyItem,SizeOf(TItemStrobingVisuazationsReflectors));
  end;
end;

procedure TStrobingVisuazationsReflectors.InsertItem(const pReflectorID: integer; const pReflectionID: integer);
var
  ptrNewItem: pointer;
begin
GetMem(ptrNewItem,SizeOf(TItemStrobingVisuazationsReflectors));
with TItemStrobingVisuazationsReflectors(ptrNewItem^) do begin
ptrNext:=FItems;
ReflectorID:=pReflectorID;
ReflectionID:=pReflectionID;
end;
FItems:=ptrNewItem;
end;

function TStrobingVisuazationsReflectors.GetItemByReflectorID(const pReflectorID: integer; out ptrItem: pointer): boolean;
begin
Result:=false;
ptrItem:=FItems;
while ptrItem <> nil do with TItemStrobingVisuazationsReflectors(ptrItem^) do begin
  if ReflectorID = pReflectorID
   then begin
    Result:=true;
    Exit; //. ->
    end;
  //. next item
  ptrItem:=ptrNext;
  end;
end;

function TStrobingVisuazationsReflectors.ReflectorReflectionChanged(const pReflectorID: integer; const pReflectionID: integer): boolean;
var
  ptrItem: pointer;
begin
if GetItemByReflectorID(pReflectorID, ptrItem)
 then with TItemStrobingVisuazationsReflectors(ptrItem^) do
  if ReflectionID <> pReflectionID
   then begin
    Result:=true;
    ReflectionID:=pReflectionID;
    end
   else
    Result:=false
 else begin
  Result:=true;
  InsertItem(pReflectorID,pReflectionID);
  end;
end;


{TStrobingVisualizations}
Constructor TStrobingVisualizations.Create(pTypesSystem: TTypesSystem);
begin
Inherited Create(nil);
TypesSystem:=pTypesSystem;
FItems:=nil;
Interval:=1;
Counter:=0;
OnTimer:=Process;
end;

Destructor TStrobingVisualizations.Destroy;
begin
Clear;
Inherited;
end;

procedure TStrobingVisualizations.Clear;
var
  ptrDelItem: pointer;
begin
while FItems <> nil do begin
  ptrDelItem:=FItems;
  FItems:=TItemStrobingVisualizations(ptrDelItem^).ptrNext;
  TItemStrobingVisualizations(ptrDelItem^).Reflectors.Destroy;
  FreeMem(ptrDelItem,SizeOf(TItemStrobingVisualizations));
  end;
end;

procedure TStrobingVisualizations.Update;
var
  ptrNewItem: pointer;
begin
Clear;
//. do not full update when proxyspace connected remoted
if TypesSystem.Space.Status in [pssRemoted,pssRemotedBrief] then Exit; //. ->
//.
(* /// - with TypesSystem.Space.TObjPropsQuery_Create do
try
EnterSQL('SELECT * FROM StrobingVisualizations');
Open;
while NOT EOF do begin
  GetMem(ptrNewItem,SizeOf(TItemStrobingVisualizations));
  with TItemStrobingVisualizations(ptrNewItem^) do begin
  ptrNext:=FItems;
  idTVisualization:=FieldValues['idTVisualization'];
  idVisualization:=FieldValues['idVisualization'];
  StrobingInterval:=FieldValues['StrobingInterval'];
  ptrObj:=TypesSystem.Space.TObj_Ptr(idTVisualization,idVisualization);
  StateData:=0;
  Reflectors:=TStrobingVisuazationsReflectors.Create;
  end;
  FItems:=ptrNewItem;
  //. next item
  Next;
  end;
finally
Destroy;
end;*)
end;

function TStrobingVisualizations.Obj_StateData(const ptrObj: TPtr): longword;

   function StateData(const ptrObj: TPtr): longword;
   var
     Obj: TSpaceObj;
     I: integer;
     pt: pointer;
     ptrPoint: TPtr;
     Point: TPoint;
     ptrOwnerObj: TPtr;
   begin
   Result:=0;
   TypesSystem.Space.ReadObj(Obj,SizeOf(Obj), ptrObj);
   //. adding body
   pt:=@Obj;
   for I:=0 to SizeOf(Obj)-1 do Inc(Result,Byte(Pointer(Integer(pt)+I)^));
   //. adding points
   ptrPoint:=Obj.ptrFirstPoint;
   While ptrPoint <> nilPtr do begin
     TypesSystem.Space.ReadObj(Point,SizeOf(Point), ptrPoint);
     //.
     pt:=@Point;
     for I:=0 to SizeOf(Point)-1 do Inc(Result,Byte(Pointer(Integer(pt)+I)^));
     //. next point
     ptrPoint:=Point.ptrNextObj;
     end;
   //. process own objects
   ptrOwnerObj:=Obj.ptrListOwnerObj;
   while ptrOwnerObj <> nilPtr do begin
     Result:=Result+StateData(ptrOwnerObj);
     TypesSystem.Space.ReadObj(ptrOwnerObj,SizeOf(TPtr), ptrOwnerObj);
     end;
   end;

begin
Result:=StateData(ptrObj);
end;

procedure TStrobingVisualizations.Process(Sender: TObject);
var
  ptrItem: pointer;
  SD: longword;
  I: integer;

  procedure ReflectObject(Reflector: TAbstractReflector; const ptrObj: TPtr; const Act: TRevisionAct);
  var
    Obj: TSpaceObj;
    ptrOwnerObj: TPtr;
  begin
  Reflector.RevisionReflectLocal(ptrObj,Act);
  //. обрабатываем собственные объекты
  TypesSystem.Space.ReadObj(Obj,SizeOf(Obj), ptrObj);
  ptrOwnerObj:=Obj.ptrListOwnerObj;
  While ptrOwnerObj <> nilPtr do begin
    ReflectObject(Reflector,ptrOwnerObj,Act);
    TypesSystem.Space.ReadObj(ptrOwnerObj,SizeOf(TPtr), ptrOwnerObj);
    end;
  end;

begin
if (TypesSystem.Space = nil) OR (TypesSystem.Space.ReflectorsList = nil) then Exit; //. ->
ptrItem:=FItems;
while ptrItem <> nil do with TItemStrobingVisualizations(ptrItem^) do begin
  if (ptrObj <> nilPtr) AND (Frac(Counter/StrobingInterval) = 0)
   then begin
    SD:=Obj_StateData(ptrObj);
    if SD <> StateData
     then begin
      for I:=0 to TypesSystem.Space.ReflectorsList.Count-1 do
       if TReflector(TypesSystem.Space.ReflectorsList[I]).Visible then ReflectObject(TReflector(TypesSystem.Space.ReflectorsList[I]),ptrObj,actChange);
      StateData:=SD;
      end
     else
      for I:=0 to TypesSystem.Space.ReflectorsList.Count-1 do with TReflector(TypesSystem.Space.ReflectorsList[I]) do
       if Visible
        then
         if Reflectors.ReflectorReflectionChanged(id,ReflectionID)
          then ReflectObject(TReflector(TypesSystem.Space.ReflectorsList[I]),ptrObj,actInsert)
          else ReflectObject(TReflector(TypesSystem.Space.ReflectorsList[I]),ptrObj,actReFresh);
    end;
  ptrItem:=ptrNext;
  end;
//. increment time-quant counter
Inc(Counter);
end;

function TStrobingVisualizations.GetPtrItem(const idTObj,idObj: integer): pointer;
var
  ptrptrItem: pointer;
begin
Result:=nil;
ptrptrItem:=@FItems;
while Pointer(ptrptrItem^) <> nil do with TItemStrobingVisualizations(Pointer(ptrptrItem^)^) do begin
  if (idTVisualization = idTObj) AND (idVisualization = idObj)
   then begin
    Result:=Pointer(ptrptrItem^);
    Pointer(ptrptrItem^):=ptrNext;
    TItemStrobingVisualizations(Result^).ptrNext:=FItems;
    FItems:=Result;
    Exit; //. ->
    end;
  ptrptrItem:=@ptrNext;
  end;
{Result:=FItems;
while Result <> nil do with TItemTQDCVisualizationCash(Result^) do begin
  if idObj = pidObj then Exit;
  Result:=ptrNext;
  end;}
end;

procedure TStrobingVisualizations.DoOnComponentOperationLocal(const idTObj,idObj: integer; const Operation: TComponentOperation);

  procedure UpdateItem(ptrItem: pointer);
  begin
  (* /// ? with TItemStrobingVisualizations(ptrItem^),TypesSystem.Space.TObjPropsQuery_Create do
  try
  EnterSQL('SELECT * FROM StrobingVisualizations WHERE (idTVisualization = '+IntToStr(idTVisualization)+' AND idVisualization = '+IntToStr(idVisualization)+')');
  Open;
  begin
  ptrNext:=FItems;
  idTVisualization:=FieldValues['idTVisualization'];
  idVisualization:=FieldValues['idVisualization'];
  StrobingInterval:=FieldValues['StrobingInterval'];
  ptrObj:=TypesSystem.Space.TObj_Ptr(idTVisualization,idVisualization);
  StateData:=0;
  Reflectors:=TStrobingVisuazationsReflectors.Create;
  end;
  finally
  Destroy;
  end;*)
  end;

var
  F: TComponentFunctionality;
  ptrNewItem: pointer;
  ptrUpdateItem: pointer;
begin
{/// ? F:=TComponentFunctionality_Create(idTObj,idObj);
with F do
try
if F is TBaseVisualizationFunctionality
 then with TBaseVisualizationFunctionality(F) do begin
  //.
  RemoveItem(idTObj,idObj);
  //.
  if Strobing
   then begin
    GetMem(ptrNewItem,SizeOf(TItemStrobingVisualizations));
    with TItemStrobingVisualizations(ptrNewItem^) do begin
    ptrNext:=FItems;
    idTVisualization:=idTObj;
    idVisualization:=idObj;
    StrobingInterval:=1;
    ptrObj:=nilPtr;
    end;
    UpdateItem(ptrNewItem);
    FItems:=ptrNewItem;
    end;
  //.
  end;
finally
Release;
end;}
end;

procedure TStrobingVisualizations.RemoveItem(const idTObj,idObj: integer);
var
  ptrptrDelItem: pointer;
  ptrDelItem: pointer;
begin
ptrptrDelItem:=@FItems;
while Pointer(ptrptrDelItem^) <> nil do with TItemStrobingVisualizations(Pointer(ptrptrDelItem^)^) do begin
  if (idTVisualization = idTObj) AND (idVisualization = idObj)
   then begin
    ptrDelItem:=Pointer(ptrptrDelItem^);
    Pointer(ptrptrDelItem^):=TItemStrobingVisualizations(ptrDelItem^).ptrNext;
    TItemStrobingVisualizations(ptrDelItem^).Reflectors.Destroy;
    FreeMem(ptrDelItem,SizeOf(TItemStrobingVisualizations));
    Exit; //. ->
    end
   else
    ptrptrDelItem:=@TItemStrobingVisualizations(Pointer(ptrptrDelItem^)^).ptrNext;
  end;
end;


{TTBase2DVisualizationFunctionality}
Constructor TTBase2DVisualizationFunctionality.Create;
begin
Inherited;
RemotedFunctionality:=TTBase2DVisualizationFunctionalityRemoted.Create(Self);
end;

Destructor TTBase2DVisualizationFunctionality.Destroy;
begin
RemotedFunctionality.Free;
Inherited;
end;

function TTBase2DVisualizationFunctionality.CreateInstanceEx(pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer;
begin
Result:=RemotedFunctionality.CreateInstanceEx(ptrOwner);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TTBase2DVisualizationFunctionality.CreateObj(pReflector: TAbstractReflector; pObjectVisualization: TObjectVisualization; const flAbsoluteCoords: boolean; const idTObj,idObj: integer; ptrOwner: TPtr): TPtr;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TTBase2DVisualizationFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TTBase2DVisualizationFunctionality.DestroyObj(const ptrDestrObj: TPtr);
begin
Raise Exception.Create(SNotSupported); //. =>
end;

function TTBase2DVisualizationFunctionality.getReflector: TAbstractReflector;
begin
if (FReflector <> nil) then Result:=FReflector else Result:=TypeSystem.TypesSystem.Reflector;
end;

procedure TTBase2DVisualizationFunctionality.setReflector(Value: TAbstractReflector);
begin
FReflector:=Value;
end;

procedure TTBase2DVisualizationFunctionality.GetDisproportionObjects(const Factor: double; out ObjectsList: TByteArray);
begin
RemotedFunctionality.GetDisproportionObjects(Factor,{out} ObjectsList);
end;


{TBase2DVisualizationFunctionality}
Constructor TBase2DVisualizationFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited;
RemotedFunctionality:=TBase2DVisualizationFunctionalityRemoted.Create(Self);
end;

Destructor TBase2DVisualizationFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;

function TBase2DVisualizationFunctionality.ReflectOnCanvas(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean;  
begin
Result:=Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,nil);
end;

procedure TBase2DVisualizationFunctionality.CreateClone(const ptrObj: TPtr; const ptrCloneOwner: TPtr; out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;

function TBase2DVisualizationFunctionality.getIdLay: integer;
begin
Result:=RemotedFunctionality.getIdLay;
end;

function TBase2DVisualizationFunctionality.getWidth: Double;
begin
Result:=RemotedFunctionality.getWidth;
end;

procedure TBase2DVisualizationFunctionality.setWidth(Value: Double);
begin
RemotedFunctionality.setWidth(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TBase2DVisualizationFunctionality.getflUserSecurity: boolean;
begin
Result:=RemotedFunctionality.getflUserSecurity;
end;

procedure TBase2DVisualizationFunctionality.setflUserSecurity(Value: boolean);
begin
RemotedFunctionality.setflUserSecurity(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TBase2DVisualizationFunctionality.getflDetailsNoIndex: boolean;
begin
Result:=RemotedFunctionality.getflDetailsNoIndex;
end;

procedure TBase2DVisualizationFunctionality.setflDetailsNoIndex(Value: boolean);
begin
RemotedFunctionality.setflDetailsNoIndex(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TBase2DVisualizationFunctionality.getflNotifyOwnerOnChange: boolean;
begin
Result:=RemotedFunctionality.getflNotifyOwnerOnChange();
end;

procedure TBase2DVisualizationFunctionality.setflNotifyOwnerOnChange(Value: boolean);
begin
RemotedFunctionality.setflNotifyOwnerOnChange(Value);
//. update local TypesSystem and representations
Space.StayUpToDate();
end;

procedure TBase2DVisualizationFunctionality.GetLayInfo(out Lay,SubLay: integer);
begin
RemotedFunctionality.GetLayInfo(Lay,SubLay);
end;

function TBase2DVisualizationFunctionality.GetDetailsList(out DetailsList: TComponentsList): boolean;
var
  Obj: TSpaceObj;
  ptrOwnerObj: TPtr;
begin
Result:=false;
Space.ReadObj(Obj,SizeOf(Obj), Ptr);
//. process
ptrOwnerObj:=Obj.ptrListOwnerObj;
if (ptrOwnerObj = nilPtr) then Exit; //. ->
DetailsList:=TComponentsList.Create;
try
repeat
  DetailsList.AddComponent(Space.Obj_idType(ptrOwnerObj),Space.Obj_ID(ptrOwnerObj),0);
  Space.ReadObj(ptrOwnerObj,SizeOf(TPtr), ptrOwnerObj);
until ptrOwnerObj = nilPtr;
Result:=true;
except
  DetailsList.Destroy;
  Raise; //. =>
  end;
end;

function TBase2DVisualizationFunctionality.getReflector: TAbstractReflector;
begin
if (FReflector <> nil) then Result:=FReflector else Result:=TypeSystem.TypesSystem.Reflector;
end;

procedure TBase2DVisualizationFunctionality.setReflector(Value: TAbstractReflector);
begin
FReflector:=Value;
end;

function TBase2DVisualizationFunctionality.ReflectAsNotLoaded(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pCanvas: TCanvas): boolean;

  function Refl: boolean;
  var
    WMF: TMetaFile;
    X0,Y0,X1,Y1: Double;
    diffX1X0,diffY1Y0: Double;
    _Width: Double;
    Alfa: Double;
    b: Double;
    V: Double;
    S0_X3,S0_Y3: Double;
    S1_X3,S1_Y3: Double;
    Xc,Yc: integer;
    CosAlfa,SinAlfa: Double;
    XF: XFORM;
  begin
  Result:=false;
  try
  WMF:=TMetaFile.Create;
  try
  WMF.LoadFromFile(Space.WorkLocale+'\'+PathLib+'\WMF'+'\'+'NotLoaded.wmf');
  with pFigure do begin
  //.
  X0:=Nodes[0].X;Y0:=Nodes[0].Y;
  X1:=Nodes[1].X;Y1:=Nodes[1].Y;
  diffX1X0:=X1-X0;
  diffY1Y0:=Y1-Y0;
  _Width:=Sqrt(sqr(diffX1X0)+sqr(diffY1Y0));
  if (diffX1X0 > 0) AND (diffY1Y0 >= 0)
   then Alfa:=2*PI+ArcTan(-diffY1Y0/diffX1X0)
   else
    if (diffX1X0 < 0) AND (diffY1Y0 > 0)
     then Alfa:=PI+ArcTan(-diffY1Y0/diffX1X0)
     else
      if (diffX1X0 < 0) AND (diffY1Y0 <= 0)
       then Alfa:=PI+ArcTan(-diffY1Y0/diffX1X0)
       else
        if (diffX1X0 > 0) AND (diffY1Y0 < 0)
         then Alfa:=ArcTan(-diffY1Y0/diffX1X0)
         else
          if diffY1Y0 > 0
           then Alfa:=3*PI/2
           else Alfa:=PI/2;
  b:=(Width*pReflectionWindow.Scale);
  if Abs(diffY1Y0) > Abs(diffX1X0)
   then begin
    V:=(b/2)/Sqrt(1+Sqr(diffX1X0/diffY1Y0));
    S0_X3:=(V)+X0;
    S0_Y3:=(-V)*(diffX1X0/diffY1Y0)+Y0;
    S1_X3:=(-V)+X0;
    S1_Y3:=(V)*(diffX1X0/diffY1Y0)+Y0;
    end
   else begin
    V:=(b/2)/Sqrt(1+Sqr(diffY1Y0/diffX1X0));
    S0_Y3:=(V)+Y0;
    S0_X3:=(-V)*(diffY1Y0/diffX1X0)+X0;
    S1_Y3:=(-V)+Y0;
    S1_X3:=(V)*(diffY1Y0/diffX1X0)+X0;
    end;
  if (3*PI/4 <= Alfa) AND (Alfa < 7*PI/4)
   then begin Xc:=Round(S0_X3);Yc:=Round(S0_Y3) end
   else begin Xc:=Round(S1_X3);Yc:=Round(S1_Y3) end;
  Alfa:=-Alfa;
  CosAlfa:=Cos(Alfa);
  SinAlfa:=Sin(Alfa);
  //. reflecting
  SetGraphicsMode(pCanvas.Handle,GM_ADVANCED);
  pReflectionWindow.Lock.Enter;
  try
  XF.eDx:=Xc{///- -pReflectionWindow.Xmn};
  XF.eDy:=Yc{///- -pReflectionWindow.Ymn};
  finally
  pReflectionWindow.Lock.Leave;
  end;
  XF.eM11:=CosAlfa;
  XF.eM12:=SinAlfa;
  XF.eM21:=-SinAlfa;
  XF.eM22:=CosAlfa;
  SetWorldTransForm(pCanvas.Handle,XF);
  XF.eDx:=0;
  XF.eDy:=0;
  XF.eM11:=_Width/WMF.Width;
  XF.eM12:=0;
  XF.eM21:=0;
  XF.eM22:=b/WMF.Height;
  ModifyWorldTransForm(pCanvas.Handle,XF,MWT_LEFTMULTIPLY);
  pCanvas.Draw(0,0,WMF);
  Result:=true;
  ModifyWorldTransForm(pCanvas.Handle,XF,MWT_IDENTITY);
  //.
  end;
  finally
  WMF.Destroy;
  end;
  except
    end;
  end;

begin
Result:=Refl;
end;

function TBase2DVisualizationFunctionality.ContainerFilled: boolean;
begin
Result:=false;
end;

procedure TBase2DVisualizationFunctionality.GetProps(out oflagLoop: boolean; out oColor: TColor; out oWidth: Double; out oflagFill: boolean; out oColorFill: TColor);
begin
RemotedFunctionality.GetProps(oflagLoop,oColor,oWidth,oflagFill,oColorFill);
end;

procedure TBase2DVisualizationFunctionality.SetProps(const pflagLoop: boolean; const pColor: TColor; const pWidth: Double; const pflagFill: boolean; const pColorFill: TColor);
begin
RemotedFunctionality.SetProps(pflagLoop,pColor,pWidth,pflagFill,pColorFill);
//. check obj cached state. may be object is visible in reflectors now and state need to be cached
Space.Obj_CheckCachedState(Ptr);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TBase2DVisualizationFunctionality.CreateNode(const CreateNodeIndex: integer; const X,Y: Double);
begin
RemotedFunctionality.CreateNode(CreateNodeIndex, X,Y);
//. check obj cached state. may be object is visible in reflectors now and state need to be cached
Space.Obj_CheckCachedState(Ptr);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TBase2DVisualizationFunctionality.DestroyNode(const DestroyNodeIndex: integer);
begin
RemotedFunctionality.DestroyNode(DestroyNodeIndex);
//. check obj cached state. may be object is visible in reflectors now and state need to be cached
Space.Obj_CheckCachedState(Ptr);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TBase2DVisualizationFunctionality.SetNode(const SetNodeIndex: integer; const newX,newY: Double);
begin
RemotedFunctionality.SetNode(SetNodeIndex,newX,newY);
//. check obj cached state. may be object is visible in reflectors now and state need to be cached
Space.Obj_CheckCachedState(Ptr);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TBase2DVisualizationFunctionality.GetNodes(out Nodes: TByteArray);
begin
RemotedFunctionality.GetNodes(Nodes);
end;

procedure TBase2DVisualizationFunctionality.SetNodes(const Nodes: TByteArray; const pWidth: double);
begin
RemotedFunctionality.SetNodes(Nodes,pWidth);
//. check obj cached state. may be object is visible in reflectors now and state need to be cached
Space.Obj_CheckCachedState(Ptr);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TBase2DVisualizationFunctionality.Move(const dX,dY,dZ: Double);
begin
RemotedFunctionality.Move(dX,dY,dZ);
//. check obj cached state. may be object is visible in reflectors now and state need to be cached
Space.Obj_CheckCachedState(Ptr);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TBase2DVisualizationFunctionality.SetPosition(const X,Y,Z: Double);
begin
RemotedFunctionality.SetPosition(X,Y,Z);
//. check obj cached state. may be object is visible in reflectors now and state need to be cached
Space.Obj_CheckCachedState(Ptr);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TBase2DVisualizationFunctionality.ChangeScale(const Xbind,Ybind: Double; const pScale: Double);
begin
RemotedFunctionality.ChangeScale(Xbind,Ybind,Scale);
//. check obj cached state. may be object is visible in reflectors now and state need to be cached
Space.Obj_CheckCachedState(Ptr);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TBase2DVisualizationFunctionality.Rotate(const Xbind,Ybind: Double; const Angle: Double);
begin
RemotedFunctionality.Rotate(Xbind,Ybind,Angle);
//. check obj cached state. may be object is visible in reflectors now and state need to be cached
Space.Obj_CheckCachedState(Ptr);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TBase2DVisualizationFunctionality.ChangeLay(const NewLayID: integer);
begin
RemotedFunctionality.ChangeLay(NewLayID);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TBase2DVisualizationFunctionality.ChangeOwner(const ptrNewOwner: TPtr);
begin
RemotedFunctionality.ChangeOwner(ptrNewOwner);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TBase2DVisualizationFunctionality.Transform(const Xbind,Ybind: Double; const pScale: Double; const Angle: Double; const dX,dY: Double); stdcall;
begin
RemotedFunctionality.Transform(Xbind,Ybind,pScale,Angle,dX,dY);
//. check obj cached state. may be object is visible in reflectors now and state need to be cached
Space.Obj_CheckCachedState(Ptr);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TBase2DVisualizationFunctionality.CheckPlace(const Xbind,Ybind: Double; const pScale: Double; const Angle: Double; const dX,dY: Double);
begin
RemotedFunctionality.CheckPlace(Xbind,Ybind, pScale, Angle, dX,dY);
end;

function TBase2DVisualizationFunctionality.Square: Double;
begin
Result:=RemotedFunctionality.Square;
end;

function TBase2DVisualizationFunctionality.Square(const ExceptPointPtr: TPtr; const ExceptPointValueX,ExceptPointValueY: TCrd; const NewWidth: Double; const pScale: Double): Double;
begin
Result:=RemotedFunctionality.Square1(ExceptPointPtr, ExceptPointValueX,ExceptPointValueY,  NewWidth,pScale);
end;

function TBase2DVisualizationFunctionality.GetFormatNodes(out NodesList: TList; out SizeX,SizeY: integer): boolean;
begin
Result:=false;
end;

procedure TBase2DVisualizationFunctionality.GetInsideObjectsList(out List: TComponentsList);
var
  BA: TByteArray;
  Item: TItemComponentsList;
  I: integer;
begin
RemotedFunctionality.GetInsideObjectsList(BA);
List:=TComponentsList.Create;
try
for I:=0 to (Length(BA) DIV SizeOf(TItemComponentsList))-1  do begin
  Item:=TItemComponentsList(Pointer(Integer(@BA[0])+I*SizeOf(TItemComponentsList))^);
  List.AddComponent(Item.idTComponent,Item.idComponent,Item.id);
  end;
except
  List.Destroy;
  List:=nil;
  Raise; //. =>
  end;
end;


// Слой 2D-визуализации
{TSystemTLay2DVisualization}
Constructor TSystemTLay2DVisualization.Create;
begin
CreateNew(idTLay2DVisualization,tnTLay2DVisualization,TTLay2DVisualizationFunctionality);
if (Enabled) then Cash:=TTLay2DVisualizationCash.Create(Self);
end;

Destructor TSystemTLay2DVisualization.Destroy;
begin
Cash.Free;
Inherited;
end;

procedure TSystemTLay2DVisualization.Initialize;
begin
if (Cash <> nil) then Cash.Update;
end;

procedure TSystemTLay2DVisualization.DoOnComponentOperationLocal(const idTObj,idObj: integer; const Operation: TComponentOperation);
begin
Inherited;
end;

procedure TSystemTLay2DVisualization.Caching_Start;
begin
end;

procedure TSystemTLay2DVisualization.Caching_AddObject(const idObj: integer);
begin
CachingList.Add(Pointer(idObj));
end;

procedure TSystemTLay2DVisualization.Caching_Finish;
var
  List: TList;
  LockedList: TList;
  I: integer;
begin
List:=TList.Create;
try
LockedList:=CachingList.LockList;
try
List.Capacity:=LockedList.Capacity;
for I:=0 to LockedList.Count-1 do List.Add(LockedList[I]);
LockedList.Clear;
finally
CachingList.UnLockList;
end;
if (List.Count > 0) then Cash.UpdateByObjectsList(List);
finally
List.Destroy;
end;
end;

function TSystemTLay2DVisualization.Context_IsItemExist(const idComponent: integer): boolean;
begin
if (Cash = nil)
 then begin
  Result:=false;
  Exit; //. ->
  end;
Result:=(Cash.GetPtrItem(idComponent) <> nil);
end;

procedure TSystemTLay2DVisualization.Context_GetItems(out IDs: TIDArray);
begin
if (Cash = nil)
 then begin
  SetLength(IDs,0);
  Exit; //. ->
  end;
Cash.GetItemsIDs(IDs);
end;

procedure TSystemTLay2DVisualization.AddInvisibleLaysToNumbersArray(const Scale: Extended; var LayNumbersArray: TByteArray);
var
  OrgCnt,ResCnt,ActualCnt: word;
  ptrItem: pointer;
  LayNumber: word;
  flAlreadyFound: boolean;
  p: pointer;
  I: integer;
begin
if (Length(LayNumbersArray) <> 0)
 then begin
  OrgCnt:=Word(Pointer(@LayNumbersArray[0])^);
  end
 else OrgCnt:=0;
//.
Lock.Enter;
try
with Cash do begin
ResCnt:=OrgCnt+ItemsCount;
SetLength(LayNumbersArray,SizeOf(ResCnt)+ResCnt*SizeOf(LayNumber));
ActualCnt:=OrgCnt;
ptrItem:=FItems;
while (ptrItem <> nil) do with TItemTLay2DVisualizationCash(ptrItem^) do begin
  if (((VisibleMinScale <> 0.0) AND (Scale < VisibleMinScale)) OR ((VisibleMaxScale <> 0.0) AND (Scale > VisibleMaxScale)))
   then begin
    LayNumber:=Number;
    flAlreadyFound:=false;
    if (OrgCnt > 0)
     then begin
      p:=Pointer(@LayNumbersArray[0+SizeOf(OrgCnt)]);
      for I:=0 to OrgCnt-1 do begin
        if (Word(p^) = LayNumber)
         then begin
          flAlreadyFound:=true;
          Break; //. >
          end;
        Inc(DWord(p),SizeOf(LayNumber));
        end;
      end;
    if (NOT flAlreadyFound)
     then begin
      p:=Pointer(@LayNumbersArray[0+SizeOf(OrgCnt)+ActualCnt*SizeOf(LayNumber)]);
      Word(p^):=LayNumber;
      Inc(ActualCnt);
      end;
    end;
  //.
  ptrItem:=ptrNext;
  end;
SetLength(LayNumbersArray,SizeOf(ActualCnt)+ActualCnt*SizeOf(LayNumber));
Word(Pointer(@LayNumbersArray[0])^):=ActualCnt;
end;
finally
Lock.Leave;
end;
end;


//. TTLay2DVisualizationCash
Constructor TTLay2DVisualizationCash.Create(pTypeSystem: TTypeSystem);
begin
Inherited;
FItems:=nil;
ItemsCount:=0;
end;

destructor TTLay2DVisualizationCash.Destroy;
begin
Empty;
Inherited;
end;

procedure TTLay2DVisualizationCash.Empty;
var
  ptrDelItem: pointer;
begin
TypeSystem.Lock.Enter;
try
while (FItems <> nil) do begin
  ptrDelItem:=FItems;
  FItems:=TItemTLay2DVisualizationCash(ptrDelItem^).ptrNext;
  SetLength(TItemTLay2DVisualizationCash(ptrDelItem^).Name,0);
  FreeMem(ptrDelItem,SizeOf(TItemTLay2DVisualizationCash));
  end;
ItemsCount:=0;
finally
TypeSystem.Lock.Leave;
end;
end;

procedure TTLay2DVisualizationCash.UpdateByObjectsList(List: TList);
var
  I: integer;
  ptrNewItem: pointer;
  CF: TLay2DVisualizationFunctionality;
  DS: TMemoryStream;
  CDT: TComponentFileType;
  ptrActionsGroup: pointer;
  ItemsList: TList;
begin
if (List.Count = 0) then Exit; //. ->
if NOT Space.flActionsGroupCall OR (List.Count = 1)
 then
  for I:=0 to List.Count-1 do begin
    GetMem(ptrNewItem,SizeOf(TItemTLay2DVisualizationCash));
    try
    FillChar(ptrNewItem^,SizeOf(TItemTLay2DVisualizationCash), 0);
    with TItemTLay2DVisualizationCash(ptrNewItem^) do begin
    Name:='';
    Number:=0;
    VisibleMinScale:=0;
    VisibleMaxScale:=0;
    CF:=TLay2DVisualizationFunctionality(TComponentFunctionality_Create(TypeSystem.idType,Integer(List[I])));
    try
    idObj:=CF.idObj;
    CF.GetParams({out} Name,Number,VisibleMinScale,VisibleMaxScale);
    finally
    CF.Release;
    end;
    end;
    except
      On E: Exception do EventLog.WriteMinorEvent('UpdateByObjectList','Item of '+TypeSystem.TableName+' (ID: '+IntToStr(Integer(List[I]))+') could not be cached',E.Message);
      end;
    TypeSystem.Lock.Enter;
    try
    TItemTLay2DVisualizationCash(ptrNewItem^).ptrNext:=FItems;
    FItems:=ptrNewItem;
    Inc(ItemsCount);
    finally
    TypeSystem.Lock.Leave;
    end;
    end
 else begin
  ItemsList:=TList.Create;
  try
  ItemsList.Capacity:=List.Count;
  ptrActionsGroup:=ActionsGroups.ActionsGroup_Start(GetCurrentThreadID);
  try
  for I:=0 to List.Count-1 do begin
    GetMem(ptrNewItem,SizeOf(TItemTLay2DVisualizationCash));
    try
    FillChar(ptrNewItem^,SizeOf(TItemTLay2DVisualizationCash), 0);
    with TItemTLay2DVisualizationCash(ptrNewItem^) do begin
    Name:='';
    Number:=0;
    VisibleMinScale:=0;
    VisibleMaxScale:=0;
    CF:=TLay2DVisualizationFunctionality(TComponentFunctionality_Create(TypeSystem.idType,Integer(List[I])));
    try
    idObj:=CF.idObj;
    try CF.GetParams({out} Name,Number,VisibleMinScale,VisibleMaxScale); except on E: EActionsGroup do ; else Raise; end;
    finally
    CF.Release;
    end;
    end;
    except
      On E: Exception do EventLog.WriteMinorEvent('UpdateByObjectList','Item of '+TypeSystem.TableName+' (ID: '+IntToStr(Integer(List[I]))+') could not be prepared for caching',E.Message);
      end;
    ItemsList.Add(ptrNewItem);
    end;
  ActionsGroups.ActionsGroup_Finish(ptrActionsGroup);
  for I:=0 to ItemsList.Count-1 do with TItemTLay2DVisualizationCash(ItemsList[I]^) do with TLay2DVisualizationFunctionality(TComponentFunctionality_Create(TypeSystem.idType,idObj)) do
    try
    try
    with TItemTLay2DVisualizationCash(ItemsList[I]^) do GetParams({out} Name,Number,VisibleMinScale,VisibleMaxScale);
    except
      On E: Exception do EventLog.WriteMinorEvent('UpdateByObjectList','Item of '+TypeSystem.TableName+' (ID: '+IntToStr(Integer(List[I]))+') could not be cached',E.Message);
      end;
    finally
    Release;
    end;
  finally
  ActionsGroups.ActionsGroup_End(ptrActionsGroup);
  end;
  TypeSystem.Lock.Enter;
  try
  for I:=0 to ItemsList.Count-1 do if (ItemsList[I] <> nil) then begin
    TItemTLay2DVisualizationCash(ItemsList[I]^).ptrNext:=FItems;
    FItems:=ItemsList[I];
    end;
  Inc(ItemsCount,ItemsList.Count);
  finally
  TypeSystem.Lock.Leave;
  end;
  finally
  ItemsList.Destroy;
  end;
  end;
end;

procedure TTLay2DVisualizationCash.Update;
begin
Empty();
end;

function TTLay2DVisualizationCash.GetItem(const pidObj: integer; out ptrItem: pointer): boolean;
begin
Result:=false;
ptrItem:=GetPtrItem(pidObj);
if (ptrItem = nil)
 then begin
  {/// ? UpdateLocal(idObj,opCreate);
  ptrItem:=FItems; //. because new item always placed at begin}
  Exit; //. ->
  end;
Result:=true;
end;

function TTLay2DVisualizationCash.GetPtrItem(const pidObj: integer): pointer;
var
  ptrptrItem: pointer;
begin
TypeSystem.Lock.Enter;
try
Result:=nil;
ptrptrItem:=@FItems;
while Pointer(ptrptrItem^) <> nil do with TItemTLay2DVisualizationCash(Pointer(ptrptrItem^)^) do begin
  if (idObj = pidObj)
   then begin
    Result:=Pointer(ptrptrItem^);
    Pointer(ptrptrItem^):=ptrNext;
    TItemTLay2DVisualizationCash(Result^).ptrNext:=FItems;
    FItems:=Result;
    Exit;
    end;
  ptrptrItem:=@ptrNext;
  end;
{Result:=FItems;
while Result <> nil do with TItemTLay2DVisualizationCash(Result^) do begin
  if idObj = pidObj then Exit;
  Result:=ptrNext;
  end;}
finally
TypeSystem.Lock.Leave;
end;
end;

procedure TTLay2DVisualizationCash.GetItemsIDs(out IDs: TIDArray);
var
  ptrItem: pointer;
  TempList: TList;
  I: integer;
begin
TempList:=TList.Create;
try
TempList.Capacity:=1024; //. inital size
TypeSystem.Lock.Enter;
try
ptrItem:=FItems;
while (ptrItem <> nil) do with TItemTLay2DVisualizationCash(ptrItem^) do begin
  TempList.Add(Pointer(idObj));
  //. next item
  ptrItem:=ptrNext;
  end;
finally
TypeSystem.Lock.Leave;
end;
SetLength(IDs,TempList.Count);
for I:=0 to TempList.Count-1 do IDs[I]:=Integer(TempList[I]);
finally
TempList.Destroy;
end;
end;

{//. blocking update procedure TTLay2DVisualizationCash.UpdateLocal(const pidObj: integer; const Operation: TComponentOperation);

  procedure UpdateItem(const ptrItem: pointer);
  var
    CF: TLay2DVisualizationFunctionality;
  begin
  with TItemTLay2DVisualizationCash(ptrItem^) do begin
  //. updating item
  CF:=TLay2DVisualizationFunctionality(TComponentFunctionality_Create(TypeSystem.idType,idObj));
  try
  CF.GetParams(Name,Number,VisibleMinScale,VisibleMaxScale);
  finally
  CF.Release;
  end;
  end;
  end;

var
  ptrNewItem: pointer;
  ptrUpdateItem: pointer;
begin
TypeSystem.Lock.Enter;
try
case Operation of
opCreate: begin
  GetMem(ptrNewItem,SizeOf(TItemTLay2DVisualizationCash));
  FillChar(ptrNewItem^,SizeOf(TItemTLay2DVisualizationCash), 0);
  with TItemTLay2DVisualizationCash(ptrNewItem^) do begin
  ptrNext:=FItems;
  idObj:=pidObj;
  Name:='';
  Number:=0;
  VisibleMinScale:=0;
  VisibleMaxScale:=0;
  end;
  UpdateItem(ptrNewItem);
  FItems:=ptrNewItem;
  Inc(ItemsCount);
  end;
opUpdate: begin
  ptrUpdateItem:=GetPtrItem(pidObj);
  if (ptrUpdateItem <> nil)
   then UpdateItem(ptrUpdateItem)
   else begin
    GetMem(ptrNewItem,SizeOf(TItemTLay2DVisualizationCash));
    FillChar(ptrNewItem^,SizeOf(TItemTLay2DVisualizationCash), 0);
    with TItemTLay2DVisualizationCash(ptrNewItem^) do begin
    ptrNext:=FItems;
    idObj:=pidObj;
    Name:='';
    Number:=0;
    VisibleMinScale:=0;
    VisibleMaxScale:=0;
    end;
    UpdateItem(ptrNewItem);
    FItems:=ptrNewItem;
    Inc(ItemsCount);
    end;
  end;
opDestroy: begin
  RemoveItem(pidObj);
  end;
end;
finally
TypeSystem.Lock.Leave;
end;
end;}

procedure TTLay2DVisualizationCash.UpdateLocal(const pidObj: integer; const Operation: TComponentOperation);

  procedure UpdateItem(const ptrItem: pointer);
  var
    CF: TLay2DVisualizationFunctionality;
  begin
  with TItemTLay2DVisualizationCash(ptrItem^) do begin
  //. updating item
  CF:=TLay2DVisualizationFunctionality(TComponentFunctionality_Create(TypeSystem.idType,idObj));
  try
  CF.GetParams({out} Name,Number,VisibleMinScale,VisibleMaxScale);
  finally
  CF.Release;
  end;
  end;
  end;

  procedure CopyToItem(const ptrItem: pointer; var Item: TItemTLay2DVisualizationCash);
  begin
  Item:=TItemTLay2DVisualizationCash(ptrItem^);
  //. copy item reference fields
  Item.Name:=TItemTLay2DVisualizationCash(ptrItem^).Name;
  end;

  procedure MoveItem(const Item: TItemTLay2DVisualizationCash; const ptrItem: pointer);
  begin
  with TItemTLay2DVisualizationCash(ptrItem^) do begin
  Name:=Item.Name;
  Number:=Item.Number;
  VisibleMinScale:=Item.VisibleMinScale;
  VisibleMaxScale:=Item.VisibleMaxScale;
  end;
  end;

  procedure FreeItem(var Item: TItemTLay2DVisualizationCash);
  begin
  SetLength(Item.Name,0);
  end;
  
var
  ptrNewItem: pointer;
  ptrUpdateItem: pointer;
  Item: TItemTLay2DVisualizationCash;
begin
case Operation of
opCreate: begin
  GetMem(ptrNewItem,SizeOf(TItemTLay2DVisualizationCash));
  FillChar(ptrNewItem^,SizeOf(TItemTLay2DVisualizationCash), 0);
  with TItemTLay2DVisualizationCash(ptrNewItem^) do begin
  idObj:=pidObj;
  Name:='';
  Number:=0;
  VisibleMinScale:=0.0;
  VisibleMaxScale:=0.0;
  end;
  UpdateItem(ptrNewItem);
  //.
  TypeSystem.Lock.Enter;
  try
  TItemTLay2DVisualizationCash(ptrNewItem^).ptrNext:=FItems;
  FItems:=ptrNewItem;
  Inc(ItemsCount);
  finally
  TypeSystem.Lock.Leave;
  end;
  end;
opUpdate: begin
  TypeSystem.Lock.Enter;
  try
  ptrUpdateItem:=GetPtrItem(pidObj);
  if (ptrUpdateItem <> nil) then CopyToItem(ptrUpdateItem, Item);
  finally
  TypeSystem.Lock.Leave;
  end;
  if (ptrUpdateItem <> nil)
   then begin    
    UpdateItem(@Item);
    //.
    TypeSystem.Lock.Enter;
    try
    ptrUpdateItem:=GetPtrItem(pidObj);
    if (ptrUpdateItem <> nil)
     then MoveItem(Item,ptrUpdateItem)
     else FreeItem(Item);
    finally
    TypeSystem.Lock.Leave;
    end;
    end
   else begin
    GetMem(ptrNewItem,SizeOf(TItemTLay2DVisualizationCash));
    FillChar(ptrNewItem^,SizeOf(TItemTLay2DVisualizationCash), 0);
    with TItemTLay2DVisualizationCash(ptrNewItem^) do begin
    idObj:=pidObj;
    Name:='';
    Number:=0;
    VisibleMinScale:=0.0;
    VisibleMaxScale:=0.0;
    end;
    UpdateItem(ptrNewItem);
    //.
    TypeSystem.Lock.Enter;
    try
    TItemTLay2DVisualizationCash(ptrNewItem^).ptrNext:=FItems;
    FItems:=ptrNewItem;
    Inc(ItemsCount);
    finally
    TypeSystem.Lock.Leave;
    end;
    end;
  end;
opDestroy: begin
  RemoveItem(pidObj);
  end;
end;
end;

procedure TTLay2DVisualizationCash.RemoveItem(const pidObj: integer);
var
  ptrptrDelItem: pointer;
  ptrDelItem: pointer;
begin
TypeSystem.Lock.Enter;
try
ptrptrDelItem:=@FItems;
while Pointer(ptrptrDelItem^) <> nil do with TItemTLay2DVisualizationCash(Pointer(ptrptrDelItem^)^) do begin
  if (idObj = pidObj)
   then begin
    ptrDelItem:=Pointer(ptrptrDelItem^);
    Pointer(ptrptrDelItem^):=TItemTLay2DVisualizationCash(ptrDelItem^).ptrNext;
    Dec(ItemsCount);
    SetLength(TItemTLay2DVisualizationCash(ptrDelItem^).Name,0);
    FreeMem(ptrDelItem,SizeOf(TItemTLay2DVisualizationCash));
    //. remove all the same items Exit; //. ->
    end
   else
    ptrptrDelItem:=@TItemTLay2DVisualizationCash(Pointer(ptrptrDelItem^)^).ptrNext;
  end;
finally
TypeSystem.Lock.Leave;
end;
end;

procedure TTLay2DVisualizationCash.SaveItemsDATA(Document: IXMLDOMDocument; ParentNode: IXMLDOMElement);
var
  ptrItem: pointer;
  ItemNode: IXMLDOMElement;
  //.
  PropNode: IXMLDOMElement;
begin
TypeSystem.Lock.Enter;
try
ptrItem:=FItems;
while (ptrItem <> nil) do with TItemTLay2DVisualizationCash(ptrItem^) do begin
  //. create item
  ItemNode:=Document.CreateElement('ID'+IntToStr(idObj));
  //.
  PropNode:=Document.CreateElement('Name');             PropNode.nodeTypedValue:=Name;            ItemNode.appendChild(PropNode);
  PropNode:=Document.CreateElement('Number');           PropNode.nodeTypedValue:=Number;          ItemNode.appendChild(PropNode);
  PropNode:=Document.CreateElement('VisibleMinScale');  PropNode.nodeTypedValue:=VisibleMinScale; ItemNode.appendChild(PropNode);
  PropNode:=Document.CreateElement('VisibleMaxScale');  PropNode.nodeTypedValue:=VisibleMaxScale; ItemNode.appendChild(PropNode);
  //. add item
  ParentNode.appendChild(ItemNode);
  //. next item
  ptrItem:=ptrNext;
  end;
finally
TypeSystem.Lock.Leave;
end;
end;

procedure TTLay2DVisualizationCash.LoadItems(Node: IXMLDOMNode);
var
  I: integer;
  ItemNode: IXMLDOMNode;
  id: integer;
  ptrNewItem: pointer;
  //.
  _Name: string;
  _Number: integer;
  _VisibleMinScale: double;
  _VisibleMaxScale: double;
begin
TypeSystem.Lock.Enter;
try
Empty;
for I:=0 to Node.childNodes.length-1 do begin
  ItemNode:=Node.childNodes[I];
  //. get item id
  id:=ExtractID(ItemNode.NodeName);
  //.
  _Name:=ItemNode.selectSingleNode('Name').nodeTypedValue;
  _Number:=ItemNode.selectSingleNode('Number').nodeTypedValue;
  _VisibleMinScale:=ItemNode.selectSingleNode('VisibleMinScale').nodeTypedValue;
  _VisibleMaxScale:=ItemNode.selectSingleNode('VisibleMaxScale').nodeTypedValue;
  //. create new item and insert
  GetMem(ptrNewItem,SizeOf(TItemTLay2DVisualizationCash));
  FillChar(ptrNewItem^,SizeOf(TItemTLay2DVisualizationCash), 0);
  with TItemTLay2DVisualizationCash(ptrNewItem^) do begin
  ptrNext:=FItems;
  idObj:=id;
  //.
  Name:=_Name;
  Number:=_Number;
  VisibleMinScale:=_VisibleMinScale;
  VisibleMaxScale:=_VisibleMaxScale;
  end;
  FItems:=ptrNewItem;
  Inc(ItemsCount);
  end;
finally
TypeSystem.Lock.Leave;
end;
end;


{TTLay2DVisualizationFunctionality}
Constructor TTLay2DVisualizationFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTLay2DVisualization;
RemotedFunctionality:=TTLay2DVisualizationFunctionalityRemoted.Create(Self);
end;

Destructor TTLay2DVisualizationFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;

function TTLay2DVisualizationFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

function TTLay2DVisualizationFunctionality._CreateInstanceEx(pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

function TTLay2DVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TLay2DVisualizationFunctionality.Create(Self, idComponent);
end;

function TTLay2DVisualizationFunctionality.getName: string;
begin
Result:=nmTLay2DVisualization;
end;

function TTLay2DVisualizationFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TypesDef\Lay2DVisualization\Lay2DVisualization.bmp');
  except
    end;
  end;
Result:=FImage;
end;

function TTLay2DVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TObjectVisualization.Create;
end;



{TLay2DVisualizationFunctionality}
Constructor TLay2DVisualizationFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited;
RemotedFunctionality:=TLay2DVisualizationFunctionalityRemoted.Create(Self);
end;

Destructor TLay2DVisualizationFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;

procedure TLay2DVisualizationFunctionality.DestroyData;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TLay2DVisualizationFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TLay2DVisualizationFunctionality.CloneData(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;

function TLay2DVisualizationFunctionality.CanDestroy(out Reason: string): boolean;
var
  ptrObj: TPtr;
  Obj: TSpaceObj;
begin
Result:=Inherited CanDestroy(Reason);
ptrObj:=Ptr;
if ptrObj <> nilPtr
 then begin
  Space.ReadObj(Obj,SizeOf(Obj), ptrObj);
  if Obj.ptrListOwnerObj <> nilPtr
   then begin
    Result:=false;
    Reason:='has own objects';
    end;
  end;
end;

function TLay2DVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TLay2DVisualizationPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TLay2DVisualizationFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

procedure TLay2DVisualizationFunctionality.setName(Value: string);
begin
RemotedFunctionality.setName(Value);
end;

function TLay2DVisualizationFunctionality.getHint: string;
begin
Result:=Name;
end;

function TLay2DVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=Inherited GetOwner(idTOwner,idOwner);
end;

function TLay2DVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
begin
Result:=false;
end;

function TLay2DVisualizationFunctionality.getNumber: integer;
begin
Result:=RemotedFunctionality.getNumber;
end;

procedure TLay2DVisualizationFunctionality.GetObjectPointersList(out List: TList);
var
  ptrLay: TPtr;
  Lay: TSpaceObj;
  ptrLayObj: TPtr;
  Obj: TSpaceObj;
begin
ptrLay:=Ptr;
if (ptrLay = nilPtr) then Raise Exception.Create('lay not found id = '+IntToStr(idObj)); //. =>
Space.ReadObj(Lay,SizeOf(Lay), ptrLay);
ptrLayObj:=Lay.ptrListOwnerObj;
List:=TList.Create;
while (ptrLayObj <> nilPtr) do begin
  Space.ReadObj(Obj,SizeOf(Obj), ptrLayObj);
  if (Obj.idTObj <> idTLay2DVisualization) then List.Add(Pointer(ptrLayObj));
  Space.ReadObj(ptrLayObj,SizeOf(ptrLayObj), ptrLayObj);
  end;
end;

function TLay2DVisualizationFunctionality.isEmpty: boolean;
var
  ObjPtrsList: TList;
begin
GetObjectPointersList(ObjPtrsList);
try
Result:=(ObjPtrsList.Count = 0);
finally
ObjPtrsList.Destroy;
end;
end;

procedure TLay2DVisualizationFunctionality.GetParams(out oName: string; out oVisibleMinScale: Double; out oVisibleMaxScale: Double);
begin
RemotedFunctionality.GetParams({out} oName,oVisibleMinScale,oVisibleMaxScale);
end;

procedure TLay2DVisualizationFunctionality.GetParams(out oName: string; out oNumber: integer; out oVisibleMinScale: Double; out oVisibleMaxScale: Double); 
begin
RemotedFunctionality.GetParams1({out} oName,oNumber,oVisibleMinScale,oVisibleMaxScale);
end;

procedure TLay2DVisualizationFunctionality.SetParams(const pName: string; const pVisibleMinScale: Double; const pVisibleMaxScale: Double);
begin
RemotedFunctionality.SetParams(pName,pVisibleMinScale,pVisibleMaxScale);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;


{$I FunctionalityExportImplementation.inc}



Initialization
Randomize();
//.
TypesSystem:=TTypesSystem.Create;

Finalization
TypesSystem.Free;
end.

