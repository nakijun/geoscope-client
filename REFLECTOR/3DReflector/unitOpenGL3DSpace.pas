unit unitOpenGL3DSpace;
Interface
Uses
  SysUtils, Windows, Messages, Geometry, Classes, Math, Const3DS, Types3DS, File3DS, Graphics, GraphicEx, OpenGLEx, Forms, Dialogs, GlobalSpaceDefines;

Type
  {3D objects}
  EOpenGLError = class(Exception);

  TGLColor = TVector4f;           // array[0..3] of Single

  PTexPoint = ^TTexPoint;
  TTexPoint = record
    S, T: TGLFLoat;
  end;

  PTexPointArray = ^TTexPointArray;
  TTexPointArray = array[0..0] of TTexPoint;

  PFaceGroup = ^TFaceGroup;
  TFaceGroup = record
    TextureIndex: Integer;        // index into material list
    IndexCount: Cardinal;
    Indices: PIntegerArray;
  end;

  PMaterial = ^TMaterial;
  TMaterial = record
    Ambient,
    Diffuse,
    Specular,
    Emission: TGLColor;
    Shininess: Integer;
    PolygonMode: TGLEnum;       // GL_LINE for wire frame, GL_FILL for all other types
    ShadeModel: TGLEnum;        // GL_FLAT for wire frame and flat shading type, GL_SMOOTH for all other types
    TwoSided: Boolean;
    Texture: String;            // name of a BMP, GIF, PCX, JPG, BW or TGA file to be used as texture
    TextureObject: Cardinal;    // the OpenGL texture object name
    WrapS, WrapT,               // texture wrapping (GL_CLAMP, GL_REPEAT)
    MinFilter,                  // minification filter (GL_NEAREST, GL_LINEAR, GL_NEAREST_MIPMAP_NEAREST etc.)
    MagFilter,                  // magnification filter (GL_NEAREST, GL_LINEAR)
    Mode: Cardinal;             // texture mode (GL_DECAL, GL_MODULATE etc.)
  end;

  PLightSource = ^TLightSource;
  TLightSource = record
    Enabled,
    IsSpot: Boolean;
    Position: TVector;
    Ambient,
    Diffuse,
    Specular: TGLColor;
    SpotDirection: TAffineVector;
    SpotExponent,
    SpotCutOff: Single;
  end;

  PMeshObject = ^TMeshObject;
  TMeshObject = record
    MeshName: String;
    ListName: Cardinal;
    Visible: Boolean;
    Count: Cardinal;            // vertex count, only needed for auto center calculation
    Vertices: PVectorArray;     // comprises all vertices of the object in no particular order
    Normals: PVectorArray;
    TexCoords: PTexPointArray;
    FaceGroups: TList;          // a list of face groups, each comprising a material description and
                                // a list of indices into the VerticesArray array
  end;

  TInstallTextureProc = function (const Material: TMaterial): cardinal of object;

  TMeshes = class(TList)
  public
    Next: TMeshes;
    RefCount: integer;
    idSourceFile: integer;
    idDisplayList: cardinal;
    Background: TBackground3DS;
    BackgroundTexture: Cardinal;

    Constructor Create;
    Constructor CreateFromStream(DATAStream: TMemoryStream; const DATAType: integer; const InstallTextureProc: TInstallTextureProc);
    Destructor Destroy; override;
    procedure Clear;
    procedure DisplayList_Clear;
    procedure DisplayList_Compile;
  end;

const
  MAXSELECT = 128; //. select buffer size
Type
  {SCENE}
  TScene = class
  private
    SelectBuffer: array[0..MAXSELECT-1] of TGLUInt;
  public
    Reflector: TForm;
    RenderingContext: HGLRC;
    //. background settings
    Background: TBackground3DS;
    BackgroundTexture: Cardinal;
    //. main display list
    idDisplayList: cardinal;

    Constructor Create(pReflector: TForm);
    Destructor Destroy; override;
    procedure Clear;
    procedure ClearBuffersAndBackground;
    procedure ApplyPespective;
    procedure SetupLights;
    procedure Recompile(const Mode: TGLEnum; const MaxTimeOfRecompile: integer);
    procedure Reflect(const Mode: TGLEnum; const flRecompile: boolean; const MaxTimeOfRecompile: integer); //. main method for scene painting
    procedure RecompileReflect;
    procedure Refresh;
    function SelectObj(const X,Y: integer): TPtr;
  end;

  procedure Initialize;
  procedure Finalize;

var
  //. space materials
  Materials: TStringList = nil;
  //. space light sources
  Lights: TStringList = nil;


  procedure CheckOpenGLError;

Implementation
Uses
  Functionality,
  {$IFDEF ExternalTypes}
  SpaceTypes,
  {$ENDIF}
  unit3DReflector;


procedure CheckOpenGLError;
// Gets the oldest error from OpenGL engine and tries to clear the error queue.
// Because under some circumstances reading the error code creates a new error
// and thus hanging up the thread, we limit the loop to 6 reads.
var
  GLError: TGLEnum;
  Count: Word;
  Mes: string;
begin
GLError := glGetError;
if GLError <> GL_NO_ERROR
 then begin
  Count := 0;
  while (glGetError <> GL_NO_ERROR) and (Count < 6) do Inc(Count);
  Mes:=gluErrorString(GLError);
  raise EOpenGLError.Create(Mes); //. =>
  end;
end;



{TMeshes}
Constructor TMeshes.Create;
begin
Inherited Create;
Next:=nil;
RefCount:=0;
idSourceFile:=0;
with Background do begin
BgndUsed:=btUseSolidBgnd;
/// - glClearColor(0, 0, 0, 1);
end;
BackgroundTexture:=0;
idDisplayList:=0;
end;

