unit ServiceMonitor_TLB;

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
// File generated on 31.10.2007 12:58:24 from Type Library described below.

// ************************************************************************  //
// Type Lib: D:\My\MODEL\ServiceMonitor\ServiceMonitor.tlb (1)
// LIBID: {39DE718E-B8B9-4F32-A7D9-9705650D93B0}
// LCID: 0
// Helpfile: 
// HelpString: ServiceMonitor Library
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
  ServiceMonitorMajorVersion = 1;
  ServiceMonitorMinorVersion = 0;

  LIBID_ServiceMonitor: TGUID = '{39DE718E-B8B9-4F32-A7D9-9705650D93B0}';

  IID_IcoServiceMonitor: TGUID = '{4DC1B84A-6315-44DD-89CE-DB75C3C257BC}';
  CLASS_coServiceMonitor: TGUID = '{DE19CBBE-886D-475F-B39C-7924911C7C08}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IcoServiceMonitor = interface;
  IcoServiceMonitorDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  coServiceMonitor = IcoServiceMonitor;


// *********************************************************************//
// Interface: IcoServiceMonitor
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {4DC1B84A-6315-44DD-89CE-DB75C3C257BC}
// *********************************************************************//
  IcoServiceMonitor = interface(IDispatch)
    ['{4DC1B84A-6315-44DD-89CE-DB75C3C257BC}']
    function RegisterServer(const ServerName: WideString; QoS_SendInterval: Integer): Integer; safecall;
    procedure UnregisterServer(ServerID: Integer); safecall;
    procedure WriteEvent(ServerID: Integer; Severity: Integer; const Source: WideString; 
                         const EventMessage: WideString; const EventInfo: WideString; 
                         EventID: Integer; EventTypeID: Integer); safecall;
    procedure SendQoS(ServerID: Integer; QoS: Double); safecall;
  end;

// *********************************************************************//
// DispIntf:  IcoServiceMonitorDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {4DC1B84A-6315-44DD-89CE-DB75C3C257BC}
// *********************************************************************//
  IcoServiceMonitorDisp = dispinterface
    ['{4DC1B84A-6315-44DD-89CE-DB75C3C257BC}']
    function RegisterServer(const ServerName: WideString; QoS_SendInterval: Integer): Integer; dispid 201;
    procedure UnregisterServer(ServerID: Integer); dispid 202;
    procedure WriteEvent(ServerID: Integer; Severity: Integer; const Source: WideString; 
                         const EventMessage: WideString; const EventInfo: WideString; 
                         EventID: Integer; EventTypeID: Integer); dispid 203;
    procedure SendQoS(ServerID: Integer; QoS: Double); dispid 204;
  end;

// *********************************************************************//
// The Class CocoServiceMonitor provides a Create and CreateRemote method to          
// create instances of the default interface IcoServiceMonitor exposed by              
// the CoClass coServiceMonitor. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CocoServiceMonitor = class
    class function Create: IcoServiceMonitor;
    class function CreateRemote(const MachineName: string): IcoServiceMonitor;
  end;

implementation

uses ComObj;

class function CocoServiceMonitor.Create: IcoServiceMonitor;
begin
  Result := CreateComObject(CLASS_coServiceMonitor) as IcoServiceMonitor;
end;

class function CocoServiceMonitor.CreateRemote(const MachineName: string): IcoServiceMonitor;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_coServiceMonitor) as IcoServiceMonitor;
end;

end.
