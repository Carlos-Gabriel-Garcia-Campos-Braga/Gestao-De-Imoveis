namespace GestaoImoveisAPI.Domain.Shared
{
    public abstract class Entity
    {
        public int Id { get; protected set; }

        public override bool Equals(object? obj) =>
            obj is Entity other && Id == other.Id && GetType() == other.GetType();

        public override int GetHashCode() => HashCode.Combine(GetType(), Id);
    }
}
