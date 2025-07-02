using System.Resources;
using IngSorre97.RenderHell.Brush3D;
using UnityEngine;

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
            
            Brush3D.Brush3D brush3D = Object.Instantiate(prefab);
            brush3D.Setup(meshRenderer, meshFilter);
            brush3D.name = "Brush3D - " + meshRenderer.gameObject.name;
            return brush3D;
        } 
    }
}