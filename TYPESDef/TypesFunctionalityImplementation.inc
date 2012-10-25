{
  ПРАВИЛО: когда пишешь свои процедуры изменения свойств, не забывай в конце
           вставлять DoOnComponentUpdate
           для обновления подсистем типов пространства и Proxy-пространств

  ПРАВИЛО: меняешь структуру таблицы, - меняй и метод _Clone

  ПРАВИЛО: определяешь новое действие в TComponentFunctionality прежде всех операторов
           ставь CheckUserOperation(idOperation), где idOperation - ид операции, определенной
           в таблице SecurityComponentOperations

  ПРАВИЛО: если определяешь операцию по чтению, то после CheckUserOperation(idWriteOperation)
           блокируй компонент на чтение
              LockRead;
              try
              ... операция чтения
              finally
              Unlock;
              end;
           если на запись, то
              LockWrite;
              try
              ... операция модификации
              finally
              Unlock;
              end;

  ПРАВИЛО: если новое действие непосредственно вызывается пользователем (например LoadFromFile),
           то вставляй Space.CheckUserDATASize(DS), где DS - размер добавляемых данных перед
           загрузкой данных, и Space.UserAddDATASize(DS) после загрузки, проверив предварительно
           flUserSecurityDisabled

  ПРАВИЛО: после блокироки системы типов TypeSystem.Lock.Enter нельзя использовать блокировку пространство Space.Lock.Enter

  ПРАВИЛО: StayUpToDate() нельзя использовать внутри (Space.Lock.Enter ... Space.Lock.Leave)

  ПРАВИЛО: Суффикс "Locally" используется для методов которые берут данные из местного контекста
           (если они есть, если их нет, то запрашивается сервер)

  ПРАВИЛО: не используй медод Assign() для Bitmap-ов. Чревато взаимоблокировкой. Определено при стресстестировании.
}

Const
  SNotSupported = 'not supported';

  
{TTCUSTOMVisualizationFunctionality}

Constructor TTCUSTOMVisualizationFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTCUSTOMVisualization;
RemotedFunctionality:=TTCUSTOMVisualizationFunctionalityRemoted.Create(Self);
end
;

function TTCUSTOMVisualizationFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

function TTCUSTOMVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TCUSTOMVisualizationFunctionality.Create(Self, idComponent);
end
;
function TTCUSTOMVisualizationFunctionality.getName: string;
begin
Result:=nmTCUSTOMVisualization;
end;


function TTCUSTOMVisualizationFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TypesDef\CUSTOMVisualization\CUSTOMVisualization.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

function TTCUSTOMVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TObjectVisualization.Create;
with Result do begin
Color:=clWhite;
Width:=0;
flLoop:=false;
AddPoint(-50,0);
AddPoint(50,0);
end;
end
;

{TCUSTOMVisualizationFunctionality}
Constructor TCUSTOMVisualizationFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TCUSTOMVisualizationFunctionalityRemoted.Create(Self);
end;

procedure TCUSTOMVisualizationFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TCUSTOMVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TCUSTOMVisualizationPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TCUSTOMVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=RemotedFunctionality.GetOwner(idTOwner,idOwner);
end;

function TCUSTOMVisualizationFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TCUSTOMVisualizationFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

procedure TCUSTOMVisualizationFunctionality.DestroyData;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TCUSTOMVisualizationFunctionality.CloneData(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TCUSTOMVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
type
  {Reflect_function_version #0}
  TReflectV0 = function (const idTObj,idObj: integer;  pFigure: TObject; pAdditionalFigure: TObject; pReflectionWindow: TObject; pAttractionWindow: TObject; pCanvas: TCanvas): boolean; stdcall;

var
  ptrItem: pointer;
  I: integer;
  MODULEHandle: HModule;
  Func: pointer;
begin
Result:=false; 
try
TypeSystem.Lock.Enter;
try
ptrItem:=TSystemTCUSTOMVisualization(TypeSystem).Cash.GetPtrItem(idObj);
if (ptrItem = nil)
 then begin
  ReflectAsNotLoaded(pFigure,pAdditionalFigure, pReflectionWindow, pCanvas);
  Result:=true;
  Exit; //. ->
  end; 
with TItemTCUSTOMVisualizationCash(ptrItem^) do begin
MODULEHandle:=0;
with Space.Plugins.LockList do
try
for I:=0 to Count-1 do
  if ExtractFileName(SysUtils.GetMODULEName(HModule(List[I]))) = MODULEName
   then begin
    MODULEHandle:=HModule(List[I]);
    Break; //. ->
    end;
finally
Space.Plugins.UnLockList;
end;
if MODULEHandle <> 0
 then begin
  Func:=GetProcAddress(MODULEHandle, PChar(String(FunctionName)));
  if Func <> nil
   then
    case FunctionVersion of
    0: Result:=TReflectV0(Func)(idTObj,idObj,  pFigure,pAdditionalFigure, pReflectionWindow,pAttractionWindow, pCanvas);
    else
      Exit; //. ->
    end
   else begin
    ReflectAsNotLoaded(pFigure,pAdditionalFigure, pReflectionWindow, pCanvas);
    Result:=true;
    Exit; //. ->
    end;
  end
 else begin
  ReflectAsNotLoaded(pFigure,pAdditionalFigure, pReflectionWindow, pCanvas);
  Result:=true;
  Exit; //. ->
  end;
end;
finally
TypeSystem.Lock.Leave;
end;
//.
Result:=true;
except
  end;
end
;
function TCUSTOMVisualizationFunctionality.getMODULEName: string;
begin
Result:=RemotedFunctionality.getMODULEName;
end;

procedure TCUSTOMVisualizationFunctionality.setMODULEName(Value: string);
begin
RemotedFunctionality.setMODULEName(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TCUSTOMVisualizationFunctionality.getFunctionName: string;
begin
Result:=RemotedFunctionality.getFunctionName;
end;

procedure TCUSTOMVisualizationFunctionality.setFunctionName(Value: string);
begin
RemotedFunctionality.setFunctionName(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TCUSTOMVisualizationFunctionality.getFunctionVersion: integer;
begin
Result:=RemotedFunctionality.getFunctionVersion;
end;

procedure TCUSTOMVisualizationFunctionality.setFunctionVersion(Value: integer);
begin
RemotedFunctionality.setFunctionVersion(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TCUSTOMVisualizationFunctionality.GetParams(out oMODULEName: WideString; out oFunctionName: WideString; out oFunctionVersion: integer);
begin
RemotedFunctionality.GetParams(oMODULEName,oFunctionName,oFunctionVersion);
end;


{TTOLEVisualizationFunctionality}

Constructor TTOLEVisualizationFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTOLEVisualization;
RemotedFunctionality:=TTOLEVisualizationFunctionalityRemoted.Create(Self);
end
;
function TTOLEVisualizationFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTOLEVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TOLEVisualizationFunctionality.Create(Self, idComponent);
end
;
function TTOLEVisualizationFunctionality.getName: string;
begin
Result:=nmTOLEVisualization;
end;


function TTOLEVisualizationFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TypesDef\OLEVisualization\OLEVisualization.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

function TTOLEVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TObjectVisualization.Create;
with Result do begin
Color:=clWhite;
Width:=0;
flLoop:=false;
AddPoint(-50,0);
AddPoint(50,0);
end;
end
;

{TOLEVisualizationFunctionality}
Constructor TOLEVisualizationFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TOLEVisualizationFunctionalityRemoted.Create(Self);
end;

procedure TOLEVisualizationFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TOLEVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TOLEVisualizationPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TOLEVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=RemotedFunctionality.GetOwner(idTOwner,idOwner);
end;

function TOLEVisualizationFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TOLEVisualizationFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

procedure TOLEVisualizationFunctionality.DestroyData;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TOLEVisualizationFunctionality.CloneData(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TOLEVisualizationFunctionality.GetDATA(out Value: TClientBlobStream);
var
  BA: TByteArray;
begin
GetDATA(BA);
ByteArray_CreateStream(BA, TMemoryStream(Value));
end;

procedure TOLEVisualizationFunctionality.GetDATA(out Value: TClientBlobStream; const MaxSize: integer);
var
  BA: TByteArray;
begin
GetDATA(BA,MaxSize);
ByteArray_CreateStream(BA, TMemoryStream(Value));
end;

procedure TOLEVisualizationFunctionality.SetDATA(Value: TMemoryStream);
var
  BA: TByteArray;
begin
ByteArray_PrepareFromStream(BA,Value);
SetDATA(BA);
end;

procedure TOLEVisualizationFunctionality.GetDATA(out Value: TByteArray);
begin
RemotedFunctionality.GetDATA(Value);
end;

procedure TOLEVisualizationFunctionality.GetDATA(out Value: TByteArray; const MaxSize: integer);
begin
RemotedFunctionality.GetDATA1(Value,MaxSize);
end;

procedure TOLEVisualizationFunctionality.SetDATA(Value: TByteArray);
begin
RemotedFunctionality.SetDATA(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TOLEVisualizationFunctionality.LoadFromFile(const FileName: string);
var
  MemoryStream: TMemoryStream;
begin
MemoryStream:=TMemoryStream.Create;
try
MemoryStream.LoadFromFile(FileName);
SetDATA(MemoryStream);
finally
MemoryStream.Destroy;
end;
end;

procedure TOLEVisualizationFunctionality.SaveToFile(const FileName: string);
var
  MemoryStream: TClientBlobStream;
begin
GetDATA(MemoryStream);
try
MemoryStream.SaveToFile(FileName);
finally
MemoryStream.Destroy;
end;
end;

procedure TOLEVisualizationFunctionality.EditDATA;
var
  TempFileName: string;
begin
TempFileName:=ExtractFilePath(ParamStr(0))+PathTempData+'\OLEVisualization'+FormatDateTime('DDMMYYYYHHNNSSZZZ',Now)+'.OLE';
Space.Log.OperationStarting('file loading ...');
try
SaveToFile(TempFileName);
TypesSystem.ComponentsTracking.Insert(TempFileName,FileDateToDateTime(FileAge(TempFileName)),idTObj,idObj);
finally
Space.Log.OperationDone;
end;
//. run
with TCustomFileRun.Create(nil) do
try
FileName:=TempFileName;
Operation:='edit';
Execute;
finally
Destroy;
end;
end;

function TOLEVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;

  function Refl: boolean;
  var
    ptrItem: pointer;
    X0,Y0, X1,Y1: Double;
    diffX1X0,diffY1Y0: Double;
    _Width: Double;
    b: Double;
    XF: XForm;
    Alfa: Double;
    CosAlfa,SinAlfa: Double;
    V: Double;
    S0_X3,S0_Y3: Double;
    S1_X3,S1_Y3: Double;
    Xc,Yc: integer;
    K1,K2: Double;
    Scale: Double;
  begin
  Result:=false; 
  try
  TypeSystem.Lock.Enter;
  try
  ptrItem:=TSystemTOLEVisualization(TypeSystem).Cash.GetPtrItem(idObj);
  if (ptrItem = nil) OR (TItemTOLEVisualizationCash(ptrItem^).WMF = nil)
   then begin
    ReflectAsNotLoaded(pFigure,pAdditionalFigure, pReflectionWindow, pCanvas);
    Result:=true;
    Exit; //. ->
    end;
  with TItemTOLEVisualizationCash(ptrItem^) do begin
  if (LastUser_ID <> Space.UserID)
   then begin
    try
    CheckUserOperation(idReadOperation);
    LastUser_flRead:=true;
    except
      LastUser_flRead:=false;
      end;
    LastUser_ID:=Space.UserID;
    end
   else LastUser_flRead:=true;
  if (NOT LastUser_flRead)
   then begin
    ReflectAsNotLoaded(pFigure,pAdditionalFigure, pReflectionWindow, pCanvas);
    Result:=true;
    Exit; //. ->
    end;
  with pFigure do begin
  if (Width <= 0) then Exit; //. ->
  X0:=Nodes[0].X;Y0:=Nodes[0].Y;
  X1:=Nodes[1].X;Y1:=Nodes[1].Y;
  diffX1X0:=X1-X0;
  diffY1Y0:=Y1-Y0;
  _Width:=Sqrt(sqr(diffX1X0)+sqr(diffY1Y0));
  if (diffX1X0 > 0) AND (diffY1Y0 >= 0)
   then
    Alfa:=2*PI+ArcTan(-diffY1Y0/diffX1X0)
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
  end;
  Alfa:=-Alfa;
  //.
  K1:=b/_Width;
  K2:=WMF.Height/WMF.Width;
  if K2 < K1
   then Scale:=_Width/WMF.Width
   else Scale:=b/WMF.Height;
  //.
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
  XF.eM11:=Scale;
  XF.eM12:=0;
  XF.eM21:=0;
  XF.eM22:=Scale;
  ModifyWorldTransForm(pCanvas.Handle,XF,MWT_LEFTMULTIPLY);
  try
  pCanvas.Draw(0,0 ,WMF);
  finally
  ModifyWorldTransForm(pCanvas.Handle,XF,MWT_IDENTITY);
  end;
  end;
  finally
  TypeSystem.Lock.Leave;
  end;
  //.
  Result:=true;
  except
    end;
  end;

begin
Result:=Refl;
end
;

{TTHTMLVisualizationFunctionality}

Constructor TTHTMLVisualizationFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTHTMLVisualization;
RemotedFunctionality:=TTHTMLVisualizationFunctionalityRemoted.Create(Self);
end
;

function TTHTMLVisualizationFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTHTMLVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=THTMLVisualizationFunctionality.Create(Self, idComponent);
end
;
function TTHTMLVisualizationFunctionality.getName: string;
begin
Result:=nmTHTMLVisualization;
end;


function TTHTMLVisualizationFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TypesDef\HTMLVisualization\HTMLVisualization.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

function TTHTMLVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TObjectVisualization.Create;
with Result do begin
Color:=clWhite;
Width:=0;
flLoop:=false;
AddPoint(-50,0);
AddPoint(50,0);
end;
end
;

{THTMLVisualizationFunctionality}
Constructor THTMLVisualizationFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=THTMLVisualizationFunctionalityRemoted.Create(Self);
end;


procedure THTMLVisualizationFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function THTMLVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=THTMLVisualizationPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function THTMLVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=RemotedFunctionality.GetOwner(idTOwner,idOwner);
end;

function THTMLVisualizationFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function THTMLVisualizationFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

function THTMLVisualizationFunctionality.getWidth: integer;
begin
Result:=RemotedFunctionality.getWidth;
end;

procedure THTMLVisualizationFunctionality.setWidth(Value: integer);
begin
RemotedFunctionality.setWidth(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure THTMLVisualizationFunctionality.DestroyData;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure THTMLVisualizationFunctionality.CloneData(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure THTMLVisualizationFunctionality.GetDATA(out Value: TClientBlobStream);
var
  BA: TByteArray;
begin
GetDATA(BA);
ByteArray_CreateStream(BA, TMemoryStream(Value));
end;

procedure THTMLVisualizationFunctionality.GetDATA(out Value: TClientBlobStream; const MaxSize: integer);
var
  BA: TByteArray;
begin
GetDATA(BA,MaxSize);
ByteArray_CreateStream(BA, TMemoryStream(Value));
end;

procedure THTMLVisualizationFunctionality.SetDATA(Value: TMemoryStream);
var
  BA: TByteArray;
begin
ByteArray_PrepareFromStream(BA,Value);
SetDATA(BA);
end;

procedure THTMLVisualizationFunctionality.GetDATA(out Value: TByteArray);
begin
RemotedFunctionality.GetDATA(Value);
end;

procedure THTMLVisualizationFunctionality.GetDATA(out Value: TByteArray; const MaxSize: integer);
begin
RemotedFunctionality.GetDATA1(Value,MaxSize);
end;

procedure THTMLVisualizationFunctionality.SetDATA(Value: TByteArray);
begin
RemotedFunctionality.SetDATA(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure THTMLVisualizationFunctionality.LoadFromFile(const FileName: string);
var
  MemoryStream: TMemoryStream;
begin
MemoryStream:=TMemoryStream.Create;
try
MemoryStream.LoadFromFile(FileName);
SetDATA(MemoryStream);
finally
MemoryStream.Destroy;
end;
end;

procedure THTMLVisualizationFunctionality.SaveToFile(const FileName: string);
var
  MemoryStream: TClientBlobStream;
begin
GetDATA(MemoryStream);
try
MemoryStream.SaveToFile(FileName);
finally
MemoryStream.Destroy;
end;
end;

procedure THTMLVisualizationFunctionality.EditDATA;
var
  TempFileName: string;
begin
TempFileName:=PathTempData+'\HTMLVisualization'+FormatDateTime('DDMMYYYYHHNNSSZZZ',Now)+'.html';
Space.Log.OperationStarting('file loading ...');
try
SaveToFile(TempFileName);
TypesSystem.ComponentsTracking.Insert(TempFileName,FileDateToDateTime(FileAge(TempFileName)),idTObj,idObj);
finally
Space.Log.OperationDone;
end;
//. run
with TCustomFileRun.Create(nil) do
try
FileName:=TempFileName;
Operation:='edit';
Execute;
finally
Destroy;
end;
end;

function THTMLVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;

  function Refl: boolean;
  var
    ptrItem: pointer;
    X0,Y0, X1,Y1: Double;
    diffX1X0,diffY1Y0: Double;
    _Width: Double;
    b: Double;
    XF: XForm;
    Alfa: Double;
    CosAlfa,SinAlfa: Double;
    V: Double;
    S0_X3,S0_Y3: Double;
    S1_X3,S1_Y3: Double;
    Xc,Yc: integer;
    K1,K2: Double;
    H: Double;
  begin
  Result:=false;
  try
  TypeSystem.Lock.Enter;
  try
  ptrItem:=TSystemTHTMLVisualization(TypeSystem).Cash.GetPtrItem(idObj);
  if (ptrItem = nil) OR ((TItemTHTMLVisualizationCash(ptrItem^).DataStream = nil) OR (TItemTHTMLVisualizationCash(ptrItem^).DataStream.Size = 0)) OR (TItemTHTMLVisualizationCash(ptrItem^).Width = 0)
   then begin
    ReflectAsNotLoaded(pFigure,pAdditionalFigure, pReflectionWindow, pCanvas);
    Result:=true;
    Exit; //. ->
    end;
  with TItemTHTMLVisualizationCash(ptrItem^) do begin
  if (LastUser_ID <> Space.UserID)
   then begin
    try
    CheckUserOperation(idReadOperation);
    LastUser_flRead:=true;
    except
      LastUser_flRead:=false;
      end;
    LastUser_ID:=Space.UserID;
    end
   else LastUser_flRead:=true;
  if (NOT LastUser_flRead)
   then begin
    ReflectAsNotLoaded(pFigure,pAdditionalFigure, pReflectionWindow, pCanvas);
    Result:=true;
    Exit; //. ->
    end;
  with pFigure do begin
  X0:=Nodes[0].X;Y0:=Nodes[0].Y;
  X1:=Nodes[1].X;Y1:=Nodes[1].Y;
  diffX1X0:=X1-X0;
  diffY1Y0:=Y1-Y0;
  _Width:=Sqrt(sqr(diffX1X0)+sqr(diffY1Y0));
  if (diffX1X0 > 0) AND (diffY1Y0 >= 0)
   then
    Alfa:=2*PI+ArcTan(-diffY1Y0/diffX1X0)
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
  end;
  Alfa:=-Alfa;
  K1:=b/_Width;
  with TQuickHTML.Create do
  try
  Width:=TItemTHTMLVisualizationCash(ptrItem^).Width;
  pCanvas.Lock;
  try
  PaintCanvas:=pCanvas;
  DATAStream.Position:=0;
  Lines.LoadFromStream(DATAStream);
  H:=Height;
  K2:=H/Width;
  pReflectionWindow.Lock.Enter;
  try
  dX:=(Xc-pReflectionWindow.Xmn);
  dY:=(Yc-pReflectionWindow.Ymn);
  finally
  pReflectionWindow.Lock.Leave;
  end;
  if K2 < K1
   then Scale:=_Width/Width
   else Scale:=b/H;
  Angle:=Alfa;
  PaintCanvas:=pCanvas;
  Paint;
  finally
  pCanvas.UnLock;
  end;
  finally
  Destroy;
  end;
  end;
  finally
  TypeSystem.Lock.Leave;
  end;
  //.
  Result:=true;
  except
    end;
  end;

begin
///? Result:=Refl;
Result:=false;
end
;

{TTBZRVisualizationFunctionality}

Constructor TTBZRVisualizationFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTBZRVisualization;
RemotedFunctionality:=TTBZRVisualizationFunctionalityRemoted.Create(Self);
end
;

function TTBZRVisualizationFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTBZRVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TBZRVisualizationFunctionality.Create(Self, idComponent);
end
;
function TTBZRVisualizationFunctionality.getName: string;
begin
Result:=nmTBZRVisualization;
end;


function TTBZRVisualizationFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TypesDef\BZRVisualization\BZRVisualization.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

function TTBZRVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TObjectVisualization.Create;
with Result do begin
Color:=clWhite;
Width:=0;
flLoop:=false;
AddPoint(-50,0);
AddPoint(50,0);
end;
end
;

{TBZRVisualizationFunctionality}
Constructor TBZRVisualizationFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TBZRVisualizationFunctionalityRemoted.Create(Self);
end;

procedure TBZRVisualizationFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TBZRVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TBZRVisualizationPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TBZRVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=RemotedFunctionality.GetOwner(idTOwner,idOwner);
end;

function TBZRVisualizationFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TBZRVisualizationFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

procedure TBZRVisualizationFunctionality.DestroyData;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TBZRVisualizationFunctionality.CloneData(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TBZRVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;

  function Refl: boolean;
  var
    Nds: array[0..2] of Windows.TPoint;
    LW: integer;
    I: integer;
    PenWidth: Double;
    LogBrush: TLogBrush;
    BH: HBrush;
    LogPen: TLogPen;
    PH: HPen;
  begin
  Result:=false;
  try
  TypeSystem.Lock.Enter;
  try
  with pFigure do begin
  //.
  if Count < 4 then Exit; //. ->
  LW:=Round((Width*pReflectionWindow.Scale)/3);
  if LW = 0 then Exit; //. -> 
  //. drawing polybezier
  with LogBrush do begin
  lbStyle:=BS_NULL;
  lbHatch:=0;
  lbColor:=ColorToRGB(Color);
  end;
  BH:=CreateBrushIndirect(LogBrush);
  with LogPen do begin
  lopnStyle:=PS_SOLID;
  lopnWidth.X:=LW;
  lopnColor:=ColorToRGB(Color);
  end;
  PH:=CreatePenIndirect(LogPen);
  try
  SelectObject(pCanvas.Handle,BH);
  SelectObject(pCanvas.Handle,PH);
  try
  for I:=0 to (Count DIV 3)-1 do begin
    if (3*I+3) >= Count then Break; //. > 
    Windows.MoveToEx(pCanvas.Handle, Round(Nodes[I*3].X),Round(Nodes[I*3].Y), nil);
    Nds[0].X:=Round(Nodes[3*I+1].X); Nds[0].Y:=Round(Nodes[3*I+1].Y);
    Nds[1].X:=Round(Nodes[3*I+2].X); Nds[1].Y:=Round(Nodes[3*I+2].Y);
    Nds[2].X:=Round(Nodes[3*I+3].X); Nds[2].Y:=Round(Nodes[3*I+3].Y);
    //. 
    Windows.PolyBezierTo(pCanvas.Handle, Nds, High(Nds)+1);
    end;
  finally
  SelectObject(pCanvas.Handle,pCanvas.Brush.Handle);
  SelectObject(pCanvas.Handle,pCanvas.Pen.Handle);
  end;
  finally
  DeleteObject(PH);
  DeleteObject(BH);
  end;
  //.
  Result:=true;
  end;
  finally
  TypeSystem.Lock.Leave;
  end;
  except
    end;
  end;

begin
Result:=Refl;
end
;

{TTAGIFVisualizationFunctionality}

Constructor TTAGIFVisualizationFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTAGIFVisualization;
RemotedFunctionality:=TTAGIFVisualizationFunctionalityRemoted.Create(Self);
end
;
function TTAGIFVisualizationFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTAGIFVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TAGIFVisualizationFunctionality.Create(Self, idComponent);
end
;
function TTAGIFVisualizationFunctionality.getName: string;
begin
Result:=nmTAGIFVisualization;
end;


function TTAGIFVisualizationFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TypesDef\AGIFVisualization\AGIFVisualization.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

function TTAGIFVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TObjectVisualization.Create;
with Result do begin
Color:=clWhite;
Width:=0;
flLoop:=false;
AddPoint(-50,0);
AddPoint(50,0);
end;
end
;

{TAGIFVisualizationFunctionality}

Constructor TAGIFVisualizationFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
flDynamic:=true;
RemotedFunctionality:=TAGIFVisualizationFunctionalityRemoted.Create(Self);
end
;
procedure TAGIFVisualizationFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TAGIFVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TAGIFVisualizationPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TAGIFVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=RemotedFunctionality.GetOwner(idTOwner,idOwner);
end;

function TAGIFVisualizationFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TAGIFVisualizationFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

procedure TAGIFVisualizationFunctionality.DestroyData;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TAGIFVisualizationFunctionality.CloneData(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TAGIFVisualizationFunctionality.GetDATA(out Value: TClientBlobStream);
var
  BA: TByteArray;
begin
GetDATA(BA);
ByteArray_CreateStream(BA, TMemoryStream(Value));
end;

procedure TAGIFVisualizationFunctionality.GetDATA(out Value: TClientBlobStream; const MaxSize: integer);
var
  BA: TByteArray;
begin
GetDATA(BA,MaxSize);
ByteArray_CreateStream(BA, TMemoryStream(Value));
end;

procedure TAGIFVisualizationFunctionality.SetDATA(Value: TMemoryStream);
var
  BA: TByteArray;
begin
ByteArray_PrepareFromStream(BA,Value);
SetDATA(BA);
end;

procedure TAGIFVisualizationFunctionality.GetDATA(out Value: TByteArray);
begin
RemotedFunctionality.GetDATA(Value);
end;

procedure TAGIFVisualizationFunctionality.GetDATA(out Value: TByteArray; const MaxSize: integer);
begin
RemotedFunctionality.GetDATA1(Value,MaxSize);
end;

procedure TAGIFVisualizationFunctionality.SetDATA(Value: TByteArray);
begin
RemotedFunctionality.SetDATA(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TAGIFVisualizationFunctionality.LoadFromFile(const FileName: string);
var
  MemoryStream: TMemoryStream;
begin
MemoryStream:=TMemoryStream.Create;
try
MemoryStream.LoadFromFile(FileName);
SetDATA(MemoryStream);
finally
MemoryStream.Destroy;
end;
end;

function TAGIFVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;

  function Refl: boolean;
  var
    ptrItem: pointer;
    X0,Y0, X1,Y1: Double;
    diffX1X0,diffY1Y0: Double;
    Alfa: Double;
    V: Double;
    S0_X3,S0_Y3: Double;
    S1_X3,S1_Y3: Double;
    Xc,Yc: integer;
    CosAlfa,SinAlfa: Double;
    LogBrush: TLogBrush;
    BH: HBrush;
    LogPen: TLogPen;
    PH: HPen;
  begin
  Result:=false;
  try
  TypeSystem.Lock.Enter;
  try
  //. get AGIF data provider
  TypeSystem.Lock.Enter;
  try
  ptrItem:=TSystemTAGIFVisualization(TypeSystem).Cash.GetPtrItem(idObj);
  if ptrItem <> nil
   then with TItemTAGIFVisualizationCash(ptrItem^) do
    if AGIFData <> nil
     then Inc(AGIFData.RefCount)
     else AGIFData:=TAGIFData.Create(Space,TypeSystem.idType,idObj)
  finally
  TypeSystem.Lock.Leave;
  end;
  try
  //. updating
  TypeSystem.Lock.Enter;
  try
  ptrItem:=TSystemTAGIFVisualization(TypeSystem).Cash.GetPtrItem(idObj);
  if ptrItem <> nil
   then with TItemTAGIFVisualizationCash(ptrItem^) do begin
    AGIFData.Lock.Enter;
    try
    with pFigure do begin
    if (Width <= 0) then Exit; //. ->
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
    end;
    Alfa:=-Alfa;
    CosAlfa:=Cos(Alfa);
    SinAlfa:=Sin(Alfa);
    pCanvas.Lock;
    try
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
    try
    if AGIFData.BMP <> nil
     then begin
      /// ? native draw pCanvas.StretchDraw(Rect(0,0,Round(_Width),Round(b)), AGIFData.BMP);
      DrawUsingGDIPus(pCanvas.Handle, AGIFData.BMP,0,0,Round(_Width),Round(b));
      end
     else begin //. draw rectangle
      with LogBrush do begin
      lbStyle:=BS_SOLID;
      lbHatch:=0;
      lbColor:=pFigure.Color;
      end;
      BH:=CreateBrushIndirect(LogBrush);
      with LogPen do begin
      lopnStyle:=PS_SOLID;
      lopnWidth.X:=1;
      lopnColor:=pFigure.Color;
      end;
      PH:=CreatePenIndirect(LogPen);
      try
      pCanvas.Lock;
      try
      SelectObject(pCanvas.Handle,BH);
      SelectObject(pCanvas.Handle,PH);
      try
      Windows.Rectangle(pCanvas.Handle, 0,0,Round(_Width),Round(b));
      finally
      SelectObject(pCanvas.Handle,pCanvas.Brush.Handle);
      SelectObject(pCanvas.Handle,pCanvas.Pen.Handle);
      end;
      finally
      DeleteObject(PH);
      DeleteObject(BH);
      end;
      finally
      pCanvas.UnLock;
      end;
      end;
    finally
    ModifyWorldTransForm(pCanvas.Handle,XF,MWT_IDENTITY);
    end;
    finally
    pCanvas.UnLock;
    end;
    finally
    AGIFData.Lock.Leave;
    end;
    end;
  finally
  TypeSystem.Lock.Leave;
  end;
  finally
  //. release AGIF data provider
  TypeSystem.Lock.Enter;
  try
  ptrItem:=TSystemTAGIFVisualization(TypeSystem).Cash.GetPtrItem(idObj);
  if ptrItem <> nil
   then with TItemTAGIFVisualizationCash(ptrItem^) do
    if AGIFData <> nil
     then begin
      Dec(AGIFData.RefCount);
      if AGIFData.RefCount = 0 then AGIFData.NullRefTime:=Now;
      end;
  finally
  TypeSystem.Lock.Leave;
  end;
  end;
  //.
  Result:=true;
  finally
  TypeSystem.Lock.Leave;
  end;
  except
    end;
  end;

begin
Result:=Refl;
end
;

function TAGIFVisualizationFunctionality.TVisualizationUpdating_Create(Reflecting: TReflecting): TObject;
begin
Result:=TAGIFVisualizationUpdating.Create(Reflecting,Self);
end
;

{TTOrientedVIDEOVisualizationFunctionality}

Constructor TTOrientedVIDEOVisualizationFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTOrientedVIDEOVisualization;
RemotedFunctionality:=TTOrientedVIDEOVisualizationFunctionalityRemoted.Create(Self);
end
;

function TTOrientedVIDEOVisualizationFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTOrientedVIDEOVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TOrientedVIDEOVisualizationFunctionality.Create(Self, idComponent);
end
;
function TTOrientedVIDEOVisualizationFunctionality.getName: string;
begin
Result:=nmTOrientedVIDEOVisualization;
end;


function TTOrientedVIDEOVisualizationFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TypesDef\OrientedVIDEOVisualization\OrientedVIDEOVisualization.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

function TTOrientedVIDEOVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TObjectVisualization.Create;
with Result do begin
Color:=clWhite;
Width:=0;
flLoop:=false;
AddPoint(-50,0);
AddPoint(50,0);
end;
end
;

{TOrientedVIDEOVisualizationFunctionality}

Constructor TOrientedVIDEOVisualizationFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
flDynamic:=true;
RemotedFunctionality:=TOrientedVIDEOVisualizationFunctionalityRemoted.Create(Self);
end
;

procedure TOrientedVIDEOVisualizationFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TOrientedVIDEOVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TOrientedVIDEOVisualizationPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TOrientedVIDEOVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=RemotedFunctionality.GetOwner(idTOwner,idOwner);
end;

function TOrientedVIDEOVisualizationFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TOrientedVIDEOVisualizationFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

function TOrientedVIDEOVisualizationFunctionality.getDataServer: string;
begin
Result:=RemotedFunctionality.getDataServer;
end;

procedure TOrientedVIDEOVisualizationFunctionality.setDataServer(Value: string);
begin
RemotedFunctionality.setDataServer(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TOrientedVIDEOVisualizationFunctionality.getObjectID: integer;
begin
Result:=RemotedFunctionality.getObjectID;
end;

procedure TOrientedVIDEOVisualizationFunctionality.setObjectID(Value: integer);
begin
RemotedFunctionality.setObjectID(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TOrientedVIDEOVisualizationFunctionality.DestroyData;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TOrientedVIDEOVisualizationFunctionality.CloneData(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TOrientedVIDEOVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;

  function Refl: boolean;
  var
    ptrItem: pointer;
    X0,Y0,X1,Y1: Double;
    Xmd,Ymd: Double;
    D,D1,R,K,W,H: Double;
    PenWidth: Double;
    LogBrush: TLogBrush;
    BH: HBrush;
    LogPen: TLogPen;
    PH: HPen;
    DDib: THandle;
    BMP: TBitmap;
    FrameDataPtr: pointer;
  begin
  Result:=false;
  try
  TypeSystem.Lock.Enter;
  try
  with pFigure do begin
  //.
  X0:=Nodes[0].X;Y0:=Nodes[0].Y;
  X1:=Nodes[1].X;Y1:=Nodes[1].Y;
  Xmd:=(X0+X1)/2;
  Ymd:=(Y0+Y1)/2;
  D:=Sqrt(sqr(X1-X0)+sqr(Y1-Y0));
  D1:=(Width*pReflectionWindow.Scale);
  if D1 < D then D:=D1;
  //.
  Xc:=Xmd;
  Yc:=Ymd;
  Self.D:=D;
  //. drawing ellipse
  with LogBrush do begin
  lbStyle:=BS_SOLID;
  lbHatch:=0;
  lbColor:=ColorToRGB(Color);
  end;
  BH:=CreateBrushIndirect(LogBrush);
  with LogPen do begin
  lopnStyle:=PS_SOLID;
  lopnWidth.X:=1;
  lopnColor:=ColorToRGB(Color);
  end;
  PH:=CreatePenIndirect(LogPen);
  try
  pCanvas.Lock;
  try
  SelectObject(pCanvas.Handle,BH);
  SelectObject(pCanvas.Handle,PH);
  try
  Windows.Ellipse(pCanvas.Handle, Round(Xmd-D/2),Round(Ymd-D/2),Round(Xmd+D/2),Round(Ymd+D/2));
  finally
  SelectObject(pCanvas.Handle,pCanvas.Brush.Handle);
  SelectObject(pCanvas.Handle,pCanvas.Pen.Handle);
  end;
  finally
  pCanvas.UnLock;
  end;
  finally
  DeleteObject(PH);
  DeleteObject(BH);
  end;
  //. get VIDEO data provider
  TypeSystem.Lock.Enter;
  try
  ptrItem:=TSystemTOrientedVIDEOVisualization(TypeSystem).Cash.GetPtrItem(idObj);
  if ptrItem <> nil
   then with TItemTOrientedVIDEOVisualizationCash(ptrItem^) do
    if VIDEOData <> nil
     then Inc(VIDEOData.RefCount)
     else VIDEOData:=TVIDEOData.Create(Space,TypeSystem.idType,idObj,DataServer,ObjectID)
  finally
  TypeSystem.Lock.Leave;
  end;
  try
  //. updating
  TypeSystem.Lock.Enter;
  try
  ptrItem:=TSystemTOrientedVIDEOVisualization(TypeSystem).Cash.GetPtrItem(idObj);
  if ptrItem <> nil
   then with TItemTOrientedVIDEOVisualizationCash(ptrItem^) do begin
    DDib:=DrawDibOpen;
    try
    VIDEOData.Lock.Enter;
    try
    if VIDEOData.FrameBuffer <> nil
     then begin
      SafeArrayAccessData(VIDEOData.FrameBuffer,FrameDataPtr);
      try
      K:=TBitmapInfoHeader(FrameDataPtr^).biHeight/TBitmapInfoHeader(FrameDataPtr^).biWidth;
      W:=Sqrt(Sqr(D)/(1+Sqr(K))); H:=Sqrt(Sqr(D)/(1+Sqr(K)))*K;
      pCanvas.Lock;
      try
      /// native draw DrawDIBDraw(DDib,pCanvas.Handle, Round(Xc-W/2),Round(Yc-H/2),Round(W),Round(H), FrameDataPtr,Pointer(Integer(FrameDataPtr)+TBitmapInfoHeader(FrameDataPtr^).biSize), 0,0,TBitmapInfoHeader(FrameDataPtr^).biWidth,TBitmapInfoHeader(FrameDataPtr^).biHeight, 0);
      BMP:=TBitmap.Create;
      try
      with BMP do begin
      Width:=TBitmapInfoHeader(FrameDataPtr^).biWidth;
      Height:=TBitmapInfoHeader(FrameDataPtr^).biHeight;
      DrawDIBDraw(DDib,Canvas.Handle, 0,0,Width,Height, FrameDataPtr,Pointer(Integer(FrameDataPtr)+TBitmapInfoHeader(FrameDataPtr^).biSize), 0,0,TBitmapInfoHeader(FrameDataPtr^).biWidth,TBitmapInfoHeader(FrameDataPtr^).biHeight, 0);
      end;
      DrawUsingGDIPus(pCanvas.Handle, BMP,Round(Xc-W/2),Round(Yc-H/2),Round(W),Round(H));
      finally
      BMP.Destroy;
      end;
      finally
      pCanvas.UnLock;
      end;
      finally
      SafeArrayUnAccessData(VIDEOData.FrameBuffer);
      end;
      end;
    finally
    VIDEOData.Lock.Leave;
    end;
    finally
    DrawDibClose(DDib);
    DrawDibStop(DDib);
    end;
    end;
  finally
  TypeSystem.Lock.Leave;
  end;
  finally
  //. release VIDEO data provider
  TypeSystem.Lock.Enter;
  try
  ptrItem:=TSystemTOrientedVIDEOVisualization(TypeSystem).Cash.GetPtrItem(idObj);
  if ptrItem <> nil
   then with TItemTOrientedVIDEOVisualizationCash(ptrItem^) do
    if VIDEOData <> nil
     then begin
      Dec(VIDEOData.RefCount);
      if VIDEOData.RefCount = 0 then VIDEOData.NullRefTime:=Now;
      end;
  finally
  TypeSystem.Lock.Leave;
  end;
  end;
  //.
  Result:=true;
  end;
  finally
  TypeSystem.Lock.Leave;
  end;
  except
    end;
  end;

begin
Result:=Refl;
end
;

function TOrientedVIDEOVisualizationFunctionality.TVisualizationUpdating_Create(Reflecting: TReflecting): TObject;
begin
Result:=TOrientedVIDEOVisualizationUpdating.Create(Reflecting,Self);
end
;

{TTVIDEOVisualizationFunctionality}

Constructor TTVIDEOVisualizationFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTVIDEOVisualization;
RemotedFunctionality:=TTVIDEOVisualizationFunctionalityRemoted.Create(Self);
end
;

function TTVIDEOVisualizationFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTVIDEOVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TVIDEOVisualizationFunctionality.Create(Self, idComponent);
end
;
function TTVIDEOVisualizationFunctionality.getName: string;
begin
Result:=nmTVIDEOVisualization;
end;


function TTVIDEOVisualizationFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TypesDef\VIDEOVisualization\VIDEOVisualization.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

function TTVIDEOVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TObjectVisualization.Create;
with Result do begin
Color:=clWhite;
Width:=0;
flLoop:=false;
AddPoint(-50,0);
AddPoint(50,0);
end;
end
;

{TVIDEOVisualizationFunctionality}

Constructor TVIDEOVisualizationFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
flDynamic:=true;
RemotedFunctionality:=TVIDEOVisualizationFunctionalityRemoted.Create(Self);
end
;

procedure TVIDEOVisualizationFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TVIDEOVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TVIDEOVisualizationPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TVIDEOVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=RemotedFunctionality.GetOwner(idTOwner,idOwner);
end;

function TVIDEOVisualizationFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TVIDEOVisualizationFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

function TVIDEOVisualizationFunctionality.getDataServer: string;
begin
Result:=RemotedFunctionality.getDataServer;
end;

procedure TVIDEOVisualizationFunctionality.setDataServer(Value: string);
begin
RemotedFunctionality.setDataServer(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TVIDEOVisualizationFunctionality.getObjectID: integer;
begin
Result:=RemotedFunctionality.getObjectID;
end;

procedure TVIDEOVisualizationFunctionality.setObjectID(Value: integer);
begin
RemotedFunctionality.setObjectID(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TVIDEOVisualizationFunctionality.DestroyData;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TVIDEOVisualizationFunctionality.CloneData(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TVIDEOVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;

  function Refl: boolean;
  var
    ptrItem: pointer;
    X0,Y0, X1,Y1: Double;
    diffX1X0,diffY1Y0: Double;
    Alfa: Double;
    V: Double;
    S0_X3,S0_Y3: Double;
    S1_X3,S1_Y3: Double;
    Xc,Yc: integer;
    CosAlfa,SinAlfa: Double;
    DDib: THandle;
    BMP: TBitmap;
    FrameDataPtr: pointer;
    LogBrush: TLogBrush;
    BH: HBrush;
    LogPen: TLogPen;
    PH: HPen;
  begin
  Result:=false;
  try
  TypeSystem.Lock.Enter;
  try
  //. get VIDEO data provider
  TypeSystem.Lock.Enter;
  try
  ptrItem:=TSystemTVIDEOVisualization(TypeSystem).Cash.GetPtrItem(idObj);
  if ptrItem <> nil
   then with TItemTVIDEOVisualizationCash(ptrItem^) do
    if VIDEOData <> nil
     then Inc(VIDEOData.RefCount)
     else VIDEOData:=TVIDEOData.Create(Space,TypeSystem.idType,idObj,DataServer,ObjectID)
  finally
  TypeSystem.Lock.Leave;
  end;
  try
  //. updating
  TypeSystem.Lock.Enter;
  try
  ptrItem:=TSystemTVIDEOVisualization(TypeSystem).Cash.GetPtrItem(idObj);
  if ptrItem <> nil
   then with TItemTVIDEOVisualizationCash(ptrItem^) do begin
    DDib:=DrawDibOpen;
    try
    VIDEOData.Lock.Enter;
    try
    with pFigure do begin
    if (Width <= 0) then Exit; //. ->
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
    end;
    Alfa:=-Alfa;
    CosAlfa:=Cos(Alfa);
    SinAlfa:=Sin(Alfa);
    pCanvas.Lock;
    try
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
    try
    if VIDEOData.FrameBuffer <> nil
     then begin
      SafeArrayAccessData(VIDEOData.FrameBuffer,FrameDataPtr);
      try
      /// ? native draw DrawDIBDraw(DDib,pCanvas.Handle, 0,0,Round(_Width),Round(b), FrameDataPtr,Pointer(Integer(FrameDataPtr)+TBitmapInfoHeader(FrameDataPtr^).biSize), 0,0,TBitmapInfoHeader(FrameDataPtr^).biWidth,TBitmapInfoHeader(FrameDataPtr^).biHeight, 0);
      BMP:=TBitmap.Create;
      try
      with BMP do begin
      Width:=TBitmapInfoHeader(FrameDataPtr^).biWidth;
      Height:=TBitmapInfoHeader(FrameDataPtr^).biHeight;
      DrawDIBDraw(DDib,Canvas.Handle, 0,0,Width,Height, FrameDataPtr,Pointer(Integer(FrameDataPtr)+TBitmapInfoHeader(FrameDataPtr^).biSize), 0,0,TBitmapInfoHeader(FrameDataPtr^).biWidth,TBitmapInfoHeader(FrameDataPtr^).biHeight, 0);
      end;
      DrawUsingGDIPus(pCanvas.Handle, BMP,0,0,Round(_Width),Round(b));
      finally
      BMP.Destroy;
      end;
      finally
      SafeArrayUnAccessData(VIDEOData.FrameBuffer);
      end;
      end
     else begin //. draw rectangle
      with LogBrush do begin
      lbStyle:=BS_SOLID;
      lbHatch:=0;
      lbColor:=pFigure.Color;
      end;
      BH:=CreateBrushIndirect(LogBrush);
      with LogPen do begin
      lopnStyle:=PS_SOLID;
      lopnWidth.X:=1;
      lopnColor:=pFigure.Color;
      end;
      PH:=CreatePenIndirect(LogPen);
      try
      pCanvas.Lock;
      try
      SelectObject(pCanvas.Handle,BH);
      SelectObject(pCanvas.Handle,PH);
      try
      Windows.Rectangle(pCanvas.Handle, 0,0,Round(_Width),Round(b));
      finally
      SelectObject(pCanvas.Handle,pCanvas.Brush.Handle);
      SelectObject(pCanvas.Handle,pCanvas.Pen.Handle);
      end;
      finally
      DeleteObject(PH);
      DeleteObject(BH);
      end;
      finally
      pCanvas.UnLock;
      end;
      end;
    finally
    ModifyWorldTransForm(pCanvas.Handle,XF,MWT_IDENTITY);
    end;
    finally
    pCanvas.UnLock;
    end;
    finally
    VIDEOData.Lock.Leave;
    end;
    finally
    DrawDibClose(DDib);
    DrawDibStop(DDib);
    end;
    end;
  finally
  TypeSystem.Lock.Leave;
  end;
  finally
  //. release VIDEO data provider
  TypeSystem.Lock.Enter;
  try
  ptrItem:=TSystemTVIDEOVisualization(TypeSystem).Cash.GetPtrItem(idObj);
  if ptrItem <> nil
   then with TItemTVIDEOVisualizationCash(ptrItem^) do
    if VIDEOData <> nil
     then begin
      Dec(VIDEOData.RefCount);
      if VIDEOData.RefCount = 0 then VIDEOData.NullRefTime:=Now;
      end;
  finally
  TypeSystem.Lock.Leave;
  end;
  end;
  //.
  Result:=true;
  finally
  TypeSystem.Lock.Leave;
  end;
  except
    end;
  end;

begin
Result:=Refl;
end
;

function TVIDEOVisualizationFunctionality.TVisualizationUpdating_Create(Reflecting: TReflecting): TObject;
begin
Result:=TVIDEOVisualizationUpdating.Create(Reflecting,Self);
end
;

{TTOPPVisualizationFunctionality}

Constructor TTOPPVisualizationFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTOPPVisualization;
RemotedFunctionality:=TTOPPVisualizationFunctionalityRemoted.Create(Self);
end
;

function TTOPPVisualizationFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTOPPVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TOPPVisualizationFunctionality.Create(Self, idComponent);
end
;
function TTOPPVisualizationFunctionality.getName: string;
begin
Result:=nmTOPPVisualization;
end;


function TTOPPVisualizationFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TypesDef\OPPVisualization\OPPVisualization.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

function TTOPPVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TObjectVisualization.Create;
with Result do begin
Color:=clWhite;
Width:=0;
flLoop:=false;
AddPoint(-50,0);
AddPoint(50,0);
end;
end
;

{TOPPVisualizationFunctionality}
Constructor TOPPVisualizationFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TOPPVisualizationFunctionalityRemoted.Create(Self);
end;


procedure TOPPVisualizationFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TOPPVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TOPPVisualizationPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TOPPVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=RemotedFunctionality.GetOwner(idTOwner,idOwner);
end;

function TOPPVisualizationFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TOPPVisualizationFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

function TOPPVisualizationFunctionality.getPropsPanel_idTObj: integer;
begin
Result:=RemotedFunctionality.getPropsPanel_idTObj;
end;

procedure TOPPVisualizationFunctionality.setPropsPanel_idTObj(Value: integer);
begin
RemotedFunctionality.setPropsPanel_idTObj(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TOPPVisualizationFunctionality.getPropsPanel_idObj: integer;
begin
Result:=RemotedFunctionality.getPropsPanel_idObj;
end;

procedure TOPPVisualizationFunctionality.setPropsPanel_idObj(Value: integer);
begin
RemotedFunctionality.setPropsPanel_idObj(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TOPPVisualizationFunctionality.DestroyData;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TOPPVisualizationFunctionality.CloneData(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TOPPVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;

  function Refl: boolean;
  var
    ptrItem: pointer;
    PropsPanel: TForm;
    PropsPanelBMP: TBitmap;
    X0,Y0,X1,Y1: Double;
    Xmd,Ymd: Double;
    D,D1,R,K: Double;
    M: TMessage;
    P: Windows.TPoint;
    PenWidth: Double;
    LogBrush: TLogBrush;
    BH: HBrush;
    LogPen: TLogPen;
    PH: HPen;
  begin
  Result:=false;
  try
  TypeSystem.Lock.Enter;
  try
  with pFigure do begin
  if NOT TSystemTOPPVisualization(TypeSystem).Cash.GetPanel(idObj, FReflector,  PropsPanel,PropsPanelBMP)
   then begin
    Result:=ReflectAsNotLoaded(pFigure,pAdditionalFigure, pReflectionWindow, pCanvas);
    Exit; //. ->
    end;
  //.
  X0:=Nodes[0].X;Y0:=Nodes[0].Y;
  X1:=Nodes[1].X;Y1:=Nodes[1].Y;
  Xmd:=(X0+X1)/2;
  Ymd:=(Y0+Y1)/2;
  D:=Sqrt(sqr(X1-X0)+sqr(Y1-Y0));
  D1:=(Width*pReflectionWindow.Scale);
  if D1 < D then D:=D1;
  D1:=Sqrt(sqr(PropsPanel.Width)+sqr(PropsPanel.Height));
  if (D < D1)
   then begin
    {BMP:=TBitmap.Create;
    try
    BMP.Width:=PropsPanel.Width;
    BMP.Height:=PropsPanel.Height;
    //. do paint props panel
    with fmPropsPanelRepository do begin
    PaintPropsPanel_Panel:=PropsPanel;
    PaintPropsPanel_BMP:=BMP;
    if (GetCurrentThreadID <> MainThreadID)
     then SendMessage(Handle, WM_PAINTPROPSPANEL,0,0)
     else wmPaintPropsPanel(M);
    end;
    //.
    K:=PropsPanel.Height/PropsPanel.Width;
    pCanvas.StretchDraw(Rect(Round(Xmd-Sqrt(Sqr(D)/(1+Sqr(K)))/2),Round(Ymd-Sqrt(Sqr(D)/(1+Sqr(K)))*K/2),Round(Xmd+Sqrt(Sqr(D)/(1+Sqr(K)))/2),Round(Ymd+Sqrt(Sqr(D)/(1+Sqr(K)))*K/2)), BMP);
    finally
    BMP.Destroy;
    end;}
    //. stretch copy
    K:=PropsPanel.Height/PropsPanel.Width;
    PropsPanelBMP.Canvas.Lock;
    try
    pCanvas.StretchDraw(Rect(Round(Xmd-Sqrt(Sqr(D)/(1+Sqr(K)))/2),Round(Ymd-Sqrt(Sqr(D)/(1+Sqr(K)))*K/2),Round(Xmd+Sqrt(Sqr(D)/(1+Sqr(K)))/2),Round(Ymd+Sqrt(Sqr(D)/(1+Sqr(K)))*K/2)), PropsPanelBMP);
    finally
    PropsPanelBMP.Canvas.UnLock;
    end;
    //. hide props panel
    fmPropsPanelRepository.HidePropsPanel_Panel:=PropsPanel;
    if (GetCurrentThreadID <> MainThreadID)
     then PostMessage(fmPropsPanelRepository.Handle, WM_HIDEPROPSPANEL,0,0)
     else fmPropsPanelRepository.wmHidePropsPanel(M);
    //. drawing ellipse
    with LogBrush do begin
    lbStyle:=BS_NULL;
    lbHatch:=0;
    lbColor:=ColorToRGB(Color);
    end;
    BH:=CreateBrushIndirect(LogBrush);
    with LogPen do begin
    lopnStyle:=PS_SOLID;
    lopnWidth.X:=1;
    lopnColor:=ColorToRGB(Color);
    end;
    PH:=CreatePenIndirect(LogPen);
    try
    SelectObject(pCanvas.Handle,BH);
    SelectObject(pCanvas.Handle,PH);
    try
    Windows.Ellipse(pCanvas.Handle, Round(Xmd-D/2),Round(Ymd-D/2),Round(Xmd+D/2),Round(Ymd+D/2));
    finally
    SelectObject(pCanvas.Handle,pCanvas.Brush.Handle);
    SelectObject(pCanvas.Handle,pCanvas.Pen.Handle);
    end;
    finally
    DeleteObject(PH);
    DeleteObject(BH);
    end;
    //.
    Result:=true;
    Exit; //. ->
    end;
  //.
  P.X:=Round(Xmd-PropsPanel.Width/2);
  P.Y:=Round(Ymd-PropsPanel.Height/2);
  with fmPropsPanelRepository do begin
  SetPropsPanel_Left:=P.X;
  SetPropsPanel_Top:=P.Y;
  SetPropsPanel_Reflector:=FReflector;
  SetPropsPanel_Panel:=PropsPanel;
  SetPropsPanel_ptrObj:=ptrObj;
  if (GetCurrentThreadID <> MainThreadID)
   then PostMessage(fmPropsPanelRepository.Handle, WM_SETPROPSPANEL,0,0)
   else fmPropsPanelRepository.wmSetPropsPanel(M);
  end;
  //. drawing ellipse
  with LogBrush do begin
  lbStyle:=BS_NULL;
  lbHatch:=0;
  lbColor:=ColorToRGB(Color);
  end;
  BH:=CreateBrushIndirect(LogBrush);
  with LogPen do begin
  lopnStyle:=PS_SOLID;
  lopnWidth.X:=1;
  lopnColor:=ColorToRGB({Color}clRed);
  end;
  PH:=CreatePenIndirect(LogPen);
  try
  SelectObject(pCanvas.Handle,BH);
  SelectObject(pCanvas.Handle,PH);
  try
  Windows.Ellipse(pCanvas.Handle, Round(Xmd-D1/2),Round(Ymd-D1/2),Round(Xmd+D1/2),Round(Ymd+D1/2));
  finally
  SelectObject(pCanvas.Handle,pCanvas.Brush.Handle);
  SelectObject(pCanvas.Handle,pCanvas.Pen.Handle);
  end;
  finally
  DeleteObject(PH);
  DeleteObject(BH);
  end;
  //.
  Result:=true;
  end;
  finally
  TypeSystem.Lock.Leave;
  end;
  except
    end;
  end;

begin
Result:=Refl;
end
;
procedure TOPPVisualizationFunctionality.GetParams(out oPropsPanel_idTObj: integer; out oPropsPanel_idObj: integer);
begin
RemotedFunctionality.GetParams(oPropsPanel_idTObj,oPropsPanel_idObj);
end;


{TTMODELServerFunctionality}

Constructor TTMODELServerFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTMODELServer;
RemotedFunctionality:=TTMODELServerFunctionalityRemoted.Create(Self);
end
;

function TTMODELServerFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TTMODELServerFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTMODELServerFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TMODELServerFunctionality.Create(Self, idComponent);
end
;
function TTMODELServerFunctionality.getName: string;
begin
Result:=nmTMODELServer;
end;


function TTMODELServerFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TYPESDef\MODELServer\MODELServer.bmp');
  except
    end;
  end;
Result:=FImage;
end
;
function TTMODELServerFunctionality.GetInstanceByIPAddress(const IPAddress: string;  out id: integer): boolean;
begin
Result:=RemotedFunctionality.GetInstanceByIPAddress(IPAddress,id);
end;


{TMODELServerFunctionality}
Constructor TMODELServerFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TMODELServerFunctionalityRemoted.Create(Self);
end;


procedure TMODELServerFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TMODELServerFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TMODELServerPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TMODELServerFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

procedure TMODELServerFunctionality.setName(Value: string);
begin
RemotedFunctionality.setName(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TMODELServerFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;


function TMODELServerFunctionality.Notify(const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult;
var
  Cmd,Prms: string;
begin
Result:=Inherited Notify(NotifyType, pidTObj,pidObj);
case NotifyType of
ontVisualizationDblClick: begin
  if NOT IsUserExist(Space.UserName,Space.UserPassword) then Raise Exception.Create('your user '+Space.UserName+' is unknown on this model-server'); //. =>
  Cmd:=Application.ExeName;
  Prms:=IPAddress+' '+Space.UserName+' '+Space.UserPassword;
  //.
  try Space.Destroy; except end;
  //.
  ShellExecute(0,nil,PChar(Cmd),PChar(Prms),nil, SW_SHOW);
  //.
  Result:=cnrProcessed;
  Halt;
  end;
end;
end
;
function TMODELServerFunctionality.getIPAddress: string;
begin
Result:=RemotedFunctionality.getIPAddress;
end;

procedure TMODELServerFunctionality.setIPAddress(Value: string);
begin
RemotedFunctionality.setIPAddress(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TMODELServerFunctionality.IsUserExist(const _UserName,_UserPassword: string): boolean;
begin
Result:=RemotedFunctionality.IsUserExist(_UserName,_UserPassword);
end;

function TMODELServerFunctionality.GetUserID(const _UserName,_UserPassword: string): integer;
begin
Result:=RemotedFunctionality.GetUserID(_UserName,_UserPassword);
end;

function TMODELServerFunctionality.IsOnLine: boolean;
begin
Result:=RemotedFunctionality.IsOnLine;
end;

function TMODELServerFunctionality.Info: string;
begin
Result:=RemotedFunctionality.Info;
end;

procedure TMODELServerFunctionality.GetLicense(out License: WideString);
begin
RemotedFunctionality.GetLicense(License);
end;


{TTCoReferenceFunctionality}

Constructor TTCoReferenceFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTCoReference;
RemotedFunctionality:=TTCoReferenceFunctionalityRemoted.Create(Self);
end
;

function TTCoReferenceFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TTCoReferenceFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTCoReferenceFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TCoReferenceFunctionality.Create(Self, idComponent);
end
;
function TTCoReferenceFunctionality.getName: string;
begin
Result:=nmTCoReference;
end;


function TTCoReferenceFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TYPESDef\CoReference\CoReference.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

{TCoReferenceFunctionality}
Constructor TCoReferenceFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TCoReferenceFunctionalityRemoted.Create(Self);
end;


procedure TCoReferenceFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TCoReferenceFunctionality.Notify(const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult;
begin
Result:=Inherited Notify(NotifyType, pidTObj,pidObj);
//.
case NotifyType of
ontVisualizationClick,ontVisualizationDblClick:
  try
  ShowReferencedObjectPanelProps;
  Result:=cnrProcessed;
  except
    Result:=cnrUnprocessed;
    end;
end;
end
;

function TCoReferenceFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TCoReferencePanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TCoReferenceFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

procedure TCoReferenceFunctionality.setName(Value: string);
begin
RemotedFunctionality.setName(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TCoReferenceFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

procedure TCoReferenceFunctionality.GetReferencedObject(out idTReferencedObject,idReferencedObject: integer);
begin
RemotedFunctionality.GetReferencedObject(idTReferencedObject,idReferencedObject);
end;

procedure TCoReferenceFunctionality.SetReferencedObject(const idTReferencedObject,idReferencedObject: integer);
begin
RemotedFunctionality.SetReferencedObject(idTReferencedObject,idReferencedObject);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TCoReferenceFunctionality.ShowReferencedObjectPanelProps;
var
  idTReferencedObject,
  idReferencedObject: integer;
  PP: TForm;
begin
GetReferencedObject(idTReferencedObject,idReferencedObject);
if (idReferencedObject = 0) then Raise Exception.Create('there is no referenced object'); //. =>
PP:=nil;
//.
if (idTReferencedObject = idTCoComponent)
 then begin
  Space.Log.OperationStarting('loading ..........');
  try
  try
  PP:=Space.Plugins___CoComponent__TPanelProps_Create(CoComponentFunctionality_idCoType(idReferencedObject),idReferencedObject);
  except
    FreeAndNil(PP);
    end;
  finally
  Space.Log.OperationDone;
  end;
  end;
//.
if (PP <> nil)
 then with PP do begin
  Left:=Round((Screen.Width-Width)/2);
  Top:=Screen.Height-Height-20;
  Show();
  end
 else begin
  with TComponentFunctionality_Create(idTReferencedObject,idReferencedObject) do
  try
  PP:=TAbstractSpaceObjPanelProps(TPanelProps_Create(false, 0,nil,nilObject));
  with PP do begin
  Left:=Round((Screen.Width-Width)/2);
  Top:=Screen.Height-Height-20;
  Show();
  end;
  finally
  Release;
  end;
  end;
end;


{TTPositionerFunctionality}

Constructor TTPositionerFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTPositioner;
RemotedFunctionality:=TTPositionerFunctionalityRemoted.Create(Self);
end
;

function TTPositionerFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TTPositionerFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTPositionerFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TPositionerFunctionality.Create(Self, idComponent);
end
;
function TTPositionerFunctionality.getName: string;
begin
Result:=nmTPositioner;
end;


function TTPositionerFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TYPESDef\Positioner\Positioner.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

{TPositionerFunctionality}
Constructor TPositionerFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TPositionerFunctionalityRemoted.Create(Self);
end;


procedure TPositionerFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TPositionerFunctionality.Notify(const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult;
begin
Result:=Inherited Notify(NotifyType, pidTObj,pidObj);
//.
case NotifyType of
ontVisualizationClick,ontVisualizationDblClick: 
  try
  SetPosition;
  Result:=cnrProcessed;
  except
    Result:=cnrUnprocessed;
    end;
end;
end
;

function TPositionerFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TPositionerPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TPositionerFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TPositionerFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

procedure TPositionerFunctionality.Get2DPosition(out X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double);
begin
RemotedFunctionality.Get2DPosition(X0,Y0,X1,Y1,X2,Y2,X3,Y3);
end;

procedure TPositionerFunctionality.Save2DPosition(Reflector: TReflector);
var
  X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double;
begin
Reflector.ReflectionWindow.Lock.Enter;
try
X0:=Reflector.ReflectionWindow.X0/cfTransmeter;
Y0:=Reflector.ReflectionWindow.Y0/cfTransmeter;
X1:=Reflector.ReflectionWindow.X1/cfTransmeter;
Y1:=Reflector.ReflectionWindow.Y1/cfTransmeter;
X2:=Reflector.ReflectionWindow.X2/cfTransmeter;
Y2:=Reflector.ReflectionWindow.Y2/cfTransmeter;
X3:=Reflector.ReflectionWindow.X3/cfTransmeter;
Y3:=Reflector.ReflectionWindow.Y3/cfTransmeter;
finally
Reflector.ReflectionWindow.Lock.Leave;
end;
Save2DPosition(X0,Y0,X1,Y1,X2,Y2,X3,Y3);
end;

procedure TPositionerFunctionality.Save2DPosition(const X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double);
begin
RemotedFunctionality.Save2DPosition(X0,Y0,X1,Y1,X2,Y2,X3,Y3);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TPositionerFunctionality.SetPosition;
var
  _X0,_Y0, _X1,_Y1, _X2,_Y2, _X3,_Y3: Double;
  W: TReflectionWindowStrucEx;
begin
if (TypesSystem.Reflector = nil) then Raise Exception.Create('there is no default reflector'); //. =>
//.
if (ObjectIsInheritedFrom(TypesSystem.Reflector, TReflector))
 then with TReflector(TypesSystem.Reflector) do begin
  Get2DPosition(_X0,_Y0, _X1,_Y1, _X2,_Y2, _X3,_Y3);
  if ((_X0 = _X1) AND (_Y0 = _Y1))
   then SetReflection(_X0,_Y0)
   else begin
    with W do begin
    X0:=_X0; Y0:=_Y0;
    X1:=_X1; Y1:=_Y1;
    X2:=_X2; Y2:=_Y2;
    X3:=_X3; Y3:=_Y3;
    end;
    SetReflectionByWindow(W);
    end;
  end;
end;

function TPositionerFunctionality.getPositionName: string;
begin
Result:=RemotedFunctionality.getPositionName;
end;

procedure TPositionerFunctionality.setPositionName(Value: string);
begin
RemotedFunctionality.setPositionName(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;


{TTOrientedWMFVisualizationFunctionality}

Constructor TTOrientedWMFVisualizationFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTOrientedWMFVisualization;
RemotedFunctionality:=TTOrientedWMFVisualizationFunctionalityRemoted.Create(Self);
end
;

function TTOrientedWMFVisualizationFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTOrientedWMFVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TOrientedWMFVisualizationFunctionality.Create(Self, idComponent);
end
;
function TTOrientedWMFVisualizationFunctionality.getName: string;
begin
Result:=nmTOrientedWMFVisualization;
end;


function TTOrientedWMFVisualizationFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TypesDef\OrientedWMFVisualization\OrientedWMFVisualization.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

function TTOrientedWMFVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TObjectVisualization.Create;
with Result do begin
Color:=clWhite;
Width:=0;
flLoop:=false;
AddPoint(-50,0);
AddPoint(50,0);
end;
end
;

{TOrientedWMFVisualizationFunctionality}
Constructor TOrientedWMFVisualizationFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TOrientedWMFVisualizationFunctionalityRemoted.Create(Self);
end;


procedure TOrientedWMFVisualizationFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TOrientedWMFVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TOrientedWMFVisualizationPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TOrientedWMFVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=RemotedFunctionality.GetOwner(idTOwner,idOwner);
end;

procedure TOrientedWMFVisualizationFunctionality.DoOnChangeScale(const ChangeCoef: Double);
begin
Raise Exception.Create(SNotSupported); //. =>
end;

function TOrientedWMFVisualizationFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TOrientedWMFVisualizationFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

procedure TOrientedWMFVisualizationFunctionality.GetDATA(out DATAStream: TMemoryStream; out DATAType: TComponentFileType);
var
  BA: TByteArray;
  DT: integer;
begin
GetDATA(BA,DT);
ByteArray_CreateStream(BA, DATAStream);
DATAType:=TComponentFileType(DT);
end;

procedure TOrientedWMFVisualizationFunctionality.GetDATA(out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer);
var
  BA: TByteArray;
  DT: integer;
begin
GetDATA(BA,DT,MaxSize);
ByteArray_CreateStream(BA, DATAStream);
DATAType:=TComponentFileType(DT);
end;

procedure TOrientedWMFVisualizationFunctionality.GetDATA(out DATAStream: TByteArray; out DATAType: Integer);
begin
RemotedFunctionality.GetDATA(DATAStream,DATAType);
end;

procedure TOrientedWMFVisualizationFunctionality.GetDATA(out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer);
begin
RemotedFunctionality.GetDATA1(DATAStream,DATAType,MaxSize);
end;

procedure TOrientedWMFVisualizationFunctionality.SetDATA(DATAStream: TMemoryStream; const DATAType: TComponentFileType);
var
  BA: TByteArray;
begin
ByteArray_PrepareFromStream(BA,DATAStream);
SetDATA(BA,Integer(DATAType));
end;

procedure TOrientedWMFVisualizationFunctionality.SetDATA(DATAStream: TByteArray; const DATAType: integer);
begin
RemotedFunctionality.SetDATA(DATAStream,DATAType);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TOrientedWMFVisualizationFunctionality.LoadFromFile(const FileName: string);
var
  I: integer;
  Ext,S: string;
  DATAType: TComponentFileType;
  WMFName: string;
  MS: TMemoryStream;

  function GetDataType(const Ext: string): TComponentFileType;
  var
    I: TComponentFileType;
  begin
  for I:=Low(TComponentFileType) to High(TComponentFileType) do
    if ANSIUpperCase(ComponentsFilesTypesExtensions[I]) = ANSIUpperCase(Ext)
     then begin
      Result:=TComponentFileType(I);
      Exit; //. ->
      end;
  Raise Exception.Create('invalid file extension for file loading'); //. =>
  end;

  function ExtractWMFName(FileName: string): string;
  var
    I: integer;
  begin
  Result:='';
  FileName:=ExtractFileName(FileName);
  for I:=1 to Length(FileName) do
    if FileName[I] = '.'
     then
      Exit //. ->
     else
      Result:=Result+FileName[I];
  Result:=FileName;
  end;

begin
Ext:=ExtractFileExt(FileName); S:=''; for I:=2 to Length(Ext) do S:=S+Ext[I]; Ext:=S;
DATAType:=GetDataType(Ext);
WMFName:=ExtractWMFName(FileName);
MS:=TMemoryStream.Create;
with MS do
try
LoadFromFile(FileName);
SetDATA(MS,DATAType);
finally
Destroy;
end;
end;

function TOrientedWMFVisualizationFunctionality.getWidth: Double;
begin
Result:=RemotedFunctionality.getWidth;
end;

procedure TOrientedWMFVisualizationFunctionality.setWidth(Value: Double);
begin
RemotedFunctionality.setWidth(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TOrientedWMFVisualizationFunctionality.getHeight: Double;
begin
Result:=RemotedFunctionality.getHeight;
end;

procedure TOrientedWMFVisualizationFunctionality.setHeight(Value: Double);
begin
RemotedFunctionality.setHeight(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TOrientedWMFVisualizationFunctionality.getOrientation: integer;
begin
Result:=RemotedFunctionality.getOrientation;
end;

procedure TOrientedWMFVisualizationFunctionality.setOrientation(Value: integer);
begin
RemotedFunctionality.setOrientation(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TOrientedWMFVisualizationFunctionality.ChangeScale(const ScaleFactor: Double);
begin
RemotedFunctionality.ChangeScale(ScaleFactor);
end;

procedure TOrientedWMFVisualizationFunctionality.DestroyData;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TOrientedWMFVisualizationFunctionality.CloneData(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TOrientedWMFVisualizationFunctionality.UpdateContainer;
begin
RemotedFunctionality.UpdateContainer;
//. update local TypesSystem and representations
Space.StayUpToDate;
end;


function TOrientedWMFVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;

  function Refl: boolean;
  var
    ptrItem: pointer;

    _Width,_Height: integer;
    X0,Y0,X1,Y1: Double;
    Xmd,Ymd: Double;
    R: Double;
  begin
  Result:=false;
  try
  TypeSystem.Lock.Enter;
  try
  with pFigure do begin
  if NOT TSystemTOrientedWMFVisualization(TypeSystem).Cash.GetItem(Self.idObj, ptrItem)
   then begin
    Result:=ReflectAsNotLoaded(pFigure,pAdditionalFigure, pReflectionWindow, pCanvas);
    Exit; //. ->
    end;
  with TItemTOrientedWMFVisualizationCash(ptrItem^) do begin
  if (Width = 0) OR (Height = 0) then Exit; //. ->
  _Width:=Round(Width*pReflectionWindow.Scale);
  _Height:=Round(Height*pReflectionWindow.Scale);
  if (_Width < 1) OR (_Height < 1) then Exit; //. ->
  //.
  if WMF <> nil
   then begin
    X0:=Nodes[0].X;Y0:=Nodes[0].Y;
    X1:=Nodes[1].X;Y1:=Nodes[1].Y;
    Xmd:=(X0+X1)/2;
    Ymd:=(Y0+Y1)/2;
    R:=(Width*pReflectionWindow.Scale)/2;
    //. reflecting
    pCanvas.StretchDraw(Rect(Round(Xmd-Width*pReflectionWindow.Scale/2),Round(Ymd-Height*pReflectionWindow.Scale/2),Round(Xmd+Width*pReflectionWindow.Scale/2),Round(Ymd+Height*pReflectionWindow.Scale/2)), WMF);
    //.
    end
   else
    Result:=ReflectAsNotLoaded(pFigure,pAdditionalFigure, pReflectionWindow, pCanvas);
  //.
  Result:=true;
  end;
  end;
  finally
  TypeSystem.Lock.Leave;
  end;
  except
    end;
  end;

begin
Result:=Refl;
end
;
function TOrientedWMFVisualizationFunctionality.getDATAFileID: integer;
begin
Result:=RemotedFunctionality.getDATAFileID;
end;

procedure TOrientedWMFVisualizationFunctionality.setDATAFileID(Value: integer);
begin
RemotedFunctionality.setDATAFileID(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TOrientedWMFVisualizationFunctionality.DATAFile_Clear;
begin
RemotedFunctionality.DATAFile_Clear;
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TOrientedWMFVisualizationFunctionality.IsNewContainerAcceptable(const NewWidth,NewHeight,NewScale: Double): boolean;
begin
Result:=RemotedFunctionality.IsNewContainerAcceptable(NewWidth,NewHeight,NewScale);
end;

procedure TOrientedWMFVisualizationFunctionality.GetParams(out oWidth: Double; out oHeight: Double; out oOrientation: integer);
begin
RemotedFunctionality.GetParams(oWidth,oHeight,oOrientation);
end;


{TTCELLVisualizationFunctionality}

Constructor TTCELLVisualizationFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTCELLVisualization;
RemotedFunctionality:=TTCELLVisualizationFunctionalityRemoted.Create(Self);
end
;

function TTCELLVisualizationFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTCELLVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TCELLVisualizationFunctionality.Create(Self, idComponent);
end
;
function TTCELLVisualizationFunctionality.getName: string;
begin
Result:=nmTCELLVisualization;
end;


function TTCELLVisualizationFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TypesDef\CELLVisualization\CELLVisualization.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

function TTCELLVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TObjectVisualization.Create;
with Result do begin
Color:=clNavy;
Width:=0;
flLoop:=false;
flFill:=false;
ColorFill:=clRed;
AddPoint(-40,0);
AddPoint(40,0);
end;
end
;

{TCELLVisualizationFunctionality}
Constructor TCELLVisualizationFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TCELLVisualizationFunctionalityRemoted.Create(Self);
end;


procedure TCELLVisualizationFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TCELLVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TCELLVisualizationPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TCELLVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=RemotedFunctionality.GetOwner(idTOwner,idOwner);
end;

function TCELLVisualizationFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TCELLVisualizationFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

procedure TCELLVisualizationFunctionality.DestroyData;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TCELLVisualizationFunctionality.CloneData(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TCELLVisualizationFunctionality.DoOnChangeScale(const ChangeCoef: Double);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TCELLVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;

  procedure ShowFormatNodes(const ColCnt,RowCnt: integer);

    procedure ConvertPoint(X,Y: Double;  out Xs,Ys: Double);
    var
      RW: TReflectionWindowStrucEx;
      X_A,X_B,X_C,X_D: Double;
      Y_A,Y_B,Y_C,Y_D: Double;
      XC,YC,diffXCX0,diffYCY0,X_L,Y_L: Double;
      Node: TNode;
    begin
    with RW do begin
    pReflectionWindow.GetWindow(false, RW);

    X:=X*cfTransMeter;
    Y:=Y*cfTransMeter;

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

    Xs:=Xmn+X_L/Sqrt(sqr(X_A)+sqr(X_B))*(Xmx-Xmn);
    Ys:=Ymn+Y_L/Sqrt(sqr(Y_A)+sqr(Y_B))*(Ymx-Ymn);
    end;
    end;
    
  var
    Row_dX,Row_dY: Double;
    Col_dX,Col_dY: Double;
    _X0,_Y0, X,Y: Double;
    I,J: integer;
    Xscr,Yscr: integer;
    LogBrush: TLogBrush;
    BH: HBrush;
    LogPen: TLogPen;
    PH: HPen;
    flVisible: boolean;
  begin
  with pAdditionalFigure do begin
  Col_dX:=(Nodes[1].X-Nodes[0].X)/ColCnt; Col_dY:=(Nodes[1].Y-Nodes[0].Y)/ColCnt;
  Row_dX:=(Nodes[3].X-Nodes[0].X)/RowCnt; Row_dY:=(Nodes[3].Y-Nodes[0].Y)/RowCnt;
  if Sqrt(sqr(Col_dX)+sqr(Row_dX)) < 5 then Exit; //. ->
  _X0:=Nodes[0].X+Col_dX/2+Row_dX/2; _Y0:=Nodes[0].Y+Col_dY/2+Row_dY/2;
  //. drawing
  with LogBrush do begin
  lbStyle:=BS_SOLID;
  lbHatch:=0;
  lbColor:=ColorToRGB(pFigure.ColorFill);
  end;
  BH:=CreateBrushIndirect(LogBrush);
  with LogPen do begin
  lopnStyle:=PS_SOLID;
  lopnWidth.X:=1;
  lopnColor:=ColorToRGB(pFigure.Color);
  end;
  PH:=CreatePenIndirect(LogPen);
  try
  SelectObject(pCanvas.Handle,BH);
  SelectObject(pCanvas.Handle,PH);
  try
  for I:=0 to RowCnt-1 do begin
    X:=_X0; Y:=_Y0;
    flVisible:=false;
    for J:=0 to ColCnt-1 do begin
      Xscr:=Round(X); Yscr:=Round(Y);
      with pReflectionWindow do begin
      Lock.Enter;
      try
      if ((Xmn < Xscr) AND (Xscr < Xmx)) AND ((Ymn < Yscr) AND (Yscr < Ymx))
       then begin
        Windows.Rectangle(pCanvas.Handle, Xscr-1,Yscr-1, Xscr+1,Yscr+1);
        flVisible:=true;
        end
       else
        if flVisible then Break; //. >
      finally
      Lock.Leave;
      end;
      end;
      //.
      X:=X+Col_dX; Y:=Y+Col_dY;
      end;
    _X0:=_X0+Row_dX; _Y0:=_Y0+Row_dY;
    end;
  finally
  SelectObject(pCanvas.Handle,pCanvas.Brush.Handle);
  SelectObject(pCanvas.Handle,pCanvas.Pen.Handle);
  end;
  finally
  DeleteObject(PH);
  DeleteObject(BH);
  end;
  end;
  end;

var
  ptrItem: pointer;
  ColCnt: integer;
  RowCnt: integer;
  X0,Y0,X1,Y1,X2,Y2,X3,Y3: Double;
  L: Double;
  WidthColShift_dX, WidthColShift_dY: Double;
  WidthRowShift_dX, WidthRowShift_dY: Double;
  Line_dX,Line_dY: Double;
  LinesCount: integer;
  Step_dX,Step_dY: Double;
  StepsCount: integer;
  X,Y: Double;
  PenWidth: Double;
  LogBrush: TLogBrush;
  BH: HBrush;
  LogPen: TLogPen;
  PH: HPen;
begin
Result:=false; 
if (pFigure.Count <> 2) OR (pAdditionalFigure.Count = 0) then Exit; //. ->
TypeSystem.Lock.Enter;
try
TSystemTCELLVisualization(TypeSystem).Cash.GetItem(idObj, ptrItem);
if ptrItem = nil then Exit; //. ->
with TSystemTCELLVisualization(TypeSystem),TItemTCELLVisualizationCash(ptrItem^),pCanvas do begin
//.
ColCnt:=ColCount;
RowCnt:=RowCount;
//.
if ((FReflector <> nil) AND (TReflector(FReflector).Mode = rmEditing)) then ShowFormatNodes(ColCnt,RowCnt);
//.
PenWidth:=LineWidth*pReflectionWindow.Scale;
if Round(PenWidth) = 0
 then begin
  Result:=true; 
  Exit; //. ->
  end;
//. figure rectangle
X0:=pAdditionalFigure.Nodes[0].X; Y0:=pAdditionalFigure.Nodes[0].Y;
X1:=pAdditionalFigure.Nodes[1].X; Y1:=pAdditionalFigure.Nodes[1].Y;
X2:=pAdditionalFigure.Nodes[2].X; Y2:=pAdditionalFigure.Nodes[2].Y;
X3:=pAdditionalFigure.Nodes[3].X; Y3:=pAdditionalFigure.Nodes[3].Y;
//.
L:=Sqrt(sqr(X1-X0)+sqr(Y1-Y0));
WidthColShift_dX:=((X1-X0)/L)*(PenWidth/2);
WidthColShift_dY:=((Y1-Y0)/L)*(PenWidth/2);
L:=Sqrt(sqr(X3-X0)+sqr(Y3-Y0));
WidthRowShift_dX:=((X3-X0)/L)*(PenWidth/2);
WidthRowShift_dY:=((Y3-Y0)/L)*(PenWidth/2);
//.
X0:=X0+WidthColShift_dX+WidthRowShift_dX; Y0:=Y0+WidthColShift_dY+WidthRowShift_dY;
X1:=X1-WidthColShift_dX+WidthRowShift_dX; Y1:=Y1-WidthColShift_dY+WidthRowShift_dY;
X2:=X2-WidthColShift_dX-WidthRowShift_dX; Y2:=Y2-WidthColShift_dY-WidthRowShift_dY;
X3:=X3+WidthColShift_dX-WidthRowShift_dX; Y3:=Y3+WidthColShift_dY-WidthRowShift_dY;
//.
with LogBrush do begin
lbStyle:=BS_SOLID;
lbHatch:=0;
lbColor:=ColorToRGB(pFigure.ColorFill);
end;
BH:=CreateBrushIndirect(LogBrush);
with LogPen do begin
lopnStyle:=PS_SOLID;
if PenWidth > 0
 then begin
  lopnWidth.X:=Round(PenWidth);
  lopnColor:=ColorToRGB(pFigure.Color);
  end
 else begin
  lopnWidth.X:=1;
  lopnColor:=ColorToRGB(pFigure.ColorFill);
  end;
end;
PH:=CreatePenIndirect(LogPen);
try
SelectObject(pCanvas.Handle,BH);
SelectObject(pCanvas.Handle,PH);
try
//.
ReflectingFigureLock.Enter;
try
Line_dX:=X3-X0; Line_dY:=Y3-Y0;
LinesCount:=ColCount+1;
Step_dX:=(X1-X0)/ColCount; Step_dY:=(Y1-Y0)/ColCount;
StepsCount:=ColCount;
ReflectingFigure.Clear;
ReflectingFigure.flagLoop:=false;
X:=X0; Y:=Y0;
ReflectingFigure.Nodes[ReflectingFigure.Count].X:=X; ReflectingFigure.Nodes[ReflectingFigure.Count].Y:=Y;
Inc(ReflectingFigure.Count);
while LinesCount > 0 do begin
  X:=X+Line_dX; Y:=Y+Line_dY;
  ReflectingFigure.Nodes[ReflectingFigure.Count].X:=X; ReflectingFigure.Nodes[ReflectingFigure.Count].Y:=Y;
  Inc(ReflectingFigure.Count);
  Line_dX:=-Line_dX; Line_dY:=-Line_dY;
  if StepsCount > 0
   then begin
    X:=X+Step_dX; Y:=Y+Step_dY;
    ReflectingFigure.Nodes[ReflectingFigure.Count].X:=X; ReflectingFigure.Nodes[ReflectingFigure.Count].Y:=Y;
    Inc(ReflectingFigure.Count);
    Dec(StepsCount);
    end;
  Dec(LinesCount);
  end;
ReflectingFigure.AttractToLimits(pAttractionWindow);
//. drawing
Windows.Polyline(pCanvas.Handle, ReflectingFigure.ScreenNodes,ReflectingFigure.CountScreenNodes);
//.
Line_dX:=X1-X0; Line_dY:=Y1-Y0;
LinesCount:=RowCount+1;
Step_dX:=(X3-X0)/RowCount; Step_dY:=(Y3-Y0)/RowCount;
StepsCount:=RowCount;
ReflectingFigure.Clear;
ReflectingFigure.flagLoop:=false;
X:=X0; Y:=Y0;
ReflectingFigure.Nodes[ReflectingFigure.Count].X:=X; ReflectingFigure.Nodes[ReflectingFigure.Count].Y:=Y;
Inc(ReflectingFigure.Count);
while LinesCount > 0 do begin
  X:=X+Line_dX; Y:=Y+Line_dY;
  ReflectingFigure.Nodes[ReflectingFigure.Count].X:=X; ReflectingFigure.Nodes[ReflectingFigure.Count].Y:=Y;
  Inc(ReflectingFigure.Count);
  Line_dX:=-Line_dX; Line_dY:=-Line_dY;
  if StepsCount > 0
   then begin
    X:=X+Step_dX; Y:=Y+Step_dY;
    ReflectingFigure.Nodes[ReflectingFigure.Count].X:=X; ReflectingFigure.Nodes[ReflectingFigure.Count].Y:=Y;
    Inc(ReflectingFigure.Count);
    Dec(StepsCount);
    end;
  Dec(LinesCount);
  end;
ReflectingFigure.AttractToLimits(pAttractionWindow);
//. drawing
Windows.Polyline(pCanvas.Handle, ReflectingFigure.ScreenNodes,ReflectingFigure.CountScreenNodes);
finally
ReflectingFigureLock.Leave;
end;
finally
SelectObject(pCanvas.Handle,pCanvas.Brush.Handle);
SelectObject(pCanvas.Handle,pCanvas.Pen.Handle);
end;
finally
DeleteObject(PH);
DeleteObject(BH);
end;
//.
end;
finally
TypeSystem.Lock.Leave;
end;
Result:=true;
end
;
procedure TCELLVisualizationFunctionality.GetCoordinates(out X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double);
begin
RemotedFunctionality.GetCoordinates(X0,Y0,X1,Y1,X2,Y2,X3,Y3);
end;

procedure TCELLVisualizationFunctionality.SetReflectorView;
var
  ptrObj: TPtr;
  Obj: TSpaceObj;
  ptrPoint: TPtr;
  P0,P1: TPoint;
  CELLs_X0,CELLs_Y0, CELLs_X1,CELLs_Y1: Extended;
  CELLs_Xcenter,CELLs_Ycenter: Extended;
  ALFA,BETTA,GAMMA: Extended;
begin
if Reflector = nil then Raise Exception.Create('Reflector is nil'); //. =>
if NOT ObjectIsInheritedFrom(Reflector,TReflector) then Raise Exception.Create('Reflector must be TReflector type'); //. =>
ptrObj:=Ptr;
Space.ReadObj(Obj,SizeOf(Obj), ptrObj);
if Obj.Width = 0 then Raise Exception.Create('width is null'); //. =>
ptrPoint:=Obj.ptrFirstPoint;
if ptrPoint = nilPtr then Raise Exception.Create('could not get P0'); //. =>
Space.ReadObj(P0,SizeOf(P0), ptrPoint);
ptrPoint:=P0.ptrNextObj;
if ptrPoint = nilPtr then Raise Exception.Create('could not get P1'); //. =>
Space.ReadObj(P1,SizeOf(P1), ptrPoint);
ptrPoint:=P1.ptrNextObj;
if ptrPoint <> nilPtr then Raise Exception.Create('too many nodes'); //. =>
CELLs_X0:=P0.X; CELLs_Y0:=P0.Y;
CELLs_X1:=P1.X; CELLs_Y1:=P1.Y;
CELLs_Xcenter:=(CELLs_X1+CELLs_X0)/2; CELLs_Ycenter:=(CELLs_Y1+CELLs_Y0)/2;
with TReflector(Reflector).ReflectionWindow do begin
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
with TReflector(Reflector) do begin
SetReflection(CELLs_Xcenter,CELLs_Ycenter);
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
  end;
RotateReflection(GAMMA);
end;
end;

procedure TCELLVisualizationFunctionality.Change(const Left_dColumns,Top_dRows,Right_dColumns,Bottom_dRows: integer);
begin
RemotedFunctionality.Change(Left_dColumns,Top_dRows,Right_dColumns,Bottom_dRows);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TCELLVisualizationFunctionality.GetFormatNodes(out NodesList: TList; out SizeX,SizeY: integer): boolean;
var
  BA: TByteArray;
  I: integer;
  ptrNewPoint: pointer;
  ptrDestroyPoint: pointer;
begin
Result:=GetFormatNodes(BA,SizeX,SizeY);
if NOT Result then Exit; //. ->
NodesList:=TList.Create;                
try
for I:=0 to (Length(BA) DIV SizeOf(TPoint))-1 do begin
  GetMem(ptrNewPoint,SizeOf(TPoint));
  TPoint(ptrNewPoint^):=TPoint(Pointer(Integer(@BA[0])+I*SizeOf(TPoint))^);
  NodesList.Add(ptrNewPoint);                                 
  end;
except
  for I:=0 to NodesList.Count-1 do begin
    ptrDestroyPoint:=NodesList[I];
    FreeMem(ptrDestroyPoint,SizeOf(TPoint));
    end;
  NodesList.Destroy;
  NodesList:=nil;
  Raise; //. =>
  end;
end;

function TCELLVisualizationFunctionality.GetFormatNodes(out NodesList: TByteArray; out SizeX,SizeY: integer): boolean;
begin
Result:=RemotedFunctionality.GetFormatNodes(NodesList,SizeX,SizeY);
end;

procedure TCELLVisualizationFunctionality.DoQuad;
begin
RemotedFunctionality.DoQuad;
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TCELLVisualizationFunctionality.GetInsideObjectsList(const FindTypeID: integer; const flBuiltInType: boolean;  out List: TComponentsList);
var
  BA: TByteArray;
  I: integer;
  Item: TItemComponentsList;
begin
RemotedFunctionality.GetInsideObjectsList(FindTypeID,flBuiltInType,BA);
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

procedure TCELLVisualizationFunctionality.GetInsideObjectsList(const FindTypeID: integer; const flBuiltInType: boolean;  out List: TByteArray);
begin
RemotedFunctionality.GetInsideObjectsList(FindTypeID,flBuiltInType,List);
end;

function TCELLVisualizationFunctionality.getColCount: integer;
begin
Result:=RemotedFunctionality.getColCount;
end;

procedure TCELLVisualizationFunctionality.setColCount(Value: integer);
begin
RemotedFunctionality.setColCount(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TCELLVisualizationFunctionality.getRowCount: integer;
begin
Result:=RemotedFunctionality.getRowCount;
end;

procedure TCELLVisualizationFunctionality.setRowCount(Value: integer);
begin
RemotedFunctionality.setRowCount(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TCELLVisualizationFunctionality.getLineWidth: Double;
begin
Result:=RemotedFunctionality.getLineWidth;
end;

procedure TCELLVisualizationFunctionality.setLineWidth(Value: Double);
begin
RemotedFunctionality.setLineWidth(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TCELLVisualizationFunctionality.getColSize: Double;
begin
Result:=RemotedFunctionality.getColSize;
end;

function TCELLVisualizationFunctionality.getRowSize: Double;
begin
Result:=RemotedFunctionality.getRowSize;
end;

procedure TCELLVisualizationFunctionality.GetParams(out oColCount: integer; out oRowCount: integer; out oLineWidth: Double);
begin
RemotedFunctionality.GetParams(oColCount,oRowCount,oLineWidth);
end;


{TTEllipseVisualizationFunctionality}

Constructor TTEllipseVisualizationFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTEllipseVisualization;
RemotedFunctionality:=TTEllipseVisualizationFunctionalityRemoted.Create(Self);
end
;

function TTEllipseVisualizationFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTEllipseVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TEllipseVisualizationFunctionality.Create(Self, idComponent);
end
;
function TTEllipseVisualizationFunctionality.getName: string;
begin
Result:=nmTEllipseVisualization;
end;


function TTEllipseVisualizationFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TypesDef\EllipseVisualization\EllipseVisualization.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

function TTEllipseVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TObjectVisualization.Create;
with Result do begin
Color:=clNavy;
Width:=0;
flLoop:=false;
flFill:=false;
ColorFill:=clRed;
AddPoint(-40,0);
AddPoint(40,0);
end;
end
;

{TEllipseVisualizationFunctionality}
Constructor TEllipseVisualizationFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TEllipseVisualizationFunctionalityRemoted.Create(Self);
end;

procedure TEllipseVisualizationFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TEllipseVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TEllipseVisualizationPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TEllipseVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=RemotedFunctionality.GetOwner(idTOwner,idOwner);
end;

function TEllipseVisualizationFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TEllipseVisualizationFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

procedure TEllipseVisualizationFunctionality.DestroyData;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TEllipseVisualizationFunctionality.CloneData(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TEllipseVisualizationFunctionality.DoOnChangeScale(const ChangeCoef: Double);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TEllipseVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
var
  ptrItem: pointer;
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
  PenWidth: Double;
  LogBrush: TLogBrush;
  BH: HBrush;
  LogPen: TLogPen;
  PH: HPen;
begin
Result:=false;
TypeSystem.Lock.Enter;
try
TSystemTEllipseVisualization(TypeSystem).Cash.GetItem(idObj, ptrItem);
if ptrItem = nil then Exit; //. ->
with pCanvas,pFigure do begin
if (Width <= 0) then Exit; //. ->
PenWidth:=TItemTEllipseVisualizationCash(ptrItem^).BorderWidth*pReflectionWindow.Scale;
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
try
//. drawing
with LogBrush do begin
lbStyle:=BS_SOLID;
lbHatch:=0;
lbColor:=ColorToRGB(pFigure.ColorFill);
end;
BH:=CreateBrushIndirect(LogBrush);
with LogPen do begin
lopnStyle:=PS_SOLID;
if PenWidth > 0
 then begin
  lopnWidth.X:=Round(PenWidth);
  lopnColor:=ColorToRGB(pFigure.Color);
  end
 else begin
  lopnWidth.X:=1;
  lopnColor:=ColorToRGB(pFigure.ColorFill);
  end;
end;
PH:=CreatePenIndirect(LogPen);
try
SelectObject(pCanvas.Handle,BH);
SelectObject(pCanvas.Handle,PH);
try
Windows.Ellipse(pCanvas.Handle, Round(0+PenWidth/2),Round(0+PenWidth/2), Round(_Width-PenWidth/2),Round(b-PenWidth/2));
finally
SelectObject(pCanvas.Handle,pCanvas.Brush.Handle);
SelectObject(pCanvas.Handle,pCanvas.Pen.Handle);
end;
finally
ModifyWorldTransForm(pCanvas.Handle,XF,MWT_IDENTITY);
end;
finally
DeleteObject(PH);
DeleteObject(BH);
end;
//.
end;
finally
TypeSystem.Lock.Leave;
end;
Result:=true;
end
;
function TEllipseVisualizationFunctionality.getColor: TColor;
begin
Result:=RemotedFunctionality.getColor;
end;

procedure TEllipseVisualizationFunctionality.setColor(Value: TColor);
begin
RemotedFunctionality.setColor(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TEllipseVisualizationFunctionality.getBorderColor: TColor;
begin
Result:=RemotedFunctionality.getBorderColor;
end;

procedure TEllipseVisualizationFunctionality.setBorderColor(Value: TColor);
begin
RemotedFunctionality.setBorderColor(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TEllipseVisualizationFunctionality.getBorderWidth: Double;
begin
Result:=RemotedFunctionality.getBorderWidth;
end;

procedure TEllipseVisualizationFunctionality.setBorderWidth(Value: Double);
begin
RemotedFunctionality.setBorderWidth(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;


{TTWMFVisualizationFunctionality}

Constructor TTWMFVisualizationFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTWMFVisualization;
RemotedFunctionality:=TTWMFVisualizationFunctionalityRemoted.Create(Self);
end
;

function TTWMFVisualizationFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTWMFVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TWMFVisualizationFunctionality.Create(Self, idComponent);
end
;
function TTWMFVisualizationFunctionality.getName: string;
begin
Result:=nmTWMFVisualization;
end;


function TTWMFVisualizationFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TypesDef\WMFVisualization\WMFVisualization.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

function TTWMFVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TObjectVisualization.Create;
with Result do begin
Color:=clWhite;
Width:=0;
flLoop:=false;
AddPoint(-50,0);
AddPoint(50,0);
end;
end
;

{TWMFVisualizationFunctionality}
Constructor TWMFVisualizationFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TWMFVisualizationFunctionalityRemoted.Create(Self);
end;


procedure TWMFVisualizationFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TWMFVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TWMFVisualizationPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TWMFVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=RemotedFunctionality.GetOwner(idTOwner,idOwner);
end;

function TWMFVisualizationFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TWMFVisualizationFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

procedure TWMFVisualizationFunctionality.GetDATA(out DATAStream: TMemoryStream; out DATAType: TComponentFileType);
var
  BA: TByteArray;
  DT: integer;
begin
GetDATA(BA,DT);
ByteArray_CreateStream(BA, DATAStream);
DATAType:=TComponentFileType(DT);
end;

procedure TWMFVisualizationFunctionality.GetDATA(out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer);
var
  BA: TByteArray;
  DT: integer;
begin
GetDATA(BA,DT,MaxSize);
ByteArray_CreateStream(BA, DATAStream);
DATAType:=TComponentFileType(DT);
end;

procedure TWMFVisualizationFunctionality.GetDATA(out DATAStream: TByteArray; out DATAType: Integer);
begin
RemotedFunctionality.GetDATA(DATAStream,DATAType);
end;

procedure TWMFVisualizationFunctionality.GetDATA(out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer);
begin
RemotedFunctionality.GetDATA1(DATAStream,DATAType,MaxSize);
end;

procedure TWMFVisualizationFunctionality.SetDATA(DATAStream: TMemoryStream; const DATAType: TComponentFileType);
var
  BA: TByteArray;
begin
ByteArray_PrepareFromStream(BA,TStream(DATAStream));
SetDATA(BA,Integer(DATAType));
end;

procedure TWMFVisualizationFunctionality.SetDATA(DATAStream: TByteArray; const DATAType: integer);
begin
RemotedFunctionality.SetDATA(DATAStream,DATAType);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TWMFVisualizationFunctionality.LoadFromFile(const FileName: string);
var
  I: integer;
  Ext,S: string;
  DATAType: TComponentFileType;
  WMFName: string;
  MS: TMemoryStream;

  function GetDataType(const Ext: string): TComponentFileType;
  var
    I: TComponentFileType;
  begin
  for I:=Low(TComponentFileType) to High(TComponentFileType) do
    if ANSIUpperCase(ComponentsFilesTypesExtensions[I]) = ANSIUpperCase(Ext)
     then begin
      Result:=TComponentFileType(I);
      Exit; //. ->
      end;
  Raise Exception.Create('invalid file extension for file loading'); //. =>
  end;

  function ExtractName(FileName: string): string;
  var
    I: integer;
  begin
  Result:='';
  FileName:=ExtractFileName(FileName);
  for I:=1 to Length(FileName) do
    if FileName[I] = '.'
     then
      Exit //. ->
     else
      Result:=Result+FileName[I];
  Result:=FileName;
  end;

begin
Ext:=ExtractFileExt(FileName); S:=''; for I:=2 to Length(Ext) do S:=S+Ext[I]; Ext:=S;
DATAType:=GetDataType(Ext);
WMFName:=ExtractName(FileName);
MS:=TMemoryStream.Create;
with MS do
try
LoadFromFile(FileName);
SetDATA(MS,DATAType);
finally
Destroy;
end;
end;

procedure TWMFVisualizationFunctionality.DestroyData;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TWMFVisualizationFunctionality.CloneData(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TWMFVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;

  function Refl: boolean;
  var
    ptrItem: pointer;

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
  TypeSystem.Lock.Enter;
  try
  with pFigure do begin
  if (Width <= 0) then Exit; //. ->
  if NOT TSystemTWMFVisualization(TypeSystem).Cash.GetItem(Self.idObj, ptrItem) then Exit; //. ->
  with TItemTWMFVisualizationCash(ptrItem^) do begin
  //.
  if WMF <> nil
   then begin
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
    try
    pCanvas.Draw(0,0,WMF);
    finally
    ModifyWorldTransForm(pCanvas.Handle,XF,MWT_IDENTITY);
    end;
    Result:=true;
    //.
    end
   else
    Result:=ReflectAsNotLoaded(pFigure,pAdditionalFigure, pReflectionWindow, pCanvas);
  //.
  end;
  end;
  finally
  TypeSystem.Lock.Leave;
  end;
  except
    end;
  end;

begin
Result:=Refl;
end
;
function TWMFVisualizationFunctionality.getDATAFileID: integer;
begin
Result:=RemotedFunctionality.getDATAFileID;
end;

procedure TWMFVisualizationFunctionality.setDATAFileID(Value: integer);
begin
RemotedFunctionality.setDATAFileID(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TWMFVisualizationFunctionality.DATAFile_Clear;
begin
RemotedFunctionality.DATAFile_Clear;
//. update local TypesSystem and representations
Space.StayUpToDate;
end;


{TTPictureVisualizationFunctionality}

Constructor TTPictureVisualizationFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTPictureVisualization;
RemotedFunctionality:=TTPictureVisualizationFunctionalityRemoted.Create(Self);
end
;

function TTPictureVisualizationFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTPictureVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TPictureVisualizationFunctionality.Create(Self, idComponent);
end
;
function TTPictureVisualizationFunctionality.getName: string;
begin
Result:=nmTPictureVisualization;
end;


function TTPictureVisualizationFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TypesDef\PictureVisualization\PictureVisualization.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

function TTPictureVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TObjectVisualization.Create;
with Result do begin
Color:=clWhite;
Width:=0;
flLoop:=false;
AddPoint(-50,0);
AddPoint(50,0);
end;
end
;

{TPictureVisualizationFunctionality}
Constructor TPictureVisualizationFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TPictureVisualizationFunctionalityRemoted.Create(Self);
end;


procedure TPictureVisualizationFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TPictureVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TPictureVisualizationPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TPictureVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=RemotedFunctionality.GetOwner(idTOwner,idOwner);
end;

function TPictureVisualizationFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TPictureVisualizationFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

procedure TPictureVisualizationFunctionality.GetDATA(out DATAStream: TMemoryStream; out DATAType: TComponentFileType);
var
  BA: TByteArray;
  DT: integer;
begin
GetDATA(BA,DT);
ByteArray_CreateStream(BA, DATAStream);
DATAType:=TComponentFileType(DT);
end;

procedure TPictureVisualizationFunctionality.GetDATA(out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer);
var
  BA: TByteArray;
  DT: integer;
begin
GetDATA(BA,DT,MaxSize);
ByteArray_CreateStream(BA, DATAStream);
DATAType:=TComponentFileType(DT);
end;

procedure TPictureVisualizationFunctionality.GetDATA(out DATAStream: TByteArray; out DATAType: Integer);
begin
RemotedFunctionality.GetDATA(DATAStream,DATAType);
end;

procedure TPictureVisualizationFunctionality.GetDATA(out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer);
begin
RemotedFunctionality.GetDATA1(DATAStream,DATAType,MaxSize);
end;

procedure TPictureVisualizationFunctionality.SetDATA(DATAStream: TMemoryStream; const DATAType: TComponentFileType);
var
  BA: TByteArray;
begin
ByteArray_PrepareFromStream(BA,TStream(DATAStream));
SetDATA(BA,Integer(DATAType));
end;

procedure TPictureVisualizationFunctionality.SetDATA(DATAStream: TByteArray; const DATAType: integer);
begin
RemotedFunctionality.SetDATA(DATAStream,DATAType);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TPictureVisualizationFunctionality.LoadFromFile(const FileName: string);
var
  I: integer;
  Ext,S: string;
  DATAType: TComponentFileType;
  PictureName: string;
  MS: TMemoryStream;

  function GetDataType(const Ext: string): TComponentFileType;
  var
    I: TComponentFileType;
  begin
  for I:=Low(TComponentFileType) to High(TComponentFileType) do
    if ANSIUpperCase(ComponentsFilesTypesExtensions[I]) = ANSIUpperCase(Ext)
     then begin
      Result:=TComponentFileType(I);
      Exit; //. ->
      end;
  Raise Exception.Create('invalid file extension for file loading'); //. =>
  end;

  function ExtractPictureName(FileName: string): string;
  var
    I: integer;
  begin
  Result:='';
  FileName:=ExtractFileName(FileName);
  for I:=1 to Length(FileName) do
    if FileName[I] = '.'
     then
      Exit //. ->
     else
      Result:=Result+FileName[I];
  Result:=FileName;
  end;

begin
Ext:=ExtractFileExt(FileName); S:=''; for I:=2 to Length(Ext) do S:=S+Ext[I]; Ext:=S;
DATAType:=GetDataType(Ext);
PictureName:=ExtractPictureName(FileName);
MS:=TMemoryStream.Create;
with MS do
try
LoadFromFile(FileName);
SetDATA(MS,DATAType);
finally
Destroy;
end;
SetProportion;
end;

procedure TPictureVisualizationFunctionality.GetBMP(out BMP: TBitmap);
var
  BA: TByteArray;
  S: TMemoryStream;
begin
RemotedFunctionality.GetBMP(BA);
ByteArray_CreateStream(BA, S);
try
BMP:=TBitmap.Create;
try
BMP.LoadFromStream(S);
except
  BMP.Destroy;
  BMP:=nil;
  Raise; //. =>
  end;
finally
S.Destroy;
end;
end;

procedure TPictureVisualizationFunctionality.GetBMP(out BMP: TByteArray);
begin
RemotedFunctionality.GetBMP(BMP);
end;

procedure TPictureVisualizationFunctionality.SetProportion;
begin
RemotedFunctionality.SetProportion;
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TPictureVisualizationFunctionality.DestroyData;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TPictureVisualizationFunctionality.CloneData(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TPictureVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;

  function Refl: boolean;
  var
    ptrItem: pointer;
    _Scale: double;
    flExit: boolean;
    _idObj,_idDATAFile: integer;
    DS: TMemoryStream;
    CDT: TComponentFileType;
    _BMP: TBitmap;
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
  //.
  _Scale:=pReflectionWindow.Scale;
  TypeSystem.Lock.Enter;
  try
  with pFigure do begin
  if (Width <= 0) then Exit; //. ->
  if NOT TSystemTPictureVisualization(TypeSystem).Cash.GetItem(Self.idObj, ptrItem) then Exit; //. ->
  with TItemTPictureVisualizationCash(ptrItem^) do begin
  X0:=Nodes[0].X;Y0:=Nodes[0].Y;
  X1:=Nodes[1].X;Y1:=Nodes[1].Y;
  diffX1X0:=X1-X0;
  diffY1Y0:=Y1-Y0;
  _Width:=Sqrt(sqr(diffX1X0)+sqr(diffY1Y0));
  pReflectionWindow.Lock.Enter;
  try
  _Scale:=_Width/(pReflectionWindow.Xmx-pReflectionWindow.Xmn);
  finally
  pReflectionWindow.Lock.Leave;
  end;
  //.
  flExit:=(NOT ((VisibleMinScale = 0) AND (VisibleMaxScale = 0)) AND NOT ((VisibleMinScale <= _Scale) AND (_Scale < VisibleMaxScale)));
  _idObj:=idObj;
  _idDATAFile:=idDATAFile;
  _BMP:=BMP;
  end;
  end;
  finally
  TypeSystem.Lock.Leave;
  end;
  if (flExit)
   then begin
    Result:=true;
    Exit; //. ->
    end;
  if (_BMP = nil)
   then
    if (_idDATAFile <> 0)
     then
      if (TSystemTPictureVisualization(TypeSystem).Cash.GetComponentFile(_idDATAFile, DS) AND (DS <> nil))
       then
        try
        _BMP:=TBitmap.Create;
        _BMP.LoadFromStream(DS);
        finally
        DS.Destroy;
        end
       else with TPictureVisualizationFunctionality(TComponentFunctionality_Create(TypeSystem.idType,_idObj)) do
        try
        GetDATA(DS,CDT,Space.Configuration.VisualizationMaxSize);
        try
        TSystemTPictureVisualization(TypeSystem).Cash.ConvertDATAToBMP(DS,CDT, _BMP);
        finally
        DS.Destroy;
        end;
        finally
        Release;
        end;
  //.
  TypeSystem.Lock.Enter;
  try
  with pFigure do begin
  if NOT TSystemTPictureVisualization(TypeSystem).Cash.GetItem(Self.idObj, ptrItem) then Exit; //. ->
  with TItemTPictureVisualizationCash(ptrItem^) do begin
  if (BMP <> _BMP)
   then
    if (BMP = nil) then BMP:=_BMP else FreeAndNil(_BMP);
  //.
  if BMP <> nil
   then begin
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
    BMP.Canvas.Lock;
    try
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
    XF.eM11:=_Width/BMP.Width;
    XF.eM12:=0;
    XF.eM21:=0;
    XF.eM22:=b/BMP.Height;
    BMP.Transparent:=true;
    BMP.TransparentColor:=BMP.Canvas.Pixels[0,BMP.Height-1];
    ModifyWorldTransForm(pCanvas.Handle,XF,MWT_LEFTMULTIPLY);
    try
    /// ? native draw pCanvas.Draw(0,0,BMP);
    DrawUsingGDIPus(pCanvas.Handle, BMP,0,0,BMP.Width,BMP.Height);
    finally
    ModifyWorldTransForm(pCanvas.Handle,XF,MWT_IDENTITY);
    end;
    finally
    BMP.Canvas.UnLock;
    end;
    Result:=true;
    //.
    end
   else
    Result:=ReflectAsNotLoaded(pFigure,pAdditionalFigure, pReflectionWindow, pCanvas);
  //.
  end;
  end;
  finally
  TypeSystem.Lock.Leave;
  end;
  except
    end;
  end;

begin
Result:=Refl;
end
;
function TPictureVisualizationFunctionality.getDATAFileID: integer;
begin
Result:=RemotedFunctionality.getDATAFileID;
end;

procedure TPictureVisualizationFunctionality.setDATAFileID(Value: integer);
begin
RemotedFunctionality.setDATAFileID(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TPictureVisualizationFunctionality.DATAFile_Clear;
begin
RemotedFunctionality.DATAFile_Clear;
//. update local TypesSystem and representations
Space.StayUpToDate;
end;


{TTRoundVisualizationFunctionality}

Constructor TTRoundVisualizationFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTRoundVisualization;
RemotedFunctionality:=TTRoundVisualizationFunctionalityRemoted.Create(Self);
end
;

function TTRoundVisualizationFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTRoundVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TRoundVisualizationFunctionality.Create(Self, idComponent);
end
;
function TTRoundVisualizationFunctionality.getName: string;
begin
Result:=nmTRoundVisualization;
end;


function TTRoundVisualizationFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TypesDef\RoundVisualization\RoundVisualization.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

function TTRoundVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TObjectVisualization.Create;
with Result do begin
Color:=clNavy;
Width:=0;
flLoop:=false;
flFill:=false;
ColorFill:=clRed;
AddPoint(-40,0);
AddPoint(40,0);
end;
end
;

{TRoundVisualizationFunctionality}
Constructor TRoundVisualizationFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TRoundVisualizationFunctionalityRemoted.Create(Self);
end;


procedure TRoundVisualizationFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TRoundVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TRoundVisualizationPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TRoundVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=RemotedFunctionality.GetOwner(idTOwner,idOwner);
end;

function TRoundVisualizationFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TRoundVisualizationFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

procedure TRoundVisualizationFunctionality.DestroyData;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TRoundVisualizationFunctionality.CloneData(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TRoundVisualizationFunctionality.DoOnChangeScale(const ChangeCoef: Double);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TRoundVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
var
  ptrItem: pointer;
  W: Double;
  PenWidth: Double;
  Xc,Yc: Double;
  R: Double;
  L: Double;
  LogBrush: TLogBrush;
  BH: HBrush;
  LogPen: TLogPen;
  PH: HPen;
begin
Result:=false;
TypeSystem.Lock.Enter;
try
TSystemTRoundVisualization(TypeSystem).Cash.GetItem(idObj, ptrItem);
if ptrItem = nil then Exit; //. ->
with pCanvas,pFigure do begin
Xc:=Round((Nodes[0].X+Nodes[1].X)/2);
Yc:=Round((Nodes[0].Y+Nodes[1].Y)/2);
W:=Width*pReflectionWindow.Scale;
L:=Sqrt(sqr(Nodes[1].X-Nodes[0].X)+sqr(Nodes[1].Y-Nodes[0].Y));
if L < W
 then R:=L/2
 else R:=W/2;
PenWidth:=TItemTRoundVisualizationCash(ptrItem^).BorderWidth*pReflectionWindow.Scale;
if PenWidth > R then PenWidth:=R;
//. drawing
with LogBrush do begin
lbStyle:=BS_SOLID;
lbHatch:=0;
lbColor:=ColorToRGB(pFigure.ColorFill);
end;
BH:=CreateBrushIndirect(LogBrush);
with LogPen do begin
lopnStyle:=PS_SOLID;
if PenWidth > 0
 then begin 
  lopnWidth.X:=Round(PenWidth);
  lopnColor:=ColorToRGB(pFigure.Color);
  end
 else begin 
  lopnWidth.X:=1;
  lopnColor:=ColorToRGB(pFigure.ColorFill);
  end;
end;
PH:=CreatePenIndirect(LogPen);
try
SelectObject(pCanvas.Handle,BH);
SelectObject(pCanvas.Handle,PH);
try
Windows.Ellipse(pCanvas.Handle, Round(Xc-R+PenWidth/2),Round(Yc-R+PenWidth/2), Round(Xc+R-PenWidth/2),Round(Yc+R-PenWidth/2));
finally
SelectObject(pCanvas.Handle,pCanvas.Brush.Handle);
SelectObject(pCanvas.Handle,pCanvas.Pen.Handle);
end;
finally
DeleteObject(PH);
DeleteObject(BH);
end;
//.
end;
finally
TypeSystem.Lock.Leave;
end;
Result:=true;
end
;
function TRoundVisualizationFunctionality.getColor: TColor;
begin
Result:=RemotedFunctionality.getColor;
end;

procedure TRoundVisualizationFunctionality.setColor(Value: TColor);
begin
RemotedFunctionality.setColor(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TRoundVisualizationFunctionality.getBorderColor: TColor;
begin
Result:=RemotedFunctionality.getBorderColor;
end;

procedure TRoundVisualizationFunctionality.setBorderColor(Value: TColor);
begin
RemotedFunctionality.setBorderColor(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TRoundVisualizationFunctionality.getBorderWidth: Double;
begin
Result:=RemotedFunctionality.getBorderWidth;
end;

procedure TRoundVisualizationFunctionality.setBorderWidth(Value: Double);
begin
RemotedFunctionality.setBorderWidth(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;


{TTGeodesyPointFunctionality}

Constructor TTGeodesyPointFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTGeodesyPoint;
RemotedFunctionality:=TTGeodesyPointFunctionalityRemoted.Create(Self);
end
;

function TTGeodesyPointFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TTGeodesyPointFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTGeodesyPointFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TGeodesyPointFunctionality.Create(Self, idComponent);
end
;
function TTGeodesyPointFunctionality.getName: string;
begin
Result:=nmTGeodesyPoint;
end;


function TTGeodesyPointFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TYPESDef\GeodesyPoint\GeodesyPoint.bmp');
  except
    end;
  end;
Result:=FImage;
end
;
function TTGeodesyPointFunctionality.ConvertSpaceCRDToGeoCRD(const X,Y: Double; out Latitude,Longitude: Double): boolean;
begin
Result:=RemotedFunctionality.ConvertSpaceCRDToGeoCRD(X,Y,Latitude,Longitude);
end;

function TTGeodesyPointFunctionality.ConvertGeoCRDToSpaceCRD(const Latitude,Longitude: Double; out X,Y: Double): boolean;
begin
Result:=RemotedFunctionality.ConvertGeoCRDToSpaceCRD(Latitude,Longitude,X,Y);
end;


{TGeodesyPointFunctionality}
Constructor TGeodesyPointFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TGeodesyPointFunctionalityRemoted.Create(Self);
end;


procedure TGeodesyPointFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;

function TGeodesyPointFunctionality.Notify(const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult;
begin
Result:=Inherited Notify(NotifyType, pidTObj,pidObj);
//. overriding idCrdSys
case NotifyType of
ontBecomeComponent:
  if (pidTObj = idTGeoCrdSystem)
   then begin
    idCrdSys:=pidObj;
    Result:=cnrProcessed;
    end;
end;
//.
end;

function TGeodesyPointFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TGeodesyPointPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TGeodesyPointFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TGeodesyPointFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

function TGeodesyPointFunctionality.getLatitude: Double;
begin
Result:=RemotedFunctionality.getLatitude;
end;

procedure TGeodesyPointFunctionality.setLatitude(Value: Double);
begin
RemotedFunctionality.setLatitude(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TGeodesyPointFunctionality.getLongitude: Double;
begin
Result:=RemotedFunctionality.getLongitude;
end;

procedure TGeodesyPointFunctionality.setLongitude(Value: Double);
begin
RemotedFunctionality.setLongitude(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;


{TTPrivateAreaVisualizationFunctionality}

Constructor TTPrivateAreaVisualizationFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTPrivateAreaVisualization;
RemotedFunctionality:=TTPrivateAreaVisualizationFunctionalityRemoted.Create(Self);
end
;

function TTPrivateAreaVisualizationFunctionality.CanCreateAsDetail: boolean;
begin
Result:=RemotedFunctionality.CanCreateAsDetail;
end;

function TTPrivateAreaVisualizationFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTPrivateAreaVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TPrivateAreaVisualizationFunctionality.Create(Self, idComponent);
end
;
function TTPrivateAreaVisualizationFunctionality.getName: string;
begin
Result:=nmTPrivateAreaVisualization;
end;


function TTPrivateAreaVisualizationFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TypesDef\PrivateAreaVisualization\PrivateAreaVisualization.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

function TTPrivateAreaVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TObjectVisualization.Create;
with Result do begin
Color:=clWhite;
Width:=0;
flLoop:=true;
flFill:=true;
ColorFill:=clWhite;
AddPoint(-50,0);
AddPoint(0,70);
AddPoint(50,0);
AddPoint(0,-70);
end;
end
;

{TPrivateAreaVisualizationFunctionality}
Constructor TPrivateAreaVisualizationFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TPrivateAreaVisualizationFunctionalityRemoted.Create(Self);
end;


procedure TPrivateAreaVisualizationFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TPrivateAreaVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TPrivateAreaVisualizationPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TPrivateAreaVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=RemotedFunctionality.GetOwner(idTOwner,idOwner);
end;

function TPrivateAreaVisualizationFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TPrivateAreaVisualizationFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

procedure TPrivateAreaVisualizationFunctionality.DestroyData;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TPrivateAreaVisualizationFunctionality.CloneData(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TPrivateAreaVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
begin
Result:=false;
end
;

{TTHyperTextFunctionality}

Constructor TTHyperTextFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTHyperText;
RemotedFunctionality:=TTHyperTextFunctionalityRemoted.Create(Self);
end
;

function TTHyperTextFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TTHyperTextFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTHyperTextFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=THyperTextFunctionality.Create(Self, idComponent);
end
;
function TTHyperTextFunctionality.getName: string;
begin
Result:=nmTHyperText;
end;


function TTHyperTextFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TYPESDef\HyperText\HyperText.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

{THyperTextFunctionality}
Constructor THyperTextFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=THyperTextFunctionalityRemoted.Create(Self);
end;

procedure THyperTextFunctionality.UpdateDATA;
begin
Inherited;
GetDATA(_DATA);
end;

procedure THyperTextFunctionality.ClearDATA;
begin
FreeAndNil(_DATA);
Inherited;
end;


procedure THyperTextFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function THyperTextFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=THyperTextPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function THyperTextFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function THyperTextFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

procedure THyperTextFunctionality.GetDATA(out Value: TClientBlobStream);
var
  BA: TByteArray;
begin
GetDATA(BA);
ByteArray_CreateStream(BA, TMemoryStream(Value));
end;

procedure THyperTextFunctionality.SetDATA(Value: TMemoryStream);
var
  BA: TByteArray;
begin
ByteArray_PrepareFromStream(BA,Value);
SetDATA(BA);
end;

procedure THyperTextFunctionality.GetDATA(out Value: TByteArray);
begin
RemotedFunctionality.GetDATA(Value);
end;

procedure THyperTextFunctionality.SetDATA(Value: TByteArray);
begin
RemotedFunctionality.SetDATA(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure THyperTextFunctionality.LoadFromFile(const FileName: string);
var
  MS: TMemoryStream;
begin
MS:=TMemoryStream.Create;
with MS do
try
MS.LoadFromFile(FileName);
SetDATA(MS);
finally
Destroy;
end;
end;

procedure THyperTextFunctionality.SaveToFile(const FileName: string);
var
  Stream: TClientBlobStream;
begin
CheckUserOperation(idReadOperation);
GetDATA(Stream);
if Stream <> nil
 then
  try
  Stream.SaveToFile(FileName);
  finally
  Stream.Destroy;
  end;
end;


{TTComponentsFindServiceFunctionality}

Constructor TTComponentsFindServiceFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTComponentsFindService;
RemotedFunctionality:=TTComponentsFindServiceFunctionalityRemoted.Create(Self);
end
;

function TTComponentsFindServiceFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TTComponentsFindServiceFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTComponentsFindServiceFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TComponentsFindServiceFunctionality.Create(Self, idComponent);
end
;
function TTComponentsFindServiceFunctionality.getName: string;
begin
Result:=nmTComponentsFindService;
end;


function TTComponentsFindServiceFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TYPESDef\ComponentsFindService\ComponentsFindService.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

{TComponentsFindServiceFunctionality}
Constructor TComponentsFindServiceFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TComponentsFindServiceFunctionalityRemoted.Create(Self);
end;


procedure TComponentsFindServiceFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TComponentsFindServiceFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TComponentsFindServicePanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TComponentsFindServiceFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TComponentsFindServiceFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;


{TTUsersServiceFunctionality}

Constructor TTUsersServiceFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTUsersService;
RemotedFunctionality:=TTUsersServiceFunctionalityRemoted.Create(Self);
end
;

function TTUsersServiceFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TTUsersServiceFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTUsersServiceFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TUsersServiceFunctionality.Create(Self, idComponent);
end
;
function TTUsersServiceFunctionality.getName: string;
begin
Result:=nmTUsersService;
end;


function TTUsersServiceFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TYPESDef\UsersService\UsersService.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

{TUsersServiceFunctionality}
Constructor TUsersServiceFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TUsersServiceFunctionalityRemoted.Create(Self);
end;


procedure TUsersServiceFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TUsersServiceFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TUsersServicePanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TUsersServiceFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TUsersServiceFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;


{TTTransportServiceFunctionality}

Constructor TTTransportServiceFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTTransportService;
RemotedFunctionality:=TTTransportServiceFunctionalityRemoted.Create(Self);
end
;

function TTTransportServiceFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TTTransportServiceFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTTransportServiceFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTransportServiceFunctionality.Create(Self, idComponent);
end
;
function TTTransportServiceFunctionality.getName: string;
begin
Result:=nmTTransportService;
end;


function TTTransportServiceFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TYPESDef\TransportService\TransportService.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

{TTransportServiceFunctionality}
Constructor TTransportServiceFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TTransportServiceFunctionalityRemoted.Create(Self);
end;


procedure TTransportServiceFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTransportServiceFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TTransportServicePanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TTransportServiceFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TTransportServiceFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;


{TTMarketServiceFunctionality}

Constructor TTMarketServiceFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTMarketService;
RemotedFunctionality:=TTMarketServiceFunctionalityRemoted.Create(Self);
end
;

function TTMarketServiceFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TTMarketServiceFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTMarketServiceFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TMarketServiceFunctionality.Create(Self, idComponent);
end
;
function TTMarketServiceFunctionality.getName: string;
begin
Result:=nmTMarketService;
end;


function TTMarketServiceFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TYPESDef\MarketService\MarketService.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

{TMarketServiceFunctionality}
Constructor TMarketServiceFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TMarketServiceFunctionalityRemoted.Create(Self);
end;


procedure TMarketServiceFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TMarketServiceFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TMarketServicePanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TMarketServiceFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TMarketServiceFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;


{TTTelecomServiceFunctionality}

Constructor TTTelecomServiceFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTTelecomService;
RemotedFunctionality:=TTTelecomServiceFunctionalityRemoted.Create(Self);
end
;

function TTTelecomServiceFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TTTelecomServiceFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTTelecomServiceFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTelecomServiceFunctionality.Create(Self, idComponent);
end
;
function TTTelecomServiceFunctionality.getName: string;
begin
Result:=nmTTelecomService;
end;


function TTTelecomServiceFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TYPESDef\TelecomService\TelecomService.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

{TTelecomServiceFunctionality}
Constructor TTelecomServiceFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TTelecomServiceFunctionalityRemoted.Create(Self);
end;


procedure TTelecomServiceFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTelecomServiceFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TTelecomServicePanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TTelecomServiceFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TTelecomServiceFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;


{TTWNDVisualizationFunctionality}

Constructor TTWNDVisualizationFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTWNDVisualization;
RemotedFunctionality:=TTWNDVisualizationFunctionalityRemoted.Create(Self);
end
;

function TTWNDVisualizationFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTWNDVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TWNDVisualizationFunctionality.Create(Self, idComponent);
end
;
function TTWNDVisualizationFunctionality.getName: string;
begin
Result:=nmTWNDVisualization;
end;


function TTWNDVisualizationFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TypesDef\WNDVisualization\WNDVisualization.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

function TTWNDVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TObjectVisualization.Create;
with Result do begin
Color:=clWhite;
Width:=0;
flLoop:=true;
flFill:=true;
ColorFill:=clRed;
AddPoint(-20,-20);
AddPoint(0,30);
AddPoint(20,-20);
end;
end
;

{TWNDVisualizationFunctionality}
Constructor TWNDVisualizationFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TWNDVisualizationFunctionalityRemoted.Create(Self);
end;


procedure TWNDVisualizationFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TWNDVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TWNDVisualizationPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TWNDVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=RemotedFunctionality.GetOwner(idTOwner,idOwner);
end;

function TWNDVisualizationFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TWNDVisualizationFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

procedure TWNDVisualizationFunctionality.GetDATA(out DATAStream: TMemoryStream; out DATAType: TComponentFileType);
var
  BA: TByteArray;
  DT: integer;
begin
GetDATA(BA,DT);
ByteArray_CreateStream(BA, DATAStream);
DATAType:=TComponentFileType(DT);
end;

procedure TWNDVisualizationFunctionality.GetDATA(out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer);
var
  BA: TByteArray;
  DT: integer;
begin
GetDATA(BA,DT,MaxSize);
ByteArray_CreateStream(BA, DATAStream);
DATAType:=TComponentFileType(DT);
end;

procedure TWNDVisualizationFunctionality.GetDATA(out DATAStream: TByteArray; out DATAType: Integer);
begin
RemotedFunctionality.GetDATA(DATAStream,DATAType);
end;

procedure TWNDVisualizationFunctionality.GetDATA(out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer);
begin
RemotedFunctionality.GetDATA1(DATAStream,DATAType,MaxSize);
end;

procedure TWNDVisualizationFunctionality.SetDATA(DATAStream: TMemoryStream; const DATAType: TComponentFileType);
var
  BA: TByteArray;
begin
ByteArray_PrepareFromStream(BA,TStream(DATAStream));
SetDATA(BA,Integer(DATAType));
end;

procedure TWNDVisualizationFunctionality.SetDATA(DATAStream: TByteArray; const DATAType: integer);
begin
RemotedFunctionality.SetDATA(DATAStream,DATAType);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TWNDVisualizationFunctionality.LoadFromFile(const FileName: string);
var
  I: integer;
  Ext,S: string;
  DATAType: TComponentFileType;
  WNDName: string;
  MS: TMemoryStream;

  function GetDataType(const Ext: string): TComponentFileType;
  var
    I: TComponentFileType;
  begin
  for I:=Low(TComponentFileType) to High(TComponentFileType) do
    if ANSIUpperCase(ComponentsFilesTypesExtensions[I]) = ANSIUpperCase(Ext)
     then begin
      Result:=TComponentFileType(I);
      Exit; //. ->
      end;
  Raise Exception.Create('invalid file extension for file loading'); //. =>
  end;

  function ExtractWNDName(FileName: string): string;
  var
    I: integer;
  begin
  Result:='';
  FileName:=ExtractFileName(FileName);
  for I:=1 to Length(FileName) do
    if FileName[I] = '.'
     then
      Exit //. ->
     else
      Result:=Result+FileName[I];
  Result:=FileName;
  end;

begin
Ext:=ExtractFileExt(FileName); S:=''; for I:=2 to Length(Ext) do S:=S+Ext[I]; Ext:=S;
DATAType:=GetDataType(Ext);
WNDName:=ExtractWNDName(FileName);
MS:=TMemoryStream.Create;
with MS do
try
LoadFromFile(FileName);
SetDATA(MS,DATAType);
finally
Destroy;
end;
end;

procedure TWNDVisualizationFunctionality.DestroyData;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TWNDVisualizationFunctionality.CloneData(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TWNDVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;

  function Refl: boolean;
  var
    ptrItem: pointer;
    BMPStream: TMemoryStream;
    BMP: TBitmap;

    function ReflectFigures(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; BMP: TBitmap): boolean;

      procedure ReflectFigure(pFigure: TFigureWinRefl);
      type
        PPoints = ^TPoints;
        TPoints = array[0..0] of Windows.TPoint;
      var
        LogBrush: TLogBrush;
        BH: HBrush;
        LogPen: TLogPen;
        PH: HPen;
      begin
      with LogBrush do begin
      lbStyle:=BS_PATTERN;
      lbHatch:=BMP.Handle;
      lbColor:=ColorToRGB(pFigure.ColorFill);
      end;
      BH:=CreateBrushIndirect(LogBrush);
      with LogPen do begin
      lopnStyle:=PS_SOLID;
      lopnWidth.X:=1;
      lopnColor:=ColorToRGB(pFigure.Color);
      end;
      PH:=CreatePenIndirect(LogPen);
      try
      SelectObject(pCanvas.Handle,BH);
      SelectObject(pCanvas.Handle,PH);
      try
      Windows.Polygon(pCanvas.Handle,PPoints(@pFigure.ScreenNodes)^,pFigure.CountScreenNodes);
      finally
      SelectObject(pCanvas.Handle,pCanvas.Brush.Handle);
      SelectObject(pCanvas.Handle,pCanvas.Pen.Handle);
      end;
      Result:=true;
      finally
      DeleteObject(PH);
      DeleteObject(BH);
      end;
      end;

    begin
    Result:=false;
    //.
    if pFigure.CountScreenNodes > 0
     then with pFigure do
      if flagLoop AND flagFill then ReflectFigure(pFigure);
    //.
    if pAdditionalFigure.CountScreenNodes > 0 then ReflectFigure(pAdditionalFigure);
    //.
    Result:=true;
    end;

  begin
  Result:=false;
  try
  TypeSystem.Lock.Enter;
  try
  if NOT TSystemTWNDVisualization(TypeSystem).Cash.GetItem(Self.idObj, ptrItem)
   then begin
    Result:=ReflectAsNotLoaded(pFigure,pAdditionalFigure, pReflectionWindow, pCanvas);
    Exit; //. ->
    end;
  with TItemTWNDVisualizationCash(ptrItem^) do begin
  //.
  if DATAPtr <> nil
   then begin
    //. reflecting
    BMPStream:=TMemoryStream.Create;
    try
    BMPStream.Write(DATAPtr^,DATASize);
    BMPStream.Position:=0;
    BMP:=TBitmap.Create;
    try
    BMP.LoadFromStream(BMPStream);
    //.
    Result:=ReflectFigures(pFigure,pAdditionalFigure,BMP);
    //.
    finally
    BMP.Destroy;
    end;
    finally
    BMPStream.Destroy;
    end;
    //.
    end
   else
    Result:=ReflectAsNotLoaded(pFigure,pAdditionalFigure, pReflectionWindow, pCanvas);
  //.
  end;
  finally
  TypeSystem.Lock.Leave;
  end;
  except
    end;
  end;

begin
Result:=Refl;
end
;
function TWNDVisualizationFunctionality.getDATAFileID: integer;
begin
Result:=RemotedFunctionality.getDATAFileID;
end;

procedure TWNDVisualizationFunctionality.setDATAFileID(Value: integer);
begin
RemotedFunctionality.setDATAFileID(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TWNDVisualizationFunctionality.DATAFile_Clear;
begin
RemotedFunctionality.DATAFile_Clear;
//. update local TypesSystem and representations
Space.StayUpToDate;
end;


{TTMRKVisualizationFunctionality}

Constructor TTMRKVisualizationFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTMRKVisualization;
RemotedFunctionality:=TTMRKVisualizationFunctionalityRemoted.Create(Self);
end
;

function TTMRKVisualizationFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTMRKVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TMRKVisualizationFunctionality.Create(Self, idComponent);
end
;
function TTMRKVisualizationFunctionality.getName: string;
begin
Result:=nmTMRKVisualization;
end;


function TTMRKVisualizationFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TypesDef\MRKVisualization\MRKVisualization.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

function TTMRKVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TObjectVisualization.Create;
with Result do begin
Color:=clWhite;
Width:=0;
flLoop:=true;
flFill:=true;
ColorFill:=clRed;
AddPoint(-20,-20);
AddPoint(0,30);
AddPoint(20,-20);
end;
end
;

{TMRKVisualizationFunctionality}
Constructor TMRKVisualizationFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TMRKVisualizationFunctionalityRemoted.Create(Self);
end;


procedure TMRKVisualizationFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TMRKVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TMRKVisualizationPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TMRKVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=RemotedFunctionality.GetOwner(idTOwner,idOwner);
end;

function TMRKVisualizationFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TMRKVisualizationFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

procedure TMRKVisualizationFunctionality.DoOnComponentUpdate;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TMRKVisualizationFunctionality.GetDATA(out DATAStream: TMemoryStream; out DATAType: TComponentFileType);
var
  BA: TByteArray;
  DT: integer;
begin
GetDATA(BA,DT);
ByteArray_CreateStream(BA, DATAStream);
DATAType:=TComponentFileType(DT);
end;

procedure TMRKVisualizationFunctionality.GetDATA(out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer);
var
  BA: TByteArray;
  DT: integer;
begin
GetDATA(BA,DT,MaxSize);
ByteArray_CreateStream(BA, DATAStream);
DATAType:=TComponentFileType(DT);
end;

procedure TMRKVisualizationFunctionality.GetDATA(out DATAStream: TByteArray; out DATAType: Integer);
begin
RemotedFunctionality.GetDATA(DATAStream,DATAType);
end;

procedure TMRKVisualizationFunctionality.GetDATA(out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer);
begin
RemotedFunctionality.GetDATA1(DATAStream,DATAType,MaxSize);
end;

procedure TMRKVisualizationFunctionality.SetDATA(DATAStream: TMemoryStream; const DATAType: TComponentFileType);
var
  BA: TByteArray;
begin
ByteArray_PrepareFromStream(BA,TStream(DATAStream));
SetDATA(BA,Integer(DATAType));
end;

procedure TMRKVisualizationFunctionality.SetDATA(DATAStream: TByteArray; const DATAType: integer);
begin
RemotedFunctionality.SetDATA(DATAStream,DATAType);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TMRKVisualizationFunctionality.LoadFromFile(const FileName: string);
var
  I: integer;
  Ext,S: string;
  DATAType: TComponentFileType;
  MRKName: string;
  MS: TMemoryStream;

  function GetDataType(const Ext: string): TComponentFileType;
  var
    I: TComponentFileType;
  begin
  for I:=Low(TComponentFileType) to High(TComponentFileType) do
    if ANSIUpperCase(ComponentsFilesTypesExtensions[I]) = ANSIUpperCase(Ext)
     then begin
      Result:=TComponentFileType(I);
      Exit; //. ->
      end;
  Raise Exception.Create('invalid file extension for file loading'); //. =>
  end;

  function ExtractMRKName(FileName: string): string;
  var
    I: integer;
  begin
  Result:='';
  FileName:=ExtractFileName(FileName);
  for I:=1 to Length(FileName) do
    if FileName[I] = '.'
     then
      Exit //. ->
     else
      Result:=Result+FileName[I];
  Result:=FileName;
  end;

begin
Ext:=ExtractFileExt(FileName); S:=''; for I:=2 to Length(Ext) do S:=S+Ext[I]; Ext:=S;
DATAType:=GetDataType(Ext);
MRKName:=ExtractMRKName(FileName);
MS:=TMemoryStream.Create;
with MS do
try
LoadFromFile(FileName);
SetDATA(MS,DATAType);
finally
Destroy;
end;
end;

function TMRKVisualizationFunctionality.getBindingPointIndex: integer;
begin
Result:=RemotedFunctionality.getBindingPointIndex;
end;

procedure TMRKVisualizationFunctionality.setBindingPointIndex(Value: integer);
begin
RemotedFunctionality.setBindingPointIndex(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TMRKVisualizationFunctionality.getAlign: TMRKVisualizationAlign;
begin
Result:=TMRKVisualizationAlign(getAlign1);
end;

function TMRKVisualizationFunctionality.getAlign1: integer;
begin
Result:=RemotedFunctionality.getAlign1;
end;

procedure TMRKVisualizationFunctionality.setAlign(Value: TMRKVisualizationAlign);
begin
setAlign1(Integer(Value));
end;

procedure TMRKVisualizationFunctionality.setAlign1(Value: integer);
begin
RemotedFunctionality.setAlign1(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TMRKVisualizationFunctionality.DestroyData;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TMRKVisualizationFunctionality.CloneData(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TMRKVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;

  function Refl: boolean;
  var
    ptrItem: pointer;
    Xmn,Ymn, Xmx,Ymx: Double;
    Xorg,Yorg: Double;
    X,Y: Double;
    BMPStream: TMemoryStream;
    BMP: TBitmap;
    BMPWidth,BMPHeight: integer;

    procedure ShowFigure(pFigureWinRefl: TFigureWinRefl);
    type
      PPoints = ^TPoints;
      TPoints = array[0..0] of Windows.TPoint;
    var
      LogBrush: TLogBrush;
      BH: HBrush;
      LogPen: TLogPen;
      PH: HPen;
    begin
    if (pFigureWinRefl.CountScreenNodes > 0)
     then with pFigureWinRefl do begin
      if flagLoop
       then
        if flagFill
         then begin
          with LogBrush do begin
          lbStyle:=BS_SOLID;
          lbHatch:=Ord(bsSolid)-Ord(bsHorizontal);
          lbColor:=ColorToRGB(pFigure.ColorFill);
          end;
          BH:=CreateBrushIndirect(LogBrush);
          with LogPen do begin
          lopnStyle:=PS_SOLID;
          lopnWidth.X:=1;
          lopnColor:=ColorToRGB(pFigure.Color);
          end;
          PH:=CreatePenIndirect(LogPen);
          try
          SelectObject(pCanvas.Handle,BH);
          SelectObject(pCanvas.Handle,PH);
          try
          Windows.Polygon(pCanvas.Handle,PPoints(@pFigure.ScreenNodes)^,pFigure.CountScreenNodes);
          finally
          SelectObject(pCanvas.Handle,pCanvas.Brush.Handle);
          SelectObject(pCanvas.Handle,pCanvas.Pen.Handle);
          end;
          finally
          DeleteObject(PH);
          DeleteObject(BH);
          end;
          end
         else begin
          with LogPen do begin
          lopnStyle:=PS_SOLID;
          lopnWidth.X:=2;
          lopnColor:=ColorToRGB(pFigure.Color);
          end;
          PH:=CreatePenIndirect(LogPen);
          try
          SelectObject(pCanvas.Handle,PH);
          try
          Windows.Polyline(pCanvas.Handle,PPoints(@pFigure.ScreenNodes)^,pFigure.CountScreenNodes);
          finally
          SelectObject(pCanvas.Handle,pCanvas.Pen.Handle);
          end;
          finally
          DeleteObject(PH);
          end;
          end
       else begin
        with LogPen do begin
        lopnStyle:=PS_SOLID;
        lopnWidth.X:=2;
        lopnColor:=ColorToRGB(pFigure.Color);
        end;
        PH:=CreatePenIndirect(LogPen);
        try
        SelectObject(pCanvas.Handle,PH);
        try
        Windows.Polyline(pCanvas.Handle,PPoints(@pFigure.ScreenNodes)^,pFigure.CountScreenNodes);
        finally
        SelectObject(pCanvas.Handle,pCanvas.Pen.Handle);
        end;
        finally
        DeleteObject(PH);
        end;
        end;
      end;
    end;

    procedure Figure_GetMinMax(pFigureWinRefl: TFigureWinRefl;  out Xmn,Ymn, Xmx,Ymx: Double);
    var
      I: integer;
    begin
    with pFigureWinRefl do begin
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
    end;
    end;

    procedure GetFigureAveragePoint(pFigure: TFigureWinRefl; var AvrPoint_X,AvrPoint_Y: Double);
    var
      I: integer;
    begin
    AvrPoint_X:=0;
    AvrPoint_Y:=0;
    for I:=0 to pFigure.Count-1 do begin
      AvrPoint_X:=AvrPoint_X+pFigure.Nodes[I].X;
      AvrPoint_Y:=AvrPoint_Y+pFigure.Nodes[I].Y;
      end;
    AvrPoint_X:=AvrPoint_X/pFigure.Count;
    AvrPoint_Y:=AvrPoint_Y/pFigure.Count;
    end;

  begin
  Result:=false;
  try
  TypeSystem.Lock.Enter;
  try
  with pFigure do begin
  if NOT TSystemTMRKVisualization(TypeSystem).Cash.GetItem(Self.idObj, ptrItem)
   then begin
    Result:=ReflectAsNotLoaded(pFigure,pAdditionalFigure, pReflectionWindow, pCanvas);
    Exit; //. ->
    end;
  with TItemTMRKVisualizationCash(ptrItem^) do begin
  //.
  if ((FReflector <> nil) AND (TReflector(FReflector).Mode = rmEditing)) then ShowFigure(pFigure);
  //.
  if DATAPtr <> nil
   then begin //. reflecting
    BMPStream:=TMemoryStream.Create;
    try
    BMPStream.Write(DATAPtr^,DATASize);
    BMPStream.Position:=0;
    BMP:=TBitmap.Create;
    try
    BMP.LoadFromStream(BMPStream);
    //.
    Figure_GetMinMax(pFigure, Xmn,Ymn,Xmx,Ymx);
    //. get binding coordinates
    if (0 <= BindingPointIndex) AND (BindingPointIndex < pFigure.Count)
     then begin
      X:=pFigure.Nodes[BindingPointIndex].X;
      Y:=pFigure.Nodes[BindingPointIndex].Y;
      end
     else
      GetFigureAveragePoint(pFigure, X,Y);
    //.
    if NOT (((Xmx-Xmn) < BMP.Width) OR ((Ymx-Ymn) < BMP.Height))
     then begin
      BMPWidth:=BMP.Width;
      BMPHeight:=BMP.Height;
      end
     else begin
      if ((Xmx-Xmn) < BMP.Width)
       then begin
        BMPWidth:=Round(BMP.Width*((Xmx-Xmn)/BMP.Width));
        BMPHeight:=Round(BMP.Height*((Xmx-Xmn)/BMP.Width));
        end;
      if ((Ymx-Ymn) < BMP.Height)
       then begin
        BMPWidth:=Round(BMP.Width*((Ymx-Ymn)/BMP.Height));
        BMPHeight:=Round(BMP.Height*((Ymx-Ymn)/BMP.Height));
        end;
      end;
    //. aligning
    case Align of
    mvaLT: begin
      Xorg:=(X); Yorg:=(Y);
      end;
    mvaTC: begin
      Xorg:=(X-BMPWidth/2); Yorg:=(Y);
      end;
    mvaTR: begin
      Xorg:=(X-BMPWidth); Yorg:=(Y);
      end;
    mvaRC: begin
      Xorg:=(X-BMPWidth); Yorg:=(Y-BMPHeight/2);
      end;
    mvaRB: begin
      Xorg:=(X-BMPWidth); Yorg:=(Y-BMPHeight);
      end;
    mvaBC: begin
      Xorg:=(X-BMPWidth/2); Yorg:=(Y-BMPHeight);
      end;
    mvaBL: begin
      Xorg:=(X); Yorg:=(Y-BMPHeight);
      end;
    mvaLC: begin
      Xorg:=(X); Yorg:=(Y-BMPHeight/2);
      end;
    mvaC: begin
      Xorg:=(X-BMPWidth/2); Yorg:=(Y-BMPHeight/2);
      end
    else begin
      Xorg:=(X); Yorg:=(Y);
      end;
    end;
    //.
    if Xorg < Xmn
     then Xorg:=Xmn
     else if (Xorg+BMPWidth) > Xmx then Xorg:=Xmx-BMPWidth;
    if Yorg < Ymn
     then Yorg:=Ymn
     else if (Yorg+BMPHeight) > Ymx then Yorg:=Ymx-BMPHeight;
    //.
    BMP.Transparent:=true;
    BMP.TransparentColor:=BMP.Canvas.Pixels[0,BMP.Height-1];
    /// - native draw pCanvas.Draw(Round(Xorg),Round(Yorg), BMP);
    DrawUsingGDIPus(pCanvas.Handle, BMP,Round(Xorg),Round(Yorg),BMPWidth,BMPHeight);
    finally
    BMP.Destroy;
    end;
    finally
    BMPStream.Destroy;
    end;
    //.
    end
   else
    Result:=ReflectAsNotLoaded(pFigure,pAdditionalFigure, pReflectionWindow, pCanvas);
  //.
  Result:=true;
  end;
  end;
  finally
  TypeSystem.Lock.Leave;
  end;
  except
    end;
  end;

begin
Result:=Refl;
end
;
function TMRKVisualizationFunctionality.getDATAFileID: integer;
begin
Result:=RemotedFunctionality.getDATAFileID;
end;

procedure TMRKVisualizationFunctionality.setDATAFileID(Value: integer);
begin
RemotedFunctionality.setDATAFileID(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TMRKVisualizationFunctionality.DATAFile_Clear;
begin
RemotedFunctionality.DATAFile_Clear;
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TMRKVisualizationFunctionality.GetParams(out oAlign: integer; out oBindingPointIndex: integer);
begin
RemotedFunctionality.GetParams(oAlign,oBindingPointIndex);
end;


{TTOrientedPictureVisualizationFunctionality}

Constructor TTOrientedPictureVisualizationFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTOrientedPictureVisualization;
RemotedFunctionality:=TTOrientedPictureVisualizationFunctionalityRemoted.Create(Self);
end
;

function TTOrientedPictureVisualizationFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTOrientedPictureVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TOrientedPictureVisualizationFunctionality.Create(Self, idComponent);
end
;
function TTOrientedPictureVisualizationFunctionality.getName: string;
begin
Result:=nmTOrientedPictureVisualization;
end;


function TTOrientedPictureVisualizationFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TypesDef\OrientedPictureVisualization\OrientedPictureVisualization.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

function TTOrientedPictureVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TObjectVisualization.Create;
with Result do begin
Color:=clWhite;
Width:=0;
flLoop:=false;
AddPoint(-50,0);
AddPoint(50,0);
end;
end
;

{TOrientedPictureVisualizationFunctionality}
Constructor TOrientedPictureVisualizationFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TOrientedPictureVisualizationFunctionalityRemoted.Create(Self);
end;


procedure TOrientedPictureVisualizationFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TOrientedPictureVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TOrientedPictureVisualizationPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TOrientedPictureVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=RemotedFunctionality.GetOwner(idTOwner,idOwner);
end;

procedure TOrientedPictureVisualizationFunctionality.DoOnChangeScale(const ChangeCoef: Double);
begin
Raise Exception.Create(SNotSupported); //. =>
end;

function TOrientedPictureVisualizationFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TOrientedPictureVisualizationFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

procedure TOrientedPictureVisualizationFunctionality.GetDATA(out DATAStream: TMemoryStream; out DATAType: TComponentFileType);
var
  BA: TByteArray;
  DT: integer;
begin
GetDATA(BA,DT);
ByteArray_CreateStream(BA, DATAStream);
DATAType:=TComponentFileType(DT);
end;

procedure TOrientedPictureVisualizationFunctionality.GetDATA(out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer);
var
  BA: TByteArray;
  DT: integer;
begin
GetDATA(BA,DT,MaxSize);
ByteArray_CreateStream(BA, DATAStream);
DATAType:=TComponentFileType(DT);
end;

procedure TOrientedPictureVisualizationFunctionality.GetDATA(out DATAStream: TByteArray; out DATAType: Integer);
begin
RemotedFunctionality.GetDATA(DATAStream,DATAType);
end;

procedure TOrientedPictureVisualizationFunctionality.GetDATA(out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer);
begin
RemotedFunctionality.GetDATA1(DATAStream,DATAType,MaxSize);
end;

procedure TOrientedPictureVisualizationFunctionality.SetDATA(DATAStream: TMemoryStream; const DATAType: TComponentFileType);
var
  BA: TByteArray;
begin
ByteArray_PrepareFromStream(BA,TStream(DATAStream));
SetDATA(BA,Integer(DATAType));
end;

procedure TOrientedPictureVisualizationFunctionality.SetDATA(DATAStream: TByteArray; const DATAType: integer);
begin
RemotedFunctionality.SetDATA(DATAStream,DATAType);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TOrientedPictureVisualizationFunctionality.LoadFromFile(const FileName: string);
var
  I: integer;
  Ext,S: string;
  DATAType: TComponentFileType;
  PictureName: string;
  MS: TMemoryStream;

  function GetDataType(const Ext: string): TComponentFileType;
  var
    I: TComponentFileType;
  begin
  for I:=Low(TComponentFileType) to High(TComponentFileType) do
    if ANSIUpperCase(ComponentsFilesTypesExtensions[I]) = ANSIUpperCase(Ext)
     then begin
      Result:=TComponentFileType(I);
      Exit; //. ->
      end;
  Raise Exception.Create('invalid file extension for file loading'); //. =>
  end;

  function ExtractPictureName(FileName: string): string;
  var
    I: integer;
  begin
  Result:='';
  FileName:=ExtractFileName(FileName);
  for I:=1 to Length(FileName) do
    if FileName[I] = '.'
     then
      Exit //. ->
     else
      Result:=Result+FileName[I];
  Result:=FileName;
  end;

begin
Ext:=ExtractFileExt(FileName); S:=''; for I:=2 to Length(Ext) do S:=S+Ext[I]; Ext:=S;
DATAType:=GetDataType(Ext);
PictureName:=ExtractPictureName(FileName);
MS:=TMemoryStream.Create;
with MS do
try
LoadFromFile(FileName);
SetDATA(MS,DATAType);
finally
Destroy;
end;
end;

function TOrientedPictureVisualizationFunctionality.getWidth: Double;
begin
Result:=RemotedFunctionality.getWidth;
end;

procedure TOrientedPictureVisualizationFunctionality.setWidth(Value: Double);
begin
RemotedFunctionality.setWidth(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TOrientedPictureVisualizationFunctionality.getHeight: Double;
begin
Result:=RemotedFunctionality.getHeight;
end;

procedure TOrientedPictureVisualizationFunctionality.setHeight(Value: Double);
begin
RemotedFunctionality.setHeight(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TOrientedPictureVisualizationFunctionality.getOrientation: integer;
begin
Result:=RemotedFunctionality.getOrientation;
end;

procedure TOrientedPictureVisualizationFunctionality.setOrientation(Value: integer);
begin
RemotedFunctionality.setOrientation(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TOrientedPictureVisualizationFunctionality.ChangeScale(const ScaleFactor: Double);
begin
RemotedFunctionality.ChangeScale(ScaleFactor);
end;

procedure TOrientedPictureVisualizationFunctionality.DestroyData;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TOrientedPictureVisualizationFunctionality.CloneData(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TOrientedPictureVisualizationFunctionality.UpdateContainer;
begin
RemotedFunctionality.UpdateContainer;
//. update local TypesSystem and representations
Space.StayUpToDate;
end;


function TOrientedPictureVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;

  function Refl: boolean;
  var
    ptrItem: pointer;

    _Width,_Height: integer;
    X0,Y0,X1,Y1: Double;
    Xmd,Ymd: Double;
    R: Double;

    BMPStream: TMemoryStream;
    BMP: TBitmap;
  begin
  Result:=false;
  try
  TypeSystem.Lock.Enter;
  try
  with pFigure do begin
  if NOT TSystemTOrientedPictureVisualization(TypeSystem).Cash.GetItem(Self.idObj, ptrItem)
   then begin
    Result:=ReflectAsNotLoaded(pFigure,pAdditionalFigure, pReflectionWindow, pCanvas);
    Exit; //. ->
    end;
  with TItemTOrientedPictureVisualizationCash(ptrItem^) do begin
  if (Width = 0) OR (Height = 0) then Exit; //. ->
  _Width:=Round(Width*pReflectionWindow.Scale);
  _Height:=Round(Height*pReflectionWindow.Scale);
  if (_Width < 1) OR (_Height < 1) then Exit; //. ->
  //.
  if DATAPtr <> nil
   then begin
    X0:=Nodes[0].X;Y0:=Nodes[0].Y;
    X1:=Nodes[1].X;Y1:=Nodes[1].Y;
    Xmd:=(X0+X1)/2;
    Ymd:=(Y0+Y1)/2;
    R:=(Width*pReflectionWindow.Scale)/2;
    //. reflecting
    BMPStream:=TMemoryStream.Create;
    try
    BMPStream.Write(DATAPtr^,DATASize);
    BMPStream.Position:=0;
    BMP:=TBitmap.Create;
    try
    BMP.LoadFromStream(BMPStream);
    BMP.Transparent:=true;
    BMP.TransparentColor:=BMP.Canvas.Pixels[0,BMP.Height-1];
    /// ? native draw pCanvas.StretchDraw(Rect(Round(Xmd-Width*pReflectionWindow.Scale/2),Round(Ymd-Height*pReflectionWindow.Scale/2),Round(Xmd+Width*pReflectionWindow.Scale/2),Round(Ymd+Height*pReflectionWindow.Scale/2)), BMP);
    DrawUsingGDIPus(pCanvas.Handle, BMP,Round(Xmd-Width*pReflectionWindow.Scale/2),Round(Ymd-Height*pReflectionWindow.Scale/2),Round(Width*pReflectionWindow.Scale),Round(Height*pReflectionWindow.Scale));
    finally
    BMP.Destroy;
    end;
    finally
    BMPStream.Destroy;
    end;
    //.
    end
   else
    Result:=ReflectAsNotLoaded(pFigure,pAdditionalFigure, pReflectionWindow, pCanvas);
  //.
  Result:=true;
  end;
  end;
  finally
  TypeSystem.Lock.Leave;
  end;
  except
    end;
  end;

begin
Result:=Refl;
end
;
function TOrientedPictureVisualizationFunctionality.getDATAFileID: integer;
begin
Result:=RemotedFunctionality.getDATAFileID;
end;

procedure TOrientedPictureVisualizationFunctionality.setDATAFileID(Value: integer);
begin
RemotedFunctionality.setDATAFileID(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TOrientedPictureVisualizationFunctionality.DATAFile_Clear;
begin
RemotedFunctionality.DATAFile_Clear;
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TOrientedPictureVisualizationFunctionality.IsNewContainerAcceptable(const NewWidth,NewHeight,NewScale: Double): boolean;
begin
Result:=RemotedFunctionality.IsNewContainerAcceptable(NewWidth,NewHeight,NewScale);
end;

procedure TOrientedPictureVisualizationFunctionality.GetParams(out oWidth: Double; out oHeight: Double; out oOrientation: integer);
begin
RemotedFunctionality.GetParams(oWidth,oHeight,oOrientation);
end;


{TTOrientedTTFVisualizationFunctionality}

Constructor TTOrientedTTFVisualizationFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTOrientedTTFVisualization;
RemotedFunctionality:=TTOrientedTTFVisualizationFunctionalityRemoted.Create(Self);
end
;

function TTOrientedTTFVisualizationFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTOrientedTTFVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TOrientedTTFVisualizationFunctionality.Create(Self, idComponent);
end
;
function TTOrientedTTFVisualizationFunctionality.getName: string;
begin
Result:=nmTOrientedTTFVisualization;
end;


function TTOrientedTTFVisualizationFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TypesDef\OrientedTTFVisualization\OrientedTTFVisualization.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

function TTOrientedTTFVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TObjectVisualization.Create;
with Result do begin
Color:=clWhite;
Width:=0;
flLoop:=false;
AddPoint(-50,0);
AddPoint(50,0);
end;
end
;

{TOrientedTTFVisualizationFunctionality}
Constructor TOrientedTTFVisualizationFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TOrientedTTFVisualizationFunctionalityRemoted.Create(Self);
end;


procedure TOrientedTTFVisualizationFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TOrientedTTFVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TOrientedTTFVisualizationPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TOrientedTTFVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=RemotedFunctionality.GetOwner(idTOwner,idOwner);
end;

procedure TOrientedTTFVisualizationFunctionality.DoOnChangeScale(const ChangeCoef: Double);
begin
Raise Exception.Create(SNotSupported); //. =>
end;

function TOrientedTTFVisualizationFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TOrientedTTFVisualizationFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

function TOrientedTTFVisualizationFunctionality.getStr: string;
begin
Result:=RemotedFunctionality.getStr;
end;

procedure TOrientedTTFVisualizationFunctionality.setStr(const Value: string);
begin
RemotedFunctionality.setStr(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TOrientedTTFVisualizationFunctionality.getColor: TColor;
begin
Result:=RemotedFunctionality.getColor;
end;

procedure TOrientedTTFVisualizationFunctionality.setColor(Value: TColor);
begin
RemotedFunctionality.setColor(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TOrientedTTFVisualizationFunctionality.getFont_Name: string;
begin
Result:=RemotedFunctionality.getFont_Name;
end;

procedure TOrientedTTFVisualizationFunctionality.setFont_Name(Value: string);
begin
RemotedFunctionality.setFont_Name(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TOrientedTTFVisualizationFunctionality.getFont_Width: Double;
begin
Result:=RemotedFunctionality.getFont_Width;
end;

procedure TOrientedTTFVisualizationFunctionality.setFont_Width(Value: Double);
begin
RemotedFunctionality.setFont_Width(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TOrientedTTFVisualizationFunctionality.getFont_Height: Double;
begin
Result:=RemotedFunctionality.getFont_Height;
end;

procedure TOrientedTTFVisualizationFunctionality.setFont_Height(Value: Double);
begin
RemotedFunctionality.setFont_Height(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TOrientedTTFVisualizationFunctionality.getCharInterval: Double;
begin
Result:=RemotedFunctionality.getCharInterval;
end;

procedure TOrientedTTFVisualizationFunctionality.setCharInterval(Value: Double);
begin
RemotedFunctionality.setCharInterval(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TOrientedTTFVisualizationFunctionality.getOrientation: integer;
begin
Result:=RemotedFunctionality.getOrientation;
end;

procedure TOrientedTTFVisualizationFunctionality.setOrientation(Value: integer);
begin
RemotedFunctionality.setOrientation(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TOrientedTTFVisualizationFunctionality.DestroyData;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TOrientedTTFVisualizationFunctionality.CloneData(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TOrientedTTFVisualizationFunctionality.UpdateContainer;
begin
RemotedFunctionality.UpdateContainer;
//. update local TypesSystem and representations
Space.StayUpToDate;
end;


function TOrientedTTFVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;

  function Refl: boolean;
  var
    ptrItem: pointer;
    Txt: WideString;
    Font_Width,
    Font_Height: Double;
    Font_Name: WideString;
    CharInterval: Double;
    Orientation: integer;

    X0,Y0,X1,Y1: Double;
    Xmd,Ymd: Double;
    R: Double;
    A: Double;
    L_Width,L_Height: integer;
    L_CharInterval: Double;
    Xc,Yc: integer;
    diffX1X0,diffY1Y0: Double;
    Line_Length: Double;
    Line_SpaceLength: Double;
    b: Double;
    V: Double;
    S0_X3,S0_Y3,S1_X3,S1_Y3: Double;
    Alfa: Double;
    LogFont: TLogFont;
    H: HFont;
    Step: Double;
    I: integer;
    dX,dY: Double;
    X,Y: Double;
    TW,TH: integer;
    OldBkMode: integer;
    W_CC,L_CC: TContainerCoord;

    procedure GetChar_CC(var CC: TContainerCoord);
    var
      X0,Y0,X1,Y1,X2,Y2,X3,Y3: Double;
      SinAlfa,CosAlfa: Double;
    begin
    X0:=X;Y0:=Y;
    SinAlfa:=Sin(Alfa);CosAlfa:=Cos(Alfa);
    X3:=X0+TH*SinAlfa;Y3:=Y0+TH*CosAlfa;
    X1:=X0+TW*CosAlfa;Y1:=Y0-TW*SinAlfa;
    X2:=X1+TH*SinAlfa;Y2:=Y1+TH*CosAlfa;
    with CC do begin
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
    end;
    end;

  begin
  Result:=false;
  try
  with pFigure do begin
  if NOT TSystemTOrientedTTFVisualization(TypeSystem).Cash.GetItem(Self.idObj, Txt,Font_Width,Font_Height,Font_Name,CharInterval,Orientation)
   then begin
    Result:=ReflectAsNotLoaded(pFigure,pAdditionalFigure, pReflectionWindow, pCanvas);
    Exit; //. ->
    end;
  if (Txt = '') OR (Font_Width = 0) OR (Font_Height = 0) then Exit; //. ->
  L_Width:=Round(Font_Width*pReflectionWindow.Scale);
  L_Height:=Round(Font_Height*pReflectionWindow.Scale);
  L_CharInterval:=CharInterval*pReflectionWindow.Scale;
  if (L_Width < 1) OR (L_Height < 1)
   then begin
    Result:=true;
    Exit; //. ->
    end;
  X0:=Nodes[0].X;Y0:=Nodes[0].Y;
  X1:=Nodes[1].X;Y1:=Nodes[1].Y;
  Xmd:=(X0+X1)/2;
  Ymd:=(Y0+Y1)/2;
  R:=(Length(Txt)*(Font_Width*pReflectionWindow.Scale))/2;
  if Orientation = 0
   then begin //. horizontal orientation
    X0:=Xmd-R; Y0:=Ymd;
    X1:=Xmd+R; Y1:=Ymd;
    end
   else begin
    X0:=Xmd; Y0:=Ymd+R;
    X1:=Xmd; Y1:=Ymd-R;
    end;
  //.
  diffX1X0:=X1-X0;
  diffY1Y0:=Y1-Y0;
  Line_Length:=2*R;
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
  b:=L_Height/2;
  if Abs(diffY1Y0) > Abs(diffX1X0)
   then begin
    V:=b/Sqrt(1+Sqr(diffX1X0/diffY1Y0));
    S0_X3:=(V)+X0;
    S0_Y3:=(-V)*(diffX1X0/diffY1Y0)+Y0;
    S1_X3:=(-V)+X0;
    S1_Y3:=(V)*(diffX1X0/diffY1Y0)+Y0;
    end
   else begin
    V:=b/Sqrt(1+Sqr(diffY1Y0/diffX1X0));
    S0_Y3:=(V)+Y0;
    S0_X3:=(-V)*(diffY1Y0/diffX1X0)+X0;
    S1_Y3:=(-V)+Y0;
    S1_X3:=(V)*(diffY1Y0/diffX1X0)+X0;
    end;
  if (3*PI/4 <= Alfa) AND (Alfa < 7*PI/4)
   then begin Xc:=Round(S0_X3);Yc:=Round(S0_Y3) end
   else begin Xc:=Round(S1_X3);Yc:=Round(S1_Y3) end;
  with pReflectionWindow,W_CC do begin
  Lock.Enter;
  try
  Xmin:=Xmn;Ymin:=Ymn;Xmax:=Xmx;Ymax:=Ymx;
  finally
  Lock.Leave;
  end;
  end;
  //.
  with LogFont do begin
  lfHeight := L_Height;
  lfWidth := L_Width;
  lfEscapement := Round(Alfa*180/PI*10);
  lfOrientation := Round(Alfa*180/PI*10);
  lfWeight := FW_NORMAL;
  lfItalic := Byte(fsBold);
  lfUnderline := 0;//Byte(fsUnderline);
  lfStrikeOut := 0;//Byte(fsStrikeOut);
  lfCharSet := Byte(DEFAULT_CHARSET);
  if Font_Name <>''
   then StrPCopy(lfFaceName, Font_Name)
   else StrPCopy(lfFaceName, 'Default');
  lfQuality := DEFAULT_QUALITY;
  { Everything else as default }
  lfOutPrecision := OUT_DEFAULT_PRECIS;
  lfClipPrecision := CLIP_DEFAULT_PRECIS;
  lfPitchAndFamily := DEFAULT_PITCH;
  end;
  H:=CreateFontIndirect(LogFont);
  try
  with pCanvas do begin
  Lock;
  try
  Font.Color:=pFigure.Color;
  SelectObject(pCanvas.Handle,H);
  try
  Step:=L_Width+L_CharInterval;
  dX:=Step*(diffX1X0/Line_Length);
  dY:=Step*(diffY1Y0/Line_Length);
  X:=Xc;Y:=Yc;
  OldBkMode:=SetBkMode(Handle, TRANSPARENT);
  try
  for I:=1 to Length(Txt) do begin
    TW:=TextWidth(Txt[I]);TH:=TextHeight(Txt[I]);
    GetChar_CC(L_CC);
    if NOT ContainerCoord_IsObjectOutside(L_CC, W_CC)
     then TextOut(Round(X),Round(Y),Txt[I]);
    X:=X+dX;
    Y:=Y+dY;
    end;
  finally
  SetBkMode(Handle, OldBkMode);
  end;
  finally
  SelectObject(pCanvas.Handle,Font.Handle);
  end;
  finally
  UnLock;
  end;
  end;
  finally
  DeleteObject(H);
  end;
  end;
  Result:=true;
  except
    end;
  end;


begin
Result:=Refl;
end
;
function TOrientedTTFVisualizationFunctionality.IsNewContainerAcceptable(const NewFontWidth,NewFontHeight,NewCharInterval: Double; const flNewStr: boolean; const NewStr: string): boolean;
begin
Result:=RemotedFunctionality.IsNewContainerAcceptable(NewFontWidth,NewFontHeight,NewCharInterval,flNewStr,NewStr);
end;

procedure TOrientedTTFVisualizationFunctionality.GetParams(out oStr: WideString; out oFont_Width: Double; out oFont_Height: Double; out oFont_Name: WideString; out oCharInterval: Double; out oOrientation: integer);
begin
RemotedFunctionality.GetParams(oStr,oFont_Width,oFont_Height,oFont_Name,oCharInterval,oOrientation);
end;


{TTIconFunctionality}

Constructor TTIconFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTIcon;
RemotedFunctionality:=TTIconFunctionalityRemoted.Create(Self);
end
;

function TTIconFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TTIconFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTIconFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TIconFunctionality.Create(Self, idComponent);
end
;
function TTIconFunctionality.getName: string;
begin
Result:=nmTIcon;
end;


function TTIconFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TypesDef\Icon\Icon.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

{TIconFunctionality}
Constructor TIconFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TIconFunctionalityRemoted.Create(Self);
end;


procedure TIconFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TIconFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TIconPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TImageFunctionality._GetDataDocument(const DataModel: integer; const DataType: integer; const flWithComponents: boolean; var Document: TByteArray): boolean;
begin
Raise Exception.Create(SNotSupported); //. =>
end
;
function TIconFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TIconFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

function TImageFunctionality.GetDATAType(): TImageDATAType;
begin
Result:=TImageDATAType(GetDATAType1);
end;

function TImageFunctionality.GetDATAType1: integer;
begin
Result:=RemotedFunctionality.GetDATAType1;
end;

procedure TIconFunctionality.GetDATA(out DATAStream: TClientBlobStream; out DATAType: TImageDATAType);
var
  BA: TByteArray;
  DT: integer;
begin
GetDATA(BA,DT);
ByteArray_CreateStream(BA, TMemoryStream(DATAStream));
DATAType:=TImageDATAType(DT);
end;

procedure TIconFunctionality.SetDATA(DATAStream: TMemoryStream; const DATAType: TImageDATAType);
var
  BA: TByteArray;
begin
ByteArray_PrepareFromStream(BA,TStream(DATAStream));
SetDATA(BA,Integer(DATAType));
end;

procedure TIconFunctionality.GetDATA(out DATAStream: TByteArray; out DATAType: Integer);
begin
RemotedFunctionality.GetDATA(DATAStream,DATAType);
end;

procedure TIconFunctionality.SetDATA(DATAStream: TByteArray; const DATAType: Integer);
begin
RemotedFunctionality.SetDATA(DATAStream,DATAType);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TIconFunctionality.GetBitmapDATA(out BMPDATAStream: TMemoryStream);
var
  DATA: TClientBlobStream;
  DATAType: TImageDATAType;
  JI: TJPEGImage;
begin
GetDATA(DATA,DATAType);
try
case DATAType of
idtBMP: begin
  BMPDATAStream:=TMemoryStream.Create;
  BMPDATAStream.LoadFromStream(DATA);
  end;
idtJPG: begin
  JI:=TJPEGImage.Create;
  with JI do
  try
  with TBitmap.Create do
  try
  if DATA.Size > 0
   then begin
    JI.LoadFromStream(DATA);
    Canvas.Lock();
    try
    Assign(JI);
    finally
    Canvas.Unlock();
    end;
    end;
  BMPDATAStream:=TMemoryStream.Create;
  SaveToStream(BMPDATAStream);
  BMPDATAStream.Position:=0;
  finally
  Destroy;
  end;
  finally
  Destroy;
  end;
  end;
else
  Raise Exception.Create('unimplemented Image file type '); //. =>
end;
finally
DATA.Destroy;
end;
end;

procedure TIconFunctionality.GetBitmapDATA(out BMPDATAStream: TByteArray);
begin
RemotedFunctionality.GetBitmapDATA(BMPDATAStream);
end;

procedure TIconFunctionality.LoadFromFile(const FileName: string);
var
  I: integer;
  Ext,S: string;
  DATAType: TImageDATAType;
  ImageName: string;
  MS: TMemoryStream;

  function GetDataType(const Ext: string): TImageDATAType;
  var
    I: TImageDATAType;
  begin
  for I:=Low(TImageDATAType) to High(TImageDATAType) do
    if ANSIUpperCase(ImagesDATATypesFilesExtensions[I]) = ANSIUpperCase(Ext)
     then begin
      Result:=TImageDATAType(I);
      Exit; //. ->
      end;
  Raise Exception.Create('invalid file extension for file loading'); //. =>
  end;

  function ExtracTIconName(FileName: string): string;
  var
    I: integer;
  begin
  Result:='';
  FileName:=ExtractFileName(FileName);
  for I:=1 to Length(FileName) do
    if FileName[I] = '.'
     then
      Exit //. ->
     else
      Result:=Result+FileName[I];
  Result:=FileName;
  end;

begin
Ext:=ExtractFileExt(FileName); S:=''; for I:=2 to Length(Ext) do S:=S+Ext[I]; Ext:=S;
DATAType:=GetDataType(Ext);
ImageName:=ExtracTIconName(FileName);
MS:=TMemoryStream.Create;
with MS do
try
LoadFromFile(FileName);
SetDATA(MS,DATAType);
finally
Destroy;
end;
end;


{TTMessageBoardMessageFunctionality}

Constructor TTMessageBoardMessageFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTMessageBoardMessage;
RemotedFunctionality:=TTMessageBoardMessageFunctionalityRemoted.Create(Self);
end
;

function TTMessageBoardMessageFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TTMessageBoardMessageFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTMessageBoardMessageFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TMessageBoardMessageFunctionality.Create(Self, idComponent);
end
;
function TTMessageBoardMessageFunctionality.getName: string;
begin
Result:=nmTMessageBoardMessage;
end;


function TTMessageBoardMessageFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TYPESDef\MessageBoardMessage\MessageBoardMessage.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

{TMessageBoardMessageFunctionality}
Constructor TMessageBoardMessageFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TMessageBoardMessageFunctionalityRemoted.Create(Self);
end;


procedure TMessageBoardMessageFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TMessageBoardMessageFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TMessageBoardMessagePanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TMessageBoardMessageFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TMessageBoardMessageFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

function TMessageBoardMessageFunctionality.getIdMessageBoard: integer;
begin
Result:=RemotedFunctionality.getIdMessageBoard;
end;

procedure TMessageBoardMessageFunctionality.setIdMessageBoard(Value: integer);
begin
RemotedFunctionality.setIdMessageBoard(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TMessageBoardMessageFunctionality.getIdSenderMessageBoard: integer;
begin
Result:=RemotedFunctionality.getIdSenderMessageBoard;
end;

procedure TMessageBoardMessageFunctionality.setIdSenderMessageBoard(Value: integer);
begin
RemotedFunctionality.setIdSenderMessageBoard(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TMessageBoardMessageFunctionality.DateCreated: TDateTime;
begin
Result:=RemotedFunctionality.DateCreated;
end;

function TMessageBoardMessageFunctionality.getSubject: string;
begin
Result:=RemotedFunctionality.getSubject;
end;

procedure TMessageBoardMessageFunctionality.setSubject(Value: string);
begin
RemotedFunctionality.setSubject(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TMessageBoardMessageFunctionality.GetBody(Value: TStringList);
var
  BA: TByteArray;
begin
RemotedFunctionality.GetBody(BA);
ByteArray_PrepareStringList(BA, Value);
end;

procedure TMessageBoardMessageFunctionality.GetBody(out Value: TByteArray);
begin
RemotedFunctionality.GetBody(Value);
end;

procedure TMessageBoardMessageFunctionality.SetBody(Value: TStringList);
var
  BA: TByteArray;
begin
ByteArray_PrepareFromStringList(BA,Value);
RemotedFunctionality.SetBody(BA);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TMessageBoardMessageFunctionality.SetBody(Value: TByteArray);
begin
RemotedFunctionality.SetBody(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TMessageBoardMessageFunctionality.getFlRead: boolean;
begin
Result:=RemotedFunctionality.getFlRead;
end;

procedure TMessageBoardMessageFunctionality.setFlRead(Value: boolean);
begin
RemotedFunctionality.setFlRead(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TMessageBoardMessageFunctionality.IsEmpty: boolean;
begin
Result:=RemotedFunctionality.IsEmpty;
end;

function TMessageBoardMessageFunctionality.IsCreatedByUser(const pidUser: integer): boolean;
begin
Result:=RemotedFunctionality.IsCreatedByUser(pidUser);
end;


{TTMessageBoardFunctionality}

Constructor TTMessageBoardFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTMessageBoard;
RemotedFunctionality:=TTMessageBoardFunctionalityRemoted.Create(Self);
end
;

function TTMessageBoardFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TTMessageBoardFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTMessageBoardFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TMessageBoardFunctionality.Create(Self, idComponent);
end
;
function TTMessageBoardFunctionality.getName: string;
begin
Result:=nmTMessageBoard;
end;


function TTMessageBoardFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TYPESDef\MessageBoard\MessageBoard.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

{TMessageBoardFunctionality}
Constructor TMessageBoardFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TMessageBoardFunctionalityRemoted.Create(Self);
end;


procedure TMessageBoardFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TMessageBoardFunctionality.Notify(const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult;
begin
Result:=Inherited Notify(NotifyType, pidTObj,pidObj);
//. overriding idUser
case NotifyType of
ontBecomeComponent:
  if pidTObj = idTMODELUser
   then begin
    idUser:=pidObj;
    Result:=cnrProcessed;
    end;
end;
//.
end
;

function TMessageBoardFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TMessageBoardPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TMessageBoardFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

procedure TMessageBoardFunctionality.setName(Value: string);
begin
RemotedFunctionality.setName(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TMessageBoardFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

function TMessageBoardFunctionality.IsUnreadMessageExist: boolean;
begin
Result:=RemotedFunctionality.IsUnreadMessageExist;
end;

procedure TMessageBoardFunctionality.GetMessagesList(out List: TList);
var
  BA: TByteArray;
begin
GetMessagesList(BA);
ByteArray_CreateList(BA, List);
end;

procedure TMessageBoardFunctionality.GetMessagesList(out List: TByteArray);
begin
RemotedFunctionality.GetMessagesList(List);
end;

function TMessageBoardFunctionality.getIdUser: integer;
begin
Result:=RemotedFunctionality.getIdUser;
end;

procedure TMessageBoardFunctionality.setIdUser(Value: integer);
begin
RemotedFunctionality.setIdUser(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;


{TTHREFFunctionality}

Constructor TTHREFFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTHREF;
RemotedFunctionality:=TTHREFFunctionalityRemoted.Create(Self);
end
;

function TTHREFFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TTHREFFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTHREFFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=THREFFunctionality.Create(Self, idComponent);
end
;
function TTHREFFunctionality.getName: string;
begin
Result:=nmTHREF;
end;


function TTHREFFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TYPESDef\HREF\HREF.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

{THREFFunctionality}
Constructor THREFFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=THREFFunctionalityRemoted.Create(Self);
end;


procedure THREFFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function THREFFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=THREFPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function THREFFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function THREFFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

function THREFFunctionality.Notify(const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult;
begin
Result:=Inherited Notify(NotifyType, pidTObj,pidObj);
//.
if NotifyType = ontVisualizationDblClick
 then begin
  Activate;
  Result:=cnrProcessed;
  end;
end
;
function THREFFunctionality.getURL: string;
var
  I,J: integer;
  R: string;
begin
Result:=RemotedFunctionality.getURL;
if Length(Result) > 2
 then begin
  R:='';
  for I:=1 to Length(Result) do if Result[I] <> '"' then R:=R+Result[I];
  Result:=R;
  end;
end;

procedure THREFFunctionality.setURL(Value: string);
begin
RemotedFunctionality.setURL(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function THREFFunctionality.getAutoStart: boolean;
begin
Result:=RemotedFunctionality.getAutoStart;
end;

procedure THREFFunctionality.setAutoStart(Value: boolean);
begin
RemotedFunctionality.setAutoStart(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure THREFFunctionality.Activate;

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
  _URL: ANSIString;
begin
_URL:=URL;
if NOT ((Length(_URL) > 0) AND (URL[Length(_URL)] = '\'))
 then with TfmInetFileDownloader.Create(_URL,true) do Show
 else ShellExecute(0,nil,PChar(String(GetEnvVar('SystemDrive')+'\Program Files\Internet Explorer\IExplore.exe')),PChar(_URL),nil, 1);
end;


{TTQDCVisualizationFunctionality}

Constructor TTQDCVisualizationFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTQDCVisualization;
RemotedFunctionality:=TTQDCVisualizationFunctionalityRemoted.Create(Self);
end
;

function TTQDCVisualizationFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTQDCVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TQDCVisualizationFunctionality.Create(Self, idComponent);
end
;
function TTQDCVisualizationFunctionality.getName: string;
begin
Result:=nmTQDCVisualization;
end;


function TTQDCVisualizationFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TypesDef\QDCVisualization\QDCVisualization.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

function TTQDCVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TObjectVisualization.Create;
with Result do begin
Color:=clGray;
Width:=20;
flLoop:=false;
flFill:=false;
ColorFill:=clSilver;
AddPoint(-50,0);
AddPoint(50,0);
end;
end
;

{TQDCVisualizationFunctionality}

Constructor TQDCVisualizationFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited;
RemotedFunctionality:=TQDCVisualizationFunctionalityRemoted.Create(Self);
end
;

procedure TQDCVisualizationFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TQDCVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TQDCVisualizationPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TQDCVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=RemotedFunctionality.GetOwner(idTOwner,idOwner);
end;

function TQDCVisualizationFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TQDCVisualizationFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

procedure TQDCVisualizationFunctionality.DestroyData;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TQDCVisualizationFunctionality.CloneData(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TQDCVisualizationFunctionality.GetDATA(out DATAPtr: pointer): boolean;
var
  ptrItem: pointer;
begin
Result:=false;
//. avoid speed penalties of CheckUserOperation(idReadOperation);
TypeSystem.Lock.Enter;
try
if NOT (TSystemTQDCVisualization(TypeSystem).Cash.GetItem(idObj, ptrItem) AND (TItemTQDCVisualizationCash(ptrItem^).DATAPtr <> nil))then Exit; //. ->  /// - Raise Exception.Create('there is no requested item in cash'); //. =>
DATAPtr:=TItemTQDCVisualizationCash(ptrItem^).DATAPtr;
finally
TypeSystem.Lock.Leave;
end;
Result:=true;
end
;
procedure TQDCVisualizationFunctionality.SetDATA(DATAStream: TMemoryStream);
var
  BA: TByteArray;
begin
ByteArray_PrepareFromStream(BA,DATAStream);
SetDATA(BA);
end;

procedure TQDCVisualizationFunctionality.SetDATA(DATAStream: TByteArray);
begin
RemotedFunctionality.SetDATA(DATAStream);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TQDCVisualizationFunctionality.LoadFromBitmap(Bitmap: TBitmap);
var
  S: TMemoryStream;
  BA: TByteArray;
begin
S:=TMemoryStream.Create;
try
Bitmap.SaveToStream(S);
ByteArray_PrepareFromStream(BA,S);
RemotedFunctionality.LoadFromBitmap(BA);
finally
S.Destroy;
end;
end;

procedure TQDCVisualizationFunctionality.LoadFromBitmap(Bitmap: TByteArray);
begin
RemotedFunctionality.LoadFromBitmap(Bitmap);
end;

function TQDCVisualizationFunctionality.getDATAFileID: integer;
begin
Result:=RemotedFunctionality.getDATAFileID;
end;

procedure TQDCVisualizationFunctionality.setDATAFileID(Value: integer);
begin
RemotedFunctionality.setDATAFileID(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TQDCVisualizationFunctionality.DATAFile_Clear;
begin
RemotedFunctionality.DATAFile_Clear;
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TQDCVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
begin
Result:=false;
end;


{TTOffersServerFunctionality}

Constructor TTOffersServerFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTOffersServer;
RemotedFunctionality:=TTOffersServerFunctionalityRemoted.Create(Self);
end
;

function TTOffersServerFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TTOffersServerFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTOffersServerFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TOffersServerFunctionality.Create(Self, idComponent);
end
;
function TTOffersServerFunctionality.getName: string;
begin
Result:=nmTOffersServer;
end;


function TTOffersServerFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TYPESDef\OffersServer\OffersServer.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

{TOffersServerFunctionality}
Constructor TOffersServerFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TOffersServerFunctionalityRemoted.Create(Self);
end;


procedure TOffersServerFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TOffersServerFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TOffersServerPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TOffersServerFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TOffersServerFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

function TOffersServerFunctionality.getMailROBOT_Inbox: string;
begin
Result:=RemotedFunctionality.getMailROBOT_Inbox;
end;

procedure TOffersServerFunctionality.setMailROBOT_Inbox(Value: string);
begin
RemotedFunctionality.setMailROBOT_Inbox(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TOffersServerFunctionality.getMailROBOT_User: string;
begin
Result:=RemotedFunctionality.getMailROBOT_User;
end;

procedure TOffersServerFunctionality.setMailROBOT_User(Value: string);
begin
RemotedFunctionality.setMailROBOT_User(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TOffersServerFunctionality.getMailROBOT_Password: string;
begin
Result:=RemotedFunctionality.getMailROBOT_Password;
end;

procedure TOffersServerFunctionality.setMailROBOT_Password(Value: string);
begin
RemotedFunctionality.setMailROBOT_Password(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;


{TTSecurityComponentOperationFunctionality}

Constructor TTSecurityComponentOperationFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTSecurityComponentOperation;
RemotedFunctionality:=TTSecurityComponentOperationFunctionalityRemoted.Create(Self);
end
;

function TTSecurityComponentOperationFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TTSecurityComponentOperationFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTSecurityComponentOperationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TSecurityComponentOperationFunctionality.Create(Self, idComponent);
end
;
function TTSecurityComponentOperationFunctionality.getName: string;
begin
Result:=nmTSecurityComponentOperation;
end;


function TTSecurityComponentOperationFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TYPESDef\SecurityComponentOperation\SecurityComponentOperation.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

{TSecurityComponentOperationFunctionality}
Constructor TSecurityComponentOperationFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TSecurityComponentOperationFunctionalityRemoted.Create(Self);
end;


procedure TSecurityComponentOperationFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TSecurityComponentOperationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TSecurityComponentOperationPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TSecurityComponentOperationFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

procedure TSecurityComponentOperationFunctionality.setName(Value: string);
begin
RemotedFunctionality.setName(Value);
end;

function TSecurityComponentOperationFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

function TSecurityComponentOperationFunctionality.getSQLInfo: string;
begin
Result:=RemotedFunctionality.getSQLInfo;
end;

procedure TSecurityComponentOperationFunctionality.setSQLInfo(Value: string);
begin
RemotedFunctionality.setSQLInfo(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;


{TTSecurityKeyFunctionality}

Constructor TTSecurityKeyFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTSecurityKey;
RemotedFunctionality:=TTSecurityKeyFunctionalityRemoted.Create(Self);
end
;

function TTSecurityKeyFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TTSecurityKeyFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTSecurityKeyFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TSecurityKeyFunctionality.Create(Self, idComponent);
end
;
function TTSecurityKeyFunctionality.getName: string;
begin
Result:=nmTSecurityKey;
end;


function TTSecurityKeyFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TYPESDef\SecurityKey\SecurityKey.bmp');
  except
    end;
  end;
Result:=FImage;
end
;
function TTSecurityKeyFunctionality.GetInstanceByCode(const Code: string;  out idInstance: integer): boolean;
begin
Result:=RemotedFunctionality.GetInstanceByCode(Code,idInstance);
end;


{TSecurityKeyFunctionality}
Constructor TSecurityKeyFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TSecurityKeyFunctionalityRemoted.Create(Self);
end;


procedure TSecurityKeyFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TSecurityKeyFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TSecurityKeyPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TSecurityKeyFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

procedure TSecurityKeyFunctionality.setName(Value: string);
begin
RemotedFunctionality.setName(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TSecurityKeyFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

function TSecurityKeyFunctionality.getInfo: string;
begin
Result:=RemotedFunctionality.getInfo;
end;

procedure TSecurityKeyFunctionality.setInfo(Value: string);
begin
RemotedFunctionality.setInfo(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TSecurityKeyFunctionality.GetAssotiatedUsers(out Users: TList);
var
  BA: TByteArray;
begin
RemotedFunctionality.GetAssotiatedUsers(BA);
ByteArray_CreateList(BA, Users);
end;

procedure TSecurityKeyFunctionality.GetAssotiatedUsers(out Users: TByteArray);
begin
RemotedFunctionality.GetAssotiatedUsers(Users);
end;

procedure TSecurityKeyFunctionality.GenerateCode;
begin
RemotedFunctionality.GenerateCode;
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TSecurityKeyFunctionality.Code: string;
begin
Result:=RemotedFunctionality.Code;
end;


{TTSecurityFileFunctionality}

Constructor TTSecurityFileFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTSecurityFile;
RemotedFunctionality:=TTSecurityFileFunctionalityRemoted.Create(Self);
end
;

function TTSecurityFileFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TTSecurityFileFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTSecurityFileFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TSecurityFileFunctionality.Create(Self, idComponent);
end
;
function TTSecurityFileFunctionality.getName: string;
begin
Result:=nmTSecurityFile;
end;


function TTSecurityFileFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TYPESDef\SecurityFile\SecurityFile.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

{TSecurityFileFunctionality}
Constructor TSecurityFileFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TSecurityFileFunctionalityRemoted.Create(Self);
end;


procedure TSecurityFileFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TSecurityFileFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TSecurityFilePanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TSecurityFileFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

procedure TSecurityFileFunctionality.setName(Value: string);
begin
RemotedFunctionality.setName(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TSecurityFileFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

function TSecurityFileFunctionality.getInfo: string;
begin
Result:=RemotedFunctionality.getInfo;
end;

procedure TSecurityFileFunctionality.setInfo(Value: string);
begin
RemotedFunctionality.setInfo(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TSecurityFileFunctionality.GetDATA(out Value: TClientBlobStream): boolean;
var
  BA: TByteArray;
begin
Result:=GetDATA(BA);
if NOT Result then Exit; //. ->
ByteArray_CreateStream(BA, TMemoryStream(Value));
end;

procedure TSecurityFileFunctionality.SetDATA(Value: TMemoryStream);
var
  BA: TByteArray;
begin
ByteArray_PrepareFromStream(BA,Value);
SetDATA(BA);
end;

function TSecurityFileFunctionality.GetDATA(out Value: TByteArray): boolean;
begin
Result:=RemotedFunctionality.GetDATA(Value);
end;

procedure TSecurityFileFunctionality.SetDATA(Value: TByteArray);
begin
RemotedFunctionality.SetDATA(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TSecurityFileFunctionality.AddOperationSecurityKey(const OperationID: integer; const SecurityKeyID: integer): boolean;
begin
Result:=RemotedFunctionality.AddOperationSecurityKey(OperationID,SecurityKeyID);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TSecurityFileFunctionality.RemoveOperationSecurityKey(const OperationID: integer; const SecurityKeyID: integer): boolean;
begin
Result:=RemotedFunctionality.RemoveOperationSecurityKey(OperationID,SecurityKeyID);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;



{TTSecurityComponentFunctionality}

Constructor TTSecurityComponentFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTSecurityComponent;
RemotedFunctionality:=TTSecurityComponentFunctionalityRemoted.Create(Self);
end
;

function TTSecurityComponentFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TTSecurityComponentFunctionality.DestroyInstance(const idObj: integer);
begin
RemotedFunctionality.DestroyInstance(idObj);
end;

procedure TTSecurityComponentFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTSecurityComponentFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TSecurityComponentFunctionality.Create(Self, idComponent);
end
;
function TTSecurityComponentFunctionality.getName: string;
begin
Result:=nmTSecurityComponent;
end;


function TTSecurityComponentFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TYPESDef\SecurityComponent\SecurityComponent.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

{TSecurityComponentFunctionality}
Constructor TSecurityComponentFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TSecurityComponentFunctionalityRemoted.Create(Self);
end;


function TSecurityComponentFunctionality.SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
begin
Result:=RemotedFunctionality.SetComponentsUsingObject(idTUseObj,idUseObj);
end;

procedure TSecurityComponentFunctionality.ToClone(out idClone: integer);
begin
RemotedFunctionality.ToClone(idClone);
end;

procedure TSecurityComponentFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TSecurityComponentFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TSecurityComponentPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TSecurityComponentFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TSecurityComponentFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

function TSecurityComponentFunctionality.getIdSecurityFile: integer;
begin
Result:=RemotedFunctionality.getIdSecurityFile;
end;

procedure TSecurityComponentFunctionality.setIdSecurityFile(Value: integer);
begin
RemotedFunctionality.setIdSecurityFile(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;


{TTMODELUserFunctionality}

Constructor TTMODELUserFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTMODELUser;
RemotedFunctionality:=TTMODELUserFunctionalityRemoted.Create(Self);
end
;

function TTMODELUserFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TTMODELUserFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTMODELUserFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TMODELUserFunctionality.Create(Self, idComponent);
end
;
function TTMODELUserFunctionality.getName: string;
begin
Result:=nmTMODELUser;
end;


function TTMODELUserFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TYPESDef\MODELUser\MODELUser.bmp');
  except
    end;
  end;
Result:=FImage;
end
;
function TTMODELUserFunctionality.IsUserExist(const UserName: string; out idUser: integer): boolean;
begin
Result:=RemotedFunctionality.IsUserExist(UserName,idUser);
end;

procedure TTMODELUserFunctionality.GetOnlineUsersForDomains(const pOnlineMaxDelay: Double; const pDomains: string; out List: TByteArray);
begin
RemotedFunctionality.GetOnlineUsersForDomains(pOnlineMaxDelay,pDomains,List);
end;

procedure TTMODELUserFunctionality.GetOnlineUsersForDomains(const pOnlineMaxDelay: Double; const pDomains: string; out List: TList);
var
  BA: TByteArray;
begin
GetOnlineUsersForDomains(pOnlineMaxDelay,pDomains,{out} BA);
ByteArray_CreateList(BA,{out} List);
end;

procedure TTMODELUserFunctionality.GetOnlineExpertsForDomains(const pOnlineMaxDelay: Double; const pDomains: string; out List: TByteArray);
begin
RemotedFunctionality.GetOnlineExpertsForDomains(pOnlineMaxDelay,pDomains,List);
end;

procedure TTMODELUserFunctionality.GetOnlineExpertsForDomains(const pOnlineMaxDelay: Double; const pDomains: string; out List: TList);
var
  BA: TByteArray;
begin
GetOnlineExpertsForDomains(pOnlineMaxDelay,pDomains,{out} BA);
ByteArray_CreateList(BA,{out} List);
end;


{TMODELUserFunctionality}
Constructor TMODELUserFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TMODELUserFunctionalityRemoted.Create(Self);
end;


procedure TMODELUserFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TMODELUserFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TMODELUserPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TMODELUserFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

function TMODELUserFunctionality.GetActiveStateInfo(out ProxySpaceID: integer; out ProxySpaceIP: widestring; out ProxySpaceState: integer): boolean;
begin
Result:=RemotedFunctionality.GetActiveStateInfo(ProxySpaceID,ProxySpaceIP,ProxySpaceState);
end;

function TMODELUserFunctionality.IsUserOnLine(const MaxDelay: Double): boolean;
begin
Result:=RemotedFunctionality.IsUserOnLine(MaxDelay);
end;

procedure TMODELUserFunctionality.Logout;
begin
RemotedFunctionality.Logout;
end;

procedure TMODELUserFunctionality.GetSecurityKeysList(out SecurityKeys: TList);
var
  BA: TByteArray;
begin
RemotedFunctionality.GetSecurityKeysList(BA);
ByteArray_CreateList(BA, SecurityKeys);
end;

procedure TMODELUserFunctionality.GetSecurityKeysList(out SecurityKeys: TByteArray);
begin
RemotedFunctionality.GetSecurityKeysList(SecurityKeys);
end;

function TMODELUserFunctionality.SecurityKeys_IsKeyExist(const idSecurityKey: integer): boolean;
begin
Result:=RemotedFunctionality.SecurityKeys_IsKeyExist(idSecurityKey);
end;

procedure TMODELUserFunctionality.SecurityKeys_Insert(const idSecurityKey: integer);
begin
RemotedFunctionality.SecurityKeys_Insert(idSecurityKey);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TMODELUserFunctionality.SecurityKeys_Delete(const idSecurityKey: integer);
begin
RemotedFunctionality.SecurityKeys_Delete(idSecurityKey);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TMODELUserFunctionality.HaveUnreadMessages: boolean;
begin
Result:=RemotedFunctionality.HaveUnreadMessages;
end;

procedure TMODELUserFunctionality.GetMessages(const flUnreadOnly: boolean; out MessageList: TList);
var
  BA: TByteArray;
begin
RemotedFunctionality.GetMessages(flUnreadOnly,BA);
ByteArray_CreateList(BA, MessageList);
end;

procedure TMODELUserFunctionality.GetMessages(const flUnreadOnly: boolean; out MessageList: TByteArray);
begin
RemotedFunctionality.GetMessages(flUnreadOnly,MessageList);
end;

function TMODELUserFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

procedure TMODELUserFunctionality.setName(Value: string);
begin
RemotedFunctionality.setName(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TMODELUserFunctionality.getFullName: string;
begin
Result:=RemotedFunctionality.getFullName;
end;

procedure TMODELUserFunctionality.setFullName(Value: string);
begin
RemotedFunctionality.setFullName(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TMODELUserFunctionality.getContactInfo: string;
begin
Result:=RemotedFunctionality.getContactInfo;
end;

procedure TMODELUserFunctionality.setContactInfo(Value: string);
begin
RemotedFunctionality.setContactInfo(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TMODELUserFunctionality.getPassword: string;
begin
Result:=RemotedFunctionality.getPassword;
end;

procedure TMODELUserFunctionality.setPassword(Value: string);
var
  _Name: shortstring;
begin
_Name:=Name;
RemotedFunctionality.setPassword(Value);
//.
if Space.UserName = _Name
 then begin
  Space.UserPassword:=Value;
  Space.GetUserPasswordHash;
  end;
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TMODELUserFunctionality.getIdSecurityFileForClone: integer;
begin
Result:=RemotedFunctionality.getIdSecurityFileForClone;
end;

procedure TMODELUserFunctionality.setIdSecurityFileForClone(Value: integer);
begin
RemotedFunctionality.setIdSecurityFileForClone(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TMODELUserFunctionality.getDATASize: integer;
begin
Result:=RemotedFunctionality.getDATASize;
end;

procedure TMODELUserFunctionality.setDATASize(Value: integer);
begin
RemotedFunctionality.setDATASize(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TMODELUserFunctionality.getMaxDATASize: integer;
begin
Result:=RemotedFunctionality.getMaxDATASize;
end;

procedure TMODELUserFunctionality.setMaxDATASize(Value: integer);
begin
RemotedFunctionality.setMaxDATASize(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TMODELUserFunctionality.getSpaceSquare: Double;
begin
Result:=RemotedFunctionality.getSpaceSquare;
end;

procedure TMODELUserFunctionality.setSpaceSquare(Value: Double);
begin
RemotedFunctionality.setSpaceSquare(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TMODELUserFunctionality.getMaxSpaceSquare: integer;
begin
Result:=RemotedFunctionality.getMaxSpaceSquare;
end;

procedure TMODELUserFunctionality.setMaxSpaceSquare(Value: integer);
begin
RemotedFunctionality.setMaxSpaceSquare(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TMODELUserFunctionality.getMaxSpaceSquarePerObject: integer;
begin
Result:=RemotedFunctionality.getMaxSpaceSquarePerObject;
end;

procedure TMODELUserFunctionality.setMaxSpaceSquarePerObject(Value: integer);
begin
RemotedFunctionality.setMaxSpaceSquarePerObject(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TMODELUserFunctionality.getDomains: string;
begin
Result:=RemotedFunctionality.getDomains();
end;

procedure TMODELUserFunctionality.setDomains(Value: string);
begin
RemotedFunctionality.setDomains(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TMODELUserFunctionality.getTaskEnabled: boolean;
begin
Result:=RemotedFunctionality.getTaskEnabled();
end;

procedure TMODELUserFunctionality.setTaskEnabled(Value: boolean);
begin
RemotedFunctionality.setTaskEnabled(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TMODELUserFunctionality.getDisabled: boolean;
begin
Result:=RemotedFunctionality.getDisabled;
end;

procedure TMODELUserFunctionality.setDisabled(Value: boolean);
begin
RemotedFunctionality.setDisabled(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;


{TTTextureFunctionality}

Constructor TTTextureFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTTexture;
RemotedFunctionality:=TTTextureFunctionalityRemoted.Create(Self);
end
;

function TTTextureFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TTTextureFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTTextureFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTextureFunctionality.Create(Self, idComponent);
end
;
function TTTextureFunctionality.getName: string;
begin
Result:=nmTTexture;
end;


function TTTextureFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TYPESDef\Texture\Texture.bmp');
  except
    end;
  end;
Result:=FImage;
end
;
procedure TTTextureFunctionality.GetInstanceListMatchingBy(const NameContext: string; out List: TList);
var
  BA: TByteArray;
begin
RemotedFunctionality.GetInstanceListMatchingBy(NameContext,BA);
ByteArray_CreateList(BA, List);
end;

procedure TTTextureFunctionality.GetInstanceListMatchingBy(const NameContext: string; out List: TByteArray);
begin
RemotedFunctionality.GetInstanceListMatchingBy(NameContext,List);
end;


{TTextureFunctionality}
Constructor TTextureFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TTextureFunctionalityRemoted.Create(Self);
end;


procedure TTextureFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTextureFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TTexturePanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TTextureFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TTextureFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

procedure TTextureFunctionality.GetDATA(out DATAStream: TClientBlobStream; out DATAType: TTextureDATAType);
var
  BA: TByteArray;
  DT: integer;
begin
GetDATA(BA,DT);
ByteArray_CreateStream(BA, TMemoryStream(DATAStream));
DATAType:=TTextureDATAType(DT);
end;

procedure TTextureFunctionality.SetDATA(DATAStream: TMemoryStream; const DATAType: TTextureDATAType);
var
  BA: TByteArray;
begin
ByteArray_PrepareFromStream(BA,TStream(DATAStream));
SetDATA(BA,Integer(DATAType));
end;

procedure TTextureFunctionality.GetDATA(out DATAStream: TByteArray; out DATAType: Integer);
begin
RemotedFunctionality.GetDATA(DATAStream,DATAType);
end;

procedure TTextureFunctionality.SetDATA(DATAStream: TByteArray; const DATAType: Integer);
begin
RemotedFunctionality.SetDATA(DATAStream,DATAType);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TTextureFunctionality.GetBitmapDATA(out BMPDATAStream: TMemoryStream);
var
  DATA: TClientBlobStream;
  DATAType: TTextureDATAType;
  JI: TJPEGImage;
begin
GetDATA(DATA,DATAType);
try
case DATAType of
tdtBMP: begin
  BMPDATAStream:=TMemoryStream.Create;
  BMPDATAStream.LoadFromStream(DATA);
  end;
tdtJPG: begin
  JI:=TJPEGImage.Create;
  with JI do
  try
  with TBitmap.Create do
  try
  if DATA.Size > 0
   then begin
    JI.LoadFromStream(DATA);
    Canvas.Lock();
    try
    Assign(JI);
    finally
    Canvas.Unlock();
    end;
    end;
  BMPDATAStream:=TMemoryStream.Create;
  SaveToStream(BMPDATAStream);
  BMPDATAStream.Position:=0;
  finally
  Destroy;
  end;
  finally
  Destroy;
  end;
  end;
else
  Raise Exception.Create('unimplemented texture file type '); //. =>
end;
finally
DATA.Destroy;
end;
end;

procedure TTextureFunctionality.GetBitmapDATA(out BMPDATAStream: TByteArray);
begin
RemotedFunctionality.GetBitmapDATA(BMPDATAStream);
end;

procedure TTextureFunctionality.LoadFromFile(const FileName: string);
var
  I: integer;
  Ext,S: string;
  DATAType: TTextureDATAType;
  TextureName: string;
  MS: TMemoryStream;

  function GetDataType(const Ext: string): TTextureDATAType;
  var
    I: TTextureDATAType;
  begin
  for I:=Low(TTextureDATAType) to High(TTextureDATAType) do
    if ANSIUpperCase(TexturesDATATypesFilesExtensions[I]) = ANSIUpperCase(Ext)
     then begin
      Result:=TTextureDATAType(I);
      Exit; //. ->
      end;
  Raise Exception.Create('invalid file extension for file loading');
  end;

  function ExtractTextureName(FileName: string): string;
  var
    I: integer;
  begin
  Result:='';
  FileName:=ExtractFileName(FileName);
  for I:=1 to Length(FileName) do
    if FileName[I] = '.'
     then
      Exit //. ->
     else
      Result:=Result+FileName[I];
  Result:=FileName;
  end;

begin
Ext:=ExtractFileExt(FileName); S:=''; for I:=2 to Length(Ext) do S:=S+Ext[I]; Ext:=S;
DATAType:=GetDataType(Ext);
TextureName:=ExtractTextureName(FileName);
MS:=TMemoryStream.Create;
with MS do
try
LoadFromFile(FileName);
SetDATA(MS,DATAType);
finally
Destroy;
end;
Name:=TextureName;
end;

procedure TTextureFunctionality.setName(Value: string);
begin
RemotedFunctionality.setName(Value);
end;


{TTBuffered3DVisualizationFunctionality}

Constructor TTBuffered3DVisualizationFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTBuffered3DVisualization;
RemotedFunctionality:=TTBuffered3DVisualizationFunctionalityRemoted.Create(Self);
end
;

function TTBuffered3DVisualizationFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTBuffered3DVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TBuffered3DVisualizationFunctionality.Create(Self, idComponent);
end
;
function TTBuffered3DVisualizationFunctionality.getName: string;
begin
Result:=nmTBuffered3DVisualization;
end;


function TTBuffered3DVisualizationFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TypesDef\Buffered3DVisualization\Buffered3DVisualization.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

function TTBuffered3DVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TObjectVisualization.Create;
with Result do begin
Color:=clGray;
Width:=0;
flLoop:=true;
flFill:=true;
ColorFill:=clSilver;
AddPoint(-50,50);
AddPoint(50,50);
AddPoint(50,-50);
AddPoint(-50,-50);
end;
end
;

{TBuffered3DVisualizationFunctionality}

Constructor TBuffered3DVisualizationFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited;
ptrTransforMatrix:=nil;
RemotedFunctionality:=TBuffered3DVisualizationFunctionalityRemoted.Create(Self);
end
;

procedure TBuffered3DVisualizationFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TBuffered3DVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TBuffered3DVisualizationPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TBuffered3DVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=RemotedFunctionality.GetOwner(idTOwner,idOwner);
end;

function TBuffered3DVisualizationFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TBuffered3DVisualizationFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

procedure TBuffered3DVisualizationFunctionality.DestroyData;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TBuffered3DVisualizationFunctionality.CloneData(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TBuffered3DVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
begin
Result:=false;
end
;

procedure TBuffered3DVisualizationFunctionality.ReflectInScene(Scene: TScene);

  procedure ReflectAsSelected;
  var
    I,J: integer;
    X,Y,Z: Double;
  begin
  //. perform body
  glDisable(GL_LIGHTING);
  glColor4f(1,0,0, 1);
  glCallList(Meshes.idDisplayList);
  glEnable(GL_LIGHTING);
  //. perform nodes
  glDisable(GL_LIGHTING);
  glDisable(GL_TEXTURE_2D);
  glEnable(GL_POINT_SMOOTH);
  glColor4f(10.0,0,0, 0.5);
  glPointSize(5);
  glBegin(GL_POINTS);
  with Meshes do
  try
  for I:=0 to Count-1 do with TMeshObject(List[I]^) do
    for J:=0 to Count-1 do begin
      X:=Vertices^[J,0]; Y:=Vertices^[J,1]; Z:=Vertices^[J,2];
      glVertex3f(X,Y,Z);
      end;
  finally
  glEnd;
  glEnable(GL_LIGHTING);
  end;
  end;

begin
if Meshes <> nil
 then with Meshes do begin
  //. call meshes display list
  glPushMatrix;
  glMultMatrixf(ptrTransforMatrix);
  if FPtr <> TReflector(Scene.Reflector).ptrSelectedObj
   then glCallList(idDisplayList)
   else ReflectAsSelected;
  glPopMatrix;
  end;
end
;

procedure TBuffered3DVisualizationFunctionality.GetData(out vMeshes: TMeshes; out vptrTransforMatrix: pointer; out vScale,vTranslate_X,vTranslate_Y,vTranslate_Z: Double; out vRotate_AngleX,vRotate_AngleY,vRotate_AngleZ: Double);
var
  ptrItem: pointer;
begin
//. avoid speed penalties CheckUserOperation(idReadOperation);
TypeSystem.Lock.Enter;
try
if NOT TSystemTBuffered3DVisualization(TypeSystem).Cash.GetItem(idObj, ptrItem) then Raise Exception.Create('there is no requested item in cash'); //. =>
with TItemTBuffered3DVisualizationCash(ptrItem^) do begin
vMeshes:=Meshes;
vptrTransforMatrix:=@TransforMatrix;
vScale:=Scale;
vTranslate_X:=Translate_X;
vTranslate_Y:=Translate_Y;
vTranslate_Z:=Translate_Z;
vRotate_AngleX:=Rotate_AngleX;
vRotate_AngleY:=Rotate_AngleY;
vRotate_AngleZ:=Rotate_AngleZ;
end;
finally
TypeSystem.Lock.Leave;
end;
end
;
procedure TBuffered3DVisualizationFunctionality.UpdateDATA;
begin
Inherited;
GetData(Meshes,ptrTransforMatrix,Scale,Translate_X,Translate_Y,Translate_Z,Rotate_AngleX,Rotate_AngleY,Rotate_AngleZ);
end;

procedure TBuffered3DVisualizationFunctionality.LoadFromStream(DATAStream: TMemoryStream; const DATAType: TComponentFileType);
var
  BA: TByteArray;
begin
ByteArray_PrepareFromStream(BA,TStream(DATAStream));
LoadFromStream(BA,Integer(DATAType));
end;

procedure TBuffered3DVisualizationFunctionality.LoadFromStream(DATAStream: TByteArray; const DATAType: integer);
begin
RemotedFunctionality.LoadFromStream(DATAStream,DATAType);
end;

procedure TBuffered3DVisualizationFunctionality.LoadFromFile(const FileName: string);
var
  I: integer;
  Ext,S: string;
  DATAType: TComponentFileType;
  MS: TMemoryStream;

    function GetDataType(const Ext: string): TComponentFileType;
    var
      I: TComponentFileType;
    begin
    for I:=Low(TComponentFileType) to High(TComponentFileType) do
      if ANSIUpperCase(ComponentsFilesTypesExtensions[I]) = ANSIUpperCase(Ext)
       then begin
        Result:=TComponentFileType(I);
        Exit; //. ->
        end;
    Raise Exception.Create('invalid file extension for file loading');
    end;

begin
Ext:=ExtractFileExt(FileName); S:=''; for I:=2 to Length(Ext) do S:=S+Ext[I]; Ext:=S;
DATAType:=GetDataType(Ext);
MS:=TMemoryStream.Create;
with MS do
try
LoadFromFile(FileName);
Self.LoadFromStream(MS,DATAType);
finally
Destroy;
end;
end;

procedure TBuffered3DVisualizationFunctionality.Get__Translate_XY(out vTranslate_X,vTranslate_Y: Double);
begin
RemotedFunctionality.Get__Translate_XY(vTranslate_X,vTranslate_Y);
end;

procedure TBuffered3DVisualizationFunctionality.SetPropertiesLocal(const pScale, pTranslate_X,pTranslate_Y,pTranslate_Z, pRotate_AngleX,pRotate_AngleY,pRotate_AngleZ: Double);
begin
RemotedFunctionality.SetPropertiesLocal(pScale,pTranslate_X,pTranslate_Y,pTranslate_Z,pRotate_AngleX,pRotate_AngleY,pRotate_AngleZ);
end;


function TBuffered3DVisualizationFunctionality.GetMinMax(const TransforMatrix: TTransforMatrix; out Xmin,Ymin,Zmin, Xmax,Ymax,Zmax: Double): boolean;
var
  PA: array[0..3] of TGLFloat;
  X,Y,Z,W: TGLFloat;
  I,J: dword;
begin
Result:=false;
Xmin:=MaxDouble;Ymin:=MaxDouble;Zmin:=MaxDouble;
Xmax:=-MaxDouble;Ymax:=-MaxDouble;Zmax:=-MaxDouble;
PA[3]:=1;
if Meshes <> nil
 then with Meshes do begin
  for I:=0 to Count-1 do with TMeshObject(List[I]^) do
    for J:=0 to Count-1 do begin
      PA[0]:=Vertices^[J,0];PA[1]:=Vertices^[J,1];PA[2]:=Vertices^[J,2];
      //. do multiplication to TransforMatrix
      X:=PA[0]*TransforMatrix[0,0]+PA[1]*TransforMatrix[1,0]+PA[2]*TransforMatrix[2,0]+PA[3]*TransforMatrix[3,0];
      Y:=PA[0]*TransforMatrix[0,1]+PA[1]*TransforMatrix[1,1]+PA[2]*TransforMatrix[2,1]+PA[3]*TransforMatrix[3,1];
      Z:=PA[0]*TransforMatrix[0,2]+PA[1]*TransforMatrix[1,2]+PA[2]*TransforMatrix[2,2]+PA[3]*TransforMatrix[3,2];
      W:=PA[0]*TransforMatrix[0,3]+PA[1]*TransforMatrix[1,3]+PA[2]*TransforMatrix[2,3]+PA[3]*TransforMatrix[3,3];
      X:=X/W;
      Y:=Y/W;
      Z:=Z/W;
      //.
      if X < Xmin then Xmin:=X;
      if X > Xmax then Xmax:=X;
      if Y < Ymin then Ymin:=Y;
      if Y > Ymax then Ymax:=Y;
      if Z < Zmin then Zmin:=Z;
      if Z > Zmax then Zmax:=Z;
      end;
  Result:=true;
  end;
end
;
procedure TBuffered3DVisualizationFunctionality.UpdateXOYProjection;
begin
RemotedFunctionality.UpdateXOYProjection;
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TBuffered3DVisualizationFunctionality.getDATAFileID: integer;
begin
Result:=RemotedFunctionality.getDATAFileID;
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TBuffered3DVisualizationFunctionality.setDATAFileID(Value: integer);
begin
RemotedFunctionality.setDATAFileID(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TBuffered3DVisualizationFunctionality.DATAFile_Clear;
begin
RemotedFunctionality.DATAFile_Clear;
//. update local TypesSystem and representations
Space.StayUpToDate;
end;


function TBuffered3DVisualizationFunctionality.GetMeshesNodesApproximator(const TransforMatrix: TTransforMatrix): TNodesApproximator;
var
  PA: array[0..3] of TGLFloat;
  X,Y,Z,W: TGLFloat;
  I,J: dword;
begin
if Meshes = nil then Raise Exception.Create('meshes is nil'); //. =>
PA[3]:=1;
Result:=TNodesApproximator.Create;
with Meshes,Result do
try
for I:=0 to Count-1 do with TMeshObject(List[I]^) do
  for J:=0 to Count-1 do begin
    PA[0]:=Vertices^[J,0];PA[1]:=Vertices^[J,1];PA[2]:=Vertices^[J,2];
    //. do multiplication to TransforMatrix
    X:=PA[0]*TransforMatrix[0,0]+PA[1]*TransforMatrix[1,0]+PA[2]*TransforMatrix[2,0]+PA[3]*TransforMatrix[3,0];
    Y:=PA[0]*TransforMatrix[0,1]+PA[1]*TransforMatrix[1,1]+PA[2]*TransforMatrix[2,1]+PA[3]*TransforMatrix[3,1];
    Z:=PA[0]*TransforMatrix[0,2]+PA[1]*TransforMatrix[1,2]+PA[2]*TransforMatrix[2,2]+PA[3]*TransforMatrix[3,2];
    W:=PA[0]*TransforMatrix[0,3]+PA[1]*TransforMatrix[1,3]+PA[2]*TransforMatrix[2,3]+PA[3]*TransforMatrix[3,3];
    X:=X/W;
    Y:=Y/W;
    Z:=Z/W;
    //.
    AddNode(X,Y);
    end;
except
  Destroy;
  Raise; //. =>
  end;
end
;
procedure TBuffered3DVisualizationFunctionality.GetParams(out oScale: Double; out oTranslate_X: Double; out oTranslate_Y: Double; out oTranslate_Z: Double; out oRotate_AngleX: Double; out oRotate_AngleY: Double; out oRotate_AngleZ: Double);
begin
RemotedFunctionality.GetParams(oScale,oTranslate_X,oTranslate_Y,oTranslate_Z,oRotate_AngleX,oRotate_AngleY,oRotate_AngleZ);
end;


{TTDATAFileFunctionality}

Constructor TTDATAFileFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTDATAFile;
RemotedFunctionality:=TTDATAFileFunctionalityRemoted.Create(Self);
end
;

function TTDATAFileFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TTDATAFileFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTDATAFileFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TDATAFileFunctionality.Create(Self, idComponent);
end
;
function TTDATAFileFunctionality.getName: string;
begin
Result:=nmTDATAFile;
end;


function TTDATAFileFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TypesDef\DATAFile\DATAFile.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

{TDATAFileFunctionality}
Constructor TDATAFileFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TDATAFileFunctionalityRemoted.Create(Self);
end;


procedure TDATAFileFunctionality.Check;
begin
RemotedFunctionality.Check;
end;

procedure TDATAFileFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TDATAFileFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TDATAFilePanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TDATAFileFunctionality._GetDataDocument(const DataModel: integer; const DataType: integer; const flWithComponents: boolean; var Document: TByteArray): boolean;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

function TDATAFileFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TDATAFileFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;


function TDATAFileFunctionality.Notify(const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult;
begin
Result:=Inherited Notify(NotifyType, pidTObj,pidObj);
//.
if NotifyType = ontVisualizationDblClick
 then begin
  Activate;
  Result:=cnrProcessed;
  end;
end
;
function TDATAFileFunctionality.IsNull: boolean;
begin
Result:=RemotedFunctionality.IsNull;
end;

procedure TDATAFileFunctionality.Empty;
begin
RemotedFunctionality.Empty;
end;

procedure TDATAFileFunctionality.LoadFromFile(const FileName: string);
var
  MemoryStream: TMemoryStream;
begin
MemoryStream:=TMemoryStream.Create;
try
MemoryStream.LoadFromFile(FileName);
SetDATA(MemoryStream);
DATAType:=ExtractFileExt(FileName);
finally
MemoryStream.Destroy;
end;
end;

procedure TDATAFileFunctionality.SaveToFile(var FileName: string);
var
  MemoryStream: TClientBlobStream;
begin
GetDATA(MemoryStream);
try
FileName:=FileName+DATAType;
MemoryStream.SaveToFile(FileName);
finally
MemoryStream.Destroy;
end;
end;

procedure TDATAFileFunctionality.Activate;
var
  TempFileName: string;
begin
if IsNull then Exit; //. ->
TempFileName:=PathTempData+'\DATAFile'+FormatDateTime('DDMMYYYYHHNNSSZZZ',Now);
Space.Log.OperationStarting('file loading ...');
try
SaveToFile(TempFileName);
TypesSystem.ComponentsTracking.Insert(TempFileName,FileDateToDateTime(FileAge(TempFileName)),idTObj,idObj);
finally
Space.Log.OperationDone;
end;
ShellExecute(0,nil,PChar(TempFileName),nil,nil, 1);
end;

procedure TDATAFileFunctionality.GetDATA(out Value: TClientBlobStream);
var
  BA: TByteArray;
begin
GetDATA(BA);
ByteArray_CreateStream(BA, TMemoryStream(Value));
end;

procedure TDATAFileFunctionality.SetDATA(Value: TMemoryStream);
var
  BA: TByteArray;
begin
ByteArray_PrepareFromStream(BA,Value);
SetDATA(BA);
end;

procedure TDATAFileFunctionality.GetDATA(out Value: TByteArray);
begin
RemotedFunctionality.GetDATA(Value);
end;

procedure TDATAFileFunctionality.SetDATA(Value: TByteArray);
begin
RemotedFunctionality.SetDATA(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TDATAFileFunctionality.getDATAType: string;
begin
Result:=RemotedFunctionality.getDATAType;
end;

procedure TDATAFileFunctionality.setDATAType(Value: string);
begin
RemotedFunctionality.setDATAType(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;


{TTCoComponentFunctionality}

Constructor TTCoComponentFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTCoComponent;
RemotedFunctionality:=TTCoComponentFunctionalityRemoted.Create(Self);
end
;

function TTCoComponentFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TTCoComponentFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTCoComponentFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TCoComponentFunctionality.Create(Self, idComponent);
end
;
function TTCoComponentFunctionality.getName: string;
begin
Result:=nmTCoComponent;
end;


function TTCoComponentFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TypesDef\CoComponent\CoComponent.bmp');
  except
    end;
  end;
Result:=FImage;
end
;
procedure TTCoComponentFunctionality.GetInstanceListByCoType(const idCoType: integer; out InstanceList: TList);
var
  BA: TByteArray;
begin
RemotedFunctionality.GetInstanceListByCoType(idCoType,BA);
ByteArray_CreateList(BA, InstanceList);
end;

procedure TTCoComponentFunctionality.GetInstanceListByCoType(const idCoType: integer; out InstanceList: TByteArray);
begin
RemotedFunctionality.GetInstanceListByCoType(idCoType,InstanceList);
end;


{TCoComponentFunctionality}
Constructor TCoComponentFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TCoComponentFunctionalityRemoted.Create(Self);
end;


procedure TCoComponentFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TCoComponentFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TCoComponentPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TCoComponentFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TCoComponentFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;


function TCoComponentFunctionality.Notify(const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult;
begin
Result:=Inherited Notify(NotifyType, pidTObj,pidObj);
end
;
function TCoComponentFunctionality.idCoType: integer;
begin
Result:=RemotedFunctionality.idCoType;
end;

function TCoComponentFunctionality.GetIconImage(out Image: TBitmap): boolean;
var
  BA: TByteArray;
  S: TMemoryStream;
begin
Result:=RemotedFunctionality.GetIconImage(BA);
if NOT Result then Exit; //. ->
ByteArray_CreateStream(BA, S);
try
Image:=TBitmap.Create;
try
Image.LoadFromStream(S);
except
  Image.Destroy;
  Image:=nil;
  Raise; //. =>
  end;
finally
S.Destroy;
end;
end;

function TCoComponentFunctionality.GetIconImage(out oImage: TByteArray): boolean;
begin
Result:=RemotedFunctionality.GetIconImage(oImage);
end;

function TCoComponentFunctionality.GetVisualizationComponent(out idTVisualization,idVisualization: integer): boolean;
begin
Result:=RemotedFunctionality.GetVisualizationComponent(idTVisualization,idVisualization);
end;


{TTCoComponentTypeMarkerFunctionality}

Constructor TTCoComponentTypeMarkerFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTCoComponentTypeMarker;
RemotedFunctionality:=TTCoComponentTypeMarkerFunctionalityRemoted.Create(Self);
end
;

function TTCoComponentTypeMarkerFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TTCoComponentTypeMarkerFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTCoComponentTypeMarkerFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TCoComponentTypeMarkerFunctionality.Create(Self, idComponent);
end
;
function TTCoComponentTypeMarkerFunctionality.getName: string;
begin
Result:=nmTCoComponentTypeMarker;
end;


function TTCoComponentTypeMarkerFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TypesDef\CoComponentTypeMarker\CoComponentTypeMarker.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

{TCoComponentTypeMarkerFunctionality}
Constructor TCoComponentTypeMarkerFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TCoComponentTypeMarkerFunctionalityRemoted.Create(Self);
end;


function TCoComponentTypeMarkerFunctionality.SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
begin
Result:=RemotedFunctionality.SetComponentsUsingObject(idTUseObj,idUseObj);
end;

procedure TCoComponentTypeMarkerFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TCoComponentTypeMarkerFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TCoComponentTypeMarkerPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TCoComponentTypeMarkerFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TCoComponentTypeMarkerFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

function TCoComponentTypeMarkerFunctionality.GetTypeIconImage(out Image: TBitmap): boolean;
var
  BA: TByteArray;
  S: TMemoryStream;
begin
Result:=GetTypeIconImage(BA);
if NOT Result then Exit; //. ->
ByteArray_CreateStream(BA, S);
try
Image:=TBitmap.Create;
try
Image.LoadFromStream(S);
except
  Image.Destroy;
  Image:=nil;
  Result:=false;
  Raise; //. =>
  end;
finally
S.Destroy;
end;
end;

function TCoComponentTypeMarkerFunctionality.GetTypeIconImage(out oImage: TByteArray): boolean;
begin
Result:=RemotedFunctionality.GetTypeIconImage(oImage);
end;

procedure TCoComponentTypeMarkerFunctionality.setName(Value: string);
begin
RemotedFunctionality.setName(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TCoComponentTypeMarkerFunctionality.getIDCoComponentType: integer;
begin
Result:=RemotedFunctionality.getIDCoComponentType;
end;


{TTCoComponentTypeFunctionality}

Constructor TTCoComponentTypeFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTCoComponentType;
RemotedFunctionality:=TTCoComponentTypeFunctionalityRemoted.Create(Self);
end
;

function TTCoComponentTypeFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TTCoComponentTypeFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTCoComponentTypeFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TCoComponentTypeFunctionality.Create(Self, idComponent);
end
;
function TTCoComponentTypeFunctionality.getName: string;
begin
Result:=nmTCoComponentType;
end;


function TTCoComponentTypeFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TypesDef\CoComponentType\CoComponentType.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

{TCoComponentTypeFunctionality}
Constructor TCoComponentTypeFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TCoComponentTypeFunctionalityRemoted.Create(Self);
end;


procedure TCoComponentTypeFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TCoComponentTypeFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TCoComponentTypePanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TCoComponentTypeFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TCoComponentTypeFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

procedure TCoComponentTypeFunctionality.GetDescription(Value: TStringList);
var
  BA: TByteArray;
begin
RemotedFunctionality.GetDescription(BA);
ByteArray_PrepareStringList(BA, Value);
end;

procedure TCoComponentTypeFunctionality.GetDescription(out Value: TByteArray);
begin
RemotedFunctionality.GetDescription(Value);
end;

procedure TCoComponentTypeFunctionality.SetDescription(Value: TStringList);
var
  BA: TByteArray;
begin
ByteArray_PrepareFromStringList(BA,Value);
RemotedFunctionality.SetDescription(BA);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TCoComponentTypeFunctionality.SetDescription(Value: TByteArray);
begin
RemotedFunctionality.SetDescription(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TCoComponentTypeFunctionality.GetMarkersList(out List: TList);
var
  BA: TByteArray;
begin
RemotedFunctionality.GetMarkersList(BA);
ByteArray_CreateList(BA, List);
end;

procedure TCoComponentTypeFunctionality.GetMarkersList(out List: TByteArray);
begin
RemotedFunctionality.GetMarkersList(List);
end;

function TCoComponentTypeFunctionality.GetIconImage(out Image: TBitmap): boolean;
var
  BA: TByteArray;
  S: TMemoryStream;
begin
Result:=RemotedFunctionality.GetIconImage(BA);
if NOT Result then Exit; //. ->
ByteArray_CreateStream(BA, S);
try
Image:=TBitmap.Create;
try
Image.LoadFromStream(S);
except
  Image.Destroy;
  Image:=nil;
  Raise; //. =>
  end;
finally
S.Destroy;
end;
end;

function TCoComponentTypeFunctionality.GetIconImage(out oImage: TByteArray): boolean;
begin
Result:=RemotedFunctionality.GetIconImage(oImage);
end;

procedure TCoComponentTypeFunctionality.setName(Value: string);
begin
RemotedFunctionality.setName(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TCoComponentTypeFunctionality.getUID: integer;
begin
Result:=RemotedFunctionality.getUID;
end;

function TCoComponentTypeFunctionality.getDateCreated: TDateTime;
begin
Result:=RemotedFunctionality.getDateCreated;
end;


{TTAddressFunctionality}

Constructor TTAddressFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTAddress;
RemotedFunctionality:=TTAddressFunctionalityRemoted.Create(Self);
end
;

function TTAddressFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TTAddressFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTAddressFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TAddressFunctionality.Create(Self, idComponent);
end
;
function TTAddressFunctionality.getName: string;
begin
Result:=nmTAddress;
end;


function TTAddressFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TypesDef\Address\Address.bmp');
  except
    end;
  end;
Result:=FImage;
end
;
procedure TTAddressFunctionality.Points_GetTypeNames(out List: TStringList);
var
  BA: TByteArray;
begin
RemotedFunctionality.Points_GetTypeNames(BA);
ByteArray_CreateStringList(BA, List);
end;

procedure TTAddressFunctionality.Points_GetTypeNames(out List: TByteArray);
begin
RemotedFunctionality.Points_GetTypeNames(List);
end;

procedure TTAddressFunctionality.Streets_GetTypeNames(out List: TStringList);
var
  BA: TByteArray;
begin
RemotedFunctionality.Streets_GetTypeNames(BA);
ByteArray_CreateStringList(BA, List);
end;

procedure TTAddressFunctionality.Streets_GetTypeNames(out List: TByteArray);
begin
RemotedFunctionality.Streets_GetTypeNames(List);
end;


{TAddressFunctionality}
Constructor TAddressFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TAddressFunctionalityRemoted.Create(Self);
end;


procedure TAddressFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TAddressFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TAddressPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TAddressFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TAddressFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

function TAddressFunctionality.getIdPoint: integer;
begin
Result:=RemotedFunctionality.getIdPoint;
end;

procedure TAddressFunctionality.setIdPoint(Value: integer);
begin
RemotedFunctionality.setIdPoint(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TAddressFunctionality.getPoint: string;
begin
Result:=RemotedFunctionality.getPoint;
end;

function TAddressFunctionality.getIdStreet: integer;
begin
Result:=RemotedFunctionality.getIdStreet;
end;

procedure TAddressFunctionality.setIdStreet(Value: integer);
begin
RemotedFunctionality.setIdStreet(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TAddressFunctionality.getStreet: string;
begin
Result:=RemotedFunctionality.getStreet;
end;

function TAddressFunctionality.getHouse: string;
begin
Result:=RemotedFunctionality.getHouse;
end;

procedure TAddressFunctionality.setHouse(Value: string);
begin
RemotedFunctionality.setHouse(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TAddressFunctionality.getCorps: integer;
begin
Result:=RemotedFunctionality.getCorps;
end;

procedure TAddressFunctionality.setCorps(Value: integer);
begin
RemotedFunctionality.setCorps(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TAddressFunctionality.getApartment: string;
begin
Result:=RemotedFunctionality.getApartment;
end;

procedure TAddressFunctionality.setApartment(Value: string);
begin
RemotedFunctionality.setApartment(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TAddressFunctionality.getEntrance: integer;
begin
Result:=RemotedFunctionality.getEntrance;
end;

procedure TAddressFunctionality.setEntrance(Value: integer);
begin
RemotedFunctionality.setEntrance(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;


{TTTransportRouteFunctionality}

Constructor TTTransportRouteFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTTransportRoute;
RemotedFunctionality:=TTTransportRouteFunctionalityRemoted.Create(Self);
end
;
function TTTransportRouteFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TTTransportRouteFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTTransportRouteFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTransportRouteFunctionality.Create(Self, idComponent);
end
;
function TTTransportRouteFunctionality.getName: string;
begin
Result:=nmTTransportRoute;
end;


function TTTransportRouteFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TypesDef\TransportRoute\TransportRoute.bmp');
  except
    end;
  end;
Result:=FImage;
end
;
procedure TTTransportRouteFunctionality.GetInstanceList(out List: TList);
var
  BA: TByteArray;
begin
RemotedFunctionality.GetInstanceList(BA);
ByteArray_CreateList(BA, List);
end;

procedure TTTransportRouteFunctionality.GetInstanceList(out List: TByteArray);
begin
RemotedFunctionality.GetInstanceList(List);
end;


{TTransportRouteFunctionality}
Constructor TTransportRouteFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TTransportRouteFunctionalityRemoted.Create(Self);
end;

procedure TTransportRouteFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTransportRouteFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TTransportRoutePanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TTransportRouteFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

procedure TTransportRouteFunctionality.setName(Value: string);
begin
RemotedFunctionality.setName(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TTransportRouteFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

function TTransportRouteFunctionality.getidTTransport: integer;
begin
Result:=RemotedFunctionality.getidTTransport;
end;

procedure TTransportRouteFunctionality.setidTTransport(Value: integer);
begin
RemotedFunctionality.setidTTransport(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TTransportRouteFunctionality.getValid: boolean;
begin
Result:=RemotedFunctionality.getValid;
end;

procedure TTransportRouteFunctionality.setValid(Value: boolean);
begin
RemotedFunctionality.setValid(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TTransportRouteFunctionality.getRemarks: string;
begin
Result:=RemotedFunctionality.getRemarks;
end;

procedure TTransportRouteFunctionality.setRemarks(Value: string);
begin
RemotedFunctionality.setRemarks(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TTransportRouteFunctionality.IsNodesExist: boolean;
begin
Result:=RemotedFunctionality.IsNodesExist;
end;

procedure TTransportRouteFunctionality.Nodes_GetList(out List: TRouteNodesList);
begin
/// ? RemotedFunctionality.Nodes_GetList(List);
end;

procedure TTransportRouteFunctionality.Nodes_GetList(out List: TByteArray);
begin
RemotedFunctionality.Nodes_GetList(List);
end;

function TTransportRouteFunctionality.Nodes_IsNodeExist(const idNode: integer): boolean;
begin
Result:=RemotedFunctionality.Nodes_IsNodeExist(idNode);
end;

procedure TTransportRouteFunctionality.Nodes_ChangeNodeOrder(const idItem: integer; const Order: integer);
begin
RemotedFunctionality.Nodes_ChangeNodeOrder(idItem,Order);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TTransportRouteFunctionality.Nodes__Node_DistanceBefore(const idItem: integer): integer;
begin
Result:=RemotedFunctionality.Nodes__Node_DistanceBefore(idItem);
end;

procedure TTransportRouteFunctionality.Nodes__Node_SetDistanceBefore(const idItem: integer; const D: integer);
begin
RemotedFunctionality.Nodes__Node_SetDistanceBefore(idItem,D);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TTransportRouteFunctionality.Nodes__Node_OrderPrice(const idItem: integer): string;
begin
Result:=RemotedFunctionality.Nodes__Node_OrderPrice(idItem);
end;

procedure TTransportRouteFunctionality.Nodes__Node_SetOrderPrice(const idItem: integer; const Price: string);
begin
RemotedFunctionality.Nodes__Node_SetOrderPrice(idItem,Price);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TTransportRouteFunctionality.Nodes_Insert(const idNode: integer): integer;
begin
Result:=RemotedFunctionality.Nodes_Insert(idNode);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TTransportRouteFunctionality.Nodes_Remove(const idItem: integer);
begin
RemotedFunctionality.Nodes_Remove(idItem);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;


{TTTransportNodeFunctionality}

Constructor TTTransportNodeFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTTransportNode;
RemotedFunctionality:=TTTransportNodeFunctionalityRemoted.Create(Self);
end
;

function TTTransportNodeFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TTTransportNodeFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTTransportNodeFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTransportNodeFunctionality.Create(Self, idComponent);
end
;
function TTTransportNodeFunctionality.getName: string;
begin
Result:=nmTTransportNode;
end;


function TTTransportNodeFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TypesDef\TransportNode\TransportNode.bmp');
  except
    end;
  end;
Result:=FImage;
end
;
procedure TTTransportNodeFunctionality.GetInstanceList(out List: TList);
var
  BA: TByteArray;
begin
RemotedFunctionality.GetInstanceList(BA);
ByteArray_CreateList(BA, List);
end;

procedure TTTransportNodeFunctionality.GetInstanceList(out List: TByteArray);
begin
RemotedFunctionality.GetInstanceList(List);
end;


{TTransportNodeFunctionality}
Constructor TTransportNodeFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TTransportNodeFunctionalityRemoted.Create(Self);
end;


procedure TTransportNodeFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTransportNodeFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TTransportNodePanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TTransportNodeFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

procedure TTransportNodeFunctionality.setName(Value: string);
begin
RemotedFunctionality.setName(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TTransportNodeFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

function TTransportNodeFunctionality.IsRoutesExist: boolean;
begin
Result:=RemotedFunctionality.IsRoutesExist;
end;


{TTOfferGoodsFunctionality}

Constructor TTOfferGoodsFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTOfferGoods;
RemotedFunctionality:=TTOfferGoodsFunctionalityRemoted.Create(Self);
end
;
function TTOfferGoodsFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TTOfferGoodsFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTOfferGoodsFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TOfferGoodsFunctionality.Create(Self, idComponent);
end
;
function TTOfferGoodsFunctionality.getName: string;
begin
Result:=nmTOfferGoods;
end;


function TTOfferGoodsFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TypesDef\OfferGoods\OfferGoods.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

{TOfferGoodsFunctionality}
Constructor TOfferGoodsFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TOfferGoodsFunctionalityRemoted.Create(Self);
end;

procedure TOfferGoodsFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;

function TOfferGoodsFunctionality.SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
begin
Result:=RemotedFunctionality.SetComponentsUsingObject(idTUseObj,idUseObj);
end;


function TOfferGoodsFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TOfferGoodsPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TOfferGoodsFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TOfferGoodsFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

function TOfferGoodsFunctionality.idOffer: integer;
begin
Result:=RemotedFunctionality.idOffer;
end;

function TOfferGoodsFunctionality.getIdGoods: integer;
begin
Result:=RemotedFunctionality.getIdGoods;
end;

procedure TOfferGoodsFunctionality.setIdGoods(Value: integer);
begin
RemotedFunctionality.setIdGoods(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TOfferGoodsFunctionality.getAmount: Double;
begin
Result:=RemotedFunctionality.getAmount;
end;

procedure TOfferGoodsFunctionality.setAmount(Value: Double);
begin
RemotedFunctionality.setAmount(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TOfferGoodsFunctionality.getIdMeasureUnit: integer;
begin
Result:=RemotedFunctionality.getIdMeasureUnit;
end;

procedure TOfferGoodsFunctionality.setIdMeasureUnit(Value: integer);
begin
RemotedFunctionality.setIdMeasureUnit(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TOfferGoodsFunctionality.getMeasureUnit: string;
begin
Result:=RemotedFunctionality.getMeasureUnit;
end;

function TOfferGoodsFunctionality.getMinPrice: Currency;
begin
Result:=RemotedFunctionality.getMinPrice;
end;

procedure TOfferGoodsFunctionality.setMinPrice(Value: Currency);
begin
RemotedFunctionality.setMinPrice(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TOfferGoodsFunctionality.getMisc: string;
begin
Result:=RemotedFunctionality.getMisc;
end;

procedure TOfferGoodsFunctionality.setMisc(Value: string);
begin
RemotedFunctionality.setMisc(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;


{TTTLFStationTMTFunctionality}

Constructor TTTLFStationTMTFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTTLFStationTMT;
RemotedFunctionality:=TTTLFStationTMTFunctionalityRemoted.Create(Self);
end
;
function TTTLFStationTMTFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TTTLFStationTMTFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTTLFStationTMTFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTLFStationTMTFunctionality.Create(Self, idComponent);
end
;
procedure TTTLFStationTMTFunctionality.GetInstanceList(out List: TList);
var
  BA: TByteArray;
begin
RemotedFunctionality.GetInstanceList(BA);
ByteArray_CreateList(BA, List);
end;

procedure TTTLFStationTMTFunctionality.GetInstanceList(out List: TByteArray);
begin
RemotedFunctionality.GetInstanceList(List);
end;

function TTTLFStationTMTFunctionality.getName: string;
begin
Result:=nmTTLFStationTMT;
end;


function TTTLFStationTMTFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TypesDef\TLFStationTMT\TLFStationTMT.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

{TTLFStationTMTFunctionality}
Constructor TTLFStationTMTFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TTLFStationTMTFunctionalityRemoted.Create(Self);
end;

procedure TTLFStationTMTFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTLFStationTMTFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TTLFStationTMTPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TTLFStationTMTFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TTLFStationTMTFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

function TTLFStationTMTFunctionality.getHostName: string;
begin
Result:=RemotedFunctionality.getHostName;
end;

procedure TTLFStationTMTFunctionality.setHostName(Value: string);
begin
RemotedFunctionality.setHostName(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TTLFStationTMTFunctionality.getTestChanel: string;
begin
Result:=RemotedFunctionality.getTestChanel;
end;

procedure TTLFStationTMTFunctionality.setTestChanel(Value: string);
begin
RemotedFunctionality.setTestChanel(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;


{TTNameFunctionality}

Constructor TTNameFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTName;
RemotedFunctionality:=TTNameFunctionalityRemoted.Create(Self);
end
;
function TTNameFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TTNameFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTNameFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TNameFunctionality.Create(Self, idComponent);
end
;
function TTNameFunctionality.getName: string;
begin
Result:=nmTName;
end;


function TTNameFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TypesDef\Name\Name.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

{TNameFunctionality}
Constructor TNameFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TNameFunctionalityRemoted.Create(Self);
end;

procedure TNameFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TNameFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TNamePanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TNameFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TNameFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

function TNameFunctionality.Value: string;
begin
Result:=RemotedFunctionality.Value;
end;

procedure TNameFunctionality.SetValue(const NewValue: string);
begin
RemotedFunctionality.SetValue(NewValue);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;


{TTVisualizationFunctionality}

Constructor TTVisualizationFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTVisualization;
RemotedFunctionality:=TTVisualizationFunctionalityRemoted.Create(Self);
end
;

function TTVisualizationFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TVisualizationFunctionality.Create(Self, idComponent);
end
;
function TTVisualizationFunctionality.getName: string;
begin
Result:=nmTVisualization;
end;


function TTVisualizationFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TypesDef\Visualization\Visualization.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

function TTVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TObjectVisualization.Create;
with Result do begin
Color:=clWhite;
Width:=0;
flLoop:=true;
flFill:=true;
ColorFill:=clWhite;
AddPoint(-50,0);
AddPoint(0,70);
AddPoint(50,0);
end;
end
;

{TVisualizationFunctionality}
Constructor TVisualizationFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TVisualizationFunctionalityRemoted.Create(Self);
end;

procedure TVisualizationFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TVisualizationPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin                           
Result:=RemotedFunctionality.GetOwner(idTOwner,idOwner);
end;

function TVisualizationFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TVisualizationFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

procedure TVisualizationFunctionality.DestroyData;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TVisualizationFunctionality.CloneData(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;

  (*/// ? function ReflectAsLabel(const idLabel: integer): boolean;
  var
    ptrItem: pointer;
    Txt: string;
    Font_Width,
    Font_Height: Double;
    Font_Name: string;

    X0,Y0,X1,Y1: Double;
    A: Double;
    L_Width,L_Height: integer;
    Xc,Yc: integer;
    diffX1X0,diffY1Y0: Double;
    Line_Length: Double;
    Line_SpaceLength: Double;
    b: Double;
    V: Double;
    S0_X3,S0_Y3,S1_X3,S1_Y3: Double;
    Alfa: Double;
    LogFont: TLogFont;
    H: HFont;
    Step: Double;
    cntSpaces: integer;
    I: integer;
    dX,dY: Double;
    X,Y: Double;
    TW,TH: integer;
    OldBkMode: integer;
    W_CC,L_CC: TContainerCoord;

    procedure GetChar_CC(var CC: TContainerCoord);
    var
      X0,Y0,X1,Y1,X2,Y2,X3,Y3: Double;
      SinAlfa,CosAlfa: Double;
    begin
    X0:=X;Y0:=Y;
    SinAlfa:=Sin(Alfa);CosAlfa:=Cos(Alfa);
    X3:=X0+TH*SinAlfa;Y3:=Y0+TH*CosAlfa;
    X1:=X0+TW*CosAlfa;Y1:=Y0-TW*SinAlfa;
    X2:=X1+TH*SinAlfa;Y2:=Y1+TH*CosAlfa;
    with CC do begin
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
    end;
    end;

  begin
  Result:=false;
  try
  with pFigure do begin
  if NOT Label_Get(Txt, Font_Width,Font_Height,Font_Name, idLabel) then Exit;
  if (Txt = '') OR (Font_Width = 0) OR (Font_Height = 0) then Exit;
  L_Width:=Round(Font_Width*pReflectionWindow.Scale);
  L_Height:=Round(Font_Height*pReflectionWindow.Scale);
  if (L_Width < 1) OR (L_Height < 1) then Exit;

  X0:=Nodes[0].X;Y0:=Nodes[0].Y;
  X1:=Nodes[1].X;Y1:=Nodes[1].Y;
  if (X1 < X0) OR
     ((X1 = X0) AND (Y0 < Y1))
   then begin
    A:=X0;X0:=X1;X1:=A;
    A:=Y0;Y0:=Y1;Y1:=A;
    end;
  diffX1X0:=X1-X0;
  diffY1Y0:=Y1-Y0;
  Line_Length:=Sqrt(sqr(diffX1X0)+sqr(diffY1Y0));
  if diffX1X0 <> 0
   then Alfa:=ArcTan((Y0-Y1)/(X1-X0))
   else Alfa:=PI/2;
  b:=L_Height/2;
  if Abs(diffY1Y0) > Abs(diffX1X0)
   then begin
    V:=b/Sqrt(1+Sqr(diffX1X0/diffY1Y0));
    S0_X3:=(V)+X0;
    S0_Y3:=(-V)*(diffX1X0/diffY1Y0)+Y0;
    S1_X3:=(-V)+X0;
    S1_Y3:=(V)*(diffX1X0/diffY1Y0)+Y0;
    end
   else begin
    V:=b/Sqrt(1+Sqr(diffY1Y0/diffX1X0));
    S0_Y3:=(V)+Y0;
    S0_X3:=(-V)*(diffY1Y0/diffX1X0)+X0;
    S1_Y3:=(-V)+Y0;
    S1_X3:=(V)*(diffY1Y0/diffX1X0)+X0;
    end;
  if (Alfa+PI/4) < 0
   then begin Xc:=Round(S0_X3);Yc:=Round(S0_Y3) end
   else begin Xc:=Round(S1_X3);Yc:=Round(S1_Y3) end;
  with LogFont do begin
  lfHeight := L_Height;
  lfWidth := L_Width;
  lfEscapement := Round(Alfa*180/PI*10);
  lfOrientation := Round(Alfa*180/PI*10);
  lfWeight := FW_NORMAL;
  lfItalic := Byte(fsBold);
  lfUnderline := 0;//Byte(fsUnderline);
  lfStrikeOut := 0;//Byte(fsStrikeOut);
  lfCharSet := Byte(DEFAULT_CHARSET);
  if Font_Name <>''
   then StrPCopy(lfFaceName, Font_Name)
   else StrPCopy(lfFaceName, 'Default');
  lfQuality := DEFAULT_QUALITY;
  { Everything else as default }
  lfOutPrecision := OUT_DEFAULT_PRECIS;
  lfClipPrecision := CLIP_DEFAULT_PRECIS;
  lfPitchAndFamily := DEFAULT_PITCH;
  end;
  H := CreateFontIndirect(LogFont);
  with pCanvas do begin
  Lock;
  try
  Font.Handle:=H;
  Font.Color:=pFigure.Color;
  with pReflectionWindow,W_CC do begin
  Xmin:=Xmn;Ymin:=Ymn;Xmax:=Xmx;Ymax:=Ymx;
  end;
  Line_SpaceLength:=Line_Length-TextWidth(Txt);
  cntSpaces:=(Length(Txt)-1);
  if cntSpaces <> 0
   then Step:=Line_SpaceLength/cntSpaces
   else Step:=0;
  dX:=Step*(diffX1X0/Line_Length);
  dY:=Step*(diffY1Y0/Line_Length);
  X:=Xc;Y:=Yc;
  OldBkMode:=SetBkMode(Handle, TRANSPARENT);
  for I:=1 to Length(Txt) do begin
    TW:=TextWidth(Txt[I]);TH:=TextHeight(Txt[I]);
    GetChar_CC(L_CC);
    if NOT ContainerCoord_IsObjectOutside(L_CC, W_CC)
     then TextOut(Round(X),Round(Y),Txt[I]);
    X:=X+TW*(diffX1X0/Line_Length)+dX;
    Y:=Y+TW*(diffY1Y0/Line_Length)+dY;
    end;
  SetBkMode(Handle, OldBkMode);
  Font.Handle:=0;
  finally
  UnLock;
  end;
  end;
  end;
  Result:=true;
  except
    end;
  end;*)


var
  idTOwner,idOwner: integer;
begin
Result:=false;
{if pFigure.ColorFill = clNone
 then begin
  if NOT GetOwner(idTOwner,idOwner) then Exit; //. ->
  case idTOwner of
  idTLabel: ;/// ? Result:=ReflectAsLabel(idOwner);
  end;
  end;}
end
;

{TTHREFVisualizationFunctionality}

Constructor TTHREFVisualizationFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTHREFVisualization;
RemotedFunctionality:=TTHREFVisualizationFunctionalityRemoted.Create(Self);
end
;

function TTHREFVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=THREFVisualizationFunctionality.Create(Self, idComponent);
end
;
function TTHREFVisualizationFunctionality.getName: string;
begin
Result:=nmTHREFVisualization;
end;


function TTHREFVisualizationFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TypesDef\HREFVisualization\HREFVisualization.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

{THREFVisualizationFunctionality}
Constructor THREFVisualizationFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=THREFVisualizationFunctionalityRemoted.Create(Self);
end;


function THREFVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
var
  LogPen: TLogPen;
  PH: HPen;
begin
Result:=false;
if ((FReflector <> nil) AND (TReflector(FReflector).Mode = rmEditing))
 then with pCanvas do begin
  with LogPen do begin
  lopnStyle:=PS_SOLID;
  lopnWidth.X:=2;
  lopnColor:=ColorToRGB(pFigure.Color);
  end;
  PH:=CreatePenIndirect(LogPen);
  try
  SelectObject(pCanvas.Handle,PH);
  try
  if (pFigure.CountScreenNodes > 0)
   then with pFigure do
    if flagLoop AND flagFill then Windows.PolyLine(Handle, ScreenNodes, CountScreenNodes);
  if (pAdditionalFigure.CountScreenNodes > 0)
   then with pAdditionalFigure do
    Windows.PolyLine(Handle, ScreenNodes, CountScreenNodes);
  finally
  SelectObject(pCanvas.Handle,pCanvas.Pen.Handle);
  end;
  finally
  DeleteObject(PH);
  end;
  end;
Result:=true;
end
;
function THREFVisualizationFunctionality.DoOnOver: boolean;
begin
Result:=Inherited DoOnOver;
//.
Reflector.Cursor:=crHandPoint;
Result:=true;
end;

function THREFVisualizationFunctionality.DoOnClick: boolean;
var
  Components: TComponentsList;
  I: integer;
begin
Result:=false;
/// ? Result:=Inherited DoOnClick;
//.
GetComponentsList(Components);
try
for I:=0 to Components.Count-1 do with TItemComponentsList(Components[I]^) do
  case idTComponent of
  idTCoReference: with TCoReferenceFunctionality(TComponentFunctionality_Create(idTComponent,idComponent)) do
    try
    ShowReferencedObjectPanelProps;
    Result:=true;
    finally
    Release;
    end;
  idTPositioner: with TPositionerFunctionality(TComponentFunctionality_Create(idTComponent,idComponent)) do
    try
    SetPosition;
    Result:=true;
    finally
    Release;
    end;
  end;
finally
Components.Destroy;
end;
Result:=true;
end;

function THREFVisualizationFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function THREFVisualizationFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;


{TTTTFVisualizationFunctionality}

Constructor TTTTFVisualizationFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTTTFVisualization;
RemotedFunctionality:=TTTTFVisualizationFunctionalityRemoted.Create(Self);
end
;
function TTTTFVisualizationFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTTTFVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTTFVisualizationFunctionality.Create(Self, idComponent);
end
;
function TTTTFVisualizationFunctionality.getName: string;
begin
Result:=nmTTTFVisualization;
end;


function TTTTFVisualizationFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TypesDef\TTFVisualization\TTFVisualization.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

function TTTTFVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TObjectVisualization.Create;
with Result do begin
Color:=clWhite;
Width:=0;
flLoop:=false;
AddPoint(-50,0);
AddPoint(50,0);
end;
end
;

{TTTFVisualizationFunctionality}
Constructor TTTFVisualizationFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TTTFVisualizationFunctionalityRemoted.Create(Self);
end;

procedure TTTFVisualizationFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTTFVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TTTFVisualizationPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TTTFVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=RemotedFunctionality.GetOwner(idTOwner,idOwner);
end;

procedure TTTFVisualizationFunctionality.DoOnChangeScale(const ChangeCoef: Double);
begin
Raise Exception.Create(SNotSupported); //. =>
end;

function TTTFVisualizationFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TTTFVisualizationFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

procedure TTTFVisualizationFunctionality.DestroyData;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TTTFVisualizationFunctionality.CloneData(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTTFVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;

  function Refl: boolean;
  var
    ptrItem: pointer;
    Txt: WideString;
    Font_Width,
    Font_Height: Double;
    Font_Name: WideString;

    X0,Y0,X1,Y1: Double;
    A: Double;
    L_Width,L_Height: integer;
    Xc,Yc: integer;
    diffX1X0,diffY1Y0: Double;
    Line_Length: Double;
    Line_SpaceLength: Double;
    b: Double;
    V: Double;
    S0_X3,S0_Y3,S1_X3,S1_Y3: Double;
    Alfa: Double;
    LogFont: TLogFont;
    H: HFont;
    Step: Double;
    cntSpaces: integer;
    I: integer;
    dX,dY: Double;
    X,Y: Double;
    TW,TH: integer;
    OldBkMode: integer;
    W_CC,L_CC: TContainerCoord;

    procedure GetChar_CC(var CC: TContainerCoord);
    var
      X0,Y0,X1,Y1,X2,Y2,X3,Y3: Double;
      SinAlfa,CosAlfa: Double;
    begin
    X0:=X;Y0:=Y;
    SinAlfa:=Sin(Alfa);CosAlfa:=Cos(Alfa);
    X3:=X0+TH*SinAlfa;Y3:=Y0+TH*CosAlfa;
    X1:=X0+TW*CosAlfa;Y1:=Y0-TW*SinAlfa;
    X2:=X1+TH*SinAlfa;Y2:=Y1+TH*CosAlfa;
    with CC do begin
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
    end;
    end;

  begin
  Result:=false;
  try
  with pFigure do begin
  if NOT TSystemTTTFVisualization(TypeSystem).Cash.GetItem(Self.idObj, Txt,Font_Width,Font_Height,Font_Name)
   then begin
    Result:=ReflectAsNotLoaded(pFigure,pAdditionalFigure, pReflectionWindow, pCanvas);
    Exit; //. ->
    end;
  if (Txt = '') OR (Font_Width = 0) OR (Font_Height = 0) then Exit;
  L_Width:=Round(Font_Width*pReflectionWindow.Scale);
  L_Height:=Round(Font_Height*pReflectionWindow.Scale);
  if (L_Width < 1) OR (L_Height < 1) then Exit;
  //.
  X0:=Nodes[0].X;Y0:=Nodes[0].Y;
  X1:=Nodes[1].X;Y1:=Nodes[1].Y;
  diffX1X0:=X1-X0;
  diffY1Y0:=Y1-Y0;
  Line_Length:=Sqrt(sqr(diffX1X0)+sqr(diffY1Y0));
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
  b:=L_Height/2;
  if Abs(diffY1Y0) > Abs(diffX1X0)
   then begin
    V:=b/Sqrt(1+Sqr(diffX1X0/diffY1Y0));
    S0_X3:=(V)+X0;
    S0_Y3:=(-V)*(diffX1X0/diffY1Y0)+Y0;
    S1_X3:=(-V)+X0;
    S1_Y3:=(V)*(diffX1X0/diffY1Y0)+Y0;
    end
   else begin
    V:=b/Sqrt(1+Sqr(diffY1Y0/diffX1X0));
    S0_Y3:=(V)+Y0;
    S0_X3:=(-V)*(diffY1Y0/diffX1X0)+X0;
    S1_Y3:=(-V)+Y0;
    S1_X3:=(V)*(diffY1Y0/diffX1X0)+X0;
    end;
  if (3*PI/4 <= Alfa) AND (Alfa < 7*PI/4)
   then begin Xc:=Round(S0_X3);Yc:=Round(S0_Y3) end
   else begin Xc:=Round(S1_X3);Yc:=Round(S1_Y3) end;
  with pReflectionWindow,W_CC do begin
  Lock.Enter;
  try
  Xmin:=Xmn;Ymin:=Ymn;Xmax:=Xmx;Ymax:=Ymx;
  finally
  Lock.Leave;
  end;
  end;
  //.
  with LogFont do begin
  lfHeight := L_Height;
  lfWidth := L_Width;
  lfEscapement := Round(Alfa*180/PI*10);
  lfOrientation := Round(Alfa*180/PI*10);
  lfWeight := FW_NORMAL;
  lfItalic := Byte(fsBold);
  lfUnderline := 0;//Byte(fsUnderline);
  lfStrikeOut := 0;//Byte(fsStrikeOut);
  lfCharSet := Byte(DEFAULT_CHARSET);
  if Font_Name <>''
   then StrPCopy(lfFaceName, Font_Name)
   else StrPCopy(lfFaceName, 'Default');
  lfQuality := DEFAULT_QUALITY;
  { Everything else as default }
  lfOutPrecision := OUT_DEFAULT_PRECIS;
  lfClipPrecision := CLIP_DEFAULT_PRECIS;
  lfPitchAndFamily := DEFAULT_PITCH;
  end;
  H:=CreateFontIndirect(LogFont);
  try
  with pCanvas do begin
  Lock;
  try
  Font.Color:=pFigure.Color;
  SelectObject(pCanvas.Handle,H);
  try
  Line_SpaceLength:=Line_Length-TextWidth(Txt);
  cntSpaces:=(Length(Txt)-1);
  if cntSpaces <> 0
   then Step:=Line_SpaceLength/cntSpaces
   else Step:=0;
  dX:=Step*(diffX1X0/Line_Length);
  dY:=Step*(diffY1Y0/Line_Length);
  X:=Xc;Y:=Yc;
  OldBkMode:=SetBkMode(Handle, TRANSPARENT);
  try
  for I:=1 to Length(Txt) do begin
    TW:=TextWidth(Txt[I]);TH:=TextHeight(Txt[I]);
    GetChar_CC(L_CC);
    if NOT ContainerCoord_IsObjectOutside(L_CC, W_CC)
     then TextOut(Round(X),Round(Y),Txt[I]);
    X:=X+TW*(diffX1X0/Line_Length)+dX;
    Y:=Y+TW*(diffY1Y0/Line_Length)+dY;
    end;
  finally
  SetBkMode(Handle, OldBkMode);
  end;
  finally
  SelectObject(pCanvas.Handle,Font.Handle);
  end;
  finally
  UnLock;
  end;
  end;
  finally
  DeleteObject(H);
  end;
  end;
  Result:=true;
  except
    end;
  end;


begin
Result:=Refl;
end
;
function TTTFVisualizationFunctionality.getStr: string;
begin
Result:=RemotedFunctionality.getStr;
end;

procedure TTTFVisualizationFunctionality.setStr(const Value: string);
begin
RemotedFunctionality.setStr(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TTTFVisualizationFunctionality.GetParams(out oStr: WideString; out oFont_Width: Double; out oFont_Height: Double; out oFont_Name: WideString);
begin
RemotedFunctionality.GetParams(oStr,oFont_Width,oFont_Height,oFont_Name);
end;


{TTObjectFunctionality}

Constructor TTObjectFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTObject;
RemotedFunctionality:=TTObjectFunctionalityRemoted.Create(Self);
end
;
function TTObjectFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TTObjectFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTObjectFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TObjectFunctionality.Create(Self, idComponent);
end
;
function TTObjectFunctionality.getName: string;
begin
Result:=nmTObject;
end;


function TTObjectFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TypesDef\Object\Object.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

{TObjectFunctionality}
Constructor TObjectFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TObjectFunctionalityRemoted.Create(Self);
end;

procedure TObjectFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TObjectFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TObjectPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TObjectFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TObjectFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;


{TTLabelFunctionality}

Constructor TTLabelFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTLabel;
RemotedFunctionality:=TTLabelFunctionalityRemoted.Create(Self);
end
;
function TTLabelFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TTLabelFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTLabelFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TLabelFunctionality.Create(Self, idComponent);
end
;
function TTLabelFunctionality.getName: string;
begin
Result:=nmTLabel;
end;


function TTLabelFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TypesDef\Label\Label.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

{TLabelFunctionality}
Constructor TLabelFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TLabelFunctionalityRemoted.Create(Self);
end;

procedure TLabelFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TLabelFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TLabelPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TLabelFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TLabelFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;


{TTStationFunctionality}

Constructor TTStationFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTStation;
RemotedFunctionality:=TTStationFunctionalityRemoted.Create(Self);
end
;
function TTStationFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TTStationFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTStationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TStationFunctionality.Create(Self, idComponent);
end
;
procedure TTStationFunctionality.GetInstanceList(out List: TList);
var
  BA: TByteArray;
begin
RemotedFunctionality.GetInstanceList(BA);
ByteArray_CreateList(BA, List);
end;

procedure TTStationFunctionality.GetInstanceList(out List: TByteArray);
begin
RemotedFunctionality.GetInstanceList(List);
end;

function TTStationFunctionality.getName: string;
begin
Result:=nmTStation;
end;


function TTStationFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TypesDef\Station\Station.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

{TStationFunctionality}
Constructor TStationFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TStationFunctionalityRemoted.Create(Self);
end;

procedure TStationFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;

function TStationFunctionality.SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
begin
Result:=RemotedFunctionality.SetComponentsUsingObject(idTUseObj,idUseObj);
end;


function TStationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TStationPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TStationFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TStationFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

procedure TStationFunctionality.GetNumbersBound(out BegNumber,EndNumber: integer);
begin
RemotedFunctionality.GetNumbersBound(BegNumber,EndNumber);
end;


{TTMainLineFunctionality}

Constructor TTMainLineFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTMainLine;
RemotedFunctionality:=TTMainLineFunctionalityRemoted.Create(Self);
end
;
function TTMainLineFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TTMainLineFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTMainLineFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TMainLineFunctionality.Create(Self, idComponent);
end
;
function TTMainLineFunctionality.getName: string;
begin
Result:=nmTMainLine;
end;


function TTMainLineFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TypesDef\MainLine\MainLine.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

{TMainLineFunctionality}
Constructor TMainLineFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TMainLineFunctionalityRemoted.Create(Self);
end;

procedure TMainLineFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;

function TMainLineFunctionality.SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
begin
Result:=RemotedFunctionality.SetComponentsUsingObject(idTUseObj,idUseObj);
end;


function TMainLineFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TMainLinePanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TMainLineFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TMainLineFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

function TMainLineFunctionality.GetSTNOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=RemotedFunctionality.GetSTNOwner(idTOwner,idOwner);
end;


{TTDescriptionFunctionality}

Constructor TTDescriptionFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTDescription;
RemotedFunctionality:=TTDescriptionFunctionalityRemoted.Create(Self);
end
;
function TTDescriptionFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TTDescriptionFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTDescriptionFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TDescriptionFunctionality.Create(Self, idComponent);
end
;
function TTDescriptionFunctionality.getName: string;
begin
Result:=nmTDescription;
end;


function TTDescriptionFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TypesDef\Description\Description.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

{TDescriptionFunctionality}
Constructor TDescriptionFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TDescriptionFunctionalityRemoted.Create(Self);
end;

procedure TDescriptionFunctionality.UpdateDATA;
begin
Inherited;
_DATA:=TStringList.Create;
GetValue(_DATA);
end;

procedure TDescriptionFunctionality.ClearDATA;
begin
FreeAndNil(_DATA);
Inherited;
end;

procedure TDescriptionFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TDescriptionFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TDescriptionPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TDescriptionFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TDescriptionFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

procedure TDescriptionFunctionality.GetValue(vText: TStringList);
var
  BA: TByteArray;
begin
RemotedFunctionality.GetValue(BA);
ByteArray_PrepareStringList(BA, vText);
end;

procedure TDescriptionFunctionality.GetValue(out vText: TByteArray);
begin
RemotedFunctionality.GetValue(vText);
end;

procedure TDescriptionFunctionality.SetValue(NewValue: TStringList);
var
  BA: TByteArray;
begin
ByteArray_PrepareFromStringList(BA, NewValue);
RemotedFunctionality.SetValue(BA);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TDescriptionFunctionality.SetValue(NewValue: TByteArray);
begin
RemotedFunctionality.SetValue(NewValue);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TDescriptionFunctionality._GetDataDocument(const DataModel: integer; const DataType: integer; const flWithComponents: boolean; var Document: TByteArray): boolean;
begin
Raise Exception.Create(SNotSupported); //. =>
end;


{TTImageFunctionality}

Constructor TTImageFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTImage;
RemotedFunctionality:=TTImageFunctionalityRemoted.Create(Self);
end
;
function TTImageFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TTImageFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTImageFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TImageFunctionality.Create(Self, idComponent);
end
;
function TTImageFunctionality.getName: string;
begin
Result:=nmTImage;
end;


function TTImageFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TypesDef\Image\Image.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

{TImageFunctionality}
Constructor TImageFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TImageFunctionalityRemoted.Create(Self);
end;

{TImageFunctionality}
procedure TImageFunctionality.UpdateDATA;
begin
Inherited;
GetBitmapDATA(_DATA);
end;

procedure TImageFunctionality.ClearDATA;
begin
FreeAndNil(_DATA);
Inherited;
end;

procedure TImageFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TImageFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TImagePanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TImageFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TImageFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

procedure TImageFunctionality.GetDATA(out DATAStream: TClientBlobStream; out DATAType: TImageDATAType);
var
  BA: TByteArray;
  DT: integer;
begin
GetDATA(BA,DT);
ByteArray_CreateStream(BA, TMemoryStream(DATAStream));
DATAType:=TImageDATAType(DT);
end;

procedure TImageFunctionality.SetDATA(DATAStream: TMemoryStream; const DATAType: TImageDATAType);
var
  BA: TByteArray;
begin
ByteArray_PrepareFromStream(BA,TStream(DATAStream));
SetDATA(BA,Integer(DATAType));
end;

procedure TImageFunctionality.GetDATA(out DATAStream: TByteArray; out DATAType: Integer);
begin
RemotedFunctionality.GetDATA(DATAStream,DATAType);
end;

procedure TImageFunctionality.SetDATA(DATAStream: TByteArray; const DATAType: Integer);
begin
RemotedFunctionality.SetDATA(DATAStream,DATAType);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TImageFunctionality.GetBitmapDATA(out BMPDATAStream: TMemoryStream);
var
  DATA: TClientBlobStream;
  DATAType: TImageDATAType;
  JI: TJPEGImage;
begin
GetDATA(DATA,DATAType);
try
case DATAType of
idtBMP: begin
  BMPDATAStream:=TMemoryStream.Create;
  BMPDATAStream.LoadFromStream(DATA);
  end;
idtJPG: begin
  JI:=TJPEGImage.Create;
  with JI do
  try
  with TBitmap.Create do
  try
  if DATA.Size > 0
   then begin
    JI.LoadFromStream(DATA);
    Canvas.Lock();
    try
    Assign(JI);
    finally
    Canvas.Unlock();
    end;
    end;
  BMPDATAStream:=TMemoryStream.Create;
  SaveToStream(BMPDATAStream);
  BMPDATAStream.Position:=0;
  finally
  Destroy;
  end;
  finally
  Destroy;
  end;
  end;
else
  Raise Exception.Create('unimplemented Image file type '); //. =>
end;
finally
DATA.Destroy;
end;
end;

procedure TImageFunctionality.GetBitmapDATA(out BMPDATAStream: TByteArray);
begin
RemotedFunctionality.GetBitmapDATA(BMPDATAStream);
end;

procedure TImageFunctionality.LoadFromFile(const FileName: string);
var
  I: integer;
  Ext,S: string;
  DATAType: TImageDATAType;
  ImageName: string;
  MS: TMemoryStream;

  function GetDataType(const Ext: string): TImageDATAType;
  var
    I: TImageDATAType;
  begin
  for I:=Low(TImageDATAType) to High(TImageDATAType) do
    if ANSIUpperCase(ImagesDATATypesFilesExtensions[I]) = ANSIUpperCase(Ext)
     then begin
      Result:=TImageDATAType(I);
      Exit; //. ->
      end;
  Raise Exception.Create('invalid file extension for file loading'); //. =>
  end;

  function ExtractImageName(FileName: string): string;
  var
    I: integer;
  begin
  Result:='';
  FileName:=ExtractFileName(FileName);
  for I:=1 to Length(FileName) do
    if FileName[I] = '.'
     then
      Exit //. ->
     else
      Result:=Result+FileName[I];
  Result:=FileName;
  end;

begin
Ext:=ExtractFileExt(FileName); S:=''; for I:=2 to Length(Ext) do S:=S+Ext[I]; Ext:=S;
DATAType:=GetDataType(Ext);
ImageName:=ExtractImageName(FileName);
MS:=TMemoryStream.Create;
with MS do
try
LoadFromFile(FileName);
SetDATA(MS,DATAType);
finally
Destroy;
end;
end;


{TTWellFunctionality}

Constructor TTWellFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTWell;
RemotedFunctionality:=TTWellFunctionalityRemoted.Create(Self);
end
;
function TTWellFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TTWellFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTWellFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TWellFunctionality.Create(Self, idComponent);
end
;
function TTWellFunctionality.getName: string;
begin
Result:=nmTWell;
end;


function TTWellFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TypesDef\Well\Well.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

{TWellFunctionality}
Constructor TWellFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TWellFunctionalityRemoted.Create(Self);
end;

procedure TWellFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TWellFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TWellPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TWellFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TWellFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;


{TTTLFFunctionality}

Constructor TTTLFFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTTLF;
RemotedFunctionality:=TTTLFFunctionalityRemoted.Create(Self);
end
;
function TTTLFFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TTTLFFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTTLFFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTLFFunctionality.Create(Self, idComponent);
end
;
function TTTLFFunctionality.getName: string;
begin
Result:=nmTTLF;
end;


function TTTLFFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TypesDef\TLF\TLF.bmp');
  except
    end;
  end;
Result:=FImage;
end
;
procedure TTTLFFunctionality.GetIDInstanceByNumber(out ID: integer; const Number: integer);
begin
RemotedFunctionality.GetIDInstanceByNumber(ID,Number);
end;


{TTLFFunctionality}
Constructor TTLFFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TTLFFunctionalityRemoted.Create(Self);
end;

procedure TTLFFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;

function TTLFFunctionality.SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
begin
Result:=RemotedFunctionality.SetComponentsUsingObject(idTUseObj,idUseObj);
end;


function TTLFFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TTLFPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TTLFFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TTLFFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

function TTLFFunctionality.Number: integer;
begin
Result:=RemotedFunctionality.Number;
end;


function TTLFFunctionality.Kind: TAbonentKind;
var
  N: integer;
  P: boolean;
begin
CheckUserOperation(idReadOperation);
N:=Number;
P:=(Frac(Trunc(N/100)/2) = 0);
case N of
30000..31999: Result:=akNormal;
32000..32999: if P then Result:=akSparedA else Result:=akSparedB;
33000..33999: Result:=akNormal;
34000..34999: if P then Result:=akSparedA else Result:=akSparedB;
35000..35999: Result:=akNormal;
36000..36999: if P then Result:=akSparedA else Result:=akSparedB;
37000..38999: Result:=akNormal;
40000..41999: Result:=akNormal;
42000..42999: if P then Result:=akSparedA else Result:=akSparedB;
43000..44999: Result:=akNormal;
45000..45999: if P then Result:=akSparedA else Result:=akSparedB;
46000..46999: Result:=akNormal;
47000..49999: Result:=akNormal;
else
  Result:=akNormal;
end;
end
;
function TTLFFunctionality.LocalELockExist: boolean;
begin
Result:=RemotedFunctionality.LocalELockExist;
end;

function TTLFFunctionality.GlobalELockExist: boolean;
begin
Result:=RemotedFunctionality.GlobalELockExist;
end;

function TTLFFunctionality.GetFinishDevice(out vidTObj,vidObj: integer): boolean;
begin
Result:=RemotedFunctionality.GetFinishDevice(vidTObj,vidObj);
end;

function TTLFFunctionality.IsDamaged: boolean;
begin
Result:=RemotedFunctionality.IsDamaged;
end;

function TTLFFunctionality.idDamage: integer;
begin
Result:=RemotedFunctionality.idDamage;
end;

function TTLFFunctionality.getDamage_TimeNote: TDateTime;
begin
Result:=RemotedFunctionality.getDamage_TimeNote;
end;

procedure TTLFFunctionality.setDamage_TimeNote(Value: TDateTime);
begin
RemotedFunctionality.setDamage_TimeNote(Value);
end;

function TTLFFunctionality.getDamage_Note: string;
begin
Result:=RemotedFunctionality.getDamage_Note;
end;

procedure TTLFFunctionality.setDamage_Note(Value: string);
begin
RemotedFunctionality.setDamage_Note(Value);
end;

function TTLFFunctionality.getDamage_Measured: string;
begin
Result:=RemotedFunctionality.getDamage_Measured;
end;

procedure TTLFFunctionality.setDamage_Measured(Value: string);
begin
RemotedFunctionality.setDamage_Measured(Value);
end;

function TTLFFunctionality.getDamage_Acceptor: string;
begin
Result:=RemotedFunctionality.getDamage_Acceptor;
end;

procedure TTLFFunctionality.setDamage_Acceptor(Value: string);
begin
RemotedFunctionality.setDamage_Acceptor(Value);
end;

function TTLFFunctionality.getDamage_TimeBegRepair: TDateTime;
begin
Result:=RemotedFunctionality.getDamage_TimeBegRepair;
end;

procedure TTLFFunctionality.setDamage_TimeBegRepair(Value: TDateTime);
begin
RemotedFunctionality.setDamage_TimeBegRepair(Value);
end;

function TTLFFunctionality.getDamage_TimeEndRepair: TDateTime;
begin
Result:=RemotedFunctionality.getDamage_TimeEndRepair;
end;

procedure TTLFFunctionality.setDamage_TimeEndRepair(Value: TDateTime);
begin
RemotedFunctionality.setDamage_TimeEndRepair(Value);
end;

function TTLFFunctionality.getDamage_Damage: string;
begin
Result:=RemotedFunctionality.getDamage_Damage;
end;

procedure TTLFFunctionality.setDamage_Damage(Value: string);
begin
RemotedFunctionality.setDamage_Damage(Value);
end;

function TTLFFunctionality.getDamage_Executor: string;
begin
Result:=RemotedFunctionality.getDamage_Executor;
end;

procedure TTLFFunctionality.setDamage_Executor(Value: string);
begin
RemotedFunctionality.setDamage_Executor(Value);
end;

function TTLFFunctionality.getDamage_Remarks: string;
begin
Result:=RemotedFunctionality.getDamage_Remarks;
end;

procedure TTLFFunctionality.setDamage_Remarks(Value: string);
begin
RemotedFunctionality.setDamage_Remarks(Value);
end;

procedure TTLFFunctionality.WriteEvent(const Event: string; const EventTime: TDateTime);
begin
RemotedFunctionality.WriteEvent(Event,EventTime);
end;


{TTBoxFunctionality}

Constructor TTBoxFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTBox;
RemotedFunctionality:=TTBoxFunctionalityRemoted.Create(Self);
end
;
function TTBoxFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TTBoxFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTBoxFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TBoxFunctionality.Create(Self, idComponent);
end
;
function TTBoxFunctionality.getName: string;
begin
Result:=nmTBox;
end;


function TTBoxFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TypesDef\Box\Box.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

{TBoxFunctionality}
Constructor TBoxFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TBoxFunctionalityRemoted.Create(Self);
end;

procedure TBoxFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;

function TBoxFunctionality.SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
begin
Result:=RemotedFunctionality.SetComponentsUsingObject(idTUseObj,idUseObj);
end;


function TBoxFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TBoxPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TBoxFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TBoxFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;


{TTCableBoxFunctionality}

Constructor TTCableBoxFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTCableBox;
RemotedFunctionality:=TTCableBoxFunctionalityRemoted.Create(Self);
end
;

function TTCableBoxFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TTCableBoxFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTCableBoxFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TCableBoxFunctionality.Create(Self, idComponent);
end
;
function TTCableBoxFunctionality.getName: string;
begin
Result:=nmTCableBox;
end;


function TTCableBoxFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TypesDef\CableBox\CableBox.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

{TCableBoxFunctionality}
Constructor TCableBoxFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TCableBoxFunctionalityRemoted.Create(Self);
end;


procedure TCableBoxFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TCableBoxFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TCableBoxPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TCableBoxFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TCableBoxFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;


{TTDistrLineFunctionality}

Constructor TTDistrLineFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTDistrLine;
RemotedFunctionality:=TTDistrLineFunctionalityRemoted.Create(Self);
end
;

function TTDistrLineFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TTDistrLineFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTDistrLineFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TDistrLineFunctionality.Create(Self, idComponent);
end
;
function TTDistrLineFunctionality.getName: string;
begin
Result:=nmTDistrLine;
end;


function TTDistrLineFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TypesDef\DistrLine\DistrLine.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

{TDistrLineFunctionality}
Constructor TDistrLineFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TDistrLineFunctionalityRemoted.Create(Self);
end;


procedure TDistrLineFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;

function TDistrLineFunctionality.SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
begin
Result:=RemotedFunctionality.SetComponentsUsingObject(idTUseObj,idUseObj);
end;


function TDistrLineFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TDistrLinePanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TDistrLineFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TDistrLineFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;


{TTClientFunctionality}

Constructor TTClientFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTClient;
RemotedFunctionality:=TTClientFunctionalityRemoted.Create(Self);
end
;

function TTClientFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TTClientFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TTClientFunctionality.GetInstanceList(out List: TList);
var
  BA: TByteArray;
begin
RemotedFunctionality.GetInstanceList(BA);
ByteArray_CreateList(BA, List);
end;

procedure TTClientFunctionality.GetInstanceList(out List: TByteArray);
begin
RemotedFunctionality.GetInstanceList(List);
end;


function TTClientFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TClientFunctionality.Create(Self, idComponent);
end
;
function TTClientFunctionality.getName: string;
begin
Result:=nmTClient;
end;


function TTClientFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TypesDef\Client\Client.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

{TClientFunctionality}
Constructor TClientFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TClientFunctionalityRemoted.Create(Self);
end;


procedure TClientFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TClientFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TClientPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TClientFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TClientFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

function TClientFunctionality.GetDebet(out Value: Double): boolean;
begin
Result:=RemotedFunctionality.GetDebet(Value);
end;


{TTHouseFunctionality}

Constructor TTHouseFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTHouse;
RemotedFunctionality:=TTHouseFunctionalityRemoted.Create(Self);
end
;

function TTHouseFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TTHouseFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTHouseFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=THouseFunctionality.Create(Self, idComponent);
end
;
function TTHouseFunctionality.getName: string;
begin
Result:=nmTHouse;
end;


function TTHouseFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TypesDef\House\House.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

{THouseFunctionality}
Constructor THouseFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=THouseFunctionalityRemoted.Create(Self);
end;


procedure THouseFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;

function THouseFunctionality.SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
begin
Result:=RemotedFunctionality.SetComponentsUsingObject(idTUseObj,idUseObj);
end;


function THouseFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=THousePanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function THouseFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function THouseFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;


{TTCommNodeFunctionality}

Constructor TTCommNodeFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTCommNode;
RemotedFunctionality:=TTCommNodeFunctionalityRemoted.Create(Self);
end
;

function TTCommNodeFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TTCommNodeFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTCommNodeFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TCommNodeFunctionality.Create(Self, idComponent);
end
;
function TTCommNodeFunctionality.getName: string;
begin
Result:=nmTCommNode;
end;


function TTCommNodeFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TypesDef\CommNode\CommNode.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

{TCommNodeFunctionality}
Constructor TCommNodeFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TCommNodeFunctionalityRemoted.Create(Self);
end;


procedure TCommNodeFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TCommNodeFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TCommNodePanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TCommNodeFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TCommNodeFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;


{TTCrossFunctionality}

Constructor TTCrossFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTCross;
RemotedFunctionality:=TTCrossFunctionalityRemoted.Create(Self);
end
;

function TTCrossFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TTCrossFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTCrossFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TCrossFunctionality.Create(Self, idComponent);
end
;
function TTCrossFunctionality.getName: string;
begin
Result:=nmTCross;
end;


function TTCrossFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TypesDef\Cross\Cross.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

{TCrossFunctionality}
Constructor TCrossFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TCrossFunctionalityRemoted.Create(Self);
end;


procedure TCrossFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TCrossFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TCrossPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TCrossFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TCrossFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;


{TTCaseFunctionality}

Constructor TTCaseFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTCase;
RemotedFunctionality:=TTCaseFunctionalityRemoted.Create(Self);
end
;

function TTCaseFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TTCaseFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTCaseFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TCaseFunctionality.Create(Self, idComponent);
end
;
function TTCaseFunctionality.getName: string;
begin
Result:=nmTCase;
end;


function TTCaseFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TypesDef\Case\Case.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

{TCaseFunctionality}
Constructor TCaseFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TCaseFunctionalityRemoted.Create(Self);
end;


procedure TCaseFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TCaseFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TCasePanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TCaseFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TCaseFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;


{TTStreetFunctionality}

Constructor TTStreetFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTStreet;
RemotedFunctionality:=TTStreetFunctionalityRemoted.Create(Self);
end
;

function TTStreetFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TTStreetFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTStreetFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TStreetFunctionality.Create(Self, idComponent);
end
;
function TTStreetFunctionality.getName: string;
begin
Result:=nmTStreet;
end;


function TTStreetFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TypesDef\Street\Street.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

{TStreetFunctionality}
Constructor TStreetFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TStreetFunctionalityRemoted.Create(Self);
end;


procedure TStreetFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TStreetFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TStreetPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TStreetFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TStreetFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;


{TTOtherObjFunctionality}

Constructor TTOtherObjFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTOtherObj;
RemotedFunctionality:=TTOtherObjFunctionalityRemoted.Create(Self);
end
;

function TTOtherObjFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TTOtherObjFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTOtherObjFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TOtherObjFunctionality.Create(Self, idComponent);
end
;
function TTOtherObjFunctionality.getName: string;
begin
Result:=nmTOtherObj;
end;


function TTOtherObjFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TypesDef\OtherObj\OtherObj.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

{TOtherObjFunctionality}
Constructor TOtherObjFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TOtherObjFunctionalityRemoted.Create(Self);
end;


procedure TOtherObjFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TOtherObjFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TOtherObjPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TOtherObjFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TOtherObjFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;


{TTSpanFunctionality}

Constructor TTSpanFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTSpan;
RemotedFunctionality:=TTSpanFunctionalityRemoted.Create(Self);
end
;

function TTSpanFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TTSpanFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTSpanFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TSpanFunctionality.Create(Self, idComponent);
end
;
function TTSpanFunctionality.getName: string;
begin
Result:=nmTSpan;
end;


function TTSpanFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TypesDef\Span\Span.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

{TSpanFunctionality}
Constructor TSpanFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TSpanFunctionalityRemoted.Create(Self);
end;


procedure TSpanFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TSpanFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TSpanPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TSpanFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TSpanFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;


{TTChanelFunctionality}

Constructor TTChanelFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTChanel;
RemotedFunctionality:=TTChanelFunctionalityRemoted.Create(Self);
end
;

function TTChanelFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TTChanelFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTChanelFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TChanelFunctionality.Create(Self, idComponent);
end
;
function TTChanelFunctionality.getName: string;
begin
Result:=nmTChanel;
end;


function TTChanelFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TypesDef\Chanel\Chanel.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

{TChanelFunctionality}
Constructor TChanelFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TChanelFunctionalityRemoted.Create(Self);
end;


procedure TChanelFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;

function TChanelFunctionality.SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
begin
Result:=RemotedFunctionality.SetComponentsUsingObject(idTUseObj,idUseObj);
end;


function TChanelFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TChanelPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TChanelFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TChanelFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;


{TTHandHoldFunctionality}

Constructor TTHandHoldFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTHandHold;
RemotedFunctionality:=TTHandHoldFunctionalityRemoted.Create(Self);
end
;

function TTHandHoldFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TTHandHoldFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTHandHoldFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=THandHoldFunctionality.Create(Self, idComponent);
end
;
function TTHandHoldFunctionality.getName: string;
begin
Result:=nmTHandHold;
end;


function TTHandHoldFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TypesDef\HandHold\HandHold.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

{THandHoldFunctionality}
Constructor THandHoldFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=THandHoldFunctionalityRemoted.Create(Self);
end;


procedure THandHoldFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function THandHoldFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=THandHoldPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function THandHoldFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function THandHoldFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;


{TTLineDistFunctionality}

Constructor TTLineDistFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTLineDist;
RemotedFunctionality:=TTLineDistFunctionalityRemoted.Create(Self);
end
;

function TTLineDistFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TTLineDistFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTLineDistFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TLineDistFunctionality.Create(Self, idComponent);
end
;
function TTLineDistFunctionality.getName: string;
begin
Result:=nmTLineDist;
end;


function TTLineDistFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TypesDef\LineDist\LineDist.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

{TLineDistFunctionality}
Constructor TLineDistFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TLineDistFunctionalityRemoted.Create(Self);
end;


procedure TLineDistFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TLineDistFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TLineDistPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TLineDistFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TLineDistFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;


{TTMuffFunctionality}

Constructor TTMuffFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTMuff;
RemotedFunctionality:=TTMuffFunctionalityRemoted.Create(Self);
end
;

function TTMuffFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TTMuffFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTMuffFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TMuffFunctionality.Create(Self, idComponent);
end
;
function TTMuffFunctionality.getName: string;
begin
Result:=nmTMuff;
end;


function TTMuffFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TypesDef\Muff\Muff.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

{TMuffFunctionality}
Constructor TMuffFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TMuffFunctionalityRemoted.Create(Self);
end;


procedure TMuffFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TMuffFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TMuffPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TMuffFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TMuffFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;


{TTOfferFunctionality}

Constructor TTOfferFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTOffer;
RemotedFunctionality:=TTOfferFunctionalityRemoted.Create(Self);
end
;

function TTOfferFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TTOfferFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTOfferFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TOfferFunctionality.Create(Self, idComponent);
end
;
function TTOfferFunctionality.getName: string;
begin
Result:=nmTOffer;
end;


function TTOfferFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TypesDef\Offer\Offer.bmp');
  except
    end;
  end;
Result:=FImage;
end
;
function TTOfferFunctionality.GetOfferByHumanID(const HumanID: integer; out idOffer: integer): boolean;
begin
Result:=RemotedFunctionality.GetOfferByHumanID(HumanID,idOffer);
end;


{TOfferFunctionality}
Constructor TOfferFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TOfferFunctionalityRemoted.Create(Self);
end;


procedure TOfferFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;

function TOfferFunctionality.SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
begin
Result:=RemotedFunctionality.SetComponentsUsingObject(idTUseObj,idUseObj);
end;


function TOfferFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TOfferPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TOfferFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

procedure TOfferFunctionality.setName(Value: string);
begin
RemotedFunctionality.setName(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TOfferFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

function TOfferFunctionality.getSchedule: string;
begin
Result:=RemotedFunctionality.getSchedule;
end;

procedure TOfferFunctionality.setSchedule(Value: string);
begin
RemotedFunctionality.setSchedule(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TOfferFunctionality.getPassword: string;
begin
Result:=RemotedFunctionality.getPassword;
end;

procedure TOfferFunctionality.setPassword(Value: string);
begin
RemotedFunctionality.setPassword(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TOfferFunctionality.getContactTLF: integer;
begin
Result:=RemotedFunctionality.getContactTLF;
end;

procedure TOfferFunctionality.setContactTLF(Value: integer);
begin
RemotedFunctionality.setContactTLF(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TOfferFunctionality.getLastUpdated: TDateTime;
begin
Result:=RemotedFunctionality.getLastUpdated;
end;

procedure TOfferFunctionality.setLastUpdated(Value: TDateTime);
begin
RemotedFunctionality.setLastUpdated(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TOfferFunctionality.LoadDATAFromStream(Stream: TStream);
var
  BA: TByteArray;
begin
ByteArray_PrepareFromStream(BA, Stream);
RemotedFunctionality.LoadDATAFromStream(BA);
end;

procedure TOfferFunctionality.LoadDATAFromStream(Stream: TByteArray);
begin
RemotedFunctionality.LoadDATAFromStream(Stream);
end;

function TOfferFunctionality.UserID: integer;
begin
Result:=RemotedFunctionality.UserID;
end;

function TOfferFunctionality.UID: integer;
begin
Result:=RemotedFunctionality.UID;
end;

function TOfferFunctionality.AddressStr: string;
begin
Result:=RemotedFunctionality.AddressStr;
end;

function TOfferFunctionality.Goods_Insert: integer;
begin
Result:=RemotedFunctionality.Goods_Insert;
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TOfferFunctionality.Goods_GetList(out List: TList);
var
  BA: TByteArray;
begin
RemotedFunctionality.Goods_GetList(BA);
ByteArray_CreateList(BA, List);
end;

procedure TOfferFunctionality.Goods_GetList(out List: TByteArray);
begin
RemotedFunctionality.Goods_GetList(List);
end;

procedure TOfferFunctionality.Goods_Remove(const idOfferGoods: integer);
begin
RemotedFunctionality.Goods_Remove(idOfferGoods);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TOfferFunctionality.Goods_Clear;
begin
RemotedFunctionality.Goods_Clear;
//. update local TypesSystem and representations
Space.StayUpToDate;
end;


{TTDemandFunctionality}

Constructor TTDemandFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTDemand;
RemotedFunctionality:=TTDemandFunctionalityRemoted.Create(Self);
end
;

function TTDemandFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TTDemandFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTDemandFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TDemandFunctionality.Create(Self, idComponent);
end
;
function TTDemandFunctionality.getName: string;
begin
Result:=nmTDemand;
end;


function TTDemandFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TypesDef\Demand\Demand.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

{TDemandFunctionality}
Constructor TDemandFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TDemandFunctionalityRemoted.Create(Self);
end;

procedure TDemandFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;

function TDemandFunctionality.SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
begin
Result:=RemotedFunctionality.SetComponentsUsingObject(idTUseObj,idUseObj);
end;


function TDemandFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TDemandPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TDemandFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TDemandFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;


{TTCommLineFunctionality}

Constructor TTCommLineFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTCommLine;
RemotedFunctionality:=TTCommLineFunctionalityRemoted.Create(Self);
end
;

function TTCommLineFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TTCommLineFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTCommLineFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TCommLineFunctionality.Create(Self, idComponent);
end
;
function TTCommLineFunctionality.getName: string;
begin
Result:=nmTCommLine;
end;


function TTCommLineFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TypesDef\CommLine\CommLine.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

{TCommLineFunctionality}
Constructor TCommLineFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TCommLineFunctionalityRemoted.Create(Self);
end;


procedure TCommLineFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;

function TCommLineFunctionality.SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
begin
Result:=RemotedFunctionality.SetComponentsUsingObject(idTUseObj,idUseObj);
end;


function TCommLineFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TCommLinePanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TCommLineFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TCommLineFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;


{TTGoodsFunctionality}

Constructor TTGoodsFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTGoods;
RemotedFunctionality:=TTGoodsFunctionalityRemoted.Create(Self);
end
;

function TTGoodsFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TTGoodsFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TTGoodsFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TGoodsFunctionality.Create(Self, idComponent);
end
;
function TTGoodsFunctionality.getName: string;
begin
Result:=nmTGoods;
end;


function TTGoodsFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TypesDef\Goods\Goods.bmp');
  except
    end;
  end;
Result:=FImage;
end
;
procedure TTGoodsFunctionality.GetInstanceListContainingContext(const Context: string; out List: TStringList);
var
  BA: TByteArray;
begin
RemotedFunctionality.GetInstanceListContainingContext(Context,BA);
ByteArray_CreateStringList(BA, List);
end;

procedure TTGoodsFunctionality.GetInstanceListContainingContext(const Context: string; out List: TByteArray);
begin
RemotedFunctionality.GetInstanceListContainingContext(Context,List);
end;

function TTGoodsFunctionality.IsInstanceExist(const pName: string; out idGoods: integer): boolean;
begin
Result:=RemotedFunctionality.IsInstanceExist(pName,idGoods);
end;


{TGoodsFunctionality}
Constructor TGoodsFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TGoodsFunctionalityRemoted.Create(Self);
end;


procedure TGoodsFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TGoodsFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TGoodsPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TGoodsFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

procedure TGoodsFunctionality.setName(Value: string);
begin
RemotedFunctionality.setName(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TGoodsFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

function TGoodsFunctionality.StdAmount: integer;
begin
Result:=RemotedFunctionality.StdAmount;
end;

function TGoodsFunctionality.StdMeasureUnit: string;
begin
Result:=RemotedFunctionality.StdMeasureUnit;
end;


{TTCollectionFunctionality}

Constructor TTCollectionFunctionality.Create;
begin
Inherited Create;                                                  
TypeSystem:=SystemTCollection;
RemotedFunctionality:=TTCollectionFunctionalityRemoted.Create(Self);
end
;
function TTCollectionFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TTCollectionFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;

                              
function TTCollectionFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TCollectionFunctionality.Create(Self, idComponent);
end
;
function TTCollectionFunctionality.getName: string;
begin
Result:=nmTCollection;
end;


function TTCollectionFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TypesDef\Collection\Collection.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

{TCollectionFunctionality}
Constructor TCollectionFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TCollectionFunctionalityRemoted.Create(Self);
end;


procedure TCollectionFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TCollectionFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TCollectionPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TCollectionFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

procedure TCollectionFunctionality.setName(const Value: string);
begin
RemotedFunctionality.setName(Value);
end;

function TCollectionFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

function TCollectionFunctionality.InsertItem(const idTItem,idItem: integer; const Alias: string; const ListOrder: integer): integer;
begin
Result:=RemotedFunctionality.InsertItem(idTItem,idItem,Alias,ListOrder);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TCollectionFunctionality.RemoveItem(const id: integer);
begin
RemotedFunctionality.RemoveItem(id);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TCollectionFunctionality.Item_ChangeAlias(const id: integer; const pAlias: string);
begin
RemotedFunctionality.Item_ChangeAlias(id,pAlias);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TCollectionFunctionality.Item_ChangeListOrder(const id: integer; const Order: integer);
begin
RemotedFunctionality.Item_ChangeListOrder(id,Order);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TCollectionFunctionality.RemoveItems;
begin
RemotedFunctionality.RemoveItems;
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TCollectionFunctionality.IsItemExist(const idTItem,idItem: integer): boolean;
begin
Result:=RemotedFunctionality.IsItemExist(idTItem,idItem);
end;

procedure TCollectionFunctionality.GetListItems(out List: TList);
var
  BA: TByteArray;
begin
RemotedFunctionality.GetListItems(BA);
ByteArray_CreateList(BA, List)
end;

procedure TCollectionFunctionality.GetListItems(out List: TByteArray);
begin
RemotedFunctionality.GetListItems(List);
end;

procedure TCollectionFunctionality.SaveListItems(List: TList);
var
  BA: TByteArray;
begin
ByteArray_PrepareFromList(BA, List);
RemotedFunctionality.SaveListItems(BA);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TCollectionFunctionality.SaveListItems(const List: TByteArray);
begin
RemotedFunctionality.SaveListItems(List);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;



{TTCUSTOMVisualizationFunctionality}
Destructor TTCUSTOMVisualizationFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TCUSTOMVisualizationFunctionality}
Destructor TCUSTOMVisualizationFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTOLEVisualizationFunctionality}
Destructor TTOLEVisualizationFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TOLEVisualizationFunctionality}
Destructor TOLEVisualizationFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTHTMLVisualizationFunctionality}
Destructor TTHTMLVisualizationFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{THTMLVisualizationFunctionality}
Destructor THTMLVisualizationFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTBZRVisualizationFunctionality}
Destructor TTBZRVisualizationFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TBZRVisualizationFunctionality}
Destructor TBZRVisualizationFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTAGIFVisualizationFunctionality}
Destructor TTAGIFVisualizationFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TAGIFVisualizationFunctionality}
Destructor TAGIFVisualizationFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTOrientedVIDEOVisualizationFunctionality}
Destructor TTOrientedVIDEOVisualizationFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TOrientedVIDEOVisualizationFunctionality}
Destructor TOrientedVIDEOVisualizationFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTVIDEOVisualizationFunctionality}
Destructor TTVIDEOVisualizationFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TVIDEOVisualizationFunctionality}
Destructor TVIDEOVisualizationFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTOPPVisualizationFunctionality}
Destructor TTOPPVisualizationFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TOPPVisualizationFunctionality}
Destructor TOPPVisualizationFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTMODELServerFunctionality}
Destructor TTMODELServerFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TMODELServerFunctionality}
Destructor TMODELServerFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTCoReferenceFunctionality}
Destructor TTCoReferenceFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TCoReferenceFunctionality}
Destructor TCoReferenceFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTPositionerFunctionality}
Destructor TTPositionerFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TPositionerFunctionality}
Destructor TPositionerFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTOrientedWMFVisualizationFunctionality}
Destructor TTOrientedWMFVisualizationFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TOrientedWMFVisualizationFunctionality}
Destructor TOrientedWMFVisualizationFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTCELLVisualizationFunctionality}
Destructor TTCELLVisualizationFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TCELLVisualizationFunctionality}
Destructor TCELLVisualizationFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTEllipseVisualizationFunctionality}
Destructor TTEllipseVisualizationFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TEllipseVisualizationFunctionality}
Destructor TEllipseVisualizationFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTWMFVisualizationFunctionality}
Destructor TTWMFVisualizationFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TWMFVisualizationFunctionality}
Destructor TWMFVisualizationFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTPictureVisualizationFunctionality}
Destructor TTPictureVisualizationFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TPictureVisualizationFunctionality}
Destructor TPictureVisualizationFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTRoundVisualizationFunctionality}
Destructor TTRoundVisualizationFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TRoundVisualizationFunctionality}
Destructor TRoundVisualizationFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTGeodesyPointFunctionality}
Destructor TTGeodesyPointFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TGeodesyPointFunctionality}
Destructor TGeodesyPointFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTPrivateAreaVisualizationFunctionality}
Destructor TTPrivateAreaVisualizationFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TPrivateAreaVisualizationFunctionality}
Destructor TPrivateAreaVisualizationFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTHyperTextFunctionality}
Destructor TTHyperTextFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{THyperTextFunctionality}
Destructor THyperTextFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTComponentsFindServiceFunctionality}
Destructor TTComponentsFindServiceFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TComponentsFindServiceFunctionality}
Destructor TComponentsFindServiceFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTUsersServiceFunctionality}
Destructor TTUsersServiceFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TUsersServiceFunctionality}
Destructor TUsersServiceFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTTransportServiceFunctionality}
Destructor TTTransportServiceFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTransportServiceFunctionality}
Destructor TTransportServiceFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTMarketServiceFunctionality}
Destructor TTMarketServiceFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TMarketServiceFunctionality}
Destructor TMarketServiceFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTTelecomServiceFunctionality}
Destructor TTTelecomServiceFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTelecomServiceFunctionality}
Destructor TTelecomServiceFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTWNDVisualizationFunctionality}
Destructor TTWNDVisualizationFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TWNDVisualizationFunctionality}
Destructor TWNDVisualizationFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTMRKVisualizationFunctionality}
Destructor TTMRKVisualizationFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TMRKVisualizationFunctionality}
Destructor TMRKVisualizationFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTOrientedPictureVisualizationFunctionality}
Destructor TTOrientedPictureVisualizationFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TOrientedPictureVisualizationFunctionality}
Destructor TOrientedPictureVisualizationFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTOrientedTTFVisualizationFunctionality}
Destructor TTOrientedTTFVisualizationFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TOrientedTTFVisualizationFunctionality}
Destructor TOrientedTTFVisualizationFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTIconFunctionality}
Destructor TTIconFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TIconFunctionality}
Destructor TIconFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTMessageBoardMessageFunctionality}
Destructor TTMessageBoardMessageFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TMessageBoardMessageFunctionality}
Destructor TMessageBoardMessageFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTMessageBoardFunctionality}
Destructor TTMessageBoardFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TMessageBoardFunctionality}
Destructor TMessageBoardFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTHREFFunctionality}
Destructor TTHREFFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{THREFFunctionality}
Destructor THREFFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTQDCVisualizationFunctionality}
Destructor TTQDCVisualizationFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TQDCVisualizationFunctionality}
Destructor TQDCVisualizationFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTOffersServerFunctionality}
Destructor TTOffersServerFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TOffersServerFunctionality}
Destructor TOffersServerFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTSecurityComponentOperationFunctionality}
Destructor TTSecurityComponentOperationFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TSecurityComponentOperationFunctionality}
Destructor TSecurityComponentOperationFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTSecurityKeyFunctionality}
Destructor TTSecurityKeyFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TSecurityKeyFunctionality}
Destructor TSecurityKeyFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTSecurityFileFunctionality}
Destructor TTSecurityFileFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TSecurityFileFunctionality}
Destructor TSecurityFileFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTSecurityComponentFunctionality}
Destructor TTSecurityComponentFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TSecurityComponentFunctionality}
Destructor TSecurityComponentFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTMODELUserFunctionality}
Destructor TTMODELUserFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TMODELUserFunctionality}
Destructor TMODELUserFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTTextureFunctionality}
Destructor TTTextureFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTextureFunctionality}
Destructor TTextureFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTBuffered3DVisualizationFunctionality}
Destructor TTBuffered3DVisualizationFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TBuffered3DVisualizationFunctionality}
Destructor TBuffered3DVisualizationFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTDATAFileFunctionality}
Destructor TTDATAFileFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TDATAFileFunctionality}
Destructor TDATAFileFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTCoComponentFunctionality}
Destructor TTCoComponentFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TCoComponentFunctionality}
Destructor TCoComponentFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTCoComponentTypeMarkerFunctionality}
Destructor TTCoComponentTypeMarkerFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TCoComponentTypeMarkerFunctionality}
Destructor TCoComponentTypeMarkerFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTCoComponentTypeFunctionality}
Destructor TTCoComponentTypeFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TCoComponentTypeFunctionality}
Destructor TCoComponentTypeFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTAddressFunctionality}
Destructor TTAddressFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TAddressFunctionality}
Destructor TAddressFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTTransportRouteFunctionality}
Destructor TTTransportRouteFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTransportRouteFunctionality}
Destructor TTransportRouteFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTTransportNodeFunctionality}
Destructor TTTransportNodeFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTransportNodeFunctionality}
Destructor TTransportNodeFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTOfferGoodsFunctionality}
Destructor TTOfferGoodsFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TOfferGoodsFunctionality}
Destructor TOfferGoodsFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTTLFStationTMTFunctionality}
Destructor TTTLFStationTMTFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTLFStationTMTFunctionality}
Destructor TTLFStationTMTFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTNameFunctionality}
Destructor TTNameFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TNameFunctionality}
Destructor TNameFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTVisualizationFunctionality}
Destructor TTVisualizationFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TVisualizationFunctionality}
Destructor TVisualizationFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTHREFVisualizationFunctionality}
Destructor TTHREFVisualizationFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{THREFVisualizationFunctionality}
Destructor THREFVisualizationFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTTTFVisualizationFunctionality}
Destructor TTTTFVisualizationFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTTFVisualizationFunctionality}
Destructor TTTFVisualizationFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTObjectFunctionality}
Destructor TTObjectFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TObjectFunctionality}
Destructor TObjectFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTLabelFunctionality}
Destructor TTLabelFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TLabelFunctionality}
Destructor TLabelFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTStationFunctionality}
Destructor TTStationFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TStationFunctionality}
Destructor TStationFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTMainLineFunctionality}
Destructor TTMainLineFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TMainLineFunctionality}
Destructor TMainLineFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTDescriptionFunctionality}
Destructor TTDescriptionFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TDescriptionFunctionality}
Destructor TDescriptionFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTImageFunctionality}
Destructor TTImageFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TImageFunctionality}
Destructor TImageFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTWellFunctionality}
Destructor TTWellFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TWellFunctionality}
Destructor TWellFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTTLFFunctionality}
Destructor TTTLFFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTLFFunctionality}
Destructor TTLFFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTBoxFunctionality}
Destructor TTBoxFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TBoxFunctionality}
Destructor TBoxFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTCableBoxFunctionality}
Destructor TTCableBoxFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TCableBoxFunctionality}
Destructor TCableBoxFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTDistrLineFunctionality}
Destructor TTDistrLineFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TDistrLineFunctionality}
Destructor TDistrLineFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTClientFunctionality}
Destructor TTClientFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TClientFunctionality}
Destructor TClientFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTHouseFunctionality}
Destructor TTHouseFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{THouseFunctionality}
Destructor THouseFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTCommNodeFunctionality}
Destructor TTCommNodeFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TCommNodeFunctionality}
Destructor TCommNodeFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTCrossFunctionality}
Destructor TTCrossFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TCrossFunctionality}
Destructor TCrossFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTCaseFunctionality}
Destructor TTCaseFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TCaseFunctionality}
Destructor TCaseFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTStreetFunctionality}
Destructor TTStreetFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TStreetFunctionality}
Destructor TStreetFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTOtherObjFunctionality}
Destructor TTOtherObjFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TOtherObjFunctionality}
Destructor TOtherObjFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTSpanFunctionality}
Destructor TTSpanFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TSpanFunctionality}
Destructor TSpanFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTChanelFunctionality}
Destructor TTChanelFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TChanelFunctionality}
Destructor TChanelFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTHandHoldFunctionality}
Destructor TTHandHoldFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{THandHoldFunctionality}
Destructor THandHoldFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTLineDistFunctionality}
Destructor TTLineDistFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TLineDistFunctionality}
Destructor TLineDistFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTMuffFunctionality}
Destructor TTMuffFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TMuffFunctionality}
Destructor TMuffFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTOfferFunctionality}
Destructor TTOfferFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TOfferFunctionality}
Destructor TOfferFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTDemandFunctionality}
Destructor TTDemandFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TDemandFunctionality}
Destructor TDemandFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTCommLineFunctionality}
Destructor TTCommLineFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TCommLineFunctionality}
Destructor TCommLineFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTGoodsFunctionality}
Destructor TTGoodsFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TGoodsFunctionality}
Destructor TGoodsFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTCollectionFunctionality}
Destructor TTCollectionFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TCollectionFunctionality}
Destructor TCollectionFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


{TTSecurityComponentOperationFunctionality}
procedure TTSecurityComponentOperationFunctionality.GetInstanceListByContext(const Context: WideString; out List: TList);
var
  BA: TByteArray;
begin
RemotedFunctionality.GetInstanceListByContext(Context, BA);
ByteArray_CreateList(BA, List);
end;

procedure TTSecurityComponentOperationFunctionality.GetInstanceListByContext(const Context: WideString; out List: TByteArray);
begin
RemotedFunctionality.GetInstanceListByContext(Context,List);
end;


{TTSecurityKeyFunctionality}
procedure TTSecurityKeyFunctionality.GetInstanceListByContext(const Context: WideString; out List: TList);
var
  BA: TByteArray;
begin
RemotedFunctionality.GetInstanceListByContext(Context, BA);
ByteArray_CreateList(BA, List);
end;

procedure TTSecurityKeyFunctionality.GetInstanceListByContext(const Context: WideString; out List: TByteArray);
begin
RemotedFunctionality.GetInstanceListByContext(Context,List);
end;


{TTSecurityFileFunctionality}
procedure TTSecurityFileFunctionality.GetInstanceListByContext(const Context: WideString; out List: TList);
var
  BA: TByteArray;
begin
RemotedFunctionality.GetInstanceListByContext(Context, BA);
ByteArray_CreateList(BA, List);
end;

procedure TTSecurityFileFunctionality.GetInstanceListByContext(const Context: WideString; out List: TByteArray);
begin
RemotedFunctionality.GetInstanceListByContext(Context,List);
end;


{TTMODELUserFunctionality}
procedure TTMODELUserFunctionality.GetInstanceListByContext(const Context: WideString; out List: TList);
var
  BA: TByteArray;
begin
RemotedFunctionality.GetInstanceListByContext(Context, BA);
ByteArray_CreateList(BA, List);
end;

procedure TTMODELUserFunctionality.GetInstanceListByContext(const Context: WideString; out List: TByteArray);
begin
RemotedFunctionality.GetInstanceListByContext(Context,List);
end;


{TMODELUserFunctionality}
procedure TMODELUserFunctionality.GetMessageBoards(out List: TList);
var
  BA: TByteArray;
begin
RemotedFunctionality.GetMessageBoards(BA);
ByteArray_CreateList(BA, List);
end;

procedure TMODELUserFunctionality.GetMessageBoards(out List: TByteArray);
begin
RemotedFunctionality.GetMessageBoards(List);
end;

{TMODELServerFunctionality}
procedure TMODELServerFunctionality.CreateNewUserByDefaultPrototype(const NewUserName: WideString; const NewUserPassword: WideString; const NewUserFullName: WideString; const NewUserContactInfo: WideString;  out idNewUser: integer);
begin
RemotedFunctionality.CreateNewUserByDefaultPrototype(NewUserName,NewUserPassword,NewUserFullName,NewUserContactInfo,idNewUser);
end;

procedure TMODELServerFunctionality.CreateNewUserByDefaultPrototype1(const NewUserName: WideString; const NewUserPassword: WideString; const NewUserFullName: WideString; const NewUserContactInfo: WideString; const Signature: WideString;  out idNewUser: integer);
begin
RemotedFunctionality.CreateNewUserByDefaultPrototype1(NewUserName,NewUserPassword,NewUserFullName,NewUserContactInfo,Signature,idNewUser);
end;

{TMODELUserFunctionality}
procedure TMODELUserFunctionality.CheckDATASize(const pAddDATASize: integer);
begin
RemotedFunctionality.CheckDATASize(pAddDATASize);
end;

procedure TMODELUserFunctionality.AddDATASize(const pAddDATASize: integer);
begin
RemotedFunctionality.AddDATASize(pAddDATASize);
end;

procedure TMODELUserFunctionality.SubDATASize(const pSubDATASize: integer);
begin
RemotedFunctionality.SubDATASize(pSubDATASize);
end;

procedure TMODELUserFunctionality.CheckSpaceSquare(const pAddSpaceSquare: Double);
begin
RemotedFunctionality.CheckSpaceSquare(pAddSpaceSquare);
end;

procedure TMODELUserFunctionality.AddSpaceSquare(const pAddSpaceSquare: Double);
begin
RemotedFunctionality.AddSpaceSquare(pAddSpaceSquare);
end;

procedure TMODELUserFunctionality.SubSpaceSquare(const pSubSpaceSquare: Double);
begin
RemotedFunctionality.SubSpaceSquare(pSubSpaceSquare);
end;

procedure TMODELUserFunctionality.CheckMaxSpaceSquarePerObject(const pObjectSpaceSquare: Double);
begin
RemotedFunctionality.CheckMaxSpaceSquarePerObject(pObjectSpaceSquare);
end;

procedure TMODELUserFunctionality.ServerFolder_GetSubFoldersList(const RelativePath: WideString; out List: WideString);
begin
RemotedFunctionality.ServerFolder_GetSubFoldersList(RelativePath,List);
end;

procedure TMODELUserFunctionality.ServerFolder_GetFilesList(const RelativePath: WideString; out List: WideString);
begin
RemotedFunctionality.ServerFolder_GetFilesList(RelativePath,List);
end;

function TMODELUserFunctionality.ServerFolder_AddFile(const RelativePath: WideString; const FileName: WideString; const FileData: TByteArray): boolean;
begin
Result:=RemotedFunctionality.ServerFolder_AddFile(RelativePath,FileName,FileData);
end;

function TMODELUserFunctionality.ServerFolder_RemoveFile(const RelativePath: WideString; const FileName: WideString): boolean;
begin
Result:=RemotedFunctionality.ServerFolder_RemoveFile(RelativePath,FileName);
end;

function TMODELUserFunctionality.ServerFolder_ReadFile(const RelativePath: WideString; const FileName: WideString; out FileData: TByteArray): boolean;
begin
Result:=RemotedFunctionality.ServerFolder_ReadFile(RelativePath,FileName,{out} FileData);
end;

function TMODELUserFunctionality.ServerFolder_AddSubFolder(const RelativePath: WideString; const SubFolderName: WideString): boolean;
begin
Result:=RemotedFunctionality.ServerFolder_AddSubFolder(RelativePath,SubFolderName);
end;

function TMODELUserFunctionality.ServerFolder_AddSubFolder(const RelativePath: WideString; const SubFolderName: WideString; const SubFolderData: TByteArray): boolean;
begin
Result:=RemotedFunctionality.ServerFolder_AddSubFolder1(RelativePath,SubFolderName,SubFolderData);
end;

function TMODELUserFunctionality.ServerFolder_RemoveSubFolder(const RelativePath: WideString; const SubFolderName: WideString): boolean;
begin
Result:=RemotedFunctionality.ServerFolder_RemoveSubFolder(RelativePath,SubFolderName);
end;

function TMODELUserFunctionality.ServerFolder_ReadSubFolder(const Version: integer; const RelativePath: WideString; const SubFolderName: WideString; const Excludes: WideString; out SubFolderData: TByteArray): boolean;
begin
Result:=RemotedFunctionality.ServerFolder_ReadSubFolder(Version,RelativePath,SubFolderName,Excludes,{out} SubFolderData);
end;

function TMODELUserFunctionality.ServerFolder_ExchangeSubFolder(const RelativePath: WideString; const SubFolderName: WideString; const SubFolderInData: TByteArray; const Excludes: WideString; out SubFolderOutData: TByteArray): boolean;
begin
Result:=RemotedFunctionality.ServerFolder_ExchangeSubFolder(RelativePath,SubFolderName,SubFolderInData,Excludes,SubFolderOutData);
end;

function TMODELUserFunctionality.Tasks_AddNew(const pPriority: integer; const pType: integer; const pService: integer; const pTaskData: TByteArray; const pComment: string): integer;
begin
Result:=RemotedFunctionality.Tasks_AddNew(pPriority,pType,pService,pTaskData,pComment);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TMODELUserFunctionality.Tasks_RemoveItem(const idTask: integer);
begin
RemotedFunctionality.Tasks_RemoveItem(idTask);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TMODELUserFunctionality.Tasks_Clear;
begin
RemotedFunctionality.Tasks_Clear;
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TMODELUserFunctionality.Tasks_GetData(const Version: integer; const flOnlyActive: boolean; out oData: TByteArray);
begin
RemotedFunctionality.Tasks_GetData(Version,flOnlyActive,oData);
end;

procedure TMODELUserFunctionality.Tasks_Item_GetTaskData(const idTask: integer; out oTaskData: TByteArray);
begin
RemotedFunctionality.Tasks_Item_GetTaskData(idTask,oTaskData);
end;

procedure TMODELUserFunctionality.Tasks_Item_GetResultData(const idTask: integer; out oResultData: TByteArray);
begin
RemotedFunctionality.Tasks_Item_GetResultData(idTask,oResultData);
end;

procedure TMODELUserFunctionality.Tasks_Item_SetPriority(const idTask: integer; const pPriority: integer);
begin
RemotedFunctionality.Tasks_Item_SetPriority(idTask,pPriority);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TMODELUserFunctionality.Tasks_Item_GetStatus(const idTask: integer; out oStatus: integer; out oStatusReason: integer; out oStatusComment: string);
begin
RemotedFunctionality.Tasks_Item_GetStatus(idTask,oStatus,oStatusReason,oStatusComment);
end;

procedure TMODELUserFunctionality.Tasks_Item_SetStatus(const idTask: integer; const pStatus: integer; const pStatusComment: string);
begin
RemotedFunctionality.Tasks_Item_SetStatus(idTask,pStatus,pStatusComment);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TMODELUserFunctionality.Tasks_Item_SetStatus(const idTask: integer; const pStatus: integer; const pStatusReason: integer; const pStatusComment: string);
begin
RemotedFunctionality.Tasks_Item_SetStatus1(idTask,pStatus,pStatusReason,pStatusComment);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TMODELUserFunctionality.Tasks_Item_SetResult(const idTask: integer; const pResultCode: integer; const pResultComment: string);
begin
RemotedFunctionality.Tasks_Item_SetResult(idTask,pResultCode,pResultComment);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TMODELUserFunctionality.Tasks_Item_SetResult(const idTask: integer; const pCompletedStatusReason: integer; pCompletedStatusComment: string; const pResultCode: integer; const pResultComment: string);
begin
RemotedFunctionality.Tasks_Item_SetResult1(idTask,pCompletedStatusReason,pCompletedStatusComment,pResultCode,pResultComment);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TMODELUserFunctionality.Tasks_Item_SetResult(const idTask: integer; const pResultCode: integer; const pResultData: TByteArray; const pResultComment: string);
begin
RemotedFunctionality.Tasks_Item_SetResult2(idTask,pResultCode,pResultData,pResultComment);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TMODELUserFunctionality.Tasks_Item_SetResult(const idTask: integer; const pCompletedStatusReason: integer; pCompletedStatusComment: string; const pResultCode: integer; const pResultData: TByteArray; const pResultComment: string);
begin
RemotedFunctionality.Tasks_Item_SetResult3(idTask,pCompletedStatusReason,pCompletedStatusComment,pResultCode,pResultData,pResultComment);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TMODELUserFunctionality.getBillingType: integer;
begin
Result:=RemotedFunctionality.getBillingType;
end;

procedure TMODELUserFunctionality.setBillingType(Value: integer);
begin
RemotedFunctionality.setBillingType(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TMODELUserFunctionality.Billing_Account: double;
begin
Result:=RemotedFunctionality.Billing_Account;
end;

function TMODELUserFunctionality.Billing_Transactions_AddNew(const pReason: integer; const pDelta: double; const pComment: string): integer;
begin
Result:=RemotedFunctionality.Billing_Transactions_AddNew(pReason,pDelta,pComment);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TMODELUserFunctionality.Billing_Transactions_Remove(const idTransaction: integer);
begin
RemotedFunctionality.Billing_Transactions_Remove(idTransaction);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TMODELUserFunctionality.Billing_Transactions_Clear;
begin
RemotedFunctionality.Billing_Transactions_Clear;
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TMODELUserFunctionality.Billing_Transactions_GetData(const Version: integer; out oData: TByteArray);
begin
RemotedFunctionality.Billing_Transactions_GetData(Version,oData);
end;

procedure TMODELUserFunctionality.ClientProgram_GetReleases(const ProgramID: integer; const Localization: WideString; out Data: TByteArray);
begin
RemotedFunctionality.ClientProgram_GetReleases(ProgramID,Localization,{out} Data);
end;


{TOrientedTTFVisualizationFunctionality}
procedure TOrientedTTFVisualizationFunctionality.SetParams(const pStr: WideString; const pFont_Width: Double; const pFont_Height: Double; const pFont_Name: WideString; const pCharInterval: Double; const pOrientation: integer);
begin
RemotedFunctionality.SetParams(pStr,pFont_Width,pFont_Height,pFont_Name,pCharInterval,pOrientation);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

{TTTFVisualizationFunctionality}
procedure TTTFVisualizationFunctionality.SetParams(const pStr: WideString; const pFont_Width: Double; const pFont_Height: Double; const pFont_Name: WideString);
begin
RemotedFunctionality.SetParams(pStr,pFont_Width,pFont_Height,pFont_Name);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

{TMODELUserFunctionality}
procedure TMODELUserFunctionality.SecurityKeys_AddKeyByCode(const Code: WideString);
begin
RemotedFunctionality.SecurityKeys_AddKeyByCode(Code);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TMODELUserFunctionality.SecurityKeys_RemoveKeyByCode(const Code: WideString);
begin
RemotedFunctionality.SecurityKeys_RemoveKeyByCode(Code);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TMODELUserFunctionality.SecurityKeys_CreateAndAddNewKey(const pName: WideString; const pInfo: WideString;  out KeyCode: WideString): integer;
begin
Result:=RemotedFunctionality.SecurityKeys_CreateAndAddNewKey(pName,pInfo, KeyCode);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

{TMODELUserFunctionality}
function TMODELUserFunctionality.IncomingMessages_GetUnread(out MessageList: TList): boolean;
var
  BA: TByteArray;
begin
Result:=RemotedFunctionality.IncomingMessages_GetUnread(BA);
if NOT Result then Exit; //. ->
ByteArray_CreateList(BA, MessageList);
end;

function TMODELUserFunctionality.IncomingMessages_GetUnread(out MessageList: TByteArray): boolean;
begin
Result:=RemotedFunctionality.IncomingMessages_GetUnread(MessageList);
end;

procedure TMODELUserFunctionality.IncomingMessages_GetMessagesSince(const TimeStamp: TDateTime; out MessageList: TList);
var
  BA: TByteArray;
begin
RemotedFunctionality.IncomingMessages_GetMessagesSince(TimeStamp, BA);
ByteArray_CreateList(BA, MessageList);
end;

procedure TMODELUserFunctionality.IncomingMessages_GetMessagesSince(const TimeStamp: TDateTime; out MessageList: TByteArray);
begin
RemotedFunctionality.IncomingMessages_GetMessagesSince(TimeStamp,MessageList);
end;

procedure TMODELUserFunctionality.IncomingMessages_GetMessage(const MessageID: integer; out TimeStamp: TDateTime; out Message: TClientBlobStream; out SenderID: integer);
var
  BA: TByteArray;
begin
RemotedFunctionality.IncomingMessages_GetMessage(MessageID, Double(TimeStamp),BA,SenderID);
ByteArray_CreateStream(BA, TMemoryStream(Message));
end;

procedure TMODELUserFunctionality.IncomingMessages_GetMessage(const MessageID: integer; out TimeStamp: Double; out Message: TByteArray; out SenderID: integer);
begin
RemotedFunctionality.IncomingMessages_GetMessage(MessageID, TimeStamp,Message,SenderID);
end;

procedure TMODELUserFunctionality.IncomingMessages_DeleteTo(const TimeStamp: TDateTime);
begin
RemotedFunctionality.IncomingMessages_DeleteTo(TimeStamp);
end;

procedure TMODELUserFunctionality.IncomingMessages_SendNew(const Message: TMemoryStream; const SenderID: integer);
var
  BA: TByteArray;
begin
ByteArray_PrepareFromStream(BA, Message);
RemotedFunctionality.IncomingMessages_SendNew(BA,SenderID);
end;

procedure TMODELUserFunctionality.IncomingMessages_SendNew(const Message: TByteArray; const SenderID: integer);
begin
RemotedFunctionality.IncomingMessages_SendNew(Message,SenderID);
end;

procedure TMODELUserFunctionality.GetStartObj(out idTStartObj,idStartObj: integer);
begin
RemotedFunctionality.GetStartObj(idTStartObj,idStartObj);
end;

procedure TMODELUserFunctionality.SetStartObj(const idTStartObj,idStartObj: integer);
begin
RemotedFunctionality.SetStartObj(idTStartObj,idStartObj);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TMODELUserFunctionality.getidSecurityFileForPrivate: integer;
begin
Result:=RemotedFunctionality.getidSecurityFileForPrivate;
end;

procedure TMODELUserFunctionality.setidSecurityFileForPrivate(Value: integer);
begin
RemotedFunctionality.setidSecurityFileForPrivate(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;


{TMessageBoardFunctionality}
function TMessageBoardFunctionality.CreateNewMessage: integer;
begin
Result:=RemotedFunctionality.CreateNewMessage;
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TMessageBoardFunctionality.SendMessage(const idMessage: integer);
begin
RemotedFunctionality.SendMessage(idMessage);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;


{TTForumMessageFunctionality}

Constructor TTForumMessageFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTForumMessage;
RemotedFunctionality:=TTForumMessageFunctionalityRemoted.Create(Self);
end
;
Destructor TTForumMessageFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


function TTForumMessageFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

procedure TTForumMessageFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

function TTForumMessageFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TForumMessageFunctionality.Create(Self, idComponent);
end
;

function TTForumMessageFunctionality.getName: string;
begin
Result:=nmTForumMessage;
end
;

function TTForumMessageFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TYPESDef\ForumMessage\ForumMessage.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

{TForumMessageFunctionality}

Constructor TForumMessageFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited;
_FunctionalityUserID:=0;
_Message:=nil;
RemotedFunctionality:=TForumMessageFunctionalityRemoted.Create(Self);
end
;
Destructor TForumMessageFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


procedure TForumMessageFunctionality.UpdateDATA;
begin
Inherited;
_idForum:=idForum;
_idUser:=idUser;
_SentTime:=SentTime;
_idForMessage:=idForMessage;
_LastModified:=LastModified;
FreeAndNil(_Message);
GetMessage(_Message);
end
;

procedure TForumMessageFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

function TForumMessageFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TForumMessagePanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;

function TForumMessageFunctionality.FunctionalityUserID: integer;
begin
if _FunctionalityUserID = 0
 then
  if UserName <> ''
   then begin
    with TMODELServerFunctionality(TComponentFunctionality_Create(idTMODELServer,0)) do
    try
    _FunctionalityUserID:=GetUserID(Self.UserName,Self.UserPassword);
    finally
    Release;
    end;
    end
   else
    _FunctionalityUserID:=Space.UserID;
Result:=_FunctionalityUserID;
end
;

procedure TForumMessageFunctionality.setidUser(Value: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

procedure TForumMessageFunctionality.Modified;
begin
Raise Exception.Create(SNotSupported); //. =>
end
;
function TForumMessageFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TForumMessageFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

function TForumMessageFunctionality.getidForum: integer;
begin
Result:=RemotedFunctionality.getidForum;
end;

procedure TForumMessageFunctionality.setidForum(Value: integer);
begin
RemotedFunctionality.setidForum(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TForumMessageFunctionality.idUser: integer;
begin
Result:=RemotedFunctionality.idUser;
end;

procedure TForumMessageFunctionality.Send;
begin
RemotedFunctionality.Send;
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TForumMessageFunctionality.SentTime: TDateTime;
begin
Result:=RemotedFunctionality.SentTime;
end;

function TForumMessageFunctionality.getidForMessage: integer;
begin
Result:=RemotedFunctionality.getidForMessage;
end;

procedure TForumMessageFunctionality.setidForMessage(Value: integer);
begin
RemotedFunctionality.setidForMessage(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TForumMessageFunctionality.LastModified: TDateTime;
begin
Result:=RemotedFunctionality.LastModified;
end;

procedure TForumMessageFunctionality.GetMessage(out Message: TMemoryStream);
var
  BA: TByteArray;
begin
GetMessage(BA);
ByteArray_CreateStream(BA, TMemoryStream(Message));
end;

procedure TForumMessageFunctionality.GetMessage(out Message: TByteArray);
begin
RemotedFunctionality.GetMessage(Message);
end;

procedure TForumMessageFunctionality.SetMessage(const Message: TMemoryStream);
var
  BA: TByteArray;
begin
ByteArray_PrepareFromStream(BA,Message);
SetMessage(BA);
end;

procedure TForumMessageFunctionality.SetMessage(const Message: TByteArray);
begin
RemotedFunctionality.SetMessage(Message);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TForumMessageFunctionality.ReplyMessageCount: integer;
begin
Result:=RemotedFunctionality.ReplyMessageCount;
end;

procedure TForumMessageFunctionality.GetReplyMessageList(out MessageList: TList);
var
  BA: TByteArray;
begin
GetReplyMessageList(BA);
ByteArray_CreateList(BA, MessageList);
end;

procedure TForumMessageFunctionality.GetReplyMessageList(out MessageList: TByteArray);
begin
RemotedFunctionality.GetReplyMessageList(MessageList);
end;


{TTForumFunctionality}

Constructor TTForumFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTForum;
RemotedFunctionality:=TTForumFunctionalityRemoted.Create(Self);
end
;
Destructor TTForumFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


function TTForumFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

procedure TTForumFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

function TTForumFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TForumFunctionality.Create(Self, idComponent);
end
;

function TTForumFunctionality.getName: string;
begin
Result:=nmTForum;
end
;

function TTForumFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TYPESDef\Forum\Forum.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

{TForumFunctionality}
Constructor TForumFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TForumFunctionalityRemoted.Create(Self);
end;

Destructor TForumFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


procedure TForumFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

function TForumFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TForumPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TForumFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

procedure TForumFunctionality.setName(Value: string);
begin
RemotedFunctionality.setName(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TForumFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

function TForumFunctionality.RootMessageCount: integer;
begin
Result:=RemotedFunctionality.RootMessageCount;
end;

procedure TForumFunctionality.GetRootMessageList(out MessageList: TList);
var
  BA: TByteArray;
begin
GetRootMessageList(BA);
ByteArray_CreateList(BA, MessageList);
end;

procedure TForumFunctionality.GetRootMessageList(out MessageList: TByteArray);
begin
RemotedFunctionality.GetRootMessageList(MessageList);
end;

function TForumFunctionality.MessageCount: integer;
begin
Result:=RemotedFunctionality.MessageCount;
end;

procedure TForumFunctionality.GetMessageList(out MessageList: TList);
var
  BA: TByteArray;
begin
GetMessageList(BA);
ByteArray_CreateList(BA, MessageList);
end;

procedure TForumFunctionality.GetMessageList(out MessageList: TByteArray);
begin
RemotedFunctionality.GetMessageList(MessageList);
end;

function TForumFunctionality.AddMessage(const pidUser: integer; const pidForMessage: integer): integer;
begin
Result:=RemotedFunctionality.AddMessage(pidUser,pidForMessage);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TForumFunctionality.DeleteOldMessages(const pMessageLifeTime: TDateTime);
begin
Raise Exception.Create(SNotSupported); //. =>
end
;
function TForumFunctionality.getMessageLifeTime: TDateTime;
begin
Result:=RemotedFunctionality.getMessageLifeTime;
end;

procedure TForumFunctionality.setMessageLifeTime(Value: TDateTime);
begin
RemotedFunctionality.setMessageLifeTime(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TForumFunctionality.DestroyMessage(const pidMessage: integer);
begin
RemotedFunctionality.DestroyMessage(pidMessage);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

{TSecurityFileFunctionality}
procedure TSecurityFileFunctionality.GetAssotiatedSecurityComponents(out SecurityComponents: TList);
var
  BA: TByteArray;
begin
GetAssotiatedSecurityComponents(BA);
ByteArray_CreateList(BA, SecurityComponents);
end;

procedure TSecurityFileFunctionality.GetAssotiatedSecurityComponents(out SecurityComponents: TByteArray);
begin
RemotedFunctionality.GetAssotiatedSecurityComponents(SecurityComponents);
end;

{TOrientedWMFVisualizationFunctionality}
function TOrientedWMFVisualizationFunctionality.DATASize: integer;
begin
Result:=Inherited DATASize;
end
;

function TWMFVisualizationFunctionality.DATASize: integer;
begin
Result:=Inherited DATASize;
end
;

{TPictureVisualizationFunctionality}
function TPictureVisualizationFunctionality.DATASize: integer;
begin
Result:=Inherited DATASize;
end
;

{TWNDVisualizationFunctionality}
function TWNDVisualizationFunctionality.DATASize: integer;
begin
Result:=Inherited DATASize;
end
;

{TMRKVisualizationFunctionality}
function TMRKVisualizationFunctionality.DATASize: integer;
begin
Result:=Inherited DATASize;
end
;

{TOrientedPictureVisualizationFunctionality}
function TOrientedPictureVisualizationFunctionality.DATASize: integer;
begin
Result:=Inherited DATASize;
end
;

{TQDCVisualizationFunctionality}
function TQDCVisualizationFunctionality.DATASize: integer;
begin
Result:=Inherited DATASize;
end
;

{TBuffered3DVisualizationFunctionality}
function TBuffered3DVisualizationFunctionality.DATASize: integer;
begin
Result:=Inherited DATASize;
end
;

{TOLEVisualizationFunctionality}
function TOLEVisualizationFunctionality.DATASize: integer;
begin
Result:=Inherited DATASize;
end
;

{THTMLVisualizationFunctionality}
function THTMLVisualizationFunctionality.DATASize: integer;
begin
Result:=Inherited DATASize;
end
;

{TTCoComponentTypeFunctionality}
procedure TTCoComponentTypeFunctionality.GetInstanceListByFileType(const FileType: shortstring; out List: TList);
var
  BA: TByteArray;
begin
RemotedFunctionality.GetInstanceListByFileType(FileType, BA); 
ByteArray_CreateList(BA, List);
end;

procedure TTCoComponentTypeFunctionality.GetInstanceListByFileType(const FileType: WideString; out List: TByteArray);
begin 
RemotedFunctionality.GetInstanceListByFileType(FileType, List); 
end;


{TCoComponentTypeFunctionality}
function TCoComponentTypeFunctionality.getFileType: shortstring;
begin
Result:=RemotedFunctionality.getFileType;
end;

procedure TCoComponentTypeFunctionality.setFileType(Value: shortstring);
begin
RemotedFunctionality.setFileType(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TCoComponentTypeFunctionality.getCoComponentPrototypeID: integer;
begin
Result:=RemotedFunctionality.getCoComponentPrototypeID;
end;

procedure TCoComponentTypeFunctionality.setCoComponentPrototypeID(Value: integer);
begin
RemotedFunctionality.setCoComponentPrototypeID(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

{THREFVisualizationFunctionality}
function THREFVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=RemotedFunctionality.GetOwner(idTOwner,idOwner);
end
;

{TOrientedWMFVisualizationFunctionality}
procedure TOrientedWMFVisualizationFunctionality.GetJPEGDATA(out DATAStream: TMemoryStream; const pWidth: integer; const pHeight: integer; const pQuality: integer; const MaxSize: integer);
var
  BA: TByteArray;
begin
GetJPEGDATA(BA,pWidth,pHeight,pQuality,MaxSize);
ByteArray_CreateStream(BA, DATAStream);
end;

procedure TOrientedWMFVisualizationFunctionality.GetJPEGDATA(out DATAStream: TByteArray; const pWidth: integer; const pHeight: integer; const pQuality: integer; const MaxSize: integer);
begin
RemotedFunctionality.GetJPEGDATA(DATAStream,pWidth,pHeight,pQuality,MaxSize);
end;

{TWMFVisualizationFunctionality}
procedure TWMFVisualizationFunctionality.GetJPEGDATA(out DATAStream: TMemoryStream; const pWidth: integer; const pHeight: integer; const pQuality: integer; const MaxSize: integer);
var
  BA: TByteArray;
begin
GetJPEGDATA(BA,pWidth,pHeight,pQuality,MaxSize);
ByteArray_CreateStream(BA, DATAStream);
end;

procedure TWMFVisualizationFunctionality.GetJPEGDATA(out DATAStream: TByteArray; const pWidth: integer; const pHeight: integer; const pQuality: integer; const MaxSize: integer);
begin
RemotedFunctionality.GetJPEGDATA(DATAStream,pWidth,pHeight,pQuality,MaxSize);
end;


{TTCoVisualizationFunctionality}

Constructor TTCoVisualizationFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTCoVisualization;
RemotedFunctionality:=TTCoVisualizationFunctionalityRemoted.Create(Self);
end
;
Destructor TTCoVisualizationFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


function TTCoVisualizationFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

function TTCoVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TCoVisualizationFunctionality.Create(Self, idComponent);
end
;

function TTCoVisualizationFunctionality.getName: string;
begin
Result:=nmTCoVisualization;
end
;

function TTCoVisualizationFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TypesDef\CoVisualization\CoVisualization.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

function TTCoVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TObjectVisualization.Create;
with Result do begin
Color:=clWhite;
Width:=0;
flLoop:=false;
AddPoint(-50,0);
AddPoint(50,0);
end;
end
;

{TCoVisualizationFunctionality}
Constructor TCoVisualizationFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TCoVisualizationFunctionalityRemoted.Create(Self);
end;

Destructor TCoVisualizationFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


procedure TCoVisualizationFunctionality.ToClone(out idClone: integer);
begin
RemotedFunctionality.ToClone({out} idClone);
//. update local TypesSystem and representations
Space.StayUpToDate;
end
;

procedure TCoVisualizationFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

procedure TCoVisualizationFunctionality.CloneData(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

procedure TCoVisualizationFunctionality.DestroyData;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TCoVisualizationFunctionality.LoadFromFile(const FileName: string);
var
  I: integer;
  MS: TMemoryStream;
begin
CheckUserOperation(idWriteOperation);
MS:=TMemoryStream.Create;
with MS do
try
LoadFromFile(FileName);
SetSpace(MS);
finally
Destroy;
end;
end
;

function TCoVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
var
  SpacePtr: pointer;
  SpaceSize: integer;

  procedure Obj_Show;
  var
    SaveBrushStyle: TBrushStyle;
  begin
  with pCanvas.Pen do begin
  Color:=pFigure.Color;
  Style:=psSolid;
  Width:=1;
  end;
  if (pFigure.CountScreenNodes > 0)
   then with pFigure do begin
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
  //.
  if (pAdditionalFigure.CountScreenNodes > 0)
   then with pAdditionalFigure do
    if (ColorFill <> clNone)
     then begin
      pCanvas.Pen.Width:=1;
      pCanvas.Brush.Color:=ColorFill;
      pCanvas.Polygon(Slice(ScreenNodes, CountScreenNodes));
      end;
  if (pFigure.flSelected)
   then begin
    if (pFigure.CountScreenNodes > 0)
     then with pFigure do begin
      with pCanvas do begin
      Pen.Color:=clSelectedObj;
      Pen.Width:=1;
      PolyLine(Slice(ScreenNodes, CountScreenNodes));
      end;
      if flagLoop AND flagFill
       then with pCanvas do begin
        Brush.Color:=clSelectedObj;
        SaveBrushStyle:=Brush.Style;
        Brush.Style:=bsCross;
        Polygon(Slice(ScreenNodes, CountScreenNodes));
        Brush.Style:=SaveBrushStyle;
        end;
      end;
    if (pAdditionalFigure.CountScreenNodes > 0)
     then with pAdditionalFigure do begin
      with pCanvas do begin
      Pen.Color:=clSelectedObj;
      Pen.Width:=1;
      PolyLine(Slice(ScreenNodes, CountScreenNodes));
      end;
      end;
    end;
  end;

  procedure TypesSystem__Cache_ProcessObj(const ptrObj: TPtr);
  var
    Obj: TSpaceObj;
    ptrOwnerObj: TPtr;
  begin
  Obj:=TSpaceObj(Pointer(Integer(SpacePtr)+ptrObj)^);
  if ((Obj.idObj <> 0) AND NOT TTypesSystem(Space.TypesSystem).Context_IsItemExist(Obj.idTObj,Obj.idObj))
   then TypesSystem.Caching_AddObject(Obj.idTObj,Obj.idObj);
  //. process own objects ...
  ptrOwnerObj:=Obj.ptrListOwnerObj;
  while ptrOwnerObj <> nilPtr do begin
    TypesSystem__Cache_ProcessObj(ptrOwnerObj);
    //.
    ptrOwnerObj:=TPtr(Pointer(Integer(SpacePtr)+ptrOwnerObj)^);
    end;
  end;

  procedure ReflectObj(const ptrObj: TPtr; const TransformWindow: TReflectionWindow; const OldClippingRegion: HRGN);

    procedure Obj_Show;
    var
      SaveBrushStyle: TBrushStyle;
    begin
    with pCanvas.Pen do begin
    Color:=TSystemTCoVisualization(Self.TypeSystem).Figure.Color;
    Style:=psSolid;
    Width:=1;
    end;
    if (TSystemTCoVisualization(Self.TypeSystem).Figure.CountScreenNodes > 0)
     then with TSystemTCoVisualization(Self.TypeSystem).Figure do begin
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
    //.
    if (TSystemTCoVisualization(Self.TypeSystem).AdditionalFigure.CountScreenNodes > 0)
     then with TSystemTCoVisualization(Self.TypeSystem).AdditionalFigure do
      if (ColorFill <> clNone)
       then begin
        pCanvas.Pen.Width:=1;
        pCanvas.Brush.Color:=ColorFill;
        pCanvas.Polygon(Slice(ScreenNodes, CountScreenNodes));
        end;
    if (TSystemTCoVisualization(Self.TypeSystem).Figure.flSelected)
     then begin
      if (TSystemTCoVisualization(Self.TypeSystem).Figure.CountScreenNodes > 0)
       then with TSystemTCoVisualization(Self.TypeSystem).Figure do begin
        with pCanvas do begin
        Pen.Color:=clSelectedObj;
        Pen.Width:=1;
        PolyLine(Slice(ScreenNodes, CountScreenNodes));
        end;
        if flagLoop AND flagFill
         then with pCanvas do begin
          Brush.Color:=clSelectedObj;
          SaveBrushStyle:=Brush.Style;
          Brush.Style:=bsCross;
          Polygon(Slice(ScreenNodes, CountScreenNodes));
          Brush.Style:=SaveBrushStyle;
          end;
        end;
      if (TSystemTCoVisualization(Self.TypeSystem).AdditionalFigure.CountScreenNodes > 0)
       then with TSystemTCoVisualization(Self.TypeSystem).AdditionalFigure do begin
        with pCanvas do begin
        Pen.Color:=clSelectedObj;
        Pen.Width:=1;
        PolyLine(Slice(ScreenNodes, CountScreenNodes));
        end;
        end;
      end;
    end;

    procedure Obj_PrepareFigures(const ptrObject: TPtr; const Obj: TSpaceObj);

      procedure ProcessPoint(X,Y: Extended; out Node: unitReflector.TNode);
      var
        QdA2: Extended;
        X_C,X_QdC,X_A1,X_QdB2: Extended;
        Y_C,Y_QdC,Y_A1,Y_QdB2: Extended;
      begin
      with TransformWindow do begin
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

      Node.X:=Xmn+X_A1/X_C*(Xmx-Xmn);
      Node.Y:=Ymn+Y_A1/Y_C*(Ymx-Ymn);
      end;
      end;

    var
      ptrPoint: TPtr;
      Point: TPoint;
      ptrOwnerObj: TPtr;
      Node: unitReflector.TNode;
    begin
    with TSystemTCoVisualization(Self.TypeSystem).Figure do begin
    Clear;
    ptrObj:=ptrObject;
    idTObj:=Obj.idTObj;
    idObj:=Obj.idObj;
    flagLoop:=Obj.flagLoop;
    Color:=Obj.Color;
    flagFill:=Obj.flagFill;
    ColorFill:=Obj.ColorFill;
    Width:=Obj.Width;
    flSelected:=false;
    end;
    TSystemTCoVisualization(Self.TypeSystem).AdditionalFigure.Clear;
    ptrPoint:=Obj.ptrFirstPoint;
    while ptrPoint <> nilPtr do begin
      Point:=TPoint(Pointer(Integer(SpacePtr)+ptrPoint)^);
      ProcessPoint(Point.X,Point.Y, Node);
      TSystemTCoVisualization(Self.TypeSystem).Figure.Insert(Node);
      //.
      ptrPoint:=Point.ptrNextObj;
      end;
    if (Obj.Width > 0)
     then with TSystemTCoVisualization(Self.TypeSystem).AdditionalFigure do begin
      Assign(TSystemTCoVisualization(Self.TypeSystem).Figure);
      if ValidateAsPolyLine(TransformWindow.Scale)
       then begin
        AttractToLimits(pAttractionWindow);
        Optimize;
        end;
      end;
    TSystemTCoVisualization(Self.TypeSystem).Figure.AttractToLimits(pAttractionWindow);
    TSystemTCoVisualization(Self.TypeSystem).Figure.Optimize;
    end;

  var
    Item: TItemLayReflect;
    Obj: TSpaceObj;
    Detail: TSpaceObj;
    flClipping: boolean;
    flClipVisible: boolean;
    ClippingRegion,Rgn: HRGN;
    ptrOwnerObj: TPtr;
    ReflectResult: boolean;
  begin
  Obj:=TSpaceObj(Pointer(Integer(SpacePtr)+ptrObj)^);
  //. clipping if necessary
  flClipping:=false;
  flClipVisible:=false;
  try
  if (Obj.Color = clNone)
   then begin
    ptrOwnerObj:=Obj.ptrListOwnerObj;
    while (ptrOwnerObj <> nilPtr) do begin
      Detail:=TSpaceObj(Pointer(Integer(SpacePtr)+ptrOwnerObj)^);
      if (Detail.flagLoop AND Detail.flagFill AND (Detail.ColorFill = clNone))
       then begin
        flClipping:=true;
        //. prepare clipping figure
        Obj_PrepareFigures(ptrOwnerObj,Detail);
        //.
        if (TSystemTCoVisualization(Self.TypeSystem).Figure.CountScreenNodes > 0)
         then
          if (NOT flClipVisible)
           then begin
            ClippingRegion:=CreatePolygonRgn(TSystemTCoVisualization(Self.TypeSystem).Figure.ScreenNodes, TSystemTCoVisualization(Self.TypeSystem).Figure.CountScreenNodes, ALTERNATE);
            flClipVisible:=true;
            end
           else begin
            Rgn:=CreatePolygonRgn(TSystemTCoVisualization(Self.TypeSystem).Figure.ScreenNodes, TSystemTCoVisualization(Self.TypeSystem).Figure.CountScreenNodes, ALTERNATE);
            CombineRgn(ClippingRegion, ClippingRegion,Rgn, RGN_XOR);
            DeleteObject(Rgn);
            end;
        end;
      //.
      ptrOwnerObj:=Detail.ptrNextObj;
      end;
    if (flClipVisible) then ExtSelectClipRgn(pCanvas.Handle, ClippingRegion, RGN_AND);
    end;
  //.
  if (NOT flClipping OR flClipVisible)
   then begin
    Obj_PrepareFigures(ptrObj,Obj);
    if (TSystemTCoVisualization(Self.TypeSystem).AdditionalFigure.CountScreenNodes > 0) OR (TSystemTCoVisualization(Self.TypeSystem).Figure.CountScreenNodes > 0)
     then begin
      //. do reflect
      pCanvas.Lock;
      try
      with TSystemTCoVisualization(Self.TypeSystem).Figure do
      try
      with TBase2DVisualizationFunctionality(TComponentFunctionality_Create(Obj.idTObj,Obj.idObj)) do
      try
      FReflector:=TReflector(Self.FReflector);
      //. reflecting object
      ReflectResult:=Reflect(TSystemTCoVisualization(Self.TypeSystem).Figure,TSystemTCoVisualization(Self.TypeSystem).AdditionalFigure,TransformWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
      finally
      Release;
      end;
      except
        ReflectResult:=false;
        end;
      if (NOT ReflectResult) then Obj_Show();
      finally
      pCanvas.Unlock;
      end;
      end;
    end;
  finally
  //. end of clipping
  if (flClipVisible)
   then begin
    SelectClipRgn(pCanvas.Handle, OldClippingRegion);
    DeleteObject(ClippingRegion);
    end;
  end;
  //. process own objects ...
  ptrOwnerObj:=Obj.ptrListOwnerObj;
  while ptrOwnerObj <> nilPtr do begin
    ReflectObj(ptrOwnerObj, TransformWindow, OldClippingRegion);
    //.
    ptrOwnerObj:=TPtr(Pointer(Integer(SpacePtr)+ptrOwnerObj)^);
    end;
  end;

  procedure RotateByAngleFrom0(var X,Y: Extended; const Angle: Extended);
  var
    Xbind,Ybind: Extended;
    _X,_Y: Extended;
  begin
  Xbind:=0; Ybind:=0;
  _X:=Xbind+(X-Xbind)*Cos(Angle)+(Y-Ybind)*(-Sin(Angle));
  _Y:=Ybind+(X-Xbind)*Sin(Angle)+(Y-Ybind)*Cos(Angle);
  X:=_X; Y:=_Y;
  end;

var
  ptrItem: pointer;
  ptrObj: TPtr;
  ptrPoint: TPtr;
  P0,P1: TPoint;
  L: Extended;
  W: Extended;
  ContainerWidth,ContainerHeight: double;
  RWS: TReflectionWindowStrucEx;
  TransformWindow: TReflectionWindow;
  KX,KY,KScale: Extended;
  KRW: Extended;
  X0,Y0, X1,Y1: Extended;
  diffX1X0,diffY1Y0: Extended;
  Alfa: Extended;
  ShiftX,ShiftY: Extended;
  dX,dY: Extended;
  ptr: pointer;
  Obj: TSpaceObj;
  OldClippingRegion: HRGN;
begin
Result:=false;
//.
if ((FReflector <> nil) AND (TReflector(FReflector).Mode = rmEditing)) then Obj_Show();
SpacePtr:=nil;
TypeSystem.Lock.Enter;
try
if NOT TSystemTCoVisualization(Self.TypeSystem).Cash.GetItem(Self.idObj, ptrItem) then Exit; //. ->
with TItemTCoVisualizationCash(ptrItem^) do
if ((_Space <> nil) AND (_Space.Size <> 0))
 then begin
  SpaceSize:=_Space.Size;
  GetMem(SpacePtr,SpaceSize);
  _Space.Position:=0;
  _Space.Read(SpacePtr^,SpaceSize);
  end;
finally
TypeSystem.Lock.Leave;
end;
if (SpacePtr <> nil)
 then begin
  try
  //.
  Space.ReadObj(Obj,SizeOf(Obj),pFigure.ptrObj);
  ptrPoint:=Obj.ptrFirstPoint;
  if (ptrPoint = nilPtr) then Raise Exception.Create('could not get base point #0'); //. =>
  Space.ReadObj(P0,SizeOf(P0),ptrPoint);
  ptrPoint:=P0.ptrNextObj;
  if (ptrPoint = nilPtr) then Raise Exception.Create('could not get base point #1'); //. =>
  Space.ReadObj(P1,SizeOf(P1),ptrPoint);
  //.
  X0:=pFigure.Nodes[0].X; Y0:=pFigure.Nodes[0].Y;
  X1:=pFigure.Nodes[1].X; Y1:=pFigure.Nodes[1].Y;
  diffX1X0:=X1-X0;
  diffY1Y0:=Y1-Y0;
  //.
  L:=Sqrt(sqr(P1.X-P0.X)+sqr(P1.Y-P0.Y));
  W:=Sqrt(sqr(diffX1X0)+sqr(diffY1Y0));
  ContainerWidth:=Double(Pointer(Integer(SpacePtr)+SpaceSize-2*SizeOf(double))^);
  ContainerHeight:=Double(Pointer(Integer(SpacePtr)+SpaceSize-SizeOf(double))^);
  KX:=ContainerWidth/L; KY:=ContainerHeight/Obj.Width;
  if (KX > KY) then KScale:=KX else KScale:=KY;
  pReflectionWindow.GetWindow(true,RWS);
  TransformWindow:=TReflectionWindow.Create(Space,RWS);
  try
  //. scaling
  KScale:=(((TransformWindow.Xmx-TransformWindow.Xmn)/ContainerWidth)/(W/L))*KScale;
  KRW:=Sqrt((sqr(RWS.X3-RWS.X0)+sqr(RWS.Y3-RWS.Y0))/(sqr(RWS.X1-RWS.X0)+sqr(RWS.Y1-RWS.Y0)));
  TransformWindow.X3:=-((ContainerWidth/2)*KScale)*cfTransMeter; TransformWindow.Y3:=-(((ContainerWidth*KRW)/2)*KScale)*cfTransMeter;
  TransformWindow.X1:=-TransformWindow.X3; TransformWindow.Y1:=-TransformWindow.Y3;
  TransformWindow.X0:=TransformWindow.X3; TransformWindow.Y0:=TransformWindow.Y1;
  TransformWindow.X2:=TransformWindow.X1; TransformWindow.Y2:=TransformWindow.Y3;
  //. rotating
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
  Alfa:=-Alfa;
  RotateByAngleFrom0(TransformWindow.X0,TransformWindow.Y0,Alfa);
  RotateByAngleFrom0(TransformWindow.X1,TransformWindow.Y1,Alfa);
  RotateByAngleFrom0(TransformWindow.X2,TransformWindow.Y2,Alfa);
  RotateByAngleFrom0(TransformWindow.X3,TransformWindow.Y3,Alfa);
  //. moving
  ShiftX:=(X0+diffX1X0/2-TransformWindow.Xmd);
  ShiftY:=(Y0+diffY1Y0/2-TransformWindow.Ymd);
  dX:=ShiftX*(TransformWindow.X1-TransformWindow.X0)/(TransformWindow.Xmx-TransformWindow.Xmn)+ShiftY*(TransformWindow.X3-TransformWindow.X0)/(TransformWindow.Ymx-TransformWindow.Ymn);
  dY:=ShiftX*(TransformWindow.Y1-TransformWindow.Y0)/(TransformWindow.Xmx-TransformWindow.Xmn)+ShiftY*(TransformWindow.Y3-TransformWindow.Y0)/(TransformWindow.Ymx-TransformWindow.Ymn);
  TransformWindow.X0:=TransformWindow.X0-dX; TransformWindow.Y0:=TransformWindow.Y0-dY;
  TransformWindow.X1:=TransformWindow.X1-dX; TransformWindow.Y1:=TransformWindow.Y1-dY;
  TransformWindow.X2:=TransformWindow.X2-dX; TransformWindow.Y2:=TransformWindow.Y2-dY;
  TransformWindow.X3:=TransformWindow.X3-dX; TransformWindow.Y3:=TransformWindow.Y3-dY;
  //.
  TransformWindow.Update();
  //. visualization caching
  TypesSystem.Caching_Start;
  try
  ptrObj:=0;
  while (ptrObj <> nilPtr) do begin
    TypesSystem__Cache_ProcessObj(ptrObj);
    //. next
    ptr:=Pointer(Integer(SpacePtr)+ptrObj);
    ptrObj:=TPtr(ptr^);
    end;
  finally
  TypesSystem.Caching_Finish;
  end;
  //. reflecting ...
  if (GetClipRgn(pCanvas.Handle, OldClippingRegion) = -1) then OldClippingRegion:=0;
  try
  ptrObj:=0;
  while (ptrObj <> nilPtr) do begin
    ReflectObj(ptrObj, TransformWindow, OldClippingRegion);
    //. next
    ptr:=Pointer(Integer(SpacePtr)+ptrObj);
    ptrObj:=TPtr(ptr^);
    end;
  finally
  SelectClipRgn(pCanvas.Handle, 0);
  if (OldClippingRegion <> 0) then DeleteObject(OldClippingRegion);
  end;
  finally
  TransformWindow.Destroy;
  end;
  finally
  FreeMem(SpacePtr,SpaceSize);
  end;
  end;
Result:=true;
end
;

function TCoVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TCoVisualizationPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;

function TCoVisualizationFunctionality.DATASize: integer;
begin
Result:=Inherited DATASize;
end
;
function TCoVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=RemotedFunctionality.GetOwner(idTOwner,idOwner);
end;

function TCoVisualizationFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TCoVisualizationFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

procedure TCoVisualizationFunctionality.GetSpace(out DATAStream: TMemoryStream);
var
  BA: TByteArray;
begin
GetSpace(BA);
ByteArray_CreateStream(BA, DATAStream);
end;

procedure TCoVisualizationFunctionality.GetSpace(out DATAStream: TMemoryStream; const MaxSize: integer);
var
  BA: TByteArray;
begin
GetSpace(BA,MaxSize);
ByteArray_CreateStream(BA, DATAStream);
end;

procedure TCoVisualizationFunctionality.GetSpace(out DATAStream: TByteArray);
begin
RemotedFunctionality.GetSpace(DATAStream);
end;

procedure TCoVisualizationFunctionality.GetSpace(out DATAStream: TByteArray; const MaxSize: integer);
begin
RemotedFunctionality.GetSpace1(DATAStream,MaxSize);
end;

procedure TCoVisualizationFunctionality.SetSpace(DATAStream: TMemoryStream);
var
  BA: TByteArray;
begin
ByteArray_PrepareFromStream(BA,DATAStream);
SetSpace(BA);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TCoVisualizationFunctionality.SetSpace(DATAStream: TByteArray);
begin
RemotedFunctionality.SetSpace(DATAStream);
end;

function TCoVisualizationFunctionality.getDATAFileID: integer;
begin
Result:=RemotedFunctionality.getDATAFileID;
end;

procedure TCoVisualizationFunctionality.setDATAFileID(Value: integer);
begin
setDATAFileID(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TCoVisualizationFunctionality.DATAFile_Clear;
begin
Raise Exception.Create(SNotSupported); //. =>
end
;
procedure TCoVisualizationFunctionality.UpdateContainer(out oContainer: TExtendedContainerCoord);
begin
Raise Exception.Create(SNotSupported); //. =>
end
;
procedure TCoVisualizationFunctionality.Pack;
begin
RemotedFunctionality.Pack;
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TCoVisualizationFunctionality.UnPack;
begin
RemotedFunctionality.UnPack;
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TCoVisualizationFunctionality.IsPacked: boolean;
begin
Result:=RemotedFunctionality.IsPacked;
end;

function TCoVisualizationFunctionality.GetOwnSpaceHINTVisualization(out idHINTVisualization: integer): boolean;
begin
Result:=RemotedFunctionality.GetOwnSpaceHINTVisualization({out} idHINTVisualization);
end;

function TCoVisualizationFunctionality.GetOwnSpaceHINTVisualizationLocally(out idHINTVisualization: integer): boolean;

  function ProcessObj(const SpacePtr: pointer; const ptrObj: TPtr; out idHINTVisualization: integer): boolean;
  var
    Obj: TSpaceObj;
    ptrOwnerObj: TPtr;
  begin
  Result:=false;
  Obj:=TSpaceObj(Pointer(Integer(SpacePtr)+ptrObj)^);
  if (Obj.idTObj = idTHINTVisualization)
   then begin
    idHINTVisualization:=Obj.idObj;
    Result:=true;
    Exit; //. ->
    end;
  //. process own objects ...
  ptrOwnerObj:=Obj.ptrListOwnerObj;
  while (ptrOwnerObj <> nilPtr) do begin
    if (ProcessObj(SpacePtr,ptrOwnerObj,{out} idHINTVisualization))
     then begin
      Result:=true;
      Exit; //. ->
      end;
    //.
    ptrOwnerObj:=TPtr(Pointer(Integer(SpacePtr)+ptrOwnerObj)^);
    end;
  end;

var
  ptrItem: pointer;
  SpacePtr: pointer;
  ptrObj: TPtr;
  ptr: pointer;
begin
Result:=false;
TypeSystem.Lock.Enter;
try
if NOT TSystemTCoVisualization(TypeSystem).Cash.GetItem(Self.idObj, ptrItem) then Exit; //. ->
with TItemTCoVisualizationCash(ptrItem^) do
if ((_Space <> nil) AND (_Space.Size <> 0))
 then begin
  SpacePtr:=_Space.Memory;
  //.
  ptrObj:=0;
  while (ptrObj <> nilPtr) do begin
    if (ProcessObj(SpacePtr,ptrObj,{out} idHINTVisualization))
     then begin
      Result:=true;
      Exit; //. ->
      end;
    //. next
    ptr:=Pointer(Integer(SpacePtr)+ptrObj);
    ptrObj:=TPtr(ptr^);
    end;
  end;
finally
TypeSystem.Lock.Leave;
end;
end
;



{TPictureVisualizationFunctionality}
procedure TPictureVisualizationFunctionality.GetParams(out VisibleMinScale: double; out VisibleMaxScale: double);
begin
RemotedFunctionality.GetParams(VisibleMinScale,VisibleMaxScale);
end;

procedure TPictureVisualizationFunctionality.SetParams(const VisibleMinScale: double; const VisibleMaxScale: double);
begin
RemotedFunctionality.SetParams(VisibleMinScale,VisibleMaxScale);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;



{TTDetailedPictureVisualizationFunctionality}
Constructor TTDetailedPictureVisualizationFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTDetailedPictureVisualization;
RemotedFunctionality:=TTDetailedPictureVisualizationFunctionalityRemoted.Create(Self);
end
;
Destructor TTDetailedPictureVisualizationFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


function TTDetailedPictureVisualizationFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

function TTDetailedPictureVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TDetailedPictureVisualizationFunctionality.Create(Self, idComponent);
end
;

function TTDetailedPictureVisualizationFunctionality.getName: string;
begin
Result:=nmTDetailedPictureVisualization;
end
;

function TTDetailedPictureVisualizationFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TypesDef\DetailedPictureVisualization\DetailedPictureVisualization.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

function TTDetailedPictureVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TObjectVisualization.Create;
with Result do begin
Color:=clWhite;
Width:=0;
flLoop:=false;
AddPoint(-50,0);
AddPoint(50,0);
end;
end
;

function TTDetailedPictureVisualizationFunctionality.CheckImportInstance(ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

{TDetailedPictureVisualizationFunctionality}
Constructor TDetailedPictureVisualizationFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TDetailedPictureVisualizationFunctionalityRemoted.Create(Self);
end;

Destructor TDetailedPictureVisualizationFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


procedure TDetailedPictureVisualizationFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

procedure TDetailedPictureVisualizationFunctionality.CloneData(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

procedure TDetailedPictureVisualizationFunctionality.DestroyData;
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

function TDetailedPictureVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
const
  MaxSegmentsForProcess = 256;
  MaxCompositionDepth = 2;
  MaxSegmentsForCompositionProcess = 64;

type
  TCompositionLevel = record
    LevelPtr: pointer;
    SegmentsMap: pointer;
    SegmentsMapSizeX,SegmentsMapSizeY: integer;
    SegmentsMapSize: integer;
    SegmentsMapLength: integer;
    Count: integer;                                           
    SW,SH: Double;
    XIndexMin,XIndexMax,YIndexMin,YIndexMax: integer;
    flAllItemsExists: boolean;
  end;

  procedure GetReflectionWindowLevelContainerIndexes(const X0,Y0: double; const X1,Y1: double; const X3,Y3: double; const pReflectionWindow: TReflectionWindow; const SW,SH: double; out XIndexMin,XIndexMax,YIndexMin,YIndexMax: integer);

    procedure ProcessPoint(X,Y: double; out dX,dY: double);
    var
      QdA2: Extended;
      X_C,X_QdC,X_A1,X_QdB2: Extended;
      Y_C,Y_QdC,Y_A1,Y_QdB2: Extended;
    begin
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
    dX:=X_A1;
    dY:=Y_A1;
    end;

  var
    dX,dY: double;
    dXMin,dYMin,dXMax,dYMax: double;
  begin
  pReflectionWindow.Lock.Enter;
  try
  ProcessPoint(pReflectionWindow.Xmn,pReflectionWindow.Ymn, dXMin,dYMin);
  dXMax:=dXMin; dYMax:=dYMin;
  ProcessPoint(pReflectionWindow.Xmx,pReflectionWindow.Ymn, dX,dY);
  if (dX < dXMin)
   then dXMin:=dX
   else
    if (dX > dXMax)
     then dXMax:=dX;
  if (dY < dYMin)
   then dYMin:=dY
   else
    if (dY > dYMax)
     then dYMax:=dY;
  ProcessPoint(pReflectionWindow.Xmx,pReflectionWindow.Ymx, dX,dY);
  if (dX < dXMin)
   then dXMin:=dX
   else
    if (dX > dXMax)
     then dXMax:=dX;
  if (dY < dYMin)
   then dYMin:=dY
   else
    if (dY > dYMax)
     then dYMax:=dY;
  ProcessPoint(pReflectionWindow.Xmn,pReflectionWindow.Ymx, dX,dY);
  if (dX < dXMin)
   then dXMin:=dX
   else
    if (dX > dXMax)
     then dXMax:=dX;
  if (dY < dYMin)
   then dYMin:=dY
   else
    if (dY > dYMax)
     then dYMax:=dY;
  finally
  pReflectionWindow.Lock.Leave;
  end;
  //.
  XIndexMin:=Trunc(dXMin/SW); XIndexMax:=Trunc(dXMax/SW);
  YIndexMin:=Trunc(dYMin/SH); YIndexMax:=Trunc(dYMax/SH);
  end;

  procedure ClearBackground(const Canvas: TCanvas; const Image: TBitmap; const pFigure: TFigureWinRefl);
  type
    PPoints = ^TPoints;
    TPoints = array[0..0] of Windows.TPoint;
  var
    LogBrush: TLogBrush;
    BH: HBrush;
    LogPen: TLogPen;
    PH: HPen;
  begin
  Canvas.Lock;
  try
  Image.Canvas.Lock;
  try
  with LogBrush do begin
  lbStyle:=BS_PATTERN;
  lbHatch:=Image.Handle; 
  lbColor:=ColorToRGB(pFigure.ColorFill);
  end;
  BH:=CreateBrushIndirect(LogBrush);
  with LogPen do begin
  lopnStyle:=PS_NULL;
  lopnWidth.X:=1;
  lopnColor:=ColorToRGB(pFigure.Color);
  end;
  PH:=CreatePenIndirect(LogPen);
  try
  SelectObject(Canvas.Handle,BH);
  SelectObject(Canvas.Handle,PH);
  try
  Windows.Polygon(Canvas.Handle,PPoints(@pFigure.ScreenNodes)^,pFigure.CountScreenNodes);
  finally
  SelectObject(Canvas.Handle,Canvas.Brush.Handle);
  SelectObject(Canvas.Handle,Canvas.Pen.Handle);
  end;
  finally
  DeleteObject(PH);
  DeleteObject(BH);
  end;
  finally
  Image.Canvas.Unlock;
  end;
  finally
  Canvas.Unlock;
  end;
  end;

  function DrawUsingGDIPlus(const CanvasHandle: THandle; const BMP: TBitmap; const SrcWidth,SrcHeight: integer): boolean;
  var
    GDIPlusGraphics: TGPGraphics;
    GDIPlusBitmap: TGPBitmap;
  begin
  GDIPlusGraphics:=TGPGraphics.Create(CanvasHandle);
  try
  GDIPlusBitmap:=TGPBitmap.Create(BMP.Handle,BMP.Palette);
  try
  Result:=(GDIPlusGraphics.DrawImage(GDIPlusBitmap, 0,0, 0,0,SrcWidth,SrcHeight, UnitPixel) = Ok)
  finally
  GDIPlusBitmap.Destroy;
  end;
  finally
  GDIPlusGraphics.Destroy;
  end;
  end;

var
  ptrItem: pointer;
  _Width,_Scale: Double;
  ptrLevel: pointer;
  cntLevel: integer;
  Level: pointer;
  LevelNumber: integer;
  X0,Y0,X1,Y1: Double;
  diffX1X0,diffY1Y0,diffX3X0,diffY3Y0: Double;
  SW,SH: Double;
  Alfa: Double;
  b: Double;
  V: Double;
  S0_X3,S0_Y3: Double;
  S1_X3,S1_Y3: Double;
  Xc,Yc: double;
  CosAlfa,SinAlfa: Double;
  MinFactor,Factor: Double;
  flAllItemsExists,flHasEmptySegment: boolean;
  ItemsTable: pointer;
  ItemsTableSize: integer;
  XIndexMin,XIndexMax,YIndexMin,YIndexMax: integer;
  _ItemsTable: pointer;
  _ItemsTableSize: integer;
  ExceptSegments: TByteArray;
  I,J,L: integer;
  DeferredReflectings: TList;
  flDeferredReflectingFound: boolean;
  CompositionLevels: TList;
  CompositionLevel: pointer;
  CompositionLevelNumber: integer;
  Composition_SummarySegmentsCount: integer;

  function ReflectLevel(const Level: pointer; const ItemsTable: pointer; const ItemsTableSize: integer; const flAllItemsExists: boolean; const SegmentsOGLTextures: TDPVSegmentsOGLTextures; const XIndexMin,XIndexMax,YIndexMin,YIndexMax: integer; const SW,SH: Double; const ReflectingBMP: TBitmap): boolean;

    function GetBitmapFromJPEGStream(const JPEGStream: TMemoryStream; const Bitmap: TBitmap): boolean;
    var
      iWidth, iHeight, iNChannels: Integer;
      iDIBChannels: integer;
      iStatus: integer;
      jcprops: TJPEG_CORE_PROPERTIES;
      DIB: TDIBSection;
    begin
    Result:=False;
    IJL_Lock.Enter;
    try
    iDIBchannels:=3;
    FillChar(jcprops,SizeOf(jcprops),0);
    iStatus:=ijlInit(@jcprops);
    if (iStatus = IJL_OK)
     then
      try
      jcprops.JPGBytes:=JPEGStream.Memory;
      jcprops.JPGSizeBytes:=JPEGStream.Size;
      iStatus:=ijlRead(@jcprops,IJL_JBUFF_READPARAMS);
      if (iStatus = IJL_OK)
       then begin
        iWidth:=jcprops.JPGWidth;
        iHeight:=jcprops.JPGHeight;
        iNChannels:=jcprops.JPGChannels;
        if (iNChannels = 3)
         then begin
          iDIBChannels:=iNChannels;
          Bitmap.Width:=iWidth;
          Bitmap.Height:=iHeight;
          FillChar(DIB,SizeOf(DIB),0);
          iStatus:=GetObject(Bitmap.Handle,SizeOf(DIB),@DIB);
          if (iStatus <> 0)
           then begin
            jcprops.DIBWidth:=iWidth;
            jcprops.DIBHeight:=-iHeight;
            jcprops.DIBChannels:=iDIBChannels;
            jcprops.DIBColor:=IJL_BGR;
            jcprops.DIBPadBytes:=((((iWidth*iDIBChannels)+3) div 4)*4)-(iWidth*iDIBChannels);
            jcprops.DIBBytes:=System.PByte(DIB.dsBm.bmBits);
            iStatus:=ijlRead(@jcprops,IJL_JBUFF_READWHOLEIMAGE);
            Result:=(iStatus >= 0);
            end;
          end;
        end;
      finally
      ijlFree(@jcprops);
      end;
    finally
    IJL_Lock.Leave;
    end;
    end;

  var
    Xmn,Ymn: integer;
    ReflectingBMPWidth,ReflectingBMPHeight: integer;
    SegmentBMP: TBitmap;
    flDrawSegment: boolean;
    LevelFolder,SegmentFileName: string;
    Segment: pointer;
    XF: XFORM;
    I: integer;
  begin
  Result:=false;
  with TLevelItemOfTDetailedPictureVisualizationCash(Level^) do begin
  if (ItemsTable <> nil)
   then begin
    if (SegmentsOGLTextures.flEnabled AND ((GetCurrentThreadID = MainThreadID) OR (NOT flAllItemsExists OR flHasEmptySegment)))
     then with TLevelItemOfTDetailedPictureVisualizationCash(Level^).Params do begin
      //.
      pReflectionWindow.Lock.Enter;
      try
      Xmn:=pReflectionWindow.Xmn;
      Ymn:=pReflectionWindow.Ymn;
      finally
      pReflectionWindow.Lock.Leave;
      end;
      //.
      pCanvas.Lock;
      try
      //. try using OpenGL draw method
      try
      Result:=SegmentsOGLTextures.DrawOnCanvas(
                Self,
                pCanvas,
                ItemsTable,
                ItemsTableSize,
                SegmentWidth,
                SegmentHeight,
                XIndexMin,
                YIndexMin,
                (Xc+diffX1X0*(XIndexMin/DivX)+diffX3X0*(YIndexMin/DivY))-Xmn,
                (Yc+diffY1Y0*(XIndexMin/DivX)+diffY3Y0*(YIndexMin/DivY))-Ymn,
                SW/Params.SegmentWidth,
                SH/Params.SegmentHeight,
                Alfa,
                false
      );
      except
        end;
      finally
      pCanvas.Unlock;
      end;
      end;
    //. default processing
    if (NOT Result AND (flAllItemsExists AND NOT flHasEmptySegment))
     then begin
      Result:=true;
      //. calculating bmp size
      ReflectingBMPWidth:=Trunc(Params.SegmentWidth*(XIndexMax-XIndexMin+1));
      ReflectingBMPHeight:=Trunc(Params.SegmentHeight*(YIndexMax-YIndexMin+1));
      //.
      ReflectingBMP.Canvas.Lock;
      try
      if (ReflectingBMP.Width < ReflectingBMPWidth) then ReflectingBMP.Width:=ReflectingBMPWidth;
      if (ReflectingBMP.Height < ReflectingBMPHeight) then ReflectingBMP.Height:=ReflectingBMPHeight;
      //.
      SegmentBMP:=TBitmap.Create();
      SegmentBMP.Canvas.Lock();
      try
      SegmentBMP.HandleType:=bmDIB;
      SegmentBMP.PixelFormat:=pf24bit;
      for I:=0 to (ItemsTableSize DIV SizeOf(Pointer))-1 do with TSegmentItemOfTDetailedPictureVisualizationCash(Pointer(Pointer(Integer(ItemsTable)+I*SizeOf(Pointer))^)^).Params do begin
        flDrawSegment:=false;
        //.
        TSystemTDetailedPictureVisualization(TypeSystem).Cash.Segment_Lock(Pointer(Pointer(Integer(ItemsTable)+I*SizeOf(Pointer))^));
        try
        if (_DATA = nil)
         then begin
          LevelFolder:=TSystemTDetailedPictureVisualization(TypeSystem).Cash.Item_Level__GetContextFolder(idObj,TLevelItemOfTDetailedPictureVisualizationCash(Level^).Params.ID);
          SegmentFileName:=LevelFolder+'\'+'X'+IntToStr(XIndex)+'Y'+IntToStr(YIndex)+'.jpg';
          _DATA:=TMemoryStream.Create();
          if (FileExists(SegmentFileName)) then _DATA.LoadFromFile(SegmentFileName);
          end;
        //.
        if (_DATA.Size = 0)
         then begin
          Result:=false;
          Break; //. >
          end;
        //. 
        if (GetBitmapFromJPEGStream(_DATA,SegmentBMP)) then flDrawSegment:=true;
        finally
        TSystemTDetailedPictureVisualization(TypeSystem).Cash.Segment_Unlock(Pointer(Pointer(Integer(ItemsTable)+I*SizeOf(Pointer))^));
        end;
        //.
        if (flDrawSegment)
         then begin
          //. old ReflectingBMP.Canvas.StretchDraw(Rect(Trunc((XIndex-XIndexMin)*Params.SegmentWidth),Trunc((YIndex-YIndexMin)*Params.SegmentHeight),Round((XIndex-XIndexMin+1)*Params.SegmentWidth),Round((YIndex-YIndexMin+1)*Params.SegmentHeight)),SegmentBMP);
          ReflectingBMP.Canvas.Draw(Trunc((XIndex-XIndexMin)*Params.SegmentWidth),Trunc((YIndex-YIndexMin)*Params.SegmentHeight),SegmentBMP);
          end;
        //.
        if (ptrCancelFlag <> nil)
         then begin
          Sleep(0); //. exit from the current thread to alow the cancel flag to be set
          if (Boolean(ptrCancelFlag^)) then Raise EUnnecessaryExecuting.Create(''); //. =>
          end;
        end;
      finally
      SegmentBMP.Canvas.Unlock();
      SegmentBMP.Destroy;
      end;
      //.
      if ((ptrCancelFlag <> nil) AND (Boolean(ptrCancelFlag^))) then Raise EUnnecessaryExecuting.Create(''); //. =>
      //. reflecting
      if (Result)
       then begin
        pCanvas.Lock;
        try
        SetGraphicsMode(pCanvas.Handle,GM_ADVANCED);
        with TLevelItemOfTDetailedPictureVisualizationCash(Level^).Params do begin
        pReflectionWindow.Lock.Enter;
        try
        XF.eDx:=(Xc+diffX1X0*(XIndexMin/DivX)+diffX3X0*(YIndexMin/DivY)){///- -pReflectionWindow.Xmn};
        XF.eDy:=(Yc+diffY1Y0*(XIndexMin/DivX)+diffY3Y0*(YIndexMin/DivY)){///- -pReflectionWindow.Ymn};
        finally
        pReflectionWindow.Lock.Leave;
        end;
        end;
        XF.eM11:=CosAlfa;
        XF.eM12:=SinAlfa;
        XF.eM21:=-SinAlfa;
        XF.eM22:=CosAlfa;
        SetWorldTransForm(pCanvas.Handle,XF);
        XF.eDx:=0;
        XF.eDy:=0;
        XF.eM11:=SW/Params.SegmentWidth;
        XF.eM12:=0;
        XF.eM21:=0;
        XF.eM22:=SH/Params.SegmentHeight;
        ModifyWorldTransForm(pCanvas.Handle,XF,MWT_LEFTMULTIPLY);
        try
        Result:=DrawUsingGDIPlus(pCanvas.Handle, ReflectingBMP,ReflectingBMPWidth,ReflectingBMPHeight)
        finally
        ModifyWorldTransForm(pCanvas.Handle,XF,MWT_IDENTITY);
        end;
        finally
        pCanvas.Unlock;
        end;
        end;
      finally
      ReflectingBMP.Canvas.Unlock;
      end;
      end;
    //. try draw as OpenGL if GID+ method failed
    if (NOT Result AND SegmentsOGLTextures.flEnabled)
     then with TLevelItemOfTDetailedPictureVisualizationCash(Level^).Params do begin
      //.  
      pReflectionWindow.Lock.Enter;
      try
      Xmn:=pReflectionWindow.Xmn;
      Ymn:=pReflectionWindow.Ymn;
      finally
      pReflectionWindow.Lock.Leave;
      end;
      //.
      pCanvas.Lock;
      try
      //. try using OpenGL draw method
      try
      Result:=SegmentsOGLTextures.DrawOnCanvas(
                Self,
                pCanvas,
                ItemsTable,
                ItemsTableSize,
                SegmentWidth,
                SegmentHeight,
                XIndexMin,
                YIndexMin,
                (Xc+diffX1X0*(XIndexMin/DivX)+diffX3X0*(YIndexMin/DivY))-Xmn,
                (Yc+diffY1Y0*(XIndexMin/DivX)+diffY3Y0*(YIndexMin/DivY))-Ymn,
                SW/Params.SegmentWidth,
                SH/Params.SegmentHeight,
                Alfa,
                true
      );
      except
        end;
      finally
      pCanvas.Unlock;
      end;
      end;
    end
   else Result:=true;
  end;
  end;

  procedure Composition_OptimizeSegments(const X0,Y0: double; const X1,Y1: double; const X3,Y3: double; const pReflectionWindow: TReflectionWindow; const CompositionLevels: TList; var Composition_SegmentsCount: integer; const OptimalSegmentsCount: integer);
  type
    TSegmentItem = record
      Next: pointer;
      L: double;
      ptrptrSegment: pointer;
    end;

    procedure GetReflectionWindowCenterLevelContainerIndex(const X0,Y0: double; const X1,Y1: double; const X3,Y3: double; const pReflectionWindow: TReflectionWindow; const SW,SH: double; out XIndex,YIndex: integer);

      procedure ProcessPoint(X,Y: double; out dX,dY: double);
      var
        QdA2: Extended;
        X_C,X_QdC,X_A1,X_QdB2: Extended;
        Y_C,Y_QdC,Y_A1,Y_QdB2: Extended;
      begin
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
      dX:=X_A1;
      dY:=Y_A1;
      end;

    var
      dX,dY: double;
    begin
    pReflectionWindow.Lock.Enter;
    try
    ProcessPoint(pReflectionWindow.Xmd,pReflectionWindow.Ymd, dX,dY);
    XIndex:=Trunc(dX/SW);
    YIndex:=Trunc(dY/SH); 
    finally
    pReflectionWindow.Lock.Leave;
    end;
    end;

  var
    I,J: integer;
    RemoveDelta: integer;
    OptimizationCenterX,OptimizationCenterY: integer;
    SegmentItems: pointer;
    X,Y: integer;
    _ptrptrSegment: pointer;
    ptrSegmentItem: pointer;
    ptrptrSegmentItem: pointer;
  begin
  RemoveDelta:=Composition_SegmentsCount-OptimalSegmentsCount;
  if (RemoveDelta <= 0) then Exit; //. ->
  for I:=CompositionLevels.Count-1 downto 0 do with TCompositionLevel(CompositionLevels[I]^) do begin
    if (RemoveDelta >= Count)
     then begin //. remove all segments at this level
      for J:=0 to SegmentsMapSize-1 do
        if (Pointer(Pointer(Integer(SegmentsMap)+J*SizeOf(Pointer))^) <> nil)
         then Pointer(Pointer(Integer(SegmentsMap)+J*SizeOf(Pointer))^):=nil;
      Dec(RemoveDelta,Count);
      Count:=0;
      flAllItemsExists:=false;
      end
     else begin
      //. get center of optimization
      GetReflectionWindowCenterLevelContainerIndex(X0,Y0, X1,Y1, X3,Y3, pReflectionWindow, SW,SH, {out} OptimizationCenterX, {out} OptimizationCenterY);
      if (OptimizationCenterX < XIndexMin)
       then OptimizationCenterX:=XIndexMin
       else
        if (OptimizationCenterX > XIndexMax)
         then OptimizationCenterX:=XIndexMax;
      if (OptimizationCenterY < YIndexMin)
       then OptimizationCenterY:=YIndexMin
       else
        if (OptimizationCenterY > YIndexMax)
         then OptimizationCenterY:=YIndexMax;
      OptimizationCenterX:=OptimizationCenterX-XIndexMin;
      OptimizationCenterY:=OptimizationCenterY-YIndexMin;
      //.
      SegmentItems:=nil;
      try
      for Y:=0 to SegmentsMapSizeY-1 do
        for X:=0 to SegmentsMapSizeX-1 do begin
          _ptrptrSegment:=Pointer(Integer(SegmentsMap)+(Y*SegmentsMapSizeX+X)*SizeOf(Pointer));
          if (Pointer(_ptrptrSegment^) <> nil)
           then begin
            GetMem(ptrSegmentItem,SizeOf(TSegmentItem));
            with TSegmentItem(ptrSegmentItem^) do begin
            L:=sqr(X-OptimizationCenterX)+sqr(Y-OptimizationCenterY);
            ptrptrSegment:=_ptrptrSegment;
            end;
            //. add in L-increasing order
            ptrptrSegmentItem:=@SegmentItems;
            while ((Pointer(ptrptrSegmentItem^) <> nil) AND (TSegmentItem(Pointer(ptrptrSegmentItem^)^).L < TSegmentItem(ptrSegmentItem^).L)) do ptrptrSegmentItem:=@TSegmentItem(Pointer(ptrptrSegmentItem^)^).Next;
            TSegmentItem(ptrSegmentItem^).Next:=Pointer(ptrptrSegmentItem^);
            Pointer(ptrptrSegmentItem^):=ptrSegmentItem;
            end;
          end;
      //. remove segment elements with maximum length from optimization center
      Dec(Count,RemoveDelta);
      ptrSegmentItem:=SegmentItems;
      for J:=0 to Count-1 do ptrSegmentItem:=TSegmentItem(ptrSegmentItem^).Next;
      while (ptrSegmentItem <> nil) do begin
        Pointer(TSegmentItem(ptrSegmentItem^).ptrptrSegment^):=nil;
        ptrSegmentItem:=TSegmentItem(ptrSegmentItem^).Next;
        end;
      flAllItemsExists:=false;
      RemoveDelta:=0;
      finally
      while (SegmentItems <> nil) do begin
        ptrSegmentItem:=SegmentItems;
        SegmentItems:=TSegmentItem(ptrSegmentItem^).Next;
        FreeMem(ptrSegmentItem,SizeOf(TSegmentItem));
        end;
      end;
      end;
    if (RemoveDelta = 0) then Break; //. >
    end;
  Composition_SegmentsCount:=OptimalSegmentsCount;
  end;

  function Composition_ProcessSegment(const CompositionLevels: TList; const Level: integer; const XIndex,YIndex: integer; const OptimalLevel: integer): boolean;

    procedure EmptySegmentRecursively(const CompositionLevels: TList; const Level: integer; const XIndex,YIndex: integer);
    var
      ptrptrSegment: pointer;
      XI,YI: integer;
    begin
    with TCompositionLevel(CompositionLevels[Level]^) do begin
    ptrptrSegment:=Pointer(Integer(SegmentsMap)+((YIndex-YIndexMin)*SegmentsMapSizeX+(XIndex-XIndexMin))*SizeOf(Pointer));
    //.
    if (Pointer(ptrptrSegment^) <> nil)
     then begin
      Pointer(ptrptrSegment^):=nil;
      Dec(Count);
      flAllItemsExists:=false;
      end;
    //.
    if (Level < (CompositionLevels.Count-1))
     then with TCompositionLevel(CompositionLevels[Level+1]^) do begin
      XI:=(XIndex SHL 1)-XIndexMin; YI:=(YIndex SHL 1)-YIndexMin;
      if (((0 <= XI) AND (XI < SegmentsMapSizeX)) AND ((0 <= YI) AND (YI < SegmentsMapSizeY))) then EmptySegmentRecursively(CompositionLevels, Level+1, (XI+XIndexMin),(YI+YIndexMin));
      Inc(XI);
      if (((0 <= XI) AND (XI < SegmentsMapSizeX)) AND ((0 <= YI) AND (YI < SegmentsMapSizeY))) then EmptySegmentRecursively(CompositionLevels, Level+1, (XI+XIndexMin),(YI+YIndexMin));
      Inc(YI);
      if (((0 <= XI) AND (XI < SegmentsMapSizeX)) AND ((0 <= YI) AND (YI < SegmentsMapSizeY))) then EmptySegmentRecursively(CompositionLevels, Level+1, (XI+XIndexMin),(YI+YIndexMin));
      Dec(XI);
      if (((0 <= XI) AND (XI < SegmentsMapSizeX)) AND ((0 <= YI) AND (YI < SegmentsMapSizeY))) then EmptySegmentRecursively(CompositionLevels, Level+1, (XI+XIndexMin),(YI+YIndexMin));
      //.
      if ((ptrCancelFlag <> nil) AND (Boolean(ptrCancelFlag^))) then Raise EUnnecessaryExecuting.Create(''); //. =>
      end;
    end;
    end;

  var
    ptrptrSegment: pointer;
    flEmptySegment: boolean;
    XI,YI: integer;
    flSegment00,flSegment10,flSegment01,flSegment11: boolean;
  begin
  with TCompositionLevel(CompositionLevels[Level]^) do begin
  ptrptrSegment:=Pointer(Integer(SegmentsMap)+((YIndex-YIndexMin)*SegmentsMapSizeX+(XIndex-XIndexMin))*SizeOf(Pointer));
  //.
  Result:=(Pointer(ptrptrSegment^) <> nil);
  if (Result) then with TSegmentItemOfTDetailedPictureVisualizationCash(Pointer(ptrptrSegment^)^).Params do Result:=(TSystemTDetailedPictureVisualization(TypeSystem).Cash.Segment_DATAIsNotEmpty(Pointer(ptrptrSegment^)));
  //.
  if (Level < (CompositionLevels.Count-1))
   then begin
    flEmptySegment:=(Result AND (Level >= OptimalLevel));
    //.
    with TCompositionLevel(CompositionLevels[Level+1]^) do begin
    XI:=(XIndex SHL 1)-XIndexMin; YI:=(YIndex SHL 1)-YIndexMin;
    //.
    if (flEmptySegment)
     then begin
      if (((0 <= XI) AND (XI < SegmentsMapSizeX)) AND ((0 <= YI) AND (YI < SegmentsMapSizeY))) then EmptySegmentRecursively(CompositionLevels, Level+1, (XI+XIndexMin),(YI+YIndexMin));
      Inc(XI);
      if (((0 <= XI) AND (XI < SegmentsMapSizeX)) AND ((0 <= YI) AND (YI < SegmentsMapSizeY))) then EmptySegmentRecursively(CompositionLevels, Level+1, (XI+XIndexMin),(YI+YIndexMin));
      Inc(YI);
      if (((0 <= XI) AND (XI < SegmentsMapSizeX)) AND ((0 <= YI) AND (YI < SegmentsMapSizeY))) then EmptySegmentRecursively(CompositionLevels, Level+1, (XI+XIndexMin),(YI+YIndexMin));
      Dec(XI);
      if (((0 <= XI) AND (XI < SegmentsMapSizeX)) AND ((0 <= YI) AND (YI < SegmentsMapSizeY))) then EmptySegmentRecursively(CompositionLevels, Level+1, (XI+XIndexMin),(YI+YIndexMin));
      Exit; //. ->
      end
     else begin
      if (((0 <= XI) AND (XI < SegmentsMapSizeX)) AND ((0 <= YI) AND (YI < SegmentsMapSizeY)))
       then flSegment00:=Composition_ProcessSegment(CompositionLevels, Level+1, (XI+XIndexMin),(YI+YIndexMin), OptimalLevel)
       else flSegment00:=true;
      Inc(XI);
      if (((0 <= XI) AND (XI < SegmentsMapSizeX)) AND ((0 <= YI) AND (YI < SegmentsMapSizeY)))
       then flSegment10:=Composition_ProcessSegment(CompositionLevels, Level+1, (XI+XIndexMin),(YI+YIndexMin), OptimalLevel)
       else flSegment10:=true;
      Inc(YI);
      if (((0 <= XI) AND (XI < SegmentsMapSizeX)) AND ((0 <= YI) AND (YI < SegmentsMapSizeY)))
       then flSegment01:=Composition_ProcessSegment(CompositionLevels, Level+1, (XI+XIndexMin),(YI+YIndexMin), OptimalLevel)
       else flSegment01:=true;
      Dec(XI);
      if (((0 <= XI) AND (XI < SegmentsMapSizeX)) AND ((0 <= YI) AND (YI < SegmentsMapSizeY)))
       then flSegment11:=Composition_ProcessSegment(CompositionLevels, Level+1, (XI+XIndexMin),(YI+YIndexMin), OptimalLevel)
       else flSegment11:=true;
      end;
    end;
    //.
    if (flSegment00 AND flSegment10 AND flSegment01 AND flSegment11)
     then
      if (Result)
       then begin
        Pointer(ptrptrSegment^):=nil;
        Dec(Count);
        flAllItemsExists:=false;
        end
       else Result:=true;
    end;
  end;
  end;

begin
Result:=false;
with pFigure do begin
if (Width <= 0) then Exit; //. ->
X0:=Nodes[0].X;Y0:=Nodes[0].Y;
X1:=Nodes[1].X;Y1:=Nodes[1].Y;
diffX1X0:=X1-X0;
diffY1Y0:=Y1-Y0;
_Width:=Sqrt(sqr(diffX1X0)+sqr(diffY1Y0));
b:=(Width*pReflectionWindow.Scale);
pReflectionWindow.Lock.Enter;
try
_Scale:=_Width/(pReflectionWindow.Xmx-pReflectionWindow.Xmn);
finally
pReflectionWindow.Lock.Leave;
end;
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
 then begin Xc:=S0_X3; Yc:=S0_Y3 end
 else begin Xc:=S1_X3; Yc:=S1_Y3 end;
Alfa:=-Alfa;
CosAlfa:=Cos(Alfa);
SinAlfa:=Sin(Alfa);
diffX3X0:=(X0-Xc)*2;
diffY3Y0:=(Y0-Yc)*2;
end;
//.
with TSystemTDetailedPictureVisualization(TypeSystem) do begin
Cash.Lock.BeginRead;
try
if (NOT Cash.NotRecombinatedGetItem(Self.idObj, ptrItem)) then Exit; //. ->
TItemTDetailedPictureVisualizationCash(ptrItem^).ptrObj:=pFigure.ptrObj;
//. get working level
Level:=nil;
MinFactor:=MaxDouble;
cntLevel:=0;
ptrLevel:=TItemTDetailedPictureVisualizationCash(ptrItem^).Levels;
while (ptrLevel <> nil) do with TLevelItemOfTDetailedPictureVisualizationCash(ptrLevel^) do begin
  if (NOT Disabled)
   then begin
    Factor:=Sqr(Params.SegmentWidth*Params.DivX-_Width);
    if (Factor < MinFactor)
     then begin
      Level:=ptrLevel;
      LevelNumber:=cntLevel;
      MinFactor:=Factor;
      end;
    end;
  //. next level
  Inc(cntLevel);
  ptrLevel:=ptrNext;
  end;
//.
if ((ptrCancelFlag <> nil) AND (Boolean(ptrCancelFlag^))) then Raise EUnnecessaryExecuting.Create(''); //. =>
//.
if (Level <> nil)
 then begin
  TLevelItemOfTDetailedPictureVisualizationCash(Level^).Lock.BeginRead;
  try
  if ((TLevelItemOfTDetailedPictureVisualizationCash(Level^).Params.VisibleMinScale <> 0) AND ((_Width/(TLevelItemOfTDetailedPictureVisualizationCash(Level^).Params.SegmentWidth*(TLevelItemOfTDetailedPictureVisualizationCash(Level^).Params.DivX)) < TLevelItemOfTDetailedPictureVisualizationCash(Level^).Params.VisibleMinScale)))
   then begin
    Result:=true;
    Exit; //. ->
    end;
  if ((TLevelItemOfTDetailedPictureVisualizationCash(Level^).Params.VisibleMaxScale <> 0) AND ((_Width/(TLevelItemOfTDetailedPictureVisualizationCash(Level^).Params.SegmentWidth*(TLevelItemOfTDetailedPictureVisualizationCash(Level^).Params.DivX)) > TLevelItemOfTDetailedPictureVisualizationCash(Level^).Params.VisibleMaxScale)))
   then begin
    Result:=true;
    Exit; //. ->
    end;
  //. clear background
  ClearBackground(pCanvas, LoadingImage, pAdditionalFigure);
  //.
  if ((ptrCancelFlag <> nil) AND (Boolean(ptrCancelFlag^))) then Raise EUnnecessaryExecuting.Create(''); //. =>
  //.
  with TLevelItemOfTDetailedPictureVisualizationCash(Level^) do begin
  //. get ReflectionWindow level container indexes
  SW:=_Width/Params.DivX;
  SH:=b/Params.DivY;
  GetReflectionWindowLevelContainerIndexes(Xc,Yc, Xc+diffX1X0,Yc+diffY1Y0, Xc+diffX3X0,Yc+diffY3Y0, pReflectionWindow, SW,SH,  XIndexMin,XIndexMax,YIndexMin,YIndexMax);
  if (XIndexMin < 0) then XIndexMin:=0;
  if (XIndexMax >= Params.DivX) then XIndexMax:=Params.DivX-1;
  if (XIndexMin > XIndexMax)
   then begin //. out of bounds
    Result:=true;
    Exit; //. ->
    end;
  if (YIndexMin < 0) then YIndexMin:=0;
  if (YIndexMax >= Params.DivY) then YIndexMax:=Params.DivY-1;
  if (YIndexMin > YIndexMax)
   then begin //. out of bounds
    Result:=true;
    Exit; //. ->
    end;
  end;
  //.
  if (((XIndexMax-XIndexMin+1)*(YIndexMax-YIndexMin+1)) > MaxSegmentsForProcess)
   then begin
    Result:=false;
    Exit; //. ->
    end;
  //.
  if ((ptrCancelFlag <> nil) AND (Boolean(ptrCancelFlag^))) then Raise EUnnecessaryExecuting.Create(''); //. =>
  //.
  flAllItemsExists:=TTDetailedPictureVisualizationCash(TSystemTDetailedPictureVisualization(TypeSystem).Cash).Item_Level__GetVisibleSegmentsLocal(ptrItem, Level, XIndexMin,XIndexMax,YIndexMin,YIndexMax, (GetCurrentThreadID = MainThreadID),true, ptrCancelFlag,  ItemsTable,ItemsTableSize, ExceptSegments, @flHasEmptySegment);
  try
  if (NOT flAllItemsExists OR flHasEmptySegment)
   then begin
    if (GetCurrentThreadID <> MainThreadID)
     then with TLevelItemOfTDetailedPictureVisualizationCash(Level^) do begin
      flDeferredReflectingFound:=false;
      //. check the same deferred items
      DeferredReflectings:=TSystemTDetailedPictureVisualization(TypeSystem).DetailedPictureDeferredReflectingList.LockList();
      try
      if (FReflector.State = rsDestroying) then Exit; //. ->
      for I:=0 to DeferredReflectings.Count-1 do
        if (
              (TDetailedPictureDeferredReflecting(DeferredReflectings[I]).idObj = Self.idObj) AND
              (TDetailedPictureDeferredReflecting(DeferredReflectings[I]).idLevel = Params.id) AND
              (NOT ((TDetailedPictureDeferredReflecting(DeferredReflectings[I]).XIndexMax < XIndexMin) AND (TDetailedPictureDeferredReflecting(DeferredReflectings[I]).XIndexMin > XIndexMax) AND (TDetailedPictureDeferredReflecting(DeferredReflectings[I]).YIndexMax < YIndexMin) AND (TDetailedPictureDeferredReflecting(DeferredReflectings[I]).YIndexMin > YIndexMax)))           )
         then with TDetailedPictureDeferredReflecting(DeferredReflectings[I]) do begin
          ReflectorsList_Add(FReflector as TReflector);
          flUpdateIsNeeded:=true; //. need to update reflectors in deferred reflecting anyway
          flDeferredReflectingFound:=true;
          Break; //. >
          end;
      finally
      TSystemTDetailedPictureVisualization(TypeSystem).DetailedPictureDeferredReflectingList.UnlockList();
      end;
      //.
      if ((ptrCancelFlag <> nil) AND (Boolean(ptrCancelFlag^))) then Raise EUnnecessaryExecuting.Create(''); //. =>
      //.
      if (NOT flDeferredReflectingFound)
       then TDetailedPictureDeferredReflecting.Create(TSystemTDetailedPictureVisualization(TypeSystem), false, (FReflector as TReflector), idObj,pFigure.ptrObj, Params.id, XIndexMin,XIndexMax,YIndexMin,YIndexMax, ExceptSegments, ptrCancelFlag).Resume();
      end;
    //. process levels composition
    CompositionLevelNumber:=0;
    CompositionLevels:=TList.Create;
    try
    CompositionLevels.Capacity:=16;
    Composition_SummarySegmentsCount:=0;
    ptrLevel:=TItemTDetailedPictureVisualizationCash(ptrItem^).Levels;
    while (ptrLevel <> nil) do with TLevelItemOfTDetailedPictureVisualizationCash(ptrLevel^) do begin
      Lock.BeginRead;
      try
      //. composition new level
      GetMem(CompositionLevel,SizeOf(TCompositionLevel));
      try
      with TCompositionLevel(CompositionLevel^) do begin
      LevelPtr:=ptrLevel;
      //. get ReflectionWindow level container indexes
      SW:=_Width/Params.DivX;
      SH:=b/Params.DivY;
      GetReflectionWindowLevelContainerIndexes(Xc,Yc, Xc+diffX1X0,Yc+diffY1Y0, Xc+diffX3X0,Yc+diffY3Y0, pReflectionWindow, SW,SH,  XIndexMin,XIndexMax,YIndexMin,YIndexMax);
      if (XIndexMin < 0) then XIndexMin:=0;
      if (XIndexMax >= Params.DivX) then XIndexMax:=Params.DivX-1;
      if (YIndexMin < 0) then YIndexMin:=0;
      if (YIndexMax >= Params.DivY) then YIndexMax:=Params.DivY-1;
      SegmentsMapSizeX:=XIndexMax-XIndexMin+1;
      SegmentsMapSizeY:=YIndexMax-YIndexMin+1;
      //. creating segments map
      SegmentsMapSize:=SegmentsMapSizeX*SegmentsMapSizeY;
      SegmentsMapLength:=SegmentsMapSize*SizeOf(Pointer);
      GetMem(SegmentsMap,SegmentsMapLength);
      FillChar(SegmentsMap^,SegmentsMapLength,0);
      Count:=0;
      flAllItemsExists:=TTDetailedPictureVisualizationCash(TSystemTDetailedPictureVisualization(TypeSystem).Cash).Item_Level__GetVisibleSegmentsLocal(ptrItem, ptrLevel, XIndexMin,XIndexMax,YIndexMin,YIndexMax, (GetCurrentThreadID = MainThreadID),true, ptrCancelFlag,  _ItemsTable,_ItemsTableSize, ExceptSegments);
      if (_ItemsTable <> nil)
       then
        try
        for I:=0 to (_ItemsTableSize DIV SizeOf(Pointer))-1 do with TSegmentItemOfTDetailedPictureVisualizationCash(Pointer(Pointer(Integer(_ItemsTable)+I*SizeOf(Pointer))^)^).Params do begin
          //.
          if ((ptrCancelFlag <> nil) AND (Boolean(ptrCancelFlag^))) then Raise EUnnecessaryExecuting.Create(''); //. =>
          //.
          if (Now > BestBeforeTime) then Break; //. >
          //.
          Pointer(Pointer(Integer(SegmentsMap)+((YIndex-YIndexMin)*SegmentsMapSizeX+(XIndex-XIndexMin))*SizeOf(Pointer))^):=Pointer(Pointer(Integer(_ItemsTable)+I*SizeOf(Pointer))^);
          Inc(Count);
          Inc(Composition_SummarySegmentsCount);
          end;
        finally
        FreeMem(_ItemsTable,_ItemsTableSize);
        end;
      end;
      except
        with TCompositionLevel(CompositionLevel^) do FreeMem(SegmentsMap,SegmentsMapLength);
        FreeMem(CompositionLevel,SizeOf(TCompositionLevel));
        //.
        Raise; //. =>
        end;
      //. add to composition
      CompositionLevels.Add(CompositionLevel);
      finally
      Lock.EndRead;
      end;
      //.
      if ((ptrCancelFlag <> nil) AND (Boolean(ptrCancelFlag^))) then Raise EUnnecessaryExecuting.Create(''); //. =>
      //.
      Inc(CompositionLevelNumber);
      if ((CompositionLevelNumber-LevelNumber) > MaxCompositionDepth) then Break; //. >
      //. next level
      ptrLevel:=ptrNext;
      end;
    //. optimize composition for performance
    Composition_OptimizeSegments(Xc,Yc, Xc+diffX1X0,Yc+diffY1Y0, Xc+diffX3X0,Yc+diffY3Y0, pReflectionWindow, CompositionLevels,{ref}Composition_SummarySegmentsCount,MaxSegmentsForCompositionProcess);
    //. reform composition
    if (CompositionLevels.Count > 1)
     then with TCompositionLevel(CompositionLevels[0]^) do
      for I:=YIndexMin to YIndexMax do
        for J:=XIndexMin to XIndexMax do begin
          Composition_ProcessSegment(CompositionLevels, 0, J,I, LevelNumber);
          //.
          if ((ptrCancelFlag <> nil) AND (Boolean(ptrCancelFlag^))) then Raise EUnnecessaryExecuting.Create(''); //. =>
          end;
    //. reflect composition
    for L:=0 to CompositionLevels.Count-1 do with TCompositionLevel(CompositionLevels[L]^) do
      if (Count > 0)
       then begin
        _ItemsTableSize:=Count*SizeOf(Pointer);
        GetMem(_ItemsTable,_ItemsTableSize);
        try
        J:=0;
        for I:=0 to SegmentsMapSize-1 do
          if (Pointer(Pointer(Integer(SegmentsMap)+I*SizeOf(Pointer))^) <> nil)
           then begin
            Pointer(Pointer(Integer(_ItemsTable)+J*SizeOf(Pointer))^):=Pointer(Pointer(Integer(SegmentsMap)+I*SizeOf(Pointer))^);
            Inc(J);
            end;
        //. reflect composition level
        TLevelItemOfTDetailedPictureVisualizationCash(LevelPtr^).Lock.BeginRead;
        try
        Result:=ReflectLevel(LevelPtr, _ItemsTable,_ItemsTableSize,flAllItemsExists, SegmentsOGLTextures, XIndexMin,XIndexMax,YIndexMin,YIndexMax, SW,SH, ReflectingBMP) OR Result;
        finally
        TLevelItemOfTDetailedPictureVisualizationCash(LevelPtr^).Lock.EndRead;
        end;
        finally
        FreeMem(_ItemsTable,_ItemsTableSize);
        end;
        //.
        if ((ptrCancelFlag <> nil) AND (Boolean(ptrCancelFlag^))) then Raise EUnnecessaryExecuting.Create(''); //. =>
        end;
    if (Result) then Exit; //. ->
    finally
    for L:=0 to CompositionLevels.Count-1 do begin
      CompositionLevel:=CompositionLevels[L];
      with TCompositionLevel(CompositionLevel^) do FreeMem(SegmentsMap,SegmentsMapLength);
      FreeMem(CompositionLevel,SizeOf(TCompositionLevel));
      end;
    CompositionLevels.Destroy;
    end;
    end;
  //. reflecting ...
  Result:=ReflectLevel(Level, ItemsTable,ItemsTableSize,flAllItemsExists, SegmentsOGLTextures, XIndexMin,XIndexMax,YIndexMin,YIndexMax, SW,SH, ReflectingBMP);
  finally
  if (ItemsTable <> nil) then FreeMem(ItemsTable,ItemsTableSize);
  end;
  finally
  TLevelItemOfTDetailedPictureVisualizationCash(Level^).Lock.EndRead;
  end;
  end
 else Exit; //. ->
finally
Cash.Lock.EndRead;
end;
end;
end
;

function TDetailedPictureVisualizationFunctionality.ReflectOnCanvas(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean;
const
  MaxSegmentsForProcess = 256;  

  procedure GetReflectionWindowLevelContainerIndexes(const X0,Y0: double; const X1,Y1: double; const X3,Y3: double; const pReflectionWindow: TReflectionWindow; const SW,SH: double; out XIndexMin,XIndexMax,YIndexMin,YIndexMax: integer);

    procedure ProcessPoint(X,Y: double; out dX,dY: double);
    var
      QdA2: Extended;
      X_C,X_QdC,X_A1,X_QdB2: Extended;
      Y_C,Y_QdC,Y_A1,Y_QdB2: Extended;
    begin
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
    dX:=X_A1;
    dY:=Y_A1;
    end;

  var
    dX,dY: double;
    dXMin,dYMin,dXMax,dYMax: double;
  begin
  ProcessPoint(pReflectionWindow.Xmn,pReflectionWindow.Ymn, dXMin,dYMin);
  dXMax:=dXMin; dYMax:=dYMin;
  ProcessPoint(pReflectionWindow.Xmx,pReflectionWindow.Ymn, dX,dY);
  if (dX < dXMin)
   then dXMin:=dX
   else
    if (dX > dXMax)
     then dXMax:=dX;
  if (dY < dYMin)
   then dYMin:=dY
   else
    if (dY > dYMax)
     then dYMax:=dY;
  ProcessPoint(pReflectionWindow.Xmx,pReflectionWindow.Ymx, dX,dY);
  if (dX < dXMin)
   then dXMin:=dX
   else
    if (dX > dXMax)
     then dXMax:=dX;
  if (dY < dYMin)
   then dYMin:=dY
   else
    if (dY > dYMax)
     then dYMax:=dY;
  ProcessPoint(pReflectionWindow.Xmn,pReflectionWindow.Ymx, dX,dY);
  if (dX < dXMin)
   then dXMin:=dX
   else
    if (dX > dXMax)
     then dXMax:=dX;
  if (dY < dYMin)
   then dYMin:=dY
   else
    if (dY > dYMax)
     then dYMax:=dY;
  //.
  XIndexMin:=Trunc(dXMin/SW); XIndexMax:=Trunc(dXMax/SW);
  YIndexMin:=Trunc(dYMin/SH); YIndexMax:=Trunc(dYMax/SH);
  end;

  procedure ClearBackground(const Canvas: TCanvas; const Image: TBitmap; const pFigure: TFigureWinRefl);
  type
    PPoints = ^TPoints;
    TPoints = array[0..0] of Windows.TPoint;
  var
    LogBrush: TLogBrush;
    BH: HBrush;
    LogPen: TLogPen;
    PH: HPen;
  begin
  Canvas.Lock;
  try
  Image.Canvas.Lock;
  try
  with LogBrush do begin
  lbStyle:=BS_PATTERN;
  lbHatch:=Image.Handle; 
  lbColor:=ColorToRGB(pFigure.ColorFill);
  end;
  BH:=CreateBrushIndirect(LogBrush);
  with LogPen do begin
  lopnStyle:=PS_NULL;
  lopnWidth.X:=1;
  lopnColor:=ColorToRGB(pFigure.Color);
  end;
  PH:=CreatePenIndirect(LogPen);
  try
  SelectObject(Canvas.Handle,BH);
  SelectObject(Canvas.Handle,PH);
  try
  Windows.Polygon(Canvas.Handle,PPoints(@pFigure.ScreenNodes)^,pFigure.CountScreenNodes);
  finally
  SelectObject(Canvas.Handle,Canvas.Brush.Handle);
  SelectObject(Canvas.Handle,Canvas.Pen.Handle);
  end;
  finally
  DeleteObject(PH);
  DeleteObject(BH);
  end;
  finally
  Image.Canvas.Unlock;
  end;
  finally
  Canvas.Unlock;
  end;
  end;

  function DrawUsingGDIPlus(const CanvasHandle: THandle; const BMP: TBitmap; const SrcWidth,SrcHeight: integer): boolean;
  var
    GDIPlusGraphics: TGPGraphics;
    GDIPlusBitmap: TGPBitmap;
  begin
  GDIPlusGraphics:=TGPGraphics.Create(CanvasHandle);
  try
  GDIPlusBitmap:=TGPBitmap.Create(BMP.Handle,BMP.Palette);
  try
  Result:=(GDIPlusGraphics.DrawImage(GDIPlusBitmap, 0,0, 0,0,SrcWidth,SrcHeight, UnitPixel) = Ok)
  finally
  GDIPlusBitmap.Destroy;
  end;
  finally
  GDIPlusGraphics.Destroy;
  end;
  end;

var
  ptrItem: pointer;
  _Width,_Scale: Double;
  ptrLevel: pointer;
  cntLevel: integer;
  Level: pointer;
  LevelNumber: integer;
  X0,Y0,X1,Y1: Double;
  diffX1X0,diffY1Y0,diffX3X0,diffY3Y0: Double;
  SW,SH: Double;
  Alfa: Double;
  b: Double;
  V: Double;
  S0_X3,S0_Y3: Double;
  S1_X3,S1_Y3: Double;
  Xc,Yc: double;
  CosAlfa,SinAlfa: Double;
  MinFactor,Factor: Double;
  flAllItemsExists,flHasEmptySegment: boolean;
  ItemsTable: pointer;
  ItemsTableSize: integer;
  XIndexMin,XIndexMax,YIndexMin,YIndexMax: integer;
  _ItemsTable: pointer;
  _ItemsTableSize: integer;
  ExceptSegments: TByteArray;
  I,J,L: integer;
  DeferredReflecting: TDetailedPictureDeferredReflecting;

  function ReflectLevel(const Level: pointer; const ItemsTable: pointer; const ItemsTableSize: integer; const XIndexMin,XIndexMax,YIndexMin,YIndexMax: integer; const SW,SH: Double; const ReflectingBMP: TBitmap): boolean;

    function GetBitmapFromJPEGStream(const JPEGStream: TMemoryStream; const Bitmap: TBitmap): boolean;
    var
      iWidth, iHeight, iNChannels: Integer;
      iDIBChannels: integer;
      iStatus: integer;
      jcprops: TJPEG_CORE_PROPERTIES;
      DIB: TDIBSection;
    begin
    Result:=False;
    IJL_Lock.Enter;
    try
    iDIBchannels:=3;
    FillChar(jcprops,SizeOf(jcprops),0);
    iStatus:=ijlInit(@jcprops);
    if (iStatus = IJL_OK)
     then
      try
      jcprops.JPGBytes:=JPEGStream.Memory;
      jcprops.JPGSizeBytes:=JPEGStream.Size;
      iStatus:=ijlRead(@jcprops,IJL_JBUFF_READPARAMS);
      if (iStatus = IJL_OK)
       then begin
        iWidth:=jcprops.JPGWidth;
        iHeight:=jcprops.JPGHeight;
        iNChannels:=jcprops.JPGChannels;
        if (iNChannels = 3)
         then begin
          iDIBChannels:=iNChannels;
          Bitmap.Width:=iWidth;
          Bitmap.Height:=iHeight;
          FillChar(DIB,SizeOf(DIB),0);
          iStatus:=GetObject(Bitmap.Handle,SizeOf(DIB),@DIB);
          if (iStatus <> 0)
           then begin
            jcprops.DIBWidth:=iWidth;
            jcprops.DIBHeight:=-iHeight;
            jcprops.DIBChannels:=iDIBChannels;
            jcprops.DIBColor:=IJL_BGR;
            jcprops.DIBPadBytes:=((((iWidth*iDIBChannels)+3) div 4)*4)-(iWidth*iDIBChannels);
            jcprops.DIBBytes:=System.PByte(DIB.dsBm.bmBits);
            iStatus:=ijlRead(@jcprops,IJL_JBUFF_READWHOLEIMAGE);
            Result:=(iStatus >= 0);
            end;
          end;
        end;
      finally
      ijlFree(@jcprops);
      end;
    finally
    IJL_Lock.Leave;
    end;
    end;

  var
    Xmn,Ymn: integer;
    ReflectingBMPWidth,ReflectingBMPHeight: integer;
    _ReflectingBMP: TBitmap;
    SegmentBMP: TBitmap;
    flDrawSegment: boolean;
    LevelFolder,SegmentFileName: string;
    Segment: pointer;
    XF: XFORM;
    I: integer;
  begin
  Result:=false;
  with TLevelItemOfTDetailedPictureVisualizationCash(Level^) do begin
  if (ItemsTable <> nil)
   then begin
    //. default processing
    Result:=true;
    //. calculating bmp size
    ReflectingBMPWidth:=Trunc(Params.SegmentWidth*(XIndexMax-XIndexMin+1));
    ReflectingBMPHeight:=Trunc(Params.SegmentHeight*(YIndexMax-YIndexMin+1));
    //.
    _ReflectingBMP:=TBitmap.Create();
    _ReflectingBMP.Canvas.Lock();
    try
    _ReflectingBMP.HandleType:=bmDIB;
    _ReflectingBMP.PixelFormat:=pf24bit;
    _ReflectingBMP.Width:=ReflectingBMPWidth;
    _ReflectingBMP.Height:=ReflectingBMPHeight;
    //.
    SegmentBMP:=TBitmap.Create();
    SegmentBMP.Canvas.Lock();
    try
    SegmentBMP.HandleType:=bmDIB;
    SegmentBMP.PixelFormat:=pf24bit;
    for I:=0 to (ItemsTableSize DIV SizeOf(Pointer))-1 do with TSegmentItemOfTDetailedPictureVisualizationCash(Pointer(Pointer(Integer(ItemsTable)+I*SizeOf(Pointer))^)^).Params do begin
      flDrawSegment:=false;
      //.
      TSystemTDetailedPictureVisualization(TypeSystem).Cash.Segment_Lock(Pointer(Pointer(Integer(ItemsTable)+I*SizeOf(Pointer))^));
      try
      if (_DATA = nil)
       then begin
        LevelFolder:=TSystemTDetailedPictureVisualization(TypeSystem).Cash.Item_Level__GetContextFolder(idObj,TLevelItemOfTDetailedPictureVisualizationCash(Level^).Params.ID);
        SegmentFileName:=LevelFolder+'\'+'X'+IntToStr(XIndex)+'Y'+IntToStr(YIndex)+'.jpg';
        _DATA:=TMemoryStream.Create();
        if (FileExists(SegmentFileName)) then _DATA.LoadFromFile(SegmentFileName);
        end;
      //.
      if (_DATA.Size = 0)
       then begin
        Result:=false;
        Break; //. >
        end;
      //.
      if (GetBitmapFromJPEGStream(_DATA,SegmentBMP)) then flDrawSegment:=true;
      finally
      TSystemTDetailedPictureVisualization(TypeSystem).Cash.Segment_Unlock(Pointer(Pointer(Integer(ItemsTable)+I*SizeOf(Pointer))^));
      end;
      //.
      if (flDrawSegment)
       then begin
        //. old ReflectingBMP.Canvas.StretchDraw(Rect(Trunc((XIndex-XIndexMin)*Params.SegmentWidth),Trunc((YIndex-YIndexMin)*Params.SegmentHeight),Round((XIndex-XIndexMin+1)*Params.SegmentWidth),Round((YIndex-YIndexMin+1)*Params.SegmentHeight)),SegmentBMP);
        _ReflectingBMP.Canvas.Draw(Trunc((XIndex-XIndexMin)*Params.SegmentWidth),Trunc((YIndex-YIndexMin)*Params.SegmentHeight),SegmentBMP);
        end;
      end;
    finally
    SegmentBMP.Canvas.Unlock();
    SegmentBMP.Destroy();
    end;
    //. reflecting
    if (Result)
     then begin
      pCanvas.Lock;
      try
      SetGraphicsMode(pCanvas.Handle,GM_ADVANCED);
      with TLevelItemOfTDetailedPictureVisualizationCash(Level^).Params do begin
      pReflectionWindow.Lock.Enter;
      try
      XF.eDx:=(Xc+diffX1X0*(XIndexMin/DivX)+diffX3X0*(YIndexMin/DivY)){///- -pReflectionWindow.Xmn};
      XF.eDy:=(Yc+diffY1Y0*(XIndexMin/DivX)+diffY3Y0*(YIndexMin/DivY)){///- -pReflectionWindow.Ymn};
      finally
      pReflectionWindow.Lock.Leave;
      end;
      end;
      XF.eM11:=CosAlfa;
      XF.eM12:=SinAlfa;
      XF.eM21:=-SinAlfa;
      XF.eM22:=CosAlfa;
      SetWorldTransForm(pCanvas.Handle,XF);
      XF.eDx:=0;
      XF.eDy:=0;
      XF.eM11:=SW/Params.SegmentWidth;
      XF.eM12:=0;
      XF.eM21:=0;
      XF.eM22:=SH/Params.SegmentHeight;
      ModifyWorldTransForm(pCanvas.Handle,XF,MWT_LEFTMULTIPLY);
      try
      Result:=DrawUsingGDIPlus(pCanvas.Handle, _ReflectingBMP,ReflectingBMPWidth,ReflectingBMPHeight)
      finally
      ModifyWorldTransForm(pCanvas.Handle,XF,MWT_IDENTITY);
      end;
      finally
      pCanvas.Unlock;
      end;
      end;
    finally
    _ReflectingBMP.Canvas.Unlock();
    _ReflectingBMP.Destroy();
    end;
    end
   else Result:=true;
  end;
  end;

  procedure SupplyLevelWithSegments(const ptrLevel: pointer); //. same as for TDetailedPictureDeferredReflecting.Execute
  const
    SegmentsGeneration_MaxDepth = 2;
  var
    flAllItemsExists: boolean;
    BA: TByteArray;
    IL,ReceivedSegmentsList: TList;
  begin
  //. try to restore segments from saved context
  try
  flAllItemsExists:=TSystemTDetailedPictureVisualization(TypeSystem).Cash.Item_Level__RestoreSegmentsLocal(ptrItem, ptrLevel, XIndexMin,XIndexMax,YIndexMin,YIndexMax, nil,  IL, ExceptSegments);
  except
    On E: Exception do begin
      EventLog.WriteMinorEvent('TDetailedPictureVisualizationFunctionality.ReflectOnCanvas.SupplyLevelWithSegments','Error of RestoreSegmentsLocal() of DetailedPicture visualization (ID: '+IntToStr(Self.idObj)+')',E.Message);
      Raise; //. =>
      end;
    end;
  if (IL <> nil) then IL.Destroy;
  //.
  if (NOT flAllItemsExists)
   then begin
    //. try to generate segments from down levels
    try
    flAllItemsExists:=TSystemTDetailedPictureVisualization(TypeSystem).Cash.Item_Level__GenerateSegmentsLocal(ptrItem, ptrLevel, XIndexMin,XIndexMax,YIndexMin,YIndexMax, SegmentsGeneration_MaxDepth, nil,  IL, ExceptSegments);
    except
      On E: Exception do begin
        EventLog.WriteMinorEvent('TDetailedPictureVisualizationFunctionality.ReflectOnCanvas.SupplyLevelWithSegments','Error of GenerateSegmentsLocal() of DetailedPicture visualization (ID: '+IntToStr(idObj)+')',E.Message);
        Raise; //. =>
        end;
      end;
    if (IL <> nil) then IL.Destroy;
    //. segments getting from remote server
    if (NOT flAllItemsExists)
     then begin
      with TDetailedPictureVisualizationFunctionality(TComponentFunctionality_Create(idTDetailedPictureVisualization,TItemTDetailedPictureVisualizationCash(ptrItem^).idObj)) do
      try
      try
      Level_GetSegments(TLevelItemOfTDetailedPictureVisualizationCash(ptrLevel^).Params.id, XIndexMin,XIndexMax,YIndexMin,YIndexMax, ExceptSegments, BA);
      except
        On E: Exception do begin
          EventLog.WriteMinorEvent('TDetailedPictureVisualizationFunctionality.ReflectOnCanvas.SupplyLevelWithSegments','Error of Level_GetSegments(idLevel = '+IntToStr(TLevelItemOfTDetailedPictureVisualizationCash(ptrLevel^).Params.id)+') of DetailedPicture visualization (ID: '+IntToStr(idObj)+')',E.Message);
          Raise; //. =>
          end;
        end;
      finally
      Release;
      end; 
      //.
      ReceivedSegmentsList:=TList.Create;
      try
      try
      TDetailedPictureVisualizationCashItemLevel_PrepareSegmentsFromByteArray(TSystemTDetailedPictureVisualization(TypeSystem), Self.idObj, ptrLevel,BA, ReceivedSegmentsList);
      except
        On E: Exception do begin
          EventLog.WriteMinorEvent('TDetailedPictureVisualizationFunctionality.ReflectOnCanvas.SupplyLevelWithSegments','Error of PrepareSegmentsFromByteArray(idLevel = '+IntToStr(TLevelItemOfTDetailedPictureVisualizationCash(ptrLevel^).Params.id)+') of DetailedPicture visualization (ID: '+IntToStr(idObj)+')',E.Message);
          Raise; //. =>
          end;
        end;
      if (ReceivedSegmentsList.Count > 0)
       then begin
        //. update OpenGL segments textures
        try
        if (TSystemTDetailedPictureVisualization(TypeSystem).SegmentsOGLTextures.flEnabled)
         then TSystemTDetailedPictureVisualization(TypeSystem).SegmentsOGLTextures.GenerateSegmentItemsTextures(ReceivedSegmentsList);
        except
          On E: Exception do begin
            EventLog.WriteMinorEvent('TDetailedPictureVisualizationFunctionality.ReflectOnCanvas.SupplyLevelWithSegments','Error of GenerateSegmentItemsTextures() of DetailedPicture visualization (ID: '+IntToStr(idObj)+')',E.Message);
            Raise; //. =>
            end;
          end;
        end;
      finally
      ReceivedSegmentsList.Destroy;
      end;
      //. empty segments degeneration
      try
      if (TSystemTDetailedPictureVisualization(TypeSystem).Cash.Item_Level__DegenerateSegmentsLocal(ptrItem, ptrLevel, XIndexMin,XIndexMax,YIndexMin,YIndexMax, nil,  IL))
       then IL.Destroy;
      except
        On E: Exception do begin
          EventLog.WriteMinorEvent('TDetailedPictureVisualizationFunctionality.ReflectOnCanvas.SupplyLevelWithSegments','Error of DegenerateSegmentsLocal(idLevel = '+IntToStr(TLevelItemOfTDetailedPictureVisualizationCash(ptrLevel^).Params.id)+') of DetailedPicture visualization (ID: '+IntToStr(idObj)+')',E.Message);
          Raise; //. =>
          end;
        end;
      end;
    end;
  end;

begin
Result:=false;
with pFigure do begin
if (Width <= 0) then Exit; //. ->
X0:=Nodes[0].X;Y0:=Nodes[0].Y;
X1:=Nodes[1].X;Y1:=Nodes[1].Y;
diffX1X0:=X1-X0;
diffY1Y0:=Y1-Y0;
_Width:=Sqrt(sqr(diffX1X0)+sqr(diffY1Y0));
b:=(Width*pReflectionWindow.Scale);
pReflectionWindow.Lock.Enter;
try
_Scale:=_Width/(pReflectionWindow.Xmx-pReflectionWindow.Xmn);
finally
pReflectionWindow.Lock.Leave;
end;
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
 then begin Xc:=S0_X3; Yc:=S0_Y3 end
 else begin Xc:=S1_X3; Yc:=S1_Y3 end;
Alfa:=-Alfa;
CosAlfa:=Cos(Alfa);
SinAlfa:=Sin(Alfa);
diffX3X0:=(X0-Xc)*2;
diffY3Y0:=(Y0-Yc)*2;
end;
//.
with TSystemTDetailedPictureVisualization(TypeSystem) do begin
Cash.Lock.BeginRead;
try
if (NOT Cash.NotRecombinatedGetItem(Self.idObj, ptrItem)) then Exit; //. ->
TItemTDetailedPictureVisualizationCash(ptrItem^).ptrObj:=pFigure.ptrObj;
//. get working level
Level:=nil;
MinFactor:=MaxDouble;
cntLevel:=0;
ptrLevel:=TItemTDetailedPictureVisualizationCash(ptrItem^).Levels;
while (ptrLevel <> nil) do with TLevelItemOfTDetailedPictureVisualizationCash(ptrLevel^) do begin
  if (NOT Disabled)
   then begin
    Factor:=Sqr(Params.SegmentWidth*Params.DivX-_Width);
    if (Factor < MinFactor)
     then begin
      Level:=ptrLevel;
      LevelNumber:=cntLevel;
      MinFactor:=Factor;
      end;
    end;
  //. next level
  Inc(cntLevel);
  ptrLevel:=ptrNext;
  end;
//.
if (Level <> nil)
 then begin
  TLevelItemOfTDetailedPictureVisualizationCash(Level^).Lock.BeginRead;
  try
  if ((TLevelItemOfTDetailedPictureVisualizationCash(Level^).Params.VisibleMinScale <> 0) AND ((_Width/(TLevelItemOfTDetailedPictureVisualizationCash(Level^).Params.SegmentWidth*(TLevelItemOfTDetailedPictureVisualizationCash(Level^).Params.DivX)) < TLevelItemOfTDetailedPictureVisualizationCash(Level^).Params.VisibleMinScale)))
   then begin
    Result:=true;
    Exit; //. ->
    end;
  if ((TLevelItemOfTDetailedPictureVisualizationCash(Level^).Params.VisibleMaxScale <> 0) AND ((_Width/(TLevelItemOfTDetailedPictureVisualizationCash(Level^).Params.SegmentWidth*(TLevelItemOfTDetailedPictureVisualizationCash(Level^).Params.DivX)) > TLevelItemOfTDetailedPictureVisualizationCash(Level^).Params.VisibleMaxScale)))
   then begin
    Result:=true;
    Exit; //. ->
    end;
  //. clear background
  ClearBackground(pCanvas, LoadingImage, pAdditionalFigure);
  //.
  with TLevelItemOfTDetailedPictureVisualizationCash(Level^) do begin
  //. get ReflectionWindow level container indexes
  SW:=_Width/Params.DivX;
  SH:=b/Params.DivY;
  GetReflectionWindowLevelContainerIndexes(Xc,Yc, Xc+diffX1X0,Yc+diffY1Y0, Xc+diffX3X0,Yc+diffY3Y0, pReflectionWindow, SW,SH,  XIndexMin,XIndexMax,YIndexMin,YIndexMax);
  if (XIndexMin < 0) then XIndexMin:=0;
  if (XIndexMax >= Params.DivX) then XIndexMax:=Params.DivX-1;
  if (XIndexMin > XIndexMax)
   then begin //. out of bounds
    Result:=true;
    Exit; //. ->
    end;
  if (YIndexMin < 0) then YIndexMin:=0;
  if (YIndexMax >= Params.DivY) then YIndexMax:=Params.DivY-1;
  if (YIndexMin > YIndexMax)
   then begin //. out of bounds
    Result:=true;
    Exit; //. ->
    end;
  end;
  //.
  if (((XIndexMax-XIndexMin+1)*(YIndexMax-YIndexMin+1)) > MaxSegmentsForProcess)
   then begin
    Result:=false;
    Exit; //. ->
    end;
  //.
  flAllItemsExists:=TTDetailedPictureVisualizationCash(TSystemTDetailedPictureVisualization(TypeSystem).Cash).Item_Level__GetVisibleSegmentsLocal(ptrItem, Level, XIndexMin,XIndexMax,YIndexMin,YIndexMax, false, true, nil,  ItemsTable,ItemsTableSize, ExceptSegments, @flHasEmptySegment);
  try
  if (NOT flAllItemsExists OR flHasEmptySegment)
   then SupplyLevelWithSegments(Level)
   else Result:=ReflectLevel(Level, ItemsTable,ItemsTableSize, XIndexMin,XIndexMax,YIndexMin,YIndexMax, SW,SH, ReflectingBMP);
  finally
  if (ItemsTable <> nil) then FreeMem(ItemsTable,ItemsTableSize);
  end;
  if (NOT Result)
   then begin
    flAllItemsExists:=TTDetailedPictureVisualizationCash(TSystemTDetailedPictureVisualization(TypeSystem).Cash).Item_Level__GetVisibleSegmentsLocal(ptrItem, Level, XIndexMin,XIndexMax,YIndexMin,YIndexMax, false, true, nil,  ItemsTable,ItemsTableSize, ExceptSegments, @flHasEmptySegment);
    try
    if (flAllItemsExists AND NOT flHasEmptySegment)
     then Result:=ReflectLevel(Level, ItemsTable,ItemsTableSize, XIndexMin,XIndexMax,YIndexMin,YIndexMax, SW,SH, ReflectingBMP);
    finally
    if (ItemsTable <> nil) then FreeMem(ItemsTable,ItemsTableSize);
    end;
    end;
  finally
  TLevelItemOfTDetailedPictureVisualizationCash(Level^).Lock.EndRead;
  end;
  end
 else Exit; //. ->
finally
Cash.Lock.EndRead;
end;
end;
end
;

function TDetailedPictureVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TDetailedPictureVisualizationPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;

function TDetailedPictureVisualizationFunctionality.DATASize: integer;
begin
Result:=Inherited DATASize;
end
;

procedure TDetailedPictureVisualizationFunctionality.SetProportion(const Value: double);
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

function TDetailedPictureVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=RemotedFunctionality.GetOwner(idTOwner,idOwner);
end;

function TDetailedPictureVisualizationFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TDetailedPictureVisualizationFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

procedure TDetailedPictureVisualizationFunctionality.SetParams(const pWidth: integer; const pHeight: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

procedure TDetailedPictureVisualizationFunctionality.Clear;
begin
Raise Exception.Create(SNotSupported); //. =>
end
;
procedure TDetailedPictureVisualizationFunctionality.GetParams(out oWidth: integer; out oHeight: integer);
begin
RemotedFunctionality.GetParams(oWidth,oHeight);
end;

procedure TDetailedPictureVisualizationFunctionality.GenerateFromImage(DATAStream: TByteArray);
begin
RemotedFunctionality.GenerateFromImage(DATAStream);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TDetailedPictureVisualizationFunctionality.GetLevelsInfo(out Info: TByteArray);
begin
RemotedFunctionality.GetLevelsInfo(Info);
end;

procedure TDetailedPictureVisualizationFunctionality.GetLevelsInfoLocally(out Info: TByteArray);
//. ! do not use under TSystemTDetailedPictureVisualization(TypeSystem).Cash.Lock
var
  ptrItem: pointer;
  ptrLevel: pointer;
  LevelsCount: integer;
  LI: integer;
begin
Space.Lock.Enter;
try
TSystemTDetailedPictureVisualization(TypeSystem).Cash.Lock.BeginRead;
try
ptrItem:=TSystemTDetailedPictureVisualization(TypeSystem).Cash.NotRecombinatedGetPtrItem(idObj);
if (ptrItem = nil)
 then begin
  Space.Obj_CheckCachedState(Ptr,false);
  ptrItem:=TSystemTDetailedPictureVisualization(TypeSystem).Cash.NotRecombinatedGetPtrItem(idObj);
  if (ptrItem = nil) then Raise Exception.Create('TDetailedPictureVisualizationFunctionality.GetLevelsInfoLocally: context item is not found'); //. =>
  end;
with TItemTDetailedPictureVisualizationCash(ptrItem^) do begin
ptrLevel:=Levels;
LevelsCount:=0;
while (ptrLevel <> nil) do begin
  Inc(LevelsCount);
  ptrLevel:=TLevelItemOfTDetailedPictureVisualizationCash(ptrLevel^).ptrNext;
  end;
//.
SetLength(Info,LevelsCount*SizeOf(TDetailedPictureVisualizationLevel));
LI:=0;
ptrLevel:=Levels;
while (ptrLevel <> nil) do with TLevelItemOfTDetailedPictureVisualizationCash(ptrLevel^) do begin
  TDetailedPictureVisualizationLevel(Pointer(@Info[(LevelsCount-LI-1)*SizeOf(TDetailedPictureVisualizationLevel)])^):=Params;
  Inc(LI);
  //.
  ptrLevel:=ptrNext;
  end;
end;
finally
TSystemTDetailedPictureVisualization(TypeSystem).Cash.Lock.EndRead;
end;
finally
Space.Lock.Leave;
end;
end;

procedure TDetailedPictureVisualizationFunctionality.Level_GetSegments(const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const ExceptSegments: TByteArray; out Segments: TByteArray);
begin
RemotedFunctionality.Level_GetSegments(idLevel,XIndexMin,XIndexMax,YIndexMin,YIndexMax,ExceptSegments,Segments);
end;

procedure TDetailedPictureVisualizationFunctionality.Level_GetParams(const idLevel: integer; out DivX: integer; out DivY: integer; out SegmentWidth: double; out SegmentHeight: double; out VisibleMinScale: double; out VisibleMaxScale: double);
begin
RemotedFunctionality.Level_GetParams(idLevel,DivX,DivY,SegmentWidth,SegmentHeight,VisibleMinScale,VisibleMaxScale);
end;

procedure TDetailedPictureVisualizationFunctionality.Level_SetParams(const idLevel: integer; const DivX: integer; const DivY: integer; const SegmentWidth: double; const SegmentHeight: double; const VisibleMinScale: double; const VisibleMaxScale: double);
begin
RemotedFunctionality.Level_SetParams(idLevel,DivX,DivY,SegmentWidth,SegmentHeight,VisibleMinScale,VisibleMaxScale);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TDetailedPictureVisualizationFunctionality.Level_GetSegmentsByIDs(const idLevel: integer; const SegmentsIDs: TByteArray; out Segments: TByteArray);
begin
RemotedFunctionality.Level_GetSegmentsByIDs(idLevel,SegmentsIDs,Segments);
end;

procedure TDetailedPictureVisualizationFunctionality.Level_GetSegmentsHashes(const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const ExceptSegments: TByteArray; out SegmentsHashes: TByteArray);
begin
RemotedFunctionality.Level_GetSegmentsHashes(idLevel,XIndexMin,XIndexMax,YIndexMin,YIndexMax,ExceptSegments,SegmentsHashes);
end;

procedure TDetailedPictureVisualizationFunctionality.Level_SetSegments(const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const Segments: TByteArray);
begin
RemotedFunctionality.Level_SetSegments(idLevel,XIndexMin,XIndexMax,YIndexMin,YIndexMax,Segments);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TDetailedPictureVisualizationFunctionality.Level_ConvertPixPosToXY(const idLevel: integer; const PixX,PixY: integer; out X,Y: double);
var
  DivX,DivY: integer;
  SegmentWidth: double;
  SegmentHeight: double;
  VisibleMinScale: double;
  VisibleMaxScale: double;
  Obj: TSpaceObj;
  Col_dX,Col_dY: double;
  Row_dX,Row_dY: double;
  N0,N1,N3: TNodeSpaceObjPolyLinePolygon;
  PixLength: integer;
  Col_Factor,Row_Factor: double;
begin
Level_GetParams(idLevel, DivX,DivY, SegmentWidth,SegmentHeight, VisibleMinScale,VisibleMaxScale);
if ((DivX <> DivY) OR (SegmentWidth <> SegmentHeight)) then Raise Exception.Create('wrong obj parameters'); //. =>
Space.ReadObj(Obj,SizeOf(Obj), Ptr);
with TSpaceObjPolyLinePolygon.Create(Space, Obj) do
try
if (Count <> 4) then Raise Exception.Create('wrong object'); //. =>
N0:=Nodes[0]; N1:=Nodes[1]; N3:=Nodes[3];
Col_dX:=(N1.X-N0.X); Col_dY:=(N1.Y-N0.Y);
Row_dX:=(N3.X-N0.X); Row_dY:=(N3.Y-N0.Y);
PixLength:=Trunc(DivX*SegmentWidth);
Col_Factor:=PixX/PixLength;
Row_Factor:=PixY/PixLength; //. PixLength the same as for X
X:=N0.X+Col_dX*Col_Factor+Row_dX*Row_Factor;
Y:=N0.Y+Col_dY*Col_Factor+Row_dY*Row_Factor;
finally
Destroy;
end;
end;

procedure TDetailedPictureVisualizationFunctionality.Level_ConvertXYToPixPos(const idLevel: integer; const X,Y: double; out PixX,PixY: integer);

  procedure ProcessPoint(const X0,Y0,X1,Y1,X3,Y3: Extended; const X,Y: Extended; out Xfactor,Yfactor: Extended);
  var
    QdA2: Extended;
    X_C,X_QdC,X_A1,X_QdB2: Extended;
    Y_C,Y_QdC,Y_A1,Y_QdB2: Extended;
  begin
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
  Xfactor:=X_A1/X_C;
  Yfactor:=Y_A1/Y_C;
  end;

var
  DivX,DivY: integer;
  SegmentWidth: double;
  SegmentHeight: double;
  VisibleMinScale: double;
  VisibleMaxScale: double;
  Obj: TSpaceObj;
  N0,N1,N3: TNodeSpaceObjPolyLinePolygon;
  Xfactor,Yfactor: Extended;
begin
Level_GetParams(idLevel, DivX,DivY, SegmentWidth,SegmentHeight, VisibleMinScale,VisibleMaxScale);
if ((DivX <> DivY) OR (SegmentWidth <> SegmentHeight)) then Raise Exception.Create('wrong obj parameters'); //. =>
Space.ReadObj(Obj,SizeOf(Obj), Ptr);
with TSpaceObjPolyLinePolygon.Create(Space, Obj) do
try
if (Count <> 4) then Raise Exception.Create('wrong object'); //. =>
N0:=Nodes[0]; N1:=Nodes[1]; N3:=Nodes[3];
//.
ProcessPoint(N0.X,N0.Y,N1.X,N1.Y,N3.X,N3.Y, X,Y,  Xfactor,Yfactor);
//.
PixX:=Trunc(Xfactor*(DivX*SegmentWidth));
PixY:=Trunc(Yfactor*(DivX*SegmentWidth)); //. same as for X
finally
Destroy;
end;
end;

procedure TDetailedPictureVisualizationFunctionality.GetCoordinates(out X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double);
begin
RemotedFunctionality.GetCoordinates(X0,Y0,X1,Y1,X2,Y2,X3,Y3);
end;

procedure TDetailedPictureVisualizationFunctionality.GenerateFromTiles(const TilesFolder: string; const SizePowerOf2: integer);
begin
RemotedFunctionality.GenerateFromTiles(TilesFolder,SizePowerOf2);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TDetailedPictureVisualizationFunctionality.RegenerateRegionFromLevel(const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer);
begin
RemotedFunctionality.RegenerateRegionFromLevel(idLevel,XIndexMin,XIndexMax,YIndexMin,YIndexMax);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TDetailedPictureVisualizationFunctionality.RegenerateRegion(const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer);
begin
RemotedFunctionality.RegenerateRegion(XIndexMin,XIndexMax,YIndexMin,YIndexMax);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TDetailedPictureVisualizationFunctionality.AddNewLevelAndRegenerate;
begin
RemotedFunctionality.AddNewLevelAndRegenerate;
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TDetailedPictureVisualizationFunctionality.GetSegmentsStorageType: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

procedure TDetailedPictureVisualizationFunctionality.SetSegmentsStorageType(Value: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

function TDetailedPictureVisualizationFunctionality.TLevelsPropsPanel_Create: TForm;
begin
Result:=TfmDetailedPictureLevels.Create(idObj);
end
;

function TDetailedPictureVisualizationFunctionality.ContainerFilled: boolean;
begin
Result:=true;
end
;



{TTGeodesyPointFunctionality}
procedure TTGeodesyPointFunctionality.GetNearestCrdSys(const pLatitude,pLongitude: double; out idCrdSys: integer);
begin
RemotedFunctionality.GetNearestCrdSys(pLatitude,pLongitude,idCrdSys);
end;

procedure TTGeodesyPointFunctionality.GetInstanceListByCrdSys(const idCrdSys: integer; out List: TByteArray);
begin
RemotedFunctionality.GetInstanceListByCrdSys(idCrdSys,List);
end;


function TTGeodesyPointFunctionality.CrdSys_GetNearestGeoPoints(const idCrdSys: integer; const pLatitude,pLongitude: double; const PointsCount: integer; out Points: TByteArray): boolean;
begin
if (NOT Space.flOffline)
 then begin
  Result:=RemotedFunctionality.CrdSys_GetNearestGeoPoints(idCrdSys,pLatitude,pLongitude,PointsCount,Points);
  TSystemTGeodesyPoint(TypeSystem).CrdSysCache.CrdSys_AddGeodesyPoints(idCrdSys,Points);
  end
 else Result:=TSystemTGeodesyPoint(TypeSystem).CrdSysCache.CrdSys_GetNearestGeoPoints(idCrdSys,pLatitude,pLongitude,PointsCount,Points);
end;

function TTGeodesyPointFunctionality.CrdSys_GetNearestXYPoints(const idCrdSys: integer; const pX,pY: double; const PointsCount: integer; out Points: TByteArray): boolean;
begin
if (NOT Space.flOffline)
 then begin
  Result:=RemotedFunctionality.CrdSys_GetNearestXYPoints(idCrdSys,pX,pY,PointsCount,Points);
  TSystemTGeodesyPoint(TypeSystem).CrdSysCache.CrdSys_AddGeodesyPoints(idCrdSys,Points);
  end
 else Result:=TSystemTGeodesyPoint(TypeSystem).CrdSysCache.CrdSys_GetNearestXYPoints(idCrdSys,pX,pY,PointsCount,Points);
end;


{TGeodesyPointFunctionality}
function TGeodesyPointFunctionality.getidCrdSys: integer;
begin
Result:=RemotedFunctionality.getidCrdSys;
end;

procedure TGeodesyPointFunctionality.setidCrdSys(Value: integer);
begin
RemotedFunctionality.setidCrdSys(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TGeodesyPointFunctionality.getX: Double;
begin
Result:=RemotedFunctionality.getX;
end;

procedure TGeodesyPointFunctionality.setX(Value: Double);
begin
RemotedFunctionality.setX(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TGeodesyPointFunctionality.getY: Double;
begin
Result:=RemotedFunctionality.getY;
end;

procedure TGeodesyPointFunctionality.setY(Value: Double);
begin
RemotedFunctionality.setY(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TGeodesyPointFunctionality.GetParams(out oidCrdSys: integer; out oX,oY: double; out oLatitude,oLongitude: double);
begin
RemotedFunctionality.GetParams(oidCrdSys,oX,oY,oLatitude,oLongitude);
end;

procedure TGeodesyPointFunctionality.SetParams(const pidCrdSys: integer; const pX,pY: double; const pLatitude,pLongitude: double);
begin
RemotedFunctionality.SetParams(pidCrdSys,pX,pY,pLatitude,pLongitude);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TGeodesyPointFunctionality.ValidateByVisualizationComponent;
begin
RemotedFunctionality.ValidateByVisualizationComponent;
//. update local TypesSystem and representations
Space.StayUpToDate;
end;



{TTHINTVisualizationFunctionality}

Constructor TTHINTVisualizationFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTHINTVisualization;
RemotedFunctionality:=TTHINTVisualizationFunctionalityRemoted.Create(Self);
end
;
Destructor TTHINTVisualizationFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


function TTHINTVisualizationFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

function TTHINTVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=THINTVisualizationFunctionality.Create(Self, idComponent);
end
;

function TTHINTVisualizationFunctionality.getName: string;
begin
Result:=nmTHINTVisualization;
end
;

function TTHINTVisualizationFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TypesDef\HINTVisualization\HINTVisualization.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

function TTHINTVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TObjectVisualization.Create;
with Result do begin
Color:=clWhite;
Width:=0;
flLoop:=false;
AddPoint(-50,0);
AddPoint(50,0);
end;
end
;

procedure TTHINTVisualizationFunctionality.GetInstanceParams(const IDs: TByteArray; const MaxInstanceSize: integer; out Params: TByteArray);
begin
RemotedFunctionality.GetInstanceParams(IDs,MaxInstanceSize,{out} Params);
end;

procedure TTHINTVisualizationFunctionality.GetInstanceParams1(const IDs: TByteArray; const MaxInstanceSize: integer; out Params: TByteArray);
begin
RemotedFunctionality.GetInstanceParams1(IDs,MaxInstanceSize,{out} Params);
end;

procedure TTHINTVisualizationFunctionality.GetInstanceOwnerDatasAndParams(const IDs: TByteArray; const DataFlags: TComponentDataFlags; const MaxInstanceSize: integer; out Data: TByteArray; out Params: TByteArray);
begin
RemotedFunctionality.GetInstanceOwnerDatasAndParams(IDs,DataFlags,MaxInstanceSize,{out} Data,{out} Params);
end;


{THINTVisualizationFunctionality}
Constructor THINTVisualizationFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=THINTVisualizationFunctionalityRemoted.Create(Self);
end;

Destructor THINTVisualizationFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


procedure THINTVisualizationFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

procedure THINTVisualizationFunctionality.DestroyData;
begin
Raise Exception.Create(SNotSupported); //. =>
end
;
procedure THINTVisualizationFunctionality.CloneData(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

procedure THINTVisualizationFunctionality.LoadFromFile(const FileName: string);
var
  MemoryStream: TMemoryStream;
begin
MemoryStream:=TMemoryStream.Create;
try
MemoryStream.LoadFromFile(FileName);
SetDATA(MemoryStream,cftBMP);
finally
MemoryStream.Destroy;
end;
end
;

function THINTVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
begin
Result:=false;
if (FReflector = nil)
 then begin
  Result:=true;
  Exit; //. ->
  end;
with TReflector(FReflector) do Result:=(NOT ((Mode = rmEditing) OR (NOT DynamicHints.flEnabled) OR ((EditingOrCreatingObject <> nil) AND (EditingOrCreatingObject.PrototypePtr = pFigure.ptrObj))));
end
;

function THINTVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=THINTVisualizationPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;

function THINTVisualizationFunctionality.DATASize: integer;
begin
Result:=Inherited DATASize;
end
;
function THINTVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=RemotedFunctionality.GetOwner(idTOwner,idOwner);
end;

function THINTVisualizationFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function THINTVisualizationFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

procedure THINTVisualizationFunctionality.GetDATA(out DATAStream: TMemoryStream; out DATAType: TComponentFileType);
var
  BA: TByteArray;
  DT: integer;
begin
GetDATA(BA,DT); DATAType:=TComponentFileType(DT);
ByteArray_CreateStream(BA, TMemoryStream(DATAStream));
end;

procedure THINTVisualizationFunctionality.GetDATA(out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer);
var
  BA: TByteArray;
  DT: integer;
begin
GetDATA(BA,DT,MaxSize); DATAType:=TComponentFileType(DT);
ByteArray_CreateStream(BA, TMemoryStream(DATAStream));
end;

procedure THINTVisualizationFunctionality.GetDATA(out DATAStream: TByteArray; out DATAType: Integer);
begin
RemotedFunctionality.GetDATA(DATAStream,DATAType);
end;

procedure THINTVisualizationFunctionality.GetDATA(out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer);
begin
RemotedFunctionality.GetDATA1(DATAStream,DATAType,MaxSize);
end;

procedure THINTVisualizationFunctionality.SetDATA(DATAStream: TMemoryStream; const DATAType: TComponentFileType);
var
  BA: TByteArray;
begin
ByteArray_PrepareFromStream(BA,DATAStream);
SetDATA(BA,Integer(DATAType));
end;

procedure THINTVisualizationFunctionality.SetDATA(DATAStream: TByteArray; const DATAType: integer);
begin
RemotedFunctionality.SetDATA(DATAStream,DATAType);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure THINTVisualizationFunctionality.GetPrivateDATA(out DATAStream: TMemoryStream);
var
  BA: TByteArray;
begin
GetPrivateDATA(BA);
ByteArray_CreateStream(BA, TMemoryStream(DATAStream));
end;

procedure THINTVisualizationFunctionality.GetPrivateDATA(out DATAStream: TMemoryStream; const MaxSize: integer);
var
  BA: TByteArray;
begin
GetPrivateDATA(BA,MaxSize);
ByteArray_CreateStream(BA, TMemoryStream(DATAStream));
end;

procedure THINTVisualizationFunctionality.GetPrivateDATA(out DATAStream: TByteArray);
begin
RemotedFunctionality.GetPrivateDATA(DATAStream);
end;

procedure THINTVisualizationFunctionality.GetPrivateDATA(out DATAStream: TByteArray; const MaxSize: integer);
begin
RemotedFunctionality.GetPrivateDATA1(DATAStream,MaxSize);
end;

procedure THINTVisualizationFunctionality.SetPrivateDATA(DATAStream: TMemoryStream);
var
  BA: TByteArray;
begin
ByteArray_PrepareFromStream(BA,DATAStream);
SetPrivateDATA(BA);
end;

procedure THINTVisualizationFunctionality.SetPrivateDATA(DATAStream: TByteArray);
begin
RemotedFunctionality.SetPrivateDATA(DATAStream);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function THINTVisualizationFunctionality.getDATAFileID: integer;
begin
Result:=RemotedFunctionality.getDATAFileID;
end;

procedure THINTVisualizationFunctionality.setDATAFileID(Value: integer);
begin
RemotedFunctionality.setDATAFileID(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure THINTVisualizationFunctionality.DATAFile_Clear;
begin
RemotedFunctionality.DATAFile_Clear;
//. update local TypesSystem and representations
Space.StayUpToDate;
end;


{TTFilterVisualizationFunctionality}
Constructor TTFilterVisualizationFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTFilterVisualization;
RemotedFunctionality:=TTFilterVisualizationFunctionalityRemoted.Create(Self);
end
;
Destructor TTFilterVisualizationFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


function TTFilterVisualizationFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

function TTFilterVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TFilterVisualizationFunctionality.Create(Self, idComponent);
end
;

function TTFilterVisualizationFunctionality.getName: string;
begin
Result:=nmTFilterVisualization;
end
;

function TTFilterVisualizationFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TypesDef\FilterVisualization\FilterVisualization.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

function TTFilterVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TObjectVisualization.Create;
with Result do begin
Color:=clWhite;
Width:=0;
flLoop:=true;
flFill:=true;
ColorFill:=clWhite;
AddPoint(1,1);
AddPoint(1,-1);
AddPoint(-1,-1);
AddPoint(-1,1);
end;
end
;

{TFilterVisualizationFunctionality}
Constructor TFilterVisualizationFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TFilterVisualizationFunctionalityRemoted.Create(Self);
end;

Destructor TFilterVisualizationFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


procedure TFilterVisualizationFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

procedure TFilterVisualizationFunctionality.DestroyData;
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

procedure TFilterVisualizationFunctionality.CloneData(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

function TFilterVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
var
  ptrItem: pointer;
  Fig: TFigureWinRefl;
  Fig_Xmn,Fig_Ymn,Fig_Xmx,Fig_Ymx: integer;
  Fig_Width,Fig_Height: integer;

  function ProcessContrasting: boolean;
  var
    ptrPixel: pointer;
    XSize,YSize,YStep: integer;
    Factor: ShortInt;
  begin
  Result:=false;
  if (TItemTFilterVisualizationCash(ptrItem^).FilterDATA.Size = 0)
   then begin
    Result:=true;
    Exit; //. ->
    end;
  Factor:=ShortInt(TItemTFilterVisualizationCash(ptrItem^).FilterDATA.Memory^);
  if (Factor <> 0)
   then begin
    ptrPixel:=TSystemTFilterVisualization(TypeSystem).Reflecting__DIB_PixelsPtr;
    XSize:=Fig_Width;
    YSize:=Fig_Height;
    YStep:=(TSystemTFilterVisualization(TypeSystem).Reflecting__DIB_BitInfo.bmiHeader.biWidth*(TSystemTFilterVisualization(TypeSystem).Reflecting__DIB_BitInfo.bmiHeader.biBitCount DIV 8));
    if ((YStep MOD 4) > 0) then YStep:=YStep-(YStep MOD 4)+4;
    if (Factor > 0)
     then begin
      asm
            PUSH EAX
            PUSH ECX
            PUSH EDX
            PUSH EDI
            MOV EDI,ptrPixel
            MOV ECX,YSize
            MOV DL,Factor
            CLD
        @M0:  PUSH ECX
              PUSH EDI
              MOV ECX,XSize
          @M1:  MOV AL,[EDI] //. get "B"
                MUL DL
                STOSB
                MOV AL,[EDI] //. get "G"
                MUL DL
                STOSB
                MOV AL,[EDI] //. get "R"
                MUL DL
                STOSB
                LOOP @M1
              POP EDI
              POP ECX
              ADD EDI,YStep
              LOOP @M0
            POP EDI
            POP EDX
            POP ECX
            POP EAX
      end;
      end
     else begin
      Factor:=-Factor;
      asm
            PUSH EAX
            PUSH ECX
            PUSH EDX
            PUSH EDI
            MOV EDI,ptrPixel
            MOV ECX,YSize
            MOV DL,Factor
            CLD
        @M0:  PUSH ECX
              PUSH EDI
              MOV ECX,XSize
          @M1:  MOV AL,[EDI] //. get "B"
                XOR AH,AH
                DIV DL
                STOSB
                MOV AL,[EDI] //. get "G"
                XOR AH,AH
                DIV DL
                STOSB
                MOV AL,[EDI] //. get "R"
                XOR AH,AH
                DIV DL
                STOSB
                LOOP @M1
              POP EDI
              POP ECX
              ADD EDI,YStep
              LOOP @M0
            POP EDI
            POP EDX
            POP ECX
            POP EAX
      end;
      end;
    end;
  Result:=true;
  end;

  function ProcessFastContrasting: boolean;
  var
    ptrPixel: pointer;
    XSize,YSize,YStep: integer;
    Factor: ShortInt;
  begin
  Result:=false;
  if (TItemTFilterVisualizationCash(ptrItem^).FilterDATA.Size = 0)
   then begin
    Result:=true;
    Exit; //. ->
    end;
  Factor:=ShortInt(TItemTFilterVisualizationCash(ptrItem^).FilterDATA.Memory^);
  if (Factor <> 0)
   then begin
    ptrPixel:=TSystemTFilterVisualization(TypeSystem).Reflecting__DIB_PixelsPtr;
    XSize:=Fig_Width;
    YSize:=Fig_Height;
    YStep:=(TSystemTFilterVisualization(TypeSystem).Reflecting__DIB_BitInfo.bmiHeader.biWidth*(TSystemTFilterVisualization(TypeSystem).Reflecting__DIB_BitInfo.bmiHeader.biBitCount DIV 8));
    if ((YStep MOD 4) > 0) then YStep:=YStep-(YStep MOD 4)+4;
    if (Factor > 0)
     then begin
      asm
            PUSH EAX
            PUSH ECX
            PUSH EDX
            PUSH ESI
            PUSH EDI
            MOV ESI,ptrPixel
            MOV EDI,ESI
            MOV ECX,YSize
            MOV DL,Factor
            CLD
        @M0:  PUSH ECX
              PUSH ESI
              MOV ECX,XSize
          @M1:  XCHG CL,DL
                LODSB //. get "B"
                SHL AL,CL
                STOSB
                LODSB //. get "G"
                SHL AL,CL
                STOSB
                LODSB //. get "R"
                SHL AL,CL
                STOSB
                XCHG CL,DL
                LOOP @M1
              POP ESI
              POP ECX
              ADD ESI,YStep
              MOV EDI,ESI
              LOOP @M0
            POP EDI
            POP ESI
            POP EDX
            POP ECX
            POP EAX
      end;
      end
     else begin
      Factor:=-Factor;
      asm
            PUSH EAX
            PUSH ECX
            PUSH EDX
            PUSH ESI
            PUSH EDI
            MOV ESI,ptrPixel
            MOV EDI,ESI
            MOV ECX,YSize
            MOV DL,Factor
            CLD
        @M0:  PUSH ECX
              PUSH ESI
              MOV ECX,XSize
          @M1:  XCHG CL,DL
                LODSB //. get "B"
                SHR AL,CL
                STOSB
                LODSB //. get "G"
                SHR AL,CL
                STOSB
                LODSB //. get "R"
                SHR AL,CL
                STOSB
                XCHG CL,DL
                LOOP @M1
              POP ESI
              POP ECX
              ADD ESI,YStep
              MOV EDI,ESI
              LOOP @M0
            POP EDI
            POP ESI
            POP EDX
            POP ECX
            POP EAX
      end;
      end;
    end;
  Result:=true;
  end;

  function ProcessColorScaling: boolean;
  var
    ptrPixel: pointer;
    XSize,YSize,YStep: integer;
    Color: TColor;
    Factor: Byte;
    CR,CG,CB: word;
  begin
  Result:=false;
  if (TItemTFilterVisualizationCash(ptrItem^).FilterDATA.Size = 0)
   then begin
    Result:=true;
    Exit; //. ->
    end;
  Factor:=Byte(TItemTFilterVisualizationCash(ptrItem^).FilterDATA.Memory^);
  if (Factor > 0)
   then begin
    ptrPixel:=TSystemTFilterVisualization(TypeSystem).Reflecting__DIB_PixelsPtr;
    XSize:=Fig_Width;
    YSize:=Fig_Height;
    YStep:=(TSystemTFilterVisualization(TypeSystem).Reflecting__DIB_BitInfo.bmiHeader.biWidth*(TSystemTFilterVisualization(TypeSystem).Reflecting__DIB_BitInfo.bmiHeader.biBitCount DIV 8));
    if ((YStep MOD 4) > 0) then YStep:=YStep-(YStep MOD 4)+4;
    Color:=Fig.ColorFill;
    CR:=Round(Lo(Color)*(Factor/256));
    CG:=Round(Lo(Color SHR 8)*(Factor/256));
    CB:=Round(Lo(Color SHR 16)*(Factor/256));
    asm
          PUSH EAX
          PUSH EBX
          PUSH ECX
          PUSH EDX
          PUSH ESI
          PUSH EDI
          MOV EDI,ptrPixel
          MOV ECX,YSize
          MOV SI,3*256
          CLD
      @M0:  PUSH ECX
            PUSH EDI
            MOV ECX,XSize
        @M1:  MOV BL,[EDI] //. get colors sum
              XOR BH,BH
              MOV AL,[EDI+1]
              XOR AH,AH
              ADD BX,AX
              MOV AL,[EDI+2]
              ADD BX,AX
              //.
              MOV AX,CB //. get "B"
              MUL BX
              DIV SI
              XOR AH,AH
              STOSB
              MOV AX,CG //. get "G"
              MUL BX
              DIV SI
              XOR AH,AH
              STOSB
              MOV AX,CR //. get "R"
              MUL BX
              DIV SI
              XOR AH,AH
              STOSB
              //.
              LOOP @M1
            POP EDI
            POP ECX
            ADD EDI,YStep
            LOOP @M0
          POP EDI
          POP ESI
          POP EDX
          POP ECX
          POP EBX
          POP EAX
    end;
    end;
  Result:=true;
  end;

  function ProcessColorMixing: boolean;
  var
    ptrPixel: pointer;
    XSize,YSize,YStep: integer;
    Factor: byte;
    MixColor: TColor;
    MCR,MCG,MCB: word;
  begin
  Result:=false;
  if (TItemTFilterVisualizationCash(ptrItem^).FilterDATA.Size = 0)
   then begin
    Result:=true;
    Exit; //. ->
    end;
  Factor:=Byte(TItemTFilterVisualizationCash(ptrItem^).FilterDATA.Memory^);
  if (Factor > 0)
   then begin
    ptrPixel:=TSystemTFilterVisualization(TypeSystem).Reflecting__DIB_PixelsPtr;
    XSize:=Fig_Width;
    YSize:=Fig_Height;
    YStep:=(TSystemTFilterVisualization(TypeSystem).Reflecting__DIB_BitInfo.bmiHeader.biWidth*(TSystemTFilterVisualization(TypeSystem).Reflecting__DIB_BitInfo.bmiHeader.biBitCount DIV 8));
    if ((YStep MOD 4) > 0) then YStep:=YStep-(YStep MOD 4)+4;
    MixColor:=Fig.ColorFill;
    MCR:=Round(Lo(MixColor)*(Factor/256));
    MCG:=Round(Lo(MixColor SHR 8)*(Factor/256));
    MCB:=Round(Lo(MixColor SHR 16)*(Factor/256));
    Factor:=256-Factor;
    asm
          PUSH EAX
          PUSH EBX
          PUSH ECX
          PUSH EDX
          PUSH EDI
          MOV EDI,ptrPixel
          MOV ECX,YSize
          MOV BL,Factor
          MOV BH,255
          CLD
      @M0:  PUSH ECX
            PUSH EDI
            MOV ECX,XSize
        @M1:  MOV AL,[EDI] //. get "B"
              MUL BL
              DIV BH
              XOR AH,AH
              MOV DX,MCB
              ADD AX,DX
              SHR AX,1
              STOSB
              MOV AL,[EDI] //. get "G"
              MUL BL
              DIV BH
              XOR AH,AH
              MOV DX,MCG
              ADD AX,DX
              SHR AX,1
              STOSB
              MOV AL,[EDI] //. get "R"
              MUL BL
              DIV BH
              XOR AH,AH
              MOV DX,MCR
              ADD AX,DX
              SHR AX,1
              STOSB
              LOOP @M1
            POP EDI
            POP ECX
            ADD EDI,YStep
            LOOP @M0
          POP EDI
          POP EDX
          POP ECX
          POP EBX
          POP EAX
    end;
    end;
  Result:=true;
  end;

  function ProcessFastColorMixing: boolean;
  var
    ptrPixel: pointer;
    XSize,YSize,YStep: integer;
    Factor: byte;
    ImageFactor: byte;
    MixColor: TColor;
    MCR,MCG,MCB: byte;
  begin
  Result:=false;
  if (TItemTFilterVisualizationCash(ptrItem^).FilterDATA.Size = 0)
   then begin
    Result:=true;
    Exit; //. ->
    end;
  Factor:=Byte(TItemTFilterVisualizationCash(ptrItem^).FilterDATA.Memory^);
  ImageFactor:=Byte(Pointer(Integer(TItemTFilterVisualizationCash(ptrItem^).FilterDATA.Memory)+1)^);
  if (Factor > 0)
   then begin
    ptrPixel:=TSystemTFilterVisualization(TypeSystem).Reflecting__DIB_PixelsPtr;
    XSize:=Fig_Width;
    YSize:=Fig_Height;
    YStep:=(TSystemTFilterVisualization(TypeSystem).Reflecting__DIB_BitInfo.bmiHeader.biWidth*(TSystemTFilterVisualization(TypeSystem).Reflecting__DIB_BitInfo.bmiHeader.biBitCount DIV 8));
    if ((YStep MOD 4) > 0) then YStep:=YStep-(YStep MOD 4)+4;
    MixColor:=Fig.ColorFill;
    MCR:=Round(Lo(MixColor)*(Factor/256));
    MCG:=Round(Lo(MixColor SHR 8)*(Factor/256));
    MCB:=Round(Lo(MixColor SHR 16)*(Factor/256));
    asm
          PUSH EAX
          PUSH EBX
          PUSH ECX
          PUSH EDX
          PUSH ESI
          PUSH EDI
          MOV ESI,ptrPixel
          MOV EDI,ESI
          MOV ECX,YSize
          MOV DL,MCB
          MOV DH,MCG
          MOV BL,MCR
          MOV BH,ImageFactor
          CLD
      @M0:  PUSH ECX
            PUSH ESI
            MOV ECX,XSize
        @M1:  XCHG CL,BH
              LODSW
              SHR AL,CL
              ADC AL,DL
              RCR AL,1
              SHR AH,CL
              ADC AH,DH
              RCR AH,1
              STOSW
              LODSB
              SHR AL,CL
              ADC AL,BL
              RCR AL,1
              STOSB
              XCHG CL,BH
              LOOP @M1
            POP ESI
            POP ECX
            ADD ESI,YStep
            MOV EDI,ESI
            LOOP @M0
          POP EDI
          POP ESI      
          POP EDX
          POP ECX
          POP EBX
          POP EAX
    end;
    end;
  Result:=true;
  end;

  function ProcessSimpleColorMixing: boolean;
  var
    ptrPixel: pointer;
    XSize,YSize,YStep: integer;
    Factor: byte;
    Mask: byte;
    MixColor: TColor;
    MCR,MCG,MCB: byte;
  begin
  Result:=false;
  if (TItemTFilterVisualizationCash(ptrItem^).FilterDATA.Size = 0)
   then begin
    Result:=true;
    Exit; //. ->
    end;
  Factor:=Byte(TItemTFilterVisualizationCash(ptrItem^).FilterDATA.Memory^);
  Mask:=Byte(Pointer(Integer(TItemTFilterVisualizationCash(ptrItem^).FilterDATA.Memory)+1)^);
  if (Factor > 0)
   then begin
    ptrPixel:=TSystemTFilterVisualization(TypeSystem).Reflecting__DIB_PixelsPtr;
    XSize:=Fig_Width;
    YSize:=Fig_Height;
    YStep:=(TSystemTFilterVisualization(TypeSystem).Reflecting__DIB_BitInfo.bmiHeader.biWidth*(TSystemTFilterVisualization(TypeSystem).Reflecting__DIB_BitInfo.bmiHeader.biBitCount DIV 8));
    if ((YStep MOD 4) > 0) then YStep:=YStep-(YStep MOD 4)+4;
    MixColor:=Fig.ColorFill;
    MCR:=Round(Lo(MixColor)*(Factor/256));
    MCG:=Round(Lo(MixColor SHR 8)*(Factor/256));
    MCB:=Round(Lo(MixColor SHR 16)*(Factor/256));
    asm
          PUSH EAX
          PUSH EBX
          PUSH ECX
          PUSH EDX
          PUSH EDI
          MOV ESI,ptrPixel
          MOV EDI,ESI
          MOV ECX,YSize
          MOV DL,MCB
          MOV DH,MCG
          MOV BL,MCR
          MOV BH,Mask
          CLD
      @M0:  PUSH BX
            PUSH ECX
            PUSH EDI
            MOV ECX,XSize
        @M1:  ROL BH,1
              JNC @M2
              MOV AL,DL
              MOV AH,DH
              STOSW
              MOV AL,BL
              STOSB
              JMP @M3
        @M2:  ADD EDI,3
        @M3:  LOOP @M1
            POP EDI
            POP ECX
            POP BX
            ROL BH,1
            ADD ESI,YStep
            ADD EDI,YStep
            LOOP @M0
          POP EDI
          POP EDX
          POP ECX
          POP EBX
          POP EAX
    end;
    end;
  Result:=true;
  end;

var
  ClippingRegion: HRGN;
begin
Result:=false;  
if (pFigure.flagLoop AND pFigure.flagFill)
 then Fig:=pFigure
 else
  if (pAdditionalFigure.CountScreenNodes > 0)
   then begin
    Fig:=pAdditionalFigure;
    Fig.ColorFill:=pFigure.ColorFill;
    end
   else Exit; //. ->
Fig.ScreenNodes_GetMinMax(Fig_Xmn,Fig_Ymn,Fig_Xmx,Fig_Ymx);
//.
Fig_Width:=(Fig_Xmx-Fig_Xmn+1);
Fig_Height:=(Fig_Ymx-Fig_Ymn+1);
//.
TypeSystem.Lock.Enter;
try
ptrItem:=TSystemTFilterVisualization(TypeSystem).Cash.GetPtrItem(idObj);
if ((ptrItem = nil) OR (TItemTFilterVisualizationCash(ptrItem^).FilterDATA = nil))then Exit; //. ->
//. draw
BitBlt(TSystemTFilterVisualization(TypeSystem).Reflecting__DIB_DC, 0,0,Fig_Width,Fig_Height, pCanvas.Handle, Fig_Xmn,Fig_Ymn, SRCCOPY);
//.
case TItemTFilterVisualizationCash(ptrItem^).FilterType of
ftContrasting: Result:=ProcessContrasting();
ftFastContrasting: Result:=ProcessFastContrasting();
ftColorScaling: Result:=ProcessColorScaling();
ftColorMixing: Result:=ProcessColorMixing();
ftFastColorMixing: Result:=ProcessFastColorMixing();
ftSimpleColorMixing: Result:=ProcessSimpleColorMixing();
else
  Exit; //. ->
end;  
//. drawing ...
ClippingRegion:=CreatePolygonRgn(Fig.ScreenNodes,Fig.CountScreenNodes,ALTERNATE);
try
ExtSelectClipRgn(pCanvas.Handle, ClippingRegion, RGN_AND);
//. draw to canvas
BitBlt(pCanvas.Handle, Fig_Xmn,Fig_Ymn,Fig_Width,Fig_Height, TSystemTFilterVisualization(TypeSystem).Reflecting__DIB_DC, 0, 0, SRCCOPY);
finally
SelectClipRgn(pCanvas.Handle, 0);
DeleteObject(ClippingRegion);
end;
finally
TypeSystem.Lock.Leave;
end;
Result:=true;
end
;

function TFilterVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TFilterVisualizationPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TFilterVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=RemotedFunctionality.GetOwner(idTOwner,idOwner);
end;

function TFilterVisualizationFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TFilterVisualizationFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;


procedure TFilterVisualizationFunctionality.GetParams(out FilterType: integer; out FilterDATA: TByteArray);
begin
RemotedFunctionality.GetParams(FilterType,FilterDATA);
end
;

procedure TFilterVisualizationFunctionality.SetParams(const FilterType: integer; const FilterDATA: TByteArray);
begin
RemotedFunctionality.SetParams(FilterType,FilterDATA);
//. update local TypesSystem and representations
Space.StayUpToDate;
end
;


{TCUSTOMVisualizationFunctionality}
function TCUSTOMVisualizationFunctionality.ContainerFilled: boolean;
begin
Result:=true;
end
;

{TAGIFVisualizationFunctionality}
function TAGIFVisualizationFunctionality.ContainerFilled: boolean;
begin
Result:=true;
end
;

{TVIDEOVisualizationFunctionality}
function TVIDEOVisualizationFunctionality.ContainerFilled: boolean;
begin
Result:=true;
end
;

{TPictureVisualizationFunctionality}
function TPictureVisualizationFunctionality.ContainerFilled: boolean;
begin
Result:=true;
end
;

{TWNDVisualizationFunctionality}
function TWNDVisualizationFunctionality.ContainerFilled: boolean;
begin
Result:=true;
end
;

{TVisualizationFunctionality}
function TVisualizationFunctionality.ContainerFilled: boolean;
begin
Result:=true;
end
;


{TPrivateAreaVisualizationFunctionality}
function TPrivateAreaVisualizationFunctionality.getAcquireObjectsInside: boolean;
begin
Result:=RemotedFunctionality.getAcquireObjectsInside;
end;

procedure TPrivateAreaVisualizationFunctionality.setAcquireObjectsInside(Value: boolean);
begin
RemotedFunctionality.setAcquireObjectsInside(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;


{TWMFVisualizationFunctionality}
procedure TWMFVisualizationFunctionality.SetProportion;
begin
RemotedFunctionality.SetProportion;
//. update local TypesSystem and representations
Space.StayUpToDate;
end;


{TTGeoCrdSystemFunctionality}
Constructor TTGeoCrdSystemFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTGeoCrdSystem;
RemotedFunctionality:=TTGeoCrdSystemFunctionalityRemoted.Create(Self);
end
;
Destructor TTGeoCrdSystemFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;

function TTGeoCrdSystemFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

procedure TTGeoCrdSystemFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;

function TTGeoCrdSystemFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TGeoCrdSystemFunctionality.Create(Self, idComponent);
end
;

function TTGeoCrdSystemFunctionality.getName: string;
begin
Result:=nmTGeoCrdSystem;
end
;

function TTGeoCrdSystemFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TYPESDef\GeoCrdSystem\GeoCrdSystem.bmp');
  except
    end;
  end;
Result:=FImage;
end
;
function LatLong_IsPositionInsideOfBounds(const Lat,Long: double; const Bounds: pointer): boolean;
var
  ptrFirstItem,ptrItem: pointer;
  P0,P1: TGeoCrdSystemBoundsPoint;
  cntLinesUpCenter,
  cntLinesDownCenter: integer;

    procedure ProcessCounters(const P0,P1: TGeoCrdSystemBoundsPoint);
    var
      dLong: double;
      Yc: double;
    begin
    if ((Long-P0.Long)*(Long-P1.Long) <= 0)
     then begin
      dLong:=P1.Long-P0.Long;
      if (dLong <> 0)
       then begin
        Yc:=P0.Lat+(Long-P0.Long)*(P1.Lat-P0.Lat)/dLong;
        if (Yc >= Lat)
         then
          Inc(cntLinesUpCenter)
         else
          Inc(cntLinesDownCenter);
        end;
      end;
    end;

begin
Result:=false;
ptrFirstItem:=Bounds;
if (ptrFirstItem = nil) then Exit; //. ->
P0:=TGeoCrdSystemBoundsPoint(ptrFirstItem^);
ptrItem:=P0.ptrNext;
if (ptrItem = nil) then Exit; //. ->
cntLinesUpCenter:=0;
cntLinesDownCenter:=0;
repeat
  P1:=TGeoCrdSystemBoundsPoint(ptrItem^);
  //. process counters
  ProcessCounters(P0,P1);
  //. next point
  P0:=P1;
  ptrItem:=TGeoCrdSystemBoundsPoint(ptrItem^).ptrNext;
until (ptrItem = nil);
P1:=TGeoCrdSystemBoundsPoint(ptrFirstItem^);
//. process counters
ProcessCounters(P0,P1);
//.
Result:=(((cntLinesUpCenter MOD 2) > 0) AND ((cntLinesDownCenter MOD 2) > 0));
end;

procedure TTGeoCrdSystemFunctionality.GetInstanceByLatLongLocally(const pGeoSpaceID: integer; const pLatitude,pLongitude: double; out idCrdSys: integer);
var
  ptrptrItem: pointer;
  ptrItem: pointer;
begin
idCrdSys:=0;
with TTGeoCrdSystemCash(TSystemTGeoCrdSystem(TypeSystem).Cash) do begin
TypeSystem.Lock.Enter;
try
ptrptrItem:=@FItems;
while (Pointer(ptrptrItem^) <> nil) do with TItemTGeoCrdSystemCash(Pointer(ptrptrItem^)^) do begin
  if (
        (GeoSpaceID = pGeoSpaceID) AND 
        (Bounds <> nil) AND
        (((Bounds_minLat <= pLatitude) AND (pLatitude <= Bounds_maxLat)) AND ((Bounds_minLong <= pLongitude) AND (pLongitude <= Bounds_maxLong)) ) AND
        (LatLong_IsPositionInsideOfBounds(pLatitude,pLongitude,Bounds))
     )
   then begin
    idCrdSys:=idObj;
    //.
    ptrItem:=Pointer(ptrptrItem^);
    Pointer(ptrptrItem^):=ptrNext;
    TItemTGeoCrdSystemCash(ptrItem^).ptrNext:=FItems;
    FItems:=ptrItem;
    //.
    Exit; //. ->
    end
   else ptrptrItem:=@ptrNext; //. next item
  end;
finally
TypeSystem.Lock.Leave;
end;
end;
end
;
procedure TTGeoCrdSystemFunctionality.GetInstanceByLatLongLocally(const pLatitude,pLongitude: double; out oGeoSpaceID: integer; out idCrdSys: integer);
var
  ptrptrItem: pointer;
  ptrItem: pointer;
begin
oGeoSpaceID:=0;
idCrdSys:=0;
with TTGeoCrdSystemCash(TSystemTGeoCrdSystem(TypeSystem).Cash) do begin
TypeSystem.Lock.Enter;
try
ptrptrItem:=@FItems;
while (Pointer(ptrptrItem^) <> nil) do with TItemTGeoCrdSystemCash(Pointer(ptrptrItem^)^) do begin
  if (
        (Bounds <> nil) AND
        (((Bounds_minLat <= pLatitude) AND (pLatitude <= Bounds_maxLat)) AND ((Bounds_minLong <= pLongitude) AND (pLongitude <= Bounds_maxLong)) ) AND
        (LatLong_IsPositionInsideOfBounds(pLatitude,pLongitude,Bounds))
     )
   then begin
    oGeoSpaceID:=GeoSpaceID;  
    idCrdSys:=idObj;
    //.
    ptrItem:=Pointer(ptrptrItem^);
    Pointer(ptrptrItem^):=ptrNext;
    TItemTGeoCrdSystemCash(ptrItem^).ptrNext:=FItems;
    FItems:=ptrItem;
    //.
    Exit; //. ->
    end
   else ptrptrItem:=@ptrNext; //. next item
  end;
finally
TypeSystem.Lock.Leave;
end;
end;
end
;
function XY_IsPositionInsideOfBounds(const X,Y: double; const Bounds: pointer): boolean;
var
  ptrFirstItem,ptrItem: pointer;
  P0,P1: TGeoCrdSystemBoundsPoint;
  cntLinesUpCenter,
  cntLinesDownCenter: integer;

    procedure ProcessCounters(const P0,P1: TGeoCrdSystemBoundsPoint);
    var
      dX: double;
      Yc: double;
    begin
    if ((X-P0.X)*(X-P1.X) <= 0)
     then begin
      dX:=P1.X-P0.X;
      if (dX <> 0)
       then begin
        Yc:=P0.Y+(X-P0.X)*(P1.Y-P0.Y)/dX;
        if (Yc >= Y)
         then
          Inc(cntLinesUpCenter)
         else
          Inc(cntLinesDownCenter);
        end;
      end;
    end;

begin
Result:=false;
ptrFirstItem:=Bounds;
if (ptrFirstItem = nil) then Exit; //. ->
P0:=TGeoCrdSystemBoundsPoint(ptrFirstItem^);
ptrItem:=P0.ptrNext;
if (ptrItem = nil) then Exit; //. ->
cntLinesUpCenter:=0;
cntLinesDownCenter:=0; 
repeat
  P1:=TGeoCrdSystemBoundsPoint(ptrItem^);
  //. process counters
  ProcessCounters(P0,P1);
  //. next point
  P0:=P1;
  ptrItem:=TGeoCrdSystemBoundsPoint(ptrItem^).ptrNext;
until (ptrItem = nil);
P1:=TGeoCrdSystemBoundsPoint(ptrFirstItem^);
//. process counters
ProcessCounters(P0,P1); 
//.
Result:=(((cntLinesUpCenter MOD 2) > 0) AND ((cntLinesDownCenter MOD 2) > 0));
end;

procedure TTGeoCrdSystemFunctionality.GetInstanceByXYLocally(const pGeoSpaceID: integer; const pX,pY: double; out idCrdSys: integer);
var
  ptrptrItem: pointer;
  ptrItem: pointer;
begin
idCrdSys:=0;
with TTGeoCrdSystemCash(TSystemTGeoCrdSystem(TypeSystem).Cash) do begin
TypeSystem.Lock.Enter;
try
ptrptrItem:=@FItems;
while (Pointer(ptrptrItem^) <> nil) do with TItemTGeoCrdSystemCash(Pointer(ptrptrItem^)^) do begin
  if (
        (GeoSpaceID = pGeoSpaceID) AND 
        (Bounds <> nil) AND
        (((Bounds_minX <= pX) AND (pX <= Bounds_maxX)) AND ((Bounds_minY <= pY) AND (pY <= Bounds_maxY)) ) AND
        (XY_IsPositionInsideOfBounds(pX,pY,Bounds))
     )
   then begin
    idCrdSys:=idObj;
    //.
    ptrItem:=Pointer(ptrptrItem^);
    Pointer(ptrptrItem^):=ptrNext;
    TItemTGeoCrdSystemCash(ptrItem^).ptrNext:=FItems;
    FItems:=ptrItem;
    //.
    Exit; //. ->
    end
   else ptrptrItem:=@ptrNext; //. next item
  end;
finally
TypeSystem.Lock.Leave;
end;
end;
end
;
procedure TTGeoCrdSystemFunctionality.GetInstanceByXYLocally(const pX,pY: double; out oGeoSpaceID: integer; out idCrdSys: integer);
var
  ptrptrItem: pointer;
  ptrItem: pointer;
begin
oGeoSpaceID:=0;  
idCrdSys:=0;
with TTGeoCrdSystemCash(TSystemTGeoCrdSystem(TypeSystem).Cash) do begin
TypeSystem.Lock.Enter;
try
ptrptrItem:=@FItems;
while (Pointer(ptrptrItem^) <> nil) do with TItemTGeoCrdSystemCash(Pointer(ptrptrItem^)^) do begin
  if (
        (Bounds <> nil) AND
        (((Bounds_minX <= pX) AND (pX <= Bounds_maxX)) AND ((Bounds_minY <= pY) AND (pY <= Bounds_maxY)) ) AND
        (XY_IsPositionInsideOfBounds(pX,pY,Bounds)) 
     )
   then begin
    oGeoSpaceID:=GeoSpaceID;  
    idCrdSys:=idObj;
    //.
    ptrItem:=Pointer(ptrptrItem^);
    Pointer(ptrptrItem^):=ptrNext;
    TItemTGeoCrdSystemCash(ptrItem^).ptrNext:=FItems;
    FItems:=ptrItem;
    //.
    Exit; //. ->
    end
   else ptrptrItem:=@ptrNext; //. next item
  end;
finally
TypeSystem.Lock.Leave;
end;
end;
end
;
procedure TTGeoCrdSystemFunctionality.GetInstanceList(out List: TList);
var
  BA: TByteArray;
begin
GetInstanceList(BA);
ByteArray_CreateList(BA, List);
end;

procedure TTGeoCrdSystemFunctionality.GetInstanceList(out List: TByteArray);
begin
RemotedFunctionality.GetInstanceList(List);
end;

procedure TTGeoCrdSystemFunctionality.GetInstanceByLatLong(const pGeoSpaceID: integer; const pLatitude,pLongitude: double; out idCrdSys: integer);
begin
RemotedFunctionality.GetInstanceByLatLong(pGeoSpaceID, pLatitude,pLongitude, idCrdSys);
end;

procedure TTGeoCrdSystemFunctionality.GetInstanceByXY(const pGeoSpaceID: integer; const pX,pY: double; out idCrdSys: integer);
begin
RemotedFunctionality.GetInstanceByXY(pGeoSpaceID, pX,pY, idCrdSys);
end;


{TGeoCrdSystemFunctionality}
Constructor TGeoCrdSystemFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TGeoCrdSystemFunctionalityRemoted.Create(Self);
end;

Destructor TGeoCrdSystemFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


procedure TGeoCrdSystemFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

function TGeoCrdSystemFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TGeoCrdSystemPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;

procedure TGeoCrdSystemFunctionality.GetDataLocally(out oGeoSpaceID: integer; out oName: string; out oDatum: string; out oProjection: string; out oProjectionData: TMemoryStream);
var
  ptrItem: pointer;
begin
oProjectionData:=nil;
try
with TypeSystem do begin
Lock.Enter;
try
Caching_Start();
try
if (NOT Context_IsItemExist(idObj)) then Caching_AddObject(idObj);
finally
Caching_Finish();
end;
//. get data from local type context
ptrItem:=TSystemTGeoCrdSystem(TypeSystem).Cash.GetPtrItem(idObj);
if (ptrItem = nil) then Raise Exception.Create('TGeoCrdSystemFunctionality.GetDataLocally: context item is not found'); //. =>
with TItemTGeoCrdSystemCash(ptrItem^) do begin
oGeoSpaceID:=GeoSpaceID;
oName:=Name;
oDatum:=Datum;
oProjection:=Projection;
if (ProjectionData <> nil)
 then begin
  oProjectionData:=TMemoryStream.Create;
  oProjectionData.LoadFromStream(ProjectionData);
  end;
end;
finally
Lock.Leave;
end;
end;
except
  FreeAndNil(oProjectionData);
  Raise; //. =>
  end;
end
;

procedure TGeoCrdSystemFunctionality.GetGeodesyPointsLocally(out Points: TByteArray);
var
  ptrItem: pointer;
begin
with TypeSystem do begin
Lock.Enter;
try
Caching_Start();
try
if (NOT Context_IsItemExist(idObj)) then Caching_AddObject(idObj);
finally
Caching_Finish();
end;
//. get data from local type context
ptrItem:=TSystemTGeoCrdSystem(TypeSystem).Cash.GetPtrItem(idObj);
if (ptrItem = nil) then Raise Exception.Create('TGeoCrdSystemFunctionality.GetGeodesyPointsLocally: context item is not found'); //. =>
with TItemTGeoCrdSystemCash(ptrItem^) do begin
SetLength(Points,Length(CalibrationPoints));
if (Length(Points) > 0) then Move(Pointer(@CalibrationPoints[0])^,Pointer(@Points[0])^,Length(Points));
end;
finally
Lock.Leave;
end;
end;
end
;
function TGeoCrdSystemFunctionality.getGeoSpaceID: integer;
begin
Result:=RemotedFunctionality.getGeoSpaceID;
end;

procedure TGeoCrdSystemFunctionality.setGeoSpaceID(Value: integer);
begin
RemotedFunctionality.setGeoSpaceID(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TGeoCrdSystemFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

procedure TGeoCrdSystemFunctionality.setName(Value: string);
begin
RemotedFunctionality.setName(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TGeoCrdSystemFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

function TGeoCrdSystemFunctionality.getDatum: string;
begin
Result:=RemotedFunctionality.getDatum;
end;

procedure TGeoCrdSystemFunctionality.setDatum(Value: string);
begin
RemotedFunctionality.setDatum(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TGeoCrdSystemFunctionality.getProjection: string;
begin
Result:=RemotedFunctionality.getProjection;
end;

procedure TGeoCrdSystemFunctionality.setProjection(Value: string);
begin
RemotedFunctionality.setProjection(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TGeoCrdSystemFunctionality.GetProjectionDATA(out DATAStream: TMemoryStream);
var
  BA: TByteArray;
begin
GetProjectionDATA(BA);
ByteArray_CreateStream(BA, DATAStream);
end;

procedure TGeoCrdSystemFunctionality.GetProjectionDATA(out DATAStream: TByteArray);
begin
RemotedFunctionality.GetProjectionDATA(DATAStream);
end;

procedure TGeoCrdSystemFunctionality.SetProjectionDATA(DATAStream: TMemoryStream);
var
  BA: TByteArray;
begin
ByteArray_PrepareFromStream(BA,DATAStream);
SetProjectionDATA(BA);
end;

procedure TGeoCrdSystemFunctionality.SetProjectionDATA(DATAStream: TByteArray);
begin
RemotedFunctionality.SetProjectionDATA(DATAStream);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TGeoCrdSystemFunctionality.GetGeodesyPoints(out Points: TByteArray);
begin
RemotedFunctionality.GetGeodesyPoints(Points);
end;


{TTGeoSpaceFunctionality}
Constructor TTGeoSpaceFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTGeoSpace;
RemotedFunctionality:=TTGeoSpaceFunctionalityRemoted.Create(Self);
end
;
Destructor TTGeoSpaceFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


function TTGeoSpaceFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

procedure TTGeoSpaceFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

function TTGeoSpaceFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=nil;
Result:=TGeoSpaceFunctionality.Create(Self, idComponent);
end
;

function TTGeoSpaceFunctionality.getName: string;
begin
Result:=nmTGeoSpace;
end
;

function TTGeoSpaceFunctionality.getImage: TTypeImage;
begin
if (FImage = nil)
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TYPESDef\GeoSpace\GeoSpace.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

{TGeoSpaceFunctionality}
Constructor TGeoSpaceFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TGeoSpaceFunctionalityRemoted.Create(Self);
end;

Destructor TGeoSpaceFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


procedure TGeoSpaceFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

function TGeoSpaceFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TGeoSpacePanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;

function TGeoSpaceFunctionality.GetDatumIDLocally: integer;
var
  ptrptrItem: pointer;
  ptrItem: pointer;
begin
Result:=-1;
with TTGeoCrdSystemCash(TSystemTGeoCrdSystem(SystemTGeoCrdSystem).Cash) do begin
TypeSystem.Lock.Enter;
try
ptrptrItem:=@FItems;
while (Pointer(ptrptrItem^) <> nil) do with TItemTGeoCrdSystemCash(Pointer(ptrptrItem^)^) do begin
  if (GeoSpaceID = Self.idObj)
   then begin
    Result:=Datums_GetItemByName(Datum);
    //.
    ptrItem:=Pointer(ptrptrItem^);
    Pointer(ptrptrItem^):=ptrNext;
    TItemTGeoCrdSystemCash(ptrItem^).ptrNext:=FItems;
    FItems:=ptrItem;
    //.
    Exit; //. ->
    end
   else ptrptrItem:=@ptrNext; //. next item
  end;
finally
TypeSystem.Lock.Leave;
end;
end;
end
;
function TGeoSpaceFunctionality.ConvertGeoToXYLocally(const Lat,Long: Extended; out Xr,Yr: Extended): boolean;
begin
Raise Exception.Create('not implemented'); //. =>
end
;
function TGeoSpaceFunctionality.ConvertXYToGeoLocally(const X,Y: Extended; out Lat,Long: Extended): boolean;
var
  idGeoCrdSystem: integer;
  CrdSysConvertor: TCrdSysConvertor;
begin
Result:=false;
//. get appropriate geo coordinate system
with TTGeoCrdSystemFunctionality.Create do
try
GetInstanceByXYLocally(Self.idObj, X,Y,{out} idGeoCrdSystem);
finally
Release;
end;
if (idGeoCrdSystem = 0) then Exit; //. ->
//.
CrdSysConvertor:=TCrdSysConvertor.Create(Space,idGeoCrdSystem);
try
if (NOT CrdSysConvertor.XYToGeo_LoadPoints(X,Y)) then Exit; //. ->
Result:=CrdSysConvertor.ConvertXYToGeo(X,Y,{out} Lat,Long);
finally
CrdSysConvertor.Destroy;
end;
end
;
function TGeoSpaceFunctionality.GetDistanceBetweenTwoXYPointsLocally(const X0,Y0,X1,Y1: Extended; out Distance: Extended): boolean;
var
  Lat0,Long0,Lat1,Long1: Extended;
  idGeoCrdSystem: integer;
  CrdSysConvertor: TCrdSysConvertor;
begin
Result:=false;
if (NOT ConvertXYToGeoLocally(X0,Y0,{out} Lat0,Long0)) then Exit; //. ->
if (NOT ConvertXYToGeoLocally(X1,Y1,{out} Lat1,Long1)) then Exit; //. ->
//. get appropriate geo coordinate system for X0,Y0
with TTGeoCrdSystemFunctionality.Create do
try
GetInstanceByXYLocally(Self.idObj, X0,Y0,{out} idGeoCrdSystem);
finally
Release;
end;
if (idGeoCrdSystem = 0) then Exit; //. ->
//.
CrdSysConvertor:=TCrdSysConvertor.Create(Space,idGeoCrdSystem);
try
//. calculating distance from X0,Y0
Distance:=CrdSysConvertor.GetDistance(Lat0,Long0, Lat1,Long1);
Result:=true;
finally
CrdSysConvertor.Destroy;
end;
end
;
function TGeoSpaceFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

procedure TGeoSpaceFunctionality.setName(Value: string);
begin
RemotedFunctionality.setName(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TGeoSpaceFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

function TGeoSpaceFunctionality.getDatumID: integer;
begin
Result:=RemotedFunctionality.getDatumID;
end;

procedure TGeoSpaceFunctionality.setDatumID(Value: integer);
begin
RemotedFunctionality.setDatumID(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TGeoSpaceFunctionality.getProjectionID: integer;
begin
Result:=RemotedFunctionality.getProjectionID;
end;

procedure TGeoSpaceFunctionality.setProjectionID(Value: integer);
begin
RemotedFunctionality.setProjectionID(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TGeoSpaceFunctionality.ConvertXYToLatLong(const X: double; const Y: double; out Latitude: double; out Longitude: double): boolean;
begin
Result:=RemotedFunctionality.ConvertXYToLatLong(X,Y,{out} Latitude,Longitude);
end;

function TGeoSpaceFunctionality.ConvertXYToDatumLatLong(const X: double; const Y: double; const pDatumID: integer; out Latitude: double; out Longitude: double): boolean;
begin
Result:=RemotedFunctionality.ConvertXYToDatumLatLong(X,Y,pDatumID,{out} Latitude,Longitude);
end;

function TGeoSpaceFunctionality.ConvertLatLongToXY(const Latitude: double; const Longitude: double; out X: double; out Y: double): boolean;
begin
Result:=RemotedFunctionality.ConvertLatLongToXY(Latitude,Longitude,{out} X,Y);
end;

function TGeoSpaceFunctionality.ConvertDatumLatLongToXY(const pDatumID: integer; const Latitude: double; const Longitude: double; out X: double; out Y: double): boolean;
begin
Result:=RemotedFunctionality.ConvertDatumLatLongToXY(pDatumID,Latitude,Longitude,{out} X,Y);
end;

procedure TGeoSpaceFunctionality.GetGeoCrdSystemList(out List: TList);
var
  BA: TByteArray;
begin
GetGeoCrdSystemList(BA);
ByteArray_CreateList(BA,{out} List);
end;

procedure TGeoSpaceFunctionality.GetGeoCrdSystemList(out List: TByteArray);
begin
RemotedFunctionality.GetGeoCrdSystemList({out} List);
end;

procedure TGeoSpaceFunctionality.GetMapFormatMapList(out List: TList);
var
  BA: TByteArray;
begin
GetMapFormatMapList(BA);
ByteArray_CreateList(BA,{out} List);
end;

procedure TGeoSpaceFunctionality.GetMapFormatMapList(out List: TByteArray);
begin
RemotedFunctionality.GetMapFormatMapList(List);
end;

procedure TGeoSpaceFunctionality.GetMapFormatMapObjectsByNameContext(const pFormatID: integer; const pKindID: integer; const pTypeID: integer; const NameContext: string; out List: TList);
var
  BA: TByteArray;
begin
GetMapFormatMapObjectsByNameContext(pFormatID,pKindID,pTypeID,NameContext,{out} BA);
ByteArray_CreateList(BA,{out} List);
end;

procedure TGeoSpaceFunctionality.GetMapFormatMapObjectsByNameContext(const pFormatID: integer; const pKindID: integer; const pTypeID: integer; const NameContext: string; out List: TByteArray);
begin
RemotedFunctionality.GetMapFormatMapObjectsByNameContext(pFormatID,pKindID,pTypeID,NameContext,List);
end;


{TTGeoGraphServerObjectFunctionality}

Constructor TTGeoGraphServerObjectFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTGeoGraphServerObject;
RemotedFunctionality:=TTGeoGraphServerObjectFunctionalityRemoted.Create(Self);
end
;
Destructor TTGeoGraphServerObjectFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


function TTGeoGraphServerObjectFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

procedure TTGeoGraphServerObjectFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;

function TTGeoGraphServerObjectFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TGeoGraphServerObjectFunctionality.Create(Self, idComponent);
end
;

function TTGeoGraphServerObjectFunctionality.getName: string;
begin
Result:=nmTGeoGraphServerObject;
end
;

function TTGeoGraphServerObjectFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TYPESDef\GeoGraphServerObject\GeoGraphServerObject.bmp');
  except
    end;
  end;
Result:=FImage;
end
;
function TTGeoGraphServerObjectFunctionality.GetInstanceByServerObject(const pGeoGraphServerID: integer; const pObjectID: integer; out idInstance: integer): boolean;
begin
Result:=RemotedFunctionality.GetInstanceByServerObject(pGeoGraphServerID,pObjectID,idInstance);
end;


{TGeoGraphServerObjectFunctionality}
Constructor TGeoGraphServerObjectFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TGeoGraphServerObjectFunctionalityRemoted.Create(Self);
end;

Destructor TGeoGraphServerObjectFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


procedure TGeoGraphServerObjectFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

function TGeoGraphServerObjectFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TGeoGraphServerObjectPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TGeoGraphServerObjectFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TGeoGraphServerObjectFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

procedure TGeoGraphServerObjectFunctionality.AttachObject;
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

procedure TGeoGraphServerObjectFunctionality.DetachObject;
begin
Raise Exception.Create(SNotSupported); //. =>
end
;
function TGeoGraphServerObjectFunctionality.getGeoGraphServerID: integer;
begin
Result:=RemotedFunctionality.getGeoGraphServerID;
end;

procedure TGeoGraphServerObjectFunctionality.setGeoGraphServerID(Value: integer);
begin
RemotedFunctionality.setGeoGraphServerID(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TGeoGraphServerObjectFunctionality.getObjectID: integer;
begin
Result:=RemotedFunctionality.getObjectID;
end;

procedure TGeoGraphServerObjectFunctionality.setObjectID(Value: integer);
begin
RemotedFunctionality.setObjectID(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TGeoGraphServerObjectFunctionality.getBusinessModelID: integer;
begin
Result:=RemotedFunctionality.getBusinessModelID;
end;

procedure TGeoGraphServerObjectFunctionality.setBusinessModelID(Value: integer);
begin
RemotedFunctionality.setBusinessModelID(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TGeoGraphServerObjectFunctionality.getDomains: string;
begin
Result:=RemotedFunctionality.getDomains;
end;

procedure TGeoGraphServerObjectFunctionality.setDomains(Value: string);
begin
RemotedFunctionality.setDomains(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TGeoGraphServerObjectFunctionality.GetParams(out oGeoGraphServerID: integer; out oObjectID: integer; out oObjectType: integer; out oBusinessModel: integer);
begin
RemotedFunctionality.GetParams(oGeoGraphServerID,oObjectID,oObjectType,oBusinessModel);
end;

procedure TGeoGraphServerObjectFunctionality.ExecuteOperation(const InData: TByteArray; out OutData: TByteArray);
begin
RemotedFunctionality.ExecuteOperation(InData,OutData);
//. update local TypesSystem and representations
//. we need not update the context because GeoGraphServer should do that Space.StayUpToDate;
end;

function TGeoGraphServerObjectFunctionality.GetVisualizationComponent(out idTVisualization,idVisualization: integer): boolean;
begin
Result:=RemotedFunctionality.GetVisualizationComponent(idTVisualization,idVisualization);
end;

function TGeoGraphServerObjectFunctionality.GetNearestMapFormatObjects(const MaxDistance: double; out List: TByteArray): boolean;
begin
Result:=RemotedFunctionality.GetNearestMapFormatObjects(MaxDistance,List);
end;

function TGeoGraphServerObjectFunctionality.GetNearestMapFormatObjectsNames(const MaxDistance: double; out Names: WideString): boolean;
begin
Result:=RemotedFunctionality.GetNearestMapFormatObjectsNames(MaxDistance,Names);
end;

function TGeoGraphServerObjectFunctionality.Measurements_AddNew(const pTimeID: Double; const pidMeasurementObject: integer; const pguidMEasurementObject: string; const pDataType: integer; const pData: TByteArray): integer;
begin
Result:=RemotedFunctionality.Measurements_AddNew(pTimeID,pidMeasurementObject,pguidMEasurementObject,pDataType,pData);
end;

function TGeoGraphServerObjectFunctionality.Measurements_AddNew(const pTimeID: Double; const pidMeasurementObject: integer; const pguidMeasurementObject: string; const pDataType: integer; const pDataSource: integer; const pData: TByteArray): integer;
begin
Result:=RemotedFunctionality.Measurements_AddNew1(pTimeID,pidMeasurementObject,pguidMEasurementObject,pDataType,pDataSource,pData);
end;

procedure TGeoGraphServerObjectFunctionality.Measurements_Remove(const pidMeasurement: integer);
begin
RemotedFunctionality.Measurements_Remove(pidMeasurement);
end;

procedure TGeoGraphServerObjectFunctionality.Measurements_Item_UpdateData(const pTimeID: Double; const pData: TByteArray);
begin
RemotedFunctionality.Measurements_Item_UpdateData(pTimeID,pData);
end;


{TTGeoGraphServerFunctionality}
Constructor TTGeoGraphServerFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTGeoGraphServer;
RemotedFunctionality:=TTGeoGraphServerFunctionalityRemoted.Create(Self);
end
;
Destructor TTGeoGraphServerFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


function TTGeoGraphServerFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

procedure TTGeoGraphServerFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;

function TTGeoGraphServerFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TGeoGraphServerFunctionality.Create(Self, idComponent);
end
;

function TTGeoGraphServerFunctionality.getName: string;
begin
Result:=nmTGeoGraphServer;
end
;

function TTGeoGraphServerFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TYPESDef\GeoGraphServer\GeoGraphServer.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

procedure TTGeoGraphServerFunctionality.GetActiveInstanceList(out List: TList);
var
  BA: TByteArray;
begin
GetActiveInstanceList(BA);
ByteArray_CreateList(BA, List);
end;

procedure TTGeoGraphServerFunctionality.GetActiveInstanceList(out List: TByteArray);
begin
RemotedFunctionality.GetActiveInstanceList(List);
end;

function TTGeoGraphServerFunctionality.GetInstanceForRegistration: integer;
begin
Result:=RemotedFunctionality.GetInstanceForRegistration();
end;


{TGeoGraphServerFunctionality}
Constructor TGeoGraphServerFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TGeoGraphServerFunctionalityRemoted.Create(Self);
end;

Destructor TGeoGraphServerFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


procedure TGeoGraphServerFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

function TGeoGraphServerFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TGeoGraphServerPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;

procedure TGeoGraphServerFunctionality.SetData(DATAStream: TMemoryStream);
begin
Raise Exception.Create(SNotSupported); //. =>
end
;
function TGeoGraphServerFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

procedure TGeoGraphServerFunctionality.setName(Value: string);
begin
RemotedFunctionality.setName(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TGeoGraphServerFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

function TGeoGraphServerFunctionality.getAddress: string;
begin
Result:=RemotedFunctionality.getAddress;
end;

procedure TGeoGraphServerFunctionality.setAddress(Value: string);
begin
RemotedFunctionality.setAddress(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TGeoGraphServerFunctionality.getInternalAddress: string;
begin
Result:=RemotedFunctionality.getInternalAddress;
end;

procedure TGeoGraphServerFunctionality.setInternalAddress(Value: string);
begin
RemotedFunctionality.setInternalAddress(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TGeoGraphServerFunctionality.ExecuteOperation(const InData: TByteArray; out OutData: TByteArray);
begin
RemotedFunctionality.ExecuteOperation(InData,OutData);
end;

procedure TGeoGraphServerFunctionality.Object_ExecuteOperation(const ObjectID: integer; const InData: TByteArray; out OutData: TByteArray);
begin
RemotedFunctionality.Object_ExecuteOperation(ObjectID,InData,OutData);
end;

function TGeoGraphServerFunctionality.getInfo: string;
begin
Result:=RemotedFunctionality.getInfo;
end;

procedure TGeoGraphServerFunctionality.setInfo(Value: string);
begin
RemotedFunctionality.setInfo(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TGeoGraphServerFunctionality.GetData(out DATAStream: TMemoryStream);
var
  BA: TByteArray;
begin
GetData(BA);
ByteArray_CreateStream(BA, DATAStream);
end;

procedure TGeoGraphServerFunctionality.GetData(out DATAStream: TByteArray);
begin
RemotedFunctionality.GetData(DATAStream);
end;

function TGeoGraphServerFunctionality.DataID: integer;
begin
Result:=RemotedFunctionality.DataID;
end;

function TGeoGraphServerFunctionality.RegisterObject(const ObjectName: string; const VisualizationType: integer; const VisualizationID: integer; const GeoCrdSystemID: integer; const HintID: integer): integer;
begin
Result:=RemotedFunctionality.RegisterObject(ObjectName, VisualizationType,VisualizationID,GeoCrdSystemID,HintID);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TGeoGraphServerFunctionality.RegisterObject(const ObjectName: string; const ObjectType: integer; const ObjectDatumID: integer; const VisualizationType: integer; const VisualizationID: integer; const GeoSpaceID: integer; const GeoCrdSystemID: integer; const HintID: integer): integer;
begin
Result:=RemotedFunctionality.RegisterObject1(ObjectName,ObjectType,ObjectDatumID, VisualizationType,VisualizationID, GeoSpaceID,GeoCrdSystemID, HintID);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TGeoGraphServerFunctionality.RegisterObject(const ObjectName: string; const ObjectType: integer; const BusinessType: integer; const ObjectComponentID: integer): integer;
begin
Result:=RemotedFunctionality.RegisterObject2(ObjectName,ObjectType,BusinessType,ObjectComponentID);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TGeoGraphServerFunctionality.UnRegisterObject(const ObjectID: integer);
begin
RemotedFunctionality.UnRegisterObject(ObjectID);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TGeoGraphServerFunctionality.ObjectCounter: integer;
begin
Result:=RemotedFunctionality.ObjectCounter;
end;

procedure TGeoGraphServerFunctionality.Object_GetProperties(const ObjectID: integer;  out ObjectName: string; out ObjectType: integer; out ObjectDatumID: integer; out VisualizationType: integer; out VisualizationID: integer; out GeoSpaceID: integer; out HintID: integer);
begin
RemotedFunctionality.Object_GetProperties(ObjectID,ObjectName,ObjectType,ObjectDatumID,VisualizationType,VisualizationID,GeoSpaceID,HintID);
end;

procedure TGeoGraphServerFunctionality.Object_SetProperties(const ObjectID: integer;  const ObjectName: string; const ObjectType: integer; const ObjectDatumID: integer; const VisualizationType: integer; const VisualizationID: integer; const GeoSpaceID: integer; const HintID: integer);
begin
RemotedFunctionality.Object_SetProperties(ObjectID,ObjectName,ObjectType,ObjectDatumID,VisualizationType,VisualizationID,GeoSpaceID,HintID);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TGeoGraphServerFunctionality.Object_GetProperties(const ObjectID: integer;  out ObjectName: string; out ObjectType: integer; out BusinessType: integer; out ObjectComponentID: integer);
begin
RemotedFunctionality.Object_GetProperties1(ObjectID,ObjectName,ObjectType,BusinessType,ObjectComponentID);
end;

procedure TGeoGraphServerFunctionality.Object_SetProperties(const ObjectID: integer;  const ObjectName: string; const ObjectType: integer; const BusinessType: integer; const ObjectComponentID: integer);
begin
RemotedFunctionality.Object_SetProperties1(ObjectID,ObjectName,ObjectType,BusinessType,ObjectComponentID);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TGeoGraphServerFunctionality.Object_GetObjectType(const ObjectID: integer): integer;
begin
Result:=RemotedFunctionality.Object_GetObjectType(ObjectID);
end;

procedure TGeoGraphServerFunctionality.Object_SetObjectType(const ObjectID: integer; const ObjectType: integer);
begin
RemotedFunctionality.Object_SetObjectType(ObjectID,ObjectType);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TGeoGraphServerFunctionality.Object_GetBusinessType(const ObjectID: integer): integer;
begin
Result:=RemotedFunctionality.Object_GetBusinessType(ObjectID);
end;

procedure TGeoGraphServerFunctionality.Object_SetBusinessType(const ObjectID: integer; const BusinessType: integer);
begin
RemotedFunctionality.Object_SetBusinessType(ObjectID,BusinessType);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TGeoGraphServerFunctionality.Object_GetComponentID(const ObjectID: integer): integer;
begin
Result:=RemotedFunctionality.Object_GetComponentID(ObjectID);
end;

procedure TGeoGraphServerFunctionality.Object_SetComponentID(const ObjectID: integer; const ObjectComponentID: integer);
begin
RemotedFunctionality.Object_SetComponentID(ObjectID,ObjectComponentID);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;


{TTUserAlertFunctionality}
Constructor TTUserAlertFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTUserAlert;
RemotedFunctionality:=TTUserAlertFunctionalityRemoted.Create(Self);
end
;
Destructor TTUserAlertFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


function TTUserAlertFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

procedure TTUserAlertFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

function TTUserAlertFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TUserAlertFunctionality.Create(Self, idComponent);
end
;

function TTUserAlertFunctionality.getName: string;
begin
Result:=nmTUserAlert;
end
;

function TTUserAlertFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TYPESDef\UserAlert\UserAlert.bmp');
  except
    end;
  end;
Result:=FImage;
end
;
procedure TTUserAlertFunctionality.GetActiveInstanceList(out List: TList);
var
  BA: TByteArray;
begin
GetActiveInstanceList(BA);
ByteArray_CreateList(BA, List);
end;

procedure TTUserAlertFunctionality.GetActiveInstanceList(out List: TByteArray);
begin
RemotedFunctionality.GetActiveInstanceList(List);
end;


{TUserAlertFunctionality}
Constructor TUserAlertFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TUserAlertFunctionalityRemoted.Create(Self);
end;

Destructor TUserAlertFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


procedure TUserAlertFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

function TUserAlertFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TUserAlertPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TUserAlertFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TUserAlertFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

function TUserAlertFunctionality.getUserID: integer;
begin
Result:=RemotedFunctionality.getUserID;
end;

procedure TUserAlertFunctionality.setUserID(Value: integer);
begin
RemotedFunctionality.setUserID(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TUserAlertFunctionality.getTimeStamp: TDateTime;
begin
Result:=RemotedFunctionality.getTimeStamp;
end;

procedure TUserAlertFunctionality.setTimeStamp(Value: TDateTime);
begin
RemotedFunctionality.setTimeStamp(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TUserAlertFunctionality.getActive: boolean;
begin
Result:=RemotedFunctionality.getActive;
end;

procedure TUserAlertFunctionality.setActive(Value: boolean);
begin
RemotedFunctionality.setActive(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TUserAlertFunctionality.getAlertID: integer;
begin
Result:=RemotedFunctionality.getAlertID;
end;

procedure TUserAlertFunctionality.setAlertID(Value: integer);
begin
RemotedFunctionality.setAlertID(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TUserAlertFunctionality.getSeverity: integer;
begin
Result:=RemotedFunctionality.getSeverity;
end;

procedure TUserAlertFunctionality.setSeverity(Value: integer);
begin
RemotedFunctionality.setSeverity(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TUserAlertFunctionality.getDescription: string;
begin
Result:=RemotedFunctionality.getDescription;
end;

procedure TUserAlertFunctionality.setDescription(Value: string);
begin
RemotedFunctionality.setDescription(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TUserAlertFunctionality.GetDATA(out DATAStream: TMemoryStream);
var
  BA: TByteArray;
begin
GetDATA(BA);
ByteArray_CreateStream(BA, DATAStream);
end;

procedure TUserAlertFunctionality.GetDATA(out DATAStream: TByteArray);
begin
RemotedFunctionality.GetDATA(DATAStream);
end;

procedure TUserAlertFunctionality.SetDATA(DATAStream: TMemoryStream);
var
  BA: TByteArray;
begin
ByteArray_PrepareFromStream(BA,DATAStream);
SetDATA(BA);
end;

procedure TUserAlertFunctionality.SetDATA(DATAStream: TByteArray);
begin
RemotedFunctionality.SetDATA(DATAStream);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;




{TTBoolVarFunctionality}
Constructor TTBoolVarFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTBoolVar;
RemotedFunctionality:=TTBoolVarFunctionalityRemoted.Create(Self);
end
;
Destructor TTBoolVarFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


function TTBoolVarFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

procedure TTBoolVarFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

function TTBoolVarFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TBoolVarFunctionality.Create(Self, idComponent);
end
;

function TTBoolVarFunctionality.getName: string;
begin
Result:=nmTBoolVar;
end
;

function TTBoolVarFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TYPESDef\BoolVar\BoolVar.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

{TBoolVarFunctionality}
Constructor TBoolVarFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TBoolVarFunctionalityRemoted.Create(Self);
end;

Destructor TBoolVarFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


procedure TBoolVarFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

function TBoolVarFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TBoolVarPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TBoolVarFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TBoolVarFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

function TBoolVarFunctionality.getValue: boolean;
begin
Result:=RemotedFunctionality.getValue;
end;

procedure TBoolVarFunctionality.setValue(_Value: boolean);
begin
RemotedFunctionality.setValue(_Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TBoolVarFunctionality.getSetTimeStamp: TDateTime;
begin
Result:=RemotedFunctionality.getSetTimeStamp;
end;


{TTSPLVisualizationFunctionality}
Constructor TTSPLVisualizationFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTSPLVisualization;
RemotedFunctionality:=TTSPLVisualizationFunctionalityRemoted.Create(Self);
end
;
Destructor TTSPLVisualizationFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


function TTSPLVisualizationFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

function TTSPLVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TSPLVisualizationFunctionality.Create(Self, idComponent);
end
;

function TTSPLVisualizationFunctionality.getName: string;
begin
Result:=nmTSPLVisualization;
end
;

function TTSPLVisualizationFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TypesDef\SPLVisualization\SPLVisualization.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

function TTSPLVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TObjectVisualization.Create;
with Result do begin
Color:=clWhite;
Width:=0;
flLoop:=true;
flFill:=true;
ColorFill:=clWhite;
AddPoint(1,1);
AddPoint(1,-1);
AddPoint(-1,-1);
AddPoint(-1,1);
end;
end
;

{TSPLVisualizationFunctionality}
Constructor TSPLVisualizationFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TSPLVisualizationFunctionalityRemoted.Create(Self);
end;

Destructor TSPLVisualizationFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


procedure TSPLVisualizationFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

procedure TSPLVisualizationFunctionality.DestroyData;
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

procedure TSPLVisualizationFunctionality.CloneData(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

function TSPLVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
var
  SplineWidthScale: double;
  ptrItem: pointer;
  SplineType: TSPLVisualizationType;
  SplineDataPtr: pointer;
  I: integer;
  //. spline vars
  XAprNodes,YAprNodes: TAprNodes;
  XSPLCoefs,YSPLCoefs: TSPLCoefs;
  dt,t: Extended;
  //.
  Node: unitReflector.TNode;
  SplineWidth: integer;
begin
Result:=false;
SplineWidthScale:=1.0;
TypeSystem.Lock.Enter;
try
ptrItem:=TSystemTSPLVisualization(TypeSystem).Cash.GetPtrItem(idObj);
if (ptrItem = nil) then Exit; //. ->
with TItemTSPLVisualizationCash(ptrItem^) do begin
SplineType:=SPLType;
if (SPLDATA <> nil)
 then SplineDataPtr:=SPLDATA.Memory
 else SplineDataPtr:=nil;
//.
case SplineType of
stSimple: ;
else
  Exit; //. ->
end;
end;
finally
TypeSystem.Lock.Leave;
end;
//. spline processing
if (GetCurrentThreadID <> MainThreadID)
 then
  try
  if (pFigure.flagLoop)
   then begin
    SetLength(XAprNodes,pFigure.Count+1);
    SetLength(YAprNodes,pFigure.Count+1);
    end
   else begin
    SetLength(XAprNodes,pFigure.Count);
    SetLength(YAprNodes,pFigure.Count);
    end;
  //.
  case SplineType of
  stSimple: begin
    {dt:=1.0/20;
    for I:=0 to pFigure.Count-1 do begin
      XAprNodes[I].X:=I;
      XAprNodes[I].Y:=pFigure.Nodes[I].X;
      YAprNodes[I].X:=I;
      YAprNodes[I].Y:=pFigure.Nodes[I].Y;
      end;}
    t:=0.0;
    XAprNodes[0].X:=t;
    XAprNodes[0].Y:=pFigure.Nodes[0].X;
    YAprNodes[0].X:=t;
    YAprNodes[0].Y:=pFigure.Nodes[0].Y;
    for I:=1 to pFigure.Count-1 do begin
      t:=t+Sqrt(sqr(pFigure.Nodes[I].X-pFigure.Nodes[I-1].X)+sqr(pFigure.Nodes[I].Y-pFigure.Nodes[I-1].Y));
      XAprNodes[I].X:=t;
      XAprNodes[I].Y:=pFigure.Nodes[I].X;
      YAprNodes[I].X:=t;
      YAprNodes[I].Y:=pFigure.Nodes[I].Y;
      end;
    if (pFigure.flagLoop)
     then begin
      t:=t+Sqrt(sqr(pFigure.Nodes[0].X-pFigure.Nodes[pFigure.Count-1].X)+sqr(pFigure.Nodes[0].Y-pFigure.Nodes[pFigure.Count-1].Y));
      XAprNodes[pFigure.Count].X:=t;
      XAprNodes[pFigure.Count].Y:=pFigure.Nodes[0].X;
      YAprNodes[pFigure.Count].X:=t;
      YAprNodes[pFigure.Count].Y:=pFigure.Nodes[0].Y;
      dt:=t/(pFigure.Count*20.0);
      end
     else dt:=t/((pFigure.Count-1)*20.0);
    end;
  else
    Exit; //. ->
  end;
  //.
  GetQubeSPLCoefficients(XAprNodes, 0{LAMBDA0},0{MUN}, 0{ADiff},0{BDiff},  {out} XSPLCoefs);
  GetQubeSPLCoefficients(YAprNodes, 0{LAMBDA0},0{MUN}, 0{ADiff},0{BDiff},  {out} YSPLCoefs);
  //.
  pFigure.Clear();
  t:=XAprNodes[0].X;
  for I:=0 to Length(XSPLCoefs)-1 do begin
    while (t <= XAprNodes[I+1].X) do begin
      Node.X:=SPL(XSPLCoefs[I], XAprNodes[I].X,XAprNodes[I].Y, t);
      Node.Y:=SPL(YSPLCoefs[I], YAprNodes[I].X,YAprNodes[I].Y, t);
      pFigure.Insert(Node);
      //.
      t:=t+dt;
      end;
    end;
  (*GetExpSPLCoefficients(XAprNodes, 0.001, 0{ADiff},0{BDiff},  {out} XSPLCoefs);
  GetExpSPLCoefficients(YAprNodes, 0.001, 0{ADiff},0{BDiff},  {out} YSPLCoefs);
  //.
  pFigure.Clear();
  t:=XAprNodes[0].X;
  for I:=0 to Length(XSPLCoefs.K)-2 do begin
    while (t <= XAprNodes[I+1].X) do begin
      Node.X:=ExpSPL(XSPLCoefs.ALFA,XSPLCoefs.K[I],XSPLCoefs.K[I+1], XAprNodes[I].X,XAprNodes[I].Y,XAprNodes[I+1].X,XAprNodes[I+1].Y, t);
      Node.Y:=ExpSPL(YSPLCoefs.ALFA,YSPLCoefs.K[I],YSPLCoefs.K[I+1], YAprNodes[I].X,YAprNodes[I].Y,YAprNodes[I+1].X,YAprNodes[I+1].Y, t);
      pFigure.Insert(Node);
      //.
      t:=t+dt;
      end;
    end;*)
  pFigure.AttractToLimits(pAttractionWindow, nil);
  pFigure.Optimize();
  except
    Exit; //. ->
    end;
//. reflecting
if ((pFigure.CountScreenNodes > 0) AND (pFigure.ColorFill <> clNone) AND pFigure.flagLoop)
 then begin
  if (pFigure.flagFill)
   then begin
    pCanvas.Pen.Color:=pFigure.ColorFill;
    pCanvas.Pen.Width:=1;
    pCanvas.Brush.Color:=pFigure.ColorFill;
    //.
    pCanvas.Polygon(Slice(pFigure.ScreenNodes,pFigure.CountScreenNodes));
    end
   else begin
    pCanvas.Pen.Color:=pFigure.ColorFill;
    pCanvas.Pen.Width:=2;
    //.
    pCanvas.Polyline(Slice(pFigure.ScreenNodes,pFigure.CountScreenNodes));
    end;
  end;
if ((pFigure.Width > 0) AND (pFigure.Color <> clNone))
 then begin
  pAdditionalFigure.Clear();
  pAdditionalFigure.Assign(pFigure);
  if (pAdditionalFigure.ValidateAsPolyLine(pReflectionWindow.Scale*SplineWidthScale))
   then begin
    pAdditionalFigure.AttractToLimits(pAttractionWindow, nil);
    pAdditionalFigure.Optimize();
    end;
  if (pAdditionalFigure.CountScreenNodes > 0)
   then begin
    pCanvas.Pen.Color:=pAdditionalFigure.ColorFill;
    pCanvas.Pen.Width:=1;
    pCanvas.Brush.Color:=pAdditionalFigure.ColorFill;
    pCanvas.Polygon(Slice(pAdditionalFigure.ScreenNodes, pAdditionalFigure.CountScreenNodes));
    end
   else begin //. draw as default if there is no valid AdditionalFigure
    pCanvas.Pen.Color:=pFigure.Color;
    pCanvas.Pen.Width:=2;
    //.
    pCanvas.Polyline(Slice(pFigure.ScreenNodes,pFigure.CountScreenNodes));
    end;
  end;
Result:=true;
end;

function TSPLVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TSPLVisualizationPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TSPLVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=RemotedFunctionality.GetOwner(idTOwner,idOwner);
end;

function TSPLVisualizationFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TSPLVisualizationFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;


procedure TSPLVisualizationFunctionality.GetParams(out SPLType: integer; out SPLDATA: TByteArray);
begin
RemotedFunctionality.GetParams(SPLType,SPLDATA);
end
;

procedure TSPLVisualizationFunctionality.SetParams(const SPLType: integer; const SPLDATA: TByteArray);
begin
RemotedFunctionality.SetParams(SPLType,SPLDATA);
//. update local TypesSystem and representations
Space.StayUpToDate;
end
;



{TTMapFormatMapFunctionality}
Constructor TTMapFormatMapFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTMapFormatMap;
RemotedFunctionality:=TTMapFormatMapFunctionalityRemoted.Create(Self);
end
;
Destructor TTMapFormatMapFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


function TTMapFormatMapFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

procedure TTMapFormatMapFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;

function TTMapFormatMapFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TMapFormatMapFunctionality.Create(Self, idComponent);
end
;

function TTMapFormatMapFunctionality.getName: string;
begin
Result:=nmTMapFormatMap;
end
;

function TTMapFormatMapFunctionality.getImage: TTypeImage;
begin
if (FImage = nil)
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TYPESDef\MapFormatMap\MapFormatMap.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

procedure TTMapFormatMapFunctionality.GetInstanceListByGeoSpace(const idGeoSpace: integer; out List: TByteArray);
begin
RemotedFunctionality.GetInstanceListByGeoSpace(idGeoSpace,List);
end;


{TMapFormatMapFunctionality}
Constructor TMapFormatMapFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TMapFormatMapFunctionalityRemoted.Create(Self);
end;

Destructor TMapFormatMapFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


procedure TMapFormatMapFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

function TMapFormatMapFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TMapFormatMapPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TMapFormatMapFunctionality.getGeoSpaceID: integer;
begin
Result:=RemotedFunctionality.getGeoSpaceID;
end;

procedure TMapFormatMapFunctionality.setGeoSpaceID(Value: integer);
begin
RemotedFunctionality.setGeoSpaceID(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TMapFormatMapFunctionality.getFormatID: integer;
begin
Result:=RemotedFunctionality.getFormatID;
end;

procedure TMapFormatMapFunctionality.setFormatID(Value: integer);
begin
RemotedFunctionality.setFormatID(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TMapFormatMapFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

procedure TMapFormatMapFunctionality.setName(Value: string);
begin
RemotedFunctionality.setName(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TMapFormatMapFunctionality.GetDATA(out DATAStream: TMemoryStream);
var
  BA: TByteArray;
begin
GetDATA(BA);
ByteArray_CreateStream(BA, TMemoryStream(DATAStream));
end;

procedure TMapFormatMapFunctionality.GetDATA(out DATAStream: TByteArray);
begin
RemotedFunctionality.GetDATA(DATAStream);
end;

procedure TMapFormatMapFunctionality.SetDATA(DATAStream: TMemoryStream);
var
  BA: TByteArray;
begin
ByteArray_PrepareFromStream(BA,DATAStream);
SetDATA(BA);
end;

procedure TMapFormatMapFunctionality.SetDATA(DATAStream: TByteArray);
begin
RemotedFunctionality.SetDATA(DATAStream);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TMapFormatMapFunctionality.GetObjectPrototypesDATA(out DATAStream: TMemoryStream);
var
  BA: TByteArray;
begin
GetObjectPrototypesDATA(BA);
ByteArray_CreateStream(BA, TMemoryStream(DATAStream));
end;

procedure TMapFormatMapFunctionality.GetObjectPrototypesDATA(out DATAStream: TByteArray);
begin
RemotedFunctionality.GetObjectPrototypesDATA(DATAStream);
end;

procedure TMapFormatMapFunctionality.SetObjectPrototypesDATA(DATAStream: TMemoryStream);
var
  BA: TByteArray;
begin
ByteArray_PrepareFromStream(BA,DATAStream);
SetObjectPrototypesDATA(BA);
end;

procedure TMapFormatMapFunctionality.SetObjectPrototypesDATA(DATAStream: TByteArray);
begin
RemotedFunctionality.SetObjectPrototypesDATA(DATAStream);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TMapFormatMapFunctionality.GetObjectPrototype(const KindID: integer; const TypeID: integer; out PrototypeID: integer; out LayID: integer): boolean;

  procedure PolishFormat_Process();
  var
    TFN: string;
    BA: TByteArray;
    TransformationFile: TMemIniFile;

    function GetPointPrototypeByTypeID(const TypeID: integer; out idPrototype: integer; out idLay: integer): boolean;
    var
      TypeStr: string;
    begin
    TypeStr:='T0x'+ANSILowerCase(IntToHex(TypeID,1));
    try
    idPrototype:=StrToInt(TransformationFile.ReadString(PMFPointSection,TypeStr,'-1'));
    except
      On E: Exception do Raise Exception.Create('error of transformation file, section: '+PMFPointDescriptor+', value: '+TypeStr+', error: '+E.Message);
      end;
    idLay:=StrToInt(TransformationFile.ReadString(PMFPointSection,'LayID','0'));
    Result:=(idPrototype <> -1);
    end;

    function GetPolylinePrototypeByTypeID(const TypeID: integer; out idPrototype: integer; out idLay: integer): boolean;
    var
      TypeStr: string;
    begin
    TypeStr:='T0x'+ANSILowerCase(IntToHex(TypeID,1));
    try
    idPrototype:=StrToInt(TransformationFile.ReadString(PMFPolylineSection,TypeStr,'-1'));
    except
      On E: Exception do Raise Exception.Create('error of transformation file, section: '+PMFPointDescriptor+', value: '+TypeStr+', error: '+E.Message);
      end;
    idLay:=StrToInt(TransformationFile.ReadString(PMFPolylineSection,'LayID','0'));
    Result:=(idPrototype <> -1);
    end;

    function GetPolygonPrototypeByTypeID(const TypeID: integer; out idPrototype: integer; out idLay: integer): boolean;
    var
      TypeStr: string;
    begin
    TypeStr:='T0x'+ANSILowerCase(IntToHex(TypeID,1));
    try
    idPrototype:=StrToInt(TransformationFile.ReadString(PMFPolygonSection,TypeStr,'-1'));
    except
      On E: Exception do Raise Exception.Create('error of transformation file, section: '+PMFPointDescriptor+', value: '+TypeStr+', error: '+E.Message);
      end;
    idLay:=StrToInt(TransformationFile.ReadString(PMFPolygonSection,'LayID','0'));
    Result:=(idPrototype <> -1);
    end;

  begin
  Result:=false;
  //.
  GetObjectPrototypesDATA({out} BA);
  if (Length(BA) = 0) then Raise Exception.Create('prototypes data is not found'); //. =>
  TFN:=ExtractFileDir(Application.ExeName)+'\'+PathTempData+'\DATA'+FormatDateTime('DDMMYYYYHHNNSSZZZ',Now)+'.ini';
  try
  with TMemoryStream.Create do
  try
  Write(Pointer(@BA[0])^,Length(BA));
  SaveToFile(TFN);
  finally
  Destroy;
  end;
  TransformationFile:=TMemIniFile.Create(TFN);
  try
  case TPMFObjectKind(KindID) of
  pmfokPOI: begin
    if (NOT GetPointPrototypeByTypeID(TypeID,{out} PrototypeID,LayID)) then Raise Exception.Create('could not get prototype for POI object type: '+ANSILowerCase(IntToHex(TypeID,1))); //. =>
    end;
  pmfokPolyline: begin
    if (NOT GetPolylinePrototypeByTypeID(TypeID,{out} PrototypeID,LayID)) then Raise Exception.Create('could not get prototype for Polyline object type: '+ANSILowerCase(IntToHex(TypeID,1))); //. =>
    end;
  pmfokPolygon: begin
    if (NOT GetPolygonPrototypeByTypeID(TypeID,{out} PrototypeID,LayID)) then Raise Exception.Create('could not get prototype for Polygon object type: '+ANSILowerCase(IntToHex(TypeID,1))); //. =>
    end;
  else
    Raise Exception.Create('Unknown map object kind: '+IntToStr(KindID)); //. =>
  end;
  if (PrototypeID = 0) then Raise Exception.Create('object prototype of type '+ANSILowerCase(IntToHex(TypeID,1))+' is disabled'); //. =>
  Result:=true;
  finally
  FreeAndNil(TransformationFile);
  end;
  finally
  DeleteFile(TFN);
  end;
  end;

begin
case TMapFormat(FormatID) of
mfPolish: PolishFormat_Process();
else
  Raise Exception.Create('map is not of implemented format'); //. =>
end;
end;

procedure TMapFormatMapFunctionality.GetParams(out oGeoSpaceID: integer; out oFormatID: integer; out oName: string);
begin
RemotedFunctionality.GetParams(oGeoSpaceID,oFormatID,oName);
end;

procedure TMapFormatMapFunctionality.SetParams(const pGeoSpaceID: integer; const pFormatID: integer; const pName: string);
begin
RemotedFunctionality.SetParams(pGeoSpaceID,pFormatID,pName);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TMapFormatMapFunctionality.ObjectsCounter: integer;
begin
Result:=RemotedFunctionality.ObjectsCounter;
end;

procedure TMapFormatMapFunctionality.GetObjectsList(out List: TByteArray);
begin
RemotedFunctionality.GetObjectsList({out} List);
end;

procedure TMapFormatMapFunctionality.GetObjectsList(const KindID: integer; out List: TByteArray);
begin
RemotedFunctionality.GetObjectsList1(KindID,{out} List);
end;

procedure TMapFormatMapFunctionality.GetObjectsList(const KindID: integer; const TypeID: integer; out List: TByteArray);
begin
RemotedFunctionality.GetObjectsList2(KindID,TypeID,{out} List);
end;

procedure TMapFormatMapFunctionality.GetObjectsList(const KindID: integer; const TypeID: integer; const NameContext: string; out List: TByteArray);
begin
RemotedFunctionality.GetObjectsList3(KindID,TypeID,NameContext,{out} List);
end;

function TMapFormatMapFunctionality.GetObject(const DATAHash: integer; out idMapFormatObject: integer): boolean;
begin
Result:=RemotedFunctionality.GetObject(DATAHash,{out} idMapFormatObject);
end;

function TMapFormatMapFunctionality.GetObject(const KindID: integer; const DATAHash: integer; out idMapFormatObject: integer): boolean;
begin
Result:=RemotedFunctionality.GetObject1(KindID,DATAHash,{out} idMapFormatObject);
end;

procedure TMapFormatMapFunctionality.ExportMap(const pFormatID: integer; out ZipData: TByteArray);
begin
RemotedFunctionality.ExportMap(pFormatID,{out} ZipData);
end;

procedure TMapFormatMapFunctionality.RemoveObjects;
begin
RemotedFunctionality.RemoveObjects();
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TMapFormatMapFunctionality.RemoveObjects(const KindID: integer; const TypeID: integer);
begin
RemotedFunctionality.RemoveObjects1(KindID,TypeID);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TMapFormatMapFunctionality.UpdateObjectDATAHashes;
begin
RemotedFunctionality.UpdateObjectDATAHashes;
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TMapFormatMapFunctionality.RecalculateMapArea();
const
  ObjectsPortionToClearContext = 1000;

  procedure ProcessObjNodes(const ptrObj: TPtr; const NodesApproximator: TNodesApproximator);
  var
    Obj: TSpaceObj;
    ptrPoint: TPtr;
    Point: TPoint;
    I: integer;
    Node: TNodeSpaceObjPolyLinePolygon;
    ptrOwnerObj: TPtr;
  begin
  Space.ReadObj(Obj,SizeOf(Obj), ptrObj);
  if (Obj.Width > 0)
   then with TSpaceObjPolylinePolygon.Create(Space, Obj) do
    try
    if (Count > 0) then for I:=0 to Count-1 do NodesApproximator.AddNode(Nodes[I].X,Nodes[I].Y);
    finally
    Destroy;
    end
   else begin
    ptrPoint:=Obj.ptrFirstPoint;
    while (ptrPoint <> nilPtr) do begin
     Space.ReadObj(Point,SizeOf(Point), ptrPoint);
     NodesApproximator.AddNode(Point.X,Point.Y);
     ptrPoint:=Point.ptrNextObj;
     end;
    end;
  //. process own objects
  ptrOwnerObj:=Obj.ptrListOwnerObj;
  while (ptrOwnerObj <> nilPtr) do begin
    ProcessObjNodes(ptrOwnerObj,NodesApproximator);
    Space.ReadObj(ptrOwnerObj,SizeOf(TPtr), ptrOwnerObj);
    end;
  end;

var
  OL: TByteArray;
  OLS: integer;
  I: integer;
  NodesApproximator: TNodesApproximator;
  CL: TComponentsList;
  VF: TBase2DVisualizationFunctionality;
  ptrResultNode: pointer;
  _Nodes: TByteArray;
  _NodesCount: integer;
  p: pointer;
begin
//. prepare approximation figure
GetObjectsList({out} OL);
NodesApproximator:=TNodesApproximator.Create;
try
OLS:=(Length(OL) DIV 4);
for I:=0 to OLS-1 do with TMapFormatObjectFunctionality(TComponentFunctionality_Create(idTMapFormatObject,Integer(Pointer(Integer(@OL[0])+(I SHL 2))^))) do
  try
  if (QueryComponents(TBase2DVisualizationFunctionality, {out} CL))
   then
    try
    VF:=TBase2DVisualizationFunctionality(TComponentFunctionality_Create(TItemComponentsList(CL[0]^).idTComponent,TItemComponentsList(CL[0]^).idComponent));
    with VF do
    try
    ProcessObjNodes(Ptr,NodesApproximator);
    finally
    Release;
    end;
    finally
    CL.Destroy;
    end;
  //. optimize resources
  if (((I+1) MOD ObjectsPortionToClearContext) = 0)
   then begin
    NodesApproximator.Calculate();
    NodesApproximator.MoveResultToNodes();
    //.
    Space.ClearInactiveSpaceContext();
    end;
  finally
  Release;
  end;
if (NodesApproximator.NodesCount > 0) then NodesApproximator.Calculate();
if (NodesApproximator.ResultCount = 0) then Raise Exception.Create('no area nodes found'); //. =>                                                                         
if (QueryComponents(TBase2DVisualizationFunctionality, {out} CL))
 then
  try
  VF:=TBase2DVisualizationFunctionality(TComponentFunctionality_Create(TItemComponentsList(CL[0]^).idTComponent,TItemComponentsList(CL[0]^).idComponent));
  with VF do
  try
  ptrResultNode:=NodesApproximator.ResultQueue;
  _NodesCount:=NodesApproximator.ResultCount;
  SetLength(_Nodes,SizeOf(_NodesCount)+_NodesCount*(2*SizeOf(Double)));
  p:=@_Nodes[0];
  Integer(p^):=_NodesCount; Inc(Integer(p),SizeOf(_NodesCount));
  for I:=0 to _NodesCount-1 do with unitNodesApproximator.TQueueItem(ptrResultNode^) do begin
    Double(p^):=unitNodesApproximator.TNode(ptrNode^).X; Inc(Integer(p),SizeOf(Double));
    Double(p^):=unitNodesApproximator.TNode(ptrNode^).Y; Inc(Integer(p),SizeOf(Double));
    //.
    ptrResultNode:=ptrNext;
    end;
  SetNodes(_Nodes,0.0);
  finally
  Release;
  end;
  finally
  CL.Destroy;
  end
 else Raise Exception.Create('there is no area visualization'); //. =>
finally
NodesApproximator.Destroy;
end;
end;

procedure TMapFormatMapFunctionality.RemoveIrrelevantObjectsInMapArea;
const
  ObjectsPortionToClearContext = 1000;

  procedure ProcessObj(const ptrMapArea: TPtr; const ptrObj: TPtr);
  var
    Obj: TSpaceObj;
    idTOwner,idOwner: integer;
  begin
  if (NOT Space.Obj_IsInsideObj(ptrMapArea,ptrObj)) then Exit; //. ->
  Space.ReadObj(Obj,SizeOf(Obj),ptrObj);
  with TComponentFunctionality_Create(Obj.idTObj,Obj.idObj) do
  try
  if (GetOwner({out} idTOwner,idOwner) AND (idTOwner = idTMapFormatObject))
   then with TMapFormatObjectFunctionality(TComponentFunctionality_Create(idTOwner,idOwner)) do
    try
    if (idMap <> Self.idObj)
     then with TTMapFormatMapFunctionality.Create() do
      try
      //. remove map object from area
      DestroyInstance(idObj);
      finally
      Release;
      end;
    finally
    Release;
    end;
  finally
  end;
  end;
  
var
  CL: TComponentsList;
  VF: TBase2DVisualizationFunctionality;
  ptrMapArea: TPtr;
  Lays: pointer;
  ProcessedCount: integer;
  ptrLay: pointer;
  ptrItem: pointer;
  ptrDestroyLay: pointer;
  ptrDestroyItem: pointer;
begin
if (QueryComponents(TBase2DVisualizationFunctionality, {out} CL))
 then
  try
  VF:=TBase2DVisualizationFunctionality(TComponentFunctionality_Create(TItemComponentsList(CL[0]^).idTComponent,TItemComponentsList(CL[0]^).idComponent));
  with VF do
  try
  ptrMapArea:=Ptr;
  //. process a list of object that are visible inside of map area visualization
  Space.Obj_GetLaysOfVisibleObjectsInside1(ptrMapArea,{out} Lays);
  try
  //.
  ProcessedCount:=0;
  ptrLay:=Lays;
  while (ptrLay <> nil) do with TLayReflect(ptrLay^) do begin
    ptrItem:=Objects;
    while (ptrItem <> nil) do with TItemLayReflect(ptrItem^) do begin
      ProcessObj(ptrMapArea,ptrObject);
      Inc(ProcessedCount);
      //. optimize resources
      if ((ProcessedCount MOD ObjectsPortionToClearContext) = 0) then Space.ClearInactiveSpaceContext();
      //.
      ptrItem:=ptrNext;
      end;
    ptrLay:=ptrNext;
    end;
  //.
  finally
  //. lays destroying
  while Lays <> nil do begin
    ptrDestroyLay:=Lays;
    Lays:=TLayReflect(ptrDestroyLay^).ptrNext;
    //. lay destroying
    with TLayReflect(ptrDestroyLay^) do
    while Objects <> nil do begin
      ptrDestroyItem:=Objects;
      Objects:=TItemLayReflect(ptrDestroyItem^).ptrNext;
      //. 
      FreeMem(ptrDestroyItem,SizeOf(TItemLayReflect));
      end;
    FreeMem(ptrDestroyLay,SizeOf(TLayReflect));
    end;
  end;
  finally
  Release;
  end;
  finally
  CL.Destroy;
  end
 else Raise Exception.Create('there is no area visualization'); //. =>
end;


{TTMapFormatObjectFunctionality}
Constructor TTMapFormatObjectFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTMapFormatObject;
RemotedFunctionality:=TTMapFormatObjectFunctionalityRemoted.Create(Self);
end
;
Destructor TTMapFormatObjectFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


function TTMapFormatObjectFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

procedure TTMapFormatObjectFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;

function TTMapFormatObjectFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TMapFormatObjectFunctionality.Create(Self, idComponent);
end
;

function TTMapFormatObjectFunctionality.getName: string;
begin
Result:=nmTMapFormatObject;
end
;

function TTMapFormatObjectFunctionality.getImage: TTypeImage;
begin
if (FImage = nil)
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TYPESDef\MapFormatObject\MapFormatObject.bmp');
  except
    end;
  end;
Result:=FImage;
end
;
procedure TTMapFormatObjectFunctionality.GetInstanceNames(const IDs: array of Int64; const IDs_Offset: integer; const IDs_Size: integer; var Names: TStringList);
begin
Raise Exception.Create(SNotSupported); //. =>
end
;
function TTMapFormatObjectFunctionality.GetDATAHash(DATAStream: TMemoryStream): integer;
begin
DATAStream.Position:=0;
Result:=Integer(CRC32Stream(DATAStream,DATAStream.Size));
end
;
function TTMapFormatObjectFunctionality.GetDATAHash(DATAStream: TByteArray): integer;
var
  DS: TMemoryStream;
begin
ByteArray_CreateStream(DATAStream, DS);
try
Result:=GetDATAHash(DS);
finally
DS.Destroy;
end;
end;


{TMapFormatObjectFunctionality}
Constructor TMapFormatObjectFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TMapFormatObjectFunctionalityRemoted.Create(Self);
end;

Destructor TMapFormatObjectFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


procedure TMapFormatObjectFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

function TMapFormatObjectFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TMapFormatObjectPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TMapFormatObjectFunctionality.DATAPanel_Create: TForm;
begin
case TMapFormat(FormatID) of
mfPolish: Result:=TfmPolishMapFormatObjectDataPanel.Create(Self);
else
  Raise Exception.Create('object is not of implemented format'); //. =>
end;
end
;
function TMapFormatObjectFunctionality.getidMap: integer;
begin
Result:=RemotedFunctionality.getidMap;
end;

function TMapFormatObjectFunctionality.GetHintInfo(const InfoType: integer; const InfoFormat: integer; out HintInfo: TByteArray): boolean;
var
  idTypeDescription,idDescription: integer;
begin
HintInfo:=nil;
Result:=false;
//.
case (InfoType) of
1: begin //. simple info
  case (InfoFormat) of
  1: begin //. txt format
    if (QueryComponent(idTDescription,{out} idTypeDescription,idDescription))
     then with TDescriptionFunctionality(TComponentFunctionality_Create(idTypeDescription,idDescription)) do
      try
      GetValue({out} HintInfo);
      Result:=(Length(HintInfo) > 0);
      finally
      Release();
      end;
    end;
  end;
  end;
end;
end;

procedure TMapFormatObjectFunctionality.setidMap(Value: integer);
begin
RemotedFunctionality.setidMap(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TMapFormatObjectFunctionality.getFormatID: integer;
begin
Result:=RemotedFunctionality.getFormatID;
end;

procedure TMapFormatObjectFunctionality.setFormatID(Value: integer);
begin
RemotedFunctionality.setFormatID(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TMapFormatObjectFunctionality.getKindID: integer;
begin
Result:=RemotedFunctionality.getKindID;
end;

procedure TMapFormatObjectFunctionality.setKindID(Value: integer);
begin
RemotedFunctionality.setKindID(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TMapFormatObjectFunctionality.getTypeID: integer;
begin
Result:=RemotedFunctionality.getTypeID;
end;

procedure TMapFormatObjectFunctionality.setTypeID(Value: integer);
begin
RemotedFunctionality.setTypeID(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TMapFormatObjectFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

procedure TMapFormatObjectFunctionality.setName(Value: string);
begin
RemotedFunctionality.setName(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TMapFormatObjectFunctionality.Notify(const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult;
begin
Result:=Inherited Notify(NotifyType,pidTObj,pidObj);
end
;
function TMapFormatObjectFunctionality._GetDataDocument(const DataModel: integer; const DataType: integer; const flWithComponents: boolean; var Document: TByteArray): boolean;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TMapFormatObjectFunctionality.GetDATA(out DATAStream: TMemoryStream);
var
  BA: TByteArray;
begin
GetDATA(BA);
ByteArray_CreateStream(BA, TMemoryStream(DATAStream));
end;

procedure TMapFormatObjectFunctionality.GetDATA(out DATAStream: TByteArray);
begin
RemotedFunctionality.GetDATA(DATAStream);
end;

procedure TMapFormatObjectFunctionality.SetDATA(DATAStream: TMemoryStream);
var
  BA: TByteArray;
begin
ByteArray_PrepareFromStream(BA,DATAStream);
SetDATA(BA);
end;

procedure TMapFormatObjectFunctionality.SetDATA(DATAStream: TByteArray);
begin
RemotedFunctionality.SetDATA(DATAStream);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TMapFormatObjectFunctionality.getDATAHash: integer;
begin
Result:=RemotedFunctionality.getDATAHash;
end;

procedure TMapFormatObjectFunctionality.setDATAHash(Value: integer);
begin
RemotedFunctionality.setDATAHash(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TMapFormatObjectFunctionality.GetParams(out oidMap: integer; out oFormatID: integer; out oKindID: integer; out oTypeID: integer; out oName: string);
begin
RemotedFunctionality.GetParams(oidMap,oFormatID,oKindID,oTypeID,oName);
end;

procedure TMapFormatObjectFunctionality.SetParams(const pidMap: integer; const pFormatID: integer; const pKindID: integer; const pTypeID: integer; const pName: string);
begin
RemotedFunctionality.SetParams(pidMap,pFormatID,pKindID,pTypeID,pName);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TMapFormatObjectFunctionality.SetObjectByDATA;
var
  _idMap: integer;
  _FormatID: integer;
  _KindID: integer;
  _TypeID: integer;
  _Name: string;

  procedure PolishFormat_Process();
  var
    DATAParser: TMapFormatObjectDATAParser;
    DATAFileSectionParser: TPMFFileSectionParser;
    CrdSysConvertor: TCrdSysConvertor;

    function ConvertGeoGrdToXY(const DatumID: integer; const Lat,Long,Alt: double; const idGeoSpace: integer; out X,Y: Extended): boolean;
    var
      GeoSpaceDatumID: integer;
      _Lat,_Long,_Alt: Extended;
      idGeoCrdSystem: integer;
      flTransformPointsLoaded: boolean;
    begin
    Result:=false;
    //. get GeoSpace Datum ID
    with TGeoSpaceFunctionality(TComponentFunctionality_Create(idTGeoSpace,idGeoSpace)) do
    try
    GeoSpaceDatumID:=GetDatumIDLocally();
    finally
    Release;
    end;
    //.
    TGeoDatumConverter.Datum_ConvertCoordinatesToAnotherDatum(DatumID, Lat,Long,Alt, GeoSpaceDatumID,  _Lat,_Long,_Alt);
    //. get appropriate geo coordinate system
    with TTGeoCrdSystemFunctionality.Create do
    try
    GetInstanceByLatLongLocally(idGeoSpace, _Lat,_Long,  idGeoCrdSystem);
    finally
    Release;
    end;
    if ((CrdSysConvertor = nil) OR (CrdSysConvertor.idCrdSys <> idGeoCrdSystem))
     then begin
      FreeAndNil(CrdSysConvertor);
      //.
      if (idGeoCrdSystem <> 0)
       then begin
        CrdSysConvertor:=TCrdSysConvertor.Create(Space,idGeoCrdSystem);
        flTransformPointsLoaded:=false;
        end;
      end;
    if (CrdSysConvertor <> nil)
     then begin
      ///? if (NOT flTransformPointsLoaded OR (CrdSysConvertor.GetDistance(CrdSysConvertor.GeoToXY_Points_Lat,CrdSysConvertor.GeoToXY_Points_Long, TrackItem.Latitude,TrackItem.Longitude) > MaxDistanceForGeodesyPointsReload))
      if (CrdSysConvertor.flLinearApproximationCrdSys AND (NOT flTransformPointsLoaded OR CrdSysConvertor.LinearApproximationCrdSys_LLIsOutOfApproximationZone(_Lat,_Long)))
       then begin
        CrdSysConvertor.GeoToXY_LoadPoints(_Lat,_Long);
        flTransformPointsLoaded:=true;
        end;
      //.
      Result:=CrdSysConvertor.ConvertGeoToXY(_Lat,_Long, X,Y);
      end;
    end;

    procedure SetHINTVisualization(const idHINTVisualization: integer);
    var
      MS: TMemoryStream;
      DATA: THINTVisualizationDATA;
    begin
    with THINTVisualizationFunctionality(TComponentFunctionality_Create(idTHINTVisualization,idHINTVisualization)) do
    try
    GetPrivateDATA(MS);
    try
    DATA:=THintVisualizationDATA.Create(MS);
    with DATA do
    try
    InfoString:=DATAFileSectionParser.LabelName;
    InfoComponent.idType:=Self.idTObj;
    InfoComponent.idObj:=Self.idObj;
    SetProperties();
    //. save new data
    SetPrivateDATA(DATA);
    finally
    DATA.Destroy;
    end;
    finally
    MS.Destroy;
    end;
    finally
    Release;
    end;
    end;

    procedure Visualization_SetPosition(const VF: TBase2DVisualizationFunctionality; const X,Y: Extended);
    var
      BA: TByteArray;
      BAPtr: pointer;
      NodesCount: integer;
      XSum,YSum: Extended;
      I: integer;
      _X,_Y: double;
      Xc,Yc: Extended;
      dX,dY: double;
    begin
    VF.GetNodes(BA);
    BAPtr:=Pointer(@BA[0]);
    NodesCount:=Integer(BAPtr^); Inc(Integer(BAPtr),SizeOf(NodesCount));
    if (NodesCount < 2) then Raise Exception.Create('Visualization_SetPosition: visualization nodes number are less than 2'); //. =>
    XSum:=0.0; YSum:=0.0;
    for I:=0 to NodesCount-1 do begin
      _X:=Double(BAPtr^); Inc(Integer(BAPtr),SizeOf(_X));
      _Y:=Double(BAPtr^); Inc(Integer(BAPtr),SizeOf(_Y));
      XSum:=XSum+_X; YSum:=YSum+_Y;
      end;
    Xc:=XSum/NodesCount; Yc:=YSum/NodesCount;
    dX:=X-Xc; dY:=Y-Yc;
    VF.Move(dX,dY,0);
    end;

  var
    idGeoSpace: integer;
    DATA: TMemoryStream;
    FileSectionStr: ANSIString;
    NL: TStringList;
    DatumStr: ANSIString;
    MapDatumID: integer;
    CL: TComponentsList;
    VF: TBase2DVisualizationFunctionality;
    _NodesCount: integer;
    _Nodes: TByteArray;
    ptrNode: pointer;
    I: integer;
    X,Y: Extended;
    TransformedNodesCount: integer;
    BA: TByteArray;
    DetailsList: TComponentsList;
  begin
  with TMapFormatMapFunctionality(TComponentFunctionality_Create(idTMapFormatMap,idMap)) do
  try
  idGeoSpace:=GeoSpaceID;
  GetDATA({out} DATA);
  try
  with TMapFormatObjectDATAParser.Create() do
  try
  LoadFromStream(DATA);
  FileSectionStr:=FileSection;
  finally
  Destroy;
  end;
  finally
  DATA.Destroy;
  end;
  //.
  NL:=TStringList.Create;
  try
  NL.Text:=FileSectionStr;
  if (TPFMParser.GetNodeValue(NL,'Datum', {out} DatumStr))
   then begin
    if (DatumStr = 'W84') then MapDatumID:=23{WGS-84} else Raise Exception.Create('unknown map Datum'); //. =>
    end
   else MapDatumID:=23; //. WGS-84
  finally
  NL.Destroy;
  end;
  finally
  Release;
  end;
  //.
  DATAParser:=TMapFormatObjectDATAParser.Create;
  try
  GetDATA(DATA);
  try
  DATAParser.LoadFromStream(DATA);
  finally
  DATA.Destroy;
  end;
  DATAFileSectionParser:=TPMFFileSectionParser.Create;
  try
  DATAFileSectionParser.LoadFromStr(DATAParser.FileSection);
  //.
  CrdSysConvertor:=nil;
  try
  //. set object name
  Name:=DATAFileSectionParser.LabelName;
  //. set nodes
  if (QueryComponents(TBase2DVisualizationFunctionality, {out} CL))
   then
    try
    VF:=TBase2DVisualizationFunctionality(TComponentFunctionality_Create(TItemComponentsList(CL[0]^).idTComponent,TItemComponentsList(CL[0]^).idComponent));
    with VF do
    try
    _NodesCount:=Length(DATAFileSectionParser.Data0);
    if (_NodesCount > 1)
     then begin //. set visualization nodes
      SetLength(_Nodes,SizeOf(_NodesCount)+_NodesCount*(2*SizeOf(Double)));
      ptrNode:=@_Nodes[0];
      TransformedNodesCount:=0;
      Integer(ptrNode^):=_NodesCount; Inc(Integer(ptrNode),SizeOf(_NodesCount));
      for I:=0 to Length(DATAFileSectionParser.Data0)-1 do begin
        if (ConvertGeoGrdToXY(MapDatumID, DATAFileSectionParser.Data0[I].Lat,DATAFileSectionParser.Data0[I].Long,0, idGeoSpace, {out} X,Y))
         then begin
          Double(ptrNode^):=X; Inc(Integer(ptrNode),SizeOf(Double));
          Double(ptrNode^):=Y; Inc(Integer(ptrNode),SizeOf(Double));
          Inc(TransformedNodesCount);
          end;
        end;
      if (TransformedNodesCount = _NodesCount)
       then VF.SetNodes(_Nodes,Width)
       else Raise Exception.Create('Geo coordinates of object is out of scope'); //. =>
      end
     else begin //. set visualization position
      if (NOT ConvertGeoGrdToXY(MapDatumID, DATAFileSectionParser.Data0[0].Lat,DATAFileSectionParser.Data0[0].Long,0, idGeoSpace, {out} X,Y)) then Raise Exception.Create('Geo coordinates of object is out of scope'); //. =>
      Visualization_SetPosition(VF, X,Y);
      end;
    VF.DoOnComponentUpdate();
    //. try to set label on HintVusialization if that is exist
    if (idTObj = idTHINTVisualization)
     then begin
      SetHINTVisualization(idObj);
      end
     else
      if (GetDetailsList({out} DetailsList))
       then
        try
        for I:=0 to DetailsList.Count-1 do with TItemComponentsList(DetailsList[I]^) do
          if (idTComponent = idTHINTVisualization)
           then begin
            SetHINTVisualization(idComponent);
            Break; //. >
            end;
        finally
        DetailsList.Destroy;
        end;
    finally
    Release;
    end;
    finally
    CL.Destroy;
    end
   else Raise Exception.Create('Visualization component is not found'); //. =>
  finally
  FreeAndNil(CrdSysConvertor);
  end;
  finally
  DATAFileSectionParser.Destroy;
  end;
  finally
  DATAParser.Destroy;
  end;
  end;

begin
GetParams({out} _idMap,_FormatID,_KindID,_TypeID,_Name);
case TMapFormat(_FormatID) of
mfPolish: PolishFormat_Process();
else
  Raise Exception.Create('map object is not of implemented format'); //. =>
end;
end;

procedure TMapFormatObjectFunctionality.UpdateDATAHash;
begin
RemotedFunctionality.UpdateDATAHash;
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TMapFormatObjectFunctionality.Compile;
var
  _idMap: integer;
  _FormatID: integer;
  _KindID: integer;
  _TypeID: integer;
  _Name: string;

  procedure PolishFormat_Process(); //. the same as in unitPolishMapFormatObjectDataPanel.pas

    procedure GetObjectGeoCoordinates(const _idMap: integer; out GeoCoordinates: TGeoCoordinatesArray);
    var
      CrdSysConvertor: TCrdSysConvertor;

      function ConvertXYToGeo(const idGeoSpace: integer; const X,Y: Extended; const DatumID: integer; out Lat,Long,Alt: Extended): boolean;
      var
        GeoSpaceDatumID: integer;
        _Lat,_Long,_Alt: Extended;
        idGeoCrdSystem: integer;
        flTransformPointsLoaded: boolean;
      begin
      Result:=false;
      //. get appropriate geo coordinate system
      with TTGeoCrdSystemFunctionality.Create do
      try
      _UserName:=Self._UserName;
      _UserPassword:=Self._UserPassword;
      //.
      GetInstanceByXYLocally(idGeoSpace, X,Y,  idGeoCrdSystem);
      finally
      Release;
      end;
      if ((CrdSysConvertor = nil) OR (CrdSysConvertor.idCrdSys <> idGeoCrdSystem))
       then begin
        FreeAndNil(CrdSysConvertor);
        //.
        if (idGeoCrdSystem <> 0)
         then begin
          CrdSysConvertor:=TCrdSysConvertor.Create(Space,idGeoCrdSystem);
          flTransformPointsLoaded:=false;
          end;
        end;
      if (CrdSysConvertor <> nil)
       then begin
        ///? if (NOT flTransformPointsLoaded OR (CrdSysConvertor.GetDistance(CrdSysConvertor.GeoToXY_Points_Lat,CrdSysConvertor.GeoToXY_Points_Long, TrackItem.Latitude,TrackItem.Longitude) > MaxDistanceForGeodesyPointsReload))
        if (CrdSysConvertor.flLinearApproximationCrdSys AND (NOT flTransformPointsLoaded OR CrdSysConvertor.LinearApproximationCrdSys_XYIsOutOfApproximationZone(X,Y)))
         then begin
          CrdSysConvertor.XYToGeo_LoadPoints(X,Y);
          flTransformPointsLoaded:=true;
          end;
        //.
        Result:=CrdSysConvertor.ConvertXYToGeo(X,Y,{out} _Lat,_Long);
        //. datum transform
        with TGeoSpaceFunctionality(TComponentFunctionality_Create(idTGeoSpace,idGeoSpace)) do //. get GeoSpace Datum ID
        try
        _UserName:=Self._UserName;
        _UserPassword:=Self._UserPassword;
        //.
        GeoSpaceDatumID:=GetDatumIDLocally();
        finally
        Release;
        end;
        _Alt:=0; //. zero Altitude
        TGeoDatumConverter.Datum_ConvertCoordinatesToAnotherDatum(GeoSpaceDatumID, _Lat,_Long,_Alt, DatumID,{out} Lat,Long,Alt);
        end;
      end;

    var
      idGeoSpace: integer;
      MapDATA: TMemoryStream;
      FileSectionStr: ANSIString;
      NL: TStringList;
      DatumStr: ANSIString;
      MapDatumID: integer;
      CL: TComponentsList;
      VF: TBase2DVisualizationFunctionality;
      BA: TByteArray;
      BAPtr: pointer;
      NodesCount: integer;
      I: integer;
      X,Y: double;
      Lat,Long,Alt: Extended;
    begin
    //. get map properties
    with TMapFormatMapFunctionality(TComponentFunctionality_Create(idTMapFormatMap,_idMap)) do
    try
    _UserName:=Self._UserName;
    _UserPassword:=Self._UserPassword;
    //.
    idGeoSpace:=GeoSpaceID;
    GetDATA({out} MapDATA);
    try
    with TMapFormatObjectDATAParser.Create() do
    try
    LoadFromStream(MapDATA);
    FileSectionStr:=FileSection;
    finally
    Destroy;
    end;
    finally
    MapDATA.Destroy;
    end;
    //.
    NL:=TStringList.Create;
    try
    NL.Text:=FileSectionStr;
    if (TPFMParser.GetNodeValue(NL,'Datum', {out} DatumStr))
     then begin
      if (DatumStr = 'W84') then MapDatumID:=23{WGS-84} else Raise Exception.Create('unknown map Datum'); //. =>
      end
     else MapDatumID:=23; //. WGS-84
    finally
    NL.Destroy;
    end;
    finally
    Release;
    end;
    //.
    CrdSysConvertor:=nil;
    try
    if (QueryComponents(TBase2DVisualizationFunctionality, {out} CL))
     then
      try
      VF:=TBase2DVisualizationFunctionality(TComponentFunctionality_Create(TItemComponentsList(CL[0]^).idTComponent,TItemComponentsList(CL[0]^).idComponent));
      with VF do
      try
      _UserName:=Self._UserName;
      _UserPassword:=Self._UserPassword;
      //.
      GetNodes({out} BA);
      if (Length(BA) = 0) then Raise Exception.Create('there are no visualization nodes'); //. =>
      BAPtr:=Pointer(@BA[0]);
      NodesCount:=Integer(BAPtr^); Inc(Integer(BAPtr),SizeOf(NodesCount));
      if (NodesCount < 2) then Raise Exception.Create('Visualization nodes number are less than 2'); //. =>
      if (NodesCount > 2)
       then begin
        SetLength(GeoCoordinates,NodesCount);
        for I:=0 to NodesCount-1 do begin
          X:=Double(BAPtr^); Inc(Integer(BAPtr),SizeOf(X));
          Y:=Double(BAPtr^); Inc(Integer(BAPtr),SizeOf(Y));
          if (NOT ConvertXYToGeo(idGeoSpace,X,Y, MapDatumID, {out} Lat,Long,Alt)) then Raise Exception.Create('could not convert X,Y to latitude,longitude'); //. =>
          //.
          GeoCoordinates[I].Lat:=Lat;
          GeoCoordinates[I].Long:=Long;
          end;
        end
       else begin
        X:=Double(BAPtr^); Inc(Integer(BAPtr),SizeOf(X));
        Y:=Double(BAPtr^); Inc(Integer(BAPtr),SizeOf(Y));
        X:=X+Double(BAPtr^); Inc(Integer(BAPtr),SizeOf(X));
        Y:=Y+Double(BAPtr^); Inc(Integer(BAPtr),SizeOf(Y));
        X:=X/2.0;
        Y:=Y/2.0;
        SetLength(GeoCoordinates,1);
        if (NOT ConvertXYToGeo(idGeoSpace,X,Y, MapDatumID, {out} Lat,Long,Alt)) then Raise Exception.Create('could not convert X,Y to latitude,longitude'); //. =>
        //.
        GeoCoordinates[0].Lat:=Lat;
        GeoCoordinates[0].Long:=Long;
        end;
      finally
      Release;
      end;
      finally
      CL.Destroy;
      end
     else Raise Exception.Create('Visualization component is not found'); //. =>
    finally
    CrdSysConvertor.Free;
    end;
    end;
    
  var
    DATA: TMemoryStream;
    DATAParser: TMapFormatObjectDATAParser;
    DATAFileSectionParser: TPMFFileSectionParser;
    SectionStr: ANSIString;
  begin
  DATAParser:=TMapFormatObjectDATAParser.Create;
  try
  GetDATA({out} DATA);
  try
  DATAParser.LoadFromStream(DATA);
  finally
  DATA.Destroy;
  end;
  DATAFileSectionParser:=TPMFFileSectionParser.Create;
  try
  DATAFileSectionParser.LoadFromStr(DATAParser.FileSection);
  //. save DATA of object first
  DATAFileSectionParser.LabelName:=_Name;
  DATAFileSectionParser.TypeID:=Word(_TypeID);
  GetObjectGeoCoordinates(_idMap,{out} DATAFileSectionParser.Data0);
  DATAFileSectionParser.SaveToStr(SectionStr);
  DATAParser.FileSection:=SectionStr;
  //.
  DATA:=TMemoryStream.Create;
  try
  DATAParser.SaveToStream(DATA);
  SetDATA(DATA);
  finally
  DATA.Destroy;
  end;
  finally
  DATAFileSectionParser.Destroy;
  end;
  finally
  DATAParser.Destroy;
  end;
  end;

begin
GetParams({out} _idMap,_FormatID,_KindID,_TypeID,_Name);
case TMapFormat(_FormatID) of
mfPolish: PolishFormat_Process();
else
  Raise Exception.Create('map object is not of implemented format'); //. =>
end;
end;

procedure TMapFormatObjectFunctionality.Build(const flUsePrototype: boolean);
var
  _idMap: integer;
  _FormatID: integer;
  _KindID: integer;
  _TypeID: integer;
  _Name: string;

  procedure PolishFormat_Process();
  begin
  with TMapFormatMapFunctionality(TComponentFunctionality_Create(idTMapFormatMap,_idMap)) do
  try
  _UserName:=Self._UserName;
  _UserPassword:=Self._UserPassword;
  //.
  with TPFMapRecalculator.Create(Space,Self._UserName,Self._UserPassword,idObj,GeoSpaceID) do
  try
  Recalculate(flUsePrototype,Self.idObj);
  finally
  Destroy;
  end;
  finally
  Release;
  end;
  end;

begin
GetParams({out} _idMap,_FormatID,_KindID,_TypeID,_Name);
case TMapFormat(_FormatID) of
mfPolish: PolishFormat_Process();
else
  Raise Exception.Create('map object is not of implemented format'); //. =>
end;                                                           
end;



{TTPatternVisualizationFunctionality}
Constructor TTPatternVisualizationFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTPatternVisualization;
RemotedFunctionality:=TTPatternVisualizationFunctionalityRemoted.Create(Self);
end
;
Destructor TTPatternVisualizationFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


function TTPatternVisualizationFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

function TTPatternVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TPatternVisualizationFunctionality.Create(Self, idComponent);
end
;

function TTPatternVisualizationFunctionality.getName: string;
begin
Result:=nmTPatternVisualization;
end
;

function TTPatternVisualizationFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TypesDef\PatternVisualization\PatternVisualization.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

function TTPatternVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TObjectVisualization.Create;
with Result do begin
Color:=clWhite;
Width:=0;
flLoop:=false;
AddPoint(-50,0);
AddPoint(50,0);
end;
end
;

{TPatternVisualizationFunctionality}
Constructor TPatternVisualizationFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TPatternVisualizationFunctionalityRemoted.Create(Self);
end;

Destructor TPatternVisualizationFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


procedure TPatternVisualizationFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

procedure TPatternVisualizationFunctionality.DestroyData;
begin
Raise Exception.Create(SNotSupported); //. =>
end
;
procedure TPatternVisualizationFunctionality.CloneData(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

procedure TPatternVisualizationFunctionality.LoadFromFile(const FileName: string);
var
  MemoryStream: TMemoryStream;
begin
MemoryStream:=TMemoryStream.Create;
try
MemoryStream.LoadFromFile(FileName);
SetDATA(MemoryStream,cftBMP);
finally
MemoryStream.Destroy;
end;
end
;

function TPatternVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
var
  ptrItem: pointer;
  DATAFilePtr: pointer;

  function ReflectFigures(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; BMP: TBitmap): boolean;

    procedure ReflectFigure(pFigure: TFigureWinRefl);
    type
      PPoints = ^TPoints;
      TPoints = array[0..0] of Windows.TPoint;
    var
      LogBrush: TLogBrush;
      BH: HBrush;
      LogPen: TLogPen;
      PH: HPen;
    begin
    BMP.Canvas.Lock();
    try
    with LogBrush do begin
    lbStyle:=BS_PATTERN;
    lbHatch:=BMP.Handle;
    lbColor:=ColorToRGB(pFigure.ColorFill);
    end;
    BH:=CreateBrushIndirect(LogBrush);
    with LogPen do begin
    lopnStyle:=PS_SOLID;
    lopnWidth.X:=1;
    lopnColor:=ColorToRGB(pFigure.Color);
    end;
    PH:=CreatePenIndirect(LogPen);
    try
    SelectObject(pCanvas.Handle,BH);
    SelectObject(pCanvas.Handle,PH);
    try
    Windows.Polygon(pCanvas.Handle,PPoints(@pFigure.ScreenNodes)^,pFigure.CountScreenNodes);
    finally
    SelectObject(pCanvas.Handle,pCanvas.Brush.Handle);
    SelectObject(pCanvas.Handle,pCanvas.Pen.Handle);
    end;
    Result:=true;
    finally
    DeleteObject(PH);
    DeleteObject(BH);
    end;
    finally
    BMP.Canvas.Unlock();
    end;
    end;

  begin
  Result:=false;
  //.
  if (pFigure.CountScreenNodes > 0)
   then with pFigure do
    if (flagLoop AND flagFill) then ReflectFigure(pFigure);
  //.
  if (pAdditionalFigure.CountScreenNodes > 0) then ReflectFigure(pAdditionalFigure);
  //.
  Result:=true;
  end;

begin
Result:=false;
try
TypeSystem.Lock.Enter;
try
if (NOT TSystemTPatternVisualization(TypeSystem).Cash.GetItem(Self.idObj, ptrItem))
 then begin
  Result:=ReflectAsNotLoaded(pFigure,pAdditionalFigure, pReflectionWindow, pCanvas);
  Exit; //. ->
  end;
with TItemTPatternVisualizationCash(ptrItem^) do begin
if ((idDATAFile <> 0) AND TSystemTPatternVisualization(TypeSystem).Cash.DATAFileRepository.DATAFile_Lock(idDATAFile,{out} DATAFilePtr))
 then with TPatternVisualizationDATAFile(DATAFilePtr^) do
  try
  Result:=ReflectFigures(pFigure,pAdditionalFigure,DATA);
  finally
  TSystemTPatternVisualization(TypeSystem).Cash.DATAFileRepository.DATAFile_Unlock(DATAFilePtr);
  end
 else
  Result:=ReflectAsNotLoaded(pFigure,pAdditionalFigure, pReflectionWindow, pCanvas);
//.
end;
finally
TypeSystem.Lock.Leave;
end;
except
  end;
end
;

function TPatternVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TPatternVisualizationPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;

function TPatternVisualizationFunctionality.DATASize: integer;
begin
Result:=Inherited DATASize;
end
;
function TPatternVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=RemotedFunctionality.GetOwner(idTOwner,idOwner);
end;

function TPatternVisualizationFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TPatternVisualizationFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

procedure TPatternVisualizationFunctionality.GetDATA(out DATAStream: TMemoryStream; out DATAType: TComponentFileType);
var
  BA: TByteArray;
  DT: integer;
begin
GetDATA(BA,DT); DATAType:=TComponentFileType(DT);
ByteArray_CreateStream(BA, TMemoryStream(DATAStream));
end;

procedure TPatternVisualizationFunctionality.GetDATA(out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer);
var
  BA: TByteArray;
  DT: integer;
begin
GetDATA(BA,DT,MaxSize); DATAType:=TComponentFileType(DT);
ByteArray_CreateStream(BA, TMemoryStream(DATAStream));
end;

procedure TPatternVisualizationFunctionality.GetDATA(out DATAStream: TByteArray; out DATAType: Integer);
begin
RemotedFunctionality.GetDATA(DATAStream,DATAType);
end;

procedure TPatternVisualizationFunctionality.GetDATA(out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer);
begin
RemotedFunctionality.GetDATA1(DATAStream,DATAType,MaxSize);
end;

procedure TPatternVisualizationFunctionality.SetDATA(DATAStream: TMemoryStream; const DATAType: TComponentFileType);
var
  BA: TByteArray;
begin
ByteArray_PrepareFromStream(BA,DATAStream);
SetDATA(BA,Integer(DATAType));
end;

procedure TPatternVisualizationFunctionality.SetDATA(DATAStream: TByteArray; const DATAType: integer);
begin
RemotedFunctionality.SetDATA(DATAStream,DATAType);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TPatternVisualizationFunctionality.getDATAFileID: integer;
begin
Result:=RemotedFunctionality.getDATAFileID;
end;

procedure TPatternVisualizationFunctionality.setDATAFileID(Value: integer);
begin
RemotedFunctionality.setDATAFileID(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TPatternVisualizationFunctionality.DATAFile_Clear;
begin
RemotedFunctionality.DATAFile_Clear;
//. update local TypesSystem and representations
Space.StayUpToDate;
end;




{TTURLFunctionality}
Constructor TTURLFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTURL;
RemotedFunctionality:=TTURLFunctionalityRemoted.Create(Self);
end
;
Destructor TTURLFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


function TTURLFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

procedure TTURLFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;

function TTURLFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TURLFunctionality.Create(Self, idComponent);
end
;

function TTURLFunctionality.getName: string;
begin
Result:=nmTURL;
end
;

function TTURLFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TYPESDef\URL\URL.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

{TURLFunctionality}
Constructor TURLFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TURLFunctionalityRemoted.Create(Self);
end;

Destructor TURLFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


procedure TURLFunctionality.UpdateDATA;
begin
Inherited;
GetParams({out} _URL,{out} _URLName,{out} _flPanelBrowser);
end;

procedure TURLFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

function TURLFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TURLPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TURLFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TURLFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

function TURLFunctionality.getURL: string;
begin
Result:=RemotedFunctionality.getURL;
end;

procedure TURLFunctionality.setURL(Value: string);
begin
RemotedFunctionality.setURL(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TURLFunctionality.getURLName: string;
begin
Result:=RemotedFunctionality.getURLName;
end;

procedure TURLFunctionality.setURLName(Value: string);
begin
RemotedFunctionality.setURLName(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TURLFunctionality.getflPanelBrowser: boolean;
begin
Result:=RemotedFunctionality.getflPanelBrowser;
end;

procedure TURLFunctionality.setflPanelBrowser(Value: boolean);
begin
RemotedFunctionality.setflPanelBrowser(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TURLFunctionality.GetParams(out oURL: string; out oURLName: string; out oflPanelBrowser: boolean);
begin
RemotedFunctionality.GetParams(oURL,oURLName,oflPanelBrowser);
end;

procedure TURLFunctionality.SetParams(const pURL: string; const pURLName: string; const pflPanelBrowser: boolean);
begin
RemotedFunctionality.SetParams(pURL,pURLName,pflPanelBrowser);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;


{TTInt32VarFunctionality}
Constructor TTInt32VarFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTInt32Var;
RemotedFunctionality:=TTInt32VarFunctionalityRemoted.Create(Self);
end
;
Destructor TTInt32VarFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


function TTInt32VarFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

procedure TTInt32VarFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

function TTInt32VarFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TInt32VarFunctionality.Create(Self, idComponent);
end
;

function TTInt32VarFunctionality.getName: string;
begin
Result:=nmTInt32Var;
end
;

function TTInt32VarFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TYPESDef\Int32Var\Int32Var.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

{TInt32VarFunctionality}
Constructor TInt32VarFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TInt32VarFunctionalityRemoted.Create(Self);
end;

Destructor TInt32VarFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


procedure TInt32VarFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

function TInt32VarFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TInt32VarPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TInt32VarFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TInt32VarFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

function TInt32VarFunctionality.getValue: integer;
begin
Result:=RemotedFunctionality.getValue;
end;

procedure TInt32VarFunctionality.setValue(_Value: integer);
begin
RemotedFunctionality.setValue(_Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TInt32VarFunctionality.getSetTimeStamp: TDateTime;
begin
Result:=RemotedFunctionality.getSetTimeStamp;
end;


{TTDoubleVarFunctionality}
Constructor TTDoubleVarFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTDoubleVar;
RemotedFunctionality:=TTDoubleVarFunctionalityRemoted.Create(Self);
end
;
Destructor TTDoubleVarFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


function TTDoubleVarFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

procedure TTDoubleVarFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

function TTDoubleVarFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TDoubleVarFunctionality.Create(Self, idComponent);
end
;

function TTDoubleVarFunctionality.getName: string;
begin
Result:=nmTDoubleVar;
end
;

function TTDoubleVarFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TYPESDef\DoubleVar\DoubleVar.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

{TDoubleVarFunctionality}
Constructor TDoubleVarFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TDoubleVarFunctionalityRemoted.Create(Self);
end;

Destructor TDoubleVarFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


procedure TDoubleVarFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

function TDoubleVarFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TDoubleVarPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TDoubleVarFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TDoubleVarFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

function TDoubleVarFunctionality.getValue: Double;
begin
Result:=RemotedFunctionality.getValue;
end;

procedure TDoubleVarFunctionality.setValue(_Value: Double);
begin
RemotedFunctionality.setValue(_Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TDoubleVarFunctionality.getSetTimeStamp: TDateTime;
begin
Result:=RemotedFunctionality.getSetTimeStamp;
end;


{TTMODELServerVisualizationFunctionality}

Constructor TTMODELServerVisualizationFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTMODELServerVisualization;
RemotedFunctionality:=TTMODELServerVisualizationFunctionalityRemoted.Create(Self);
end
;
Destructor TTMODELServerVisualizationFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;

function TTMODELServerVisualizationFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

function TTMODELServerVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TMODELServerVisualizationFunctionality.Create(Self, idComponent);
end
;
function TTMODELServerVisualizationFunctionality.getName: string;
begin
Result:=nmTMODELServerVisualization;
end;


function TTMODELServerVisualizationFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TypesDef\MODELServerVisualization\MODELServerVisualization.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

function TTMODELServerVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TObjectVisualization.Create;
with Result do begin
Color:=clWhite;
Width:=0;
flLoop:=false;
AddPoint(-50,0);
AddPoint(50,0);
end;
end
;

{TMODELServerVisualizationFunctionality}
Constructor TMODELServerVisualizationFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TMODELServerVisualizationFunctionalityRemoted.Create(Self);
end;

Destructor TMODELServerVisualizationFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;

procedure TMODELServerVisualizationFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;


function TMODELServerVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TMODELServerVisualizationPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TMODELServerVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=RemotedFunctionality.GetOwner(idTOwner,idOwner);
end;

function TMODELServerVisualizationFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TMODELServerVisualizationFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

procedure TMODELServerVisualizationFunctionality.DestroyData;
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TMODELServerVisualizationFunctionality.CloneData(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end;

procedure TMODELServerVisualizationFunctionality_Reflecting_ReflectFigureWithPattern(const pFigure: TFigureWinRefl; const PatternBMP: TBitmap; const pCanvas: TCanvas);
type
  PPoints = ^TPoints;
  TPoints = array[0..0] of Windows.TPoint;
var
  LogBrush: TLogBrush;
  BH: HBrush;
  LogPen: TLogPen;
  PH: HPen;
begin
with LogBrush do begin
lbStyle:=BS_PATTERN;
lbHatch:=PatternBMP.Handle;
lbColor:=ColorToRGB(pFigure.ColorFill);
end;
BH:=CreateBrushIndirect(LogBrush);
with LogPen do begin
lopnStyle:=PS_SOLID;
lopnWidth.X:=1;
lopnColor:=ColorToRGB(pFigure.Color);
end;
PH:=CreatePenIndirect(LogPen);
try
SelectObject(pCanvas.Handle,BH);
SelectObject(pCanvas.Handle,PH);
try
Windows.Polygon(pCanvas.Handle,PPoints(@pFigure.ScreenNodes)^,pFigure.CountScreenNodes);
finally
SelectObject(pCanvas.Handle,pCanvas.Brush.Handle);
SelectObject(pCanvas.Handle,pCanvas.Pen.Handle);
end;
finally
DeleteObject(PH);
DeleteObject(BH);
end;
end;

procedure TMODELServerVisualizationFunctionality_Reflecting_PreprocessReflectingBMP(const BMP: TBitmap);
var
  DIBSection: TDIBSection;
  ptrPixel: pointer;
  XSize,YSize,YStep: integer;
begin
if (GetObject(BMP.Handle,SizeOf(DIBSection),@DIBSection) <> 0)
 then ptrPixel:=System.PByte(DIBSection.dsBm.bmBits)
 else Exit; //. ->
XSize:=BMP.Width;
YSize:=BMP.Height;
YStep:=XSize*3{24 bits bitmap};
if ((YStep MOD 4) > 0) then YStep:=YStep-(YStep MOD 4)+4;
asm
      PUSH EAX
      PUSH EBX
      PUSH ECX
      PUSH EDX
      PUSH ESI
      PUSH EDI
      MOV ESI,ptrPixel
      MOV EDI,ESI
      MOV ECX,YSize
      CLD
  @M0:  PUSH ECX
        MOV ECX,XSize
    @M1:  PUSH ECX
          MOV AL,[EDI]
          XOR AH,AH
          MOV DX,114
          MUL DX
          MOV BX,AX
          MOV CX,DX
          MOV AL,[EDI+1]
          XOR AH,AH
          MOV DX,587
          MUL DX
          ADD BX,AX
          ADC CX,DX
          MOV AL,[EDI+2]
          XOR AH,AH
          MOV DX,299
          MUL DX
          ADD AX,BX
          ADC DX,CX
          MOV CX,1000
          DIV CX
          STOSB
          STOSB
          STOSB
          POP ECX
          LOOP @M1
        POP ECX
        ADD ESI,YStep
        MOV EDI,ESI
        LOOP @M0
      POP EDI
      POP ESI
      POP EDX
      POP ECX
      POP EBX
      POP EAX
end;
end;

function TMODELServerVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
var
  ptrItem: pointer;
  F: TFigureWinRefl;
  Xmn,Ymn,Xmx,Ymx: Extended;
  RW: TReflectionWindowStruc;
  RW_VisibleFactor: integer;
  RW_Scale: Extended;
  WX,WY: TCrd;
  WindowParams: TWindowViewDataParams;
  BMP: TBitmap;
  ClippingRegion: HRGN;
  DeferredReflectings: TList;
  flDeferredReflectingFound: boolean;
  I: integer;
begin
Result:=false;
try
TypeSystem.Lock.Enter;
try
ptrItem:=TSystemTMODELServerVisualization(TypeSystem).Cash.GetPtrItem(idObj);
if (ptrItem = nil) then Exit; //. ->
with TItemTMODELServerVisualizationCash(ptrItem^) do begin
if ((pFigure.CountScreenNodes > 0) AND pFigure.flagLoop AND pFigure.flagFill)
 then F:=pFigure
 else
  if (pAdditionalFigure.CountScreenNodes > 0)
   then F:=pAdditionalFigure
   else F:=nil;
if (F = nil) then Exit; //. ->
if (NOT F.Nodes_GetMinMax({out} Xmn,Ymn,Xmx,Ymx)) then Exit; //. ->
with pReflectionWindow do begin
Lock.Enter;
try
GetWindow(true,{out} RW);
RW_Scale:=_Scale;
RW_VisibleFactor:=_VisibleFactor;
finally
Lock.Leave;
end;
end;
if ((Xmx < RW.Xmn) OR (Xmn > RW.Xmx) OR (Ymx < RW.Ymn) OR (Ymn > RW.Ymx)) then Exit; //. ->
if (Xmn < RW.Xmn) then Xmn:=RW.Xmn; if (Xmx > RW.Xmx) then Xmx:=RW.Xmx;
if (Ymn < RW.Ymn) then Ymn:=RW.Ymn; if (Ymx > RW.Ymx) then Ymx:=RW.Ymx;
//. preparing work window
pReflectionWindow.ConvertScrExtendCrd2RealCrd(Xmn,Ymn,{out} WX,WY); RW.X0:=WX; RW.Y0:=WY;
pReflectionWindow.ConvertScrExtendCrd2RealCrd(Xmx,Ymn,{out} WX,WY); RW.X1:=WX; RW.Y1:=WY;
pReflectionWindow.ConvertScrExtendCrd2RealCrd(Xmx,Ymx,{out} WX,WY); RW.X2:=WX; RW.Y2:=WY;
pReflectionWindow.ConvertScrExtendCrd2RealCrd(Xmn,Ymx,{out} WX,WY); RW.X3:=WX; RW.Y3:=WY;
RW.Xmn:=Trunc(Xmn); RW.Ymn:=Trunc(Ymn);
RW.Xmx:=Trunc(Xmx); RW.Ymx:=Trunc(Ymx);
//. preparing params
with (FReflector as TReflector) do begin
WindowParams.Reflector:=(FReflector as TReflector);
WindowParams.ServerURL:=ServerURL;
WindowParams.InvisibleLayNumbersArray:=TObjectReflectingCfg(Reflecting.ObjectConfiguration).HidedLays.GetLayNumbersArray();
SystemTLay2DVisualization.AddInvisibleLaysToNumbersArray(RW_Scale,{ref} WindowParams.InvisibleLayNumbersArray);
WindowParams.VisibleFactor:=RW_VisibleFactor;
WindowParams.DynamicHints_VisibleFactor:=DynamicHints.GetVisibleFactor();
WindowParams.Window:=RW;
end;
//. reflecting or deferred reflecting
if ((WindowViewData <> nil) AND WindowViewData.IsWindowTheSameTo(WindowParams))
 then begin
  BMP:=TBitmap.Create();
  try
  BMP.HandleType:=bmDIB;
  BMP.PixelFormat:=pf24bit;
  if (NOT ((WindowViewData.Data.Size > 0) AND GetBitmapFromJPEGStream(WindowViewData.Data,BMP))) then Exit; //. ->
  //. preprocessing - grayscaling
  TMODELServerVisualizationFunctionality_Reflecting_PreprocessReflectingBMP(BMP);
  //. drawing ...
  ClippingRegion:=CreatePolygonRgn(F.ScreenNodes,F.CountScreenNodes,ALTERNATE);
  try
  ExtSelectClipRgn(pCanvas.Handle, ClippingRegion, RGN_AND);
  //. draw to canvas
  pCanvas.Draw(WindowParams.Window.Xmn,WindowParams.Window.Ymn,BMP);
  finally
  SelectClipRgn(pCanvas.Handle, 0);
  DeleteObject(ClippingRegion);
  end;
  finally
  BMP.Destroy;
  end;
  Result:=true;
  end
 else begin
  if (GetCurrentThreadID <> MainThreadID)
   then begin //. deferred reflecting
    flDeferredReflectingFound:=false;
    //. check the same deferred items
    DeferredReflectings:=TSystemTMODELServerVisualization(TypeSystem).DeferredReflectingList.LockList();
    try
    if (FReflector.State = rsDestroying) then Exit; //. ->
    for I:=0 to DeferredReflectings.Count-1 do
      if (TWindowViewData.IsWindowTheSameTo(TMODELServerVisualizationDeferredReflecting(DeferredReflectings[I]).Params,WindowParams))
       then with TMODELServerVisualizationDeferredReflecting(DeferredReflectings[I]) do begin
        flDeferredReflectingFound:=true;
        Break; //. >
        end;
    finally
    TSystemTMODELServerVisualization(TypeSystem).DeferredReflectingList.UnlockList();
    end;
    if (NOT flDeferredReflectingFound)
     then begin //. start deferred reflecting
      TMODELServerVisualizationDeferredReflecting.Create(TSystemTMODELServerVisualization(TypeSystem), idObj,pFigure.ptrObj, WindowParams, ptrCancelFlag).Resume();
      end;
    end;
  {///-
  //. reflect "not loaded" visualization
  TMODELServerVisualizationFunctionality_Reflecting_ReflectFigureWithPattern(F,TSystemTMODELServerVisualization(TypeSystem).VisualizationIsNotLoadedBMP,pCanvas);
  Result:=true;}
  end;
end;
finally
TypeSystem.Lock.Leave;
end;
except
  end;
end
;
function TMODELServerVisualizationFunctionality.ReflectOnCanvas(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean;
const
  Server_UserName = 'Anonymous';
  Server_UserPassword = 'ra3tkq';
var
  ptrItem: pointer;
  F: TFigureWinRefl;
  Xmn,Ymn,Xmx,Ymx: Extended;
  RW: TReflectionWindowStrucEx;
  RW_Scale: Extended;
  RW_VisibleFactor: integer;
  RW_DynamicHints_VisibleFactor: double;
  RW_InvisibleLayNumbersArray: TByteArray;
  WX,WY: TCrd;
  WindowParams: TWindowViewDataParams;
  {$IFNDEF EmbeddedServer}
  _ServerURL: string;
  SpaceProvider: ISpaceProvider;
  {$ENDIF}
  _Data: TByteArray;
  _WindowViewData: TWindowViewData;
  BMP: TBitmap;
  ClippingRegion: HRGN;
begin
Result:=false;
(*///? speed penalties and that may cause User_ReflectSpaceWindowOnBitmap() to freeze
try
TypeSystem.Lock.Enter;
try
ptrItem:=TSystemTMODELServerVisualization(TypeSystem).Cash.GetPtrItem(idObj);
if (ptrItem = nil) then Exit; //. ->
with TItemTMODELServerVisualizationCash(ptrItem^) do begin
if ((pFigure.CountScreenNodes > 0) AND pFigure.flagLoop AND pFigure.flagFill)
 then F:=pFigure
 else
  if (pAdditionalFigure.CountScreenNodes > 0)
   then F:=pAdditionalFigure
   else F:=nil;
if (F = nil) then Exit; //. ->
if (NOT F.Nodes_GetMinMax({out} Xmn,Ymn,Xmx,Ymx)) then Exit; //. ->
with pReflectionWindow do begin
Lock.Enter;
try
GetWindow(true,{out} RW);
RW_Scale:=_Scale;
RW_VisibleFactor:=_VisibleFactor;
RW_DynamicHints_VisibleFactor:=DynamicHints_VisibleFactor;
RW_InvisibleLayNumbersArray:=InvisibleLayNumbersArray;
finally
Lock.Leave;
end;
end;
if ((Xmx < RW.Xmn) OR (Xmn > RW.Xmx) OR (Ymx < RW.Ymn) OR (Ymn > RW.Ymx)) then Exit; //. ->
if (Xmn < RW.Xmn) then Xmn:=RW.Xmn; if (Xmx > RW.Xmx) then Xmx:=RW.Xmx;
if (Ymn < RW.Ymn) then Ymn:=RW.Ymn; if (Ymx > RW.Ymx) then Ymx:=RW.Ymx;
//. preparing work window
pReflectionWindow.ConvertScrExtendCrd2RealCrd(Xmn,Ymn,{out} WX,WY); RW.X0:=WX; RW.Y0:=WY;
pReflectionWindow.ConvertScrExtendCrd2RealCrd(Xmx,Ymn,{out} WX,WY); RW.X1:=WX; RW.Y1:=WY;
pReflectionWindow.ConvertScrExtendCrd2RealCrd(Xmx,Ymx,{out} WX,WY); RW.X2:=WX; RW.Y2:=WY;
pReflectionWindow.ConvertScrExtendCrd2RealCrd(Xmn,Ymx,{out} WX,WY); RW.X3:=WX; RW.Y3:=WY;
RW.Xmn:=Trunc(Xmn); RW.Ymn:=Trunc(Ymn);
RW.Xmx:=Trunc(Xmx); RW.Ymx:=Trunc(Ymx);
//. preparing params
WindowParams.Reflector:=nil;
WindowParams.ServerURL:=ServerURL;
WindowParams.VisibleFactor:=RW_VisibleFactor;
WindowParams.DynamicHints_VisibleFactor:=RW_DynamicHints_VisibleFactor;
WindowParams.InvisibleLayNumbersArray:=RW_InvisibleLayNumbersArray;
WindowParams.Window:=RW;
end;
finally
TypeSystem.Lock.Leave;
end;
//. reflecting
_ServerURL:='http://'+WindowParams.ServerURL+'/SpaceSOAPServer.dll';
SpaceProvider:=GetISpaceProvider(_ServerURL);
with WindowParams.Window do SpaceProvider.GetSpaceWindowBitmap(Server_UserName,Server_UserPassword, X0,Y0,X1,Y1,X2,Y2,X3,Y3, WindowParams.InvisibleLayNumbersArray, WindowParams.VisibleFactor, WindowParams.DynamicHints_VisibleFactor, Xmx-Xmn,Ymx-Ymn,{out} _Data);
//.
_WindowViewData:=TWindowViewData.Create(WindowParams,_Data);
try
BMP:=TBitmap.Create();
try
BMP.HandleType:=bmDIB;
BMP.PixelFormat:=pf24bit;
if (NOT ((_WindowViewData.Data.Size > 0) AND GetBitmapFromJPEGStream(_WindowViewData.Data,BMP))) then Exit; //. ->
//. preprocessing - grayscaling
TMODELServerVisualizationFunctionality_Reflecting_PreprocessReflectingBMP(BMP);
//. drawing ...
ClippingRegion:=CreatePolygonRgn(F.ScreenNodes,F.CountScreenNodes,ALTERNATE);
try
ExtSelectClipRgn(pCanvas.Handle, ClippingRegion, RGN_AND);
//. draw to canvas
pCanvas.Draw(WindowParams.Window.Xmn,WindowParams.Window.Ymn,BMP);
finally
SelectClipRgn(pCanvas.Handle, 0);
DeleteObject(ClippingRegion);
end;
finally
BMP.Destroy;
end;
Result:=true;
finally
_WindowViewData.Destroy;
end;
except
  end;*)
end;

function TMODELServerVisualizationFunctionality.getServerURL: string;
begin
Result:=RemotedFunctionality.getServerURL;
end;

procedure TMODELServerVisualizationFunctionality.setServerURL(Value: string);
begin
RemotedFunctionality.setServerURL(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TMODELServerVisualizationFunctionality.ContainerFilled: boolean;
begin
Result:=true;
end;



{TTAreaNotificationServerFunctionality}

Constructor TTAreaNotificationServerFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTAreaNotificationServer;
RemotedFunctionality:=TTAreaNotificationServerFunctionalityRemoted.Create(Self);
end
;
Destructor TTAreaNotificationServerFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


function TTAreaNotificationServerFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

procedure TTAreaNotificationServerFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

function TTAreaNotificationServerFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TAreaNotificationServerFunctionality.Create(Self, idComponent);
end
;

function TTAreaNotificationServerFunctionality.getName: string;
begin
Result:=nmTAreaNotificationServer;
end
;

function TTAreaNotificationServerFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TYPESDef\AreaNotificationServer\AreaNotificationServer.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

{TAreaNotificationServerFunctionality}
Constructor TAreaNotificationServerFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TAreaNotificationServerFunctionalityRemoted.Create(Self);
end;

Destructor TAreaNotificationServerFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


procedure TAreaNotificationServerFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

function TAreaNotificationServerFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TAreaNotificationServerPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;
function TAreaNotificationServerFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

procedure TAreaNotificationServerFunctionality.setName(Value: string);
begin
RemotedFunctionality.setName(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TAreaNotificationServerFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

function TAreaNotificationServerFunctionality.getInfo: string;
begin
Result:=RemotedFunctionality.getInfo;
end;

procedure TAreaNotificationServerFunctionality.setInfo(Value: string);
begin
RemotedFunctionality.setInfo(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;





{TTMeasurementObjectFunctionality}
Constructor TTMeasurementObjectFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTMeasurementObject;
RemotedFunctionality:=TTMeasurementObjectFunctionalityRemoted.Create(Self);
end
;
Destructor TTMeasurementObjectFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


function TTMeasurementObjectFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

function TTMeasurementObjectFunctionality.CreateNewInstance(const pName: string; const pDomains: string): integer;
begin
Result:=RemotedFunctionality.CreateNewInstance(pName,pDomains);
end;

procedure TTMeasurementObjectFunctionality._DestroyInstance(const idObj: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

function TTMeasurementObjectFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TMeasurementObjectFunctionality.Create(Self, idComponent);
end
;

function TTMeasurementObjectFunctionality.getName: string;
begin
Result:=nmTMeasurementObject;
end
;

function TTMeasurementObjectFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TYPESDef\MeasurementObject\MeasurementObject.bmp');
  except
    end;
  end;
Result:=FImage;
end
;
function TTMeasurementObjectFunctionality.CreateInstanceByGUID(const pGUID: string; const pName: string; const pDomains: string): integer;
begin
Result:=RemotedFunctionality.CreateInstanceByGUID(pGUID,pName,pDomains);
end;

function TTMeasurementObjectFunctionality.CheckCreateInstanceByGUID(const pGUID: string; const pName: string; const pDomains: string): integer;
begin
Result:=RemotedFunctionality.CheckCreateInstanceByGUID(pGUID,pName,pDomains);
end;

procedure TTMeasurementObjectFunctionality.GetInstanceListByNameContext(const pName: string; out List: TByteArray);
begin
RemotedFunctionality.GetInstanceListByNameContext(pName,{out} List);
end;

procedure TTMeasurementObjectFunctionality.GetInstanceDataByNameContext(const pName: string; const Version: integer; out oData: TByteArray);
begin
RemotedFunctionality.GetInstanceDataByNameContext(pName,Version,{out} oData);
end;

function TTMeasurementObjectFunctionality.GetInstanceByGUID(const pGUID: string): integer;
begin
Result:=RemotedFunctionality.GetInstanceByGUID(pGUID);
end;

function TTMeasurementObjectFunctionality.GetInstanceByGSOMeasurement(const pidGeographServerObject: integer; const pMeasurementTimeID: Double): integer;
begin
Result:=RemotedFunctionality.GetInstanceByGSOMeasurement(pidGeographServerObject,pMeasurementTimeID);
end;


{TMeasurementObjectFunctionality}
Constructor TMeasurementObjectFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TMeasurementObjectFunctionalityRemoted.Create(Self);
end;

Destructor TMeasurementObjectFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


procedure TMeasurementObjectFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

function TMeasurementObjectFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TMeasurementObjectPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end;

function TMeasurementObjectFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

procedure TMeasurementObjectFunctionality.setName(Value: string);
begin
RemotedFunctionality.setName(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TMeasurementObjectFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

function TMeasurementObjectFunctionality.getGUID: string;
begin
Result:=RemotedFunctionality.getGUID;
end;

function TMeasurementObjectFunctionality.getDomains: string;
begin
Result:=RemotedFunctionality.getDomains;
end;

procedure TMeasurementObjectFunctionality.setDomains(Value: string);
begin
RemotedFunctionality.setDomains(Value);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TMeasurementObjectFunctionality.GetParams(out oGUID: string; out oidOwner: integer; out oName: string; out oDomains: string);
begin
RemotedFunctionality.GetParams(oGUID,oidOwner,oName,oDomains);
end;

procedure TMeasurementObjectFunctionality.GSOMeasurements_GetList(out List: TByteArray);
begin
RemotedFunctionality.GSOMeasurements_GetList({out} List);
end;

procedure TMeasurementObjectFunctionality.GSOMeasurements_GetData(const Version: integer; out oData: TByteArray);
begin
RemotedFunctionality.GSOMeasurements_GetData(Version,{out} oData);
end;

procedure TMeasurementObjectFunctionality.GSOMeasurements_Item_GetParams(const idMeasurement: integer; out oTimeID: Double; out oidGeographServerObject: integer; out oDataType: integer);
begin
RemotedFunctionality.GSOMeasurements_Item_GetParams(idMeasurement,{out} oTimeID,{out} oidGeographServerObject,{out} oDataType);
end;

procedure TMeasurementObjectFunctionality.GSOMeasurements_Item_GetParams(const TimeID: Double; out oidGeographServerObject: integer; out oDataType: integer);
begin
RemotedFunctionality.GSOMeasurements_Item_GetParams1(TimeID,{out} oidGeographServerObject,{out} oDataType);
end;

procedure TMeasurementObjectFunctionality.GSOMeasurements_Item_GetData(const idMeasurement: integer; out oData: TByteArray);
begin
RemotedFunctionality.GSOMeasurements_Item_GetData(idMeasurement,{out} oData);
end;

procedure TMeasurementObjectFunctionality.GSOMeasurements_Item_GetData(const TimeID: Double; out oData: TByteArray);
begin
RemotedFunctionality.GSOMeasurements_Item_GetData1(TimeID,{out} oData);
end;







{TTTileServerVisualizationFunctionality}
Constructor TTTileServerVisualizationFunctionality.Create;
begin
Inherited Create;
TypeSystem:=SystemTTileServerVisualization;
RemotedFunctionality:=TTTileServerVisualizationFunctionalityRemoted.Create(Self);
end
;
Destructor TTTileServerVisualizationFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


function TTTileServerVisualizationFunctionality._CreateInstance: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

function TTTileServerVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTileServerVisualizationFunctionality.Create(Self, idComponent);
end
;

function TTTileServerVisualizationFunctionality.getName: string;
begin
Result:=nmTTileServerVisualization;
end
;

function TTTileServerVisualizationFunctionality.getImage: TTypeImage;
begin
if FImage = nil
 then begin
  FImage:=Inherited getImage;
  try
  FImage.LoadFromFile('TypesDef\TileServerVisualization\TileServerVisualization.bmp');
  except
    end;
  end;
Result:=FImage;
end
;

function TTTileServerVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TObjectVisualization.Create;
with Result do begin
Color:=clWhite;
Width:=0;
flLoop:=false;
AddPoint(-50,0);
AddPoint(50,0);
end;
end
;

function TTTileServerVisualizationFunctionality.CheckImportInstance(ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

{TTileServerVisualizationFunctionality}
Constructor TTileServerVisualizationFunctionality.Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer);
begin
Inherited Create(pTypeFunctionality,pidObj);
RemotedFunctionality:=TTileServerVisualizationFunctionalityRemoted.Create(Self);
end;

Destructor TTileServerVisualizationFunctionality.Destroy;
begin
RemotedFunctionality.Release;
Inherited;
end;


procedure TTileServerVisualizationFunctionality._ToClone(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

procedure TTileServerVisualizationFunctionality.CloneData(out idClone: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

procedure TTileServerVisualizationFunctionality.DestroyData;
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

function TTileServerVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
const
  MaxSegmentsForProcess = 256;
  MaxCompositionDepth = 2;
  MaxSegmentsForCompositionProcess = 64;

type
  TCompositionLevel = record
    LevelPtr: pointer;
    SegmentsMap: pointer;
    SegmentsMapSizeX,SegmentsMapSizeY: integer;
    SegmentsMapSize: integer;
    SegmentsMapLength: integer;
    Count: integer;                                           
    SW,SH: Double;
    XIndexMin,XIndexMax,YIndexMin,YIndexMax: integer;
    flAllItemsExists: boolean;
  end;

  procedure GetReflectionWindowLevelContainerIndexes(const X0,Y0: double; const X1,Y1: double; const X3,Y3: double; const pReflectionWindow: TReflectionWindow; const SW,SH: double; out XIndexMin,XIndexMax,YIndexMin,YIndexMax: integer);

    procedure ProcessPoint(X,Y: double; out dX,dY: double);
    var
      QdA2: Extended;
      X_C,X_QdC,X_A1,X_QdB2: Extended;
      Y_C,Y_QdC,Y_A1,Y_QdB2: Extended;
    begin
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
    dX:=X_A1;
    dY:=Y_A1;
    end;

  var
    dX,dY: double;
    dXMin,dYMin,dXMax,dYMax: double;
  begin
  pReflectionWindow.Lock.Enter;
  try
  ProcessPoint(pReflectionWindow.Xmn,pReflectionWindow.Ymn, dXMin,dYMin);
  dXMax:=dXMin; dYMax:=dYMin;
  ProcessPoint(pReflectionWindow.Xmx,pReflectionWindow.Ymn, dX,dY);
  if (dX < dXMin)
   then dXMin:=dX
   else
    if (dX > dXMax)
     then dXMax:=dX;
  if (dY < dYMin)
   then dYMin:=dY
   else
    if (dY > dYMax)
     then dYMax:=dY;
  ProcessPoint(pReflectionWindow.Xmx,pReflectionWindow.Ymx, dX,dY);
  if (dX < dXMin)
   then dXMin:=dX
   else
    if (dX > dXMax)
     then dXMax:=dX;
  if (dY < dYMin)
   then dYMin:=dY
   else
    if (dY > dYMax)
     then dYMax:=dY;
  ProcessPoint(pReflectionWindow.Xmn,pReflectionWindow.Ymx, dX,dY);
  if (dX < dXMin)
   then dXMin:=dX
   else
    if (dX > dXMax)
     then dXMax:=dX;
  if (dY < dYMin)
   then dYMin:=dY
   else
    if (dY > dYMax)
     then dYMax:=dY;
  finally
  pReflectionWindow.Lock.Leave;
  end;
  //.
  XIndexMin:=Trunc(dXMin/SW); XIndexMax:=Trunc(dXMax/SW);
  YIndexMin:=Trunc(dYMin/SH); YIndexMax:=Trunc(dYMax/SH);
  end;

  procedure ClearBackground(const Canvas: TCanvas; const Image: TBitmap; const pFigure: TFigureWinRefl);
  type
    PPoints = ^TPoints;
    TPoints = array[0..0] of Windows.TPoint;
  var
    LogBrush: TLogBrush;
    BH: HBrush;
    LogPen: TLogPen;
    PH: HPen;
  begin
  Canvas.Lock;
  try
  Image.Canvas.Lock;
  try
  with LogBrush do begin
  lbStyle:=BS_PATTERN;
  lbHatch:=Image.Handle; 
  lbColor:=ColorToRGB(pFigure.ColorFill);
  end;
  BH:=CreateBrushIndirect(LogBrush);
  with LogPen do begin
  lopnStyle:=PS_NULL;
  lopnWidth.X:=1;
  lopnColor:=ColorToRGB(pFigure.Color);
  end;
  PH:=CreatePenIndirect(LogPen);
  try
  SelectObject(Canvas.Handle,BH);
  SelectObject(Canvas.Handle,PH);
  try
  Windows.Polygon(Canvas.Handle,PPoints(@pFigure.ScreenNodes)^,pFigure.CountScreenNodes);
  finally
  SelectObject(Canvas.Handle,Canvas.Brush.Handle);
  SelectObject(Canvas.Handle,Canvas.Pen.Handle);
  end;
  finally
  DeleteObject(PH);
  DeleteObject(BH);
  end;
  finally
  Image.Canvas.Unlock;
  end;
  finally
  Canvas.Unlock;
  end;
  end;

  function DrawUsingGDIPlus(const CanvasHandle: THandle; const BMP: TBitmap; const SrcWidth,SrcHeight: integer): boolean;
  var
    GDIPlusGraphics: TGPGraphics;
    GDIPlusBitmap: TGPBitmap;
  begin
  GDIPlusGraphics:=TGPGraphics.Create(CanvasHandle);
  try
  GDIPlusBitmap:=TGPBitmap.Create(BMP.Handle,BMP.Palette);
  try
  Result:=(GDIPlusGraphics.DrawImage(GDIPlusBitmap, 0,0, 0,0,SrcWidth,SrcHeight, UnitPixel) = Ok)
  finally
  GDIPlusBitmap.Destroy;
  end;
  finally
  GDIPlusGraphics.Destroy;
  end;
  end;

var
  ptrItem: pointer;
  _Width,_Scale: Double;
  ptrLevel: pointer;
  cntLevel: integer;
  Level: pointer;
  LevelNumber: integer;
  X0,Y0,X1,Y1: Double;
  diffX1X0,diffY1Y0,diffX3X0,diffY3Y0: Double;
  SW,SH: Double;
  Alfa: Double;
  b: Double;
  V: Double;
  S0_X3,S0_Y3: Double;
  S1_X3,S1_Y3: Double;
  Xc,Yc: double;
  CosAlfa,SinAlfa: Double;
  MinFactor,Factor: Double;
  flAllItemsExists,flHasEmptySegment: boolean;
  ItemsTable: pointer;
  ItemsTableSize: integer;
  XIndexMin,XIndexMax,YIndexMin,YIndexMax: integer;
  _ItemsTable: pointer;
  _ItemsTableSize: integer;
  ExceptSegments: TByteArray;
  I,J,L: integer;
  DeferredReflectings: TList;
  flDeferredReflectingFound: boolean;
  CompositionLevels: TList;
  CompositionLevel: pointer;
  CompositionLevelNumber: integer;
  Composition_SummarySegmentsCount: integer;

  function ReflectLevel(const Level: pointer; const ItemsTable: pointer; const ItemsTableSize: integer; const flAllItemsExists: boolean; const SegmentsOGLTextures: TTSVSegmentsOGLTextures; const XIndexMin,XIndexMax,YIndexMin,YIndexMax: integer; const SW,SH: Double; const ReflectingBMP: TBitmap): boolean;

    function GetBitmapFromJPEGStream(const JPEGStream: TMemoryStream; const Bitmap: TBitmap): boolean;
    var
      iWidth, iHeight, iNChannels: Integer;
      iDIBChannels: integer;
      iStatus: integer;
      jcprops: TJPEG_CORE_PROPERTIES;
      DIB: TDIBSection;
    begin
    Result:=False;
    IJL_Lock.Enter;
    try
    iDIBchannels:=3;
    FillChar(jcprops,SizeOf(jcprops),0);
    iStatus:=ijlInit(@jcprops);
    if (iStatus = IJL_OK)
     then
      try
      jcprops.JPGBytes:=JPEGStream.Memory;
      jcprops.JPGSizeBytes:=JPEGStream.Size;
      iStatus:=ijlRead(@jcprops,IJL_JBUFF_READPARAMS);
      if (iStatus = IJL_OK)
       then begin
        iWidth:=jcprops.JPGWidth;
        iHeight:=jcprops.JPGHeight;
        iNChannels:=jcprops.JPGChannels;
        if (iNChannels = 3)
         then begin
          iDIBChannels:=iNChannels;
          Bitmap.Width:=iWidth;
          Bitmap.Height:=iHeight;
          FillChar(DIB,SizeOf(DIB),0);
          iStatus:=GetObject(Bitmap.Handle,SizeOf(DIB),@DIB);
          if (iStatus <> 0)
           then begin
            jcprops.DIBWidth:=iWidth;
            jcprops.DIBHeight:=-iHeight;
            jcprops.DIBChannels:=iDIBChannels;
            jcprops.DIBColor:=IJL_BGR;
            jcprops.DIBPadBytes:=((((iWidth*iDIBChannels)+3) div 4)*4)-(iWidth*iDIBChannels);
            jcprops.DIBBytes:=System.PByte(DIB.dsBm.bmBits);
            iStatus:=ijlRead(@jcprops,IJL_JBUFF_READWHOLEIMAGE);
            Result:=(iStatus >= 0);
            end;
          end;
        end;
      finally
      ijlFree(@jcprops);
      end;
    finally
    IJL_Lock.Leave;
    end;
    end;

  var
    Xmn,Ymn: integer;
    ReflectingBMPWidth,ReflectingBMPHeight: integer;
    SegmentBMP: TBitmap;
    flDrawSegment: boolean;
    LevelFolder,SegmentFileName: string;
    Segment: pointer;
    XF: XFORM;
    I: integer;
  begin
  Result:=false;
  with TLevelItemOfTTileServerVisualizationCash(Level^) do begin
  if (ItemsTable <> nil)
   then begin
    if (SegmentsOGLTextures.flEnabled AND ((GetCurrentThreadID = MainThreadID) OR (NOT flAllItemsExists OR flHasEmptySegment)))
     then with TLevelItemOfTTileServerVisualizationCash(Level^).Params do begin
      //.
      pReflectionWindow.Lock.Enter;
      try
      Xmn:=pReflectionWindow.Xmn;
      Ymn:=pReflectionWindow.Ymn;
      finally
      pReflectionWindow.Lock.Leave;
      end;
      //.
      pCanvas.Lock;
      try
      //. try using OpenGL draw method
      try
      Result:=SegmentsOGLTextures.DrawOnCanvas(
                Self,
                pCanvas,
                ItemsTable,
                ItemsTableSize,
                SegmentWidth,
                SegmentHeight,
                XIndexMin,
                YIndexMin,
                (Xc+diffX1X0*(XIndexMin/DivX)+diffX3X0*(YIndexMin/DivY))-Xmn,
                (Yc+diffY1Y0*(XIndexMin/DivX)+diffY3Y0*(YIndexMin/DivY))-Ymn,
                SW/Params.SegmentWidth,
                SH/Params.SegmentHeight,
                Alfa,
                false
      );
      except
        end;
      finally
      pCanvas.Unlock;
      end;
      end;
    //. default processing
    if (NOT Result AND (flAllItemsExists AND NOT flHasEmptySegment))
     then begin
      Result:=true;
      //. calculating bmp size
      ReflectingBMPWidth:=Trunc(Params.SegmentWidth*(XIndexMax-XIndexMin+1));
      ReflectingBMPHeight:=Trunc(Params.SegmentHeight*(YIndexMax-YIndexMin+1));
      //.
      ReflectingBMP.Canvas.Lock;
      try
      if (ReflectingBMP.Width < ReflectingBMPWidth) then ReflectingBMP.Width:=ReflectingBMPWidth;
      if (ReflectingBMP.Height < ReflectingBMPHeight) then ReflectingBMP.Height:=ReflectingBMPHeight;
      //.
      SegmentBMP:=TBitmap.Create();
      SegmentBMP.Canvas.Lock();
      try
      SegmentBMP.HandleType:=bmDIB;
      SegmentBMP.PixelFormat:=pf24bit;
      for I:=0 to (ItemsTableSize DIV SizeOf(Pointer))-1 do with TSegmentItemOfTTileServerVisualizationCash(Pointer(Pointer(Integer(ItemsTable)+I*SizeOf(Pointer))^)^).Params do begin
        flDrawSegment:=false;
        //.
        TSystemTTileServerVisualization(TypeSystem).Cash.Segment_Lock(Pointer(Pointer(Integer(ItemsTable)+I*SizeOf(Pointer))^));
        try
        if (_DATA = nil)
         then begin
          LevelFolder:=TSystemTTileServerVisualization(TypeSystem).Cash.Item_Level__GetContextFolder(idObj,TItemTTileServerVisualizationCash(ptrItem^).TileProviderID,TLevelItemOfTTileServerVisualizationCash(Level^).Params.ID);
          SegmentFileName:=LevelFolder+'\'+'X'+IntToStr(XIndex)+'Y'+IntToStr(YIndex)+'.jpg';
          _DATA:=TMemoryStream.Create();
          if (FileExists(SegmentFileName)) then _DATA.LoadFromFile(SegmentFileName);
          end;
        //.
        if (_DATA.Size = 0)
         then begin
          Result:=false;
          Break; //. >
          end;
        //. 
        if (GetBitmapFromJPEGStream(_DATA,SegmentBMP)) then flDrawSegment:=true;
        finally
        TSystemTTileServerVisualization(TypeSystem).Cash.Segment_Unlock(Pointer(Pointer(Integer(ItemsTable)+I*SizeOf(Pointer))^));
        end;
        //.
        if (flDrawSegment)
         then begin
          //. old ReflectingBMP.Canvas.StretchDraw(Rect(Trunc((XIndex-XIndexMin)*Params.SegmentWidth),Trunc((YIndex-YIndexMin)*Params.SegmentHeight),Round((XIndex-XIndexMin+1)*Params.SegmentWidth),Round((YIndex-YIndexMin+1)*Params.SegmentHeight)),SegmentBMP);
          ReflectingBMP.Canvas.Draw(Trunc((XIndex-XIndexMin)*Params.SegmentWidth),Trunc((YIndex-YIndexMin)*Params.SegmentHeight),SegmentBMP);
          end;
        //.
        if (ptrCancelFlag <> nil)
         then begin
          Sleep(0); //. exit from the current thread to alow the cancel flag to be set
          if (Boolean(ptrCancelFlag^)) then Raise EUnnecessaryExecuting.Create(''); //. =>
          end;
        end;
      finally
      SegmentBMP.Canvas.Unlock();
      SegmentBMP.Destroy;
      end;
      //.
      if ((ptrCancelFlag <> nil) AND (Boolean(ptrCancelFlag^))) then Raise EUnnecessaryExecuting.Create(''); //. =>
      //. reflecting
      if (Result)
       then begin
        pCanvas.Lock;
        try
        SetGraphicsMode(pCanvas.Handle,GM_ADVANCED);
        with TLevelItemOfTTileServerVisualizationCash(Level^).Params do begin
        pReflectionWindow.Lock.Enter;
        try
        XF.eDx:=(Xc+diffX1X0*(XIndexMin/DivX)+diffX3X0*(YIndexMin/DivY)){///- -pReflectionWindow.Xmn};
        XF.eDy:=(Yc+diffY1Y0*(XIndexMin/DivX)+diffY3Y0*(YIndexMin/DivY)){///- -pReflectionWindow.Ymn};
        finally
        pReflectionWindow.Lock.Leave;
        end;
        end;
        XF.eM11:=CosAlfa;
        XF.eM12:=SinAlfa;
        XF.eM21:=-SinAlfa;
        XF.eM22:=CosAlfa;
        SetWorldTransForm(pCanvas.Handle,XF);
        XF.eDx:=0;
        XF.eDy:=0;
        XF.eM11:=SW/Params.SegmentWidth;
        XF.eM12:=0;
        XF.eM21:=0;
        XF.eM22:=SH/Params.SegmentHeight;
        ModifyWorldTransForm(pCanvas.Handle,XF,MWT_LEFTMULTIPLY);
        try
        Result:=DrawUsingGDIPlus(pCanvas.Handle, ReflectingBMP,ReflectingBMPWidth,ReflectingBMPHeight)
        finally
        ModifyWorldTransForm(pCanvas.Handle,XF,MWT_IDENTITY);
        end;
        finally
        pCanvas.Unlock;
        end;
        end;
      finally
      ReflectingBMP.Canvas.Unlock;
      end;
      end;
    //. try draw as OpenGL if GID+ method failed
    if (NOT Result AND SegmentsOGLTextures.flEnabled)
     then with TLevelItemOfTTileServerVisualizationCash(Level^).Params do begin
      //.  
      pReflectionWindow.Lock.Enter;
      try
      Xmn:=pReflectionWindow.Xmn;
      Ymn:=pReflectionWindow.Ymn;
      finally
      pReflectionWindow.Lock.Leave;
      end;
      //.
      pCanvas.Lock;
      try
      //. try using OpenGL draw method
      try
      Result:=SegmentsOGLTextures.DrawOnCanvas(
                Self,
                pCanvas,
                ItemsTable,
                ItemsTableSize,
                SegmentWidth,
                SegmentHeight,
                XIndexMin,
                YIndexMin,
                (Xc+diffX1X0*(XIndexMin/DivX)+diffX3X0*(YIndexMin/DivY))-Xmn,
                (Yc+diffY1Y0*(XIndexMin/DivX)+diffY3Y0*(YIndexMin/DivY))-Ymn,
                SW/Params.SegmentWidth,
                SH/Params.SegmentHeight,
                Alfa,
                true
      );
      except
        end;
      finally
      pCanvas.Unlock;
      end;
      end;
    end
   else Result:=true;
  end;
  end;

  procedure Composition_OptimizeSegments(const X0,Y0: double; const X1,Y1: double; const X3,Y3: double; const pReflectionWindow: TReflectionWindow; const CompositionLevels: TList; var Composition_SegmentsCount: integer; const OptimalSegmentsCount: integer);
  type
    TSegmentItem = record
      Next: pointer;
      L: double;
      ptrptrSegment: pointer;
    end;

    procedure GetReflectionWindowCenterLevelContainerIndex(const X0,Y0: double; const X1,Y1: double; const X3,Y3: double; const pReflectionWindow: TReflectionWindow; const SW,SH: double; out XIndex,YIndex: integer);

      procedure ProcessPoint(X,Y: double; out dX,dY: double);
      var
        QdA2: Extended;
        X_C,X_QdC,X_A1,X_QdB2: Extended;
        Y_C,Y_QdC,Y_A1,Y_QdB2: Extended;
      begin
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
      dX:=X_A1;
      dY:=Y_A1;
      end;

    var
      dX,dY: double;
    begin
    pReflectionWindow.Lock.Enter;
    try
    ProcessPoint(pReflectionWindow.Xmd,pReflectionWindow.Ymd, dX,dY);
    XIndex:=Trunc(dX/SW);
    YIndex:=Trunc(dY/SH); 
    finally
    pReflectionWindow.Lock.Leave;
    end;
    end;

  var
    I,J: integer;
    RemoveDelta: integer;
    OptimizationCenterX,OptimizationCenterY: integer;
    SegmentItems: pointer;
    X,Y: integer;
    _ptrptrSegment: pointer;
    ptrSegmentItem: pointer;
    ptrptrSegmentItem: pointer;
  begin
  RemoveDelta:=Composition_SegmentsCount-OptimalSegmentsCount;
  if (RemoveDelta <= 0) then Exit; //. ->
  for I:=CompositionLevels.Count-1 downto 0 do with TCompositionLevel(CompositionLevels[I]^) do begin
    if (RemoveDelta >= Count)
     then begin //. remove all segments at this level
      for J:=0 to SegmentsMapSize-1 do
        if (Pointer(Pointer(Integer(SegmentsMap)+J*SizeOf(Pointer))^) <> nil)
         then Pointer(Pointer(Integer(SegmentsMap)+J*SizeOf(Pointer))^):=nil;
      Dec(RemoveDelta,Count);
      Count:=0;
      flAllItemsExists:=false;
      end
     else begin
      //. get center of optimization
      GetReflectionWindowCenterLevelContainerIndex(X0,Y0, X1,Y1, X3,Y3, pReflectionWindow, SW,SH, {out} OptimizationCenterX, {out} OptimizationCenterY);
      if (OptimizationCenterX < XIndexMin)
       then OptimizationCenterX:=XIndexMin
       else
        if (OptimizationCenterX > XIndexMax)
         then OptimizationCenterX:=XIndexMax;
      if (OptimizationCenterY < YIndexMin)
       then OptimizationCenterY:=YIndexMin
       else
        if (OptimizationCenterY > YIndexMax)
         then OptimizationCenterY:=YIndexMax;
      OptimizationCenterX:=OptimizationCenterX-XIndexMin;
      OptimizationCenterY:=OptimizationCenterY-YIndexMin;
      //.
      SegmentItems:=nil;
      try
      for Y:=0 to SegmentsMapSizeY-1 do
        for X:=0 to SegmentsMapSizeX-1 do begin
          _ptrptrSegment:=Pointer(Integer(SegmentsMap)+(Y*SegmentsMapSizeX+X)*SizeOf(Pointer));
          if (Pointer(_ptrptrSegment^) <> nil)
           then begin
            GetMem(ptrSegmentItem,SizeOf(TSegmentItem));
            with TSegmentItem(ptrSegmentItem^) do begin
            L:=sqr(X-OptimizationCenterX)+sqr(Y-OptimizationCenterY);
            ptrptrSegment:=_ptrptrSegment;
            end;
            //. add in L-increasing order
            ptrptrSegmentItem:=@SegmentItems;
            while ((Pointer(ptrptrSegmentItem^) <> nil) AND (TSegmentItem(Pointer(ptrptrSegmentItem^)^).L < TSegmentItem(ptrSegmentItem^).L)) do ptrptrSegmentItem:=@TSegmentItem(Pointer(ptrptrSegmentItem^)^).Next;
            TSegmentItem(ptrSegmentItem^).Next:=Pointer(ptrptrSegmentItem^);
            Pointer(ptrptrSegmentItem^):=ptrSegmentItem;
            end;
          end;
      //. remove segment elements with maximum length from optimization center
      Dec(Count,RemoveDelta);
      ptrSegmentItem:=SegmentItems;
      for J:=0 to Count-1 do ptrSegmentItem:=TSegmentItem(ptrSegmentItem^).Next;
      while (ptrSegmentItem <> nil) do begin
        Pointer(TSegmentItem(ptrSegmentItem^).ptrptrSegment^):=nil;
        ptrSegmentItem:=TSegmentItem(ptrSegmentItem^).Next;
        end;
      flAllItemsExists:=false;
      RemoveDelta:=0;
      finally
      while (SegmentItems <> nil) do begin
        ptrSegmentItem:=SegmentItems;
        SegmentItems:=TSegmentItem(ptrSegmentItem^).Next;
        FreeMem(ptrSegmentItem,SizeOf(TSegmentItem));
        end;
      end;
      end;
    if (RemoveDelta = 0) then Break; //. >
    end;
  Composition_SegmentsCount:=OptimalSegmentsCount;
  end;

  function Composition_ProcessSegment(const CompositionLevels: TList; const Level: integer; const XIndex,YIndex: integer; const OptimalLevel: integer): boolean;

    procedure EmptySegmentRecursively(const CompositionLevels: TList; const Level: integer; const XIndex,YIndex: integer);
    var
      ptrptrSegment: pointer;
      XI,YI: integer;
    begin
    with TCompositionLevel(CompositionLevels[Level]^) do begin
    ptrptrSegment:=Pointer(Integer(SegmentsMap)+((YIndex-YIndexMin)*SegmentsMapSizeX+(XIndex-XIndexMin))*SizeOf(Pointer));
    //.
    if (Pointer(ptrptrSegment^) <> nil)
     then begin
      Pointer(ptrptrSegment^):=nil;
      Dec(Count);
      flAllItemsExists:=false;
      end;
    //.
    if (Level < (CompositionLevels.Count-1))
     then with TCompositionLevel(CompositionLevels[Level+1]^) do begin
      XI:=(XIndex SHL 1)-XIndexMin; YI:=(YIndex SHL 1)-YIndexMin;
      if (((0 <= XI) AND (XI < SegmentsMapSizeX)) AND ((0 <= YI) AND (YI < SegmentsMapSizeY))) then EmptySegmentRecursively(CompositionLevels, Level+1, (XI+XIndexMin),(YI+YIndexMin));
      Inc(XI);
      if (((0 <= XI) AND (XI < SegmentsMapSizeX)) AND ((0 <= YI) AND (YI < SegmentsMapSizeY))) then EmptySegmentRecursively(CompositionLevels, Level+1, (XI+XIndexMin),(YI+YIndexMin));
      Inc(YI);
      if (((0 <= XI) AND (XI < SegmentsMapSizeX)) AND ((0 <= YI) AND (YI < SegmentsMapSizeY))) then EmptySegmentRecursively(CompositionLevels, Level+1, (XI+XIndexMin),(YI+YIndexMin));
      Dec(XI);
      if (((0 <= XI) AND (XI < SegmentsMapSizeX)) AND ((0 <= YI) AND (YI < SegmentsMapSizeY))) then EmptySegmentRecursively(CompositionLevels, Level+1, (XI+XIndexMin),(YI+YIndexMin));
      //.
      if ((ptrCancelFlag <> nil) AND (Boolean(ptrCancelFlag^))) then Raise EUnnecessaryExecuting.Create(''); //. =>
      end;
    end;
    end;

  var
    ptrptrSegment: pointer;
    flEmptySegment: boolean;
    XI,YI: integer;
    flSegment00,flSegment10,flSegment01,flSegment11: boolean;
  begin
  with TCompositionLevel(CompositionLevels[Level]^) do begin
  ptrptrSegment:=Pointer(Integer(SegmentsMap)+((YIndex-YIndexMin)*SegmentsMapSizeX+(XIndex-XIndexMin))*SizeOf(Pointer));
  //.
  Result:=(Pointer(ptrptrSegment^) <> nil);
  if (Result) then with TSegmentItemOfTTileServerVisualizationCash(Pointer(ptrptrSegment^)^).Params do Result:=(TSystemTTileServerVisualization(TypeSystem).Cash.Segment_DATAIsNotEmpty(Pointer(ptrptrSegment^)));
  //.
  if (Level < (CompositionLevels.Count-1))
   then begin
    flEmptySegment:=(Result AND (Level >= OptimalLevel));
    //.
    with TCompositionLevel(CompositionLevels[Level+1]^) do begin
    XI:=(XIndex SHL 1)-XIndexMin; YI:=(YIndex SHL 1)-YIndexMin;
    //.
    if (flEmptySegment)
     then begin
      if (((0 <= XI) AND (XI < SegmentsMapSizeX)) AND ((0 <= YI) AND (YI < SegmentsMapSizeY))) then EmptySegmentRecursively(CompositionLevels, Level+1, (XI+XIndexMin),(YI+YIndexMin));
      Inc(XI);
      if (((0 <= XI) AND (XI < SegmentsMapSizeX)) AND ((0 <= YI) AND (YI < SegmentsMapSizeY))) then EmptySegmentRecursively(CompositionLevels, Level+1, (XI+XIndexMin),(YI+YIndexMin));
      Inc(YI);
      if (((0 <= XI) AND (XI < SegmentsMapSizeX)) AND ((0 <= YI) AND (YI < SegmentsMapSizeY))) then EmptySegmentRecursively(CompositionLevels, Level+1, (XI+XIndexMin),(YI+YIndexMin));
      Dec(XI);
      if (((0 <= XI) AND (XI < SegmentsMapSizeX)) AND ((0 <= YI) AND (YI < SegmentsMapSizeY))) then EmptySegmentRecursively(CompositionLevels, Level+1, (XI+XIndexMin),(YI+YIndexMin));
      Exit; //. ->
      end
     else begin
      if (((0 <= XI) AND (XI < SegmentsMapSizeX)) AND ((0 <= YI) AND (YI < SegmentsMapSizeY)))
       then flSegment00:=Composition_ProcessSegment(CompositionLevels, Level+1, (XI+XIndexMin),(YI+YIndexMin), OptimalLevel)
       else flSegment00:=true;
      Inc(XI);
      if (((0 <= XI) AND (XI < SegmentsMapSizeX)) AND ((0 <= YI) AND (YI < SegmentsMapSizeY)))
       then flSegment10:=Composition_ProcessSegment(CompositionLevels, Level+1, (XI+XIndexMin),(YI+YIndexMin), OptimalLevel)
       else flSegment10:=true;
      Inc(YI);
      if (((0 <= XI) AND (XI < SegmentsMapSizeX)) AND ((0 <= YI) AND (YI < SegmentsMapSizeY)))
       then flSegment01:=Composition_ProcessSegment(CompositionLevels, Level+1, (XI+XIndexMin),(YI+YIndexMin), OptimalLevel)
       else flSegment01:=true;
      Dec(XI);
      if (((0 <= XI) AND (XI < SegmentsMapSizeX)) AND ((0 <= YI) AND (YI < SegmentsMapSizeY)))
       then flSegment11:=Composition_ProcessSegment(CompositionLevels, Level+1, (XI+XIndexMin),(YI+YIndexMin), OptimalLevel)
       else flSegment11:=true;
      end;
    end;
    //.
    if (flSegment00 AND flSegment10 AND flSegment01 AND flSegment11)
     then
      if (Result)
       then begin
        Pointer(ptrptrSegment^):=nil;
        Dec(Count);
        flAllItemsExists:=false;
        end
       else Result:=true;
    end;
  end;
  end;

begin
Result:=false;
with pFigure do begin
if (Width <= 0) then Exit; //. ->
X0:=Nodes[0].X;Y0:=Nodes[0].Y;
X1:=Nodes[1].X;Y1:=Nodes[1].Y;
diffX1X0:=X1-X0;
diffY1Y0:=Y1-Y0;
_Width:=Sqrt(sqr(diffX1X0)+sqr(diffY1Y0));
b:=(Width*pReflectionWindow.Scale);
pReflectionWindow.Lock.Enter;
try
_Scale:=_Width/(pReflectionWindow.Xmx-pReflectionWindow.Xmn);
finally
pReflectionWindow.Lock.Leave;
end;
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
 then begin Xc:=S0_X3; Yc:=S0_Y3 end
 else begin Xc:=S1_X3; Yc:=S1_Y3 end;
Alfa:=-Alfa;
CosAlfa:=Cos(Alfa);
SinAlfa:=Sin(Alfa);
diffX3X0:=(X0-Xc)*2;
diffY3Y0:=(Y0-Yc)*2;
end;
//.
with TSystemTTileServerVisualization(TypeSystem) do begin
Cash.Lock.BeginRead;
try
if (NOT Cash.NotRecombinatedGetItem(Self.idObj, ptrItem)) then Exit; //. ->
TItemTTileServerVisualizationCash(ptrItem^).ptrObj:=pFigure.ptrObj;
//. get working level
Level:=nil;
MinFactor:=MaxDouble;
cntLevel:=0;
ptrLevel:=TItemTTileServerVisualizationCash(ptrItem^).Levels;
while (ptrLevel <> nil) do with TLevelItemOfTTileServerVisualizationCash(ptrLevel^) do begin
  if (NOT Disabled)
   then begin
    Factor:=Sqr(Params.SegmentWidth*Params.DivX-_Width);
    if (Factor < MinFactor)
     then begin
      Level:=ptrLevel;
      LevelNumber:=cntLevel;
      MinFactor:=Factor;
      end;
    end;
  //. next level
  Inc(cntLevel);
  ptrLevel:=ptrNext;
  end;
//.
if ((ptrCancelFlag <> nil) AND (Boolean(ptrCancelFlag^))) then Raise EUnnecessaryExecuting.Create(''); //. =>
//.
if (Level <> nil)
 then begin
  TLevelItemOfTTileServerVisualizationCash(Level^).Lock.BeginRead;
  try
  if ((TLevelItemOfTTileServerVisualizationCash(Level^).Params.VisibleMinScale <> 0) AND ((_Width/(TLevelItemOfTTileServerVisualizationCash(Level^).Params.SegmentWidth*(TLevelItemOfTTileServerVisualizationCash(Level^).Params.DivX)) < TLevelItemOfTTileServerVisualizationCash(Level^).Params.VisibleMinScale)))
   then begin
    Result:=true;
    Exit; //. ->
    end;
  if ((TLevelItemOfTTileServerVisualizationCash(Level^).Params.VisibleMaxScale <> 0) AND ((_Width/(TLevelItemOfTTileServerVisualizationCash(Level^).Params.SegmentWidth*(TLevelItemOfTTileServerVisualizationCash(Level^).Params.DivX)) > TLevelItemOfTTileServerVisualizationCash(Level^).Params.VisibleMaxScale)))
   then begin
    Result:=true;
    Exit; //. ->
    end;
  //. clear background
  ClearBackground(pCanvas, LoadingImage, pAdditionalFigure);
  //.
  if ((ptrCancelFlag <> nil) AND (Boolean(ptrCancelFlag^))) then Raise EUnnecessaryExecuting.Create(''); //. =>
  //.
  with TLevelItemOfTTileServerVisualizationCash(Level^) do begin
  //. get ReflectionWindow level container indexes
  SW:=_Width/Params.DivX;
  SH:=b/Params.DivY;
  GetReflectionWindowLevelContainerIndexes(Xc,Yc, Xc+diffX1X0,Yc+diffY1Y0, Xc+diffX3X0,Yc+diffY3Y0, pReflectionWindow, SW,SH,  XIndexMin,XIndexMax,YIndexMin,YIndexMax);
  if (XIndexMin < 0) then XIndexMin:=0;
  if (XIndexMax >= Params.DivX) then XIndexMax:=Params.DivX-1;
  if (XIndexMin > XIndexMax)
   then begin //. out of bounds
    Result:=true;
    Exit; //. ->
    end;
  if (YIndexMin < 0) then YIndexMin:=0;
  if (YIndexMax >= Params.DivY) then YIndexMax:=Params.DivY-1;
  if (YIndexMin > YIndexMax)
   then begin //. out of bounds
    Result:=true;
    Exit; //. ->
    end;
  end;
  //.
  if (((XIndexMax-XIndexMin+1)*(YIndexMax-YIndexMin+1)) > MaxSegmentsForProcess)
   then begin
    Result:=false;
    Exit; //. ->
    end;
  //.
  if ((ptrCancelFlag <> nil) AND (Boolean(ptrCancelFlag^))) then Raise EUnnecessaryExecuting.Create(''); //. =>
  //.
  flAllItemsExists:=TTTileServerVisualizationCash(TSystemTTileServerVisualization(TypeSystem).Cash).Item_Level__GetVisibleSegmentsLocal(ptrItem, TItemTTileServerVisualizationCash(ptrItem^).TileProviderID, Level, XIndexMin,XIndexMax,YIndexMin,YIndexMax, (GetCurrentThreadID = MainThreadID),true, ptrCancelFlag,  ItemsTable,ItemsTableSize, ExceptSegments, @flHasEmptySegment);
  try
  if (NOT flAllItemsExists OR flHasEmptySegment)
   then begin
    if (GetCurrentThreadID <> MainThreadID)
     then with TLevelItemOfTTileServerVisualizationCash(Level^) do begin
      flDeferredReflectingFound:=false;
      //. check the same deferred items
      DeferredReflectings:=TSystemTTileServerVisualization(TypeSystem).TileServerDeferredReflectingList.LockList();
      try
      if (FReflector.State = rsDestroying) then Exit; //. ->
      for I:=0 to DeferredReflectings.Count-1 do
        if (
              (TTileServerDeferredReflecting(DeferredReflectings[I]).idObj = Self.idObj) AND
              (TTileServerDeferredReflecting(DeferredReflectings[I]).idLevel = Params.id) AND
              (NOT ((TTileServerDeferredReflecting(DeferredReflectings[I]).XIndexMax < XIndexMin) AND (TTileServerDeferredReflecting(DeferredReflectings[I]).XIndexMin > XIndexMax) AND (TTileServerDeferredReflecting(DeferredReflectings[I]).YIndexMax < YIndexMin) AND (TTileServerDeferredReflecting(DeferredReflectings[I]).YIndexMin > YIndexMax)))           )
         then with TTileServerDeferredReflecting(DeferredReflectings[I]) do begin
          ReflectorsList_Add(FReflector as TReflector);
          flUpdateIsNeeded:=true; //. need to update reflectors in deferred reflecting anyway
          flDeferredReflectingFound:=true;
          Break; //. >
          end;
      finally
      TSystemTTileServerVisualization(TypeSystem).TileServerDeferredReflectingList.UnlockList();
      end;
      //.
      if ((ptrCancelFlag <> nil) AND (Boolean(ptrCancelFlag^))) then Raise EUnnecessaryExecuting.Create(''); //. =>
      //.
      if (NOT flDeferredReflectingFound)
       then TTileServerDeferredReflecting.Create(TSystemTTileServerVisualization(TypeSystem), false, (FReflector as TReflector), idObj,pFigure.ptrObj, Params.id, XIndexMin,XIndexMax,YIndexMin,YIndexMax, ExceptSegments, ptrCancelFlag).Resume();
      end;
    //. process levels composition
    CompositionLevelNumber:=0;
    CompositionLevels:=TList.Create;
    try
    CompositionLevels.Capacity:=16;
    Composition_SummarySegmentsCount:=0;
    ptrLevel:=TItemTTileServerVisualizationCash(ptrItem^).Levels;
    while (ptrLevel <> nil) do with TLevelItemOfTTileServerVisualizationCash(ptrLevel^) do begin
      Lock.BeginRead;
      try
      //. composition new level
      GetMem(CompositionLevel,SizeOf(TCompositionLevel));
      try
      with TCompositionLevel(CompositionLevel^) do begin
      LevelPtr:=ptrLevel;
      //. get ReflectionWindow level container indexes
      SW:=_Width/Params.DivX;
      SH:=b/Params.DivY;
      GetReflectionWindowLevelContainerIndexes(Xc,Yc, Xc+diffX1X0,Yc+diffY1Y0, Xc+diffX3X0,Yc+diffY3Y0, pReflectionWindow, SW,SH,  XIndexMin,XIndexMax,YIndexMin,YIndexMax);
      if (XIndexMin < 0) then XIndexMin:=0;
      if (XIndexMax >= Params.DivX) then XIndexMax:=Params.DivX-1;
      if (YIndexMin < 0) then YIndexMin:=0;
      if (YIndexMax >= Params.DivY) then YIndexMax:=Params.DivY-1;
      SegmentsMapSizeX:=XIndexMax-XIndexMin+1;
      SegmentsMapSizeY:=YIndexMax-YIndexMin+1;
      //. creating segments map
      SegmentsMapSize:=SegmentsMapSizeX*SegmentsMapSizeY;
      SegmentsMapLength:=SegmentsMapSize*SizeOf(Pointer);
      GetMem(SegmentsMap,SegmentsMapLength);
      FillChar(SegmentsMap^,SegmentsMapLength,0);
      Count:=0;
      flAllItemsExists:=TTTileServerVisualizationCash(TSystemTTileServerVisualization(TypeSystem).Cash).Item_Level__GetVisibleSegmentsLocal(ptrItem, TItemTTileServerVisualizationCash(ptrItem^).TileProviderID, ptrLevel, XIndexMin,XIndexMax,YIndexMin,YIndexMax, (GetCurrentThreadID = MainThreadID),true, ptrCancelFlag,  _ItemsTable,_ItemsTableSize, ExceptSegments);
      if (_ItemsTable <> nil)
       then
        try
        for I:=0 to (_ItemsTableSize DIV SizeOf(Pointer))-1 do with TSegmentItemOfTTileServerVisualizationCash(Pointer(Pointer(Integer(_ItemsTable)+I*SizeOf(Pointer))^)^).Params do begin
          //.
          if ((ptrCancelFlag <> nil) AND (Boolean(ptrCancelFlag^))) then Raise EUnnecessaryExecuting.Create(''); //. =>
          //.
          if (Now > BestBeforeTime) then Break; //. >
          //.
          Pointer(Pointer(Integer(SegmentsMap)+((YIndex-YIndexMin)*SegmentsMapSizeX+(XIndex-XIndexMin))*SizeOf(Pointer))^):=Pointer(Pointer(Integer(_ItemsTable)+I*SizeOf(Pointer))^);
          Inc(Count);
          Inc(Composition_SummarySegmentsCount);
          end;
        finally
        FreeMem(_ItemsTable,_ItemsTableSize);
        end;
      end;
      except
        with TCompositionLevel(CompositionLevel^) do FreeMem(SegmentsMap,SegmentsMapLength);
        FreeMem(CompositionLevel,SizeOf(TCompositionLevel));
        //.
        Raise; //. =>
        end;
      //. add to composition
      CompositionLevels.Add(CompositionLevel);
      finally
      Lock.EndRead;
      end;
      //.
      if ((ptrCancelFlag <> nil) AND (Boolean(ptrCancelFlag^))) then Raise EUnnecessaryExecuting.Create(''); //. =>
      //.
      Inc(CompositionLevelNumber);
      if ((CompositionLevelNumber-LevelNumber) > MaxCompositionDepth) then Break; //. >
      //. next level
      ptrLevel:=ptrNext;
      end;
    //. optimize composition for performance
    Composition_OptimizeSegments(Xc,Yc, Xc+diffX1X0,Yc+diffY1Y0, Xc+diffX3X0,Yc+diffY3Y0, pReflectionWindow, CompositionLevels,{ref}Composition_SummarySegmentsCount,MaxSegmentsForCompositionProcess);
    //. reform composition
    if (CompositionLevels.Count > 1)
     then with TCompositionLevel(CompositionLevels[0]^) do
      for I:=YIndexMin to YIndexMax do
        for J:=XIndexMin to XIndexMax do begin
          Composition_ProcessSegment(CompositionLevels, 0, J,I, LevelNumber);
          //.
          if ((ptrCancelFlag <> nil) AND (Boolean(ptrCancelFlag^))) then Raise EUnnecessaryExecuting.Create(''); //. =>
          end;
    //. reflect composition
    for L:=0 to CompositionLevels.Count-1 do with TCompositionLevel(CompositionLevels[L]^) do
      if (Count > 0)
       then begin
        _ItemsTableSize:=Count*SizeOf(Pointer);
        GetMem(_ItemsTable,_ItemsTableSize);
        try
        J:=0;
        for I:=0 to SegmentsMapSize-1 do
          if (Pointer(Pointer(Integer(SegmentsMap)+I*SizeOf(Pointer))^) <> nil)
           then begin
            Pointer(Pointer(Integer(_ItemsTable)+J*SizeOf(Pointer))^):=Pointer(Pointer(Integer(SegmentsMap)+I*SizeOf(Pointer))^);
            Inc(J);
            end;
        //. reflect composition level
        TLevelItemOfTTileServerVisualizationCash(LevelPtr^).Lock.BeginRead;
        try
        Result:=ReflectLevel(LevelPtr, _ItemsTable,_ItemsTableSize,flAllItemsExists, SegmentsOGLTextures, XIndexMin,XIndexMax,YIndexMin,YIndexMax, SW,SH, ReflectingBMP) OR Result;
        finally
        TLevelItemOfTTileServerVisualizationCash(LevelPtr^).Lock.EndRead;
        end;
        finally
        FreeMem(_ItemsTable,_ItemsTableSize);
        end;
        //.
        if ((ptrCancelFlag <> nil) AND (Boolean(ptrCancelFlag^))) then Raise EUnnecessaryExecuting.Create(''); //. =>
        end;
    if (Result) then Exit; //. ->
    finally
    for L:=0 to CompositionLevels.Count-1 do begin
      CompositionLevel:=CompositionLevels[L];
      with TCompositionLevel(CompositionLevel^) do FreeMem(SegmentsMap,SegmentsMapLength);
      FreeMem(CompositionLevel,SizeOf(TCompositionLevel));
      end;
    CompositionLevels.Destroy;
    end;
    end;
  //. reflecting ...
  Result:=ReflectLevel(Level, ItemsTable,ItemsTableSize,flAllItemsExists, SegmentsOGLTextures, XIndexMin,XIndexMax,YIndexMin,YIndexMax, SW,SH, ReflectingBMP);
  finally
  if (ItemsTable <> nil) then FreeMem(ItemsTable,ItemsTableSize);
  end;
  finally
  TLevelItemOfTTileServerVisualizationCash(Level^).Lock.EndRead;
  end;
  end
 else Exit; //. ->
finally
Cash.Lock.EndRead;
end;
end;
end
;

function TTileServerVisualizationFunctionality.ReflectOnCanvas(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean;
const
  MaxSegmentsForProcess = 256;  

  procedure GetReflectionWindowLevelContainerIndexes(const X0,Y0: double; const X1,Y1: double; const X3,Y3: double; const pReflectionWindow: TReflectionWindow; const SW,SH: double; out XIndexMin,XIndexMax,YIndexMin,YIndexMax: integer);

    procedure ProcessPoint(X,Y: double; out dX,dY: double);
    var
      QdA2: Extended;
      X_C,X_QdC,X_A1,X_QdB2: Extended;
      Y_C,Y_QdC,Y_A1,Y_QdB2: Extended;
    begin
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
    dX:=X_A1;
    dY:=Y_A1;
    end;

  var
    dX,dY: double;
    dXMin,dYMin,dXMax,dYMax: double;
  begin
  ProcessPoint(pReflectionWindow.Xmn,pReflectionWindow.Ymn, dXMin,dYMin);
  dXMax:=dXMin; dYMax:=dYMin;
  ProcessPoint(pReflectionWindow.Xmx,pReflectionWindow.Ymn, dX,dY);
  if (dX < dXMin)
   then dXMin:=dX
   else
    if (dX > dXMax)
     then dXMax:=dX;
  if (dY < dYMin)
   then dYMin:=dY
   else
    if (dY > dYMax)
     then dYMax:=dY;
  ProcessPoint(pReflectionWindow.Xmx,pReflectionWindow.Ymx, dX,dY);
  if (dX < dXMin)
   then dXMin:=dX
   else
    if (dX > dXMax)
     then dXMax:=dX;
  if (dY < dYMin)
   then dYMin:=dY
   else
    if (dY > dYMax)
     then dYMax:=dY;
  ProcessPoint(pReflectionWindow.Xmn,pReflectionWindow.Ymx, dX,dY);
  if (dX < dXMin)
   then dXMin:=dX
   else
    if (dX > dXMax)
     then dXMax:=dX;
  if (dY < dYMin)
   then dYMin:=dY
   else
    if (dY > dYMax)
     then dYMax:=dY;
  //.
  XIndexMin:=Trunc(dXMin/SW); XIndexMax:=Trunc(dXMax/SW);
  YIndexMin:=Trunc(dYMin/SH); YIndexMax:=Trunc(dYMax/SH);
  end;

  procedure ClearBackground(const Canvas: TCanvas; const Image: TBitmap; const pFigure: TFigureWinRefl);
  type
    PPoints = ^TPoints;
    TPoints = array[0..0] of Windows.TPoint;
  var
    LogBrush: TLogBrush;
    BH: HBrush;
    LogPen: TLogPen;
    PH: HPen;
  begin
  Canvas.Lock;
  try
  Image.Canvas.Lock;
  try
  with LogBrush do begin
  lbStyle:=BS_PATTERN;
  lbHatch:=Image.Handle; 
  lbColor:=ColorToRGB(pFigure.ColorFill);
  end;
  BH:=CreateBrushIndirect(LogBrush);
  with LogPen do begin
  lopnStyle:=PS_NULL;
  lopnWidth.X:=1;
  lopnColor:=ColorToRGB(pFigure.Color);
  end;
  PH:=CreatePenIndirect(LogPen);
  try
  SelectObject(Canvas.Handle,BH);
  SelectObject(Canvas.Handle,PH);
  try
  Windows.Polygon(Canvas.Handle,PPoints(@pFigure.ScreenNodes)^,pFigure.CountScreenNodes);
  finally
  SelectObject(Canvas.Handle,Canvas.Brush.Handle);
  SelectObject(Canvas.Handle,Canvas.Pen.Handle);
  end;
  finally
  DeleteObject(PH);
  DeleteObject(BH);
  end;
  finally
  Image.Canvas.Unlock;
  end;
  finally
  Canvas.Unlock;
  end;
  end;

  function DrawUsingGDIPlus(const CanvasHandle: THandle; const BMP: TBitmap; const SrcWidth,SrcHeight: integer): boolean;
  var
    GDIPlusGraphics: TGPGraphics;
    GDIPlusBitmap: TGPBitmap;
  begin
  GDIPlusGraphics:=TGPGraphics.Create(CanvasHandle);
  try
  GDIPlusBitmap:=TGPBitmap.Create(BMP.Handle,BMP.Palette);
  try
  Result:=(GDIPlusGraphics.DrawImage(GDIPlusBitmap, 0,0, 0,0,SrcWidth,SrcHeight, UnitPixel) = Ok)
  finally
  GDIPlusBitmap.Destroy;
  end;
  finally
  GDIPlusGraphics.Destroy;
  end;
  end;

var
  ptrItem: pointer;
  CurrentTileProviderID: integer;
  UserDataVersion: Word;
  flLaysAreIndependent: boolean;
  _Width,_Scale: Double;
  ptrLevel: pointer;
  cntLevel: integer;
  Level: pointer;
  LevelNumber: integer;
  X0,Y0,X1,Y1: Double;
  diffX1X0,diffY1Y0,diffX3X0,diffY3Y0: Double;
  SW,SH: Double;
  Alfa: Double;
  b: Double;
  V: Double;
  S0_X3,S0_Y3: Double;
  S1_X3,S1_Y3: Double;
  Xc,Yc: double;
  CosAlfa,SinAlfa: Double;
  MinFactor,Factor: Double;
  flAllItemsExists,flHasEmptySegment: boolean;
  ItemsTable: pointer;
  ItemsTableSize: integer;
  XIndexMin,XIndexMax,YIndexMin,YIndexMax: integer;
  _ItemsTable: pointer;
  _ItemsTableSize: integer;
  ExceptSegments: TByteArray;
  I,J,L: integer;
  DeferredReflecting: TTileServerDeferredReflecting;

  function ReflectLevel(const Level: pointer; const ItemsTable: pointer; const ItemsTableSize: integer; const XIndexMin,XIndexMax,YIndexMin,YIndexMax: integer; const SW,SH: Double; const ReflectingBMP: TBitmap): boolean;

    function GetBitmapFromJPEGStream(const JPEGStream: TMemoryStream; const Bitmap: TBitmap): boolean;
    var
      iWidth, iHeight, iNChannels: Integer;
      iDIBChannels: integer;
      iStatus: integer;
      jcprops: TJPEG_CORE_PROPERTIES;
      DIB: TDIBSection;
    begin
    Result:=False;
    IJL_Lock.Enter;
    try
    iDIBchannels:=3;
    FillChar(jcprops,SizeOf(jcprops),0);
    iStatus:=ijlInit(@jcprops);
    if (iStatus = IJL_OK)
     then
      try
      jcprops.JPGBytes:=JPEGStream.Memory;
      jcprops.JPGSizeBytes:=JPEGStream.Size;
      iStatus:=ijlRead(@jcprops,IJL_JBUFF_READPARAMS);
      if (iStatus = IJL_OK)
       then begin
        iWidth:=jcprops.JPGWidth;
        iHeight:=jcprops.JPGHeight;
        iNChannels:=jcprops.JPGChannels;
        if (iNChannels = 3)
         then begin
          iDIBChannels:=iNChannels;
          Bitmap.Width:=iWidth;
          Bitmap.Height:=iHeight;
          FillChar(DIB,SizeOf(DIB),0);
          iStatus:=GetObject(Bitmap.Handle,SizeOf(DIB),@DIB);
          if (iStatus <> 0)
           then begin
            jcprops.DIBWidth:=iWidth;
            jcprops.DIBHeight:=-iHeight;
            jcprops.DIBChannels:=iDIBChannels;
            jcprops.DIBColor:=IJL_BGR;
            jcprops.DIBPadBytes:=((((iWidth*iDIBChannels)+3) div 4)*4)-(iWidth*iDIBChannels);
            jcprops.DIBBytes:=System.PByte(DIB.dsBm.bmBits);
            iStatus:=ijlRead(@jcprops,IJL_JBUFF_READWHOLEIMAGE);
            Result:=(iStatus >= 0);
            end;
          end;
        end;
      finally
      ijlFree(@jcprops);
      end;
    finally
    IJL_Lock.Leave;
    end;
    end;

  var
    Xmn,Ymn: integer;
    ReflectingBMPWidth,ReflectingBMPHeight: integer;
    _ReflectingBMP: TBitmap;
    SegmentBMP: TBitmap;
    flDrawSegment: boolean;
    LevelFolder,SegmentFileName: string;
    Segment: pointer;
    XF: XFORM;
    I: integer;
  begin
  Result:=false;
  with TLevelItemOfTTileServerVisualizationCash(Level^) do begin
  if (ItemsTable <> nil)
   then begin
    //. default processing
    Result:=true;
    //. calculating bmp size
    ReflectingBMPWidth:=Trunc(Params.SegmentWidth*(XIndexMax-XIndexMin+1));
    ReflectingBMPHeight:=Trunc(Params.SegmentHeight*(YIndexMax-YIndexMin+1));
    //.
    _ReflectingBMP:=TBitmap.Create();
    _ReflectingBMP.Canvas.Lock();
    try
    _ReflectingBMP.HandleType:=bmDIB;
    _ReflectingBMP.PixelFormat:=pf24bit;
    _ReflectingBMP.Width:=ReflectingBMPWidth;
    _ReflectingBMP.Height:=ReflectingBMPHeight;
    //.
    SegmentBMP:=TBitmap.Create();
    SegmentBMP.Canvas.Lock();
    try
    SegmentBMP.HandleType:=bmDIB;
    SegmentBMP.PixelFormat:=pf24bit;
    for I:=0 to (ItemsTableSize DIV SizeOf(Pointer))-1 do with TSegmentItemOfTTileServerVisualizationCash(Pointer(Pointer(Integer(ItemsTable)+I*SizeOf(Pointer))^)^).Params do begin
      flDrawSegment:=false;
      //.
      TSystemTTileServerVisualization(TypeSystem).Cash.Segment_Lock(Pointer(Pointer(Integer(ItemsTable)+I*SizeOf(Pointer))^));
      try
      if (_DATA = nil)
       then begin
        LevelFolder:=TSystemTTileServerVisualization(TypeSystem).Cash.Item_Level__GetContextFolder(idObj,CurrentTileProviderID,TLevelItemOfTTileServerVisualizationCash(Level^).Params.ID);
        SegmentFileName:=LevelFolder+'\'+'X'+IntToStr(XIndex)+'Y'+IntToStr(YIndex)+'.jpg';
        _DATA:=TMemoryStream.Create();
        if (FileExists(SegmentFileName)) then _DATA.LoadFromFile(SegmentFileName);
        end;
      //.
      if (_DATA.Size = 0)
       then begin
        Result:=false;
        Break; //. >
        end;
      //.
      if (GetBitmapFromJPEGStream(_DATA,SegmentBMP)) then flDrawSegment:=true;
      finally
      TSystemTTileServerVisualization(TypeSystem).Cash.Segment_Unlock(Pointer(Pointer(Integer(ItemsTable)+I*SizeOf(Pointer))^));
      end;
      //.
      if (flDrawSegment)
       then begin
        //. old ReflectingBMP.Canvas.StretchDraw(Rect(Trunc((XIndex-XIndexMin)*Params.SegmentWidth),Trunc((YIndex-YIndexMin)*Params.SegmentHeight),Round((XIndex-XIndexMin+1)*Params.SegmentWidth),Round((YIndex-YIndexMin+1)*Params.SegmentHeight)),SegmentBMP);
        _ReflectingBMP.Canvas.Draw(Trunc((XIndex-XIndexMin)*Params.SegmentWidth),Trunc((YIndex-YIndexMin)*Params.SegmentHeight),SegmentBMP);
        end;
      end;
    finally
    SegmentBMP.Canvas.Unlock();
    SegmentBMP.Destroy();
    end;
    //. reflecting
    if (Result)
     then begin
      pCanvas.Lock;
      try
      SetGraphicsMode(pCanvas.Handle,GM_ADVANCED);
      with TLevelItemOfTTileServerVisualizationCash(Level^).Params do begin
      pReflectionWindow.Lock.Enter;
      try
      XF.eDx:=(Xc+diffX1X0*(XIndexMin/DivX)+diffX3X0*(YIndexMin/DivY)){///- -pReflectionWindow.Xmn};
      XF.eDy:=(Yc+diffY1Y0*(XIndexMin/DivX)+diffY3Y0*(YIndexMin/DivY)){///- -pReflectionWindow.Ymn};
      finally
      pReflectionWindow.Lock.Leave;
      end;
      end;
      XF.eM11:=CosAlfa;
      XF.eM12:=SinAlfa;
      XF.eM21:=-SinAlfa;
      XF.eM22:=CosAlfa;
      SetWorldTransForm(pCanvas.Handle,XF);
      XF.eDx:=0;
      XF.eDy:=0;
      XF.eM11:=SW/Params.SegmentWidth;
      XF.eM12:=0;
      XF.eM21:=0;
      XF.eM22:=SH/Params.SegmentHeight;
      ModifyWorldTransForm(pCanvas.Handle,XF,MWT_LEFTMULTIPLY);
      try
      Result:=DrawUsingGDIPlus(pCanvas.Handle, _ReflectingBMP,ReflectingBMPWidth,ReflectingBMPHeight)
      finally
      ModifyWorldTransForm(pCanvas.Handle,XF,MWT_IDENTITY);
      end;
      finally
      pCanvas.Unlock;
      end;
      end;
    finally
    _ReflectingBMP.Canvas.Unlock();
    _ReflectingBMP.Destroy();
    end;
    end
   else Result:=true;
  end;
  end;

  procedure SupplyLevelWithSegments(const ptrLevel: pointer); //. same as for TTileServerDeferredReflecting.Execute
  const
    SegmentsGeneration_MaxDepth = 2;
  var
    flAllItemsExists: boolean;
    BA: TByteArray;
    IL,ReceivedSegmentsList: TList;
  begin
  //. try to restore segments from saved context
  try
  flAllItemsExists:=TSystemTTileServerVisualization(TypeSystem).Cash.Item_Level__RestoreSegmentsLocal(ptrItem, CurrentTileProviderID, ptrLevel, XIndexMin,XIndexMax,YIndexMin,YIndexMax, nil,  IL, ExceptSegments);
  except
    On E: Exception do begin
      EventLog.WriteMinorEvent('TTileServerVisualizationFunctionality.ReflectOnCanvas.SupplyLevelWithSegments','Error of RestoreSegmentsLocal() of TileServer visualization (ID: '+IntToStr(Self.idObj)+')',E.Message);
      Raise; //. =>
      end;
    end;
  if (IL <> nil) then IL.Destroy;
  //.
  if (NOT flAllItemsExists)
   then begin
    if (NOT flLaysAreIndependent)
     then begin
      //. try to generate segments from down levels
      try
      flAllItemsExists:=TSystemTTileServerVisualization(TypeSystem).Cash.Item_Level__GenerateSegmentsLocal(ptrItem, CurrentTileProviderID, ptrLevel, XIndexMin,XIndexMax,YIndexMin,YIndexMax, SegmentsGeneration_MaxDepth, nil,  IL, ExceptSegments);
      except
        On E: Exception do begin
          EventLog.WriteMinorEvent('TTileServerVisualizationFunctionality.ReflectOnCanvas.SupplyLevelWithSegments','Error of GenerateSegmentsLocal() of TileServer visualization (ID: '+IntToStr(idObj)+')',E.Message);
          Raise; //. =>
          end;
        end;
      if (IL <> nil) then IL.Destroy;
      end;
    //. segments getting from remote server
    if (NOT flAllItemsExists)
     then begin
      with TTileServerVisualizationFunctionality(TComponentFunctionality_Create(idTTileServerVisualization,TItemTTileServerVisualizationCash(ptrItem^).idObj)) do
      try
      try
      Level_GetSegments(CurrentTileProviderID, TLevelItemOfTTileServerVisualizationCash(ptrLevel^).Params.id, XIndexMin,XIndexMax,YIndexMin,YIndexMax, ExceptSegments, BA);
      except
        On E: Exception do begin
          EventLog.WriteMinorEvent('TTileServerVisualizationFunctionality.ReflectOnCanvas.SupplyLevelWithSegments','Error of Level_GetSegments(idLevel = '+IntToStr(TLevelItemOfTTileServerVisualizationCash(ptrLevel^).Params.id)+') of TileServer visualization (ID: '+IntToStr(idObj)+')',E.Message);
          Raise; //. =>
          end;
        end;
      finally
      Release;
      end; 
      //.
      ReceivedSegmentsList:=TList.Create;
      try
      try
      TTileServerVisualizationCashItemLevel_PrepareSegmentsFromByteArray(TSystemTTileServerVisualization(TypeSystem), Self.idObj, CurrentTileProviderID, ptrLevel,BA, ReceivedSegmentsList);
      except
        On E: Exception do begin
          EventLog.WriteMinorEvent('TTileServerVisualizationFunctionality.ReflectOnCanvas.SupplyLevelWithSegments','Error of PrepareSegmentsFromByteArray(idLevel = '+IntToStr(TLevelItemOfTTileServerVisualizationCash(ptrLevel^).Params.id)+') of TileServer visualization (ID: '+IntToStr(idObj)+')',E.Message);
          Raise; //. =>
          end;
        end;
      if (ReceivedSegmentsList.Count > 0)
       then begin
        //. update OpenGL segments textures
        try
        if (TSystemTTileServerVisualization(TypeSystem).SegmentsOGLTextures.flEnabled)
         then TSystemTTileServerVisualization(TypeSystem).SegmentsOGLTextures.GenerateSegmentItemsTextures(ReceivedSegmentsList);
        except
          On E: Exception do begin
            EventLog.WriteMinorEvent('TTileServerVisualizationFunctionality.ReflectOnCanvas.SupplyLevelWithSegments','Error of GenerateSegmentItemsTextures() of TileServer visualization (ID: '+IntToStr(idObj)+')',E.Message);
            Raise; //. =>
            end;
          end;
        end;
      finally
      ReceivedSegmentsList.Destroy;
      end;
      if (true) ///? (NOT flLaysAreIndependent)
       then begin
        //. empty segments degeneration
        try
        if (TSystemTTileServerVisualization(TypeSystem).Cash.Item_Level__DegenerateSegmentsLocal(ptrItem, CurrentTileProviderID, ptrLevel, XIndexMin,XIndexMax,YIndexMin,YIndexMax, nil,  IL))
         then IL.Destroy;
        except
          On E: Exception do begin
            EventLog.WriteMinorEvent('TTileServerVisualizationFunctionality.ReflectOnCanvas.SupplyLevelWithSegments','Error of DegenerateSegmentsLocal(idLevel = '+IntToStr(TLevelItemOfTTileServerVisualizationCash(ptrLevel^).Params.id)+') of TileServer visualization (ID: '+IntToStr(idObj)+')',E.Message);
            Raise; //. =>
            end;
          end;
        end;
      end;
    end;
  end;

begin
Result:=false;
with pFigure do begin
if (Width <= 0) then Exit; //. ->
X0:=Nodes[0].X;Y0:=Nodes[0].Y;
X1:=Nodes[1].X;Y1:=Nodes[1].Y;
diffX1X0:=X1-X0;
diffY1Y0:=Y1-Y0;
_Width:=Sqrt(sqr(diffX1X0)+sqr(diffY1Y0));
b:=(Width*pReflectionWindow.Scale);
pReflectionWindow.Lock.Enter;
try
_Scale:=_Width/(pReflectionWindow.Xmx-pReflectionWindow.Xmn);
finally
pReflectionWindow.Lock.Leave;
end;
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
 then begin Xc:=S0_X3; Yc:=S0_Y3 end
 else begin Xc:=S1_X3; Yc:=S1_Y3 end;
Alfa:=-Alfa;
CosAlfa:=Cos(Alfa);
SinAlfa:=Sin(Alfa);
diffX3X0:=(X0-Xc)*2;
diffY3Y0:=(Y0-Yc)*2;
end;
//.
with TSystemTTileServerVisualization(TypeSystem) do begin
Cash.Lock.BeginRead();
try
if (NOT Cash.NotRecombinatedGetItem(Self.idObj, ptrItem)) then Exit; //. ->
TItemTTileServerVisualizationCash(ptrItem^).ptrObj:=pFigure.ptrObj;
//.
CurrentTileProviderID:=TItemTTileServerVisualizationCash(ptrItem^).TileProviderID;
if (Length(UserData) > 0)
 then begin
  UserDataVersion:=Word(Pointer(@UserData[0])^);
  case UserDataVersion of
  1: CurrentTileProviderID:=Integer(Pointer(@UserData[2])^);
  end;
  end;
if (CurrentTileProviderID <> TItemTTileServerVisualizationCash(ptrItem^).TileProviderID)
 then begin
  Cash.Lock.BeginWrite();
  try
  if (NOT Cash.Item_SetTileProviderID(ptrItem,CurrentTileProviderID)) then Raise Exception.Create('unknown Tile-Server Provider, ID: '+IntToStr(CurrentTileProviderID)); //. =>
  finally
  Cash.Lock.EndWrite();
  end;
  end;
//.
flLaysAreIndependent:=((TItemTTileServerVisualizationCash(ptrItem^).ServerParsedData <> nil) AND TItemTTileServerVisualizationCash(ptrItem^).ServerParsedData.TileProviders[TItemTTileServerVisualizationCash(ptrItem^).ServerParsedData.TileProviders_ItemIndex(CurrentTileProviderID)].flIndependentLevels);
//. get working level
Level:=nil;
MinFactor:=MaxDouble;
cntLevel:=0;
ptrLevel:=TItemTTileServerVisualizationCash(ptrItem^).Levels;
while (ptrLevel <> nil) do with TLevelItemOfTTileServerVisualizationCash(ptrLevel^) do begin
  if (NOT Disabled)
   then begin
    Factor:=Sqr(Params.SegmentWidth*Params.DivX-_Width);
    if (Factor < MinFactor)
     then begin
      Level:=ptrLevel;
      LevelNumber:=cntLevel;
      MinFactor:=Factor;
      end;
    end;
  //. next level
  Inc(cntLevel);
  ptrLevel:=ptrNext;
  end;
//.
if (Level <> nil)
 then begin
  TLevelItemOfTTileServerVisualizationCash(Level^).Lock.BeginRead;
  try
  if ((TLevelItemOfTTileServerVisualizationCash(Level^).Params.VisibleMinScale <> 0) AND ((_Width/(TLevelItemOfTTileServerVisualizationCash(Level^).Params.SegmentWidth*(TLevelItemOfTTileServerVisualizationCash(Level^).Params.DivX)) < TLevelItemOfTTileServerVisualizationCash(Level^).Params.VisibleMinScale)))
   then begin
    Result:=true;
    Exit; //. ->
    end;
  if ((TLevelItemOfTTileServerVisualizationCash(Level^).Params.VisibleMaxScale <> 0) AND ((_Width/(TLevelItemOfTTileServerVisualizationCash(Level^).Params.SegmentWidth*(TLevelItemOfTTileServerVisualizationCash(Level^).Params.DivX)) > TLevelItemOfTTileServerVisualizationCash(Level^).Params.VisibleMaxScale)))
   then begin
    Result:=true;
    Exit; //. ->
    end;
  //. clear background
  ClearBackground(pCanvas, LoadingImage, pAdditionalFigure);
  //.
  with TLevelItemOfTTileServerVisualizationCash(Level^) do begin
  //. get ReflectionWindow level container indexes
  SW:=_Width/Params.DivX;
  SH:=b/Params.DivY;
  GetReflectionWindowLevelContainerIndexes(Xc,Yc, Xc+diffX1X0,Yc+diffY1Y0, Xc+diffX3X0,Yc+diffY3Y0, pReflectionWindow, SW,SH,  XIndexMin,XIndexMax,YIndexMin,YIndexMax);
  if (XIndexMin < 0) then XIndexMin:=0;
  if (XIndexMax >= Params.DivX) then XIndexMax:=Params.DivX-1;
  if (XIndexMin > XIndexMax)
   then begin //. out of bounds
    Result:=true;
    Exit; //. ->
    end;
  if (YIndexMin < 0) then YIndexMin:=0;
  if (YIndexMax >= Params.DivY) then YIndexMax:=Params.DivY-1;
  if (YIndexMin > YIndexMax)
   then begin //. out of bounds
    Result:=true;
    Exit; //. ->
    end;
  end;
  //.
  if (((XIndexMax-XIndexMin+1)*(YIndexMax-YIndexMin+1)) > MaxSegmentsForProcess)
   then begin
    Result:=false;
    Exit; //. ->
    end;
  //.
  flAllItemsExists:=TTTileServerVisualizationCash(TSystemTTileServerVisualization(TypeSystem).Cash).Item_Level__GetVisibleSegmentsLocal(ptrItem, CurrentTileProviderID, Level, XIndexMin,XIndexMax,YIndexMin,YIndexMax, false, true, nil,  ItemsTable,ItemsTableSize, ExceptSegments, @flHasEmptySegment);
  try
  if (NOT flAllItemsExists OR flHasEmptySegment)
   then SupplyLevelWithSegments(Level)
   else Result:=ReflectLevel(Level, ItemsTable,ItemsTableSize, XIndexMin,XIndexMax,YIndexMin,YIndexMax, SW,SH, ReflectingBMP);
  finally
  if (ItemsTable <> nil) then FreeMem(ItemsTable,ItemsTableSize);
  end;
  if (NOT Result)
   then begin
    flAllItemsExists:=TTTileServerVisualizationCash(TSystemTTileServerVisualization(TypeSystem).Cash).Item_Level__GetVisibleSegmentsLocal(ptrItem, CurrentTileProviderID, Level, XIndexMin,XIndexMax,YIndexMin,YIndexMax, false, true, nil,  ItemsTable,ItemsTableSize, ExceptSegments, @flHasEmptySegment);
    try
    if (flAllItemsExists AND NOT flHasEmptySegment)
     then Result:=ReflectLevel(Level, ItemsTable,ItemsTableSize, XIndexMin,XIndexMax,YIndexMin,YIndexMax, SW,SH, ReflectingBMP);
    finally
    if (ItemsTable <> nil) then FreeMem(ItemsTable,ItemsTableSize);
    end;
    end;
  finally
  TLevelItemOfTTileServerVisualizationCash(Level^).Lock.EndRead;
  end;
  end
 else Exit; //. ->
finally
Cash.Lock.EndRead();
end;
end;
end
;

function TTileServerVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=nil;
Result:=TTileServerVisualizationPanelProps.Create(Self, pflReadOnly, pidOwnerObjectProp,TSpaceObjPanelsProps(pOwnerPanelsProps),pProxyObject);
end
;

function TTileServerVisualizationFunctionality.DATASize: integer;
begin
Result:=Inherited DATASize;
end
;

procedure TTileServerVisualizationFunctionality.SetProportion(const Value: double);
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

function TTileServerVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=RemotedFunctionality.GetOwner(idTOwner,idOwner);
end;

function TTileServerVisualizationFunctionality.getName: string;
begin
Result:=RemotedFunctionality.getName;
end;

function TTileServerVisualizationFunctionality.getHint: string;
begin
Result:=RemotedFunctionality.getHint;
end;

procedure TTileServerVisualizationFunctionality.GetParams(out oWidth: integer; out oHeight: integer);
begin
RemotedFunctionality.GetParams(oWidth,oHeight);
end;

procedure TTileServerVisualizationFunctionality.GetParams(out oServerType: integer; out oServerURL: string; out oServerData: TByteArray; out oTileProviderID: integer; out oWidth: integer; out oHeight: integer); 
var
  UPTPID: integer;
begin
RemotedFunctionality.GetParams1({out} oServerType,oServerURL,oServerData,oTileProviderID,oWidth,oHeight);
if (UserData_GetTileProviderID({out} UPTPID)) then oTileProviderID:=UPTPID;
end;

procedure TTileServerVisualizationFunctionality.SetParams(const pWidth: integer; const pHeight: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

procedure TTileServerVisualizationFunctionality.SetServerType(const Value: integer);
begin
RemotedFunctionality.SetServerType(Value);
//. update local TypesSystem and representations
Space.StayUpToDate();
end;

procedure TTileServerVisualizationFunctionality.SetServerURL(const Value: string);
begin
RemotedFunctionality.SetServerURL(Value);
//. update local TypesSystem and representations
Space.StayUpToDate();
end;

procedure TTileServerVisualizationFunctionality.SetServerData(const pData: TMemoryStream);
var
  BA: TByteArray;
begin
ByteArray_PrepareFromStream(BA,pData);
RemotedFunctionality.SetServerData(BA);
//. update local TypesSystem and representations
Space.StayUpToDate();
end;

procedure TTileServerVisualizationFunctionality.SetServerData(const Data: TByteArray);
begin
RemotedFunctionality.SetServerData(Data);
//. update local TypesSystem and representations
Space.StayUpToDate();
end;

procedure TTileServerVisualizationFunctionality.Clear;
begin
Raise Exception.Create(SNotSupported); //. =>
end
;
procedure TTileServerVisualizationFunctionality.GenerateFromImage(DATAStream: TByteArray);
begin
RemotedFunctionality.GenerateFromImage(DATAStream);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TTileServerVisualizationFunctionality.GetLevelsInfo(out Info: TByteArray);
begin
RemotedFunctionality.GetLevelsInfo(Info);
end;

procedure TTileServerVisualizationFunctionality.GetLevelsInfoLocally(out Info: TByteArray);
//. ! do not use under TSystemTDetailedPictureVisualization(TypeSystem).Cash.Lock
var
  ptrItem: pointer;
  ptrLevel: pointer;
  LevelsCount: integer;
  LI: integer;
begin
Space.Lock.Enter;
try
TSystemTTileServerVisualization(TypeSystem).Cash.Lock.BeginRead();
try
ptrItem:=TSystemTTileServerVisualization(TypeSystem).Cash.NotRecombinatedGetPtrItem(idObj);
if (ptrItem = nil)
 then begin
  Space.Obj_CheckCachedState(Ptr,false);
  ptrItem:=TSystemTTileServerVisualization(TypeSystem).Cash.NotRecombinatedGetPtrItem(idObj);
  if (ptrItem = nil) then Raise Exception.Create('TTileServerVisualizationFunctionality.GetLevelsInfoLocally: context item is not found'); //. =>
  end;
with TItemTTileServerVisualizationCash(ptrItem^) do begin
ptrLevel:=Levels;
LevelsCount:=0;
while (ptrLevel <> nil) do begin
  Inc(LevelsCount);
  ptrLevel:=TLevelItemOfTTileServerVisualizationCash(ptrLevel^).ptrNext;
  end;
//.
SetLength(Info,LevelsCount*SizeOf(TTileServerVisualizationLevel));
LI:=0;
ptrLevel:=Levels;
while (ptrLevel <> nil) do with TLevelItemOfTTileServerVisualizationCash(ptrLevel^) do begin
  TTileServerVisualizationLevel(Pointer(@Info[(LevelsCount-LI-1)*SizeOf(TTileServerVisualizationLevel)])^):=Params;
  Inc(LI);
  //.
  ptrLevel:=ptrNext;
  end;
end;
finally
TSystemTTileServerVisualization(TypeSystem).Cash.Lock.EndRead();
end;
finally
Space.Lock.Leave;
end;
end;

procedure TTileServerVisualizationFunctionality.Level_GetSegments(const TileProviderID: integer; const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const ExceptSegments: TByteArray; out Segments: TByteArray);

  function ExceptSegments_SegmentFound(ExceptSegmentsPtr: pointer; ExceptSegmentsSize: integer; SegmentID: integer): boolean;
  begin
  asm
        PUSH EAX
        PUSH ECX
        PUSH EDI
        MOV EAX,SegmentID
        MOV EDI,ExceptSegmentsPtr
        CMP EDI,0 {nil}
        JE @M1
        MOV ECX,ExceptSegmentsSize
        JECXZ @M1
        CLD
        REPNE SCASD
        JNE @M1
          MOV Result,true
          JMP @M2
  @M1:  MOV Result,false
  @M2:  POP EDI
        POP ECX
        POP EAX
  end;
  end;

  procedure NativeServer_Level_GetSegments(const Level: integer; const TileProvider: TTileServerTileProvider);

    procedure SplitStrings(const S: string; out SL: TStringList);
    var
      SS: string;
      I: integer;
    begin
    SL:=TStringList.Create();
    try
    SS:='';
    for I:=1 to Length(S) do
      if (S[I] = ',')
       then begin
        SL.Add(SS);
        SS:='';
        end
      else
       if (S[I] <> ' ') then SS:=SS+S[I];
    if (SS <> '') then SL.Add(SS);
    except
      FreeAndNil(SL);
      Raise; //. =>
      end;
    end;

  var
    Params: TStringList;
    ServerAddress: string;
    ServerPort: integer;
    {$IFNDEF EmbeddedServer}
    SpaceProvider: ISpaceProvider;
    {$ENDIF}
    ResultStream: TMemoryStream;
    SP: integer;
    Connection: TTCPClient;
    SegmentsCount: integer;
    I: integer;
    PngImage: TPNGObject;
    JpegImage: TJPegImage;
    BmpImage: TBitmap;
    SS: TMemoryStream;
    X,Y: DWord;
    SegmentID: DWord;
    DS: integer;
  begin
  SplitStrings(TileProvider.URL,{out} Params);
  try
  ServerPort:=StrToInt(Params[1]);
  if (ServerPort < 0)
   then begin //. process via SpaceHTTPSOAPServer
    {$IFNDEF EmbeddedServer}
    SpaceProvider:=GetISpaceProvider(Space.SOAPServerURL);
    SpaceProvider.TileServer_GetTiles(Space.UserName,Space.UserPassword,idObj,StrToInt(Params[2]),StrToInt(Params[3]),Level, XIndexMin,XIndexMax,YIndexMin,YIndexMax, ExceptSegments, {out} Segments);
    {$ELSE}
    SpaceProvider_TileServer_GetTiles(Space.UserName,Space.UserPassword,idObj,StrToInt(Params[2]),StrToInt(Params[3]),Level, XIndexMin,XIndexMax,YIndexMin,YIndexMax, ExceptSegments, {out} Segments);
    {$ENDIF}
    if (Length(Segments) = 0) then Exit; //. ->
    if (TileProvider.Format = 'jpg') then Exit; //. ->
    if (TileProvider.Format = 'png')
     then begin
      ResultStream:=TMemoryStream.Create();
      try
      SS:=TMemoryStream.Create();
      try
      PngImage:=TPNGObject.Create();
      JpegImage:=TJPegImage.Create();
      BmpImage:=TBitmap.Create();
      BmpImage.Canvas.Lock();
      try
      JpegImage.CompressionQuality:=100;
      //.
      SP:=0;
      while (SP < Length(Segments)) do begin
        SegmentID:=DWord(Pointer(@Segments[SP])^); Inc(SP,SizeOf(SegmentID));
        X:=DWord(Pointer(@Segments[SP])^); Inc(SP,SizeOf(X));
        Y:=DWord(Pointer(@Segments[SP])^); Inc(SP,SizeOf(Y));
        ResultStream.Write(SegmentID,SizeOf(SegmentID));
        ResultStream.Write(X,SizeOf(X));
        ResultStream.Write(Y,SizeOf(Y));
        DS:=DWord(Pointer(@Segments[SP])^); Inc(SP,SizeOf(DS));
        if (DS > 0)
         then begin
          SS.Clear();
          SS.Write(Pointer(@Segments[SP])^,DS); Inc(SP,DS);
          SS.Position:=0; 
          PngImage.LoadFromStream(SS);
          BmpImage.Assign(PngImage);
          JpegImage.Assign(BmpImage);
          SS.Clear();
          JpegImage.SaveToStream(SS);
          DS:=SS.Size;
          ResultStream.Write(DS,SizeOf(DS));
          ResultStream.Write(SS.Memory^,DS);
          end
         else ResultStream.Write(DS,SizeOf(DS));
        end;
      SetLength(Segments,ResultStream.Size);
      if (ResultStream.Size > 0) then System.Move(ResultStream.Memory^,Pointer(@Segments[0])^,ResultStream.Size);
      finally
      BmpImage.Canvas.Unlock();
      BmpImage.Destroy();
      JpegImage.Destroy();
      PngImage.Destroy();
      end;
      finally
      SS.Destroy();
      end;
      finally
      ResultStream.Destroy();
      end;
      //.
      Exit; //. ->
      end
     else Exception.Create('TTileServerVisualizationFunctionality.Level_GetSegments: unknown tile data format, '+TileProvider.Format); //. =>
    end;
  ServerAddress:=Params[0];
  if (ServerAddress = '') then ServerAddress:=Space.SOAPServerAddress;
  //.
  with TSpaceDataServerClient.Create(ServerAddress,ServerPort,Space.UserName,Space.UserPassword) do
  try
  ResultStream:=TMemoryStream.Create();
  try
  Connection:=TileServer_GetTiles_Begin(idObj,StrToInt(Params[2]),StrToInt(Params[3]),Level, XIndexMin,XIndexMax,YIndexMin,YIndexMax, ExceptSegments,{out} SegmentsCount);
  try
  PngImage:=TPNGObject.Create();
  JpegImage:=TJPegImage.Create();
  BmpImage:=TBitmap.Create();
  BmpImage.Canvas.Lock();
  try
  JpegImage.CompressionQuality:=100;
  //.
  SS:=TMemoryStream.Create();
  try
  for I:=0 to SegmentsCount-1 do begin
    SS.Clear();
    TileServer_GetTiles_Read(Connection,{out} X,Y, SS);
    SegmentID:=TTTileServerVisualizationCash(TSystemTTileServerVisualization(TypeSystem).Cash).SegmentPositionHashCode(X,Y);
    //.
    if (TileProvider.Format = 'png')
     then begin
      if (SS.Size > 0)
       then begin
        SS.Position:=0;
        PngImage.LoadFromStream(SS);
        BmpImage.Assign(PngImage);
        JpegImage.Assign(BmpImage);
        SS.Clear();
        JpegImage.SaveToStream(SS);
        end;
      end
     else Exception.Create('TTileServerVisualizationFunctionality.Level_GetSegments: unknown tile data format, '+TileProvider.Format); //. =>
    //.
    ResultStream.Write(SegmentID,SizeOf(SegmentID));
    ResultStream.Write(X,SizeOf(X));
    ResultStream.Write(Y,SizeOf(Y));
    DS:=SS.Size;
    ResultStream.Write(DS,SizeOf(DS));
    if (DS > 0) then ResultStream.Write(SS.Memory^,DS);
    end;
  SetLength(Segments,ResultStream.Size);
  if (ResultStream.Size > 0) then System.Move(ResultStream.Memory^,Pointer(@Segments[0])^,ResultStream.Size);
  finally
  SS.Destroy();
  end;
  finally
  BmpImage.Canvas.Unlock();
  BmpImage.Destroy();
  JpegImage.Destroy();
  PngImage.Destroy();
  end;
  finally
  TileServer_GetTiles_End(Connection);
  end;
  finally
  ResultStream.Destroy();
  end;
  finally
  Destroy();
  end;
  finally
  Params.Destroy();
  end;
  end;
  
  procedure YandexMaps_Level_GetSegments(const Level: integer; const TileProvider: TTileServerTileProvider);
  const
    SegmentReadMaxTime = 1000*60; {seconds}
  var
    X,Y: integer;
    ExceptSegmentsPtr: pointer;
    ExceptSegmentsSize: integer;
    IdHTTP: TIdHTTP;
    ResultStream: TMemoryStream;
    PngImage: TPNGObject;
    JpegImage: TJPegImage;
    BmpImage: TBitmap;
    SegmentID: integer;
    URL: string;
    MS: TMemoryStream;
    DS: integer;
  begin
  ExceptSegmentsPtr:=@ExceptSegments[0];
  ExceptSegmentsSize:=(Length(ExceptSegments) DIV SizeOf(SegmentID));
  IdHTTP:=TIdHTTP.Create(nil);
  try
  ResultStream:=TMemoryStream.Create();
  try
  PngImage:=TPNGObject.Create();
  JpegImage:=TJPegImage.Create();
  BmpImage:=TBitmap.Create();
  BmpImage.Canvas.Lock();
  try
  MS:=TMemoryStream.Create();
  try
  for X:=XIndexMin to XIndexMax do
    for Y:=YIndexMin to YIndexMax do begin
      SegmentID:=TTTileServerVisualizationCash(TSystemTTileServerVisualization(TypeSystem).Cash).SegmentPositionHashCode(X,Y);
      if (NOT ExceptSegments_SegmentFound(ExceptSegmentsPtr,ExceptSegmentsSize,SegmentID))
       then begin
        URL:=TileProvider.URL+'&x='+IntToStr(X)+'&y='+IntToStr(Y)+'&z='+IntToStr(Level);
        MS.Clear();
        try
        IdHTTP.ReadTimeout:=SegmentReadMaxTime;
        //.
        TSystemTTileServerVisualization(TypeSystem).ProviderLock.Enter(); //. some provider requires single access per moment
        try
        IdHTTP.Get(URL,MS);
        finally
        TSystemTTileServerVisualization(TypeSystem).ProviderLock.Leave();
        end;
        //.
        MS.Position:=0;
        //.
        if (TileProvider.Format = 'jpg')
         then begin
          JpegImage.LoadFromStream(MS);
          end else
        if (TileProvider.Format = 'png')
         then begin
          PngImage.LoadFromStream(MS);
          BmpImage.Assign(PngImage);
          JpegImage.Assign(BmpImage);
          end
         else Exception.Create('TTileServerVisualizationFunctionality.Level_GetSegments: unknown tile data format, '+TileProvider.Format); //. =>
        //.
        MS.Clear();
        JpegImage.SaveToStream(MS);
        except
          on E: EIdConnClosedGracefully do ;
          on E: EIdHTTPProtocolException do begin
            case E.ReplyErrorCode of
            404: begin
              //. form empty segment (MS.Size = 0)
              (*///? TSystemTTileServerVisualization(TypeSystem).EmptySegmentImage.Canvas.Lock();
              try
              JpegImage.Assign(TSystemTTileServerVisualization(TypeSystem).EmptySegmentImage);
              MS.Clear();
              JpegImage.SaveToStream(MS);
              finally
              TSystemTTileServerVisualization(TypeSystem).EmptySegmentImage.Canvas.Unlock();
              end;*)
              end;
            else
              Raise Exception.Create('HTTP connnection Error: '+IntToStr(E.ReplyErrorCode)); //. =>
            end;
            end;
          on E: Exception do Raise; //. =>
          end;
        //.
        ResultStream.Write(SegmentID,SizeOf(SegmentID));
        ResultStream.Write(X,SizeOf(X));
        ResultStream.Write(Y,SizeOf(Y));
        DS:=MS.Size;
        ResultStream.Write(DS,SizeOf(DS));
        if (DS > 0) then ResultStream.Write(MS.Memory^,DS);
        end;
      end;
  SetLength(Segments,ResultStream.Size);
  if (ResultStream.Size > 0) then System.Move(ResultStream.Memory^,Pointer(@Segments[0])^,ResultStream.Size);
  finally
  MS.Destroy();
  end;
  finally
  BmpImage.Canvas.Unlock();
  BmpImage.Destroy();
  JpegImage.Destroy();
  PngImage.Destroy();
  end;
  finally
  ResultStream.Destroy();
  end;
  finally
  IdHTTP.Destroy();
  end;
  end;

  procedure GoogleMaps_Level_GetSegments(const Level: integer; const TileProvider: TTileServerTileProvider);
  const
    SegmentReadMaxTime = 1000*60; {seconds}
  var
    X,Y: integer;
    ExceptSegmentsPtr: pointer;
    ExceptSegmentsSize: integer;
    IdHTTP: TIdHTTP;
    ResultStream: TMemoryStream;
    PngImage: TPNGObject;
    JpegImage: TJPegImage;
    BmpImage: TBitmap;
    SegmentID: integer;
    URL: string;
    MS: TMemoryStream;
    DS: integer;
  begin
  ExceptSegmentsPtr:=@ExceptSegments[0];
  ExceptSegmentsSize:=(Length(ExceptSegments) DIV SizeOf(SegmentID));
  IdHTTP:=TIdHTTP.Create(nil);
  try
  ResultStream:=TMemoryStream.Create();
  try
  PngImage:=TPNGObject.Create();
  JpegImage:=TJPegImage.Create();
  BmpImage:=TBitmap.Create();
  BmpImage.Canvas.Lock();
  try
  MS:=TMemoryStream.Create();
  try
  for X:=XIndexMin to XIndexMax do
    for Y:=YIndexMin to YIndexMax do begin
      SegmentID:=TTTileServerVisualizationCash(TSystemTTileServerVisualization(TypeSystem).Cash).SegmentPositionHashCode(X,Y);
      if (NOT ExceptSegments_SegmentFound(ExceptSegmentsPtr,ExceptSegmentsSize,SegmentID))
       then begin
        URL:=TileProvider.URL+'&x='+IntToStr(X)+'&y='+IntToStr(Y)+'&z='+IntToStr(Level)+'&s=';
        MS.Clear();
        try
        IdHTTP.ReadTimeout:=SegmentReadMaxTime;
        IdHTTP.Request.UserAgent:='GS';
        //.
        TSystemTTileServerVisualization(TypeSystem).ProviderLock.Enter(); //. some provider requires single access per moment
        try
        IdHTTP.Get(URL,MS);
        finally
        TSystemTTileServerVisualization(TypeSystem).ProviderLock.Leave();
        end;
        //.
        MS.Position:=0;
        //.
        if (TileProvider.Format = 'jpg')
         then begin
          JpegImage.LoadFromStream(MS);
          end else
        if (TileProvider.Format = 'png')
         then begin
          PngImage.LoadFromStream(MS);
          BmpImage.Assign(PngImage);
          JpegImage.Assign(BmpImage);
          end
         else Exception.Create('TTileServerVisualizationFunctionality.Level_GetSegments: unknown tile data format, '+TileProvider.Format); //. =>
        //.
        MS.Clear();
        JpegImage.SaveToStream(MS);
        except
          on E: EIdConnClosedGracefully do ;
          on E: EIdHTTPProtocolException do begin
            case E.ReplyErrorCode of
            404: begin
              //. form empty segment (MS.Size = 0)
              (*///? TSystemTTileServerVisualization(TypeSystem).EmptySegmentImage.Canvas.Lock();
              try
              JpegImage.Assign(TSystemTTileServerVisualization(TypeSystem).EmptySegmentImage);
              MS.Clear();
              JpegImage.SaveToStream(MS);
              finally
              TSystemTTileServerVisualization(TypeSystem).EmptySegmentImage.Canvas.Unlock();
              end;*)
              end;
            else
              Raise Exception.Create('HTTP connnection Error: '+IntToStr(E.ReplyErrorCode)); //. =>
            end;
            end;
          on E: Exception do Raise; //. =>
          end;
        //.
        ResultStream.Write(SegmentID,SizeOf(SegmentID));
        ResultStream.Write(X,SizeOf(X));
        ResultStream.Write(Y,SizeOf(Y));
        DS:=MS.Size;
        ResultStream.Write(DS,SizeOf(DS));
        if (DS > 0) then ResultStream.Write(MS.Memory^,DS);
        end;
      end;
  SetLength(Segments,ResultStream.Size);
  if (ResultStream.Size > 0) then System.Move(ResultStream.Memory^,Pointer(@Segments[0])^,ResultStream.Size);
  finally
  MS.Destroy();
  end;
  finally
  BmpImage.Canvas.Unlock();
  BmpImage.Destroy();
  JpegImage.Destroy();
  PngImage.Destroy();
  end;
  finally
  ResultStream.Destroy();
  end;
  finally
  IdHTTP.Destroy();
  end;
  end;

  procedure OpenStreetMaps_Level_GetSegments(const Level: integer; const TileProvider: TTileServerTileProvider);
  const
    SegmentReadMaxTime = 1000*60; {seconds}
  var
    X,Y: integer;
    ExceptSegmentsPtr: pointer;
    ExceptSegmentsSize: integer;
    IdHTTP: TIdHTTP;
    ResultStream: TMemoryStream;
    PngImage: TPNGObject;
    JpegImage: TJPegImage;
    BmpImage: TBitmap;
    SegmentID: integer;
    URL: string;
    MS: TMemoryStream;
    DS: integer;
  begin
  ExceptSegmentsPtr:=@ExceptSegments[0];
  ExceptSegmentsSize:=(Length(ExceptSegments) DIV SizeOf(SegmentID));
  IdHTTP:=TIdHTTP.Create(nil);
  try
  ResultStream:=TMemoryStream.Create();
  try
  PngImage:=TPNGObject.Create();
  JpegImage:=TJPegImage.Create();
  BmpImage:=TBitmap.Create();
  BmpImage.Canvas.Lock();
  try
  MS:=TMemoryStream.Create();
  try
  for X:=XIndexMin to XIndexMax do
    for Y:=YIndexMin to YIndexMax do begin
      SegmentID:=TTTileServerVisualizationCash(TSystemTTileServerVisualization(TypeSystem).Cash).SegmentPositionHashCode(X,Y);
      if (NOT ExceptSegments_SegmentFound(ExceptSegmentsPtr,ExceptSegmentsSize,SegmentID))
       then begin
        URL:=TileProvider.URL+'/'+IntToStr(Level)+'/'+IntToStr(X)+'/'+IntToStr(Y)+'.png';
        MS.Clear();
        try
        IdHTTP.ReadTimeout:=SegmentReadMaxTime;
        IdHTTP.Request.UserAgent:='GS';
        //.
        TSystemTTileServerVisualization(TypeSystem).ProviderLock.Enter(); //. some provider requires single access per moment
        try
        IdHTTP.Get(URL,MS);
        finally
        TSystemTTileServerVisualization(TypeSystem).ProviderLock.Leave();
        end;
        //.
        MS.Position:=0;
        //.
        if (TileProvider.Format = 'jpg')
         then begin
          JpegImage.LoadFromStream(MS);
          end else
        if (TileProvider.Format = 'png')
         then begin
          PngImage.LoadFromStream(MS);
          BmpImage.Assign(PngImage);
          JpegImage.Assign(BmpImage);
          end
         else Exception.Create('TTileServerVisualizationFunctionality.Level_GetSegments: unknown tile data format, '+TileProvider.Format); //. =>
        //.
        MS.Clear();
        JpegImage.SaveToStream(MS);
        except
          on E: EIdConnClosedGracefully do ;
          on E: EIdHTTPProtocolException do begin
            case E.ReplyErrorCode of
            404: begin
              //. form empty segment (MS.Size = 0)
              (*///? TSystemTTileServerVisualization(TypeSystem).EmptySegmentImage.Canvas.Lock();
              try
              JpegImage.Assign(TSystemTTileServerVisualization(TypeSystem).EmptySegmentImage);
              MS.Clear();
              JpegImage.SaveToStream(MS);
              finally
              TSystemTTileServerVisualization(TypeSystem).EmptySegmentImage.Canvas.Unlock();
              end;*)
              end;
            else
              Raise Exception.Create('HTTP connnection Error: '+IntToStr(E.ReplyErrorCode)); //. =>
            end;
            end;
          on E: Exception do Raise; //. =>
          end;
        //.
        ResultStream.Write(SegmentID,SizeOf(SegmentID));
        ResultStream.Write(X,SizeOf(X));
        ResultStream.Write(Y,SizeOf(Y));
        DS:=MS.Size;
        ResultStream.Write(DS,SizeOf(DS));
        if (DS > 0) then ResultStream.Write(MS.Memory^,DS);
        end;
      end;
  SetLength(Segments,ResultStream.Size);
  if (ResultStream.Size > 0) then System.Move(ResultStream.Memory^,Pointer(@Segments[0])^,ResultStream.Size);
  finally
  MS.Destroy();
  end;
  finally
  BmpImage.Canvas.Unlock();
  BmpImage.Destroy();
  JpegImage.Destroy();
  PngImage.Destroy();
  end;
  finally
  ResultStream.Destroy();
  end;
  finally
  IdHTTP.Destroy();
  end;
  end;

  procedure NavitelMaps_Level_GetSegments(const Level: integer; const TileProvider: TTileServerTileProvider);
  const
    SegmentReadMaxTime = 1000*60; {seconds}

    function _IntToStr(const V: integer; const Digits: integer): shortstring;
    var
      I: integer;
      L: integer;
    begin
    Result:=IntToStr(V);
    L:=Length(Result);
    for I:=L to Digits-1 do Result:='0'+Result;
    end;

  var
    X,Y: integer;
    ExceptSegmentsPtr: pointer;
    ExceptSegmentsSize: integer;
    IdHTTP: TIdHTTP;
    ResultStream: TMemoryStream;
    PngImage: TPNGObject;
    JpegImage: TJPegImage;
    BmpImage: TBitmap;
    SegmentID: integer;
    URL: string;
    MS: TMemoryStream;
    DS: integer;
  begin
  ExceptSegmentsPtr:=@ExceptSegments[0];
  ExceptSegmentsSize:=(Length(ExceptSegments) DIV SizeOf(SegmentID));
  IdHTTP:=TIdHTTP.Create(nil);
  try
  ResultStream:=TMemoryStream.Create();
  try
  PngImage:=TPNGObject.Create();
  JpegImage:=TJPegImage.Create();
  BmpImage:=TBitmap.Create();
  BmpImage.Canvas.Lock();
  try
  MS:=TMemoryStream.Create();
  try
  for X:=XIndexMin to XIndexMax do
    for Y:=YIndexMin to YIndexMax do begin
      SegmentID:=TTTileServerVisualizationCash(TSystemTTileServerVisualization(TypeSystem).Cash).SegmentPositionHashCode(X,Y);
      if (NOT ExceptSegments_SegmentFound(ExceptSegmentsPtr,ExceptSegmentsSize,SegmentID))
       then begin
        URL:=TileProvider.URL+'?t='+_IntToStr(X,8)+','+_IntToStr((1 SHL Level)-1-Y,8)+','+_IntToStr(Level,2);
        MS.Clear();
        try
        IdHTTP.ReadTimeout:=SegmentReadMaxTime;
        IdHTTP.Request.UserAgent:='GS';
        //.
        TSystemTTileServerVisualization(TypeSystem).ProviderLock.Enter(); //. some provider requires single access per moment
        try
        IdHTTP.Get(URL,MS);
        finally
        TSystemTTileServerVisualization(TypeSystem).ProviderLock.Leave();
        end;
        //.
        MS.Position:=0;
        //.
        if (TileProvider.Format = 'jpg')
         then begin
          JpegImage.LoadFromStream(MS);
          end else
        if (TileProvider.Format = 'png')
         then begin
          PngImage.LoadFromStream(MS);
          BmpImage.Assign(PngImage);
          JpegImage.Assign(BmpImage);
          end
         else Exception.Create('TTileServerVisualizationFunctionality.Level_GetSegments: unknown tile data format, '+TileProvider.Format); //. =>
        //.
        MS.Clear();
        JpegImage.SaveToStream(MS);
        except
          on E: EIdConnClosedGracefully do ;
          on E: EIdHTTPProtocolException do begin
            case E.ReplyErrorCode of
            404,503: begin
              //. form empty segment (MS.Size = 0)
              (*///? TSystemTTileServerVisualization(TypeSystem).EmptySegmentImage.Canvas.Lock();
              try
              JpegImage.Assign(TSystemTTileServerVisualization(TypeSystem).EmptySegmentImage);
              MS.Clear();
              JpegImage.SaveToStream(MS);
              finally
              TSystemTTileServerVisualization(TypeSystem).EmptySegmentImage.Canvas.Unlock();
              end;*)
              end;
            else
              Raise Exception.Create('HTTP connnection Error: '+IntToStr(E.ReplyErrorCode)); //. =>
            end;
            end;
          on E: Exception do Raise; //. =>
          end;
        //.
        ResultStream.Write(SegmentID,SizeOf(SegmentID));
        ResultStream.Write(X,SizeOf(X));
        ResultStream.Write(Y,SizeOf(Y));
        DS:=MS.Size;
        ResultStream.Write(DS,SizeOf(DS));
        if (DS > 0) then ResultStream.Write(MS.Memory^,DS);
        end;
      end;
  SetLength(Segments,ResultStream.Size);
  if (ResultStream.Size > 0) then System.Move(ResultStream.Memory^,Pointer(@Segments[0])^,ResultStream.Size);
  finally
  MS.Destroy();
  end;
  finally
  BmpImage.Canvas.Unlock();
  BmpImage.Destroy();
  JpegImage.Destroy();
  PngImage.Destroy();
  end;
  finally
  ResultStream.Destroy();
  end;
  finally
  IdHTTP.Destroy();
  end;
  end;

var
  ptrItem: pointer;
  ServerType: TTileServerType;
  ServerParsedData: TTileServerParsedData;
  TileProviderIndex: integer;
  TileProvider: TTileServerTileProvider;
  Level: integer;
  ptrLevel: pointer;
begin
Segments:=nil;
//.
TSystemTTileServerVisualization(TypeSystem).Cash.Lock.BeginRead();
try
ptrItem:=TSystemTTileServerVisualization(TypeSystem).Cash.NotRecombinatedGetPtrItem(idObj);
if (ptrItem = nil) then Raise Exception.Create('TTileServerVisualizationFunctionality.Level_GetSegments: context item is not found'); //. =>
ServerType:=TTileServerType(TItemTTileServerVisualizationCash(ptrItem^).ServerType);
ServerParsedData:=TItemTTileServerVisualizationCash(ptrItem^).ServerParsedData; 
if (ServerParsedData = nil) then Exception.Create('TTileServerVisualizationFunctionality.Level_GetSegments: server parsed data is not found'); //. =>
if (Length(ServerParsedData.TileProviders) = 0) then Exception.Create('TTileServerVisualizationFunctionality.Level_GetSegments: no tile provider found'); //. =>
TileProviderIndex:=ServerParsedData.TileProviders_GetItemIndex(TileProviderID);
if ((TileProviderIndex < 0) OR (TileProviderIndex >= Length(ServerParsedData.TileProviders))) then TileProviderIndex:=0;
TileProvider:=ServerParsedData.TileProviders[TileProviderIndex];
if (TileProvider.ServerType >= 0) then ServerType:=TTileServerType(TileProvider.ServerType);
//.
Level:=0;
ptrLevel:=TItemTTileServerVisualizationCash(ptrItem^).Levels;
while (ptrLevel <> nil) do with TLevelItemOfTTileServerVisualizationCash(ptrLevel^) do begin
  if (Params.ID = idLevel) then Break; //. ->
  //. next level
  Inc(Level);
  ptrLevel:=ptrNext;
  end;
if (ptrLevel = nil) then Exception.Create('TTileServerVisualizationFunctionality.Level_GetSegments: unknown Level'); //. =>
finally
TSystemTTileServerVisualization(TypeSystem).Cash.Lock.EndRead();
end;
case ServerType of
tstNative: begin
  if (Length(TileProvider.URL) = 0)
   then RemotedFunctionality.Level_GetSegments(TileProviderID,idLevel,XIndexMin,XIndexMax,YIndexMin,YIndexMax,ExceptSegments,Segments)
   else NativeServer_Level_GetSegments(Level,TileProvider);
  end;
tstYandexMaps:          YandexMaps_Level_GetSegments(Level,TileProvider);
tstGoogleMaps:          GoogleMaps_Level_GetSegments(Level,TileProvider);
tstOpenStreetMaps:      OpenStreetMaps_Level_GetSegments(Level,TileProvider);
tstNavitelMaps:         NavitelMaps_Level_GetSegments(Level,TileProvider);
else
  Raise Exception.Create('TTileServerVisualizationFunctionality.Level_GetSegments: unknown server type'); //. =>
end;
end;

procedure TTileServerVisualizationFunctionality.Level_GetParams(const idLevel: integer; out DivX: integer; out DivY: integer; out SegmentWidth: double; out SegmentHeight: double; out VisibleMinScale: double; out VisibleMaxScale: double);
begin
RemotedFunctionality.Level_GetParams(idLevel,DivX,DivY,SegmentWidth,SegmentHeight,VisibleMinScale,VisibleMaxScale);
end;

procedure TTileServerVisualizationFunctionality.Level_SetParams(const idLevel: integer; const DivX: integer; const DivY: integer; const SegmentWidth: double; const SegmentHeight: double; const VisibleMinScale: double; const VisibleMaxScale: double);
begin
RemotedFunctionality.Level_SetParams(idLevel,DivX,DivY,SegmentWidth,SegmentHeight,VisibleMinScale,VisibleMaxScale);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TTileServerVisualizationFunctionality.Level_GetSegmentsByIDs(const idLevel: integer; const SegmentsIDs: TByteArray; out Segments: TByteArray);
begin
RemotedFunctionality.Level_GetSegmentsByIDs(idLevel,SegmentsIDs,Segments);
end;

procedure TTileServerVisualizationFunctionality.Level_GetSegmentsHashes(const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const ExceptSegments: TByteArray; out SegmentsHashes: TByteArray);
begin
RemotedFunctionality.Level_GetSegmentsHashes(idLevel,XIndexMin,XIndexMax,YIndexMin,YIndexMax,ExceptSegments,SegmentsHashes);
end;

procedure TTileServerVisualizationFunctionality.Level_SetSegments(const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const Segments: TByteArray);
begin
RemotedFunctionality.Level_SetSegments(idLevel,XIndexMin,XIndexMax,YIndexMin,YIndexMax,Segments);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TTileServerVisualizationFunctionality.Level_ConvertPixPosToXY(const idLevel: integer; const PixX,PixY: integer; out X,Y: double);
var
  DivX,DivY: integer;
  SegmentWidth: double;
  SegmentHeight: double;
  VisibleMinScale: double;
  VisibleMaxScale: double;
  Obj: TSpaceObj;
  Col_dX,Col_dY: double;
  Row_dX,Row_dY: double;
  N0,N1,N3: TNodeSpaceObjPolyLinePolygon;
  PixLength: integer;
  Col_Factor,Row_Factor: double;
begin
Level_GetParams(idLevel, DivX,DivY, SegmentWidth,SegmentHeight, VisibleMinScale,VisibleMaxScale);
if ((DivX <> DivY) OR (SegmentWidth <> SegmentHeight)) then Raise Exception.Create('wrong obj parameters'); //. =>
Space.ReadObj(Obj,SizeOf(Obj), Ptr);
with TSpaceObjPolyLinePolygon.Create(Space, Obj) do
try
if (Count <> 4) then Raise Exception.Create('wrong object'); //. =>
N0:=Nodes[0]; N1:=Nodes[1]; N3:=Nodes[3];
Col_dX:=(N1.X-N0.X); Col_dY:=(N1.Y-N0.Y);
Row_dX:=(N3.X-N0.X); Row_dY:=(N3.Y-N0.Y);
PixLength:=Trunc(DivX*SegmentWidth);
Col_Factor:=PixX/PixLength;
Row_Factor:=PixY/PixLength; //. PixLength the same as for X
X:=N0.X+Col_dX*Col_Factor+Row_dX*Row_Factor;
Y:=N0.Y+Col_dY*Col_Factor+Row_dY*Row_Factor;
finally
Destroy;
end;
end;

procedure TTileServerVisualizationFunctionality.Level_ConvertXYToPixPos(const idLevel: integer; const X,Y: double; out PixX,PixY: integer);

  procedure ProcessPoint(const X0,Y0,X1,Y1,X3,Y3: Extended; const X,Y: Extended; out Xfactor,Yfactor: Extended);
  var
    QdA2: Extended;
    X_C,X_QdC,X_A1,X_QdB2: Extended;
    Y_C,Y_QdC,Y_A1,Y_QdB2: Extended;
  begin
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
  Xfactor:=X_A1/X_C;
  Yfactor:=Y_A1/Y_C;
  end;

var
  DivX,DivY: integer;
  SegmentWidth: double;
  SegmentHeight: double;
  VisibleMinScale: double;
  VisibleMaxScale: double;
  Obj: TSpaceObj;
  N0,N1,N3: TNodeSpaceObjPolyLinePolygon;
  Xfactor,Yfactor: Extended;
begin
Level_GetParams(idLevel, DivX,DivY, SegmentWidth,SegmentHeight, VisibleMinScale,VisibleMaxScale);
if ((DivX <> DivY) OR (SegmentWidth <> SegmentHeight)) then Raise Exception.Create('wrong obj parameters'); //. =>
Space.ReadObj(Obj,SizeOf(Obj), Ptr);
with TSpaceObjPolyLinePolygon.Create(Space, Obj) do
try
if (Count <> 4) then Raise Exception.Create('wrong object'); //. =>
N0:=Nodes[0]; N1:=Nodes[1]; N3:=Nodes[3];
//.
ProcessPoint(N0.X,N0.Y,N1.X,N1.Y,N3.X,N3.Y, X,Y,  Xfactor,Yfactor);
//.
PixX:=Trunc(Xfactor*(DivX*SegmentWidth));
PixY:=Trunc(Yfactor*(DivX*SegmentWidth)); //. same as for X
finally
Destroy;
end;
end;

function TTileServerVisualizationFunctionality.UserData_GetTileProviderID(out oTileProviderID: integer): boolean;
var
  FN: string;
  Doc: IXMLDOMDocument;
  RootNode: IXMLDOMNode;
  VersionNode: IXMLDOMNode;
  Version: integer;
  Node: IXMLDOMNode;
begin
Result:=false;
FN:=UserProfileFolder()+'\'+'Data.xml';
TypeSystem.Lock.Enter();
try
if (NOT FileExists(FN)) then Exit; //. ->
Doc:=CoDomDocument.Create();
Doc.Set_Async(false);
Doc.Load(FN);
RootNode:=Doc.documentElement.selectSingleNode('/ROOT');
VersionNode:=RootNode.selectSingleNode('Version');
if (VersionNode <> nil)
 then Version:=VersionNode.nodeTypedValue
 else Version:=0;
if (Version <> 1) then Raise Exception.Create('unknown version'); //. =>
//.
Node:=RootNode.selectSingleNode('TileProviderID');
if (Node <> nil) then oTileProviderID:=Node.nodeTypedValue else oTileProviderID:=1;
finally
TypeSystem.Lock.Leave();
end;
Result:=true;
end;

procedure TTileServerVisualizationFunctionality.UserData_SetTileProviderID(const pTileProviderID: integer);
var
  Folder: string;
  FN: string;
  Doc: IXMLDOMDocument;
  PI: IXMLDOMProcessingInstruction;
  RootNode: IXMLDOMNode;
  Root: IXMLDOMElement;
  VersionNode: IXMLDOMNode;
  Version: integer;
  Node: IXMLDOMNode;
  //.
  ptrItem: pointer;
begin
TSystemTTileServerVisualization(TypeSystem).Cash.Lock.BeginWrite();
try
if (NOT TSystemTTileServerVisualization(TypeSystem).Cash.GetItem(idObj,{out} ptrItem)) then Raise Exception.Create('TTileServerVisualizationFunctionality.UserData_SetTileProviderID: context item is not found, ID: '+IntToStr(idObj)); //. =>
if (NOT TSystemTTileServerVisualization(TypeSystem).Cash.Item_SetTileProviderID(ptrItem,pTileProviderID)) then Raise Exception.Create('TTileServerVisualizationFunctionality.UserData_SetTileProviderID: unknown Provider, ID: '+IntToStr(pTileProviderID));
finally
TSystemTTileServerVisualization(TypeSystem).Cash.Lock.EndWrite();
end;
//.
Folder:=UserProfileFolder();
FN:=Folder+'\'+'Data.xml';
TypeSystem.Lock.Enter();
try
if (FileExists(FN))
 then begin
  Doc:=CoDomDocument.Create();
  Doc.Set_Async(false);
  Doc.Load(FN);
  RootNode:=Doc.documentElement.selectSingleNode('/ROOT');
  VersionNode:=RootNode.selectSingleNode('Version');
  if (VersionNode <> nil)
   then Version:=VersionNode.nodeTypedValue
   else Version:=0;
  if (Version <> 1) then Raise Exception.Create('unknown version'); //. =>
  //.
  Node:=RootNode.selectSingleNode('TileProviderID');
  if (Node <> nil)
   then Node.nodeTypedValue:=pTileProviderID
   else begin
    Node:=Doc.createElement('TileProviderID');
    Node.nodeTypedValue:=pTileProviderID;
    RootNode.AppendChild(Node);
    end;
  //.
  Doc.Save(FN);
  end
 else begin
  if (NOT DirectoryExists(Folder)) then ForceDirectories(Folder);
  Doc:=CoDomDocument.Create();
  Doc.Set_Async(false);
  PI:=Doc.createProcessingInstruction('xml', 'version=''1.0''');
  Doc.insertBefore(PI, Doc.childNodes.Item[0]);
  Root:=Doc.createElement('ROOT');
  Doc.documentElement:=Root;
  VersionNode:=Doc.createElement('Version');
  VersionNode.nodeTypedValue:=1;
  Root.appendChild(VersionNode);
  //.
  Node:=Doc.createElement('TileProviderID');
  Node.nodeTypedValue:=pTileProviderID;
  Root.AppendChild(Node);
  //.
  Doc.Save(FN);
  end;
finally
TypeSystem.Lock.Leave();
end;
end;

procedure TTileServerVisualizationFunctionality.GetCoordinates(out X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double);
begin
RemotedFunctionality.GetCoordinates(X0,Y0,X1,Y1,X2,Y2,X3,Y3);
end;

procedure TTileServerVisualizationFunctionality.GenerateFromTiles(const TilesFolder: string; const SizePowerOf2: integer);
begin
RemotedFunctionality.GenerateFromTiles(TilesFolder,SizePowerOf2);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TTileServerVisualizationFunctionality.RegenerateRegionFromLevel(const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer);
begin
RemotedFunctionality.RegenerateRegionFromLevel(idLevel,XIndexMin,XIndexMax,YIndexMin,YIndexMax);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TTileServerVisualizationFunctionality.RegenerateRegion(const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer);
begin
RemotedFunctionality.RegenerateRegion(XIndexMin,XIndexMax,YIndexMin,YIndexMax);
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

procedure TTileServerVisualizationFunctionality.AddNewLevelAndRegenerate;
begin
RemotedFunctionality.AddNewLevelAndRegenerate;
//. update local TypesSystem and representations
Space.StayUpToDate;
end;

function TTileServerVisualizationFunctionality.GetSegmentsStorageType: integer;
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

procedure TTileServerVisualizationFunctionality.SetSegmentsStorageType(Value: integer);
begin
Raise Exception.Create(SNotSupported); //. =>
end
;

function TTileServerVisualizationFunctionality.TLevelsPropsPanel_Create: TForm;
begin
Result:=TfmTileServerVisualizationLevels.Create(idObj);
end
;

function TTileServerVisualizationFunctionality.ContainerFilled: boolean;
begin
Result:=true;
end
;