Constructor TMeshes.CreateFromStream(DATAStream: TMemoryStream; const DATAType: integer; const InstallTextureProc: TInstallTextureProc);

  procedure DoAs3DSType; {procedure by Mike Lischke 1999(C)}
  // Notification method used by the main form to tell the viewer to upate its display.
  // Previously loaded data will be freed and, if Reader is <> nil, new data will be loaded.
  // Note: The rendering context must be active because display lists will be created herein.
  //       All converted data (vertices, normals etc.) is kept until a new file is to be loaded
  //       or the viewer is freed.

    //--------------- local functions -------------------------------------------

    function RoundDownToPowerOf2(Value: Integer): Integer;
    var
      LogTwo: Extended;
    begin
    LogTwo := log2(Value);
    if Trunc(LogTwo) < LogTwo then Result := Trunc(Power(2, Trunc(LogTwo)))
                                else Result := Value;
    end;

    //----------------------------------------------------------------------------------------------------------------------

    {$ifopt R+} {$define RangeCheck} {$R-} {$endif}
    function ConvertMeshData(const Version: TReleaseLevel; const Mesh3DS: PMesh3DS; ShowWarnings: Boolean): PMeshObject;
    // Converts the vertex and texture data of the given 3DS mesh into a structure which can
    // directly be send to OpenGL.
    // Note: Passing array references to the local assembler routines is NOT redundant as Delphi
    //       compiles wrong code if a variable of this function (ConvertMeshData) is accessed by a
    //       local asm function. The calculation turns out to be as would there be no stack frame for
    //       the local asm routines, but it *is* there.
    type
      TSmoothIndexEntry = array[0..31] of Cardinal;

      PSmoothIndexArray = ^TSmoothIndexArray;
      TSmoothIndexArray = array[0..0] of TSmoothIndexEntry;
    var
      Marker: PByteArray;
      CurrentVertexCount: Cardinal;
      SmoothIndices: PSmoothIndexArray;

      //--------------- local functions -------------------------------------------

      function IsVertexMarked(P: Pointer; Index: Integer): Boolean; assembler;

      // tests the Index-th bit, returns True if set else False

      asm
                         BT [EAX], EDX
                         SETC AL
      end;

      //---------------------------------------------------------------------------

      function MarkVertex(P: Pointer; Index: Integer): Boolean; assembler;

      // sets the Index-th bit and return True if it was already set else False

      asm
                         BTS [EAX], EDX
                         SETC AL
      end;

      //---------------------------------------------------------------------------

      procedure StoreSmoothIndex(ThisIndex, SmoothingGroup, NewIndex: Cardinal; P: Pointer);

      // Stores new vertex index (NewIndex) into the smooth index array of vertex ThisIndex
      // using field SmoothingGroup, which must not be 0.
      // For each vertex in the vertex array (also for duplicated vertices) an array of 32 cardinals
      // is maintained (each for one possible smoothing group. If a vertex must be duplicated because
      // it has no smoothing group or a different one then the index of the newly created vertex is
      // stored in the SmoothIndices to avoid loosing the conjunction between not yet processed vertices
      // and duplicated vertices.
      // Note: Only one smoothing must be assigned per vertex. Some available models break this rule and
      //       have more than one group assigned to a face. To make the code fail safe the group ID
      //       is scanned for the lowest bit set.

      asm
                       PUSH EBX
                       BSF EBX, EDX                  // determine smoothing group index (convert flag into an index)
                       MOV EDX, [P]                  // get address of index array
                       SHL EAX, 7                    // ThisIndex * SizeOf(TSmoothIndexEntry)
                       ADD EAX, EDX
                       LEA EDX, [4 * EBX + EAX]      // Address of array + vertex index + smoothing group index
                       MOV [EDX], ECX
                       POP EBX
      end;

      //---------------------------------------------------------------------------

      function GetSmoothIndex(ThisIndex, SmoothingGroup: Cardinal; P: Pointer): Cardinal;

      // Retrieves the vertex index for the given index and smoothing group.
      // This redirection is necessary because a vertex might have been duplicated.

      asm
                       PUSH EBX
                       BSF EBX, EDX                  // determine smoothing group index
                       SHL EAX, 7                    // ThisIndex * SizeOf(TSmoothIndexEntry)
                       ADD EAX, ECX
                       LEA ECX, [4 * EBX + EAX]      // Address of array + vertex index + smoothing group index
                       MOV EAX, [ECX]
                       POP EBX
      end;

      //---------------------------------------------------------------------------

      procedure DuplicateVertex(Index: Integer);

      // extends the vector and normal array by one entry and duplicates the vertex data given by Index
      // the marker and texture arrays will be extended too, if necessary

      begin
        // enhance vertex array
        ReallocMem(Result.Vertices, (CurrentVertexCount + 1) * SizeOf(TVector3f));
        Result.Vertices[CurrentVertexCount] := Result.Vertices[Index];

        // enhance normal array
        ReallocMem(Result.Normals, (CurrentVertexCount + 1) * SizeOf(TVector3f));
        Result.Normals[CurrentVertexCount] := NullVector;

        // enhance smooth index array
        ReallocMem(SmoothIndices, (CurrentVertexCount + 1) * SizeOf(TSmoothIndexEntry));
        FillChar(SmoothIndices[CurrentVertexCount], SizeOf(TSmoothIndexEntry), $FF);

        // enhance marker array
        if (CurrentVertexCount div 8) <> ((CurrentVertexCount + 1) div 8) then
        begin
          ReallocMem(Marker, ((CurrentVertexCount + 1) div 8) + 1);
          Marker[(CurrentVertexCount div 8) + 1] := 0;
        end;

        // enhance texture coordinates array
        if assigned(Result.TexCoords) then
        begin
          ReallocMem(Result.TexCoords, (CurrentVertexCount + 1) * SizeOf(TTexVert3DS));
          Result.TexCoords[CurrentVertexCount] := Result.TexCoords[Index];
        end;

        Inc(CurrentVertexCount);
      end;

      //---------------------------------------------------------------------------

      function CountBits(const Value: Cardinal): Cardinal;

      // determines number of set bits in Value

      asm
                       XOR EDX, EDX
                       MOV ECX, 32
      @@1:             SHR EAX, 1
                       ADC EDX, 0
                       DEC ECX
                       JNZ @@1
                       MOV EAX, EDX
      end;

      //--------------- end local functions ---------------------------------------

    var
      Size: Cardinal;
      Material,
      I: Integer;
      FaceGroup: PFaceGroup;
      Vector1,
      Vector2,
      Normal: TAffineVector;
      Face,
      Vertex,
      TargetVertex: Integer;
      SmoothingGroup: Cardinal;
      CurrentIndex: Word;

      WSG: Boolean;

    begin
    with Mesh3DS^ do
    begin
      if NVertices < 3 then
      begin
        // unbelievable, what terrible objects sometimes can be found
        Result := nil;
        Exit; //. ->
      end;
      // make a copy of the vertex data, this must always be available
      CurrentVertexCount := NVertices;
      // New() just calls GetMem, but I want the memory cleared
      Result := AllocMem(SizeOf(TMeshObject));
      Result.MeshName:=Name;
      Result.ListName:=0;
      Result.Visible:=not IsHidden;
      Size := NVertices * SizeOf(TPoint3DS);
      // allocate memory, we do not need to clear it
      GetMem(Result.Vertices, Size);
      // we don't need to consider the local mesh matrix here, since all vertices are already
      // transformed into their final positions
      System.Move(VertexArray^, Result.Vertices^, Size);
      Result.Count:=NVertices;
      // texturing data available (optional)?
      if NTextVerts > 0 then
      begin
        Size := NTextVerts * SizeOf(TTexVert3DS);
        GetMem(Result.TexCoords, Size);
        System.Move(TextArray^, Result.TexCoords^, Size);
      end;
      // allocate memory for the face normal array, the final normal array and the marker array
      Result.Normals := AllocMem(NVertices * SizeOf(TVector3f));
      Marker := AllocMem((NVertices div 8) + 1); // one bit for each vertex
      GetMem(SmoothIndices, NVertices * SizeOf(TSmoothIndexEntry));

      WSG := False;

      if SmoothArray = nil then
      begin
        // no smoothing groups to consider
        for Face := 0 to NFaces - 1 do
        with FaceArray[Face], Result^ do
        begin
          // normal vector for the face
          Vector1 := VectorAffineSubtract(Vertices[V1], Vertices[V2]);
          Vector2 := VectorAffineSubtract(Vertices[V3], Vertices[V2]);
          if Version < rlRelease3 then Normal := VectorCrossProduct(Vector1, Vector2)
                                   else Normal := VectorCrossProduct(Vector2, Vector1);
          // go for each vertex in the current face
          for Vertex := 0 to 2 do
          begin
            // copy current index for faster access
            CurrentIndex := FaceRec[Vertex];
            // already been touched?
            if IsVertexMarked(Marker, CurrentIndex) then
            begin
              // already touched vertex must be duplicated
              DuplicateVertex(CurrentIndex);
              FaceRec[Vertex] := CurrentVertexCount - 1;
              Normals[CurrentVertexCount - 1] := Normal;
            end
            else
            begin
              // not yet touched, so just store the normal
              Normals[CurrentIndex] := Normal;
              MarkVertex(Marker, CurrentIndex);
            end;
          end;
        end;
      end
      else
      begin
        // smoothing groups are to be considered
        for Face := 0 to NFaces - 1 do
        with FaceArray[Face], Result^ do
        begin
          // normal vector for the face
          Vector1 := VectorAffineSubtract(Vertices[V1], Vertices[V2]);
          Vector2 := VectorAffineSubtract(Vertices[V3], Vertices[V2]);
          if Version < rlRelease3 then Normal := VectorCrossProduct(Vector1, Vector2)
                                  else Normal := VectorCrossProduct(Vector2, Vector1);
          SmoothingGroup := SmoothArray[Face];
          if ShowWarnings then
          begin
            if CountBits(SmoothingGroup) > 1 then WSG := True;
          end;

          // go for each vertex in the current face
          for Vertex := 0 to 2 do
          begin
            // copy current index for faster access
            CurrentIndex := FaceRec[Vertex];
            // Has vertex already been touched?
            if IsVertexMarked(Marker, CurrentIndex) then
            begin
              // check smoothing group
              if SmoothingGroup = 0 then
              begin
                // no smoothing then just duplicate vertex
                DuplicateVertex(CurrentIndex);
                FaceRec[Vertex] := CurrentVertexCount - 1;
                Normals[CurrentVertexCount - 1] := Normal;
                // mark new vertex also as touched
                MarkVertex(Marker, CurrentVertexCount - 1);
              end
              else
              begin
                // this vertex must be smoothed, check if there's already a (duplicated) vertex
                // for this smoothing group
                TargetVertex := GetSmoothIndex(CurrentIndex, SmoothingGroup, SmoothIndices);
                if TargetVertex < 0 then
                begin
                  // vertex has not yet been duplicated for this smoothing group, so do it now
                  DuplicateVertex(CurrentIndex);
                  FaceRec[Vertex] := CurrentVertexCount - 1;
                  Normals[CurrentVertexCount - 1] := Normal;
                  StoreSmoothIndex(CurrentIndex, SmoothingGroup, CurrentVertexCount - 1, SmoothIndices);
                  StoreSmoothIndex(CurrentVertexCount - 1, SmoothingGroup, CurrentVertexCount - 1, SmoothIndices);
                  // mark new vertex also as touched
                  MarkVertex(Marker, CurrentVertexCount - 1);
                end
                else
                begin
                  // vertex has already been duplicated, so just add normal vector to other vertex...
                  Normals[TargetVertex] := VectorAffineAdd(Normals[TargetVertex], Normal);
                  // ...and tell which new vertex has to be used from now on
                  FaceRec[Vertex] := TargetVertex;
                end;
              end;
            end
            else
            begin
              // vertex not yet touched, so just store the normal
              Normals[CurrentIndex] := Normal;
              // initialize smooth indices for this vertex
              FillChar(SmoothIndices[CurrentIndex], SizeOf(TSmoothIndexEntry), $FF);
              if SmoothingGroup <> 0 then StoreSmoothIndex(CurrentIndex, SmoothingGroup, CurrentIndex, SmoothIndices);
              MarkVertex(Marker, CurrentIndex);
            end;
          end;
        end;
      end;
      FreeMem(Marker);
      FreeMem(SmoothIndices);
      // finally normalize the Normals array
      with Result^ do
        for I := 0 to CurrentVertexCount - 1 do VectorNormalize(Normals[I]);
      // now go for each material group
      Result.FaceGroups := TList.Create;
      // if there's no face to material assignment then just copy the
      // face definitions and use the preset default material
      if NMats = 0 then
      begin
        FaceGroup := AllocMem(SizeOf(TFaceGroup));
        with FaceGroup^ do
        begin
          TextureIndex := 0;
          IndexCount := 3 * NFaces;
          GetMem(Indices, IndexCount * SizeOf(Integer));
          // copy the face list
          for I := 0 to NFaces - 1 do
          begin
            Indices[3 * I + 0] := FaceArray[I].V1;
            Indices[3 * I + 1] := FaceArray[I].V2;
            Indices[3 * I + 2] := FaceArray[I].V3;
          end;
        end;
        Result.FaceGroups.Add(FaceGroup);
      end
      else
      begin
        for Material := 0 to NMats - 1 do
        begin
          FaceGroup := AllocMem(SizeOf(TFaceGroup));
          with FaceGroup^ do
          begin
            TextureIndex:=Materials.IndexOf(MatArray[Material].Name);
            if TextureIndex = -1 then TextureIndex:=0;
            IndexCount := 3 * MatArray[Material].NFaces;
            GetMem(Indices, IndexCount * SizeOf(Integer));
            // copy all vertices belonging to the current face into our index array,
            // there won't be redundant vertices since this would mean a face has more than one
            // material
            with MatArray[Material] do
              for I := 0 to NFaces - 1 do // NFaces is the one from FaceGroup
              begin
                Indices[3 * I + 0] := FaceArray[FaceIndex[I]].V1;
                Indices[3 * I + 1] := FaceArray[FaceIndex[I]].V2;
                Indices[3 * I + 2] := FaceArray[FaceIndex[I]].V3;
              end;
          end;
          Result.FaceGroups.Add(FaceGroup);
        end;
      end;
    end;
    end;
    {$ifdef RangeCheck} {$undef RangeCheck} {$R+} {$endif}

    procedure ConvertMaterials(const Materials3DS: TMaterialList);
    // Builds an internal list with values which can directly sent to OpenGL. If no materials are defined then
    // a default material is used.
    const DefaultMaterial: TMaterial =
            (Ambient: (0.1, 0.1, 0.1, 1);
             Diffuse: (0.5, 0.5, 0.5, 1);
             Specular: (1, 1, 1, 1);
             Emission: (0, 0, 0, 1);
             Shininess: 128;
             PolygonMode: GL_FILL;
             ShadeModel: GL_SMOOTH;
             TwoSided: False;
             );
    var
      I: Integer;
      Material: PMaterial;
    begin
    if (Materials3DS.Count = 0) AND (Materials.Count = 0) then
    begin
      // Instead of directly adding the constant record to the list I use a dynamic variable here,
      // else I would have to undertake effort to determine whether to free the data or not in the
      // ClearLists method.
      Material := AllocMem(SizeOf(TMaterial));
      Material^ := DefaultMaterial;
      Materials.AddObject('Default', Pointer(Material));
    end
    else
      for I := 0 to Materials3DS.Count - 1 do
      begin
        with Materials3DS[I]^ do
        begin
          if Materials.IndexOf(Name) <> -1 then Continue;
          Material := AllocMem(SizeOf(TMaterial));
          Material.Ambient := MakeVector([Ambient.R, Ambient.G, Ambient.B, Abs(Transparency)]);
          Material.Diffuse := MakeVector([Diffuse.R, Diffuse.G, Diffuse.B, Abs(Transparency)]);
          Material.Specular := MakeVector([Specular.R, Specular.G, Specular.B, Abs(Transparency)]);
          Material.Shininess := Round(Shininess * 128);
          { don't know how to apply the percentage emission value to be a emission color
          if SelFillum then
          begin
            Material.Emission := Material.Diffuse;
            VectorScale(Material.Emission, SelfIllumPct);
          end;}
          // shading must be expressed in several OpenGL flags
          Material.PolygonMode := GL_LINE;
          Material.ShadeModel := GL_FLAT;
          if Shading > stWire then Material.PolygonMode := GL_FILL;
          // Gouraud, Phong and Metal shading are all expressed as Gouraud shading since this is
          // the only smoothing type OpenGL can render
          if Shading > stFlat then Material.ShadeModel := GL_SMOOTH;
          Material.TwoSided := TwoSided;

          // currently default values for texturing
          Material.WrapS := GL_REPEAT;
          Material.WrapT := GL_REPEAT;
          Material.MinFilter := GL_NEAREST;
          Material.MagFilter := GL_NEAREST;
          // also this is just a guess, since I haven't found any description when to use
          // decal and when modulated texturing (might well be that we even need GL_BLEND
          // here to implement the texture strength value)
          if (Shininess = 0) {or (VectorLength(Material.Diffuse) = 0)} then
            Material.Mode := GL_DECAL
                                                                     else
            Material.Mode := GL_MODULATE;
          Material.Texture := Texture.Map.Name;
          Material.TextureObject:=InstallTextureProc(Material^);

          Materials.AddObject(Name, Pointer(Material));
        end;
      end;
    end;

    procedure ConvertLightSources(const Objects: TObjectList);
    // Builds an internal list with values which can directly sent to OpenGL.
    var
      Light: PLightSource;
      I: Integer;
    begin
    with Objects do
    begin
      for I := 0 to OmniLightCount - 1 do
      begin
        Light := AllocMem(SizeOf(TLightSource));
        Lights.AddObject(OmniLight[I].Name, Pointer(Light));
        with Light^, OmniLight[I]^ do
        begin
          Enabled := not DLOff;
          IsSpot := False;
          Position := MakeVector([Pos.X, Pos.Y, Pos.Z, 1]);
          // we have only one color (don't know exactly how to distribute)
          Ambient := MakeVector([Color.R / 5, Color.G / 5, Color.B / 5, 1]);
          Diffuse := MakeVector([Color.R, Color.G, Color.B, 1]);
          Specular := MakeVector([Color.R, Color.G, Color.B, 1]);
          // needed to reset spot characteristic if it is was enabled before
          SpotCutOff := 180;
        end;
      end;

      for I := 0 to SpotLightCount - 1 do
      begin
        Light := AllocMem(SizeOf(TLightSource));
        Lights.AddObject(SpotLight[I].Name, Pointer(Light));
        with Light^, SpotLight[I]^ do
        begin
          Enabled := not DLOff;
          IsSpot := True;
          Position := MakeVector([Pos.X, Pos.Y, Pos.Z, 1]);
          // we have only one color (don't know exactly how to distribute)
          Ambient := MakeVector([Color.R / 5, Color.G / 5, Color.B / 5, 1]);
          Diffuse := MakeVector([Color.R, Color.G, Color.B, 1]);
          Specular := MakeVector([Color.R, Color.G, Color.B, 1]);

          with Spot^ do
          begin
            SpotDirection := MakeAffineVector([Target.X - Pos.X, Target.Y - Pos.Y, Target.Z - Pos.Z]);
            SpotExponent := 0; // can the HotSpot angle be used here?
            SpotCutOff := FallOff;
          end;
        end;
      end;
    end;
    end;

    //----------------------------------------------------------------------------------------------------------------------

    function CreateTextureObject(DC: HDC; Bitmap: TBitmap; MinFilter, MagFilter: Cardinal): Cardinal;
    // creates a 2D texture object from the given bitmap which must have width and height as being power of 2
    var J: Integer;
        Data: PByteArray;
        BMInfo: TBitmapInfo;
        ImageSize: Cardinal;
        Temp: Byte;
    begin
    Result := 0;
    if (Bitmap.Height > 2) and (Bitmap.Width > 2) then
    begin
      glGenTextures(1, @Result);
      glBindTexture(GL_TEXTURE_2D, Result);

      // get color components
      with BMinfo.bmiHeader do
      begin
        // create description of the required image format
        FillChar(BMInfo, SizeOf(BMInfo), 0);
        biSize := SizeOf(TBitmapInfoHeader);
        biBitCount := 24;
        biWidth := Bitmap.Width;
        // I want a top-down bitmap. It seems that a positive value in biHeight will always flip
        // the image (even if it is already a bottom-up image).
        biHeight := Bitmap.Height;
        if Cardinal(Bitmap.ScanLine[0]) < Cardinal(Bitmap.ScanLine[1]) then biHeight := - biHeight;
        ImageSize := Bitmap.Width * Bitmap.Height;
        biPlanes := 1;
        biCompression := BI_RGB;
        GetMem(Data, ImageSize * 3);
        try
          // get the actual bits of the image
          GetDIBits(DC, Bitmap.Handle, 0, Bitmap.Height, Data, BMInfo, DIB_RGB_COLORS);

          // Now set the bits depending on the features supported by OpenGL.
          if GL_EXT_bgra then
            // BGR extension avoids color component swapping
            if (MinFilter = GL_NEAREST) or (MinFilter = GL_LINEAR)
              then glTexImage2d(GL_TEXTURE_2D, 0, 3, biWidth, Bitmap.Height, 0, GL_BGR_EXT, GL_UNSIGNED_BYTE, Data)
              else gluBuild2DMipmaps(GL_TEXTURE_2D, 3, biWidth, Bitmap.Height, GL_BGR_EXT, GL_UNSIGNED_BYTE, Data)
            else
            begin
              // No BGR support, so we must swap the color components manually.
              {$ifopt R+} {$define RangeCheck} {$R-} {$endif}
              for J := 0 to ImageSize - 1 do // swap blue with red to go from bgr to rgb
              begin
                Temp := Data[J * 3];
                Data[J * 3]:=Data[J * 3 + 2];
                Data[J * 3 + 2] := Temp;
              end;
              {$ifdef RangeCheck} {$undef RangeCheck} {$R+} {$endif}
              if (MinFilter = GL_NEAREST) or (MinFilter = GL_LINEAR)
                then glTexImage2d(GL_TEXTURE_2D, 0, 3, biWidth, Bitmap.Height, 0, GL_RGB, GL_UNSIGNED_BYTE, Data)
                else gluBuild2DMipmaps(GL_TEXTURE_2D, 3, biWidth, Bitmap.Height, GL_RGB, GL_UNSIGNED_BYTE, Data);
            end;
        finally
          FreeMem(Data);
        end;
      end;
    end;
    end;

    //--------------- end local functions ---------------------------------------

  var
      Reader: TFile3DS;
      I, J: Integer;
      Mesh: PMeshObject;
      Release: TReleaseLevel;
      TotalCount: Cardinal;
  //    CurrentFrameFlags: Word;
      ParentMotionIndex,
      CurrentMeshIndex: Integer;
      Matrix,
      Matrix2: TMatrix;
      Picture: TPicture;
      TargetWidth,
      TargetHeight: Integer;
      MemDC: HDC;
  begin
  // clear previously allocated data
  //. read file data
  Reader:=TFile3DS.Create;
  with Reader do
  try
  Reader.LoadFromStream(DataStream);
  if Reader.Objects.MeshCount > 0 then
  begin
    // make sure we have a valid release level
    Release := Reader.MeshRelease;
    // database release overrides mesh release
    if (Release = rlReleaseNotKnown) or (Release < Reader.DatabaseRelease)  then Release := Reader.DatabaseRelease;
    if Release = rlReleaseNotKnown then Release := rlRelease3;

    ConvertMaterials(Reader.Materials);

    // prepare mesh structure
    Capacity := Reader.Objects.MeshCount;
    // create display lists
    TotalCount:=0;
    for I:=0 to Reader.Objects.MeshCount-1 do begin
      //. allocate new mesh structure and fill it with mesh data
      Mesh:=ConvertMeshData(Release,Reader.Objects.Mesh[I],False);
      //. meshs without vertices or containing errors don't get into our list
      if Mesh <> nil
       then begin
        Inc(TotalCount, Mesh.Count);
        Add(Mesh);
        end;
      end;

    ConvertLightSources(Reader.Objects);

    CheckOpenGLError;
  end;
  finally
  Destroy;
  end;
  end;

  procedure DoAsMAXType;
  begin
  end;

