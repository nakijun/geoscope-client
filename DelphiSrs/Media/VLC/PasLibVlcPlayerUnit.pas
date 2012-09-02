(*
 * PasLibVlcPlayerUnit.pas - VCL component for libvlc 1.1.11
 *
 * See copyright notice below.
 *
 * Last modified: 2011.08.20
 *
 * author: Robert Jêdrzejczyk
 * e-mail: robert@prog.olsztyn.pl
 *    www: http://www.prog.olsztyn.pl/paslibvlc
 *
 *******************************************************************************
 *
 * 2011.08.22 "Maloupi" <maloupi@2n-tech.com>
 *
 * Crossplatform modifications (Linux)
 *
 *******************************************************************************
 * 2011.08.20 Robert Jêdrzejczyk
 *
 * add new functions
 *
 * function  GetChannel(): Integer;
 * procedure SetChannel(chanel: Integer);
 * function  GetAudioDelay(): Int64;
 * procedure SetAudioDelay(delay: Int64);
 *
 *******************************************************************************
 * 2011.08.20 Mark Schneider <dhwz@gmx.net>
 *
 * add new functions
 *
 *   function  GetAudioTrackCount(): Integer;
 *   function  GetAudioTrackDescription(track: Integer): String;
 *   function  GetAudioTrack(): Integer;
 *   procedure SetAudioTrack(track: Integer);
 *
 *******************************************************************************
 * 2011.08.20 Robert Jêdrzejczyk
 *
 * add new feature: load vlc.dll from custom path
 *
 *    VLC.Path := YOUR CUSTOM PATH
 *
 * Requested by: 	"Mark Schneider" <dhwz@users.sourceforge.net>
 *
 *******************************************************************************
 * 2011.08.19 Robert Jêdrzejczyk
 *
 * add properties to deinterlace filter:
 *
 * Requested by: 	"Mark Schneider" <dhwz@users.sourceforge.net
 *
 *******************************************************************************
 *
 * 2011.04.07 Robert Jêdrzejczyk
 *
 * add new component: TPasLibVlcMediaList
 *
 * Methods for change play list mode:
 *
 *  PlayerSetPlayModeNormal;
 *  PlayerSetPlayModeLoop;
 *  PlayerSetPlayModeRepeat;
 *
 * Methods for play, stop, pause
 *
 *  Play;
 *  Pause;
 *  Stop;
 *  Next;
 *  Prev;
 *  IsPlay(): Boolean;
 *  GetState(): TPasLibVlcPlayerState;
 *  PlayItem(item: libvlc_media_t_ptr);
 *
 * Methods for operate on play list:
 *
 *  Add(mrl: WideString);
 *  Get(index: Integer);
 *  Count(): Integer;
 *  Delete(index: Integer);
 *  Insert(index: Integer; mrl: WideString);
 *
 *  GetItemAtIndex(index: Integer): libvlc_media_t_ptr;
 *  IndexOfItem(item: libvlc_media_t_ptr): Integer;
 *
 * After execute any method application will be notified about it via events:
 *
 *  OnItemAdded - after LIBVLC add item to play list
 *  OnWillAddItem - before LIBVLC add item to play list
 *  OnItemDeleted - after LIBVLC del item from play list
 *  OnWillDeleteItem - before LIBVLC del item from play list
 *
 *  OnPlayed - after player start play
 *  OnStopped - after player stop
 *  OnNextItemSet - afer player play next item
 *
 * Requested by:
 *
 * Christian cf. Fillion <christian@rhesus.net>
 *
 *******************************************************************************
 *
 * 2011.04.06 Robert Jêdrzejczyk
 *
 * add new functions:
 *
 *   SetPlayRate() - change current play rate
 *   GetPlayRate() - return current play rate
 *
 *    playRate = 100 - play with normal speed
 *    playRate = 200 - play with speed x 2
 *    playRate =  50 - play with slow speed is 0.5
 *
 * Requested by:
 *
 * Johann Mitterhauser <>
 *
 *******************************************************************************
 *
 * 2011.02.11 Robert Jêdrzejczyk
 *
 * make compatibile with Lazarus
 *
 * Requested by:
 *
 * Christian cf. Fillion <christian@rhesus.net>
 *
 *******************************************************************************
 *
 * 2011.02.08 Robert Jêdrzejczyk
 *
 * simple help for play YouTube video links.
 *
 * Now Play function detect YouTube link, and play it correctly.
 *
 * Requested by:
 *
 * Christian cf. Fillion <christian@rhesus.net>
 *
 *******************************************************************************
 *
 * 2011.01.05 Robert Jêdrzejczyk
 *
 * add new functions:
 *
 *   GetVideoLenStr() - return video length as time string
 *   GetVideoPosStr() - return video position as time string
 *
 * Requested by:
 *
 * Edijs van Kole de McSnikovics <terminedijs@yahoo.com>
 *
 *******************************************************************************
 *
 * 2011.01.05 Robert Jêdrzejczyk
 *
 * add new properties: PopupMenu, etc.
 *
 * Requested by:
 *
 * Edijs van Kole de McSnikovics <terminedijs@yahoo.com>
 *
 *******************************************************************************
 *
 * 2011.01.04 Robert Jêdrzejczyk
 *
 * correct creation of VCL at runtime, error: control '' has no parent window
 *
 * This error will be found by:
 *
 * Edijs van Kole de McSnikovics <terminedijs@yahoo.com>
 *
 *******************************************************************************
 *
 * 2011.01.03 Robert Jêdrzejczyk
 *
 * rename variable: FHideTitle to FShowTitle
 *
 *   if ShowTitle = TRUE  then SHOW title at begin of play
 *   if ShowTitle = FALSE then HIDE title at begin of play
 *
 *   default value: FALSE
 *
 *******************************************************************************
 *
 * 2010.12.08 Robert Jêdrzejczyk
 *
 * Add support for version 1.1.5
 *
 * new properties:
 *
 *   HideTitle - if TRUE prevent display title at begin of play, default TRUE
 *   UseEvents - if TRUE then enable event propagation, default FALSE
 *
 *******************************************************************************
 *
 * 2010.10.01 Robert Jêdrzejczyk
 *
 * Add support for unicode file names
 *
 *******************************************************************************
 *
 * 2010.07.22 Robert Jêdrzejczyk
 *
 * Add support for set/get Audio Volume Level
 *
 *******************************************************************************
 *
 * 2010.09.02 Robert Jêdrzejczyk
 *
 * Add support for version 1.1.4
 *
 *******************************************************************************
 *
 * 2010.07.14 David Nottage, davidnottage@gmail.com
 *
 * Change PChar to PAnsiChar
 * This help usage in Delphi 2010
 *)

(* This is file is part of PasLibVlcPlayerDemo program
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 *
 * Any non-GPL usage of this software or parts of this software is strictly
 * forbidden.
 *
 * The "appropriate copyright message" mentioned in section 2c of the GPLv2
 * must read: "Code from FAAD2 is copyright (c) Nero AG, www.nero.com"
 *
 * Commercial non-GPL licensing of this software is possible.
 * please contact robert@prog.olsztyn.pl
 *
 *)

(*
 * libvlc is part of project VideoLAN
 *
 * Copyright (c) 1996-2010 VideoLAN Team
 *
 * For more information about VideoLAN
 *
 * please visit http://www.videolan.org
 *
 *)

{$I compiler.inc}

unit PasLibVlcPlayerUnit;

interface

uses
  {$IFDEF UNIX}
  Unix,
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
  PasLibVlcUnit,
  PasLibVlcClassUnit;

type
  TPasLibVlcPlayerState = (
    plvPlayer_NothingSpecial,
    plvPlayer_Opening,
    plvPlayer_Buffering,
    plvPlayer_Playing,
    plvPlayer_Paused,
    plvPlayer_Stopped,
    plvPlayer_Ended,
    plvPlayer_Error);

