using UnityEngine;

namespace IngSorre97.RenderHell
{
    internal class ExtrapolatedDrawnRegion : MonoBehaviour
    {
        [SerializeField] MeshRenderer m_meshRenderer;
        [SerializeField] MeshFilter m_meshFilter;
        [SerializeField] BoxCollider m_boxCollider;

        public MeshRenderer MeshRenderer => m_meshRenderer;
        public MeshFilter MeshFilter => m_meshFilter;
        public BoxCollider BoxCollider => m_boxCollider;
    }
}