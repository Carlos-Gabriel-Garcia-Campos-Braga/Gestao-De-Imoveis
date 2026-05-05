namespace GestaoImoveisAPI.Domain.Shared
{
    // Base para Aggregate Roots. Domain events serão adicionados em iteração futura
    // quando o dispatcher de eventos for configurado.
    public abstract class AggregateRoot : Entity { }
}
