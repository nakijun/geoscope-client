//. types functionalities additive Implementations (insert it into the working code)

{TTTileServerVisualizationFunctionality}

{TTileServerVisualizationFunctionality}

{TTMeasurementObjectFunctionality}

{TMeasurementObjectFunctionality}

{TTAreaNotificationServerFunctionality}

{TAreaNotificationServerFunctionality}

{TTMODELServerVisualizationFunctionality}

{TMODELServerVisualizationFunctionality}

{TTDoubleVarFunctionality}

{TDoubleVarFunctionality}

{TTInt32VarFunctionality}

{TInt32VarFunctionality}

{TTURLFunctionality}

{TURLFunctionality}

{TTPatternVisualizationFunctionality}

{TPatternVisualizationFunctionality}

{TTMapFormatObjectFunctionality}

{TMapFormatObjectFunctionality}

{TTMapFormatMapFunctionality}

{TMapFormatMapFunctionality}

{TTSPLVisualizationFunctionality}

{TSPLVisualizationFunctionality}

{TTBoolVarFunctionality}

{TBoolVarFunctionality}

{TTGeoSpaceFunctionality}

{TGeoSpaceFunctionality}

{TTUserAlertFunctionality}

{TUserAlertFunctionality}

{TTGeoGraphServerObjectFunctionality}

{TGeoGraphServerObjectFunctionality}

{TTGeoGraphServerFunctionality}

{TGeoGraphServerFunctionality}

{TTGeoCrdSystemFunctionality}

{TGeoCrdSystemFunctionality}

{TTFilterVisualizationFunctionality}

{TFilterVisualizationFunctionality}

{TTHINTVisualizationFunctionality}

{THINTVisualizationFunctionality}

{TTDetailedPictureVisualizationFunctionality}

{TDetailedPictureVisualizationFunctionality}

{TTCoVisualizationFunctionality}

{TCoVisualizationFunctionality}

{TTForumMessageFunctionality}

{TForumMessageFunctionality}

{TTForumFunctionality}

{TForumFunctionality}

{TTCUSTOMVisualizationFunctionality}

{TCUSTOMVisualizationFunctionality}

{TTOLEVisualizationFunctionality}

{TOLEVisualizationFunctionality}

{TTHTMLVisualizationFunctionality}

{THTMLVisualizationFunctionality}

{TTBZRVisualizationFunctionality}

{TBZRVisualizationFunctionality}

{TTAGIFVisualizationFunctionality}

{TAGIFVisualizationFunctionality}

{TTOrientedVIDEOVisualizationFunctionality}

{TOrientedVIDEOVisualizationFunctionality}

{TTVIDEOVisualizationFunctionality}

{TVIDEOVisualizationFunctionality}

{TTOPPVisualizationFunctionality}

{TOPPVisualizationFunctionality}

{TTMODELServerFunctionality}

{TMODELServerFunctionality}

procedure TMODELServerFunctionality.GetCaptcha(const Version: integer; out Code: integer; out Data: TMemoryStream);
const
  Length = 7;
  Lines = 6;
  Width = 256;
  Height = 96;
  Quality = 50;
var
  BMP: TBitmap;
  x,y,g: integer;
  str: string;
  JPG: TJPegImage;
  MS: TMemoryStream;
begin
CheckUserOperation(idReadOperation);
//.
Data:=nil;
if (Version <> 1) then Raise Exception.Create('unknown captcha version'); //. =>
Code:=Random(8999999)+1000000; //. number "Length" digits
BMP:=TBitmap.Create();
try
BMP.Width:=Width;
BMP.Height:=Height;
BMP.Canvas.Brush.Color:=clWhite;
BMP.Canvas.Brush.Style:=bsSolid;
BMP.Canvas.FillRect(BMP.Canvas.ClipRect);
for x:=0 to BMP.Width-1 do
  for y:=0 to BMP.Height-1 do
    if (Random(1000) mod 2 = 0)
     then begin
      g:=Random(100)+100;
      BMP.Canvas.Pixels[x,y] := rgb(g,g,g);
      end;
