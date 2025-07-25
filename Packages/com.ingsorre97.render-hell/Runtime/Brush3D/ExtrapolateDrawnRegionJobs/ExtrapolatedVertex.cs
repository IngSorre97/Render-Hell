using System;
using System.Runtime.InteropServices;
using UnityEngine;

namespace IngSorre97.RenderHell.Brush3D.Jobs
{
    [StructLayout(LayoutKind.Sequential)]
    public struct ExtrapolatedVertex : IComparable<ExtrapolatedVertex>
    {
        public Vector3 Vertex;
        public int OldIndex;
        public int NewIndex;
        
        public int CompareTo(ExtrapolatedVertex other)
        {
            return NewIndex.CompareTo(other.NewIndex);
        }
    }
}