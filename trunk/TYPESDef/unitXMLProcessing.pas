Unit unitXMLProcessing;
interface
Uses
  SysUtils,
  Windows,
  Classes,
  GlobalSpaceDefines,
  unitProxySpace,
  unitReflector,
  Functionality,
  TypesFunctionality;


  procedure ProcessScript(XMLStream: TStream); stdcall;

implementation
Uses
  SyncObjs,
  msxml,
  unitProxySpaceScriptDefines;

//. XML for parsing
var
  XMLLock: TCriticalSection;
  XML: IXMLDOMDocument;


procedure ProcessXML(Space: TProxySpace; XMLStream: TStream);
var
  XMLStr: WideString;
  I: integer;
  C: Char;
  UserNode,UserNAmeNode,UserPasswordNode,NextNode: IXMLDOMNode;
  UserName: WideString;
  UserPassword: WideString;
  UserID: integer;

  procedure ProcessObj(ObjNode: IXMLDOMNode);
  var
    ObjIDNode,ObjIDidTObjNode,ObjIDidObjNode,ObjProcessNode: IXMLDOMNode;
    idTObj,idObj: integer;

    procedure CheckUserOperation(const CoOperation: TScriptCoOperation);
    begin
    Space.GlobalSpaceSecurity.CheckUserComponentOperation(UserName,UserPassword, idTObj,idObj, CoOperation.CoOpID);
    end;

    procedure Process(ProcessNode: IXMLDOMNode);
    var
      I: Integer;
      OperationNode: IXMLDOMNode;

      procedure DoObjOperation(OperationNode: IXMLDOMNode);
      var
        I: integer;
        InNode: IXMLDOMNode;
        OutNode: IXMLDOMNode;
        ExceptionNode: IXMLDOMNode;

        ObjFunctionality: TComponentFunctionality;

        function ProcessAsBase2DVisualizationFunctionality: boolean;
        var
          flUserSecurityDisabledOld: boolean;

          function ProcessAsInheritanceOfBase2DVisualizationFunctionality: boolean;
          begin
          Result:=false;
          end;

        begin
        Result:=false;
        if OperationNode.nodeName = coopVisualizationMove.Name
         then begin
          try
          CheckUserOperation(coopVisualizationMove);
          flUserSecurityDisabledOld:=ObjFunctionality.flUserSecurityDisabled;
          try
          ObjFunctionality.flUserSecurityDisabled:=true;
          if InNode.selectSingleNode('dX').selectSingleNode('Type').Text <> sidTCrd then Raise Exception.Create('type of dX mismatch'); //. =>
          if InNode.selectSingleNode('dY').selectSingleNode('Type').Text <> sidTCrd then Raise Exception.Create('type of dY mismatch'); //. =>
          TBaseVisualizationFunctionality(ObjFunctionality).Move(StrToFloat(InNode.selectSingleNode('dX').selectSingleNode('Value').Text),StrToFloat(InNode.selectSingleNode('dY').selectSingleNode('Value').Text),0);
          if OutNode.selectSingleNode('Result').selectSingleNode('Type').Text = sidBoolean then OutNode.selectSingleNode('Result').selectSingleNode('Value').Text:=BoolToStr(True,true);
          finally
          ObjFunctionality.flUserSecurityDisabled:=flUserSecurityDisabledOld;
          end;
          Result:=true;
          except
            on E: Exception do if  (ExceptionNode <> nil) AND (ExceptionNode.selectSingleNode('Type').Text = sidString) then ExceptionNode.selectSingleNode('Value').Text:=E.Message;
            end;
          end else
        if OperationNode.nodeName = coopVisualizationSetPosition.Name
         then begin
          try
          CheckUserOperation(coopVisualizationSetPosition);
          flUserSecurityDisabledOld:=ObjFunctionality.flUserSecurityDisabled;
          try
          ObjFunctionality.flUserSecurityDisabled:=true;
          if InNode.selectSingleNode('X').selectSingleNode('Type').Text <> sidTCrd then Raise Exception.Create('type of X mismatch'); //. =>
          if InNode.selectSingleNode('Y').selectSingleNode('Type').Text <> sidTCrd then Raise Exception.Create('type of Y mismatch'); //. =>
          TBaseVisualizationFunctionality(ObjFunctionality).SetPosition(StrToFloat(InNode.selectSingleNode('X').selectSingleNode('Value').Text),StrToFloat(InNode.selectSingleNode('Y').selectSingleNode('Value').Text),0);
          if OutNode.selectSingleNode('Result').selectSingleNode('Type').Text = sidBoolean then OutNode.selectSingleNode('Result').selectSingleNode('Value').Text:=BoolToStr(True,true);
          finally
          ObjFunctionality.flUserSecurityDisabled:=flUserSecurityDisabledOld;
          end;
          Result:=true;
          except
            on E: Exception do if (ExceptionNode <> nil) AND (ExceptionNode.selectSingleNode('Type').Text = sidString) then ExceptionNode.selectSingleNode('Value').Text:=E.Message;
            end;
          end
         else
          if NOT ProcessAsInheritanceOfBase2DVisualizationFunctionality then if OutNode.selectSingleNode('Result').selectSingleNode('Type').Text = sidBoolean then OutNode.selectSingleNode('Result').selectSingleNode('Value').Text:=BoolToStr(False,true);
        end;

      begin
      //.
      InNode:=nil;
      OutNode:=nil;
      ExceptionNode:=nil;
      for I:=0 to 2 do
        if OperationNode.childNodes[I] <> nil
         then
           if OperationNode.childNodes[I].nodeName = 'In'
            then
             InNode:=OperationNode.childNodes[I]
            else
             if OperationNode.childNodes[I].nodeName = 'Out'
              then
               OutNode:=OperationNode.childNodes[I]
              else
               if OperationNode.childNodes[I].nodeName = 'Exception'
                then
                 ExceptionNode:=OperationNode.childNodes[I];
      //.
      ObjFunctionality:=TComponentFunctionality_Create(idTObj,idObj);
      try
      if ObjectIsInheritedFrom(ObjFunctionality,TBase2DVisualizationFunctionality) then ProcessAsBase2DVisualizationFunctionality else

      finally
      ObjFunctionality.Release;
      end;
      end;

    begin
    I:=0;
    repeat
      OperationNode:=ProcessNode.childNodes[I];
      if OperationNode = nil then Exit; //. ->
      //. process obj operation
      DoObjOperation(OperationNode);
      //.
      Inc(I);
    until false;
    end;

  begin
  //. get obj ID
  ObjIDNode:=ObjNode.childNodes[0];
  if ObjIDNode = nil then Raise Exception.Create('could not get ObjID-node'); //. =>
    //. get obj type
    ObjIDidTObjNode:=ObjIDNode.childNodes[0];
    if (ObjIDidTObjNode = nil) OR (ObjIDidTObjNode.nodeName <> 'idTObj') then Raise Exception.Create('could not get ObjIDidTObj-node'); //. =>
    idTObj:=StrToInt(ObjIDidTObjNode.Text);
    //. get obj id
    ObjIDidObjNode:=ObjIDNode.childNodes[1];
    if (ObjIDidObjNode = nil) OR (ObjIDidObjNode.nodeName <> 'idObj') then Raise Exception.Create('could not get ObjIDidObj-node'); //. =>
    idObj:=StrToInt(ObjIDidObjNode.Text);
  //. get obj process
  ObjProcessNode:=ObjNode.childNodes[1];
  if ObjProcessNode = nil then Raise Exception.Create('could not get ObjProcess-node'); //. =>
  Process(ObjProcessNode);
  end;

  procedure Process(ProcessNode: IXMLDOMNode);
  var
    I: integer;
    OperationNode: IXMLDOMNode;

    procedure DoOperation(OperationNode: IXMLDOMNode);
    var
      I: integer;
      InNode: IXMLDOMNode;
      OutNode: IXMLDOMNode;
      ExceptionNode: IXMLDOMNode;

      BeepToneNode,BeepToneTypeNode,BeepToneValueNode: IXMLDOMNode;
      BeepDurNode,BeepDurTypeNode,BeepDurValueNode: IXMLDOMNode;
    begin
    //.
    InNode:=nil;
    OutNode:=nil;
    ExceptionNode:=nil;
    for I:=0 to 2 do
      if OperationNode.childNodes[I] <> nil
       then
         if OperationNode.childNodes[I].nodeName = 'In'
          then
           InNode:=OperationNode.childNodes[I]
          else
           if OperationNode.childNodes[I].nodeName = 'Out'
            then
             OutNode:=OperationNode.childNodes[I]
            else
             if OperationNode.childNodes[I].nodeName = 'Exception'
              then
               ExceptionNode:=OperationNode.childNodes[I];
    //.
    if OperationNode.nodeName = 'Beep'
     then begin
      if InNode <> nil
       then begin
        //. get beep tone
        BeepToneNode:=InNode.childNodes[0];
        if (BeepToneNode = nil) OR (BeepToneNode.nodeName <> 'Tone') then Raise Exception.Create('could not get beeptone-node'); //. =>
        BeepToneTypeNode:=BeepToneNode.childNodes[0];
        if (BeepToneTypeNode = nil) OR (BeepToneTypeNode.Text <> 'Integer') then Raise Exception.Create('could not get beeptonetype-node'); //. =>
        BeepToneValueNode:=BeepToneNode.childNodes[1];
        if (BeepToneValueNode = nil) then Raise Exception.Create('could not get beeptonevalue-node'); //. =>
        //. get beep Dur
        BeepDurNode:=InNode.childNodes[1];
        if (BeepDurNode = nil) OR (BeepDurNode.nodeName <> 'Dur') then Raise Exception.Create('could not get beeptone-node'); //. =>
        BeepDurTypeNode:=BeepDurNode.childNodes[0];
        if (BeepDurTypeNode = nil) OR (BeepDurTypeNode.Text <> 'Integer') then Raise Exception.Create('could not get beepDurtype-node'); //. =>
        BeepDurValueNode:=BeepDurNode.childNodes[1];
        if (BeepDurValueNode = nil) then Raise Exception.Create('could not get beepdurvalue-node'); //. =>
        //. beep
        Beep(StrToInt(BeepToneValueNode.Text),StrToInt(BeepDurValueNode.Text));
        end;
      end;
    end;
    
  begin
  I:=0;
  repeat
    OperationNode:=ProcessNode.childNodes[I];
    if OperationNode = nil then Exit; //. ->
    //. process obj operation
    DoOperation(OperationNode);
    //.
    Inc(I);
  until false;
  end;

