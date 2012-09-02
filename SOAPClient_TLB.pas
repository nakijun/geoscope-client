unit SOAPClient_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : 1.2
// File generated on 02.09.2012 22:12:58 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Borland\PROJECTS\Model\ServerProxySpace\SOAPClient\SOAPClient.tlb (1)
// LIBID: {D5789FBB-32E0-4EB8-B255-A95610F205F9}
// LCID: 0
// Helpfile: 
// HelpString: SOAPClient Library
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINDOWS\system32\stdole2.tlb)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, StdVCL, Variants;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  SOAPClientMajorVersion = 1;
  SOAPClientMinorVersion = 0;

  LIBID_SOAPClient: TGUID = '{D5789FBB-32E0-4EB8-B255-A95610F205F9}';

  IID_IcoSpaceFunctionalServer: TGUID = '{1F73D489-5D6F-4A2E-B418-E4AE6C5D1CDD}';
  CLASS_coSpaceFunctionalServer: TGUID = '{5D30F5A2-35B5-4B37-8EFE-9134BBE62090}';
  IID_IGeoSpaceFunctionality: TGUID = '{8A925853-40C0-405C-9B58-11000750D5A4}';
  IID_IGeoCrdSystemFunctionality: TGUID = '{C0577B68-3CF8-4AA7-A5C3-C254DB11C2E4}';
  IID_ISpaceProvider: TGUID = '{B5504BF5-22C9-4611-8A2D-FBA94E7B8590}';
  IID_IMapFormatObjectFunctionality: TGUID = '{A386957B-7CF7-4182-B166-CA4BC555119F}';
  IID_ICoComponent: TGUID = '{D3453B33-FD0B-4923-BF53-1731C70BDA38}';
  IID_ICoGeoMonitorObjectFunctionality: TGUID = '{C0C32249-C84F-4C96-A237-65DBEA23EB87}';
  IID_IcoAreaNotificationServer: TGUID = '{8FFFDC2D-98B6-467F-B5DD-4E097F736853}';
  CLASS_coSpaceAreaNotificationServer: TGUID = '{3FBB876B-632F-4CA0-941B-84B2B4C496B7}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IcoSpaceFunctionalServer = interface;
  IGeoSpaceFunctionality = interface;
  IGeoCrdSystemFunctionality = interface;
  ISpaceProvider = interface;
  IMapFormatObjectFunctionality = interface;
  ICoComponent = interface;
  ICoGeoMonitorObjectFunctionality = interface;
  IcoAreaNotificationServer = interface;
  IcoAreaNotificationServerDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  coSpaceFunctionalServer = IcoSpaceFunctionalServer;
  coSpaceAreaNotificationServer = IcoAreaNotificationServer;


// *********************************************************************//
// Interface: IcoSpaceFunctionalServer
// Flags:     (256) OleAutomation
// GUID:      {1F73D489-5D6F-4A2E-B418-E4AE6C5D1CDD}
// *********************************************************************//
  IcoSpaceFunctionalServer = interface(IUnknown)
    ['{1F73D489-5D6F-4A2E-B418-E4AE6C5D1CDD}']
    procedure Initialize; safecall;
    procedure Finalize; safecall;
    function Context_VisualizationCount: Integer; safecall;
    function Check(Code: Integer): Integer; safecall;
  end;

