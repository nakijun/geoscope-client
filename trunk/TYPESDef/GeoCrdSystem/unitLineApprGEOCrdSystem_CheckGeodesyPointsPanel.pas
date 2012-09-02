unit unitLineApprGEOCrdSystem_CheckGeodesyPointsPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, GlobalSpaceDefines, unitProxySpace, Functionality, TypesFunctionality,
  ComCtrls, Menus;

type
  TDeviationItem = record
    Next: pointer;
    Latitude: double;
    Longitude: double;
    P0Ptr: pointer;
    P1Ptr: pointer;
  end;

  TGeodesyPointParam = record
    flEnabled: boolean;
    ID: integer;
    X: double;
    Y: double;
    Latitude: double;
    Longitude: double;
    //.
    DeviationFactor: double;
    DeviationItems: pointer;
    MaxDeviation: double;
  end;

  TGeodesyPoints = class
  private
    idCrdSystem: integer;
    Items: TList;
    Xmin,Ymin: double;
    Xmax,Ymax: double;
    MaxDeviationFactor: double;
    SummaryDeviationFactor: double;
    MaxDeviation: double;

    Constructor Create(const pidCrdSystem: integer);
    Destructor Destroy; override;
    procedure Clear;
    procedure Update;
    procedure GetBounds;
    function EnabledItemsCount: integer;
    procedure CalculateItemDeviation(const ptrItem: pointer; const NearItemsCount: integer);
    procedure CalculateItemsDeviation(const NearItemsCount: integer);
    procedure Item_DestroyDeviationItems(const ptrItem: pointer);
  end;

  TfmCheckGeodesyPoints = class(TForm)
    GroupBox1: TGroupBox;
    pbMap: TPaintBox;
    tbMapScale: TTrackBar;
    tbDeviationNearItems: TTrackBar;
    lbDeviationNearItemsCount: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    pbMap_PopupMenu: TPopupMenu;
    Enableselecteditem1: TMenuItem;
    Disableselecteditem1: TMenuItem;
    N1: TMenuItem;
    Enableall1: TMenuItem;
    Label3: TLabel;
    tbMapInfoSize: TTrackBar;
    Disableall1: TMenuItem;
    N2: TMenuItem;
    Disablebaditem1: TMenuItem;
    procedure pbMapPaint(Sender: TObject);
    procedure tbMapScaleChange(Sender: TObject);
    procedure pbMapMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pbMapMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pbMapMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure tbDeviationNearItemsChange(Sender: TObject);
    procedure pbMapDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Enableselecteditem1Click(Sender: TObject);
    procedure Disableselecteditem1Click(Sender: TObject);
    procedure Enableall1Click(Sender: TObject);
    procedure tbMapInfoSizeChange(Sender: TObject);
    procedure Disableall1Click(Sender: TObject);
    procedure Disablebaditem1Click(Sender: TObject);
  private
    { Private declarations }
    pbMap_MapSize: integer;
    pbMap_MapOffsetX: integer;
    pbMap_MapOffsetY: integer;
    pbMap_MapScale: Extended;
    pbMap_MapPointSize: integer;
    pbMap__DeviationStick_Height: integer;
    pbMap__InfoSize: integer;
    pbMap_DeviationItemSize: integer;
    pbMap_SelectedItemIndex: integer;
    pbMap_SelectedDeviationItemPtr: pointer;

    GeodesyPoints: TGeodesyPoints;

    Mouse_flRightButtonDown: boolean;
    Mouse_Pos: Windows.TPoint;

    function pbMap_SelectItemAt(const pX,pY: integer): integer;
    function pbMap_SelectDeviationItemAt(const pX,pY: integer): pointer;
  public
    { Public declarations }
    Constructor Create(const pidCrdSystem: integer);
    Destructor Destroy; override;
    procedure pbMap_Paint();
    procedure DisableBadItem;
  end;

implementation
Uses
  Math;

{$R *.dfm}


{TGeodesyPoints}
Constructor TGeodesyPoints.Create(const pidCrdSystem: integer);
begin
Inherited Create;
idCrdSystem:=pidCrdSystem;
Items:=TList.Create;
Update();
end;

Destructor TGeodesyPoints.Destroy;
begin
Clear;
Items.Free;
Inherited;
end;

procedure TGeodesyPoints.Clear;
var
  I: integer;
  ptrDestroyItem: pointer;
begin
if (Items <> nil)
 then begin
  for I:=0 to Items.Count-1 do begin
    ptrDestroyItem:=Items[I];
    Item_DestroyDeviationItems(ptrDestroyItem);
    FreeMem(ptrDestroyItem,SizeOf(TGeodesyPointParam));
    end;
  Items.Clear;
  end;
end;

procedure TGeodesyPoints.Update;
var
  I: integer;
  IL: TByteArray;
  idInstance: integer;
  _idCrdSys: integer;
  _X,_Y, Lat,Long: double;
  ptrNewItem: pointer;
begin
Clear;
with TTGeodesyPointFunctionality.Create do
try
GetInstanceListByCrdSys(idCrdSystem, IL);
for I:=0 to (Length(IL) DIV SizeOf(Integer))-1 do begin
  idInstance:=Integer(Pointer(Integer(@IL[0])+I*SizeOf(Integer))^);
  with TGeodesyPointFunctionality(TComponentFunctionality_Create(idInstance)) do
  try
  GetParams(_idCrdSys, _X,_Y, Lat,Long);
  GetMem(ptrNewItem,SizeOf(TGeodesyPointParam));
  with TGeodesyPointParam(ptrNewItem^) do begin
  flEnabled:=true;
  ID:=idObj;
  X:=_X;
  Y:=_Y;
  Latitude:=Lat;
  Longitude:=Long;
  //.
  DeviationFactor:=-1.0;
  DeviationItems:=nil;
  MaxDeviation:=0;
  end;
  Items.Add(ptrNewItem);
  finally
  Release;
  end;
  end;
