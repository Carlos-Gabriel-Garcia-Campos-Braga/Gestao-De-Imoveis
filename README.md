# Gestão de Imóveis

App mobile iOS para proprietários e pequenas administradoras imobiliárias gerenciarem contratos de locação, inquilinos, cobranças e manutenção.

## Stack

| Camada | Tecnologia |
|---|---|
| Mobile | Flutter + Dart |
| State Management | Riverpod 3 (code gen) |
| Navegação | GoRouter |
| HTTP | Dio + Retrofit |
| Storage seguro | flutter_secure_storage |
| Serialização | freezed + json_serializable |
| Backend | ASP.NET Core 8 Web API |
| ORM | EF Core 8 + Pomelo (MySQL) |
| Auth | JWT Bearer + BCrypt.Net-Next |
| Banco de dados | MySQL 8 |

## Arquitetura

O projeto adota **Clean Architecture + DDD** com bounded contexts separados por domínio.

```
┌──────────────────────────────────────────────┐
│  PRESENTATION                                │
│  Flutter: Screens, Widgets, Riverpod         │
│  API: Controllers (sem lógica de negócio)    │
└────────────────────┬─────────────────────────┘
                     │
┌────────────────────▼─────────────────────────┐
│  APPLICATION                                 │
│  Use Cases / Command Handlers                │
│  Orquestra Domain + Infrastructure           │
└───────────┬────────────────────┬─────────────┘
            │                   │
┌───────────▼──────────┐  ┌─────▼──────────────────────┐
│  DOMAIN              │  │  INFRASTRUCTURE             │
│  Aggregates          │  │  Repositories (EF Core)     │
│  Entities            │  │  DataSources (Dio/Retrofit) │
│  Value Objects       │  │  Serviços externos          │
│  Domain Events       │  │  (ViaCEP, IBGE, PIX)        │
│  Repository interfaces│  └─────────────────────────────┘
└──────────────────────┘
```

### Bounded Contexts

| Contexto | Responsabilidade |
|---|---|
| **Leasing** (core) | Contratos, inquilinos, cobranças mensais, reajustes |
| **Property** | Imóveis, endereços, vistorias |
| **Billing** | Faturas, PIX, inadimplência |
| **Maintenance** | Chamados, ordens de serviço |
| **Identity** | Autenticação e autorização |

## Estrutura de Pastas

```
.
├── API/GestaoImoveisAPI/
│   ├── Controllers/          # Endpoints — delegam para handlers
│   ├── Domain/               # Aggregates, Entities, Value Objects, interfaces
│   │   ├── Leasing/
│   │   ├── Property/
│   │   ├── Billing/
│   │   ├── Identity/
│   │   └── Shared/           # AggregateRoot, Entity base
│   ├── Application/          # Use Cases / Command Handlers
│   │   ├── Leasing/
│   │   ├── Property/
│   │   ├── Billing/
│   │   └── Identity/
│   ├── Infrastructure/
│   │   ├── Persistence/      # Repositórios (EF Core)
│   │   └── ExternalServices/ # ViaCEP, IBGE
│   ├── Middleware/           # GlobalExceptionHandler
│   └── Data/                 # AppDbContext
│
├── gestao_imoveis_app/       # App Flutter
│   └── lib/
│       ├── core/             # erros, tema, router, utils
│       ├── features/         # um folder por bounded context
│       │   ├── leasing/
│       │   ├── property/
│       │   ├── billing/
│       │   ├── maintenance/
│       │   └── identity/
│       └── shared/           # widgets e providers globais
│
└── SharedClassess/           # DTOs compartilhados (backend ↔ futuras integrações)
    └── SharedClasses/
        ├── InputDTOs/
        ├── OutputsDTOs/
        └── ValueObjects/
```

## Rodando o projeto

O script `dev.sh` na raiz sobe backend e app Flutter com um único comando:

```bash
chmod +x dev.sh
./dev.sh
```

Ou manualmente:

### Backend

```bash
cd API/GestaoImoveisAPI

# Variáveis de ambiente necessárias (nunca commitar valores reais)
export DB_CONNECTION="Server=localhost;Port=3306;Database=GestaoImoveisDB;Uid=root;Pwd=senha;"
export JWT_SECRET="sua-chave-secreta"

dotnet restore
dotnet ef database update
dotnet run
```

API disponível em `https://localhost:5001`. Swagger em `/swagger`.

### App Flutter

```bash
cd gestao_imoveis_app

flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run
```

## Principais endpoints

| Método | Rota | Descrição |
|---|---|---|
| `POST` | `/api/user/register` | Registrar proprietário |
| `POST` | `/api/user/login` | Login (retorna JWT + refresh token) |
| `POST` | `/api/user/refresh` | Renovar token |
| `GET` | `/api/renter` | Listar inquilinos |
| `POST` | `/api/renter` | Cadastrar inquilino |
| `GET` | `/api/renter/verifycpf/{cpf}` | Verificar CPF |
| `GET` | `/api/rentalcontract` | Listar contratos |
| `POST` | `/api/rentalcontract` | Criar contrato |
| `POST` | `/api/rentalcontract/{id}/readjustment` | Aplicar reajuste anual |
| `GET` | `/api/property` | Listar imóveis |
| `POST` | `/api/property` | Cadastrar imóvel (com lookup ViaCEP) |
| `POST` | `/api/property/{id}/inspection` | Registrar vistoria |
| `GET` | `/api/invoice` | Listar faturas |
| `POST` | `/api/invoice` | Gerar fatura |
| `POST` | `/api/invoice/{id}/payment` | Registrar pagamento |
| `GET` | `/api/address/{cep}` | Lookup de endereço via ViaCEP |

## Regras de negócio relevantes

- **CPF**: validação completa com dígitos verificadores; armazenado sem formatação
- **Reajuste de aluguel** (Lei 8.245/91): anual, índices IGPM/INPC/IPCA via API IBGE
- **Multa por atraso**: máximo 2% — encapsulado em `Money.ApplyLateFee()`
- **Juros de mora**: máximo 1%/mês, calculado pro-rata die
- **Vistoria**: obrigatória na entrada e saída; base legal para cobrar danos
- **LGPD**: consentimento explícito no cadastro; retenção contrato + 5 anos

## Integrações externas

| Serviço | Finalidade | Status |
|---|---|---|
| ViaCEP | Lookup de endereço por CEP | Implementado |
| IBGE API | Índices IGPM/INPC/IPCA para reajuste | Pendente |
| Asaas / EFI | Cobranças PIX + boleto | Pendente |
| FCM / APNs | Push notifications | Pendente |
| WhatsApp Business | Régua de cobrança | Pendente |

## Segurança

- Senhas com BCrypt (work factor ≥ 12)
- JWT com validação de `Issuer`, `Audience` e `Expiry`
- Refresh Token com rotação
- Tokens armazenados em `flutter_secure_storage` no app
- Secrets via variáveis de ambiente — nunca no código-fonte
- Rate limiting no endpoint de login