begin
XMLLock.Enter;
try
if XML = nil then XML:=CoDOMDocument.Create;
//. load xml
XMLStr:='';
XMLStream.Position:=0;
for I:=0 to XMLStream.Size-1 do begin
  XMLStream.Read(C,SizeOf(C));
  XMLStr:=XMLStr+C;
  end;
XML.loadXML(XMLStr);
//.
if XML.documentElement.tagName <> 'ProxySpaceScript' then Raise Exception.Create('wrong root element'); //. =>
if XML.documentElement.hasChildNodes
 then begin
  UserNode:=XML.documentElement.childNodes[0];
  if UserNode = nil then Raise Exception.Create('could not get user-node'); //. =>
    //. get user name
    UserNameNode:=UserNode.childNodes[0];
    if (UserNameNode = nil) OR (UserNameNode.nodeName <> 'Name') then Raise Exception.Create('could not get username-node'); //. =>
    UserName:=UserNameNode.Text;
    //. get user password
    UserPasswordNode:=UserNode.childNodes[1];
    if (UserPasswordNode = nil) OR (UserPasswordNode.nodeName <> 'Password') then Raise Exception.Create('could not get userpassword-node'); //. =>
    UserPassword:=UserPasswordNode.Text;
    //. check user for existance
    Space.GlobalSpaceSecurity.CheckUser(UserName,UserPassword, UserID);
    //.
  I:=1;
  repeat
    NextNode:=XML.documentElement.childNodes[I];
    if NextNode = nil then Break; //. >
    //. process next node
    if NextNode.nodeName = 'Obj'
     then ProcessObj(NextNode)
     else Process(NextNode);
    //.
    Inc(I);
  until false;
  end;
//. save xml
XMLStr:=XML.xml;
XMLStream.Position:=0;
for I:=1 to Length(XMLStr) do begin
  C:=Char(XMLStr[I]);
  XMLStream.Write(C,SizeOf(C));
  end;
//.
XML:=nil;
finally
XMLLock.Leave;
end;
end;

procedure ProcessScript(XMLStream: TStream);
begin
ProcessXML(TypesSystem.Space, XMLStream);
end;


Initialization
XMLLock:=TCriticalSection.Create;

Finalization
XML:=nil;
XMLLock.Free;



end.