finally
Release;
end;
GetBounds;
end;

function TGeodesyPoints.EnabledItemsCount: integer;
var
  I: integer;
begin
Result:=0;
for I:=0 to Items.Count-1 do if (TGeodesyPointParam(Items[I]^).flEnabled) then Inc(Result); 
end;

procedure TGeodesyPoints.GetBounds;
var
  I: integer;
begin
Xmin:=MaxDouble; Ymin:=MaxDouble;
Xmax:=-MaxDouble; Ymax:=-MaxDouble;
for I:=0 to Items.Count-1 do with TGeodesyPointParam(Items[I]^) do begin
  if (X < Xmin) then Xmin:=X;
  if (X > Xmax) then Xmax:=X;
  if (Y < Ymin) then Ymin:=Y;
  if (Y > Ymax) then Ymax:=Y;
  end;
end;

(* old ///procedure TGeodesyPoints.CalculateItemDeviation(const ptrItem: pointer; const NearItemsCount: integer);

  procedure GetNearItemsList(out List: TList);
  var
    I,J: integer;
    Distance,MinDistance: double;
    ItemIndex: integer;
  begin
  List:=TList.Create;
  try
  for I:=0 to Items.Count-1 do if (TGeodesyPointParam(Items[I]^).flEnabled) then
    if (Items[I] <> ptrItem)
     then begin
      if (List.Count < NearItemsCount)
       then
        List.Add(Items[I])
       else begin
        MinDistance:=Sqr(TGeodesyPointParam(Items[I]^).X-TGeodesyPointParam(ptrItem^).X)+Sqr(TGeodesyPointParam(Items[I]^).Y-TGeodesyPointParam(ptrItem^).Y);
        ItemIndex:=-1;
        for J:=0 to List.Count-1 do with TGeodesyPointParam(List[J]^) do begin
          Distance:=Sqr(X-TGeodesyPointParam(ptrItem^).X)+Sqr(Y-TGeodesyPointParam(ptrItem^).Y);
          if (Distance > MinDistance)
           then begin
            MinDistance:=Distance;
            ItemIndex:=J;
            end;
          end;
        if (ItemIndex <> -1) then List[ItemIndex]:=Items[I];
        end;
      end;
  except
    FreeAndNil(List);
    Raise; //. =>
    end;
  end;

var
  NearItems: TList;
  I,J: integer;
  SumD: double;
  CountD: integer;
  P0,P1: TGeodesyPointParam;
  Lat,Long: double;
  D: double;
  ptrNewDeviationItem: pointer;
begin
TGeodesyPointParam(ptrItem^).MaxDeviation:=0.0;
GetNearItemsList(NearItems);
try
Item_DestroyDeviationItems(ptrItem);
//.
SumD:=0;
CountD:=0;
for I:=0 to NearItems.Count-1 do begin
  P0:=TGeodesyPointParam(NearItems[I]^);
  for J:=I+1 to NearItems.Count-1 do begin
    P1:=TGeodesyPointParam(NearItems[J]^);
    Lat:=P0.Latitude+(TGeodesyPointParam(ptrItem^).Y-P0.Y)*((P1.Latitude-P0.Latitude)/(P1.Y-P0.Y));
    Long:=P0.Longitude+(TGeodesyPointParam(ptrItem^).X-P0.X)*((P1.Longitude-P0.Longitude)/(P1.X-P0.X));
    D:=Sqrt(sqr(Lat-TGeodesyPointParam(ptrItem^).Latitude)+sqr(Long-TGeodesyPointParam(ptrItem^).Longitude));
    SumD:=SumD+D;
    Inc(CountD);
    //. add new deviation item
    GetMem(ptrNewDeviationItem,SizeOf(TDeviationItem));
    with TDeviationItem(ptrNewDeviationItem^) do begin
    Next:=TGeodesyPointParam(ptrItem^).DeviationItems;
    Latitude:=Lat;
    Longitude:=Long;
    P0Ptr:=NearItems[I];
    P1Ptr:=NearItems[J];
    end;
    TGeodesyPointParam(ptrItem^).DeviationItems:=ptrNewDeviationItem;
    if (D > MaxDeviation) then MaxDeviation:=D;
    end;
  end;
TGeodesyPointParam(ptrItem^).DeviationFactor:=SumD/CountD;
finally
NearItems.Destroy;
end;
end;*)

