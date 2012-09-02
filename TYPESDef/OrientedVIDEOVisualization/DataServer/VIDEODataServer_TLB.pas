unit VIDEODataServer_TLB;

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
// File generated on 14.03.2004 16:38:14 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Borland\PROJECTS\Model\ServerProxySpace\TYPESDef\OrientedVIDEOVisualization\DataServer\VIDEODataServer.tlb (1)
// LIBID: {FA32AB8E-ECC5-4536-9605-1264C75F8A98}
// LCID: 0
// Helpfile: 
// HelpString: VIDEODataServer Library
// DepndLst: 
//   (1) v2.0 stdole, (D:\WINDOWS\System32\stdole2.tlb)
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
  VIDEODataServerMajorVersion = 1;
  VIDEODataServerMinorVersion = 0;

  LIBID_VIDEODataServer: TGUID = '{FA32AB8E-ECC5-4536-9605-1264C75F8A98}';

  IID_IVIDEODataProvider: TGUID = '{F6027261-EE66-47FF-A372-5A4495BF9D26}';
  CLASS_coVIDEOData: TGUID = '{D159C2C8-CEBE-4051-9C72-3B5AD8839C17}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IVIDEODataProvider = interface;
  IVIDEODataProviderDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  coVIDEOData = IVIDEODataProvider;


// *********************************************************************//
// Interface: IVIDEODataProvider
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {F6027261-EE66-47FF-A372-5A4495BF9D26}
// *********************************************************************//
  IVIDEODataProvider = interface(IDispatch)
    ['{F6027261-EE66-47FF-A372-5A4495BF9D26}']
    procedure GetVideoDataParams(idObj: Integer; out Width: Integer; out Height: Integer; 
                                 out UpdateInterval: Integer; out CompressionTypeID: Integer); safecall;
    procedure GetVideoData(idObj: Integer; out FrameData: PSafeArray; out FrameID: Integer); safecall;
    procedure GetAudioDataParams(idObj: Integer; out Header: PSafeArray; 
                                 out PacketInterval: Integer; out CompressionTypeID: Integer); safecall;
    procedure GetAudioData(idObj: Integer; out Packet: PSafeArray; out PacketID: Integer); safecall;
    procedure Open(idTComponent: Integer; idComponent: Integer; idOperation: Integer; 
                   const UserPassword: WideString); safecall;
    function hasAudio: WordBool; safecall;
    function hasVideo: WordBool; safecall;
  end;

// *********************************************************************//
// DispIntf:  IVIDEODataProviderDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {F6027261-EE66-47FF-A372-5A4495BF9D26}
// *********************************************************************//
  IVIDEODataProviderDisp = dispinterface
    ['{F6027261-EE66-47FF-A372-5A4495BF9D26}']
    procedure GetVideoDataParams(idObj: Integer; out Width: Integer; out Height: Integer; 
                                 out UpdateInterval: Integer; out CompressionTypeID: Integer); dispid 1;
    procedure GetVideoData(idObj: Integer; out FrameData: {??PSafeArray}OleVariant; 
                           out FrameID: Integer); dispid 2;
    procedure GetAudioDataParams(idObj: Integer; out Header: {??PSafeArray}OleVariant; 
                                 out PacketInterval: Integer; out CompressionTypeID: Integer); dispid 3;
    procedure GetAudioData(idObj: Integer; out Packet: {??PSafeArray}OleVariant; 
                           out PacketID: Integer); dispid 4;
    procedure Open(idTComponent: Integer; idComponent: Integer; idOperation: Integer; 
                   const UserPassword: WideString); dispid 5;
    function hasAudio: WordBool; dispid 6;
    function hasVideo: WordBool; dispid 7;
  end;

// *********************************************************************//
// The Class CocoVIDEOData provides a Create and CreateRemote method to          
// create instances of the default interface IVIDEODataProvider exposed by              
// the CoClass coVIDEOData. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CocoVIDEOData = class
    class function Create: IVIDEODataProvider;
    class function CreateRemote(const MachineName: string): IVIDEODataProvider;
  end;

implementation

uses ComObj;

class function CocoVIDEOData.Create: IVIDEODataProvider;
begin
  Result := CreateComObject(CLASS_coVIDEOData) as IVIDEODataProvider;
end;

class function CocoVIDEOData.CreateRemote(const MachineName: string): IVIDEODataProvider;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_coVIDEOData) as IVIDEODataProvider;
end;

end.
