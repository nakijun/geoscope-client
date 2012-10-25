unit unitGeoGraphServerObjectRegistrationWizard;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  ExtCtrls,
  StdCtrls,
  Buttons,
  unitBusinessModel,
  unitGMOBusinessModel,
  unitGMO1BusinessModel,
  unitEnforaObjectBusinessModel,
  unitEnforaMT3000ObjectBusinessModel,
  unitEnforaMiniMTObjectBusinessModel,
  unitNavixyObjectBusinessModel,
  unitGMMDBusinessModel,
  unitGSTraqObjectBusinessModel;


const
  StepCount = 3;
type
  TfmGeoGraphServerObjectRegistrationWizard = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    pnlStep0: TPanel;
    pnlStep2: TPanel;
    pnlStep1: TPanel;
    cbGeoGraphServer: TComboBox;
    bbPrev: TBitBtn;
    bbNext: TBitBtn;
    bbCancel: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    cbObjectType: TComboBox;
    Label3: TLabel;
    cbObjectBusinessModel: TComboBox;
    procedure bbPrevClick(Sender: TObject);
    procedure bbNextClick(Sender: TObject);
    procedure bbCancelClick(Sender: TObject);
    procedure cbObjectTypeChange(Sender: TObject);
    procedure cbObjectBusinessModelChange(Sender: TObject);
  private
    { Private declarations }
    idTVisualization: integer;
    idVisualization: integer;
    idUserAlert: integer;
    idOnlineFlag: integer;
    idLocationIsAvailableFlag: integer;
    //.
    ObjectType: integer;
    ObjectBusinessModel: integer;
    BusinessModelConstructorPanel: TBusinessModelConstructorPanel;
    //.
    Step: integer;
    flAccepted: boolean;
    flUnregister: boolean;

    procedure GoNext;
    procedure GoPrev;
    procedure HideAllSteps;
  public
    { Public declarations }
    idGeoGraphServer: integer;
    idGeoGraphServerObject: integer;

    Constructor Create(const pidGeoGraphServerObject: integer; const pObjectName: string; const pidTVisualization: integer; const pidVisualization: integer; const pidUserAlert: integer; const pidOnlineFlag: integer; const pidLocationIsAvailableFlag: integer);
    Destructor Destroy(); override;
    function AllStepsArePassed: boolean;
    function ConstructObject(): integer;
  end;

implementation
Uses
  GlobalSpaceDefines,
  TypesDefines,
  FunctionalityImport;

{$R *.dfm}


Constructor TfmGeoGraphServerObjectRegistrationWizard.Create(const pidGeoGraphServerObject: integer; const pObjectName: string; const pidTVisualization: integer; const pidVisualization: integer; const pidUserAlert: integer; const pidOnlineFlag: integer; const pidLocationIsAvailableFlag: integer);
var
  TF: TTypeFunctionality;
  IL: TList;
  RegistrationServerID: integer;
  I: integer;
  CF: TComponentFunctionality;
  idObj: integer;
begin
Inherited Create(nil);
idGeoGraphServer:=0;
//.
idGeoGraphServerObject:=pidGeoGraphServerObject;
//.
idTVisualization:=pidTVisualization;
idVisualization:=pidVisualization;
idUserAlert:=pidUserAlert;
idOnlineFlag:=pidOnlineFlag;
idLocationIsAvailableFlag:=pidLocationIsAvailableFlag;
//.
ObjectType:=-1;
ObjectBusinessModel:=-1;
BusinessModelConstructorPanel:=nil;
//.
TF:=TTypeFunctionality_Create(idTGeoGraphServer);
try
try
RegistrationServerID:=TTGeoGraphServerFunctionality(TF).GetInstanceForRegistration();
except
  RegistrationServerID:=0;
  end;
try
TTGeoGraphServerFunctionality(TF).GetActiveInstanceList1({out} IL);
except
  TTypeFunctionality(TF).GetInstanceList({out} IL);
  end;