(*///procedure TGeodesyPoints.CalculateItemDeviation(const ptrItem: pointer; const NearItemsCount: integer);
var
  I: integer;
  XLeftNearestItemPtr,XRightNearestItemPtr: pointer;
  YUpNearestItemPtr,YDownNearestItemPtr: pointer;
  LeftMinDist,RightMinDist: double;
  UpMinDist,DownMinDist: double;
  dX,dY: double;
  Lat,Long: double;
  D: double;
  ptrNewDeviationItem: pointer;
begin
TGeodesyPointParam(ptrItem^).MaxDeviation:=0.0;
Item_DestroyDeviationItems(ptrItem);
//.
XLeftNearestItemPtr:=nil;
XRightNearestItemPtr:=nil;
YUpNearestItemPtr:=nil;
YDownNearestItemPtr:=nil;
LeftMinDist:=MaxDouble;
RightMinDist:=MaxDouble;
UpMinDist:=MaxDouble;
DownMinDist:=MaxDouble;
for I:=0 to Items.Count-1 do
  if ((Items[I] <> ptrItem) AND TGeodesyPointParam(Items[I]^).flEnabled)
   then with TGeodesyPointParam(Items[I]^) do begin
    dX:=X-TGeodesyPointParam(ptrItem^).X;
    dY:=Y-TGeodesyPointParam(ptrItem^).Y;
    D:=Sqr(dX)+Sqr(dY);
    if (dX >= 0)
     then begin
      if (D < RightMinDist)
       then begin
        XRightNearestItemPtr:=Items[I];
        RightMinDist:=D;
        end;
      end
     else begin
      if (D < LeftMinDist)
       then begin
        XLeftNearestItemPtr:=Items[I];
        LeftMinDist:=D;
        end;
      end;
    if (dY >= 0)
     then begin
      if (D < UpMinDist)
       then begin
        YUpNearestItemPtr:=Items[I];
        UpMinDist:=D;
        end;
      end
     else begin
      if (D < DownMinDist)
       then begin
        YDownNearestItemPtr:=Items[I];
        DownMinDist:=D;
        end;
      end;
    end;
if ((XLeftNearestItemPtr <> nil) AND (XRightNearestItemPtr <> nil) AND (YUpNearestItemPtr <> nil) AND (YDownNearestItemPtr <> nil))
 then begin
  Long:=TGeodesyPointParam(XLeftNearestItemPtr^).Longitude+(TGeodesyPointParam(ptrItem^).X-TGeodesyPointParam(XLeftNearestItemPtr^).X)*((TGeodesyPointParam(XRightNearestItemPtr^).Longitude-TGeodesyPointParam(XLeftNearestItemPtr^).Longitude)/(TGeodesyPointParam(XRightNearestItemPtr^).X-TGeodesyPointParam(XLeftNearestItemPtr^).X));
  Lat:=TGeodesyPointParam(YDownNearestItemPtr^).Latitude+(TGeodesyPointParam(ptrItem^).Y-TGeodesyPointParam(YDownNearestItemPtr^).Y)*((TGeodesyPointParam(YUpNearestItemPtr^).Latitude-TGeodesyPointParam(YDownNearestItemPtr^).Latitude)/(TGeodesyPointParam(YUpNearestItemPtr^).Y-TGeodesyPointParam(YDownNearestItemPtr^).Y));
  D:=Sqrt(sqr(Lat-TGeodesyPointParam(ptrItem^).Latitude)+sqr(Long-TGeodesyPointParam(ptrItem^).Longitude));
  //. add new deviation item
  GetMem(ptrNewDeviationItem,SizeOf(TDeviationItem));
  TDeviationItem(ptrNewDeviationItem^).Next:=TGeodesyPointParam(ptrItem^).DeviationItems;
  TDeviationItem(ptrNewDeviationItem^).Latitude:=Lat;
  TDeviationItem(ptrNewDeviationItem^).Longitude:=Long;
  TDeviationItem(ptrNewDeviationItem^).XLeftNearestItemPtr:=XLeftNearestItemPtr;
  TDeviationItem(ptrNewDeviationItem^).XRightNearestItemPtr:=XRightNearestItemPtr;
  TDeviationItem(ptrNewDeviationItem^).YUpNearestItemPtr:=YUpNearestItemPtr;
  TDeviationItem(ptrNewDeviationItem^).YDownNearestItemPtr:=YDownNearestItemPtr;
  TGeodesyPointParam(ptrItem^).DeviationItems:=ptrNewDeviationItem;
  //.
  if (D > TGeodesyPointParam(ptrItem^).MaxDeviation) then TGeodesyPointParam(ptrItem^).MaxDeviation:=D;
  TGeodesyPointParam(ptrItem^).DeviationFactor:=D;
  end
 else TGeodesyPointParam(ptrItem^).DeviationFactor:=-1.0;
end;*)

procedure TGeodesyPoints.CalculateItemDeviation(const ptrItem: pointer; const NearItemsCount: integer);
var
  I: integer;
  LUNearestItemPtr,RUNearestItemPtr,RDNearestItemPtr,LDNearestItemPtr: pointer;
  LUMinDist,RUMinDist,RDMinDist,LDMinDist: double;
  dX,dY: double;
  P0Ptr,P1Ptr: pointer;
  S0,S1: double;
  Lat,Long: double;
  D: double;
  ptrNewDeviationItem: pointer;
begin
TGeodesyPointParam(ptrItem^).MaxDeviation:=0.0;
Item_DestroyDeviationItems(ptrItem);
//.
LUNearestItemPtr:=nil;
RUNearestItemPtr:=nil;
RDNearestItemPtr:=nil;
LDNearestItemPtr:=nil;
LUMinDist:=MaxDouble;
RUMinDist:=MaxDouble;
RDMinDist:=MaxDouble;
LDMinDist:=MaxDouble;
for I:=0 to Items.Count-1 do
  if ((Items[I] <> ptrItem) AND TGeodesyPointParam(Items[I]^).flEnabled)
   then with TGeodesyPointParam(Items[I]^) do begin
    dX:=X-TGeodesyPointParam(ptrItem^).X;
    dY:=Y-TGeodesyPointParam(ptrItem^).Y;
    D:=Sqr(dX)+Sqr(dY);
    if (dX < 0)
     then
      if (dY >= 0)
       then begin
        if (D < LUMinDist)
         then begin
          LUNearestItemPtr:=Items[I];
          LUMinDist:=D;
          end;
        end
       else begin
        if (D < LDMinDist)
         then begin
          LDNearestItemPtr:=Items[I];
          LDMinDist:=D;
          end;
        end
     else
      if (dY >= 0)
       then begin
        if (D < RUMinDist)
         then begin
          RUNearestItemPtr:=Items[I];
          RUMinDist:=D;
          end;
        end
       else begin
        if (D < RDMinDist)
         then begin
          RDNearestItemPtr:=Items[I];
          RDMinDist:=D;
          end;
        end;
    end;