type
  TNotifySeekableChanged = procedure(Sender : TObject; val      : Boolean) of object;
  TNotifyPausableChanged = procedure(Sender : TObject; val      : Boolean) of object;
  TNotifyTitleChanged    = procedure(Sender : TObject; title    : Integer) of object;
  TNotifySnapshotTaken   = procedure(Sender : TObject; fileName : string)  of object;
  TNotifyTimeChanged     = procedure(Sender : TObject; time     : Int64)   of object;
  TNotifyLengthChanged   = procedure(Sender : TObject; time     : Int64)   of object;
  TNotifyPositionChanged = procedure(Sender : TObject; position : Single)  of object;

  {$IFDEF FPC}
  TPasLibVlcPlayer = class(TPanel)
  {$ELSE}
  TPasLibVlcPlayer = class(TCustomPanel)
  {$ENDIF}
  private
    p_mi        : libvlc_media_player_t_ptr;
    p_mi_ev_mgr : libvlc_event_manager_t_ptr;

    //
    FError       : string;
    FMute        : Boolean;

    FTitleShow   : Boolean;
    FVideoOnTop  : Boolean;
    FUseOverlay  : Boolean;
    FSnapshotFmt : string;

    FDeinterlaceFilter: TDeinterlaceFilter;
    FDeinterlaceMode:   TDeinterlaceMode;

    FPosition    : Single;
    FTimeInMs    : Int64;
    FLengthInMs  : Int64;

    FVideoWidth  : Integer;
    FVideoHeight : Integer;

    FParentWindow: HWND;
    
    // events handlers
    FOnMediaPlayerMediaChanged     : TNotifyEvent;
    FOnMediaPlayerNothingSpecial   : TNotifyEvent;
    FOnMediaPlayerOpening          : TNotifyEvent;
    FOnMediaPlayerBuffering        : TNotifyEvent;
    FOnMediaPlayerPlaying          : TNotifyEvent;
    FOnMediaPlayerPaused           : TNotifyEvent;
    FOnMediaPlayerStopped          : TNotifyEvent;
    FOnMediaPlayerForward          : TNotifyEvent;
    FOnMediaPlayerBackward         : TNotifyEvent;
    FOnMediaPlayerEndReached       : TNotifyEvent;
    FOnMediaPlayerEncounteredError : TNotifyEvent;
    FOnMediaPlayerTimeChanged      : TNotifyTimeChanged;
    FOnMediaPlayerPositionChanged  : TNotifyPositionChanged;
    FOnMediaPlayerSeekableChanged  : TNotifySeekableChanged;
    FOnMediaPlayerPausableChanged  : TNotifyPausableChanged;
    FOnMediaPlayerTitleChanged     : TNotifyTitleChanged;
    FOnMediaPlayerSnapshotTaken    : TNotifySnapshotTaken;
    FOnMediaPlayerLengthChanged    : TNotifyLengthChanged;

    FMouseEventWinCtrl    : TPasLibVlcMouseEventWinCtrl; 

    procedure SetSnapShotFmt(aFormat: string);

    procedure SetTitleShow(aValue: Boolean);
    procedure SetVideoOnTop(aValue : Boolean);
    procedure SetUseOverlay(aValue : Boolean);
    
    procedure SetDeinterlaceFilter(aValue: TDeinterlaceFilter);
    procedure SetDeinterlaceMode(aValue: TDeinterlaceMode);
    function  GetDeinterlaceModeName(): WideString;

    procedure UpdateDeInterlace();

    procedure InternalHandleEventPositionChanged(position: Single);
    procedure InternalHandleEventTimeChanged(time: Int64);
    procedure InternalHandleEventLengthChanged(time: Int64);

    procedure InternalOnClick(Sender: TObject);
    procedure InternalOnDblClick(Sender: TObject);
    procedure InternalOnMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure InternalOnMouseEnter(Sender: TObject);
    procedure InternalOnMouseLeave(Sender: TObject);
    procedure InternalOnMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure InternalOnMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);    
  protected
    procedure SetHwnd();
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function GetPlayerHandle(): libvlc_media_player_t_ptr;

    procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); override;

    procedure Play(mrl: WideString; timeout: Cardinal = 10000);
    procedure PlayContinue();
    
    procedure Pause();
    procedure Resume();
    function  IsPlay(): Boolean;

    function  GetState(): TPasLibVlcPlayerState;

    function  GetVideoWidth(): LongInt;
    function  GetVideoHeight(): LongInt;
    function  GetVideoScaleInPercent(): Single;
    procedure SetVideoScaleInPercent(newScaleInPercent: Single);
    function  GetAspectRatio(): string;
    procedure SetAspectRatio(newAspectRatio: string);
    
    function  GetVideoLenInMs(): Int64;
    function  GetVideoPosInMs(): Int64;
    procedure SetVideoPosInMs(newPos: Int64);
    function  GetVideoPosInPercent(): Single;
    procedure SetVideoPosInPercent(newPos: Single);
    function  GetVideoFps(): Single;

    function GetVideoLenStr(fmt: string = 'hh:mm:ss'): string;
    function GetVideoPosStr(fmt: string = 'hh:mm:ss'): string;

    function  GetVideoChapter(): Integer;
    procedure SetVideoChapter(newChapter: Integer);
    function  GetVideoChapterCount(): Integer;

    function  CanPlay(): Boolean;
    function  CanPause(): Boolean;
    function  CanSeek(): Boolean;

    function Snapshot(fileName: WideString): Boolean; overload;
    function Snapshot(fileName: WideString; width, height: LongWord): Boolean; overload;

    procedure NextFrame();

    function  GetAudioMute(): Boolean;
    procedure SetAudioMute(mute: Boolean);
    function  GetAudioVolume(): Integer;
    procedure SetAudioVolume(volumeLevel: Integer);

    procedure SetPlayRate(rate: Integer);
    function  GetPlayRate(): Integer;

    procedure FullScreenSetMode(mode: Boolean);
    function  FullScreenGetMode(): Boolean;

    function  GetAudioTrackCount(): Integer;
    function  GetAudioTrack(): Integer;
    procedure SetAudioTrack(track: Integer);
    function  GetAudioTrackDescription(track: Integer): WideString;

    function  GetChannel(): Integer;
    procedure SetChannel(chanel: Integer);

    function  GetAudioDelay(): Int64;
    procedure SetAudioDelay(delay: Int64);

  published
    property Align;
    property Color  default clBlack;
    property Width  default 320;
    property Height default 240;

    property Constraints;
    property DragKind;
    property DragMode;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property Visible;
    {$IFNDEF FPC}
    property OnCanResize;
    {$ENDIF}
    property OnClick;
    property OnConstrainedResize;
    property OnContextPopup;
    property OnDockDrop;
    property OnDockOver;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDock;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnGetSiteInfo;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnResize;
    property OnStartDock;
    property OnStartDrag;
    property OnUnDock;

    property TitleShow : Boolean
      read    FTitleShow
      write   SetTitleShow
      default FALSE;

    property VideoOnTop : Boolean
      read    FVideoOnTop
      write   SetVideoOnTop
      default FALSE;

    property UseOverlay : Boolean
      read    FUseOverlay
      write   SetUseOverlay
      default FALSE;

    property SnapShotFmt : string
      read    FSnapShotFmt
      write   SetSnapShotFmt;

    property DeinterlaceFilter: TDeinterlaceFilter
      read    FDeinterlaceFilter
      write   SetDeinterlaceFilter
      default deOFF;

    property DeinterlaceModeName: WideString
      read    GetDeinterlaceModeName;

    property DeinterlaceMode: TDeinterlaceMode
      read    FDeinterlaceMode
      write   SetDeinterlaceMode
      default dmDISCARD;

    property LastError: string
      read   FError
      write  FError;

    property OnMediaPlayerMediaChanged     : TNotifyEvent
      read  FOnMediaPlayerMediaChanged
      write FOnMediaPlayerMediaChanged;

    property OnMediaPlayerNothingSpecial   : TNotifyEvent
      read  FOnMediaPlayerNothingSpecial
      write FOnMediaPlayerNothingSpecial;

    property OnMediaPlayerOpening          : TNotifyEvent
      read  FOnMediaPlayerOpening
      write FOnMediaPlayerOpening;

    property OnMediaPlayerBuffering        : TNotifyEvent
      read  FOnMediaPlayerBuffering
      write FOnMediaPlayerBuffering;

    property OnMediaPlayerPlaying          : TNotifyEvent
      read  FOnMediaPlayerPlaying
      write FOnMediaPlayerPlaying;

    property OnMediaPlayerPaused           : TNotifyEvent
      read  FOnMediaPlayerPaused
      write FOnMediaPlayerPaused;

    property OnMediaPlayerStopped          : TNotifyEvent
      read  FOnMediaPlayerStopped
      write FOnMediaPlayerStopped;

    property OnMediaPlayerForward          : TNotifyEvent
      read  FOnMediaPlayerForward
      write FOnMediaPlayerForward;

    property OnMediaPlayerBackward         : TNotifyEvent
      read  FOnMediaPlayerBackward
      write FOnMediaPlayerBackward;

    property OnMediaPlayerEndReached       : TNotifyEvent
      read  FOnMediaPlayerEndReached
      write FOnMediaPlayerEndReached;

    property OnMediaPlayerEncounteredError : TNotifyEvent
      read  FOnMediaPlayerEncounteredError
      write FOnMediaPlayerEncounteredError;

    property OnMediaPlayerTimeChanged      : TNotifyTimeChanged
      read  FOnMediaPlayerTimeChanged
      write FOnMediaPlayerTimeChanged;

    property OnMediaPlayerPositionChanged  : TNotifyPositionChanged
      read  FOnMediaPlayerPositionChanged
      write FOnMediaPlayerPositionChanged;

    property OnMediaPlayerSeekableChanged  : TNotifySeekableChanged
      read  FOnMediaPlayerSeekableChanged
      write FOnMediaPlayerSeekableChanged;

    property OnMediaPlayerPausableChanged  : TNotifyPausableChanged
      read  FOnMediaPlayerPausableChanged
      write FOnMediaPlayerPausableChanged;

    property OnMediaPlayerTitleChanged     : TNotifyTitleChanged
      read  FOnMediaPlayerTitleChanged
      write FOnMediaPlayerTitleChanged;

    property OnMediaPlayerSnapshotTaken    : TNotifySnapshotTaken
      read  FOnMediaPlayerSnapshotTaken
      write FOnMediaPlayerSnapshotTaken;

    property OnMediaPlayerLengthChanged    : TNotifyLengthChanged
      read  FOnMediaPlayerLengthChanged
      write FOnMediaPlayerLengthChanged;
  end;

  TNotifyMediaListItem = procedure(Sender: TObject; mrl: WideString; item: Pointer; index: Integer) of object;

  TPasLibVlcMediaList = class(TComponent)

  private
    p_ml         : libvlc_media_list_t_ptr;
    p_mlp        : libvlc_media_list_player_t_ptr;

    p_ml_ev_mgr  : libvlc_event_manager_t_ptr;
    p_mlp_ev_mgr : libvlc_event_manager_t_ptr;

    FPlayer      : TPasLibVlcPlayer;
    FError       : string;

    FOnItemAdded      : TNotifyMediaListItem;
    FOnWillAddItem    : TNotifyMediaListItem;
    FOnItemDeleted    : TNotifyMediaListItem;
    FOnWillDeleteItem : TNotifyMediaListItem;

    // event defined in libvlc but not used by libvlc event menager
    // FOnPlayed      : TNotifyEvent;

    // event defined in libvlc but not used by libvlc event menager
    // FOnStopped     : TNotifyEvent;
    
    FOnNextItemSet : TNotifyMediaListItem;

    procedure SetPlayer(aPlayer: TPasLibVlcPlayer);

    procedure InternalHandleEventItemAdded(item: libvlc_media_t_ptr; index: Integer);
    procedure InternalHandleEventItemDeleted(item: libvlc_media_t_ptr; index: Integer);
    procedure InternalHandleEventWillAddItem(item: libvlc_media_t_ptr; index: Integer);
    procedure InternalHandleEventWillDeleteItem(item: libvlc_media_t_ptr; index: Integer);
    procedure InternalHandleEventPlayerNextItemSet(item: libvlc_media_t_ptr);
  protected
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure SetPlayModeNormal;
    procedure SetPlayModeLoop;
    procedure SetPlayModeRepeat;

    procedure Play;
    procedure Pause;
    procedure Stop;
    procedure Next;
    procedure Prev;
    function  IsPlay(): Boolean;
    function  GetState(): TPasLibVlcPlayerState;
    procedure PlayItem(item: libvlc_media_t_ptr);

    procedure Clear();
    procedure Add(mrl: WideString);
    function  Get(index: Integer): WideString;
    function  Count(): Integer;
    procedure Delete(index: Integer);
    procedure Insert(index: Integer; mrl: WideString);

    function GetItemAtIndex(index: Integer): libvlc_media_t_ptr;
    function IndexOfItem(item: libvlc_media_t_ptr): Integer;
  published
  
    property Player: TPasLibVlcPlayer
      read FPlayer
      write SetPlayer;
      
    property LastError: string
      read FError
      write FError;

    property OnItemAdded : TNotifyMediaListItem
      read  FOnItemAdded
      write FOnItemAdded;

    property OnWillAddItem : TNotifyMediaListItem
      read  FOnWillAddItem
      write FOnWillAddItem;

    property OnItemDeleted : TNotifyMediaListItem
      read  FOnItemDeleted
      write FOnItemDeleted;

    property OnWillDeleteItem : TNotifyMediaListItem
      read  FOnWillDeleteItem
      write FOnWillDeleteItem;

    // event defined in libvlc but not used by libvlc event menager
    // property OnPlayed : TNotifyEvent read  FOnPlayed write FOnPlayed;

    // event defined in libvlc but not used by libvlc event menager
    // property OnStopped : TNotifyEvent read  FOnStopped write FOnStopped;

    property OnNextItemSet : TNotifyMediaListItem
      read  FOnNextItemSet
      write FOnNextItemSet;
  end;

  function time2str(timeInMs: Int64; fmt: string = 'hh:mm:ss.ms'): string;