BMP.Canvas.Brush.Style:=bsClear;
for x:=1 to Length do begin
  g:=Random(100)+100;
  case Random(3) of
  0: BMP.Canvas.Font.Color:=rgb(g,0,0);
  1: BMP.Canvas.Font.Color:=rgb(0,g,0);
  2: BMP.Canvas.Font.Color:=rgb(0,0,g);
  end;
  case random(2) of
  0: BMP.Canvas.Font.Style := [fsBold];
  1: BMP.Canvas.Font.Style := [];
  end;
  BMP.Canvas.Font.Size:=32+Random(12);
  BMP.Canvas.TextOut((x-1)*(Width DIV (Length+1))+4, random(BMP.Height-BMP.Canvas.TextHeight('1')), IntToStr(Code)[x]);
end
;

procedure TMODELServerFunctionality.CreateCaptcha(const Version: integer; out Data: TByteArray);
const
  CreateInterval = 1000*5; //. seconds
var
  CaptchaFileName: string;
  Code: integer;
  MS: TMemoryStream;
begin
TypeSystem.Lock.Enter();
try
GetCaptcha(Version,{out} Code,{out} MS);
try
CaptchaFileName:=ExtractFilePath(GetModuleName(HInstance))+PathTempData+'\'+'CPT'+IntToStr(Code)+'.jpg';
SetLength(Data,MS.Size);
if (Length(Data) > 0) then Move(MS.Memory^,Pointer(@Data[0])^,Length(Data));
//. save captcha file as empty file
MS.Size:=0;
MS.SaveToFile(CaptchaFileName);
finally
MS.Destroy();
end;
//.
Sleep(CreateInterval);
finally
TypeSystem.Lock.Leave();
end;
end
;

{TTCoReferenceFunctionality}

{TCoReferenceFunctionality}

{TTPositionerFunctionality}

{TPositionerFunctionality}

{TTOrientedWMFVisualizationFunctionality}

{TOrientedWMFVisualizationFunctionality}

{TTCELLVisualizationFunctionality}

{TCELLVisualizationFunctionality}

{TTEllipseVisualizationFunctionality}

{TEllipseVisualizationFunctionality}

{TTWMFVisualizationFunctionality}

{TWMFVisualizationFunctionality}

{TTPictureVisualizationFunctionality}

{TPictureVisualizationFunctionality}

{TTRoundVisualizationFunctionality}

{TRoundVisualizationFunctionality}

{TTGeodesyPointFunctionality}

{TGeodesyPointFunctionality}

{TTPrivateAreaVisualizationFunctionality}

{TPrivateAreaVisualizationFunctionality}

{TTHyperTextFunctionality}

{THyperTextFunctionality}

{TTComponentsFindServiceFunctionality}

{TComponentsFindServiceFunctionality}

{TTUsersServiceFunctionality}

{TUsersServiceFunctionality}

{TTTransportServiceFunctionality}

{TTransportServiceFunctionality}

{TTMarketServiceFunctionality}

{TMarketServiceFunctionality}

{TTTelecomServiceFunctionality}

{TTelecomServiceFunctionality}

{TTWNDVisualizationFunctionality}

{TWNDVisualizationFunctionality}

{TTMRKVisualizationFunctionality}

{TMRKVisualizationFunctionality}

{TTOrientedPictureVisualizationFunctionality}

{TOrientedPictureVisualizationFunctionality}

{TTOrientedTTFVisualizationFunctionality}

{TOrientedTTFVisualizationFunctionality}

{TTIconFunctionality}

{TIconFunctionality}

{TTMessageBoardMessageFunctionality}

{TMessageBoardMessageFunctionality}

{TTMessageBoardFunctionality}

{TMessageBoardFunctionality}

{TTHREFFunctionality}

{THREFFunctionality}

{TTQDCVisualizationFunctionality}