//.
if ((LDNearestItemPtr <> nil) AND (RUNearestItemPtr <> nil))
 then S0:=(TGeodesyPointParam(RUNearestItemPtr^).X-TGeodesyPointParam(LDNearestItemPtr^).X)*(TGeodesyPointParam(RUNearestItemPtr^).Y-TGeodesyPointParam(LDNearestItemPtr^).Y)
 else S0:=MaxDouble;
if ((LUNearestItemPtr <> nil) AND (RDNearestItemPtr <> nil))
 then S1:=(TGeodesyPointParam(RDNearestItemPtr^).X-TGeodesyPointParam(LUNearestItemPtr^).X)*(TGeodesyPointParam(LUNearestItemPtr^).Y-TGeodesyPointParam(RDNearestItemPtr^).Y)
 else S1:=MaxDouble;
if (S0 <= S1)
 then begin
  P0Ptr:=LDNearestItemPtr;
  P1Ptr:=RUNearestItemPtr;
  end
 else begin
  P0Ptr:=LUNearestItemPtr;
  P1Ptr:=RDNearestItemPtr;
  end;
if ((P0Ptr <> nil) AND (P1Ptr <> nil))
 then begin
  Long:=TGeodesyPointParam(P0Ptr^).Longitude+(TGeodesyPointParam(ptrItem^).X-TGeodesyPointParam(P0Ptr^).X)*((TGeodesyPointParam(P1Ptr^).Longitude-TGeodesyPointParam(P0Ptr^).Longitude)/(TGeodesyPointParam(P1Ptr^).X-TGeodesyPointParam(P0Ptr^).X));
  Lat:=TGeodesyPointParam(P0Ptr^).Latitude+(TGeodesyPointParam(ptrItem^).Y-TGeodesyPointParam(P0Ptr^).Y)*((TGeodesyPointParam(P1Ptr^).Latitude-TGeodesyPointParam(P0Ptr^).Latitude)/(TGeodesyPointParam(P1Ptr^).Y-TGeodesyPointParam(P0Ptr^).Y));
  D:=Sqrt(sqr(Lat-TGeodesyPointParam(ptrItem^).Latitude)+sqr(Long-TGeodesyPointParam(ptrItem^).Longitude));
  //. add new deviation item
  GetMem(ptrNewDeviationItem,SizeOf(TDeviationItem));
  TDeviationItem(ptrNewDeviationItem^).Next:=TGeodesyPointParam(ptrItem^).DeviationItems;
  TDeviationItem(ptrNewDeviationItem^).Latitude:=Lat;
  TDeviationItem(ptrNewDeviationItem^).Longitude:=Long;
  TDeviationItem(ptrNewDeviationItem^).P0Ptr:=P0Ptr;
  TDeviationItem(ptrNewDeviationItem^).P1Ptr:=P1Ptr;
  TGeodesyPointParam(ptrItem^).DeviationItems:=ptrNewDeviationItem;
  //.
  if (D > TGeodesyPointParam(ptrItem^).MaxDeviation) then TGeodesyPointParam(ptrItem^).MaxDeviation:=D;
  TGeodesyPointParam(ptrItem^).DeviationFactor:=D;
  end
 else TGeodesyPointParam(ptrItem^).DeviationFactor:=-1.0;
end;

procedure TGeodesyPoints.CalculateItemsDeviation(const NearItemsCount: integer);
var
  I: integer;
  SummaryDeviationFactorCount: integer;
begin
if (NearItemsCount > (EnabledItemsCount()-1)) then Raise Exception.Create('number of Near Items is too big'); //. =>
MaxDeviationFactor:=0;
SummaryDeviationFactorCount:=0;
SummaryDeviationFactor:=0;
MaxDeviation:=0;
for I:=0 to Items.Count-1 do begin
  CalculateItemDeviation(Items[I],NearItemsCount);
  if (TGeodesyPointParam(Items[I]^).flEnabled AND (TGeodesyPointParam(Items[I]^).DeviationFactor > MaxDeviationFactor)) then MaxDeviationFactor:=TGeodesyPointParam(Items[I]^).DeviationFactor;
  if (TGeodesyPointParam(Items[I]^).flEnabled AND (TGeodesyPointParam(Items[I]^).DeviationFactor > 0))
   then begin
    SummaryDeviationFactor:=SummaryDeviationFactor+TGeodesyPointParam(Items[I]^).DeviationFactor;
    Inc(SummaryDeviationFactorCount);
    end;
  if (TGeodesyPointParam(Items[I]^).flEnabled AND (TGeodesyPointParam(Items[I]^).MaxDeviation > MaxDeviation)) then MaxDeviation:=TGeodesyPointParam(Items[I]^).MaxDeviation;
  end;
SummaryDeviationFactor:=SummaryDeviationFactor/SummaryDeviationFactorCount;
end;

procedure TGeodesyPoints.Item_DestroyDeviationItems(const ptrItem: pointer);
var
  ptrDestroyItem: pointer;
