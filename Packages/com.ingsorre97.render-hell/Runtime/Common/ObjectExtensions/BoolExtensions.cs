namespace IngSorre97.RenderHell
{
    public static class BoolExtensions
    {
        public static float ToBinaryFloat(this bool value)
        {
            return value ? 1.0f : 0.0f;
        }
    }
}