unit unitGeoObjectTrackAnalysisDefaultsPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ExtCtrls, Buttons, ExtDlgs,
  unitProxySpace, ComCtrls;


const
  GeoObjectTrackAnalysisDefaultsFileName = 'GeoObjectTrackAnalysisDefaults.xml';

type
  TGeoObjectTrackAnalysisDefaults = class
  private
    Space: TProxySpace;
  public
    Reflection_flShowTrack: boolean;
    Reflection_flShowTrackNodes: boolean;
    Reflection_flSpeedColoredTrack: boolean;
    Reflection_flShowStopsAndMovementsGraph: boolean;
    Reflection_flHideMovementsGraph: boolean;
    Reflection_flShowObjectModelEvents: boolean;
    Reflection_flShowBusinessModelEvents: boolean;

    Constructor Create(const pSpace: TProxySpace);
    procedure Load();
    procedure Save();
  end;

  TfmGeoObjectTrackAnalysisDefaultsPanel = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel1: TPanel;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    Reflection_cbShowTrack: TCheckBox;
    Reflection_cbShowTrackNodes: TCheckBox;
    Reflection_cbSpeedColoredTrack: TCheckBox;
    Reflection_cbShowStopsAndMovementsGraph: TCheckBox;
    Reflection_cbHideMovementsGraph: TCheckBox;
    Reflection_cbShowObjectModelEvents: TCheckBox;
    Reflection_cbShowBusinessModelEvents: TCheckBox;
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
    AnalysisDefaults: TGeoObjectTrackAnalysisDefaults;
    procedure Save();
  public
    { Public declarations }
    Constructor Create(const pAnalysisDefaults: TGeoObjectTrackAnalysisDefaults);
    procedure Update(); reintroduce;
  end;

implementation
uses
  MSXML;
  
{$R *.dfm}


{TGeoObjectTrackAnalysisDefaults}
Constructor TGeoObjectTrackAnalysisDefaults.Create(const pSpace: TProxySpace);
begin
Inherited Create();
Space:=pSpace;
Load();
end;

procedure TGeoObjectTrackAnalysisDefaults.Load();
var
  FN: string;
  Doc: IXMLDOMDocument;
  VersionNode: IXMLDOMNode;
  Version: integer;
  TrackReflectionNode,Node: IXMLDOMNode;
begin
//. pre-defaults
Reflection_flShowTrack:=true;
Reflection_flShowTrackNodes:=true;
Reflection_flSpeedColoredTrack:=true;
Reflection_flShowStopsAndMovementsGraph:=true;
Reflection_flHideMovementsGraph:=true;
Reflection_flShowObjectModelEvents:=false;
Reflection_flShowBusinessModelEvents:=false;
//.
with TProxySpaceUserProfile.Create(Space) do
try
FN:=ProfileFolder+'\'+GeoObjectTrackAnalysisDefaultsFileName;
if (FileExists(FN))
 then begin
  SetProfileFile(GeoObjectTrackAnalysisDefaultsFileName);
  Doc:=CoDomDocument.Create;
  Doc.Set_Async(false);
  Doc.Load(ProfileFile);
  VersionNode:=Doc.documentElement.selectSingleNode('/ROOT/Version');
  if (VersionNode <> nil)
   then Version:=VersionNode.nodeTypedValue
   else Version:=0;
  if (Version <> 1) then Exit; //. ->
  TrackReflectionNode:=Doc.documentElement.selectSingleNode('/ROOT/TrackReflection');
  //.
  Node:=TrackReflectionNode.selectSingleNode('flShowTrack');
  if (Node <> nil) then Reflection_flShowTrack:=Node.nodeTypedValue;
  Node:=TrackReflectionNode.selectSingleNode('flShowTrackNodes');
  if (Node <> nil) then Reflection_flShowTrackNodes:=Node.nodeTypedValue;
  Node:=TrackReflectionNode.selectSingleNode('flSpeedColoredTrack');
  if (Node <> nil) then Reflection_flSpeedColoredTrack:=Node.nodeTypedValue;
  Node:=TrackReflectionNode.selectSingleNode('flShowStopsAndMovementsGraph');
  if (Node <> nil) then Reflection_flShowStopsAndMovementsGraph:=Node.nodeTypedValue;
  Node:=TrackReflectionNode.selectSingleNode('flHideMovementsGraph');
  if (Node <> nil) then Reflection_flHideMovementsGraph:=Node.nodeTypedValue;
  Node:=TrackReflectionNode.selectSingleNode('flShowObjectModelEvents');
  if (Node <> nil) then Reflection_flShowObjectModelEvents:=Node.nodeTypedValue;
  Node:=TrackReflectionNode.selectSingleNode('flShowBusinessModelEvents');
  if (Node <> nil) then Reflection_flShowBusinessModelEvents:=Node.nodeTypedValue;
  end;
finally
Destroy();
end;
end;

procedure TGeoObjectTrackAnalysisDefaults.Save();
var
  Doc: IXMLDOMDocument;
  PI: IXMLDOMProcessingInstruction;
  Root: IXMLDOMElement;
  VersionNode: IXMLDOMElement;
  TrackReflectionNode: IXMLDOMElement;
  //.
  PropNode: IXMLDOMElement;