begin
with TGeodesyPointParam(ptrItem^) do
while (DeviationItems <> nil) do begin
  ptrDestroyItem:=DeviationItems;
  DeviationItems:=TDeviationItem(ptrDestroyItem^).Next;
  FreeMem(ptrDestroyItem,SizeOf(TDeviationItem));
  end;
end;


{TfmCheckGeodesyPoints}
Constructor TfmCheckGeodesyPoints.Create(const pidCrdSystem: integer);
begin
Inherited Create(nil);
DoubleBuffered:=true;
pbMap_MapPointSize:=16;
pbMap__DeviationStick_Height:=4;
pbMap__InfoSize:=tbMapInfoSize.Position;
pbMap_DeviationItemSize:=4;
pbMap_MapSize:=800;
pbMap_MapOffsetX:=pbMap_MapPointSize;
pbMap_MapOffsetY:=pbMap_MapPointSize;
pbMap_MapScale:=1;
pbMap_SelectedItemIndex:=-1;
pbMap_SelectedDeviationItemPtr:=nil;
GeodesyPoints:=TGeodesyPoints.Create(pidCrdSystem);
Mouse_flRightButtonDown:=false;
//.
tbDeviationNearItems.Min:=2;
tbDeviationNearItems.Max:=GeodesyPoints.Items.Count-1;
tbDeviationNearItems.Position:=tbDeviationNearItems.Min;
end;

Destructor TfmCheckGeodesyPoints.Destroy;
begin
GeodesyPoints.Free;
Inherited;
end;

procedure TfmCheckGeodesyPoints.pbMap_Paint();
var
  dX,dY: double;
  SizeX,SizeY: integer;
  I: integer;
  Xc,Yc: integer;
  DeviationStick_Width: integer;
  DeviationStick_X: integer;
  DeviationStick_Y: integer;
  DeviationMap_Size: integer;
  DeviationMap_X: integer;
  DeviationMap_Y: integer;
  DeviationMap_CenterX: integer;
  DeviationMap_CenterY: integer;
  ptrDeviationItem: pointer;
  D: double;
  DeviationItemX: integer;
  DeviationItemY: integer;
  S: string;
begin
with pbMap do begin
Canvas.Pen.Color:=clGray;
Canvas.Brush.Color:=clGray;
Canvas.Rectangle(0,0,Width,Height);
if (GeodesyPoints.Items.Count = 0) then Exit; //. ->
dX:=(GeodesyPoints.Xmax-GeodesyPoints.Xmin);
dY:=(GeodesyPoints.Ymax-GeodesyPoints.Ymin);
if (dY > dX)
 then begin
  SizeY:=pbMap_MapSize;
  SizeX:=Round(SizeY*(dX/dY));
  end
 else begin
  SizeX:=pbMap_MapSize;
  SizeY:=Round(SizeX*(dY/dX));
  end;
