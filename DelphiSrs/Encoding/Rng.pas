unit RNG;
{Copyright:      Hagen Reddmann  mailto:HaReddmann@AOL.COM
 Author:         Hagen Reddmann
 Remarks:        freeware, but this Copyright must be included
 known Problems: none
 Version:        1.0
                 Delphi 2-4, designed and testet under D3 and D4
 Description:    Secure Random Number Generator with Period 2^256-1
                 with the use of Hash.pas or Cipher.pas units produced
                 this secure Random Numbers
                 with RndSeed(nil, -1) absolutly random
                 
 Comments:       with the procedure RndSetManager can be set a other RNG

 Speed:          of a PII 266MHz with 64Mb
                 without Protection,
                   RndProtect(nil, '')                        > 1024 Kb/sec
                 with Protection,
                   RndProtect(TCipher_Blowfish, 'Password')   >  850 Kb/sec
                   RndProtect(THash_MD4, 'Password')          >  731 Kb/sec

 * THIS SOFTWARE IS PROVIDED BY THE AUTHORS ''AS IS'' AND ANY EXPRESS
 * OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHORS OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
 * BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
 * OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 }
interface

uses Classes;

type
  PRndManager = ^TRndManager;
  TRndManager = packed record
                  Rnd: function(Bits: Integer): Integer;
                  RndBuffer: procedure(var Buffer; Size: Integer);
                  RndSeed: procedure(const Buffer: Pointer; Size: Integer);
                  RndProtect: procedure(const Protect: TClass; const Password: String);
                  RndProtectBuffer: procedure(const Protect: TClass; var Buffer; Size: Integer);
                end;

function  RndCount: Integer;
function  Rnd(Bits: Integer): Integer;
procedure RndBuffer(var Buffer; Size: Integer; Seed: Boolean);
procedure RndSeed(const Buffer: Pointer; Size: Integer);
procedure RndProtect(const Protect: TClass; const Password: String);
procedure RndSetManager(Manager: TRndManager);
procedure RndGetManager(var Manager: TRndManager);

{RndCount: Integer
   Count was Rnd() or RndBuffer() called

 Rnd(Bits: Integer): Integer
   build a Random Number with Size of Bits, Bits can be 1-32
   i.E. Rnd( 1)  build a Number from 0 to 1 a Boolean
        Rnd( 8)  build a Number from 0 to 255 a Byte
        Rnd(16)  build a Number from 0 to 65535 a Word
        Rnd(32)  build a Number from -MaxInt to +MaxInt

 RndBuffer(var Buffer; Size: Integer; Seed: Boolean);
   Fill the Buffer from Size Bytes randomly, if Seed then before calls RndSeed(nil, -1)

 RndSeed(const Buffer: Pointer; Size: Integer);
   Set the internal Random register,
   Size < 0 Buffer is ignored and the internal Seed Register is set with absolulty randomly
            data's from:
            GetCursorPos, GlobalMemoryStatus, GetCurrentProcessID, GetCurrentTaskID,
            GetTickCount, GetMessageTime and RandomCount
   Size = 0 Buffer is ignored the internal Seed Register is set to the Inital Values
   Size > 0 internal Seed register is filled with Buffer,
            eventl. rest is set to the Initial Values

 RndProtect(const Protect: TClass; const Password: String);
   ok, when you used Hash.pas or Cipher.pas, you can set with this a Protection to
   produce with RndSeed(), Rnd() and RndBuffer() secure Random Numbers
   Hash.pas and Cipher.pas have installed a new TRndManager
    i.E. call RndProtect(THash_RipeMD128, 'Password') or
              RndProtect(TCipher_Blowfish, 'Password').
         call RndProtect(nil, '') to restore the normal Mode.
    after a call with a valid Hash or Cipher, can you reinitialize the internal
    Seed Register with RndSeed() to perfrom a new secret Start Seed Value.
    all calls to RndBuffer() will be than encrypt the Buffer with the
    setting Cipher or Hash.
    Only one from this (by the last call) is the actual encryption Method.

 RndSetManager(Manager: TRndManager);
 RndGetManager(var Manager: TRndManager);
  Set/Get the Random Manager, with this can you install other Random function}