begin
Create;
case TComponentFileType(DATAType) of
cft3DS: DoAs3DSType; {do and release DataStream}
cftMAX: DoAsMAXType;
else
  Raise Exception.Create('can not use data of this type');
end;
end;

Destructor TMeshes.Destroy;
begin
Clear;
Inherited;
end;

procedure TMeshes.DisplayList_Clear;
begin
if idDisplayList <> 0
 then begin
  glDeleteLists(idDisplayList,1);
  idDisplayList:=0;
  end;
end;

procedure TMeshes.Clear;
var
  I,J: integer;
begin
//. clear meshes slots
for I:=0 to Count-1 do with PMeshObject(List[I])^ do begin
  if ListName <> 0 then glDeleteLists(ListName,1);
  if Assigned(Vertices) then FreeMem(Vertices);
  if Assigned(Normals) then FreeMem(Normals);
  if Assigned(TexCoords) then FreeMem(TexCoords);
  //. free material assignment data
  for J:=0 to FaceGroups.Count-1 do begin
    FreeMem(PFaceGroup(FaceGroups[J]).Indices);
    FreeMem(FaceGroups[J]);
    end;
  FaceGroups.Free;
  FreeMem(List[I]);
  end;
Inherited Clear;
//. clear main display list
DisplayList_Clear;
end;

