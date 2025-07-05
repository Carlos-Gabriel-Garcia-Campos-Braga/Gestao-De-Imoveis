# 🏠 Gestão de Imóveis

Sistema completo de gestão de imóveis para proprietários gerenciarem seus inquilinos e controle de pagamentos de forma eficiente.

## 📋 Índice

- [Sobre o Projeto](#sobre-o-projeto)
- [Funcionalidades](#funcionalidades)
- [Arquitetura](#arquitetura)
- [Tecnologias Utilizadas](#tecnologias-utilizadas)
- [Pré-requisitos](#pré-requisitos)
- [Instalação](#instalação)
- [Configuração](#configuração)
- [Uso](#uso)
- [API Documentation](#api-documentation)
- [Estrutura do Projeto](#estrutura-do-projeto)
- [Contribuição](#contribuição)
- [Licença](#licença)

## 🎯 Sobre o Projeto

O **Gestão de Imóveis** é uma solução completa desenvolvida para proprietários de imóveis gerenciarem seus negócios de locação. O sistema permite o controle de inquilinos, contratos de aluguel, contas mensais e status de pagamentos através de uma interface intuitiva e uma API robusta.

### Principais Benefícios

- ✅ **Gestão Centralizada**: Controle todos os seus imóveis em um só lugar
- ✅ **Controle de Pagamentos**: Acompanhe contas vencidas e pagamentos em dia
- ✅ **Interface Intuitiva**: Aplicativo MAUI multiplataforma
- ✅ **API Robusta**: Backend escalável com validações avançadas
- ✅ **Segurança**: Autenticação segura com BCrypt

## 🚀 Funcionalidades

### 👤 Gestão de Usuários
- Registro e login de proprietários
- Autenticação segura com hash BCrypt
- Perfil de usuário personalizado

### 🏠 Gestão de Inquilinos
- Cadastro completo de inquilinos
- Validação automática de CPF
- Histórico de contratos por inquilino
- Informações de contato

### 📄 Contratos de Aluguel
- Criação de contratos com endereço completo
- Definição de valores de aluguel
- Período de vigência do contrato
- Integração com ViaCEP para validação de endereços

### 💰 Controle de Contas
- Cadastro de contas mensais (água, luz, gás, etc.)
- Controle de vencimentos
- Status de pagamento (Pendente, Pago, Atrasado)
- Valores monetários com validação

### 📊 Relatórios e Controle
- Visualização de contas em atraso
- Controle de pagamentos mensais
- Dashboard com métricas importantes

## 🏗️ Arquitetura

O projeto segue uma arquitetura moderna com separação clara de responsabilidades:

```
Gestao-De-Imoveis/
├── API/                          # Backend .NET Core
│   └── GestaoImoveisAPI/
│       ├── Controllers/          # Endpoints da API
│       ├── Models/              # Entidades do banco
│       ├── Data/                # Contexto do Entity Framework
│       ├── Services/            # Serviços de negócio
│       └── Validators/          # Validações customizadas
├── MauiAppGestaoImoveis/        # Frontend MAUI
│   ├── Views/                   # Páginas da aplicação
│   ├── ViewModels/             # Lógica de apresentação
│   ├── Services/               # Comunicação com API
│   └── Models/                 # Modelos do frontend
└── SharedClasses/              # Classes compartilhadas
    ├── ValueObjects/           # Objetos de valor
    ├── InputDTOs/             # DTOs de entrada
    └── OutputsDTOs/           # DTOs de saída
```

### Padrões Utilizados

- **MVVM** (Model-View-ViewModel) no frontend
- **Repository Pattern** com Entity Framework
- **Value Objects** para validações de domínio
- **DTO Pattern** para transferência de dados
- **Dependency Injection** para injeção de dependências

## 🛠️ Tecnologias Utilizadas

### Backend
- **.NET 8.0** - Framework principal
- **Entity Framework Core** - ORM para banco de dados
- **MySQL** - Banco de dados
- **BCrypt.Net** - Hash de senhas
- **Swagger** - Documentação da API
- **Pomelo.EntityFrameworkCore.MySql** - Provider MySQL

### Frontend
- **.NET MAUI** - Framework multiplataforma
- **CommunityToolkit.Mvvm** - Implementação MVVM
- **XAML** - Interface do usuário

### Infraestrutura
- **Railway** - Deploy da API
- **Render** - Hospedagem da aplicação

## 📋 Pré-requisitos

- [.NET 8.0 SDK](https://dotnet.microsoft.com/download/dotnet/8.0)
- [Visual Studio 2022](https://visualstudio.microsoft.com/) ou [Visual Studio Code](https://code.visualstudio.com/)
- [MySQL](https://www.mysql.com/) (opcional para desenvolvimento local)
- [Git](https://git-scm.com/)

## 🚀 Instalação

### 1. Clone o Repositório

```bash
git clone https://github.com/seu-usuario/Gestao-De-Imoveis.git
cd Gestao-De-Imoveis
```

### 2. Configuração do Backend

```bash
# Navegue para a pasta da API
cd API/GestaoImoveisAPI

# Restaure as dependências
dotnet restore

# Execute as migrações do banco de dados
dotnet ef database update

# Execute a API
dotnet run
```

A API estará disponível em: `https://localhost:5000`

### 3. Configuração do Frontend

```bash
# Navegue para a pasta do MAUI
cd MauiAppGestaoImoveis

# Restaure as dependências
dotnet restore

# Execute a aplicação
dotnet build
dotnet run
```

## ⚙️ Configuração

### Configuração do Banco de Dados

Edite o arquivo `API/GestaoImoveisAPI/appsettings.json`:

```json
{
  "ConnectionStrings": {
    "DefaultConnection": "Server=seu-servidor;Port=3306;Database=gestao_imoveis;Uid=seu-usuario;Pwd=sua-senha;"
  }
}
```

### Configuração da API

A API está configurada com:
- **CORS** habilitado para comunicação com MAUI
- **Swagger** para documentação
- **BCrypt** para hash de senhas
- **Entity Framework** com MySQL

## 📱 Uso

### Aplicativo MAUI

1. **Login/Registro**: Acesse com suas credenciais ou crie uma nova conta
2. **Dashboard**: Visualize resumo dos seus imóveis e contas
3. **Inquilinos**: Gerencie seus inquilinos e contratos
4. **Contas**: Controle contas mensais e status de pagamentos
5. **Relatórios**: Acompanhe atrasos e pagamentos

### API REST

A API fornece endpoints para todas as operações:

- `GET /api/user` - Listar usuários
- `POST /api/user/register` - Registrar usuário
- `POST /api/user/login` - Login
- `GET /api/renter` - Listar inquilinos
- `POST /api/renter` - Criar inquilino
- `GET /api/bills` - Listar contas
- `POST /api/bills` - Criar conta

## 📚 API Documentation

### Autenticação

#### Registrar Usuário
```http
POST /api/user/register
Content-Type: application/json

{
  "name": "João Silva",
  "email": "joao@email.com",
  "password": "senha123"
}
```

#### Login
```http
POST /api/user/login
Content-Type: application/json

{
  "email": "joao@email.com",
  "password": "senha123"
}
```

### Inquilinos

#### Listar Inquilinos
```http
GET /api/renter
```

#### Criar Inquilino
```http
POST /api/renter
Content-Type: application/json

{
  "name": "Maria Santos",
  "cpf": "12345678901",
  "phoneNumber": "11999999999"
}
```

#### Verificar CPF
```http
GET /api/renter/verifycpf/{cpf}
```

### Contas

#### Listar Contas
```http
GET /api/bills
```

#### Criar Conta
```http
POST /api/bills
Content-Type: application/json

{
  "type": "Água",
  "validationDate": "2024-01-15",
  "value": 150.00,
  "rentalContractId": 1
}
```

### Swagger UI

Acesse a documentação interativa da API em:
`https://localhost:5000/swagger`

## 📁 Estrutura do Projeto

```
Gestao-De-Imoveis/
├── API/
│   └── GestaoImoveisAPI/
│       ├── Controllers/          # Controllers da API
│       │   ├── AddressController.cs
│       │   ├── BillsController.cs
│       │   ├── RentalContractController.cs
│       │   ├── RenterController.cs
│       │   └── UserController.cs
│       ├── Data/
│       │   └── AppDbContext.cs   # Contexto do EF
│       ├── Models/               # Entidades
│       │   ├── Bills.cs
│       │   ├── RentalContract.cs
│       │   ├── Renter.cs
│       │   └── User.cs
│       ├── Services/
│       │   └── AddressService.cs # Integração ViaCEP
│       └── Validators/
│           └── RentalContractValidator.cs
├── MauiAppGestaoImoveis/
│   ├── Views/                    # Páginas XAML
│   │   ├── LoginPage.xaml
│   │   ├── MainPageApp.xaml
│   │   ├── RenterPage.xaml
│   │   └── ...
│   ├── ViewModels/              # ViewModels MVVM
│   │   ├── RenterViewModel.cs
│   │   └── ...
│   ├── Services/                # Serviços de API
│   │   ├── UserService.cs
│   │   ├── RenterService.cs
│   │   └── ...
│   └── Models/                  # Modelos do frontend
│       ├── Enum/
│       │   └── PaymentStatus.cs
│       └── ...
└── SharedClasses/
    └── SharedClasses/
        ├── ValueObjects/         # Objetos de valor
        │   ├── CPF.cs
        │   ├── Email.cs
        │   ├── Money.cs
        │   └── ...
        ├── InputDTOs/           # DTOs de entrada
        └── OutputsDTOs/         # DTOs de saída
```

## 🔧 Desenvolvimento

### Executando em Desenvolvimento

1. **API Local**:
   ```bash
   cd API/GestaoImoveisAPI
   dotnet run
   ```

2. **MAUI Local**:
   ```bash
   cd MauiAppGestaoImoveis
   dotnet run
   ```

### Migrações do Banco

```bash
# Criar nova migração
dotnet ef migrations add NomeDaMigracao

# Aplicar migrações
dotnet ef database update
```

### Testes

```bash
# Executar testes (quando implementados)
dotnet test
```

## 🤝 Contribuição

1. Faça um fork do projeto
2. Crie uma branch para sua feature (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

### Padrões de Código

- Use **C#** seguindo as convenções da Microsoft
- Mantenha o código **limpo** e **documentado**
- Implemente **validações** adequadas
- Siga o padrão **MVVM** no frontend
- Use **Value Objects** para validações de domínio

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

## 📞 Suporte

- **Email**: seu-email@exemplo.com
- **Issues**: [GitHub Issues](https://github.com/seu-usuario/Gestao-De-Imoveis/issues)
- **Documentação**: [Wiki do Projeto](https://github.com/seu-usuario/Gestao-De-Imoveis/wiki)

## 🙏 Agradecimentos

- **.NET MAUI** pela plataforma multiplataforma
- **Entity Framework** pelo ORM robusto
- **BCrypt.Net** pela segurança de senhas
- **ViaCEP** pela validação de endereços

---

**Desenvolvido com ❤️ usando .NET MAUI e .NET Core**