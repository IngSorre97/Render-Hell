using Microsoft.MixedReality.Toolkit.Input;
using Microsoft.MixedReality.Toolkit.Utilities;

namespace IngSorre97.RenderHell.Samples
{
    sealed class MrtkUtils : IMrtkUtils
    {
        public bool TryGetJointPose(TrackedHandJoint joint, Handedness hand, out MixedRealityPose pose)
        {
            return HandJointUtils.TryGetJointPose(joint, hand, out pose);
        }

        public void SetFarRayBehavior(PointerBehavior behavior, Handedness hand)
        {
            PointerUtils.SetPointerBehavior<ShellHandRayPointer>(behavior, hand);
        }

		public void SetPokeBehavior(PointerBehavior behavior, Handedness hand)
        {
            PointerUtils.SetPointerBehavior<PokePointer>(behavior, hand);
        }
        
        public void SetGrabBehavior(PointerBehavior behavior, Handedness hand)
        {
            PointerUtils.SetPointerBehavior<SpherePointer>(behavior, hand);
        }
    }
}