begin
Doc:=CoDomDocument.Create;
Doc.Set_Async(false);
PI:=Doc.createProcessingInstruction('xml', 'version=''1.0''');
Doc.insertBefore(PI, Doc.childNodes.Item[0]);
Root:=Doc.createElement('ROOT');
Root.setAttribute('xmlns:dt', 'urn:schemas-microsoft-com:datatypes');
Doc.documentElement:=Root;
VersionNode:=Doc.createElement('Version');
VersionNode.nodeTypedValue:=1;
Root.appendChild(VersionNode);
TrackReflectionNode:=Doc.createElement('TrackReflection');
Root.appendChild(TrackReflectionNode);
//.
PropNode:=Doc.CreateElement('flShowTrack');                        PropNode.nodeTypedValue:=Reflection_flShowTrack;                         TrackReflectionNode.appendChild(PropNode);
PropNode:=Doc.CreateElement('flShowTrackNodes');                   PropNode.nodeTypedValue:=Reflection_flShowTrackNodes;                    TrackReflectionNode.appendChild(PropNode);
PropNode:=Doc.CreateElement('flSpeedColoredTrack');                PropNode.nodeTypedValue:=Reflection_flSpeedColoredTrack;                 TrackReflectionNode.appendChild(PropNode);
PropNode:=Doc.CreateElement('flShowStopsAndMovementsGraph');       PropNode.nodeTypedValue:=Reflection_flShowStopsAndMovementsGraph;        TrackReflectionNode.appendChild(PropNode);
PropNode:=Doc.CreateElement('flHideMovementsGraph');               PropNode.nodeTypedValue:=Reflection_flHideMovementsGraph;                TrackReflectionNode.appendChild(PropNode);
PropNode:=Doc.CreateElement('flShowObjectModelEvents');            PropNode.nodeTypedValue:=Reflection_flShowObjectModelEvents;             TrackReflectionNode.appendChild(PropNode);
PropNode:=Doc.CreateElement('flShowBusinessModelEvents');          PropNode.nodeTypedValue:=Reflection_flShowBusinessModelEvents;           TrackReflectionNode.appendChild(PropNode);
//. save xml document
with TProxySpaceUserProfile.Create(Space) do
try
ProfileFile:=ProfileFolder+'\'+GeoObjectTrackAnalysisDefaultsFileName;
ForceDirectories(ProfileFolder);
Doc.Save(ProfileFile);
finally
Destroy;
end;
end;


{TfmGeoObjectTrackAnalysisDefaultsPanel}
Constructor TfmGeoObjectTrackAnalysisDefaultsPanel.Create(const pAnalysisDefaults: TGeoObjectTrackAnalysisDefaults);
begin
Inherited Create(nil);
AnalysisDefaults:=pAnalysisDefaults;
Update();
end;

procedure TfmGeoObjectTrackAnalysisDefaultsPanel.Update();
begin
Reflection_cbShowTrack.Checked:=AnalysisDefaults.Reflection_flShowTrack;
Reflection_cbShowTrackNodes.Checked:=AnalysisDefaults.Reflection_flShowTrackNodes;
Reflection_cbSpeedColoredTrack.Checked:=AnalysisDefaults.Reflection_flSpeedColoredTrack;
Reflection_cbShowStopsAndMovementsGraph.Checked:=AnalysisDefaults.Reflection_flShowStopsAndMovementsGraph;
Reflection_cbHideMovementsGraph.Checked:=AnalysisDefaults.Reflection_flHideMovementsGraph;
Reflection_cbShowObjectModelEvents.Checked:=AnalysisDefaults.Reflection_flShowObjectModelEvents;
Reflection_cbShowBusinessModelEvents.Checked:=AnalysisDefaults.Reflection_flShowBusinessModelEvents;
end;

procedure TfmGeoObjectTrackAnalysisDefaultsPanel.Save();
begin
AnalysisDefaults.Reflection_flShowTrack:=Reflection_cbShowTrack.Checked;
AnalysisDefaults.Reflection_flShowTrackNodes:=Reflection_cbShowTrackNodes.Checked;
AnalysisDefaults.Reflection_flSpeedColoredTrack:=Reflection_cbSpeedColoredTrack.Checked;
AnalysisDefaults.Reflection_flShowStopsAndMovementsGraph:=Reflection_cbShowStopsAndMovementsGraph.Checked;
AnalysisDefaults.Reflection_flHideMovementsGraph:=Reflection_cbHideMovementsGraph.Checked;
AnalysisDefaults.Reflection_flShowObjectModelEvents:=Reflection_cbShowObjectModelEvents.Checked;
AnalysisDefaults.Reflection_flShowBusinessModelEvents:=Reflection_cbShowBusinessModelEvents.Checked;
AnalysisDefaults.Save();
end;

procedure TfmGeoObjectTrackAnalysisDefaultsPanel.btnOKClick(Sender: TObject);
begin
Save();
Close();
end;

procedure TfmGeoObjectTrackAnalysisDefaultsPanel.btnCancelClick(Sender: TObject);
begin
Close();
end;


end.