// *********************************************************************//
// Interface: IGeoSpaceFunctionality
// Flags:     (256) OleAutomation
// GUID:      {8A925853-40C0-405C-9B58-11000750D5A4}
// *********************************************************************//
  IGeoSpaceFunctionality = interface(IUnknown)
    ['{8A925853-40C0-405C-9B58-11000750D5A4}']
    function ConvertXYToLatLong(const pUserName: WideString; const pUserPassword: WideString; 
                                GeoSpaceID: Integer; X: Double; Y: Double; out Latitude: Double; 
                                out Longitude: Double): WordBool; safecall;
    function ConvertLatLongToXY(const pUserName: WideString; const pUserPassword: WideString; 
                                GeoSpaceID: Integer; Latitude: Double; Longitude: Double; 
                                out X: Double; out Y: Double): WordBool; safecall;
    function ConvertXYToDatumLatLong(const pUserName: WideString; const pUserPassword: WideString; 
                                     GeoSpaceID: Integer; X: Double; Y: Double; DatumID: Integer; 
                                     out Latitude: Double; out Longitude: Double): WordBool; safecall;
    function ConvertDatumLatLongToXY(const pUserName: WideString; const pUserPassword: WideString; 
                                     GeoSpaceID: Integer; DatumID: Integer; Latitude: Double; 
                                     Longitude: Double; out X: Double; out Y: Double): WordBool; safecall;
  end;

// *********************************************************************//
// Interface: IGeoCrdSystemFunctionality
// Flags:     (256) OleAutomation
// GUID:      {C0577B68-3CF8-4AA7-A5C3-C254DB11C2E4}
// *********************************************************************//
  IGeoCrdSystemFunctionality = interface(IUnknown)
    ['{C0577B68-3CF8-4AA7-A5C3-C254DB11C2E4}']
    function ConvertXYToLatLong(const pUserName: WideString; const pUserPassword: WideString; 
                                GeoCrdSystemID: Integer; X: Double; Y: Double; 
                                out Latitude: Double; out Longitude: Double): WordBool; safecall;
    function ConvertLatLongToXY(const pUserName: WideString; const pUserPassword: WideString; 
                                GeoCrdSystemID: Integer; Latitude: Double; Longitude: Double; 
                                out X: Double; out Y: Double): WordBool; safecall;
    function ConvertXYToDatumLatLong(const pUserName: WideString; const pUserPassword: WideString; 
                                     GeoCrdSystemID: Integer; X: Double; Y: Double; 
                                     DatumID: Integer; out Latitude: Double; out Longitude: Double): WordBool; safecall;
    function ConvertDatumLatLongToXY(const pUserName: WideString; const pUserPassword: WideString; 
                                     GeoCrdSystemID: Integer; DatumID: Integer; Latitude: Double; 
                                     Longitude: Double; out X: Double; out Y: Double): WordBool; safecall;
  end;

