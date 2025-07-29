# Welcome to Render-Hell!  🔥📟

> [!IMPORTANT]
> Each Render-Hell feature has a dedicated sample.  
Samples-only dependencies are not explicitely written as `dependencies` but reported as `devDependencies` in the **package.json** to facilitate importing

## Table of Contents

1. [How to use Brush3D](#how-to-use-brush3d)
   - [How should the underlying material be](#how-should-the-underlying-material-be)
   - [Brush3DProperties](#brush3dproperties)
   - [The interface](#the-interface)

## How to use Brush3D

Brush3D is created via static API with a single method:  
```
IBrush3D CreateBrush3D(MeshRenderer meshRenderer, MeshFilter meshFilter, Brush3DProperties intersectingProperties)
```
**MeshRenderer** --> Will be used to get the reference Material  
**MeshFilter** --> Will be used for world-object conversions  
**Brush3DProperties** --> Intersecting properties, dictate material properties of preview sphere

## How should the underlying material be

Brush3D utilize the **Material** on the **MeshRenderer** passed to the API, in order to be functional this material should meet these requirements:
- Have this #include in the material header:  
  `#include "Packages/com.ingsorre97.render-hell/Runtime/Brush3D/Shader/Brush3D.cginc"`

- Have this property on VertexToFragmentData:  
  `float3 brush3DNormalizedUV`  

- Call this function on vertex shader, where `v.vertex` is POSITION and `o` is VertexToFragmentData  
  `o.brush3DNormalizedUV = ComputeBrush3DNormalizedUV(v.vertex.xyz);`

- Call this function on fragment shader, where `color`, `rimColor`, `rimPower` are your material properties  
  `brushProperties brushProperties = GetBrush3DStoredProperties(i.brush3DNormalizedUV, color, rimColor, rimPower);`  
  Use brushProperties output in further shader

### TL:DR
In `Samples` you will find a shader `Standard-HLSL` already set-up, feel free to use it 😉

## Brush3DProperties

Data class used to store material properties for different brushes:

```
class Brush3DProperties
{
    [SerializeField] public Color m_albedo;
    [SerializeField] public Color m_rimColor;
    [SerializeField] public float m_rimPower;
}
```

## The interface

### Intersecting
```
// Set cursor position, world-space
void SetPosition(Vector3 pos);

// Set cursor radius, world-space
void SetRadius(float radius);

// Intersection activation, OFF --> no preview / drawing / erasing / clipping
void StartIntersecting();

void StopIntersecting();

// Outline color, refer to preview sphere colored outline
void SetOutlineColor(Color color);

// Outline thickness, world-space
void SetOutlineThickness(float thickness);
```

### Drawing
```
void StartDrawing(Brush3DProperties properties);
        
void StopDrawing();
```

### Erasing
```
void StartErasing(Brush3DProperties properties);
        
void StopErasing();
```

### Clipping
```
void StartClipping();

void StopClipping();
```

### Management of Brush3DProperties
```
void AddDrawingProperties(Brush3DProperties properties);
        
void UpdateDrawingProperties();

void RemoveDrawingProperties(Brush3DProperties properties);
```

### Extrapolate Drawn Region
```
// keepLink:
//      True --> Generated mesh will be affected by changes to the original mesh
//      (preview sphere / drawing / erasing / clipping)
//      False --> Generated mesh will have a snapshot of current state
Task<GameObject> ExtrapolateDrawnRegion(Brush3DProperties properties, bool keepLink);
```
