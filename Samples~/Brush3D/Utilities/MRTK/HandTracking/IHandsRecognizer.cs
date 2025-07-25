using System;
using Microsoft.MixedReality.Toolkit.Utilities;
using UnityEngine;

namespace IngSorre97.RenderHell.Samples
{
    public interface IHandsRecognizer
    {
        event Action<Handedness> OnHandRecognized;
        event Action<Handedness> OnHandLost;
        event Action<Handedness> OnHandUpdate;

        Vector3 GetPrioritizedFingerTipPosition(out Handedness hand);

        bool IsHandTracked(Handedness hand);
        Transform RequestJointTransform(TrackedHandJoint joint, Handedness hand);
    }
}