//. types functionalities soap-interfaces "Implementation" section

  function GetITTTileServerVisualizationSOAPFunctionality(const ServerURL: WideString): ITTTileServerVisualizationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTTileServerVisualizationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTTileServerVisualizationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTileServerVisualizationSOAPFunctionality(const ServerURL: WideString): ITTileServerVisualizationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTileServerVisualizationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTileServerVisualizationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTMeasurementObjectSOAPFunctionality(const ServerURL: WideString): ITTMeasurementObjectSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTMeasurementObjectSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTMeasurementObjectSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITMeasurementObjectSOAPFunctionality(const ServerURL: WideString): ITMeasurementObjectSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TMeasurementObjectSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITMeasurementObjectSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTAreaNotificationServerSOAPFunctionality(const ServerURL: WideString): ITTAreaNotificationServerSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTAreaNotificationServerSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTAreaNotificationServerSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITAreaNotificationServerSOAPFunctionality(const ServerURL: WideString): ITAreaNotificationServerSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TAreaNotificationServerSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITAreaNotificationServerSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTMODELServerVisualizationSOAPFunctionality(const ServerURL: WideString): ITTMODELServerVisualizationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTMODELServerVisualizationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTMODELServerVisualizationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITMODELServerVisualizationSOAPFunctionality(const ServerURL: WideString): ITMODELServerVisualizationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TMODELServerVisualizationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITMODELServerVisualizationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTDoubleVarSOAPFunctionality(const ServerURL: WideString): ITTDoubleVarSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTDoubleVarSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTDoubleVarSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITDoubleVarSOAPFunctionality(const ServerURL: WideString): ITDoubleVarSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TDoubleVarSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITDoubleVarSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTInt32VarSOAPFunctionality(const ServerURL: WideString): ITTInt32VarSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTInt32VarSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTInt32VarSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITInt32VarSOAPFunctionality(const ServerURL: WideString): ITInt32VarSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TInt32VarSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITInt32VarSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTURLSOAPFunctionality(const ServerURL: WideString): ITTURLSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTURLSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTURLSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITURLSOAPFunctionality(const ServerURL: WideString): ITURLSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TURLSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITURLSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTPatternVisualizationSOAPFunctionality(const ServerURL: WideString): ITTPatternVisualizationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTPatternVisualizationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTPatternVisualizationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITPatternVisualizationSOAPFunctionality(const ServerURL: WideString): ITPatternVisualizationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TPatternVisualizationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITPatternVisualizationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTMapFormatObjectSOAPFunctionality(const ServerURL: WideString): ITTMapFormatObjectSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTMapFormatObjectSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTMapFormatObjectSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITMapFormatObjectSOAPFunctionality(const ServerURL: WideString): ITMapFormatObjectSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TMapFormatObjectSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITMapFormatObjectSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTMapFormatMapSOAPFunctionality(const ServerURL: WideString): ITTMapFormatMapSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTMapFormatMapSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTMapFormatMapSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITMapFormatMapSOAPFunctionality(const ServerURL: WideString): ITMapFormatMapSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TMapFormatMapSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITMapFormatMapSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTSPLVisualizationSOAPFunctionality(const ServerURL: WideString): ITTSPLVisualizationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTSPLVisualizationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTSPLVisualizationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITSPLVisualizationSOAPFunctionality(const ServerURL: WideString): ITSPLVisualizationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TSPLVisualizationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITSPLVisualizationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTBoolVarSOAPFunctionality(const ServerURL: WideString): ITTBoolVarSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTBoolVarSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTBoolVarSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITBoolVarSOAPFunctionality(const ServerURL: WideString): ITBoolVarSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TBoolVarSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITBoolVarSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTGeoSpaceSOAPFunctionality(const ServerURL: WideString): ITTGeoSpaceSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTGeoSpaceSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTGeoSpaceSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITGeoSpaceSOAPFunctionality(const ServerURL: WideString): ITGeoSpaceSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TGeoSpaceSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITGeoSpaceSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTUserAlertSOAPFunctionality(const ServerURL: WideString): ITTUserAlertSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTUserAlertSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTUserAlertSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITUserAlertSOAPFunctionality(const ServerURL: WideString): ITUserAlertSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TUserAlertSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITUserAlertSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTGeoGraphServerObjectSOAPFunctionality(const ServerURL: WideString): ITTGeoGraphServerObjectSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTGeoGraphServerObjectSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTGeoGraphServerObjectSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITGeoGraphServerObjectSOAPFunctionality(const ServerURL: WideString): ITGeoGraphServerObjectSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TGeoGraphServerObjectSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITGeoGraphServerObjectSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTGeoGraphServerSOAPFunctionality(const ServerURL: WideString): ITTGeoGraphServerSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTGeoGraphServerSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTGeoGraphServerSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITGeoGraphServerSOAPFunctionality(const ServerURL: WideString): ITGeoGraphServerSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TGeoGraphServerSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITGeoGraphServerSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTGeoCrdSystemSOAPFunctionality(const ServerURL: WideString): ITTGeoCrdSystemSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTGeoCrdSystemSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTGeoCrdSystemSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITGeoCrdSystemSOAPFunctionality(const ServerURL: WideString): ITGeoCrdSystemSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TGeoCrdSystemSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITGeoCrdSystemSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTFilterVisualizationSOAPFunctionality(const ServerURL: WideString): ITTFilterVisualizationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTFilterVisualizationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTFilterVisualizationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITFilterVisualizationSOAPFunctionality(const ServerURL: WideString): ITFilterVisualizationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TFilterVisualizationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITFilterVisualizationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTHINTVisualizationSOAPFunctionality(const ServerURL: WideString): ITTHINTVisualizationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTHINTVisualizationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTHINTVisualizationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITHINTVisualizationSOAPFunctionality(const ServerURL: WideString): ITHINTVisualizationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'THINTVisualizationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITHINTVisualizationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTDetailedPictureVisualizationSOAPFunctionality(const ServerURL: WideString): ITTDetailedPictureVisualizationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTDetailedPictureVisualizationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTDetailedPictureVisualizationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITDetailedPictureVisualizationSOAPFunctionality(const ServerURL: WideString): ITDetailedPictureVisualizationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TDetailedPictureVisualizationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITDetailedPictureVisualizationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTCoVisualizationSOAPFunctionality(const ServerURL: WideString): ITTCoVisualizationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTCoVisualizationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTCoVisualizationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITCoVisualizationSOAPFunctionality(const ServerURL: WideString): ITCoVisualizationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TCoVisualizationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITCoVisualizationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTForumMessageSOAPFunctionality(const ServerURL: WideString): ITTForumMessageSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTForumMessageSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTForumMessageSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITForumMessageSOAPFunctionality(const ServerURL: WideString): ITForumMessageSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TForumMessageSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITForumMessageSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTForumSOAPFunctionality(const ServerURL: WideString): ITTForumSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTForumSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTForumSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITForumSOAPFunctionality(const ServerURL: WideString): ITForumSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TForumSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITForumSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTCUSTOMVisualizationSOAPFunctionality(const ServerURL: WideString): ITTCUSTOMVisualizationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTCUSTOMVisualizationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTCUSTOMVisualizationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITCUSTOMVisualizationSOAPFunctionality(const ServerURL: WideString): ITCUSTOMVisualizationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TCUSTOMVisualizationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITCUSTOMVisualizationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTOLEVisualizationSOAPFunctionality(const ServerURL: WideString): ITTOLEVisualizationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTOLEVisualizationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTOLEVisualizationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITOLEVisualizationSOAPFunctionality(const ServerURL: WideString): ITOLEVisualizationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TOLEVisualizationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITOLEVisualizationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTHTMLVisualizationSOAPFunctionality(const ServerURL: WideString): ITTHTMLVisualizationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTHTMLVisualizationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTHTMLVisualizationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITHTMLVisualizationSOAPFunctionality(const ServerURL: WideString): ITHTMLVisualizationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'THTMLVisualizationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITHTMLVisualizationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTBZRVisualizationSOAPFunctionality(const ServerURL: WideString): ITTBZRVisualizationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTBZRVisualizationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTBZRVisualizationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITBZRVisualizationSOAPFunctionality(const ServerURL: WideString): ITBZRVisualizationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TBZRVisualizationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITBZRVisualizationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTAGIFVisualizationSOAPFunctionality(const ServerURL: WideString): ITTAGIFVisualizationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTAGIFVisualizationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTAGIFVisualizationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITAGIFVisualizationSOAPFunctionality(const ServerURL: WideString): ITAGIFVisualizationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TAGIFVisualizationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITAGIFVisualizationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTOrientedVIDEOVisualizationSOAPFunctionality(const ServerURL: WideString): ITTOrientedVIDEOVisualizationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTOrientedVIDEOVisualizationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTOrientedVIDEOVisualizationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITOrientedVIDEOVisualizationSOAPFunctionality(const ServerURL: WideString): ITOrientedVIDEOVisualizationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TOrientedVIDEOVisualizationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITOrientedVIDEOVisualizationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTVIDEOVisualizationSOAPFunctionality(const ServerURL: WideString): ITTVIDEOVisualizationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTVIDEOVisualizationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTVIDEOVisualizationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITVIDEOVisualizationSOAPFunctionality(const ServerURL: WideString): ITVIDEOVisualizationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TVIDEOVisualizationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITVIDEOVisualizationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTOPPVisualizationSOAPFunctionality(const ServerURL: WideString): ITTOPPVisualizationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTOPPVisualizationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTOPPVisualizationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITOPPVisualizationSOAPFunctionality(const ServerURL: WideString): ITOPPVisualizationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TOPPVisualizationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITOPPVisualizationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTMODELServerSOAPFunctionality(const ServerURL: WideString): ITTMODELServerSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTMODELServerSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTMODELServerSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITMODELServerSOAPFunctionality(const ServerURL: WideString): ITMODELServerSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TMODELServerSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITMODELServerSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTCoReferenceSOAPFunctionality(const ServerURL: WideString): ITTCoReferenceSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTCoReferenceSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTCoReferenceSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITCoReferenceSOAPFunctionality(const ServerURL: WideString): ITCoReferenceSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TCoReferenceSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITCoReferenceSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTPositionerSOAPFunctionality(const ServerURL: WideString): ITTPositionerSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTPositionerSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTPositionerSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITPositionerSOAPFunctionality(const ServerURL: WideString): ITPositionerSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TPositionerSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITPositionerSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTOrientedWMFVisualizationSOAPFunctionality(const ServerURL: WideString): ITTOrientedWMFVisualizationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTOrientedWMFVisualizationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTOrientedWMFVisualizationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITOrientedWMFVisualizationSOAPFunctionality(const ServerURL: WideString): ITOrientedWMFVisualizationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TOrientedWMFVisualizationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITOrientedWMFVisualizationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTCELLVisualizationSOAPFunctionality(const ServerURL: WideString): ITTCELLVisualizationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTCELLVisualizationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTCELLVisualizationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITCELLVisualizationSOAPFunctionality(const ServerURL: WideString): ITCELLVisualizationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TCELLVisualizationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITCELLVisualizationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTEllipseVisualizationSOAPFunctionality(const ServerURL: WideString): ITTEllipseVisualizationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTEllipseVisualizationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTEllipseVisualizationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITEllipseVisualizationSOAPFunctionality(const ServerURL: WideString): ITEllipseVisualizationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TEllipseVisualizationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITEllipseVisualizationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTWMFVisualizationSOAPFunctionality(const ServerURL: WideString): ITTWMFVisualizationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTWMFVisualizationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTWMFVisualizationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITWMFVisualizationSOAPFunctionality(const ServerURL: WideString): ITWMFVisualizationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TWMFVisualizationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITWMFVisualizationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTPictureVisualizationSOAPFunctionality(const ServerURL: WideString): ITTPictureVisualizationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTPictureVisualizationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTPictureVisualizationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITPictureVisualizationSOAPFunctionality(const ServerURL: WideString): ITPictureVisualizationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TPictureVisualizationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITPictureVisualizationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTRoundVisualizationSOAPFunctionality(const ServerURL: WideString): ITTRoundVisualizationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTRoundVisualizationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTRoundVisualizationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITRoundVisualizationSOAPFunctionality(const ServerURL: WideString): ITRoundVisualizationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TRoundVisualizationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITRoundVisualizationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTGeodesyPointSOAPFunctionality(const ServerURL: WideString): ITTGeodesyPointSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTGeodesyPointSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTGeodesyPointSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITGeodesyPointSOAPFunctionality(const ServerURL: WideString): ITGeodesyPointSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TGeodesyPointSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITGeodesyPointSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTPrivateAreaVisualizationSOAPFunctionality(const ServerURL: WideString): ITTPrivateAreaVisualizationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTPrivateAreaVisualizationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTPrivateAreaVisualizationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITPrivateAreaVisualizationSOAPFunctionality(const ServerURL: WideString): ITPrivateAreaVisualizationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TPrivateAreaVisualizationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITPrivateAreaVisualizationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTHyperTextSOAPFunctionality(const ServerURL: WideString): ITTHyperTextSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTHyperTextSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTHyperTextSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITHyperTextSOAPFunctionality(const ServerURL: WideString): ITHyperTextSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'THyperTextSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITHyperTextSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTComponentsFindServiceSOAPFunctionality(const ServerURL: WideString): ITTComponentsFindServiceSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTComponentsFindServiceSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTComponentsFindServiceSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITComponentsFindServiceSOAPFunctionality(const ServerURL: WideString): ITComponentsFindServiceSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TComponentsFindServiceSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITComponentsFindServiceSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTUsersServiceSOAPFunctionality(const ServerURL: WideString): ITTUsersServiceSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTUsersServiceSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTUsersServiceSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITUsersServiceSOAPFunctionality(const ServerURL: WideString): ITUsersServiceSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TUsersServiceSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITUsersServiceSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTTransportServiceSOAPFunctionality(const ServerURL: WideString): ITTTransportServiceSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTTransportServiceSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTTransportServiceSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTransportServiceSOAPFunctionality(const ServerURL: WideString): ITTransportServiceSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTransportServiceSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTransportServiceSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTMarketServiceSOAPFunctionality(const ServerURL: WideString): ITTMarketServiceSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTMarketServiceSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTMarketServiceSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITMarketServiceSOAPFunctionality(const ServerURL: WideString): ITMarketServiceSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TMarketServiceSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITMarketServiceSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTTelecomServiceSOAPFunctionality(const ServerURL: WideString): ITTTelecomServiceSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTTelecomServiceSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTTelecomServiceSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTelecomServiceSOAPFunctionality(const ServerURL: WideString): ITTelecomServiceSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTelecomServiceSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTelecomServiceSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTWNDVisualizationSOAPFunctionality(const ServerURL: WideString): ITTWNDVisualizationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTWNDVisualizationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTWNDVisualizationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITWNDVisualizationSOAPFunctionality(const ServerURL: WideString): ITWNDVisualizationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TWNDVisualizationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITWNDVisualizationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTMRKVisualizationSOAPFunctionality(const ServerURL: WideString): ITTMRKVisualizationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTMRKVisualizationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTMRKVisualizationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITMRKVisualizationSOAPFunctionality(const ServerURL: WideString): ITMRKVisualizationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TMRKVisualizationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITMRKVisualizationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTOrientedPictureVisualizationSOAPFunctionality(const ServerURL: WideString): ITTOrientedPictureVisualizationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTOrientedPictureVisualizationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTOrientedPictureVisualizationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITOrientedPictureVisualizationSOAPFunctionality(const ServerURL: WideString): ITOrientedPictureVisualizationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TOrientedPictureVisualizationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITOrientedPictureVisualizationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTOrientedTTFVisualizationSOAPFunctionality(const ServerURL: WideString): ITTOrientedTTFVisualizationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTOrientedTTFVisualizationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTOrientedTTFVisualizationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITOrientedTTFVisualizationSOAPFunctionality(const ServerURL: WideString): ITOrientedTTFVisualizationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TOrientedTTFVisualizationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITOrientedTTFVisualizationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTIconSOAPFunctionality(const ServerURL: WideString): ITTIconSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTIconSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTIconSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITIconSOAPFunctionality(const ServerURL: WideString): ITIconSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TIconSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITIconSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTMessageBoardMessageSOAPFunctionality(const ServerURL: WideString): ITTMessageBoardMessageSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTMessageBoardMessageSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTMessageBoardMessageSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITMessageBoardMessageSOAPFunctionality(const ServerURL: WideString): ITMessageBoardMessageSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TMessageBoardMessageSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITMessageBoardMessageSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTMessageBoardSOAPFunctionality(const ServerURL: WideString): ITTMessageBoardSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTMessageBoardSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTMessageBoardSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITMessageBoardSOAPFunctionality(const ServerURL: WideString): ITMessageBoardSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TMessageBoardSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITMessageBoardSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTHREFSOAPFunctionality(const ServerURL: WideString): ITTHREFSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTHREFSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTHREFSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITHREFSOAPFunctionality(const ServerURL: WideString): ITHREFSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'THREFSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITHREFSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTQDCVisualizationSOAPFunctionality(const ServerURL: WideString): ITTQDCVisualizationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTQDCVisualizationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTQDCVisualizationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITQDCVisualizationSOAPFunctionality(const ServerURL: WideString): ITQDCVisualizationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TQDCVisualizationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITQDCVisualizationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTOffersServerSOAPFunctionality(const ServerURL: WideString): ITTOffersServerSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTOffersServerSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTOffersServerSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITOffersServerSOAPFunctionality(const ServerURL: WideString): ITOffersServerSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TOffersServerSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITOffersServerSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTSecurityComponentOperationSOAPFunctionality(const ServerURL: WideString): ITTSecurityComponentOperationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTSecurityComponentOperationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTSecurityComponentOperationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITSecurityComponentOperationSOAPFunctionality(const ServerURL: WideString): ITSecurityComponentOperationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TSecurityComponentOperationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITSecurityComponentOperationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTSecurityKeySOAPFunctionality(const ServerURL: WideString): ITTSecurityKeySOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTSecurityKeySOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTSecurityKeySOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITSecurityKeySOAPFunctionality(const ServerURL: WideString): ITSecurityKeySOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TSecurityKeySOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITSecurityKeySOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTSecurityFileSOAPFunctionality(const ServerURL: WideString): ITTSecurityFileSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTSecurityFileSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTSecurityFileSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITSecurityFileSOAPFunctionality(const ServerURL: WideString): ITSecurityFileSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TSecurityFileSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITSecurityFileSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTSecurityComponentSOAPFunctionality(const ServerURL: WideString): ITTSecurityComponentSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTSecurityComponentSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTSecurityComponentSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITSecurityComponentSOAPFunctionality(const ServerURL: WideString): ITSecurityComponentSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TSecurityComponentSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITSecurityComponentSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTMODELUserSOAPFunctionality(const ServerURL: WideString): ITTMODELUserSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTMODELUserSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTMODELUserSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITMODELUserSOAPFunctionality(const ServerURL: WideString): ITMODELUserSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TMODELUserSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITMODELUserSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTTextureSOAPFunctionality(const ServerURL: WideString): ITTTextureSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTTextureSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTTextureSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTextureSOAPFunctionality(const ServerURL: WideString): ITTextureSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTextureSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTextureSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTBuffered3DVisualizationSOAPFunctionality(const ServerURL: WideString): ITTBuffered3DVisualizationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTBuffered3DVisualizationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTBuffered3DVisualizationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITBuffered3DVisualizationSOAPFunctionality(const ServerURL: WideString): ITBuffered3DVisualizationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TBuffered3DVisualizationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITBuffered3DVisualizationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTDATAFileSOAPFunctionality(const ServerURL: WideString): ITTDATAFileSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTDATAFileSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTDATAFileSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITDATAFileSOAPFunctionality(const ServerURL: WideString): ITDATAFileSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TDATAFileSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITDATAFileSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTCoComponentSOAPFunctionality(const ServerURL: WideString): ITTCoComponentSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTCoComponentSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTCoComponentSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITCoComponentSOAPFunctionality(const ServerURL: WideString): ITCoComponentSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TCoComponentSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITCoComponentSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTCoComponentTypeMarkerSOAPFunctionality(const ServerURL: WideString): ITTCoComponentTypeMarkerSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTCoComponentTypeMarkerSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTCoComponentTypeMarkerSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITCoComponentTypeMarkerSOAPFunctionality(const ServerURL: WideString): ITCoComponentTypeMarkerSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TCoComponentTypeMarkerSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITCoComponentTypeMarkerSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTCoComponentTypeSOAPFunctionality(const ServerURL: WideString): ITTCoComponentTypeSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTCoComponentTypeSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTCoComponentTypeSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITCoComponentTypeSOAPFunctionality(const ServerURL: WideString): ITCoComponentTypeSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TCoComponentTypeSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITCoComponentTypeSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTAddressSOAPFunctionality(const ServerURL: WideString): ITTAddressSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTAddressSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTAddressSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITAddressSOAPFunctionality(const ServerURL: WideString): ITAddressSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TAddressSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITAddressSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTTransportRouteSOAPFunctionality(const ServerURL: WideString): ITTTransportRouteSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTTransportRouteSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTTransportRouteSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTransportRouteSOAPFunctionality(const ServerURL: WideString): ITTransportRouteSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTransportRouteSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTransportRouteSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTTransportNodeSOAPFunctionality(const ServerURL: WideString): ITTTransportNodeSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTTransportNodeSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTTransportNodeSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTransportNodeSOAPFunctionality(const ServerURL: WideString): ITTransportNodeSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTransportNodeSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTransportNodeSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTOfferGoodsSOAPFunctionality(const ServerURL: WideString): ITTOfferGoodsSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTOfferGoodsSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTOfferGoodsSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITOfferGoodsSOAPFunctionality(const ServerURL: WideString): ITOfferGoodsSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TOfferGoodsSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITOfferGoodsSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTTLFStationTMTSOAPFunctionality(const ServerURL: WideString): ITTTLFStationTMTSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTTLFStationTMTSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTTLFStationTMTSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTLFStationTMTSOAPFunctionality(const ServerURL: WideString): ITTLFStationTMTSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTLFStationTMTSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTLFStationTMTSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTNameSOAPFunctionality(const ServerURL: WideString): ITTNameSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTNameSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTNameSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITNameSOAPFunctionality(const ServerURL: WideString): ITNameSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TNameSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITNameSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTVisualizationSOAPFunctionality(const ServerURL: WideString): ITTVisualizationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTVisualizationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTVisualizationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITVisualizationSOAPFunctionality(const ServerURL: WideString): ITVisualizationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TVisualizationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITVisualizationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTHREFVisualizationSOAPFunctionality(const ServerURL: WideString): ITTHREFVisualizationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTHREFVisualizationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTHREFVisualizationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITHREFVisualizationSOAPFunctionality(const ServerURL: WideString): ITHREFVisualizationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'THREFVisualizationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITHREFVisualizationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTTTFVisualizationSOAPFunctionality(const ServerURL: WideString): ITTTTFVisualizationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTTTFVisualizationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTTTFVisualizationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTTFVisualizationSOAPFunctionality(const ServerURL: WideString): ITTTFVisualizationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTTFVisualizationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTTFVisualizationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTObjectSOAPFunctionality(const ServerURL: WideString): ITTObjectSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTObjectSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTObjectSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITObjectSOAPFunctionality(const ServerURL: WideString): ITObjectSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TObjectSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITObjectSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTLabelSOAPFunctionality(const ServerURL: WideString): ITTLabelSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTLabelSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTLabelSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITLabelSOAPFunctionality(const ServerURL: WideString): ITLabelSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TLabelSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITLabelSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTStationSOAPFunctionality(const ServerURL: WideString): ITTStationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTStationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTStationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITStationSOAPFunctionality(const ServerURL: WideString): ITStationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TStationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITStationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTMainLineSOAPFunctionality(const ServerURL: WideString): ITTMainLineSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTMainLineSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTMainLineSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITMainLineSOAPFunctionality(const ServerURL: WideString): ITMainLineSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TMainLineSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITMainLineSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTDescriptionSOAPFunctionality(const ServerURL: WideString): ITTDescriptionSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTDescriptionSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTDescriptionSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITDescriptionSOAPFunctionality(const ServerURL: WideString): ITDescriptionSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TDescriptionSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITDescriptionSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTImageSOAPFunctionality(const ServerURL: WideString): ITTImageSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTImageSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTImageSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITImageSOAPFunctionality(const ServerURL: WideString): ITImageSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TImageSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITImageSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTWellSOAPFunctionality(const ServerURL: WideString): ITTWellSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTWellSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTWellSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITWellSOAPFunctionality(const ServerURL: WideString): ITWellSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TWellSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITWellSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTTLFSOAPFunctionality(const ServerURL: WideString): ITTTLFSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTTLFSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTTLFSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTLFSOAPFunctionality(const ServerURL: WideString): ITTLFSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTLFSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTLFSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTBoxSOAPFunctionality(const ServerURL: WideString): ITTBoxSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTBoxSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTBoxSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITBoxSOAPFunctionality(const ServerURL: WideString): ITBoxSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TBoxSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITBoxSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTCableBoxSOAPFunctionality(const ServerURL: WideString): ITTCableBoxSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTCableBoxSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTCableBoxSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITCableBoxSOAPFunctionality(const ServerURL: WideString): ITCableBoxSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TCableBoxSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITCableBoxSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTDistrLineSOAPFunctionality(const ServerURL: WideString): ITTDistrLineSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTDistrLineSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTDistrLineSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITDistrLineSOAPFunctionality(const ServerURL: WideString): ITDistrLineSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TDistrLineSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITDistrLineSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTClientSOAPFunctionality(const ServerURL: WideString): ITTClientSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTClientSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTClientSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITClientSOAPFunctionality(const ServerURL: WideString): ITClientSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TClientSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITClientSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTHouseSOAPFunctionality(const ServerURL: WideString): ITTHouseSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTHouseSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTHouseSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITHouseSOAPFunctionality(const ServerURL: WideString): ITHouseSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'THouseSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITHouseSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTCommNodeSOAPFunctionality(const ServerURL: WideString): ITTCommNodeSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTCommNodeSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTCommNodeSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITCommNodeSOAPFunctionality(const ServerURL: WideString): ITCommNodeSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TCommNodeSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITCommNodeSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTCrossSOAPFunctionality(const ServerURL: WideString): ITTCrossSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTCrossSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTCrossSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITCrossSOAPFunctionality(const ServerURL: WideString): ITCrossSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TCrossSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITCrossSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTCaseSOAPFunctionality(const ServerURL: WideString): ITTCaseSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTCaseSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTCaseSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITCaseSOAPFunctionality(const ServerURL: WideString): ITCaseSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TCaseSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITCaseSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTStreetSOAPFunctionality(const ServerURL: WideString): ITTStreetSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTStreetSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTStreetSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITStreetSOAPFunctionality(const ServerURL: WideString): ITStreetSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TStreetSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITStreetSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTOtherObjSOAPFunctionality(const ServerURL: WideString): ITTOtherObjSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTOtherObjSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTOtherObjSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITOtherObjSOAPFunctionality(const ServerURL: WideString): ITOtherObjSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TOtherObjSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITOtherObjSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTSpanSOAPFunctionality(const ServerURL: WideString): ITTSpanSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTSpanSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTSpanSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITSpanSOAPFunctionality(const ServerURL: WideString): ITSpanSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TSpanSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITSpanSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTChanelSOAPFunctionality(const ServerURL: WideString): ITTChanelSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTChanelSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTChanelSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITChanelSOAPFunctionality(const ServerURL: WideString): ITChanelSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TChanelSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITChanelSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTHandHoldSOAPFunctionality(const ServerURL: WideString): ITTHandHoldSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTHandHoldSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTHandHoldSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITHandHoldSOAPFunctionality(const ServerURL: WideString): ITHandHoldSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'THandHoldSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITHandHoldSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTLineDistSOAPFunctionality(const ServerURL: WideString): ITTLineDistSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTLineDistSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTLineDistSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITLineDistSOAPFunctionality(const ServerURL: WideString): ITLineDistSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TLineDistSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITLineDistSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTMuffSOAPFunctionality(const ServerURL: WideString): ITTMuffSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTMuffSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTMuffSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITMuffSOAPFunctionality(const ServerURL: WideString): ITMuffSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TMuffSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITMuffSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTOfferSOAPFunctionality(const ServerURL: WideString): ITTOfferSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTOfferSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTOfferSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITOfferSOAPFunctionality(const ServerURL: WideString): ITOfferSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TOfferSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITOfferSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTDemandSOAPFunctionality(const ServerURL: WideString): ITTDemandSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTDemandSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTDemandSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITDemandSOAPFunctionality(const ServerURL: WideString): ITDemandSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TDemandSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITDemandSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTCommLineSOAPFunctionality(const ServerURL: WideString): ITTCommLineSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTCommLineSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTCommLineSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITCommLineSOAPFunctionality(const ServerURL: WideString): ITCommLineSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TCommLineSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITCommLineSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTGoodsSOAPFunctionality(const ServerURL: WideString): ITTGoodsSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTGoodsSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTGoodsSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITGoodsSOAPFunctionality(const ServerURL: WideString): ITGoodsSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TGoodsSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITGoodsSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTCollectionSOAPFunctionality(const ServerURL: WideString): ITTCollectionSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTCollectionSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTCollectionSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITCollectionSOAPFunctionality(const ServerURL: WideString): ITCollectionSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TCollectionSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITCollectionSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

