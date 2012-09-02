(*
 * PasLibVlcClassUnit.pas
 *
 * Last modified: 2011.08.22
 *
 * author: Robert Jêdrzejczyk
 * e-mail: robert@prog.olsztyn.pl
 *    www: http://www.prog.olsztyn.pl/paslibvlc
 *
 *)

{$I compiler.inc}

unit PasLibVlcClassUnit;

interface

uses
  {$IFDEF UNIX}
  Unix, LMessages, LCLIntf,
  {$ENDIF}
  {$IFDEF MSWINDOWS}
  Windows,
  {$ENDIF}
  Classes, SysUtils, Controls, ExtCtrls, Graphics,
  {$IFDEF FPC}
  LCLType, LazarusPackageIntf, LResources, Forms, Dialogs,
  {$ELSE}
  Messages,
  {$ENDIF}
  PasLibVlcUnit;

type
  TPasLibVlc = class
  private
    FHandle : libvlc_instance_t_ptr;
    FPath   : WideString;
    
    function GetHandle()    : libvlc_instance_t_ptr;
    function GetError()     : WideString;
    function GetVersion()   : WideString;
    function GetCompiler()  : WideString;
    function GetChangeSet() : WideString;

    procedure SetPath(aPath: WideString);
  public
    constructor Create;
    destructor Destroy; override;

    property Handle    : libvlc_instance_t_ptr read GetHandle;
    property Error     : WideString            read GetError;
    property Version   : WideString            read GetVersion;
    property Compiler  : WideString            read GetCompiler;
    property ChangeSet : WideString            read GetChangeSet;
    property Path      : WideString            read FPath write SetPath;
  end;

  TDeinterlaceFilter = (deOFF, deON);
  TDeinterlaceMode   = (dmDISCARD, dmBLEND, dmMEAN, dmBOB, dmLINEAR, dmX, dmYADIF, dmYADIF2x);

////////////////////////////////////////////////////////////////////////////////

  TPasLibVlcMediaPlayerC = class;
  TPasLibVlcMediaListC = class;
  
  TPasLibVlcMedia = class
  private
    FVLC : TPasLibVlc;
    FMD  : libvlc_media_t_ptr;
  public
    constructor Create(aVLC: TPasLibVlc); overload;
    constructor Create(aVLC: TPasLibVlc; mrl: WideString); overload;
    constructor Create(aVLC: TPasLibVlc; aMD: libvlc_media_t_ptr); overload;
    destructor Destroy; override;

    procedure NewLocation(mrl: WideString);
    procedure NewPath(path: WideString);
    procedure NewNode(name: WideString);

    procedure AddOption(option: String);
    procedure AddOptionFlag(option: String; flag: input_item_option_e);

    function GetMrl(): WideString;

    function Duplicate(): TPasLibVlcMedia;

    function GetMeta(meta: libvlc_meta_t): WideString;
    procedure SetMeta(meta: libvlc_meta_t; value: WideString);
    procedure SaveMeta();

    function GetState(): libvlc_state_t;
    function GetStats(var stats: libvlc_media_stats_t): Boolean;

    function SubItems(): TPasLibVlcMediaListC;

    function GetEventManager(): libvlc_event_manager_t_ptr;

    function GetDuration(): libvlc_time_t;

    procedure Parse();
    procedure ParseAsync();

    function IsParsed(): Boolean;

    procedure SetUserData(data: Pointer);
    function GetUserData(): Pointer;

    function GetTracksInfo(var tracks : libvlc_media_track_info_t_ptr): Integer;

    procedure SetTitleShow(aValue: Boolean);
    procedure SetVideoOnTop(aValue: Boolean);
    procedure SetUseOverlay(aValue: Boolean);
    procedure SetFullScreen(aValue: Boolean);
    procedure SetSnapshotFmt(aValue: string);

    procedure SetDeinterlaceFilter(aValue: TDeinterlaceFilter);
    procedure SetDeinterlaceFilterMode(aValue: TDeinterlaceMode);
    
    property MD : libvlc_media_t_ptr read FMD;
  end;

