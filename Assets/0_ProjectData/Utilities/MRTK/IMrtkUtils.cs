using Microsoft.MixedReality.Toolkit.Input;
using Microsoft.MixedReality.Toolkit.Utilities;

namespace IngSorre97.RenderHell.Samples
{
    public interface IMrtkUtils
    {
        bool TryGetJointPose(TrackedHandJoint joint, Handedness hand, out MixedRealityPose pose);
        public void SetFarRayBehavior(PointerBehavior behavior, Handedness hand);
        public void SetPokeBehavior(PointerBehavior behavior, Handedness hand);
        public void SetGrabBehavior(PointerBehavior behavior, Handedness hand);
    }
}