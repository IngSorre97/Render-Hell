using System;
using UnityEngine;
using UnityEngine.Rendering;

namespace IngSorre97.RenderHell
{
    interface IBaseRenderPass
    {
        event Action<ScriptableRenderContext, Camera> OnPreRender;
        event Action<ScriptableRenderContext, Camera> OnPostRender;
        bool ShouldExecutePass();
    }
}