////////////////////////////////////////////////////////////////////////////////

  TPasLibVlcMediaListC = class
  private
    FVLC: TPasLibVlc;
    FML:  libvlc_media_list_t_ptr;

    FMP: TPasLibVlcMediaPlayerC;
  public
    constructor Create(aVLC: TPasLibVlc); overload;
    constructor Create(aVLC: TPasLibVlc; aML: libvlc_media_list_t_ptr); overload;
    destructor Destroy; override;

    procedure SetMedia(media: TPasLibVlcMedia);
    function GetMedia(): TPasLibVlcMedia;               overload;
    function GetMedia(index: Integer): TPasLibVlcMedia; overload;
    function GetIndex(media: TPasLibVlcMedia): Integer;
    function IsReadOnly(): Boolean;

    procedure Add(mrl: WideString); overload;
    procedure Add(media: TPasLibVlcMedia); overload;
    procedure Insert(media: TPasLibVlcMedia; index: Integer);
    procedure Delete(index: Integer);
    procedure Clear();
    function Count(): Integer;

    procedure Lock();
    procedure UnLock();

    function GetEventManager(): libvlc_event_manager_t_ptr;

    property ML : libvlc_media_list_t_ptr read FML;
    property MI : TPasLibVlcMediaPlayerC read FMP write FMP;
  end;

////////////////////////////////////////////////////////////////////////////////

  TPasLibVlcMediaPlayerC = class
  private
    FTitleShow   : Boolean;
    FVideoOnTop  : Boolean;
    FUseOverlay  : Boolean;
    FSnapShotFmt : string;

    FDeinterlaceFilter: TDeinterlaceFilter;
    FDeinterlaceMode:   TDeinterlaceMode;

  public
    property TitleShow   : Boolean read FTitleShow   write FTitleShow  default FALSE;
    property VideoOnTop  : Boolean read FVideoOnTop  write FVideoOnTop default FALSE;
    property UseOverlay  : Boolean read FUseOverlay  write FUseOverlay default FALSE;
    property SnapShotFmt : string  read FSnapShotFmt write FSnapShotFmt;
    property DeinterlaceFilter: TDeinterlaceFilter read FDeinterlaceFilter write FDeinterlaceFilter default deOFF;
    property DeinterlaceMode:   TDeinterlaceMode   read FDeinterlaceMode   write FDeinterlaceMode   default dmDISCARD;
  end;

////////////////////////////////////////////////////////////////////////////////

type
  TPasLibVlcMouseEventWinCtrl = class(TWinControl)
  private
  {$IFDEF UNIX}
  procedure WMEraseBkgnd(var msg: TLMEraseBkgnd); message LM_EraseBkgnd;
  {$ENDIF}
  {$IFDEF MSWINDOWS}
  procedure WMEraseBkGnd(var msg: TWMEraseBkGnd); message WM_ERASEBKGND;
  {$ENDIF}
  protected
    procedure CreateParams(var params: TCreateParams); override;
  public
  published
    property OnClick;
    property OnDblClick;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
  end;

var
  VLC: TPasLibVlc;
  
implementation

constructor TPasLibVlc.Create;
begin
  inherited Create;
  FHandle := NIL;
end;

destructor TPasLibVlc.Destroy;
begin 
  if (Assigned(libvlc_release)) then
  begin
    if (FHandle <> NIL) then
    begin
      ///??? freezing libvlc_release(FHandle);
    end;
  end;
  inherited Destroy;
end;

function TPasLibVlc.GetHandle() : libvlc_instance_t_ptr;
var
  args : array[0..2] of PAnsiChar;
begin
  Result := NIL;
  if (FHandle = NIL) then
  begin
    if (Path <> '') then
    begin
      libvlc_dynamic_dll_init_with_path(System.UTF8Encode(Path));
      if (libvlc_dynamic_dll_error <> '') then libvlc_dynamic_dll_init();
    end
    else
    begin
      libvlc_dynamic_dll_init();
    end;
    if (libvlc_dynamic_dll_error <> '') then exit;

    args[0] := PAnsiChar(libvlc_dynamic_dll_path);
    args[1] := NIL;//'--ignore-config';
    args[2] := NIL;
    FHandle := libvlc_new(1, @args);
  end;
  Result := FHandle;
end;

function TPasLibVlc.GetError() : WideString;
begin
  Result := '';
  if Assigned(libvlc_errmsg) then
    Result := System.UTF8Decode(StrPas(libvlc_errmsg()))
end;

function TPasLibVlc.GetVersion() : WideString;
begin
  Result := '';
  if Assigned(libvlc_get_version) then
    Result := System.UTF8Decode(StrPas(libvlc_get_version()));
end;