procedure TMeshes.DisplayList_Compile;
var
  I,J: integer;
  Release: TReleaseLevel;
begin
//. clear last display list
DisplayList_Clear;
//. allocate and create a new display list
idDisplayList:=glGenLists(1);
glNewList(idDisplayList,GL_COMPILE);
try
for I := 0 to Count-1 do with PMeshObject(List[I])^ do begin
  //. allocate and compile a new display list
  ListName:=0; /// - glGenLists(1);
  /// - glNewList(ListName, GL_COMPILE);
  try
  if Release < rlRelease3 then glFrontFace(GL_CW)
                          else glFrontFace(GL_CCW);
  glVertexPointer(3, GL_FLOAT, 0, Vertices);
  glEnableClientState(GL_VERTEX_ARRAY);
  //. enable the normal array if available
  if assigned(Normals)
   then begin
    glNormalPointer(GL_FLOAT, 0, Normals);
    glEnableClientState(GL_NORMAL_ARRAY);
    end
   else
    glDisableCLientState(GL_NORMAL_ARRAY);
  //. enable the texture coordinates array if available
  if Assigned(TexCoords)
   then begin
    glTexCoordPointer(2, GL_FLOAT, 0, TexCoords);
    glEnableClientState(GL_TEXTURE_COORD_ARRAY);
    end
   else
    glDisableCLientState(GL_TEXTURE_COORD_ARRAY);
  for J := 0 to FaceGroups.Count - 1 do with PFaceGroup(FaceGroups[J])^ do begin
    //. apply materials
    with PMaterial(Materials.Objects[TextureIndex])^ do begin
    if ((0 <= Shininess) AND (Shininess <= 128))
     then
      glMateriali(GL_FRONT_AND_BACK, GL_SHININESS, Shininess)
     else //. avoid opengl exception
      glMateriali(GL_FRONT_AND_BACK, GL_SHININESS, 128);
    glMaterialfv(GL_FRONT_AND_BACK, GL_EMISSION, @Emission);
    glMaterialfv(GL_FRONT_AND_BACK, GL_AMBIENT, @Ambient);
    glMaterialfv(GL_FRONT_AND_BACK, GL_DIFFUSE, @Diffuse);
    glMaterialfv(GL_FRONT_AND_BACK, GL_SPECULAR, @Specular);

    glPolygonMode(GL_FRONT_AND_BACK, PolygonMode);
    glShadeModel(ShadeModel);
    if TwoSided then glDisable(GL_CULL_FACE)
                else glEnable(GL_CULL_FACE);
    //. texturing
    if TextureObject <> 0
     then begin
      glBindTexture(GL_TEXTURE_2D, TextureObject);
      glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, WrapS);
      glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, WrapT);
      glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, MinFilter);
      glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, MagFilter);
      glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, Mode);
      glEnable(GL_TEXTURE_2D);
      end
     else
      glDisable(GL_TEXTURE_2D);
    //. ambient, diffuse and specular colors values contain the same blend (alpha) factor
    if Ambient[3] > 0
     then begin
      glEnable(GL_BLEND);
      //. depth buffer should be disabled while rendering semi transparent surfaces but
      //. leads often to somewhat strange results as the mesh aren't sorted properly
      /// ? glDepthMask(GL_FALSE);
      glBlendFunc(GL_ONE_MINUS_SRC_ALPHA, GL_SRC_ALPHA);
      end
     else begin
      glDisable(GL_BLEND);
      /// ? glDepthMask(GL_TRUE);
      end;
    end;
    //. now draw the mesh data
    glDrawElements(GL_TRIANGLES, IndexCount, GL_UNSIGNED_INT, Indices);
    end;
  //. finished compiling this display list
  finally
  /// - glEndList;
  end;
  CheckOpenGLError;
  end;
