unit unitProxySpaceScriptDefines;
interface

Type
  TScriptOperation = packed record
    Name: shortstring;
  end;

  TScriptCoOperation = packed record
    Name: shortstring;
    CoOpID: integer;
  end;

const
  //. user component operations (tranferred from SecurityComponentOperations table)
  idCreateOperation = 1;
  idDestroyOperation = 2;
  idReadOperation = 3;
  idWriteOperation = 4;
  idCloneOperation = 5;
  idExecuteOperation = 6;



//. tokens

Const

  //. just operations
  opDelay: TScriptOperation = (Name: 'Delay');

  //. ccomponent operations
  coopVisualizationSetPosition: TScriptCoOperation = (Name: 'SetPosition'; CoOpID: idWriteOperation);
  coopVisualizationMove: TScriptCoOperation = (Name: 'Move'; CoOpID: idWriteOperation);



//. types and types tokens

const
  sidBoolean = 'Boolean';
  sidInteger = 'Integer';
  sidExtended = 'Extended';
  sidString = 'String';
  sidWideString = 'WideString';

//. dont change transferred from GlobalSpaceDefines
type
  TCrd = Real48;
const
  sidTCrd = 'TCrd';

//. dont change transferred from GlobalSpaceDefines
type
  TPtr = Integer;
const
  sidTPtr = 'TPtr';

//. dont change transferred from GlobalSpaceDefines
type
  TPoint = packed record
    ptrNextObj: TPtr;
    X,Y: TCrd;
    end;
const
  sidTPoint = 'TPoint';


implementation

end.



