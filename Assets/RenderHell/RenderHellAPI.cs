using System;
using System.Resources;
using IngSorre97.RenderHell.Brush3D;
using UnityEngine;
using Object = UnityEngine.Object;

namespace IngSorre97.RenderHell
{
    public static class RenderHellAPI
    {
        public static IBrush3D CreateBrush3D(MeshRenderer meshRenderer, MeshFilter meshFilter)
        {
            var prefab = Resources.Load<Brush3D.Brush3D>("Prefabs/Brush3D");
            if (prefab == null)
            {
                throw new MissingManifestResourceException("Unable to find Brush3D prefab in Resources folder!");
            }

            if (!IsMeshRendererMaterialValid(meshRenderer))
            {
                throw new FormatException("Mesh renderer material is not valid for Brush3D!");
            }

            if (meshFilter.mesh == null)
            {
                throw new FormatException("Mesh filter has no mesh!");
            }
            
            Brush3D.Brush3D brush3D = Object.Instantiate(prefab);
            brush3D.Setup(meshRenderer, meshFilter.mesh.bounds);
            brush3D.name = "Brush3D - " + meshRenderer.gameObject.name;
            return brush3D;
        }
        
        static bool IsMeshRendererMaterialValid(MeshRenderer meshRenderer)
        {
            if (meshRenderer.material == null)
            {
                Debug.LogError("No material found in mesh renderer");
                return false;
            }
            
            return true;
        }
    }
}