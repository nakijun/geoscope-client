unit MODELServerUsageMonitor_TLB;

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

// PASTLWTR : $Revision:   1.130.3.0.1.0  $
// File generated on 29.10.2003 16:50:09 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Borland\PROJECTS\Model\ServerSpace\ServerManager\ServerUsage\MODELServerUsageMonitor.tlb (1)
// LIBID: {0029CAA9-04C1-4690-8128-53130CEF77CA}
// LCID: 0
// Helpfile: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINDOWS\System32\STDOLE2.TLB)
//   (2) v4.0 StdVCL, (C:\WINDOWS\system32\stdvcl40.dll)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}

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
  MODELServerUsageMonitorMajorVersion = 1;
  MODELServerUsageMonitorMinorVersion = 0;

  LIBID_MODELServerUsageMonitor: TGUID = '{0029CAA9-04C1-4690-8128-53130CEF77CA}';

  IID_IMODELServerStatistics: TGUID = '{7F0D20E7-F0C7-4081-985F-636EC42E8906}';
  CLASS_coMODELServerStatistics: TGUID = '{999DF73C-BFBB-4773-8AC6-54190AA4EB8B}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IMODELServerStatistics = interface;
  IMODELServerStatisticsDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  coMODELServerStatistics = IMODELServerStatistics;


// *********************************************************************//
// Interface: IMODELServerStatistics
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {7F0D20E7-F0C7-4081-985F-636EC42E8906}
// *********************************************************************//
  IMODELServerStatistics = interface(IDispatch)
    ['{7F0D20E7-F0C7-4081-985F-636EC42E8906}']
    procedure GetCPUUsage(out UsagePct: Integer); safecall;
    procedure GetHDDUsage(out UsagePct: Integer); safecall;
    procedure GetMEMUsage(out UsagePct: Integer); safecall;
  end;

// *********************************************************************//
// DispIntf:  IMODELServerStatisticsDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {7F0D20E7-F0C7-4081-985F-636EC42E8906}
// *********************************************************************//
  IMODELServerStatisticsDisp = dispinterface
    ['{7F0D20E7-F0C7-4081-985F-636EC42E8906}']
    procedure GetCPUUsage(out UsagePct: Integer); dispid 1;
    procedure GetHDDUsage(out UsagePct: Integer); dispid 2;
    procedure GetMEMUsage(out UsagePct: Integer); dispid 3;
  end;

// *********************************************************************//
// The Class CocoMODELServerStatistics provides a Create and CreateRemote method to          
// create instances of the default interface IMODELServerStatistics exposed by              
// the CoClass coMODELServerStatistics. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CocoMODELServerStatistics = class
    class function Create: IMODELServerStatistics;
    class function CreateRemote(const MachineName: string): IMODELServerStatistics;
  end;

implementation

uses ComObj;

class function CocoMODELServerStatistics.Create: IMODELServerStatistics;
begin
  Result := CreateComObject(CLASS_coMODELServerStatistics) as IMODELServerStatistics;
end;

class function CocoMODELServerStatistics.CreateRemote(const MachineName: string): IMODELServerStatistics;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_coMODELServerStatistics) as IMODELServerStatistics;
end;

end.