Canvas.Pen.Color:=clWhite;
Canvas.Brush.Color:=clSilver;
Canvas.Rectangle(pbMap_MapOffsetX,pbMap_MapOffsetY,pbMap_MapOffsetX+Round(SizeX*pbMap_MapScale),pbMap_MapOffsetY+Round(SizeY*pbMap_MapScale));
for I:=0 to GeodesyPoints.Items.Count-1 do with TGeodesyPointParam(GeodesyPoints.Items[I]^) do begin
  Xc:=pbMap_MapOffsetX+Round(((X-GeodesyPoints.Xmin)/dX)*SizeX*pbMap_MapScale);
  Yc:=pbMap_MapOffsetY+Round((1-((Y-GeodesyPoints.Ymin)/dY))*SizeY*pbMap_MapScale);
  if (I = pbMap_SelectedItemIndex)
   then begin
    Canvas.Pen.Color:=clRed;
    Canvas.Brush.Color:=clRed;
    Canvas.Ellipse(Xc-pbMap_MapPointSize,Yc-pbMap_MapPointSize, Xc+pbMap_MapPointSize,Yc+pbMap_MapPointSize);
    end;
  if (flEnabled)
   then begin
    Canvas.Pen.Color:=clWhite;
    Canvas.Brush.Color:=clNavy;
    end
   else begin
    Canvas.Pen.Color:=clWhite;
    Canvas.Brush.Color:=clGray;
    end;
  Canvas.Ellipse(Xc-(pbMap_MapPointSize DIV 2),Yc-(pbMap_MapPointSize DIV 2), Xc+(pbMap_MapPointSize DIV 2),Yc+(pbMap_MapPointSize DIV 2));
  if (DeviationFactor <> -1.0)
   then begin
    DeviationStick_Width:=Round(pbMap__InfoSize*(DeviationFactor/GeodesyPoints.MaxDeviationFactor));
    DeviationStick_X:=Xc+(pbMap_MapPointSize DIV 2)+1;
    DeviationStick_Y:=Yc+(pbMap__DeviationStick_Height DIV 2);
    if (flEnabled)
     then begin
      Canvas.Pen.Color:=clYellow;
      Canvas.Brush.Color:=clYellow;
      end
     else begin
      Canvas.Pen.Color:=clGray;
      Canvas.Brush.Color:=clGray;
      end;
    Canvas.Rectangle(DeviationStick_X,DeviationStick_Y,DeviationStick_X+DeviationStick_Width,DeviationStick_Y+pbMap__DeviationStick_Height);
    //. show deviation map
    DeviationMap_Size:=pbMap__InfoSize;
    DeviationMap_X:=DeviationStick_X;
    DeviationMap_Y:=DeviationStick_Y+pbMap__DeviationStick_Height+2;
    Canvas.Pen.Color:=clWhite;
    if (flEnabled)
     then Canvas.Brush.Color:=TColor($00400000)
     else Canvas.Brush.Color:=clGray;
    Canvas.Rectangle(DeviationMap_X,DeviationMap_Y,DeviationMap_X+DeviationMap_Size,DeviationMap_Y+DeviationMap_Size);
    DeviationMap_CenterX:=DeviationMap_X+(DeviationMap_Size DIV 2);
    DeviationMap_CenterY:=DeviationMap_Y+(DeviationMap_Size DIV 2);
    Canvas.Pen.Color:=clGreen;
    Canvas.Brush.Color:=clGreen;
    Canvas.Rectangle(DeviationMap_CenterX-3,DeviationMap_CenterY-3,DeviationMap_CenterX+3,DeviationMap_CenterY+3);
    ptrDeviationItem:=DeviationItems;
    while (ptrDeviationItem <> nil) do begin
      D:=Sqrt(sqr(TDeviationItem(ptrDeviationItem^).Latitude-Latitude)+sqr(TDeviationItem(ptrDeviationItem^).Longitude-Longitude));
      DeviationItemX:=DeviationMap_CenterX+Round((TDeviationItem(ptrDeviationItem^).Longitude-Longitude)*(DeviationMap_Size DIV 2)/GeodesyPoints.MaxDeviation);
      DeviationItemY:=DeviationMap_CenterY-Round((TDeviationItem(ptrDeviationItem^).Latitude-Latitude)*(DeviationMap_Size DIV 2)/GeodesyPoints.MaxDeviation);
      Canvas.Pen.Color:=clYellow;
      Canvas.Brush.Color:=clYellow;
      Canvas.Ellipse(DeviationItemX-pbMap_DeviationItemSize,DeviationItemY-pbMap_DeviationItemSize,DeviationItemX+pbMap_DeviationItemSize,DeviationItemY+pbMap_DeviationItemSize);
      //.
      if (ptrDeviationItem = pbMap_SelectedDeviationItemPtr)
       then begin
        Canvas.Pen.Color:=clRed;
        Canvas.Brush.Color:=clRed;
        Canvas.FrameRect(Rect(DeviationItemX-pbMap_DeviationItemSize,DeviationItemY-pbMap_DeviationItemSize,DeviationItemX+pbMap_DeviationItemSize,DeviationItemY+pbMap_DeviationItemSize));
        end;
      //. next item
      ptrDeviationItem:=TDeviationItem(ptrDeviationItem^).Next;
      end;
    //.
    if (flEnabled)
     then Canvas.Brush.Color:=clPurple
     else Canvas.Brush.Color:=clGray;
    Canvas.Font.Color:=clWhite;
    Canvas.TextOut(DeviationMap_X,DeviationMap_Y+DeviationMap_Size+2,'D: '+FormatFloat('0.000000',DeviationFactor));
    end;
  end;
if (pbMap_SelectedDeviationItemPtr <> nil)
 then with TDeviationItem(pbMap_SelectedDeviationItemPtr^) do begin
  if (P0Ptr <> nil)
   then with TGeodesyPointParam(P0Ptr^) do begin
    Xc:=pbMap_MapOffsetX+Round(((X-GeodesyPoints.Xmin)/dX)*SizeX*pbMap_MapScale);
    Yc:=pbMap_MapOffsetY+Round((1-((Y-GeodesyPoints.Ymin)/dY))*SizeY*pbMap_MapScale);
    Canvas.Pen.Color:=clRed;
    Canvas.Brush.Color:=clRed;
    Canvas.FrameRect(Rect(Xc-pbMap_MapPointSize,Yc-pbMap_MapPointSize, Xc+pbMap_MapPointSize,Yc+pbMap_MapPointSize));
    end;
  if (P1Ptr <> nil)
   then with TGeodesyPointParam(P1Ptr^) do begin
    Xc:=pbMap_MapOffsetX+Round(((X-GeodesyPoints.Xmin)/dX)*SizeX*pbMap_MapScale);
    Yc:=pbMap_MapOffsetY+Round((1-((Y-GeodesyPoints.Ymin)/dY))*SizeY*pbMap_MapScale);
    Canvas.Pen.Color:=clRed;
    Canvas.Brush.Color:=clRed;
    Canvas.FrameRect(Rect(Xc-pbMap_MapPointSize,Yc-pbMap_MapPointSize, Xc+pbMap_MapPointSize,Yc+pbMap_MapPointSize));
    end;
  end;
S:='Deviation - Summary: '+FormatFloat('0.000000',GeodesyPoints.SummaryDeviationFactor)+', Max: '+FormatFloat('0.000000',GeodesyPoints.MaxDeviationFactor);
Canvas.Brush.Color:=clPurple;
Canvas.Font.Color:=clYellow;
Canvas.TextOut(Width-Canvas.TextWidth(S),Height-Canvas.TextHeight(S),S);
end;
end;

function TfmCheckGeodesyPoints.pbMap_SelectItemAt(const pX,pY: integer): integer;
var
  dX,dY: double;
  Size,SizeX,SizeY: integer;
  I: integer;
  Xc,Yc: integer;
  D: Extended;
begin
Result:=-1;
if (GeodesyPoints.Items.Count = 0) then Exit; //. ->
dX:=(GeodesyPoints.Xmax-GeodesyPoints.Xmin);
dY:=(GeodesyPoints.Ymax-GeodesyPoints.Ymin);
if (dY > dX)
 then begin
  SizeY:=pbMap_MapSize;
  SizeX:=Round(SizeY*(dX/dY));
  end
 else begin
  SizeX:=pbMap_MapSize;
  SizeY:=Round(SizeX*(dY/dX));
  end;