procedure Register;


implementation

{$R *.RES}

{$IFDEF FPC}
procedure RegisterPasLibVlcPlayerUnit;
begin
  RegisterComponents('PasLibVlc', [TPasLibVlcPlayer, TPasLibVlcMediaList]);
end;

procedure Register;
begin
  RegisterUnit('PasLibVlcPlayerUnit', @RegisterPasLibVlcPlayerUnit);
end;
{$ELSE}
procedure Register;
begin
  RegisterComponents('PasLibVlc', [TPasLibVlcPlayer, TPasLibVlcMediaList]);
end;
{$ENDIF}

function w2s(w: word): string;
begin
  if (w < 10)  then Result := '0' + IntToStr(w)
  else              Result := IntToStr(w);
end;

function time2str(timeInMs: Int64; fmt: string = 'hh:mm:ss.ms'): string;
var
  dd, hh, mm, ss, ms: word;
begin
  ms := timeInMs mod 1000; timeInMs := timeInMs div 1000;
  ss := timeInMs mod 60;   timeInMs := timeInMs div 60;
  mm := timeInMs mod 60;   timeInMs := timeInMs div 60;
  hh := timeInMs mod 24;   timeInMs := timeInMs div 24;
  dd := timeInMs;

  Result := fmt;
  Result := StringReplace(Result, 'dd',  w2s(dd), [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, 'hh',  w2s(hh), [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, 'mm',  w2s(mm), [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, 'ss',  w2s(ss), [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, 'ms',  w2s(ms), [rfReplaceAll, rfIgnoreCase]);
end;

////////////////////////////////////////////////////////////////////////////////

procedure lib_vlc_player_event_hdlr(p_event: libvlc_event_t_ptr; data: Pointer); cdecl; forward;
procedure lib_vlc_media_list_event_hdlr(p_event: libvlc_event_t_ptr; data: Pointer); cdecl; forward;
procedure lib_vlc_media_list_player_event_hdlr(p_event: libvlc_event_t_ptr; data: Pointer); cdecl; forward;

constructor TPasLibVlcMediaList.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  p_ml         := NIL;
  p_mlp        := NIL;
  
  p_ml_ev_mgr  := NIL;
  p_mlp_ev_mgr := NIL;

  FPlayer      := NIL;

  if (csDesigning in ComponentState) then exit;

  p_ml  := libvlc_media_list_new(VLC.Handle);
  p_mlp := libvlc_media_list_player_new(VLC.Handle);
  
  libvlc_media_list_player_set_media_list(p_mlp, p_ml);

  p_ml_ev_mgr := libvlc_media_list_event_manager(p_ml);

  if Assigned(p_ml_ev_mgr) then
  begin
    libvlc_event_attach(p_ml_ev_mgr, libvlc_MediaListItemAdded,      lib_vlc_media_list_event_hdlr, SELF);
    libvlc_event_attach(p_ml_ev_mgr, libvlc_MediaListWillAddItem,    lib_vlc_media_list_event_hdlr, SELF);
    libvlc_event_attach(p_ml_ev_mgr, libvlc_MediaListItemDeleted,    lib_vlc_media_list_event_hdlr, SELF);
    libvlc_event_attach(p_ml_ev_mgr, libvlc_MediaListWillDeleteItem, lib_vlc_media_list_event_hdlr, SELF);
  end;

  p_mlp_ev_mgr := libvlc_media_list_player_event_manager(p_mlp);

  if Assigned(p_mlp_ev_mgr) then
  begin
    // event defined in libvlc but not used by libvlc event menager
    // libvlc_event_attach(p_mlp_ev_mgr, libvlc_MediaListPlayerPlayed,      lib_vlc_media_list_player_event_hdlr, SELF);

    // event defined in libvlc but not used by libvlc event menager
    // libvlc_event_attach(p_mlp_ev_mgr, libvlc_MediaListPlayerStopped,     lib_vlc_media_list_player_event_hdlr, SELF);

    libvlc_event_attach(p_mlp_ev_mgr, libvlc_MediaListPlayerNextItemSet, lib_vlc_media_list_player_event_hdlr, SELF);
  end;
end;

destructor TPasLibVlcMediaList.Destroy;
begin
  if (p_mlp <> NIL) then
  begin
    libvlc_media_list_player_stop(p_mlp);
  end;

  if Assigned(p_mlp_ev_mgr) then
  begin
    // event defined in libvlc but not used by libvlc event menager
    // libvlc_event_detach(p_mlp_ev_mgr, libvlc_MediaListPlayerPlayed,      lib_vlc_media_list_player_event_hdlr, SELF);

    // event defined in libvlc but not used by libvlc event menager
    // libvlc_event_detach(p_mlp_ev_mgr, libvlc_MediaListPlayerStopped,     lib_vlc_media_list_player_event_hdlr, SELF);

    libvlc_event_detach(p_mlp_ev_mgr, libvlc_MediaListPlayerNextItemSet, lib_vlc_media_list_player_event_hdlr, SELF);
  end;

  if Assigned(p_ml_ev_mgr) then
  begin
    libvlc_event_detach(p_ml_ev_mgr, libvlc_MediaListItemAdded,      lib_vlc_media_list_event_hdlr, SELF);
    libvlc_event_detach(p_ml_ev_mgr, libvlc_MediaListWillAddItem,    lib_vlc_media_list_event_hdlr, SELF);
    libvlc_event_detach(p_ml_ev_mgr, libvlc_MediaListItemDeleted,    lib_vlc_media_list_event_hdlr, SELF);
    libvlc_event_detach(p_ml_ev_mgr, libvlc_MediaListWillDeleteItem, lib_vlc_media_list_event_hdlr, SELF);
  end;

  p_mlp_ev_mgr := NIL;
  p_ml_ev_mgr := NIL;

  Sleep(100);

  if (p_mlp <> NIL) then
  begin
    libvlc_media_list_player_release(p_mlp);
  end;
  
  if (p_ml <> NIL) then
  begin
    libvlc_media_list_release(p_ml);
  end;
  
  inherited Destroy;
end;

procedure TPasLibVlcMediaList.SetPlayer(aPlayer: TPasLibVlcPlayer);
begin
  FPlayer := aPlayer;
end;

procedure TPasLibVlcMediaList.SetPlayModeNormal;
begin
  libvlc_media_list_player_set_playback_mode(p_mlp, libvlc_playback_mode_default);
end;

procedure TPasLibVlcMediaList.SetPlayModeLoop;
begin
  libvlc_media_list_player_set_playback_mode(p_mlp, libvlc_playback_mode_loop);
end;

procedure TPasLibVlcMediaList.SetPlayModeRepeat;
begin
  libvlc_media_list_player_set_playback_mode(p_mlp, libvlc_playback_mode_repeat);
end;

procedure TPasLibVlcMediaList.Play;
begin
  if (FPlayer <> NIL) then
  begin
    libvlc_media_list_player_set_media_player(p_mlp, FPlayer.GetPlayerHandle());
    FPlayer.SetHwnd;
  end;

  libvlc_media_list_player_play(p_mlp);
end;

procedure TPasLibVlcMediaList.PlayItem(item: libvlc_media_t_ptr);
begin
  if (FPlayer <> NIL) then
  begin
    libvlc_media_list_player_set_media_player(p_mlp, FPlayer.GetPlayerHandle());
    FPlayer.SetHwnd;
  end;
  
  libvlc_media_list_player_play_item(p_mlp, item);
end;

procedure TPasLibVlcMediaList.Pause;
begin
  libvlc_media_list_player_pause(p_mlp);
end;

procedure TPasLibVlcMediaList.Stop;
begin
  libvlc_media_list_player_stop(p_mlp);
end;

procedure TPasLibVlcMediaList.Next;
begin
  if (FPlayer <> NIL) then
  begin
    libvlc_media_list_player_set_media_player(p_mlp, FPlayer.GetPlayerHandle());
    FPlayer.SetHwnd;
  end;
  
  libvlc_media_list_player_next(p_mlp);
end;

procedure TPasLibVlcMediaList.Prev;
begin
  if (FPlayer <> NIL) then
  begin
    libvlc_media_list_player_set_media_player(p_mlp, FPlayer.GetPlayerHandle());
    FPlayer.SetHwnd;
  end;

  libvlc_media_list_player_previous(p_mlp);
end;

function TPasLibVlcMediaList.IsPlay(): Boolean;
begin
  Result := (libvlc_media_list_player_is_playing(p_mlp) <> 0);
end;

function TPasLibVlcMediaList.GetState(): TPasLibVlcPlayerState;
begin
  Result := plvPlayer_NothingSpecial;
  
  if (p_mlp = NIL) then exit;
  
  case libvlc_media_list_player_get_state(p_mlp) of
    libvlc_NothingSpecial: Result := plvPlayer_NothingSpecial;
    libvlc_Opening:        Result := plvPlayer_Opening;
    libvlc_Buffering:      Result := plvPlayer_Buffering;
    libvlc_Playing:        Result := plvPlayer_Playing;
    libvlc_Paused:         Result := plvPlayer_Paused;
    libvlc_Stopped:        Result := plvPlayer_Stopped;
    libvlc_Ended:          Result := plvPlayer_Ended;
    libvlc_Error:          Result := plvPlayer_Error;
  end;
end;

procedure TPasLibVlcMediaList.Clear();
begin
  while (Count() > 0) do
  begin
    Delete(0);
  end;
end;

procedure TPasLibVlcMediaList.Add(mrl: WideString);
var
  media : TPasLibVlcMedia;
begin
  media := TPasLibVlcMedia.Create(VLC, mrl);

  if Assigned(SELF.FPlayer) then
  begin
    media.SetTitleShow(SELF.FPlayer.TitleShow);
    media.SetVideoOnTop(SELF.FPlayer.VideoOnTop);
    media.SetUseOverlay(SELF.FPlayer.UseOverlay);
    media.SetSnapShotFmt(SELF.FPlayer.SnapshotFmt);
    media.SetDeinterlaceFilter(SELF.FPlayer.FDeinterlaceFilter);
    media.SetDeinterlaceFilterMode(SELF.FPlayer.FDeinterlaceMode);
  end;

  libvlc_media_list_lock(p_ml);
  libvlc_media_list_add_media(p_ml, media.MD);
  libvlc_media_list_unlock(p_ml);

  media.Free;
end;

function TPasLibVlcMediaList.Get(index: Integer): WideString;
var
  p_md : libvlc_media_t_ptr;
begin
  Result := '';
  p_md := GetItemAtIndex(index);
  if Assigned(p_md) then
  begin
    Result := libvlc_media_get_mrl(p_md);
  end;
end;

function TPasLibVlcMediaList.Count(): Integer;
begin
  libvlc_media_list_lock(p_ml);
  Result := libvlc_media_list_count(p_ml);
  libvlc_media_list_unlock(p_ml);
end;

procedure TPasLibVlcMediaList.Delete(index: Integer);
begin
  libvlc_media_list_lock(p_ml);
  libvlc_media_list_remove_index(p_ml, index);
  libvlc_media_list_unlock(p_ml);
end;

procedure TPasLibVlcMediaList.Insert(index: Integer; mrl: WideString);
var
  media: TPasLibVlcMedia;
begin
  media := TPasLibVlcMedia.Create(VLC, mrl);

  if Assigned(SELF.FPlayer) then
  begin
    media.SetTitleShow(SELF.FPlayer.TitleShow);
    media.SetVideoOnTop(SELF.FPlayer.VideoOnTop);
    media.SetUseOverlay(SELF.FPlayer.UseOverlay);
    media.SetSnapShotFmt(SELF.FPlayer.SnapshotFmt);
    media.SetDeinterlaceFilter(SELF.FPlayer.FDeinterlaceFilter);
    media.SetDeinterlaceFilterMode(SELF.FPlayer.FDeinterlaceMode);
  end;

  libvlc_media_list_lock(p_ml);
  libvlc_media_list_insert_media(p_ml, media.MD, index);
  libvlc_media_list_unlock(p_ml);

  media.Free;
end;

function TPasLibVlcMediaList.GetItemAtIndex(index: Integer): libvlc_media_t_ptr;
begin
  libvlc_media_list_lock(p_ml);
  Result := libvlc_media_list_item_at_index(p_ml, index);
  libvlc_media_list_unlock(p_ml);
end;

function TPasLibVlcMediaList.IndexOfItem(item: libvlc_media_t_ptr): Integer;
begin
  libvlc_media_list_lock(p_ml);
  Result := libvlc_media_list_index_of_item(p_ml, item);
  libvlc_media_list_unlock(p_ml);
end;

////////////////////////////////////////////////////////////////////////////////

procedure TPasLibVlcMediaList.InternalHandleEventItemAdded(item: libvlc_media_t_ptr; index: Integer);
var
  mrl: WideString;
begin
  mrl := System.UTF8Decode(libvlc_media_get_mrl(item));
  if Assigned(OnItemAdded) then
  begin
    OnItemAdded(SELF, mrl, item, index);
  end;
end;

procedure TPasLibVlcMediaList.InternalHandleEventItemDeleted(item: libvlc_media_t_ptr; index: Integer);
var
  mrl: WideString;
begin
  mrl := System.UTF8Decode(libvlc_media_get_mrl(item));
  if Assigned(OnItemDeleted) then
  begin
    OnItemDeleted(SELF, mrl, item, index);
  end;
end;

procedure TPasLibVlcMediaList.InternalHandleEventWillAddItem(item: libvlc_media_t_ptr; index: Integer);
var
  mrl: WideString;
begin
  mrl := System.UTF8Decode(libvlc_media_get_mrl(item));
  if Assigned(OnWillAddItem) then
  begin
    OnItemAdded(SELF, mrl, item, index);
  end;
end;

procedure TPasLibVlcMediaList.InternalHandleEventWillDeleteItem(item: libvlc_media_t_ptr; index: Integer);
var
  mrl: WideString;
begin
  mrl := System.UTF8Decode(libvlc_media_get_mrl(item));
  if Assigned(OnWillDeleteItem) then
  begin
    OnWillDeleteItem(SELF, mrl, item, index);
  end;
end;

procedure TPasLibVlcMediaList.InternalHandleEventPlayerNextItemSet(item: libvlc_media_t_ptr);
var
  mrl: WideString;
  idx: Integer;
begin
  mrl := System.UTF8Decode(libvlc_media_get_mrl(item));
  idx := IndexOfItem(item);
  if Assigned(OnNextItemSet) then
  begin
    OnNextItemSet(SELF, mrl, item, idx);
  end;
end;

////////////////////////////////////////////////////////////////////////////////

constructor TPasLibVlcPlayer.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  Color      := clBlack;
  Width      := 320;
  Height     := 240;

  FTitleShow   := FALSE;
  FUseOverlay  := FALSE;
  FVideoOnTop  := FALSE;
  FSnapshotFmt := 'png';


  {$IFNDEF FPC}
  ParentBackground   := False;
  {$ENDIF}

  Caption            := '';
  BevelOuter         := bvNone;

  p_mi               := NIL;
  p_mi_ev_mgr        := NIL;

  FPosition          := 0;
  FTimeInMs          := 0;
  FLengthInMs        := 0;

  FVideoWidth        := -1;
  FVideoHeight       := -1;

  FMute              := FALSE;

  FMouseEventWinCtrl := NIL;

  p_mi := NIL;

  if (csDesigning in ComponentState) then exit;

  if (SELF.Parent = NIL) then
  begin
    SELF.Parent := SELF.Owner as TWinControl;
  end;

  if Assigned(AOwner) then
  begin
    FMouseEventWinCtrl := TPasLibVlcMouseEventWinCtrl.Create(AOwner);

    (AOwner as TWinControl).InsertControl(FMouseEventWinCtrl);

    FMouseEventWinCtrl.Left        := SELF.Left;
    FMouseEventWinCtrl.Top         := SELF.Top;
    FMouseEventWinCtrl.Width       := SELF.Width;
    FMouseEventWinCtrl.Height      := SELF.Height;

    FMouseEventWinCtrl.OnClick         := InternalOnClick;
    FMouseEventWinCtrl.OnDblClick      := InternalOnDblClick;
    FMouseEventWinCtrl.OnMouseDown     := InternalOnMouseDown;
    FMouseEventWinCtrl.OnMouseMove     := InternalOnMouseMove;
    FMouseEventWinCtrl.OnMouseUp       := InternalOnMouseUp;
    {$IFDEF UNIX}
//    FParentWindow                      := Windows.GetParent(SELF.Handle);
    {$ENDIF}
    {$IFDEF MSWINDOWS}
    FParentWindow                      := Windows.GetParent(SELF.Handle);
    {$ENDIF}

  end
  else
  begin
    FParentWindow := 0;
  end;
end;

procedure TPasLibVlcPlayer.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
begin
  inherited SetBounds(ALeft, ATop, AWidth, AHeight);

  if Assigned(FMouseEventWinCtrl) then
  begin
    FMouseEventWinCtrl.Left   := SELF.Left;
    FMouseEventWinCtrl.Top    := SELF.Top;
    FMouseEventWinCtrl.Width  := SELF.Width;
    FMouseEventWinCtrl.Height := SELF.Height;
  end;
end;

destructor TPasLibVlcPlayer.Destroy;
begin

  if (p_mi <> NIL) then
  begin
    libvlc_media_player_stop(p_mi);
  end;

  if Assigned(p_mi_ev_mgr) then
  begin
    libvlc_event_detach(p_mi_ev_mgr, libvlc_MediaPlayerMediaChanged,     lib_vlc_player_event_hdlr, SELF);
    libvlc_event_detach(p_mi_ev_mgr, libvlc_MediaPlayerNothingSpecial,   lib_vlc_player_event_hdlr, SELF);
    libvlc_event_detach(p_mi_ev_mgr, libvlc_MediaPlayerOpening,          lib_vlc_player_event_hdlr, SELF);
    libvlc_event_detach(p_mi_ev_mgr, libvlc_MediaPlayerBuffering,        lib_vlc_player_event_hdlr, SELF);
    libvlc_event_detach(p_mi_ev_mgr, libvlc_MediaPlayerPlaying,          lib_vlc_player_event_hdlr, SELF);
    libvlc_event_detach(p_mi_ev_mgr, libvlc_MediaPlayerPaused,           lib_vlc_player_event_hdlr, SELF);
    libvlc_event_detach(p_mi_ev_mgr, libvlc_MediaPlayerStopped,          lib_vlc_player_event_hdlr, SELF);
    libvlc_event_detach(p_mi_ev_mgr, libvlc_MediaPlayerForward,          lib_vlc_player_event_hdlr, SELF);
    libvlc_event_detach(p_mi_ev_mgr, libvlc_MediaPlayerBackward,         lib_vlc_player_event_hdlr, SELF);
    libvlc_event_detach(p_mi_ev_mgr, libvlc_MediaPlayerEndReached,       lib_vlc_player_event_hdlr, SELF);
    libvlc_event_detach(p_mi_ev_mgr, libvlc_MediaPlayerEncounteredError, lib_vlc_player_event_hdlr, SELF);
    libvlc_event_detach(p_mi_ev_mgr, libvlc_MediaPlayerTimeChanged,      lib_vlc_player_event_hdlr, SELF);
    libvlc_event_detach(p_mi_ev_mgr, libvlc_MediaPlayerPositionChanged,  lib_vlc_player_event_hdlr, SELF);
    libvlc_event_detach(p_mi_ev_mgr, libvlc_MediaPlayerSeekableChanged,  lib_vlc_player_event_hdlr, SELF);
    libvlc_event_detach(p_mi_ev_mgr, libvlc_MediaPlayerPausableChanged,  lib_vlc_player_event_hdlr, SELF);
    libvlc_event_detach(p_mi_ev_mgr, libvlc_MediaPlayerTitleChanged,     lib_vlc_player_event_hdlr, SELF);
    libvlc_event_detach(p_mi_ev_mgr, libvlc_MediaPlayerSnapshotTaken,    lib_vlc_player_event_hdlr, SELF);
    libvlc_event_detach(p_mi_ev_mgr, libvlc_MediaPlayerLengthChanged,    lib_vlc_player_event_hdlr, SELF);
  end;

  Sleep(100);
  
  p_mi_ev_mgr := NIL;

  if (p_mi <> NIL) then
  begin
    libvlc_media_player_release(p_mi);
  end;
  
  inherited Destroy;
end;

procedure TPasLibVlcPlayer.SetSnapShotFmt(aFormat: string);
begin
  FSnapShotFmt := 'png';
  aFormat := AnsiLowerCase(aFormat);
  if ((aFormat = 'png') or (aFormat = 'jpg')) then
  begin
    FSnapShotFmt := aFormat;
  end;
end;

procedure TPasLibVlcPlayer.SetTitleShow(aValue: Boolean);
begin
  if (FTitleShow <> aValue) then
  begin
    FTitleShow := aValue;
  end;
end;

procedure TPasLibVlcPlayer.SetVideoOnTop(aValue : Boolean);
begin
  if (FVideoOnTop <> aValue) then
  begin
    FVideoOnTop := aValue;
  end;
end;

procedure TPasLibVlcPlayer.SetUseOverlay(aValue : Boolean);
begin
  if (FUseOverlay <> aValue) then
  begin
    FUseOverlay := aValue;
  end;
end;

procedure TPasLibVlcPlayer.UpdateDeInterlace();
var
  dm: string;
begin
  if (p_mi = NIL) then exit;

  dm := '';
  
  if (FDeinterlaceFilter = deON) then
  begin
    dm := GetDeinterlaceModeName();
  end;
  
  libvlc_video_set_deinterlace(p_mi, PAnsiChar(dm));
end;

function TPasLibVlcPlayer.GetDeinterlaceModeName(): WideString;
begin
  Result := '';
  case FDeinterlaceMode of
    dmDISCARD: Result := 'discard';
    dmBLEND:   Result := 'blend';
    dmMEAN:    Result := 'mean';
    dmBOB:     Result := 'bob';
    dmLINEAR:  Result := 'linear';
    dmX:       Result := 'x';
    dmYADIF:   Result := 'yadif';
    dmYADIF2x: Result := 'yadif2x';
  end;
end;

procedure TPasLibVlcPlayer.SetDeinterlaceFilter(aValue: TDeinterlaceFilter);
begin
  if (FDeinterlaceFilter <> aValue) then
  begin
    FDeinterlaceFilter := aValue;
    UpdateDeInterlace();
  end;
end;

procedure TPasLibVlcPlayer.SetDeinterlaceMode(aValue: TDeinterlaceMode);
begin
  if (FDeinterlaceMode <> aValue) then
  begin
    FDeinterlaceMode := aValue;
    UpdateDeInterlace();
  end;
end;

procedure TPasLibVlcPlayer.SetHwnd();
begin
  if (p_mi = NIL) then exit;
  // assign self as view window
  {$IFDEF UNIX}
  libvlc_media_player_set_xwindow(p_mi, SELF.Handle);
  {$ENDIF}
  {$IFDEF MSWINDOWS}
  libvlc_media_player_set_hwnd(p_mi, SELF.Handle);
  {$ENDIF}
end;

function TPasLibVlcPlayer.GetPlayerHandle(): libvlc_media_player_t_ptr;
begin
  if (p_mi = NIL) then
  begin
    // create media player
    p_mi := libvlc_media_player_new(VLC.Handle);

    // handling mouse events by vlc ???
    libvlc_video_set_mouse_input(p_mi, 1);
    libvlc_video_set_key_input(p_mi, 1);

    p_mi_ev_mgr := libvlc_media_player_event_manager(p_mi);

    if Assigned(p_mi_ev_mgr) then
    begin
      libvlc_event_attach(p_mi_ev_mgr, libvlc_MediaPlayerMediaChanged,     lib_vlc_player_event_hdlr, SELF);
      libvlc_event_attach(p_mi_ev_mgr, libvlc_MediaPlayerNothingSpecial,   lib_vlc_player_event_hdlr, SELF);
      libvlc_event_attach(p_mi_ev_mgr, libvlc_MediaPlayerOpening,          lib_vlc_player_event_hdlr, SELF);
      libvlc_event_attach(p_mi_ev_mgr, libvlc_MediaPlayerBuffering,        lib_vlc_player_event_hdlr, SELF);
      libvlc_event_attach(p_mi_ev_mgr, libvlc_MediaPlayerPlaying,          lib_vlc_player_event_hdlr, SELF);
      libvlc_event_attach(p_mi_ev_mgr, libvlc_MediaPlayerPaused,           lib_vlc_player_event_hdlr, SELF);
      libvlc_event_attach(p_mi_ev_mgr, libvlc_MediaPlayerStopped,          lib_vlc_player_event_hdlr, SELF);
      libvlc_event_attach(p_mi_ev_mgr, libvlc_MediaPlayerForward,          lib_vlc_player_event_hdlr, SELF);
      libvlc_event_attach(p_mi_ev_mgr, libvlc_MediaPlayerBackward,         lib_vlc_player_event_hdlr, SELF);
      libvlc_event_attach(p_mi_ev_mgr, libvlc_MediaPlayerEndReached,       lib_vlc_player_event_hdlr, SELF);
      libvlc_event_attach(p_mi_ev_mgr, libvlc_MediaPlayerEncounteredError, lib_vlc_player_event_hdlr, SELF);
      libvlc_event_attach(p_mi_ev_mgr, libvlc_MediaPlayerTimeChanged,      lib_vlc_player_event_hdlr, SELF);
      libvlc_event_attach(p_mi_ev_mgr, libvlc_MediaPlayerPositionChanged,  lib_vlc_player_event_hdlr, SELF);
      libvlc_event_attach(p_mi_ev_mgr, libvlc_MediaPlayerSeekableChanged,  lib_vlc_player_event_hdlr, SELF);
      libvlc_event_attach(p_mi_ev_mgr, libvlc_MediaPlayerPausableChanged,  lib_vlc_player_event_hdlr, SELF);
      libvlc_event_attach(p_mi_ev_mgr, libvlc_MediaPlayerTitleChanged,     lib_vlc_player_event_hdlr, SELF);
      libvlc_event_attach(p_mi_ev_mgr, libvlc_MediaPlayerSnapshotTaken,    lib_vlc_player_event_hdlr, SELF);
      libvlc_event_attach(p_mi_ev_mgr, libvlc_MediaPlayerLengthChanged,    lib_vlc_player_event_hdlr, SELF);
    end;
  end;

  Result := p_mi;
end;

(*
 * mrl - media resource locator
 *
 * This can be file: c:\movie.avi
 *              ulr: http://host/movie.avi
 *              rtp: rstp://host/movie
 *)

procedure TPasLibVlcPlayer.Play(mrl: WideString; timeout: Cardinal = 10000);
var
  media : TPasLibVlcMedia;
begin
  if (SELF.Parent = NIL) then
  begin
    SELF.Parent := SELF.Owner as TWinControl;
  end;

  if (SELF.Parent = NIL) then exit;

  GetPlayerHandle();

  // stop
  libvlc_media_player_stop(p_mi);

  // create media
  media := TPasLibVlcMedia.Create(VLC, mrl);

  media.SetTitleShow(SELF.FTitleShow);
  media.SetVideoOnTop(SELF.FVideoOnTop);
  media.SetUseOverlay(SELF.FUseOverlay);
  media.AddOption('http-caching=1200');
  media.SetDeinterlaceFilter(FDeinterlaceFilter);
  media.SetDeinterlaceFilterMode(FDeinterlaceMode);

  // assign media to player
  libvlc_media_player_set_media(p_mi, media.MD);

  // release media
  media.Free;

  SetHwnd();

  // play
  libvlc_media_player_play(p_mi);

  FPosition    := 0;
  FTimeInMs    := 0;
  FLengthInMs  := 0;

  FVideoWidth  := -1;
  FVideoHeight := -1;

  // help for play http link
  if (Pos('http://', AnsiLowerCase(mrl)) > 0) then
  begin
    while (timeout > 0) do
    begin
      Sleep(10);
      Dec(timeout, 10);
      if (GetState() = plvPlayer_Ended) then
      begin
        PlayContinue();
        break;
      end;
    end;
  end;
end;

procedure TPasLibVlcPlayer.PlayContinue();
var
  p_md     : libvlc_media_t_ptr;
  p_ml     : libvlc_media_list_t_ptr;
  sub_p_md : libvlc_media_t_ptr;
  cnt      : Integer;
  mrl      : String; 
begin
  mrl := '';

  if (p_mi = NIL) then exit;
  
  p_md := libvlc_media_player_get_media(p_mi);
  if (p_md <> NIL) then
  begin
    p_ml := libvlc_media_subitems(p_md);
    if (p_ml <> NIL) then
    begin
      libvlc_media_list_lock(p_ml);
      cnt := libvlc_media_list_count(p_ml);
      if (cnt > 0) then
      begin
        sub_p_md := libvlc_media_list_item_at_index(p_ml, 0);
        mrl := System.UTF8Decode(libvlc_media_get_mrl(sub_p_md));
        libvlc_media_release(sub_p_md);
      end;
      libvlc_media_list_unlock(p_ml);
    end;

    libvlc_media_list_release(p_ml);

    libvlc_media_release(p_md);
  end;

  if (mrl <> '') then Play(mrl, 0);
end;

procedure TPasLibVlcPlayer.Pause();
begin
  if (p_mi = NIL) then exit;

  if (GetState() = plvPlayer_Playing) then
  begin
    libvlc_media_player_pause(p_mi);
  end;
end;

procedure TPasLibVlcPlayer.Resume();
begin
  if (p_mi = NIL) then exit;

  if (GetState() = plvPlayer_Paused)  then
  begin
    libvlc_media_player_play(p_mi);
  end;
end;

function TPasLibVlcPlayer.GetState(): TPasLibVlcPlayerState;
begin
  Result := plvPlayer_NothingSpecial;
  
  if (p_mi = NIL) then exit;
  
  case libvlc_media_player_get_state(p_mi) of
    libvlc_NothingSpecial: Result := plvPlayer_NothingSpecial;
    libvlc_Opening:        Result := plvPlayer_Opening;
    libvlc_Buffering:      Result := plvPlayer_Buffering;
    libvlc_Playing:        Result := plvPlayer_Playing;
    libvlc_Paused:         Result := plvPlayer_Paused;
    libvlc_Stopped:        Result := plvPlayer_Stopped;
    libvlc_Ended:          Result := plvPlayer_Ended;
    libvlc_Error:          Result := plvPlayer_Error;
  end;
end;

(*
 * Get current video width in pixels
 * If autoscale (scale = 0) then return original video width
 * If not autoscale (scale = xxx) then return video width * scale
 *)

function TPasLibVlcPlayer.GetVideoWidth(): LongInt;
begin
  Result := FVideoWidth;
end;

(*
 * Get current video height in pixels
 * If autoscale (scale = 0) then return original video height
 * If not autoscale (scale = xxx) then return video height * scale
 *)

function TPasLibVlcPlayer.GetVideoHeight(): LongInt;
begin
  Result := FVideoHeight;
end;

function TPasLibVlcPlayer.IsPlay(): Boolean;
begin
  Result := (GetState() = plvPlayer_Playing);
end;

(*
 * Get current video scale
 * I scale this by 100 (lib vlc return this im range 0..1)
 * If autoscale is on then return 0 else return actual scale
 *
 *)

function TPasLibVlcPlayer.GetVideoScaleInPercent(): Single;
begin
  Result := -1;
  if (p_mi = NIL) then exit;
  Result := libvlc_video_get_scale(p_mi) * 100;
end;

(*
 * Set current video scale
 * I scale this by 100 (lib vlc return this im range 0..1)
 * If return 0 then autoscale is on
 *
 *)

procedure TPasLibVlcPlayer.SetVideoScaleInPercent(newScaleInPercent: Single);
begin
  if (p_mi = NIL) then exit;
  libvlc_video_set_scale(p_mi, newScaleInPercent / 100);
end;

function TPasLibVlcPlayer.GetAspectRatio(): string;
begin
  Result := '';
  if (p_mi = NIL) then exit;
  Result := libvlc_video_get_aspect_ratio(p_mi);
end;

procedure TPasLibVlcPlayer.SetAspectRatio(newAspectRatio: string);
begin
  if (p_mi = NIL) then exit;
  libvlc_video_set_aspect_ratio(p_mi, PAnsiChar(newAspectRatio));
end;

(*
 * Return video time length in miliseconds
 *)
 
function TPasLibVlcPlayer.GetVideoLenInMs(): Int64;
begin
  Result := FLengthInMs;
end;

(*
 * Return current video time length as string hh:mm:ss
 *)

function TPasLibVlcPlayer.GetVideoLenStr(fmt: string = 'hh:mm:ss'): string;
begin
  Result := time2str(GetVideoLenInMs(), fmt);
end;

(*
 * Return current video time position in miliseconds
 *)

function TPasLibVlcPlayer.GetVideoPosInMs(): Int64;
begin
  Result := FTimeInMs;
end;

(*
 * Return current video time position as string hh:mm:ss
 *)

function TPasLibVlcPlayer.GetVideoPosStr(fmt: string = 'hh:mm:ss'): string;
begin
  Result := time2str(GetVideoPosInMs(), fmt);
end;

(*
 * Set current video time position in miliseconds
 * Not working for all media
 *)

procedure TPasLibVlcPlayer.SetVideoPosInMs(newPos: Int64);
begin
  if (p_mi = NIL) then exit;
  libvlc_media_player_set_time(p_mi, newPos);
end;

(*
 * Return current video position where 0 - start, 100 - end
 * I scale this by 100 (lib vlc return this im range 0..1)
 *)

function TPasLibVlcPlayer.GetVideoPosInPercent(): Single;
begin
  Result := FPosition * 100;
end;

(*
 * Set current video position where 0 - start, 100 - end
 * I scale this by 100 (lib vlc return this im range 0..1)
 * Not working for all media
 *)

procedure TPasLibVlcPlayer.SetVideoPosInPercent(newPos: Single);
begin
  if (p_mi = NIL) then exit;
  libvlc_media_player_set_position(p_mi, newPos / 100);
end;

(*
 * Return frames per second
 *)

function TPasLibVlcPlayer.GetVideoFps(): Single;
begin
  Result := -1;
  if (p_mi = NIL) then exit;
  Result := libvlc_media_player_get_fps(p_mi);
end;

(*
 * Return chapter if current video has chapters
 *)

function TPasLibVlcPlayer.GetVideoChapter(): Integer;
begin
  Result := -1;
  if (p_mi = NIL) then exit;
  Result := libvlc_media_player_get_chapter(p_mi);
end;

(*
 * Go to the chapter if current video has chapters
 *)

procedure TPasLibVlcPlayer.SetVideoChapter(newChapter: Integer);
begin
  if (p_mi = NIL) then exit;
  libvlc_media_player_set_chapter(p_mi, newChapter);
end;

(*
 * Return chapter count if current video has chapters
 *)

function TPasLibVlcPlayer.GetVideoChapterCount(): Integer;
begin
  Result := -1;
  if (p_mi = NIL) then exit;
  Result := libvlc_media_player_get_chapter_count(p_mi);
end;

(*
 * Return true if player can play
 *)

function TPasLibVlcPlayer.CanPlay(): Boolean;
begin
  Result := FALSE;
  if (p_mi = NIL) then exit;
  Result := (libvlc_media_player_will_play(p_mi) > 0);
end;

(*
 * Return true if player can pause
 *)

function TPasLibVlcPlayer.CanPause(): Boolean;
begin
  Result := FALSE;
  if (p_mi = NIL) then exit;
  Result := (libvlc_media_player_can_pause(p_mi) > 0);
end;

(*
 * Return true if player can seek (set time or percent position)
 *)

function TPasLibVlcPlayer.CanSeek(): Boolean;
begin
  Result := FALSE;
  if (p_mi = NIL) then exit;
  Result := (libvlc_media_player_is_seekable(p_mi) > 0);
end;

(*
 * Create snapshot of current video frame to specified fileName
 * The file is in PNG format
 *)
 
function TPasLibVlcPlayer.SnapShot(fileName: WideString): Boolean;
var
  i_width, i_height: LongWord;
begin
  Result := FALSE;
  if (p_mi = NIL) then exit;
  {$IFDEF FPC}
  i_width := 0;
  i_height := 0;
  {$ENDIF}
  if (libvlc_video_get_size(p_mi, 0, i_width, i_height) <> 0) then exit;
  Result := (libvlc_video_take_snapshot(p_mi, 0, PAnsiChar(System.UTF8Encode(fileName)), i_width, i_height) = 0);
end;

(*
 * Create snapshot of current video frame
 * to specified fileName with size width x heght
 * The file is in PNG format
 *)

function TPasLibVlcPlayer.Snapshot(fileName: WideString; width, height: LongWord): Boolean;
begin
  Result := FALSE;
  if (p_mi = NIL) then exit;
  Result := (libvlc_video_take_snapshot(p_mi, 0, PAnsiChar(System.UTF8Encode(fileName)), width, height) = 0);
end;

procedure TPasLibVlcPlayer.NextFrame();
begin
  if (p_mi = NIL) then exit;
  libvlc_media_player_next_frame(p_mi);
end;

function TPasLibVlcPlayer.GetAudioMute(): Boolean;
begin
  Result := FMute;
end;

procedure TPasLibVlcPlayer.SetAudioMute(mute: Boolean);
begin
  if (p_mi = NIL) then exit;
  if mute then libvlc_audio_set_mute(p_mi, 1)
  else         libvlc_audio_set_mute(p_mi, 0);
end;

function TPasLibVlcPlayer.GetAudioVolume(): Integer;
begin
  Result := -1;
  if (p_mi = NIL) then exit;
  Result := libvlc_audio_get_volume(p_mi);
end;

procedure TPasLibVlcPlayer.SetAudioVolume(volumeLevel: Integer);
begin
  if (p_mi = NIL) then exit;
  if (volumeLevel < 0) then exit;
  if (volumeLevel > 200) then exit;
  libvlc_audio_set_volume(p_mi, volumeLevel);
end;

procedure TPasLibVlcPlayer.SetPlayRate(rate: Integer);
begin
  if (p_mi = NIL) then exit;
  if (rate < 1) then exit;
  if (rate > 1000) then exit;  
  libvlc_media_player_set_rate(p_mi, rate / 100);
end;

function TPasLibVlcPlayer.GetPlayRate(): Integer;
begin
  Result := -1;
  if (p_mi = NIL) then exit;
  Result := Round(100 * libvlc_media_player_get_rate(p_mi));
end;

////////////////////////////////////////////////////////////////////////////////

procedure TPasLibVlcPlayer.FullScreenSetMode(mode: Boolean);
begin
  if (mode) then
  begin
    {$IFDEF UNIX}
//    Windows.SetParent(SELF.Handle, Windows.GetDesktopWindow());
    {$ENDIF}
    {$IFDEF MSWINDOWS}
    Windows.SetParent(SELF.Handle, Windows.GetDesktopWindow());
    {$ENDIF}
    libvlc_set_fullscreen(p_mi, 1);
  end
  else
  begin
    libvlc_set_fullscreen(p_mi, 0);
    {$IFDEF UNIX}
//    Windows.SetParent(SELF.Handle, FParentWindow);
    {$ENDIF}
    {$IFDEF MSWINDOWS}
    Windows.SetParent(SELF.Handle, FParentWindow);
    {$ENDIF}
  end;
end;

function TPasLibVlcPlayer.FullScreenGetMode(): boolean;
begin
  Result := (libvlc_get_fullscreen(p_mi) <> 0);
end;

////////////////////////////////////////////////////////////////////////////////

function  TPasLibVlcPlayer.GetAudioTrackCount(): Integer;
begin
  Result := -1;
  if (p_mi = NIL) then exit;
  Result := libvlc_audio_get_track_count(p_mi);
end;

function  TPasLibVlcPlayer.GetAudioTrack(): Integer;
begin
  Result := -1;
  if (p_mi = NIL) then exit;
  Result := libvlc_audio_get_track(p_mi);
end;

procedure TPasLibVlcPlayer.SetAudioTrack(track: Integer);
begin
  if (p_mi = NIL) then exit;
  if (track < 0) then exit;
  
  libvlc_audio_set_track(p_mi, track);
end;

function  TPasLibVlcPlayer.GetAudioTrackDescription(track: Integer): WideString;
var
  p_track: libvlc_track_description_t_ptr;
begin
  Result := '';

  if (track < 0) then exit;
  
  if not Assigned(p_mi) then exit;

  p_track := libvlc_audio_get_track_description(p_mi);

  while ((track > 0) and (p_track <> NIL)) do
  begin
    Dec(track);
    p_track := p_track^.p_next;
  end;
  
  if (p_track <> NIL) then
  begin
    if (p_track^.psz_name <> NIL) then
    begin
      Result := System.UTF8Decode(p_track^.psz_name);
    end;
  end;
end;

function TPasLibVlcPlayer.GetChannel(): Integer;
begin
  Result := -1;
  if not Assigned(p_mi) then exit;
  Result := libvlc_audio_get_channel(p_mi);
end;

procedure TPasLibVlcPlayer.SetChannel(chanel: Integer);
begin
  if not Assigned(p_mi) then exit;
  libvlc_audio_set_channel(p_mi, chanel);
end;

function  TPasLibVlcPlayer.GetAudioDelay(): Int64;
begin
  Result := 0;
  if not Assigned(p_mi) then exit;
  Result := libvlc_audio_get_delay(p_mi);
end;

procedure TPasLibVlcPlayer.SetAudioDelay(delay: Int64);
begin
  if not Assigned(p_mi) then exit;
  libvlc_audio_set_delay(p_mi, delay);
end;

////////////////////////////////////////////////////////////////////////////////

procedure TPasLibVlcPlayer.InternalHandleEventPositionChanged(position: Single);
begin
  SELF.FPosition := position;
  if Assigned(OnMediaPlayerPositionChanged) then
    OnMediaPlayerPositionChanged(SELF, position * 100);
end;

procedure TPasLibVlcPlayer.InternalHandleEventTimeChanged(time: Int64);
var
  px, py: LongWord;
begin
  SELF.FTimeInMs := time;

  if (FVideoWidth = -1) and (time > 0) then
  begin
    {$IFDEF FPC}
    px := 0;
    py := 0;
    {$ENDIF}
    if (libvlc_video_get_size(p_mi, 0, px, py) = 0) then
    begin
      FVideoWidth := px;
      FVideoHeight := py;
    end;
  end;
  if Assigned(OnMediaPlayerTimeChanged) then
    OnMediaPlayerTimeChanged(SELF, time);
end;

procedure TPasLibVlcPlayer.InternalHandleEventLengthChanged(time: Int64);
begin
  SELF.FLengthInMs := time;
  if Assigned(OnMediaPlayerLengthChanged) then
    OnMediaPlayerLengthChanged(SELF, time);
end;

////////////////////////////////////////////////////////////////////////////////

procedure TPasLibVlcPlayer.InternalOnClick(Sender: TObject);
begin
  if Assigned(OnClick) then
    OnClick(SELF);
end;

procedure TPasLibVlcPlayer.InternalOnDblClick(Sender: TObject);
begin
  if Assigned(OnDblClick) then
    OnDblClick(SELF);
end;

procedure TPasLibVlcPlayer.InternalOnMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Assigned(OnMouseDown) then
    OnMouseDown(SELF, Button, Shift, X, Y);
end;

procedure TPasLibVlcPlayer.InternalOnMouseEnter(Sender: TObject);
begin
end;

procedure TPasLibVlcPlayer.InternalOnMouseLeave(Sender: TObject);
begin
end;

procedure TPasLibVlcPlayer.InternalOnMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if Assigned(OnMouseMove) then
    OnMouseMove(SELF, Shift, X, Y);
end;

procedure TPasLibVlcPlayer.InternalOnMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Assigned(OnMouseUp) then
    OnMouseUp(SELF, Button, Shift, X, Y);
end;

////////////////////////////////////////////////////////////////////////////////

procedure lib_vlc_player_event_hdlr(p_event: libvlc_event_t_ptr; data: Pointer); cdecl;
var
  player: TPasLibVlcPlayer;
begin
  if (data = NIL) then exit;
  player := TPasLibVlcPlayer(data);
  
  if not Assigned(player) then exit;
  
  case p_event^.event_type of

    libvlc_MediaPlayerMediaChanged:
    begin
      if Assigned(player.OnMediaPlayerMediaChanged) then
        player.OnMediaPlayerMediaChanged(player);
    end;

    libvlc_MediaPlayerNothingSpecial:
      if Assigned(player.OnMediaPlayerNothingSpecial) then
        player.OnMediaPlayerNothingSpecial(player);

    libvlc_MediaPlayerOpening:
      if Assigned(player.OnMediaPlayerOpening) then
        player.OnMediaPlayerOpening(player);

    libvlc_MediaPlayerBuffering:
      if Assigned(player.OnMediaPlayerBuffering) then
        player.OnMediaPlayerBuffering(player);

    libvlc_MediaPlayerPlaying:
      if Assigned(player.OnMediaPlayerPlaying) then
        player.OnMediaPlayerPlaying(player);

    libvlc_MediaPlayerPaused:
      if Assigned(player.OnMediaPlayerPaused) then
        player.OnMediaPlayerPaused(player);

    libvlc_MediaPlayerStopped:
      if Assigned(player.OnMediaPlayerStopped) then
        player.OnMediaPlayerStopped(player);

    libvlc_MediaPlayerForward:
      if Assigned(player.OnMediaPlayerForward) then
        player.OnMediaPlayerForward(player);

    libvlc_MediaPlayerBackward:
      if Assigned(player.OnMediaPlayerBackward) then
        player.OnMediaPlayerBackward(player);

    libvlc_MediaPlayerEndReached:
      if Assigned(player.OnMediaPlayerEndReached) then
        player.OnMediaPlayerEndReached(player);

    libvlc_MediaPlayerEncounteredError: begin
      player.FError := libvlc_errmsg();
      if Assigned(player.OnMediaPlayerEncounteredError) then
        player.OnMediaPlayerEncounteredError(player);
    end;

    libvlc_MediaPlayerTimeChanged:
      player.InternalHandleEventTimeChanged(
        p_event^.media_player_time_changed.new_time);

    libvlc_MediaPlayerPositionChanged:
      player.InternalHandleEventPositionChanged(
        p_event^.media_player_position_changed.new_position);

    libvlc_MediaPlayerSeekableChanged:
      if Assigned(player.OnMediaPlayerSeekableChanged) then
        player.OnMediaPlayerSeekableChanged(player,
          p_event^.media_player_seekable_changed.new_seekable <> 0);

    libvlc_MediaPlayerPausableChanged:
      if Assigned(player.OnMediaPlayerPausableChanged) then
        player.OnMediaPlayerPausableChanged(player,
          p_event^.media_player_pausable_changed.new_pausable <> 0);

    libvlc_MediaPlayerTitleChanged:
      if Assigned(player.OnMediaPlayerTitleChanged) then
        player.OnMediaPlayerTitleChanged(player,
          p_event^.media_player_title_changed.new_title);

    libvlc_MediaPlayerSnapshotTaken:
      if Assigned(player.OnMediaPlayerSnapshotTaken) then
        player.OnMediaPlayerSnapshotTaken(player,
          p_event^.media_player_snapshot_taken.psz_filename);

    libvlc_MediaPlayerLengthChanged:
      player.InternalHandleEventLengthChanged(
        p_event^.media_player_length_changed.new_length);
  end;
end;

procedure lib_vlc_media_list_event_hdlr(p_event: libvlc_event_t_ptr; data: Pointer); cdecl;
var
  mediaList: TPasLibVlcMediaList;
begin
  if (data = NIL) then exit;
  mediaList := TPasLibVlcMediaList(data);
  
  if not Assigned(mediaList) then exit;

  case p_event^.event_type of
    libvlc_MediaListItemAdded:
      mediaList.InternalHandleEventItemAdded(
        p_event^.media_list_item_added.item,
        p_event^.media_list_item_added.index);

    libvlc_MediaListWillAddItem:
      mediaList.InternalHandleEventWillAddItem(
        p_event^.media_list_will_add_item.item,
        p_event^.media_list_will_add_item.index);

    libvlc_MediaListItemDeleted:
      mediaList.InternalHandleEventItemDeleted(
        p_event^.media_list_item_deleted.item,
        p_event^.media_list_item_deleted.index);

    libvlc_MediaListWillDeleteItem:
      mediaList.InternalHandleEventWillDeleteItem(
        p_event^.media_list_will_delete_item.item,
        p_event^.media_list_will_delete_item.index);
  end;  
end;

procedure lib_vlc_media_list_player_event_hdlr(p_event: libvlc_event_t_ptr; data: Pointer); cdecl;
var
  mediaList: TPasLibVlcMediaList;
begin
  if (data = NIL) then exit;
  mediaList := TPasLibVlcMediaList(data);
  
  if not Assigned(mediaList) then exit;
  
  case p_event^.event_type of

    // event defined in libvlc but not used by libvlc event menager
    // libvlc_MediaListPlayerPlayed:
    //   if Assigned(mediaList.OnPlayed) then mediaList.OnPlayed(mediaList);

    // event defined in libvlc but not used by libvlc event menager
    // libvlc_MediaListPlayerStopped:
    //   if Assigned(mediaList.OnStopped) then mediaList.OnStopped(mediaList);

    libvlc_MediaListPlayerNextItemSet:
      mediaList.InternalHandleEventPlayerNextItemSet(
        p_event^.media_list_player_next_item_set.item);
  end;
end;

procedure libvlc_vlm_event_hdlr(p_event: libvlc_event_t_ptr; data: Pointer); cdecl;
begin

  case p_event^.event_type of

    libvlc_VlmMediaAdded: begin

      System.UTF8Decode(p_event^.vlm_media_event.psz_media_name^);
      System.UTF8Decode(p_event^.vlm_media_event.psz_instance_name^);

    end;

    libvlc_VlmMediaRemoved: begin

    end;

    libvlc_VlmMediaChanged: begin

    end;

    libvlc_VlmMediaInstanceStarted: begin

    end;

    libvlc_VlmMediaInstanceStopped: begin

    end;

    libvlc_VlmMediaInstanceStatusInit: begin

    end;

    libvlc_VlmMediaInstanceStatusOpening: begin

    end;

    libvlc_VlmMediaInstanceStatusPlaying: begin

    end;

    libvlc_VlmMediaInstanceStatusPause: begin

    end;

    libvlc_VlmMediaInstanceStatusEnd: begin

    end;

    libvlc_VlmMediaInstanceStatusError: begin

    end;
  end;
end;

////////////////////////////////////////////////////////////////////////////////

initialization

{$IFDEF FPC}

LazarusResources.Add('TPasLibVlcPlayer','PNG',[
  #137#80#78#71#13#10#26#10#0#0#0#13#73#72#68#82#0#0#0#16#0#0#0#16#8#3#0#0#0#40#45
  +#15#83#0#0#0#1#115#82#71#66#0#174#206#28#233#0#0#0#4#103#65#77#65#0#0#177#143
  +#11#252#97#5#0#0#0#32#99#72#82#77#0#0#122#38#0#0#128#132#0#0#250#0#0#0#128#232
  +#0#0#117#48#0#0#234#96#0#0#58#152#0#0#23#112#156#186#81#60#0#0#3#0#80#76#84#69
  +#0#0#0#128#0#0#0#128#0#128#128#0#0#0#128#128#0#128#0#128#128#192#192#192#192#220
  +#192#166#202#240#64#32#0#96#32#0#128#32#0#160#32#0#192#32#0#224#32#0#0#64#0#32
  +#64#0#64#64#0#96#64#0#128#64#0#160#64#0#192#64#0#224#64#0#0#96#0#32#96#0#64#96
  +#0#96#96#0#128#96#0#160#96#0#192#96#0#224#96#0#0#128#0#32#128#0#64#128#0#96#128
  +#0#128#128#0#160#128#0#192#128#0#224#128#0#0#160#0#32#160#0#64#160#0#96#160#0
  +#128#160#0#160#160#0#192#160#0#224#160#0#0#192#0#32#192#0#64#192#0#96#192#0#128
  +#192#0#160#192#0#192#192#0#224#192#0#0#224#0#32#224#0#64#224#0#96#224#0#128#224
  +#0#160#224#0#192#224#0#224#224#0#0#0#64#32#0#64#64#0#64#96#0#64#128#0#64#160#0
  +#64#192#0#64#224#0#64#0#32#64#32#32#64#64#32#64#96#32#64#128#32#64#160#32#64#192
  +#32#64#224#32#64#0#64#64#32#64#64#64#64#64#96#64#64#128#64#64#160#64#64#192#64
  +#64#224#64#64#0#96#64#32#96#64#64#96#64#96#96#64#128#96#64#160#96#64#192#96#64
  +#224#96#64#0#128#64#32#128#64#64#128#64#96#128#64#128#128#64#160#128#64#192#128
  +#64#224#128#64#0#160#64#32#160#64#64#160#64#96#160#64#128#160#64#160#160#64#192
  +#160#64#224#160#64#0#192#64#32#192#64#64#192#64#96#192#64#128#192#64#160#192#64
  +#192#192#64#224#192#64#0#224#64#32#224#64#64#224#64#96#224#64#128#224#64#160#224
  +#64#192#224#64#224#224#64#0#0#128#32#0#128#64#0#128#96#0#128#128#0#128#160#0#128
  +#192#0#128#224#0#128#0#32#128#32#32#128#64#32#128#96#32#128#128#32#128#160#32
  +#128#192#32#128#224#32#128#0#64#128#32#64#128#64#64#128#96#64#128#128#64#128#160
  +#64#128#192#64#128#224#64#128#0#96#128#32#96#128#64#96#128#96#96#128#128#96#128
  +#160#96#128#192#96#128#224#96#128#0#128#128#32#128#128#64#128#128#96#128#128#128
  +#128#128#160#128#128#192#128#128#224#128#128#0#160#128#32#160#128#64#160#128#96
  +#160#128#128#160#128#160#160#128#192#160#128#224#160#128#0#192#128#32#192#128
  +#64#192#128#96#192#128#128#192#128#160#192#128#192#192#128#224#192#128#0#224#128
  +#32#224#128#64#224#128#96#224#128#128#224#128#160#224#128#192#224#128#224#224
  +#128#0#0#192#32#0#192#64#0#192#96#0#192#128#0#192#160#0#192#192#0#192#224#0#192
  +#0#32#192#32#32#192#64#32#192#96#32#192#128#32#192#160#32#192#192#32#192#224#32
  +#192#0#64#192#32#64#192#64#64#192#96#64#192#128#64#192#160#64#192#192#64#192#224
  +#64#192#0#96#192#32#96#192#64#96#192#96#96#192#128#96#192#160#96#192#192#96#192
  +#224#96#192#0#128#192#32#128#192#64#128#192#96#128#192#128#128#192#160#128#192
  +#192#128#192#224#128#192#0#160#192#32#160#192#64#160#192#96#160#192#128#160#192
  +#160#160#192#192#160#192#224#160#192#0#192#192#32#192#192#64#192#192#96#192#192
  +#128#192#192#160#192#192#255#251#240#160#160#164#128#128#128#255#0#0#0#255#0#255
  +#255#0#0#0#255#255#0#255#0#255#255#255#255#255#88#210#52#68#0#0#0#158#73#68#65
  +#84#40#83#93#144#177#14#130#64#12#134#201#45#237#88#20#19#226#0#113#187#103#18
  +#22#48#106#34#131#241#157#216#36#185#193#147#123#44#39#203#136#133#51#193#243
  +#166#246#75#255#175#205#69#227#223#139#124#207#135#134#125#245#5#46#217#97#0#94
  +#101#21#2#30#186#95#192#12#0#136#179#101#118#224#53#43#239#77#31#128#181#210#118
  +#1#18#41#106#219#155#73#35#17#118#200#48#192#8#198#201#140#0#147#159#205#177#125
  +#227#195#78#90#1#167#77#158#37#113#117#211#234#34#25#1#88#196#219#21#41#173#210
  +#244#233#215#98#77#74#17#237#59#240#17#209#118#68#109#120#250#242#7#31#39#227
  +#185#249#70#69#223#121#0#0#0#0#73#69#78#68#174#66#96#130
]);

LazarusResources.Add('TPasLibVlcMediaList','PNG',[
  #137#80#78#71#13#10#26#10#0#0#0#13#73#72#68#82#0#0#0#16#0#0#0#16#8#2#0#0#0#144
  +#145#104#54#0#0#0#1#115#82#71#66#0#174#206#28#233#0#0#0#4#103#65#77#65#0#0#177
  +#143#11#252#97#5#0#0#0#32#99#72#82#77#0#0#122#38#0#0#128#132#0#0#250#0#0#0#128
  +#232#0#0#117#48#0#0#234#96#0#0#58#152#0#0#23#112#156#186#81#60#0#0#0#100#73#68
  +#65#84#56#79#99#252#255#255#63#3#73#0#168#33#57#53#153#72#4#50#29#162#1#72#98
  +#5#64#169#115#231#207#65#16#68#25#138#6#52#123#32#102#65#148#98#215#128#105#9
  +#166#17#8#27#24#26#24#48#17#62#39#129#84#3#3#12#25#53#48#80#213#6#106#134#18#206
  +#96#37#45#148#168#230#36#228#128#34#54#105#96#137#105#210#18#31#174#148#135#85
  +#28#0#127#207#232#162#154#33#32#15#0#0#0#0#73#69#78#68#174#66#96#130
]);

{$ENDIF}

finalization

end.