function TPasLibVlc.GetCompiler() : WideString;
begin
  Result := '';
  if Assigned(libvlc_get_compiler) then
    Result := System.UTF8Decode(StrPas(libvlc_get_compiler()));
end;

function TPasLibVlc.GetChangeSet() : WideString;
begin
  Result := '';
  if Assigned(libvlc_get_changeset) then
    Result := System.UTF8Decode(StrPas(libvlc_get_changeset()));
end;

procedure TPasLibVlc.SetPath(aPath: WideString);
begin
  FPath := aPath;
end;

////////////////////////////////////////////////////////////////////////////////

procedure TPasLibVlcMouseEventWinCtrl.CreateParams(var params: TCreateParams);
begin
  inherited CreateParams(params);
  params.ExStyle := params.ExStyle or WS_EX_TRANSPARENT;
end;
{$IFDEF UNIX}
procedure TPasLibVlcMouseEventWinCtrl.WMEraseBkGnd(var msg: TLMEraseBkgnd);
begin
  SetBkMode(msg.DC, TRANSPARENT);
  msg.result := 1;
end;
{$ENDIF}
{$IFDEF MSWINDOWS}
procedure TPasLibVlcMouseEventWinCtrl.WMEraseBkGnd(var msg: TWMEraseBkGnd);
begin
  SetBkMode (msg.DC, TRANSPARENT);
  msg.result := 1;
end;
{$ENDIF}

////////////////////////////////////////////////////////////////////////////////

constructor TPasLibVlcMedia.Create(aVLC: TPasLibVlc);
begin
  inherited Create;
  FVLC := aVLC;
  FMD  := NIL;
end;

constructor TPasLibVlcMedia.Create(aVlc: TPasLibVlc; mrl: WideString);
begin
  inherited Create;
  FVLC := aVLC;
  FMD  := NIL;

  if FileExists(mrl) then
    NewPath(mrl)
  else
    NewLocation(mrl);
end;

constructor TPasLibVlcMedia.Create(aVlc: TPasLibVlc; aMD: libvlc_media_t_ptr);
begin
  inherited Create;
  FVLC := aVLC;
  FMD  := aMD;
end;

destructor TPasLibVlcMedia.Destroy;
begin
  if (FMD <> NIL) then
  begin
    libvlc_media_release(FMD);
  end;
  inherited Destroy;
end;

procedure TPasLibVlcMedia.SetDeinterlaceFilter(aValue: TDeinterlaceFilter);
begin
  case aValue of
    deOFF:  libvlc_media_add_option(FMD, PAnsiChar('deinterlace=0'));
    deON:   libvlc_media_add_option(FMD, PAnsiChar('deinterlace=1'));
  end;
end;

procedure TPasLibVlcMedia.SetDeinterlaceFilterMode(aValue: TDeinterlaceMode);
begin
  case aValue of
    dmDISCARD: libvlc_media_add_option(FMD, PAnsiChar('deinterlace-mode=discard'));
    dmBLEND:   libvlc_media_add_option(FMD, PAnsiChar('deinterlace-mode=blend'));
    dmMEAN:    libvlc_media_add_option(FMD, PAnsiChar('deinterlace-mode=mean'));
    dmBOB:     libvlc_media_add_option(FMD, PAnsiChar('deinterlace-mode=bob'));
    dmLINEAR:  libvlc_media_add_option(FMD, PAnsiChar('deinterlace-mode=linear'));
    dmX:       libvlc_media_add_option(FMD, PAnsiChar('deinterlace-mode=x'));
    dmYADIF:   libvlc_media_add_option(FMD, PAnsiChar('deinterlace-mode=yadif'));
    dmYADIF2x: libvlc_media_add_option(FMD, PAnsiChar('deinterlace-mode=yadif2x'));
  end;
end;

procedure TPasLibVlcMedia.SetTitleShow(aValue: Boolean);
begin
  if aValue then libvlc_media_add_option(FMD, PAnsiChar('video-title-show'))
  else           libvlc_media_add_option(FMD, PAnsiChar('no-video-title-show'));
end;

procedure TPasLibVlcMedia.SetVideoOnTop(aValue: Boolean);
begin
  if aValue then libvlc_media_add_option(FMD, PAnsiChar('video-on-top'))
  else           libvlc_media_add_option(FMD, PAnsiChar('no-video-on-top'));
end;

procedure TPasLibVlcMedia.SetUseOverlay(aValue: Boolean);
begin
  if aValue then libvlc_media_add_option(FMD, PAnsiChar('overlay'))
  else           libvlc_media_add_option(FMD, PAnsiChar('no-overlay'));