implementation

uses Windows;


{$IFNDEF VER120} //for Delphi 2-3
  {$IFNDEF VER125}
    {$IFNDEF VER130}
type
  LongWord  = Integer;
    {$ENDIF}
  {$ENDIF}
{$ENDIF}

var
  FLSR: array[0..7] of LongWord;
  FRndCount: Integer = 0;
  FRndClass: TClass = nil;
  FMngr: TRndManager;

const
  Magic: array[0..7] of LongWord =
          ($F1631896, $6448CE50, $7D7F08C0, $B75E90AA,
           $7E980B27, $B4B9934D, $F87A0F0E, $549CFE83);

function RndCount: Integer;
begin
  Result := FRndCount;
end;

function Rnd(Bits: Integer): Integer;
begin
  Result := FMngr.Rnd(Bits);
  Inc(FRndCount);
end;

procedure RndBuffer(var Buffer; Size: Integer; Seed: Boolean);
begin
  if Seed then RndSeed(nil, -1);
  FMngr.RndBuffer(Buffer, Size);
  Inc(FRndCount);
end;

procedure RndSeed(const Buffer: Pointer; Size: Integer);
begin
  FMngr.RndSeed(Buffer, Size);
end;

procedure RndProtect(const Protect: TClass; const Password: String);
begin
  FRndClass := Protect;
  FMngr.RndProtect(Protect, Password);
end;

function RNGRnd(Bits: Integer): Integer; assembler;
asm
      MOV     ECX,EAX
      XOR     EAX,EAX
@@1:  SHL     EAX,1
      RCL     DWord Ptr FLSR[ 0],1
      RCL     DWord Ptr FLSR[ 4],1
      RCL     DWord Ptr FLSR[ 8],1
      RCL     DWord Ptr FLSR[12],1
      RCL     DWord Ptr FLSR[16],1
      RCL     DWord Ptr FLSR[20],1
      RCL     DWord Ptr FLSR[24],1
      RCL     DWord Ptr FLSR[28],1
      JC      @@2
      INC     EAX
      XOR     DWord Ptr FLSR[ 0],not $78
@@2:  DEC     ECX
      JNZ     @@1
end;

procedure RNGRndBuffer(var Buffer; Size: Integer);

  procedure RNGRndBufASM(var Buffer; Size: Integer);
  asm
      PUSH    EDI
      PUSH    EBX
      MOV     EDI,EAX
      MOV     EBX,EDX
      SHR     EDX,2
      JZ      @@3
@@0:  XOR     EAX,EAX
      MOV     ECX,32
@@1:  SHL     EAX,1
      RCL     DWord Ptr FLSR[ 0],1
      RCL     DWord Ptr FLSR[ 4],1
      RCL     DWord Ptr FLSR[ 8],1
      RCL     DWord Ptr FLSR[12],1
      RCL     DWord Ptr FLSR[16],1
      RCL     DWord Ptr FLSR[20],1
      RCL     DWord Ptr FLSR[24],1
      RCL     DWord Ptr FLSR[28],1
      JC      @@2
      INC     EAX
      XOR     DWord Ptr FLSR[ 0],not $78
@@2:  DEC     ECX
      JNZ     @@1
      STOSD
      DEC     EDX
      JNZ     @@0
@@3:  MOV     EDX,EBX
      AND     EDX,03h
      JZ      @@5
      MOV     EAX,EDX
      SHL     EAX,3
      CALL    RNGRnd
@@4:  STOSB
      SHR     EAX,8
      DEC     EDX
      JNZ     @@4
@@5:  POP     EBX
      POP     EDI
  end;

