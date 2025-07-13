using UnityEngine;

namespace IngSorre97.RenderHell.Samples
{
    [RequireComponent(typeof(BoxCollider))]
    class AutoColliderResize : MonoBehaviour
    {
        [SerializeField] MeshFilter m_meshFilter;

        public void Start()
        {
            var boxCollider = GetComponent<BoxCollider>();
            boxCollider.center = m_meshFilter.mesh.bounds.center;
            boxCollider.size = m_meshFilter.mesh.bounds.size;
        }
    }
}