end;

procedure TPasLibVlcMedia.SetFullScreen(aValue: Boolean);
begin
  if aValue then libvlc_media_add_option(FMD, PAnsiChar('fullscreen'))
  else           libvlc_media_add_option(FMD, PAnsiChar('no-fullscreen'));
end;

procedure TPasLibVlcMedia.SetSnapshotFmt(aValue: string);
begin
  aValue := AnsiLowerCase(aValue);
  if ((aValue = 'png') or (aValue = 'jpg')) then
  begin
    libvlc_media_add_option(FMD, PAnsiChar('no-snapshot-preview'));
    libvlc_media_add_option(FMD, PAnsiChar('snapshot-format=' + aValue));
  end;
end;

procedure TPasLibVlcMedia.NewLocation(mrl: WideString);
begin
  FMD := libvlc_media_new_location(
    FVLC.Handle,
    PAnsiChar(System.UTF8Encode(mrl)));
end;

procedure TPasLibVlcMedia.NewPath(path: WideString);
begin
  FMD := libvlc_media_new_path(
    FVLC.Handle,
    PAnsiChar(System.UTF8Encode(path)));
end;

procedure TPasLibVlcMedia.NewNode(name: WideString);
begin
  FMD := libvlc_media_new_as_node(
    FVLC.Handle,
    PAnsiChar(System.UTF8Encode(name)));
end;

procedure TPasLibVlcMedia.AddOption(option: String);
begin
  libvlc_media_add_option(FMD, PAnsiChar(option));
end;

procedure TPasLibVlcMedia.AddOptionFlag(option: String; flag: input_item_option_e);
begin
  libvlc_media_add_option_flag(FMD, PAnsiChar(option), flag);
end;

function TPasLibVlcMedia.GetMrl(): WideString;
begin
  Result := System.UTF8Decode(System.UTF8Decode(StrPas(
    libvlc_media_get_mrl(FMD)
  )));
end;

function TPasLibVlcMedia.Duplicate(): TPasLibVlcMedia;
begin
  if (FMD = NIL) then Result := TPasLibVlcMedia.Create(FVLC)
  else Result := TPasLibVlcMedia.Create(FVLC, libvlc_media_duplicate(FMD));
end;

function TPasLibVlcMedia.GetMeta(meta: libvlc_meta_t): WideString;
begin
  Result := System.UTF8Decode(StrPas(
    libvlc_media_get_meta(FMD, meta)
  ));
end;

procedure TPasLibVlcMedia.SetMeta(meta: libvlc_meta_t; value: WideString);
begin
  libvlc_media_set_meta(FMD, meta, PAnsiChar(System.UTF8Encode(value)));
end;

procedure TPasLibVlcMedia.SaveMeta();
begin
  libvlc_media_save_meta(FMD);
end;

function TPasLibVlcMedia.GetState(): libvlc_state_t;
begin
  Result := libvlc_media_get_state(FMD);
end;

function TPasLibVlcMedia.GetStats(var stats: libvlc_media_stats_t): Boolean;
begin
  Result := (
    libvlc_media_get_stats(
      FMD,
      @stats
    ) <> 0);
end;

function TPasLibVlcMedia.SubItems(): TPasLibVlcMediaListC;
begin
  Result := TPasLibVlcMediaListC.Create(
    FVLC,
    libvlc_media_subitems(FMD)
  );
end;

function TPasLibVlcMedia.GetEventManager(): libvlc_event_manager_t_ptr;
begin
  Result := libvlc_media_event_manager(FMD);
end;

function TPasLibVlcMedia.GetDuration(): libvlc_time_t;
begin
  Result := libvlc_media_get_duration(FMD);
end;

procedure TPasLibVlcMedia.Parse();
begin
  libvlc_media_parse(FMD);
end;

procedure TPasLibVlcMedia.ParseAsync();
begin
  libvlc_media_parse_async(FMD);
end;

function TPasLibVlcMedia.IsParsed(): Boolean;
begin
  Result := (libvlc_media_is_parsed(FMD) <> 0);
end;

procedure TPasLibVlcMedia.SetUserData(data: Pointer);
begin
  libvlc_media_set_user_data(FMD, data);
end;

function TPasLibVlcMedia.GetUserData(): Pointer;
begin
  Result := libvlc_media_get_user_data(FMD);
