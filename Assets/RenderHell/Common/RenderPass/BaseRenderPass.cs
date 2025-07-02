using System;
using UnityEngine;
using UnityEngine.Rendering;
using UnityEngine.Rendering.Universal;

namespace IngSorre97.RenderHell
{
    abstract class BaseRenderPass : ScriptableRenderPass, IBaseRenderPass, IDisposable
    {
        public event Action<ScriptableRenderContext, Camera> OnPreRender;
        public event Action<ScriptableRenderContext, Camera> OnPostRender;

        readonly ProfilingSampler m_profilingSampler;
        readonly Camera m_camera;

        protected BaseRenderPass(string name, RenderPassEvent passEvent, Camera camera)
        {
            m_profilingSampler = new ProfilingSampler(name);
            m_camera = camera;
            
            renderPassEvent = passEvent;
            
            RenderPipelineManager.beginCameraRendering += OnCameraPreRender;
            RenderPipelineManager.endCameraRendering += OnCameraPostRender;
        }

        public virtual void Dispose()
        {
            RenderPipelineManager.beginCameraRendering -= OnCameraPreRender;
            RenderPipelineManager.endCameraRendering -= OnCameraPostRender;
        }
        
        public abstract bool ShouldExecutePass();
        
        void OnCameraPreRender(ScriptableRenderContext context, Camera camera)
        {
            if (m_camera != camera || !ShouldExecutePass())
            {
                return;
            }
            
            OnPreRender?.Invoke(context, camera);
            m_camera.GetUniversalAdditionalCameraData().scriptableRenderer.EnqueuePass(this);
        }

        void OnCameraPostRender(ScriptableRenderContext context, Camera camera)
        {
            if (m_camera != camera || !ShouldExecutePass())
            {
                return;
            }
            
            OnPostRender?.Invoke(context, camera);
        }
        
        public override void Execute(ScriptableRenderContext context, ref RenderingData renderingData)
        {
            CameraData cameraData = renderingData.cameraData;
            CommandBuffer commandBuffer = CommandBufferPool.Get();

            bool stereoHandling = false;
            if (ShouldDisableStereoscopy(cameraData))
            {
                cameraData.xr.StopSinglePass(commandBuffer);
                stereoHandling = true;
            }

            m_profilingSampler.Begin(commandBuffer);
            OnPassExecute(commandBuffer, context, ref renderingData);
            m_profilingSampler.End(commandBuffer);

            if (stereoHandling)
            {
                cameraData.xr.StartSinglePass(commandBuffer);
            }

            context.ExecuteCommandBuffer(commandBuffer);
            commandBuffer.Clear();

            CommandBufferPool.Release(commandBuffer);
        }
        
        protected abstract void OnPassExecute(CommandBuffer commandBuffer, ScriptableRenderContext context, ref RenderingData renderingData);

        static bool ShouldDisableStereoscopy(CameraData cameraData)
        {
            return cameraData.xrRendering && cameraData.xr.enabled && cameraData.xr.singlePassEnabled;
        }
    }
}