finally
glEndList;
end;
end;





{TScene}
Constructor TScene.Create(pReflector: TForm);
var
  ColorDepth: integer;
begin
Inherited Create;
Reflector:=pReflector;
ColorDepth:=GetDeviceCaps(Reflector.Canvas.Handle, BITSPIXEL) * GetDeviceCaps(Reflector.Canvas.Handle, PLANES);
RenderingContext:=CreateRenderingContext(Reflector.Canvas.Handle, [opDoubleBuffered], ColorDepth, 0);
ActivateRenderingContext(Reflector.Canvas.Handle, RenderingContext);
// set some default options and values in the context
glEnable(GL_DEPTH_TEST);
glEnable(GL_CULL_FACE);
glEnable(GL_LIGHTING);
glEnable(GL_NORMALIZE);
if ColorDepth < 24 then glEnable(GL_DITHER)
                   else glDisable(GL_DITHER);
glHint(GL_PERSPECTIVE_CORRECTION_HINT, GL_NICEST);
glSelectBuffer(SizeOf(SelectBuffer),@SelectBuffer);
with Background do begin
BgndUsed:=btUseSolidBgnd;
glClearColor(0, 0, 0, 1);
end;
BackgroundTexture:=0;
idDisplayList:=0;
end;

Destructor TScene.Destroy;
begin
Clear;
DeactivateRenderingContext;
DestroyRenderingContext(RenderingContext);
Inherited;
end;