end;

function TPasLibVlcMedia.GetTracksInfo(var tracks : libvlc_media_track_info_t_ptr): Integer;
begin
  Result := libvlc_media_get_tracks_info(FMD, tracks);
end;

////////////////////////////////////////////////////////////////////////////////

constructor TPasLibVlcMediaListC.Create(aVLC: TPasLibVlc);
begin
  inherited Create;
  FVLC := aVLC;
  FML  := libvlc_media_list_new(FVLC.Handle);
end;

constructor TPasLibVlcMediaListC.Create(aVLC: TPasLibVlc; aML: libvlc_media_list_t_ptr);
begin
  inherited Create;
  FVLC    := aVLC;
  FML     := aML;
end;

destructor TPasLibVlcMediaListC.Destroy;
begin
  if (FML <> NIL) then
  begin
    libvlc_media_list_release(FML);
  end;
  
  inherited Destroy;
end;

procedure TPasLibVlcMediaListC.SetMedia(media: TPasLibVlcMedia);
begin
  libvlc_media_list_set_media(FML, media.MD);
end;

function TPasLibVlcMediaListC.GetMedia(): TPasLibVlcMedia;
begin
  Result := TPasLibVlcMedia.Create(FVLC, libvlc_media_list_media(FML));
end;

function TPasLibVlcMediaListC.GetMedia(index: Integer): TPasLibVlcMedia;
begin
  Result := TPasLibVlcMedia.Create(
    FVLC,
    libvlc_media_list_item_at_index(FML, index)
  );
end;

function TPasLibVlcMediaListC.GetIndex(media: TPasLibVlcMedia): Integer;
begin
  Result := libvlc_media_list_index_of_item(
    FML,
    media.MD
  );
end;

function TPasLibVlcMediaListC.IsReadOnly(): Boolean;
begin
  Result := (libvlc_media_list_is_readonly(FML) = 0);
end;

procedure TPasLibVlcMediaListC.Add(mrl: WideString);
var
  media: TPasLibVlcMedia;
begin
  media := TPasLibVlcMedia.Create(FVLC, mrl);

  if Assigned(SELF.FMP) then
  begin
    media.SetTitleShow(SELF.FMP.TitleShow);
    media.SetVideoOnTop(SELF.FMP.FVideoOnTop);
    media.SetUseOverlay(SELF.FMP.FUseOverlay);
    media.SetSnapShotFmt(SELF.FMP.FSnapShotFmt);
    media.SetDeinterlaceFilter(SELF.FMP.FDeinterlaceFilter);
    media.SetDeinterlaceFilterMode(SELF.FMP.FDeinterlaceMode);
  end;

  Add(media);

  media.Free;
end;

procedure TPasLibVlcMediaListC.Add(media: TPasLibVlcMedia);
begin
  libvlc_media_list_lock(FML);
  libvlc_media_list_add_media(FML, media.MD);
  libvlc_media_list_unlock(FML);
end;

procedure TPasLibVlcMediaListC.Insert(media: TPasLibVlcMedia; index: Integer);
begin
  libvlc_media_list_lock(FML);
  libvlc_media_list_insert_media(FML, media.MD, index);
  libvlc_media_list_unlock(FML);
end;

procedure TPasLibVlcMediaListC.Delete(index: Integer);
begin
  libvlc_media_list_lock(FML);
  libvlc_media_list_remove_index(FML, index);
  libvlc_media_list_unlock(FML);
end;

procedure TPasLibVlcMediaListC.Clear();
begin
  libvlc_media_list_lock(FML);
  while (Count() > 0) do
  begin
    libvlc_media_list_remove_index(FML, 0);
  end;
  libvlc_media_list_unlock(FML);
end;

function TPasLibVlcMediaListC.Count(): Integer;
begin
  libvlc_media_list_lock(FML);
  Result := libvlc_media_list_count(FML);
  libvlc_media_list_unlock(FML);
end;

procedure TPasLibVlcMediaListC.Lock();
begin
  libvlc_media_list_lock(FML);
end;

procedure TPasLibVlcMediaListC.UnLock();
begin
  libvlc_media_list_unlock(FML);
end;

function TPasLibVlcMediaListC.GetEventManager(): libvlc_event_manager_t_ptr;
begin
  Result := libvlc_media_list_event_manager(FML);
end;

initialization

  VLC := TPasLibVlc.Create;

finalization

  VLC.Free;

end.