// *********************************************************************//
// Interface: ISpaceProvider
// Flags:     (256) OleAutomation
// GUID:      {B5504BF5-22C9-4611-8A2D-FBA94E7B8590}
// *********************************************************************//
  ISpaceProvider = interface(IUnknown)
    ['{B5504BF5-22C9-4611-8A2D-FBA94E7B8590}']
    procedure GetSpaceWindowOnBitmap(const pUserName: WideString; const pUserPassword: WideString; 
                                     X0: Double; Y0: Double; X1: Double; Y1: Double; X2: Double; 
                                     Y2: Double; X3: Double; Y3: Double; 
                                     HidedLaysArray: PSafeArray; VisibleFactor: Integer; 
                                     DynamicHintVisibility: Double; Width: Integer; 
                                     Height: Integer; BitmapDataType: Integer; 
                                     out BitmapData: PSafeArray); safecall;
    procedure GetSpaceWindowBitmapObjectAtPosition(const pUserName: WideString; 
                                                   const pUserPassword: WideString; X0: Double; 
                                                   Y0: Double; X1: Double; Y1: Double; X2: Double; 
                                                   Y2: Double; X3: Double; Y3: Double; 
                                                   HidedLaysArray: PSafeArray; 
                                                   VisibleFactor: Integer; 
                                                   DynamicHintVisibility: Double; 
                                                   ActualityInterval_BeginTimestamp: Double; 
                                                   ActualityInterval_EndTimestamp: Double; 
                                                   Width: Integer; Height: Integer; X: Integer; 
                                                   Y: Integer; out ObjectPtr: Integer); safecall;
    procedure GetSpaceWindowOnBitmapSegmented(const pUserName: WideString; 
                                              const pUserPassword: WideString; X0: Double; 
                                              Y0: Double; X1: Double; Y1: Double; X2: Double; 
                                              Y2: Double; X3: Double; Y3: Double; 
                                              HidedLaysArray: PSafeArray; VisibleFactor: Integer; 
                                              DynamicHintVisibility: Double; Width: Integer; 
                                              Height: Integer; DivX: Integer; DivY: Integer; 
                                              SegmentsOrder: Integer; BitmapDataType: Integer; 
                                              flUpdateProxySpace: WordBool; 
                                              out BitmapData: PSafeArray); safecall;
    procedure GetSpaceWindowOnBitmapSegmentedWithHints(const pUserName: WideString; 
                                                       const pUserPassword: WideString; X0: Double; 
                                                       Y0: Double; X1: Double; Y1: Double; 
                                                       X2: Double; Y2: Double; X3: Double; 
                                                       Y3: Double; HidedLaysArray: PSafeArray; 
                                                       VisibleFactor: Integer; 
                                                       DynamicHintVersion: Integer; 
                                                       VisualizationUserData: PSafeArray; 
                                                       ActualityInterval_BeginTimestamp: Double; 
                                                       ActualityInterval_EndTimestamp: Double; 
                                                       Width: Integer; Height: Integer; 
                                                       DivX: Integer; DivY: Integer; 
                                                       SegmentsOrder: Integer; 
                                                       BitmapDataType: Integer; 
                                                       flUpdateProxySpace: WordBool; 
                                                       out BitmapData: PSafeArray; 
                                                       out DynamicHintData: PSafeArray); safecall;
    procedure GetSpaceWindowOnBitmap1(const pUserName: WideString; const pUserPassword: WideString; 
                                      X0: Double; Y0: Double; X1: Double; Y1: Double; X2: Double; 
                                      Y2: Double; X3: Double; Y3: Double; 
                                      HidedLaysArray: PSafeArray; VisibleFactor: Integer; 
                                      DynamicHintVisibility: Double; Width: Integer; 
                                      Height: Integer; BitmapDataType: Integer; 
                                      flUpdateProxySpace: WordBool; out BitmapData: PSafeArray); safecall;
    procedure UpdateProxySpace(const pUserName: WideString; const pUserPassword: WideString); safecall;
    procedure GetSpaceWindowHints(const pUserName: WideString; const pUserPassword: WideString; 
                                  X0: Double; Y0: Double; X1: Double; Y1: Double; X2: Double; 
                                  Y2: Double; X3: Double; Y3: Double; HidedLaysArray: PSafeArray; 
                                  VisibleFactor: Integer; DynamicHintVersion: Integer; 
                                  VisualizationUserData: PSafeArray; 
                                  ActualityInterval_BeginTimestamp: Double; 
                                  ActualityInterval_EndTimestamp: Double; Width: Integer; 
                                  Height: Integer; flUpdateProxySpace: WordBool; 
                                  out DynamicHintData: PSafeArray); safecall;
  end;

// *********************************************************************//
// Interface: IMapFormatObjectFunctionality
// Flags:     (256) OleAutomation
// GUID:      {A386957B-7CF7-4182-B166-CA4BC555119F}
// *********************************************************************//
  IMapFormatObjectFunctionality = interface(IUnknown)
    ['{A386957B-7CF7-4182-B166-CA4BC555119F}']
    procedure Compile(const pUserName: WideString; const pUserPassword: WideString; 
                      idMapFormatObject: Integer); safecall;
    procedure Build(const pUserName: WideString; const pUserPassword: WideString; 
                    idMapFormatObject: Integer; flUsePrototype: WordBool); safecall;
  end;