//.----------------------------------------------------------------------------------------------------------------------

procedure TScene.ClearBuffersAndBackground;
// Prepares OGL buffers for one paint cycle and clears the background of the window. If there's a
// defined background in the 3DS data then this is used else a default solid colored one.
var
  MidPos: Single;
begin
case Background.BgndUsed of
  btUseSolidBgnd: // just clear background and depth buffer, color has already been set
    glClear(GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT);
  btUseVGradientBgnd, // create a vertical gradient or
  btUseBitmapBgnd:    // bitmapped background
    begin
      glDisable(GL_LIGHTING);
      glDisable(GL_DEPTH_TEST);

      glMatrixMode(GL_MODELVIEW);
      glPushMatrix;
      glLoadIdentity;
      glMatrixMode(GL_PROJECTION);
      glPushMatrix;
      glLoadIdentity;
      with TGL3DReflector(Reflector).Cameras.ActiveCamera.ProjectionViewport do
      begin
        glOrtho(0, Width - 1, 0, Height - 1, 0, 100);
        // draw two quads to simulate gradient background
        glFrontFace(GL_CCW);
        if Background.BgndUsed = btUseBitmapBgnd then
        begin
          glEnable(GL_TEXTURE_2D);
          glBindTexture(GL_TEXTURE_2D, BackgroundTexture);
          glBegin(GL_QUAD_STRIP);
            glTexCoord2f(0, 0);
            glVertex2f(0, 0);
            glTexCoord2f(1, 0);
            glVertex2f(Width - 1, 0);
            glTexCoord2f(0, 1);
            glVertex2f(0, Height - 1);
            glTexCoord2f(1, 1);
            glVertex2f(Width - 1, Height - 1);
          glEnd;
        end
        else
        begin
          glDisable(GL_TEXTURE_2D);
          with Background.VGradient do
          begin
            MidPos := Height * GradPercent;
            glBegin(GL_QUAD_STRIP);
              glColor3f(Bottom.R, Bottom.G, Bottom.B);
              glVertex2f(0, 0);
              glVertex2f(Width - 1, 0);
              glColor3f(Mid.R, Mid.G, Mid.B);
              glVertex2f(0, MidPos);
              glVertex2f(Width - 1, MidPos);
              glColor3f(Top.R, Top.G, Top.B);
              glVertex2f(0, Height - 1);
              glVertex2f(Width - 1, Height - 1);
            glEnd;
          end;
        end;
      end;
      glMatrixMode(GL_MODELVIEW);
      glPopMatrix;
      glMatrixMode(GL_PROJECTION);
      glPopMatrix;

      glEnable(GL_LIGHTING);
      glEnable(GL_DEPTH_TEST);
      glClear(GL_DEPTH_BUFFER_BIT); // clear only depth buffer
    end;
else
  // solid background for not yet implemented backgrounds
  glClear(GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT);