for I:=0 to GeodesyPoints.Items.Count-1 do with TGeodesyPointParam(GeodesyPoints.Items[I]^) do begin
  Xc:=pbMap_MapOffsetX+Round(((X-GeodesyPoints.Xmin)/dX)*SizeX*pbMap_MapScale);
  Yc:=pbMap_MapOffsetY+Round((1-((Y-GeodesyPoints.Ymin)/dY))*SizeY*pbMap_MapScale);
  D:=Sqrt(sqr(pX-Xc)+sqr(pY-Yc));
  if (D <= (pbMap_MapPointSize DIV 2))
   then begin
    Result:=I;
    Exit; //. ->
    end;
  end;
end;

function TfmCheckGeodesyPoints.pbMap_SelectDeviationItemAt(const pX,pY: integer): pointer;
var
  dX,dY: double;
  SizeX,SizeY: integer;
  I: integer;
  Xc,Yc: integer;
  DeviationStick_X: integer;
  DeviationStick_Y: integer;
  DeviationMap_Size: integer;
  DeviationMap_X: integer;
  DeviationMap_Y: integer;
  DeviationMap_CenterX: integer;
  DeviationMap_CenterY: integer;
  ptrDeviationItem: pointer;
  D: double;
  DeviationItemX: integer;
  DeviationItemY: integer;
begin
Result:=nil;
if (GeodesyPoints.Items.Count = 0) then Exit; //. ->
dX:=(GeodesyPoints.Xmax-GeodesyPoints.Xmin);
dY:=(GeodesyPoints.Ymax-GeodesyPoints.Ymin);
if (dY > dX)
 then begin
  SizeY:=pbMap_MapSize;
  SizeX:=Round(SizeY*(dX/dY));
  end
 else begin
  SizeX:=pbMap_MapSize;
  SizeY:=Round(SizeX*(dY/dX));
  end;
for I:=0 to GeodesyPoints.Items.Count-1 do with TGeodesyPointParam(GeodesyPoints.Items[I]^) do begin
  Xc:=pbMap_MapOffsetX+Round(((X-GeodesyPoints.Xmin)/dX)*SizeX*pbMap_MapScale);
  Yc:=pbMap_MapOffsetY+Round((1-((Y-GeodesyPoints.Ymin)/dY))*SizeY*pbMap_MapScale);
  if (DeviationFactor <> -1.0)
   then begin
    DeviationStick_X:=Xc+(pbMap_MapPointSize DIV 2)+1;
    DeviationStick_Y:=Yc+(pbMap__DeviationStick_Height DIV 2);
    //. show deviation map
    DeviationMap_Size:=pbMap__InfoSize;
    DeviationMap_X:=DeviationStick_X;
    DeviationMap_Y:=DeviationStick_Y+pbMap__DeviationStick_Height+2;
    DeviationMap_CenterX:=DeviationMap_X+(DeviationMap_Size DIV 2);
    DeviationMap_CenterY:=DeviationMap_Y+(DeviationMap_Size DIV 2);
    ptrDeviationItem:=DeviationItems;
    while (ptrDeviationItem <> nil) do begin
      D:=Sqrt(sqr(TDeviationItem(ptrDeviationItem^).Latitude-Latitude)+sqr(TDeviationItem(ptrDeviationItem^).Longitude-Longitude));
      DeviationItemX:=DeviationMap_CenterX+Round((TDeviationItem(ptrDeviationItem^).Longitude-Longitude)*(DeviationMap_Size DIV 2)/GeodesyPoints.MaxDeviation);
      DeviationItemY:=DeviationMap_CenterY-Round((TDeviationItem(ptrDeviationItem^).Latitude-Latitude)*(DeviationMap_Size DIV 2)/GeodesyPoints.MaxDeviation);
      D:=Sqrt(sqr(pX-DeviationItemX)+sqr(pY-DeviationItemY));
      if (D <= (pbMap_DeviationItemSize DIV 2))
       then begin
        Result:=ptrDeviationItem;
        Exit; //. ->
        end;
      //.
      ptrDeviationItem:=TDeviationItem(ptrDeviationItem^).Next;
      end;
    end;
  end;
end;

procedure TfmCheckGeodesyPoints.DisableBadItem;
var
  I: integer;
  MinDeviationFactor: double;
  MinDeviationFactorItemIndex: integer;
begin
MinDeviationFactor:=GeodesyPoints.SummaryDeviationFactor;
MinDeviationFactorItemIndex:=-1;
for I:=0 to GeodesyPoints.Items.Count-1 do if TGeodesyPointParam(GeodesyPoints.Items[I]^).flEnabled then begin
  TGeodesyPointParam(GeodesyPoints.Items[I]^).flEnabled:=false;
  try
  GeodesyPoints.CalculateItemsDeviation(tbDeviationNearItems.Position);
  if (GeodesyPoints.SummaryDeviationFactor < MinDeviationFactor)
   then begin
    MinDeviationFactor:=GeodesyPoints.SummaryDeviationFactor;
    MinDeviationFactorItemIndex:=I;
    end;
  finally
  TGeodesyPointParam(GeodesyPoints.Items[I]^).flEnabled:=true;
  end;
  end;
