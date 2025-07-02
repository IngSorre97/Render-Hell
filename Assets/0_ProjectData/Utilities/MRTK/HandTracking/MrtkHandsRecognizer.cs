using Microsoft.MixedReality.Toolkit;
using Microsoft.MixedReality.Toolkit.Input;
using Microsoft.MixedReality.Toolkit.Utilities;
using System;
using System.Collections.Generic;
using UnityEngine;

namespace IngSorre97.RenderHell.Samples
{
    public class MrtkHandsRecognizer : MonoBehaviour, IHandsRecognizer
    {
        const float FINGER_POINTER_OFFSET = 0.01f;

        readonly Dictionary<Handedness, MrtkHandData> m_handsDataDictionary = new() { { Handedness.Left, new MrtkHandData() }, { Handedness.Right, new MrtkHandData() } };

        IMixedRealityHandJointService m_handJointService;

        public event Action<Handedness> OnHandRecognized;
        public event Action<Handedness> OnHandLost;
        public event Action<Handedness> OnHandUpdate;

        IMixedRealityHandJointService HandJointService
        {
            get
            {
                if (m_handJointService != null)
                {
                    return m_handJointService;
                }

                var newService = CoreServices.GetInputSystemDataProvider<IMixedRealityHandJointService>();
                if (newService == null)
                {
                    Debug.LogError("Unable to retrieve an InputSystemDataProvider for MixedRealityHandJointService");
                    return null;
                }

                m_handJointService = newService;
                return newService;
            }
        }

        public bool IsHandTracked(Handedness hand)
        {
            MrtkHandData leftHandData = m_handsDataDictionary[Handedness.Left];
            MrtkHandData rightHandData = m_handsDataDictionary[Handedness.Right];

            return hand switch
            {
                Handedness.None => !leftHandData.HandRecognized && !rightHandData.HandRecognized,
                Handedness.Any => leftHandData.HandRecognized || rightHandData.HandRecognized,
                Handedness.Both => leftHandData.HandRecognized && rightHandData.HandRecognized,
                Handedness.Left => leftHandData.HandRecognized,
                Handedness.Right => rightHandData.HandRecognized,
                _ => false
            };
        }

        public Transform RequestJointTransform(TrackedHandJoint joint, Handedness hand)
        {
            return HandJointService.RequestJointTransform(joint, hand);
        }

        public Vector3 GetPrioritizedFingerTipPosition(out Handedness hand)
        {
            Transform indexTip;
            bool rightHandTracked = m_handsDataDictionary[Handedness.Right].HandRecognized;
            if (rightHandTracked)
            {
                indexTip = HandJointService.RequestJointTransform(TrackedHandJoint.IndexTip, Handedness.Right);
                hand = Handedness.Right;
                return GetPositionWithOffset(indexTip);
            }

            bool leftHandTracked = m_handsDataDictionary[Handedness.Left].HandRecognized;
            if (!leftHandTracked)
            {
                hand = Handedness.None;
                return default;
            }

            indexTip = HandJointService.RequestJointTransform(TrackedHandJoint.IndexTip, Handedness.Left);
            hand = Handedness.Left;
            return GetPositionWithOffset(indexTip);
        }

        void Update()
        {
            UpdateHand(Handedness.Left);
            UpdateHand(Handedness.Right);
        }

        void UpdateHand(Handedness hand)
        {
            MrtkHandData handData = m_handsDataDictionary[hand];

            bool handTracked = HandJointService.IsHandTracked(hand);
            switch (handTracked)
            {
                case true when handData.HandRecognized is false:
                    OnHandRecognized?.Invoke(hand);
                    handData.HandRecognized = true;
                    break;
                case false when handData.HandRecognized:
                    OnHandLost?.Invoke(hand);
                    handData.HandRecognized = false;
                    break;
            }

            Transform fingerTip = HandJointService.RequestJointTransform(TrackedHandJoint.IndexTip, hand);
            if (!handTracked || fingerTip == null || handData.FingerTipPosition == fingerTip.position)
            {
                return;
            }

            handData.FingerTipPosition = fingerTip.position;
            OnHandUpdate?.Invoke(hand);
        }

        static Vector3 GetPositionWithOffset(Transform finger)
        {
            Vector3 fingerDirection = finger.forward.normalized;
            return finger.position + fingerDirection * FINGER_POINTER_OFFSET;
        }
    }
}