// *********************************************************************//
// Interface: ICoComponent
// Flags:     (256) OleAutomation
// GUID:      {D3453B33-FD0B-4923-BF53-1731C70BDA38}
// *********************************************************************//
  ICoComponent = interface(IUnknown)
    ['{D3453B33-FD0B-4923-BF53-1731C70BDA38}']
    procedure GetData(const pUserName: WideString; const pUserPassword: WideString; 
                      idCoComponent: Integer; idCoType: Integer; DataType: Integer; 
                      out Data: PSafeArray); safecall;
  end;

// *********************************************************************//
// Interface: ICoGeoMonitorObjectFunctionality
// Flags:     (256) OleAutomation
// GUID:      {C0C32249-C84F-4C96-A237-65DBEA23EB87}
// *********************************************************************//
  ICoGeoMonitorObjectFunctionality = interface(IUnknown)
    ['{C0C32249-C84F-4C96-A237-65DBEA23EB87}']
    procedure GetTrackData(const pUserName: WideString; const pUserPassword: WideString; 
                           idCoGeoMonitorObject: Integer; GeoSpaceID: Integer; BeginTime: Double; 
                           EndTime: Double; DataType: Integer; out Data: PSafeArray); safecall;
  end;

// *********************************************************************//
// Interface: IcoAreaNotificationServer
// Flags:     (320) Dual OleAutomation
// GUID:      {8FFFDC2D-98B6-467F-B5DD-4E097F736853}
// *********************************************************************//
  IcoAreaNotificationServer = interface(IUnknown)
    ['{8FFFDC2D-98B6-467F-B5DD-4E097F736853}']
    procedure Initialize; safecall;
    procedure Finalize; safecall;
    procedure UI_ShowEventsProcessorPanel; safecall;
    function Check(Code: Integer): Integer; safecall;
  end;

// *********************************************************************//
// DispIntf:  IcoAreaNotificationServerDisp
// Flags:     (320) Dual OleAutomation
// GUID:      {8FFFDC2D-98B6-467F-B5DD-4E097F736853}
// *********************************************************************//
  IcoAreaNotificationServerDisp = dispinterface
    ['{8FFFDC2D-98B6-467F-B5DD-4E097F736853}']
    procedure Initialize; dispid 201;
    procedure Finalize; dispid 202;
    procedure UI_ShowEventsProcessorPanel; dispid 203;
    function Check(Code: Integer): Integer; dispid 204;
  end;

// *********************************************************************//
// The Class CocoSpaceFunctionalServer provides a Create and CreateRemote method to          
// create instances of the default interface IcoSpaceFunctionalServer exposed by              
// the CoClass coSpaceFunctionalServer. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CocoSpaceFunctionalServer = class
    class function Create: IcoSpaceFunctionalServer;
    class function CreateRemote(const MachineName: string): IcoSpaceFunctionalServer;
  end;

// *********************************************************************//
// The Class CocoSpaceAreaNotificationServer provides a Create and CreateRemote method to          
// create instances of the default interface IcoAreaNotificationServer exposed by              
// the CoClass coSpaceAreaNotificationServer. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CocoSpaceAreaNotificationServer = class
    class function Create: IcoAreaNotificationServer;
    class function CreateRemote(const MachineName: string): IcoAreaNotificationServer;
  end;

implementation

uses ComObj;

class function CocoSpaceFunctionalServer.Create: IcoSpaceFunctionalServer;
begin
  Result := CreateComObject(CLASS_coSpaceFunctionalServer) as IcoSpaceFunctionalServer;
end;

class function CocoSpaceFunctionalServer.CreateRemote(const MachineName: string): IcoSpaceFunctionalServer;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_coSpaceFunctionalServer) as IcoSpaceFunctionalServer;
end;

class function CocoSpaceAreaNotificationServer.Create: IcoAreaNotificationServer;
begin
  Result := CreateComObject(CLASS_coSpaceAreaNotificationServer) as IcoAreaNotificationServer;
end;

class function CocoSpaceAreaNotificationServer.CreateRemote(const MachineName: string): IcoAreaNotificationServer;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_coSpaceAreaNotificationServer) as IcoAreaNotificationServer;
end;

end.