begin
  if Size <= 0 then Exit;
  RNGRndBufASM(Buffer, Size);
  FMngr.RndProtectBuffer(FRndClass, Buffer, Size);
end;

procedure RNGRndSeed(const Buffer: Pointer; Size: Integer);
var
  P: TPoint;
  M: TMemoryStatus;
begin
  Move(Magic, FLSR, SizeOf(FLSR));
  if (Size > 0) and (Buffer <> nil) then
  begin
    if Size > SizeOf(FLSR) then Size := SizeOf(FLSR);
    Move(Buffer, FLSR, Size);
  end else
    if Size < 0 then
    begin
      M.dwLength := SizeOf(M);
      GlobalMemoryStatus(M);
      GetCursorPos(P);
      M.dwLength := M.dwLength xor Cardinal(FRndCount);
      M.dwMemoryLoad := M.dwMemoryLoad xor GetCurrentProcessID;
      M.dwTotalPhys := M.dwTotalPhys xor GetCurrentThreadID;
      M.dwAvailPhys := M.dwAvailPhys xor Cardinal(P.X);
      M.dwTotalPageFile := M.dwTotalPageFile xor cardinal(P.Y);
      M.dwAvailPageFile := M.dwAvailPageFile xor GetTickCount;
      M.dwTotalVirtual := M.dwTotalVirtual xor Cardinal(GetMessageTime);
      M.dwAvailVirtual := M.dwAvailVirtual xor Cardinal(FRndCount);
      Size := SizeOf(M);
      if Size > SizeOf(FLSR) then Size := SizeOf(FLSR);
      Move(M, FLSR, Size);
      RNGRnd(SizeOf(FLSR) * 16);
    end;
  FMngr.RndProtectBuffer(FRndClass, FLSR, SizeOf(FLSR));
end;

procedure RNGRndProtect(const Protect: TClass; const Password: String);
begin
end;

procedure RNGRndProtectBuffer(const Protect: TClass; var Buffer; Size: Integer);
begin
end;

procedure RndSetManager(Manager: TRndManager);
begin
  with Manager do
  begin
    if not Assigned(Rnd) then Rnd := FMngr.Rnd;
    if not Assigned(RndBuffer) then RndBuffer := FMngr.RndBuffer;
    if not Assigned(RndSeed) then RndSeed := FMngr.RndSeed;
    if not Assigned(RndProtect) then RndProtect := FMngr.RndProtect;
    if not Assigned(RndProtectBuffer) then RndProtectBuffer := FMngr.RndProtectBuffer;
  end;
  Move(Manager, FMngr, SizeOf(Manager));
  if not Assigned(FMngr.Rnd) then FMngr.Rnd := RNGRnd;
  if not Assigned(FMngr.RndBuffer) then FMngr.RndBuffer := RNGRndBuffer;
  if not Assigned(FMngr.RndSeed) then FMngr.RndSeed := RNGRndSeed;
  if not Assigned(FMngr.RndProtect) then FMngr.RndProtect := RNGRndProtect;
  if not Assigned(FMngr.RndProtectBuffer) then FMngr.RndProtectBuffer := RNGRndProtectBuffer;
  FMngr.RndProtectBuffer(FRndClass, FLSR, SizeOf(FLSR));
end;

procedure RndGetManager(var Manager: TRndManager);
begin
  Move(FMngr, Manager, SizeOf(Manager));
end;

procedure RestoreRNG;
begin
  Move(Magic, FLSR, SizeOf(FLSR));
  FRndCount := 0;
  FRndClass := nil;
  FMngr.Rnd := RNGRnd;
  FMngr.RndBuffer := RNGRndBuffer;
  FMngr.RndSeed := RNGRndSeed;
  FMngr.RndProtect := RNGRndProtect;
  FMngr.RndProtectBuffer := RNGRndProtectBuffer;
end;

initialization
  RestoreRNG;
finalization
  RestoreRNG;
end.