end;
end;

//----------------------------------------------------------------------------------------------------------------------
procedure TScene.ApplyPespective;
begin
with TGL3DReflector(Reflector).Cameras.ActiveCamera do begin
glMatrixMode(GL_PROJECTION);
glLoadIdentity;
case ProjectionType of
cptOrtho: ;
cptFrustum: with ClippingPlanes do glFrustum(Left,Right,Bottom,Top, Near,Far);
cptPerspective: ;
end;
with TGL3DReflector(Reflector).Cameras.ActiveCamera.ProjectionViewPort do glViewPort(Left,Top, Width,Height);
end;
end;
//----------------------------------------------------------------------------------------------------------------------

procedure TScene.SetupLights;
// initializes OpenGL light sources from our FLights list
const L1: TVector4f = (113600, -322900, 100000, 1);
      L2: TVector4f = (-245001, 427300, 200000, 1);

      A: TVector4f = (0.7, 0.7, 0.7, 1);
      D: TVector4f = (2.0, 2.0, 2.0, 1);
      S: TVector4f = (7.0, 7.0, 7.0, 1);

var
  I: Integer;
  MaxLights: Integer;
  SpotOff: Single;
  L: TVector4f;
  LSpotOff: Single;
begin
SpotOff:=180;
LSpotOff:=180;
// setup two default light sources if none are defined in the 3DS file
if true {/// - Lights.Count = 0)} then
begin
  {glEnable(GL_LIGHT0);
  glLightfv(GL_LIGHT0, GL_POSITION, @L1);
  glLightfv(GL_LIGHT0, GL_AMBIENT, @A);
  glLightfv(GL_LIGHT0, GL_DIFFUSE, @D);
  glLightfv(GL_LIGHT0, GL_SPECULAR, @S);
  glLightfv(GL_LIGHT0, GL_SPOT_CUTOFF, @SpotOff);

  glEnable(GL_LIGHT1);
  glLightfv(GL_LIGHT1, GL_POSITION, @L2);
  glLightfv(GL_LIGHT1, GL_AMBIENT, @A);
  glLightfv(GL_LIGHT1, GL_DIFFUSE, @D);
  glLightfv(GL_LIGHT1, GL_SPECULAR, @S);
  glLightfv(GL_LIGHT1, GL_SPOT_CUTOFF, @SpotOff);}

  //. set light at eye of explorer
  with TGL3DReflector(Reflector).Cameras.ActiveCamera do begin
  L[0]:=Translate_X; L[1]:=Translate_Y; L[2]:=Translate_Z;
  L[3]:=1;
  end;
  glEnable(GL_LIGHT2);
  glLightfv(GL_LIGHT2, GL_POSITION, @L);
  glLightfv(GL_LIGHT2, GL_AMBIENT, @A);
  glLightfv(GL_LIGHT2, GL_DIFFUSE, @D);
  glLightfv(GL_LIGHT2, GL_SPECULAR, @S);
  glLightfv(GL_LIGHT2, GL_SPOT_CUTOFF, @LSpotOff);
end
else
begin
  // determine maximum number of supported light sources (8 are guaranteed)
  glGetIntegerv(GL_MAX_LIGHTS, @MaxLights);
  // only access as many lightsources as supported by the OpenGL implentation
  if Lights.Count < MaxLights then MaxLights := Lights.Count;
  for I := 0 to MaxLights - 1 do
  with PLightSource(Lights.Objects[I])^ do
  begin
    if Enabled then glEnable(GL_LIGHT0 + I)
               else glDisable(GL_LIGHT0 + I);
    glLightfv(GL_LIGHT0 + I, GL_POSITION, @Position);
    glLightfv(GL_LIGHT0 + I, GL_AMBIENT, @Ambient);
    glLightfv(GL_LIGHT0 + I, GL_DIFFUSE, @Diffuse);
    glLightfv(GL_LIGHT0 + I, GL_SPECULAR, @Specular);
    if IsSpot then
    begin
      glLightfv(GL_LIGHT0 + I, GL_SPOT_DIRECTION, @SpotDirection);
      glLightfv(GL_LIGHT0 + I, GL_SPOT_EXPONENT, @SpotExponent);
      glLightfv(GL_LIGHT0 + I, GL_SPOT_CUTOFF, @SpotCutOff);
    end
    else // switch off spot light property by setting the spot cut off to 180°
      glLightfv(GL_LIGHT0 + I, GL_SPOT_CUTOFF, @SpotOff);
  end;
end;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TScene.Clear;
begin
ClearBuffersAndBackground;
if BackgroundTexture <> 0
 then begin
  glDeleteTextures(1,@BackgroundTexture);
  BackgroundTexture:=0;
  end;
if idDisplayList <> 0
 then begin
  glDeleteLists(idDisplayList,1);
  idDisplayList:=0;
  end;
end;

procedure TScene.Recompile(const Mode: TGLEnum; const MaxTimeOfRecompile: integer);
label
  EndOfRecompile;
var
  ptrReflLay: pointer;
var
  ptrItem: pointer;
  Obj: TSpaceObj;
  TimeStamp: TTimeStamp;
begin
with TGL3DReflector(Reflector).Reflecting do
try
Clear;
idDisplayList:=glGenLists(1);
glNewList(idDisplayList,GL_COMPILE);
try
ptrReflLay:=Lays;
TimeStamp:=DateTimeToTimeStamp(Now);
while ptrReflLay <> nil do with TLayReflect(ptrReflLay^) do begin
  ptrItem:=Objects;
  while ptrItem <> nil do with TItemLayReflect(ptrItem^) do begin
    if (MaxTimeOfRecompile <> 0) AND ((DateTimeToTimeStamp(Now).Time-TimeStamp.Time) >= MaxTimeOfRecompile) then GoTo EndOfRecompile;
    Reflector.Space.ReadObj(Obj,SizeOf(Obj), ptrObject);
    try
    with TBaseVisualizationFunctionality(TComponentFunctionality_Create(Obj.idTObj,Obj.idObj)) do
    try
    FPtr:=ptrObject; //. avoid stupid Ptr searching
    UpdateDATA; //. update functionality own properties
    if Mode = GL_SELECT then glLoadName(Integer(FPtr));
    ReflectInScene(Self);
    finally
    Release;
    end;
    except
      end;
    //.
    ptrItem:=ptrNext;
    end;
  if flTransfered then Break; //. >
  ptrReflLay:=ptrNext;
  end;
EndOfRecompile:
finally
glEndList;
end;
finally
//. do nothing
end;
end;

procedure TScene.Reflect(const Mode: TGLEnum; const flRecompile: boolean; const MaxTimeOfRecompile: integer);
// This is the main paint routine. If there's no data assigned yet then an empty window is drawn else the data stored
// in the various lists. These lists must already be set up.

  procedure ReflectCoordinateMesh(const Step: Extended);
  var
    OrgX,X,Y: Extended;
    MinCount,MaxCount: integer;
    I,J,XLinesCount,YLinesCount: integer;
  begin
  glDisable(GL_LIGHTING);
  glDisable(GL_TEXTURE_2D);
  glEnable(GL_LINE_STIPPLE);
  try
  glLineWidth(1);
  glLineStipple(1, 5{0101b});
  glColor4f(0.1,0.1,0.1, 1.0);
  with TGL3DReflector(Reflector).ReflectionWindow.ContainerCoord do begin
  MinCount:=Trunc(Xmin/Step); MaxCount:=Trunc(Xmax/Step);
  OrgX:=MinCount*Step; XLinesCount:=MaxCount-MinCount;
  MinCount:=Trunc(Ymin/Step); MaxCount:=Trunc(Ymax/Step);
  Y:=MinCount*Step; YLinesCount:=MaxCount-MinCount;
  glBegin(GL_POINTS);
  for I:=0 to YLinesCount-1 do begin
    X:=OrgX;
    for J:=0 to XLinesCount-1 do begin
      glVertex3f(X,Y,0);
      X:=X+Step;
      end;
    Y:=Y+Step;
    end;
  glEnd;
  end;
  finally
  glDisable(GL_LINE_STIPPLE);
  end;
  end;

  procedure ReflectXOYPlaneShootPoint;
  var
    T: Extended;
    X,Y: Extended;
  begin
  with TGL3DReflector(Reflector).Cameras.ActiveCamera.EyeAxis do begin
  T:=-Z0/N;
  X:=X0+T*L;
  Y:=Y0+T*M;
  glPushMatrix;
  glTranslatef(X,Y,0);
  glDisable(GL_LIGHTING);
  glDisable(GL_TEXTURE_2D);
  glLineWidth(1);
  glColor4f(2.0,0,0, 1);
  glBegin(GL_LINES);
  glVertex3f(-10,0,0);
  glVertex3f(10,0,0);
  glEnd;
  glBegin(GL_LINES);
  glVertex3f(0,-10,0);
  glVertex3f(0,10,0);
  glEnd;
  glEnable(GL_LIGHTING);
  glPopMatrix;
  end;
  end;

begin
// Note: We don't need to activate the rendering context here, as we did this in the OnShow event
//       handler and we have setup the window to use a private DC (which is therefore never reset).
ClearBuffersAndBackground;
//. prepare projection matrix by active camera
ApplyPespective;
{initialize transformation pipeline}
glMatrixMode(GL_MODELVIEW);
glLoadIdentity;
//. prepare modelview matrix by active camera
with TGL3DReflector(Reflector).Cameras.ActiveCamera do begin
glRotatef(-Rotate_AngleY, 0,1,0);
glRotatef(-Rotate_AngleX, 1,0,0);
glRotatef(-Rotate_AngleZ, 0,0,1);
glTranslatef(-Translate_X,-Translate_Y,-Translate_Z);
end;
//. recompile if needed
if flRecompile then Recompile(Mode,MaxTimeOfRecompile);
//. reflect lays meshes display list
glCallList(idDisplayList);
//. setup space lights-sources
SetupLights;
//. show XOY plane shootpoint
ReflectXOYPlaneShootPoint;
//. show coordinates mesh
/// ? ReflectCoordinateMesh(100);
//. copy back buffer to front
SwapBuffers(Reflector.Canvas.Handle);
CheckOpenGLError;
end;

procedure TScene.RecompileReflect;
begin
Reflect(GL_RENDER,true,0);
end;

procedure TScene.Refresh;
begin
if idDisplayList <> 0 then Reflect(GL_RENDER,false,0);
end;

function TScene.SelectObj(const X,Y: integer): TPtr;
var
  vp: TVector4i;
  hits: TGLInt;
begin
Result:=nilPtr;
glRenderMode(GL_SELECT);
glInitNames;
glPushName(0);
glGetIntegerv(GL_VIEWPORT, @vp);
//. init projection
glMatrixMode(GL_PROJECTION);
glLoadIdentity;
gluPickMatrix(X,Y, 1,1,vp);
with TGL3DReflector(Reflector).Cameras.ActiveCamera do
case ProjectionType of
cptOrtho: ;
cptFrustum: with ClippingPlanes do glFrustum(Left,Right,Bottom,Top, Near,Far);
cptPerspective: ;
end;
//. Reflect for selecting
ClearBuffersAndBackground;
{initialize transformation pipeline}
glMatrixMode(GL_MODELVIEW);
glLoadIdentity;
//. prepare modelview matrix by active camera
with TGL3DReflector(Reflector).Cameras.ActiveCamera do begin
glRotatef(-Rotate_AngleY, 0,1,0);
glRotatef(-Rotate_AngleX, 1,0,0);
glRotatef(-Rotate_AngleZ, 0,0,1);
glTranslatef(-Translate_X,-Translate_Y,-Translate_Z);
end;
//. recompile
Recompile(GL_SELECT,0);
//. reflect lays meshes display list
glCallList(idDisplayList);
//. copy back buffer to front
SwapBuffers(Reflector.Canvas.Handle);
CheckOpenGLError;
//.
hits:=glRenderMode(GL_RENDER);
if hits > 0 then Result:=SelectBuffer[3];
glPopName;
end;


procedure Initialize;
begin
//. finalize last
Finalize;
//. initializing
InitOpenGL;
Materials:=TStringList.Create;
Lights:=TStringList.Create;
end;

procedure Finalize;
var
  I: integer;
begin
if Lights <> nil
 then with Lights do begin
  //. clear light sources
  for I:=0 to Count-1 do begin
    glDisable(GL_LIGHT0+I);
    FreeMem(Pointer(Objects[I]),SizeOf(TLightSource));
    end;
  //.
  Destroy;
  Lights:=nil;
  end;
if Materials <> nil
 then with Materials do begin
  //. clear material list
  for I := 0 to Count - 1 do begin
    try
    if PMaterial(Objects[I])^.TextureObject <> 0
     then glDeleteTextures(1, @PMaterial(Objects[I])^.TextureObject);
    except
      on E: Exception do ShowMessage(E.Message);
      end;
    FreeMem(Pointer(Objects[I]),SizeOf(TMaterial));
    end;
  //.
  Destroy;
  Materials:=nil;
  end;
CloseOpenGL;
end;

Initialization
//. do nothing

Finalization
Finalize;
end.
