//. functionalities soap-interfaces "Implementation" section

  function GetITTypeSOAPFunctionality(const ServerURL: WideString): ITTypeSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTypeSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTypeSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITComponentSOAPFunctionality(const ServerURL: WideString): ITComponentSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TComponentSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITComponentSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTProxyObjectSOAPFunctionality(const ServerURL: WideString): ITTProxyObjectSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTProxyObjectSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTProxyObjectSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITProxyObjectSOAPFunctionality(const ServerURL: WideString): ITProxyObjectSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TProxyObjectSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITProxyObjectSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTBaseVisualizationSOAPFunctionality(const ServerURL: WideString): ITTBaseVisualizationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTBaseVisualizationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTBaseVisualizationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITBaseVisualizationSOAPFunctionality(const ServerURL: WideString): ITBaseVisualizationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TBaseVisualizationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITBaseVisualizationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTBase2DVisualizationSOAPFunctionality(const ServerURL: WideString): ITTBase2DVisualizationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTBase2DVisualizationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTBase2DVisualizationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITBase2DVisualizationSOAPFunctionality(const ServerURL: WideString): ITBase2DVisualizationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TBase2DVisualizationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITBase2DVisualizationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITTLay2DVisualizationSOAPFunctionality(const ServerURL: WideString): ITTLay2DVisualizationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TTLay2DVisualizationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITTLay2DVisualizationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

  function GetITLay2DVisualizationSOAPFunctionality(const ServerURL: WideString): ITLay2DVisualizationSOAPFunctionality;
  var
    RIO: THTTPRIO;
    Addr: WideString;
  begin
  Result:=nil;
  Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'TLay2DVisualizationSOAPFunctionality';
  RIO:=THTTPRIO.Create(nil);
  RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
  RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
  try
  Result:=(RIO as ITLay2DVisualizationSOAPFunctionality);
  RIO.URL:=Addr;
  finally
  if (Result = nil) then RIO.Free;
  end;
  end;