try
cbGeoGraphServer.Items.BeginUpdate();
try
cbGeoGraphServer.Items.Clear();
for I:=0 to IL.Count-1 do begin
  CF:=TF.TComponentFunctionality_Create(Integer(IL[I]));
  try
  idObj:=CF.GetObjID();
  cbGeoGraphServer.Items.AddObject(CF.Name{///?+' ('+IntToStr(idObj)+')'},Pointer(idObj));
  //.
  if (idObj = RegistrationServerID) then cbGeoGraphServer.ItemIndex:=I;
  finally
  CF.Release;
  end;
  end;
if ((cbGeoGraphServer.Items.Count > 0) AND (cbGeoGraphServer.ItemIndex = -1)) then cbGeoGraphServer.ItemIndex:=0;
finally
cbGeoGraphServer.Items.EndUpdate();
end;
finally
IL.Destroy();
end;
finally
TF.Release();
end;
//. prepare object types checkbox
cbObjectType.Items.Clear;
cbObjectType.Items.AddObject(TGMOBusinessModel.ObjectTypeName,Pointer(TGMOBusinessModel));
cbObjectType.Items.AddObject(TGMO1BusinessModel.ObjectTypeName,Pointer(TGMO1BusinessModel));
cbObjectType.Items.AddObject(TGMMDBusinessModel.ObjectTypeName,Pointer(TGMMDBusinessModel));
cbObjectType.Items.AddObject(TEnforaObjectBusinessModel.ObjectTypeName,Pointer(TEnforaObjectBusinessModel));
cbObjectType.Items.AddObject(TEnforaMT3000ObjectBusinessModel.ObjectTypeName,Pointer(TEnforaMT3000ObjectBusinessModel));
cbObjectType.Items.AddObject(TEnforaMiniMTObjectBusinessModel.ObjectTypeName,Pointer(TEnforaMiniMTObjectBusinessModel));
cbObjectType.Items.AddObject(TGSTraqObjectBusinessModel.ObjectTypeName,Pointer(TGSTraqObjectBusinessModel));
cbObjectType.Items.AddObject(TNavixyObjectBusinessModel.ObjectTypeName,Pointer(TNavixyObjectBusinessModel));
cbObjectType.ItemIndex:=0;
cbObjectTypeChange(nil);
//.
with TGeoGraphServerObjectFunctionality(TComponentFunctionality_Create(idTGeoGraphServerObject,idGeoGraphServerObject)) do
try
flUnregister:=((GeoGraphServerID <> 0) AND (ObjectID <> 0));
finally
Release;
end;
//.
if (NOT flUnregister)
 then begin
  Step:=1;
  pnlStep1.Show();
  end
 else begin
  pnlStep0.Caption:='Object is already registered on the server. If you want to re-register it click "Next"';
  pnlStep0.Show();
  Step:=0;
  end;
//.
end;

Destructor TfmGeoGraphServerObjectRegistrationWizard.Destroy();
begin
BusinessModelConstructorPanel.Free();
//.
Inherited;
end;

procedure TfmGeoGraphServerObjectRegistrationWizard.GoNext;
begin
case Step of
0: begin
  HideAllSteps;
  pnlStep1.Show;
  end;
1: begin
  if (cbGeoGraphServer.ItemIndex = -1)
   then begin
    ShowMessage('Please select the Geo-Graph-Server.');
    Exit; //. ->
    end;
  idGeoGraphServer:=Integer(cbGeoGraphServer.Items.Objects[cbGeoGraphServer.ItemIndex]);
  if (ObjectType = -1)
   then begin
    ShowMessage('Please select Object type and business model.');
    Exit; //. ->
    end;
  if (ObjectBusinessModel = -1)
   then begin
    ShowMessage('Please select Business model.');
    Exit; //. ->
    end;
  if (BusinessModelConstructorPanel = nil)
   then begin
    ShowMessage('No business model contruction template.');
    Exit; //. ->
    end;
  //.
  BusinessModelConstructorPanel.Align:=alClient;
  BusinessModelConstructorPanel.Parent:=pnlStep2;
  BusinessModelConstructorPanel.Show();
  //.
  HideAllSteps;
  pnlStep2.Show;
  end;
2: begin
  //. validate template values
  BusinessModelConstructorPanel.ValidateValues();
  //.
  if (MessageDlg('Construct the object ?', mtConfirmation, [mbYes,mbNo], 0) = mrYes)
   then begin
    flAccepted:=true;
    Close;
    end;
  //.
  Exit; //.
  end;
end;
bbPrev.Enabled:=true;
Inc(Step);
end;

procedure TfmGeoGraphServerObjectRegistrationWizard.GoPrev;
begin
Dec(Step);
case Step of
1: begin
  bbPrev.Enabled:=false;
  HideAllSteps;
  pnlStep1.Show;
  end;
end;
end;

procedure TfmGeoGraphServerObjectRegistrationWizard.HideAllSteps;
begin
pnlStep0.Hide;
pnlStep1.Hide;
pnlStep2.Hide;
end;

procedure TfmGeoGraphServerObjectRegistrationWizard.bbPrevClick(Sender: TObject);
begin
GoPrev;
end;

procedure TfmGeoGraphServerObjectRegistrationWizard.bbNextClick(Sender: TObject);
begin
GoNext;
end;

procedure TfmGeoGraphServerObjectRegistrationWizard.bbCancelClick(Sender: TObject);
begin
Close();
end;


procedure TfmGeoGraphServerObjectRegistrationWizard.cbObjectTypeChange(Sender: TObject);
var
  SL: TStringList;
  BusinessModelClass: TBusinessModelClass;
begin
BusinessModelClass:=TBusinessModelClass(cbObjectType.Items.Objects[cbObjectType.ItemIndex]);
ObjectType:=BusinessModelClass.ObjectTypeID;
BusinessModelClass.GetModels({out} SL);
try
cbObjectBusinessModel.Items.Clear();
cbObjectBusinessModel.Items.AddStrings(SL);
if (cbObjectBusinessModel.Items.Count > 0)
 then begin
  cbObjectBusinessModel.ItemIndex:=0;
  cbObjectBusinessModelChange(nil);
  end;
finally
SL.Destroy;
end;
end;

procedure TfmGeoGraphServerObjectRegistrationWizard.cbObjectBusinessModelChange(Sender: TObject);
var
  BusinessModelClass: TBusinessModelClass;
begin
BusinessModelClass:=TBusinessModelClass(cbObjectBusinessModel.Items.Objects[cbObjectBusinessModel.ItemIndex]);
ObjectBusinessModel:=BusinessModelClass.ID;
BusinessModelConstructorPanel.Free();
BusinessModelConstructorPanel:=BusinessModelClass.CreateConstructorPanel(idGeoGraphServerObject);
BusinessModelConstructorPanel.Preset(idTVisualization,idVisualization,0,idUserAlert,idOnlineFlag,idLocationIsAvailableFlag); ///!!! TO-DO
end;

function TfmGeoGraphServerObjectRegistrationWizard.AllStepsArePassed: boolean;
begin
flAccepted:=false;
ShowModal();
Result:=flAccepted;
end;

function TfmGeoGraphServerObjectRegistrationWizard.ConstructObject(): integer;
begin
if (BusinessModelConstructorPanel = nil) then Raise Exception.Create('There is no creation template'); //. =>
Result:=BusinessModelConstructorPanel.Construct(idGeoGraphServer,idGeoGraphServerObject);
end;


end.