if (MinDeviationFactorItemIndex <> -1)
 then begin
  TGeodesyPointParam(GeodesyPoints.Items[MinDeviationFactorItemIndex]^).flEnabled:=false;
  GeodesyPoints.CalculateItemsDeviation(tbDeviationNearItems.Position);
  pbMap_SelectedDeviationItemPtr:=nil;
  pbMap_SelectedItemIndex:=MinDeviationFactorItemIndex;
  pbMap.Repaint();
  end
 else begin
  GeodesyPoints.CalculateItemsDeviation(tbDeviationNearItems.Position);
  pbMap_SelectedDeviationItemPtr:=nil;
  Raise Exception.Create('there is no bad item'); //. =>
  end;
end;

procedure TfmCheckGeodesyPoints.pbMapPaint(Sender: TObject);
begin
pbMap_Paint();
end;

procedure TfmCheckGeodesyPoints.tbMapScaleChange(Sender: TObject);
var
  Factor: Extended;
begin
with tbMapScale do begin
Factor:=((Position-Min)/((Max-Min)/2.0))-1;
pbMap_MapScale:=(1.0+Factor)/(1.0-Factor);
pbMap.Repaint();
end;
end;

procedure TfmCheckGeodesyPoints.pbMapMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
if (Button = mbLeft)
 then begin
  pbMap_SelectedItemIndex:=pbMap_SelectItemAt(X,Y);
  if (pbMap_SelectedItemIndex = -1) then pbMap_SelectedDeviationItemPtr:=pbMap_SelectDeviationItemAt(X,Y);
  pbMap.Repaint();
  end
 else
  if (Button = mbRight)
   then begin
    Mouse_flRightButtonDown:=true;
    pbMap.PopupMenu:=pbMap_PopupMenu;
    end;
Mouse_Pos.X:=X;
Mouse_Pos.Y:=Y;
end;

procedure TfmCheckGeodesyPoints.pbMapMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
if (Button = mbRight) then Mouse_flRightButtonDown:=false;
end;

procedure TfmCheckGeodesyPoints.pbMapMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
if (Mouse_flRightButtonDown)
 then begin
  pbMap.PopupMenu:=nil;
  //.
  pbMap_MapOffsetX:=pbMap_MapOffsetX+(X-Mouse_Pos.X);
  pbMap_MapOffsetY:=pbMap_MapOffsetY+(Y-Mouse_Pos.Y);
  pbMap.Repaint();
  end;
//.
Mouse_Pos.X:=X;
Mouse_Pos.Y:=Y;
end;

procedure TfmCheckGeodesyPoints.pbMapDblClick(Sender: TObject);
begin
if (pbMap_SelectedItemIndex <> -1)
 then with TComponentFunctionality_Create(idTGeodesyPoint,TGeodesyPointParam(GeodesyPoints.Items[pbMap_SelectedItemIndex]^).ID) do
  try
  with TPanelProps_Create(false,0,nil,nilObject) do begin
  Position:=poScreenCenter;
  Show;
  end;
  finally
  Release;
  end;
end;

procedure TfmCheckGeodesyPoints.tbDeviationNearItemsChange(Sender: TObject);
begin
GeodesyPoints.CalculateItemsDeviation(tbDeviationNearItems.Position);
lbDeviationNearItemsCount.Caption:=IntToStr(tbDeviationNearItems.Position);
pbMap_SelectedDeviationItemPtr:=nil;
pbMap.Repaint();
end;

procedure TfmCheckGeodesyPoints.tbMapInfoSizeChange(Sender: TObject);
begin
pbMap__InfoSize:=tbMapInfoSize.Position;
pbMap.Repaint();
end;

procedure TfmCheckGeodesyPoints.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action:=caFree;
end;


procedure TfmCheckGeodesyPoints.Enableselecteditem1Click(Sender: TObject);
begin
if (pbMap_SelectedItemIndex <> -1)
 then begin
  TGeodesyPointParam(GeodesyPoints.Items[pbMap_SelectedItemIndex]^).flEnabled:=true;
  GeodesyPoints.CalculateItemsDeviation(tbDeviationNearItems.Position);
  pbMap_SelectedDeviationItemPtr:=nil;
  pbMap.Repaint();
  end;
end;

procedure TfmCheckGeodesyPoints.Disableselecteditem1Click(Sender: TObject);
begin
if (pbMap_SelectedItemIndex <> -1)
 then begin
  TGeodesyPointParam(GeodesyPoints.Items[pbMap_SelectedItemIndex]^).flEnabled:=false;
  GeodesyPoints.CalculateItemsDeviation(tbDeviationNearItems.Position);
  pbMap_SelectedDeviationItemPtr:=nil;
  pbMap.Repaint();
  end;
end;


procedure TfmCheckGeodesyPoints.Enableall1Click(Sender: TObject);
var
  I: integer;
begin
for I:=0 to GeodesyPoints.Items.Count-1 do TGeodesyPointParam(GeodesyPoints.Items[I]^).flEnabled:=true;
GeodesyPoints.CalculateItemsDeviation(tbDeviationNearItems.Position);
pbMap_SelectedDeviationItemPtr:=nil;
pbMap.Repaint();
end;

procedure TfmCheckGeodesyPoints.Disableall1Click(Sender: TObject);
var
  I: integer;
begin
for I:=0 to GeodesyPoints.Items.Count-1 do TGeodesyPointParam(GeodesyPoints.Items[I]^).flEnabled:=false;
GeodesyPoints.CalculateItemsDeviation(tbDeviationNearItems.Position);
pbMap_SelectedDeviationItemPtr:=nil;
pbMap.Repaint();
end;

procedure TfmCheckGeodesyPoints.Disablebaditem1Click(Sender: TObject);
begin
DisableBadItem;
end;


end.