{TQDCVisualizationFunctionality}

{TTOffersServerFunctionality}

{TOffersServerFunctionality}

{TTSecurityComponentOperationFunctionality}

{TSecurityComponentOperationFunctionality}

{TTSecurityKeyFunctionality}

{TSecurityKeyFunctionality}

{TTSecurityFileFunctionality}

{TSecurityFileFunctionality}

{TTSecurityComponentFunctionality}

{TSecurityComponentFunctionality}

{TTMODELUserFunctionality}

{TMODELUserFunctionality}

{TTTextureFunctionality}

{TTextureFunctionality}

{TTBuffered3DVisualizationFunctionality}

{TBuffered3DVisualizationFunctionality}

{TTDATAFileFunctionality}

{TDATAFileFunctionality}
function TDATAFileFunctionality.getDATASize: integer;
begin
Result:=RemotedFunctionality.getDATASize;
end;

procedure TDATAFileFunctionality.SetDATAByFileName(const FileName: string);
begin
RemotedFunctionality.SetDATAByFileName(FileName);
end;

function TDATAFileFunctionality.getStorageType: integer;
begin
Result:=RemotedFunctionality.getStorageType;
end;


{TTCoComponentFunctionality}

{TCoComponentFunctionality}

{TTCoComponentTypeMarkerFunctionality}

{TCoComponentTypeMarkerFunctionality}

{TTCoComponentTypeFunctionality}

{TCoComponentTypeFunctionality}

{TTAddressFunctionality}

{TAddressFunctionality}

{TTTransportRouteFunctionality}

{TTransportRouteFunctionality}

{TTTransportNodeFunctionality}

{TTransportNodeFunctionality}

{TTOfferGoodsFunctionality}

{TOfferGoodsFunctionality}

{TTTLFStationTMTFunctionality}

{TTLFStationTMTFunctionality}

{TTNameFunctionality}

{TNameFunctionality}

{TTVisualizationFunctionality}

{TVisualizationFunctionality}

{TTHREFVisualizationFunctionality}

{THREFVisualizationFunctionality}

{TTTTFVisualizationFunctionality}

{TTTFVisualizationFunctionality}

{TTObjectFunctionality}

{TObjectFunctionality}

{TTLabelFunctionality}

{TLabelFunctionality}

{TTStationFunctionality}

{TStationFunctionality}

{TTMainLineFunctionality}

{TMainLineFunctionality}

{TTDescriptionFunctionality}

{TDescriptionFunctionality}

{TTImageFunctionality}

{TImageFunctionality}

{TTWellFunctionality}

{TWellFunctionality}

{TTTLFFunctionality}

{TTLFFunctionality}

{TTBoxFunctionality}

{TBoxFunctionality}

{TTCableBoxFunctionality}

{TCableBoxFunctionality}

{TTDistrLineFunctionality}

{TDistrLineFunctionality}

{TTClientFunctionality}

{TClientFunctionality}

{TTHouseFunctionality}

{THouseFunctionality}

{TTCommNodeFunctionality}

{TCommNodeFunctionality}

{TTCrossFunctionality}

{TCrossFunctionality}

{TTCaseFunctionality}

{TCaseFunctionality}

{TTStreetFunctionality}

{TStreetFunctionality}

{TTOtherObjFunctionality}

{TOtherObjFunctionality}

{TTSpanFunctionality}

{TSpanFunctionality}

{TTChanelFunctionality}

{TChanelFunctionality}

{TTHandHoldFunctionality}

{THandHoldFunctionality}

{TTLineDistFunctionality}

{TLineDistFunctionality}

{TTMuffFunctionality}

{TMuffFunctionality}

{TTOfferFunctionality}

{TOfferFunctionality}

{TTDemandFunctionality}

{TDemandFunctionality}

{TTCommLineFunctionality}

{TCommLineFunctionality}

{TTGoodsFunctionality}

{TGoodsFunctionality}

{TTCollectionFunctionality}

{TCollectionFunctionality}

