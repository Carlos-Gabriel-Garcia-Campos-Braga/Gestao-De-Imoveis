#!/bin/bash
# dev.sh — Gestão de Imóveis — Script de desenvolvimento local
# Uso: ./dev.sh [api|flutter|all|migrate|setup]
#   api     → sobe só a API
#   flutter → roda só o Flutter
#   all     → API em background + Flutter em foreground (padrão)
#   migrate → aplica migrations no banco
#   setup   → guia de configuração inicial (credenciais)

set -euo pipefail

# ── Cores ─────────────────────────────────────────────────────────────────────
RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'; CYAN='\033[0;36m'; NC='\033[0m'
info()  { echo -e "${GREEN}[✓]${NC} $*"; }
warn()  { echo -e "${YELLOW}[!]${NC} $*"; }
err()   { echo -e "${RED}[✗]${NC} $*"; }
title() { echo -e "\n${CYAN}══ $* ══${NC}"; }

# ── Paths ─────────────────────────────────────────────────────────────────────
ROOT="$(cd "$(dirname "$0")" && pwd)"
API_DIR="$ROOT/API/GestaoImoveisAPI"
FLUTTER_DIR="$ROOT/gestao_imoveis_app"
API_PORT=5001   # deve ser igual ao baseUrl em api_constants.dart

# ── Funções ───────────────────────────────────────────────────────────────────

check_prereqs() {
    title "Verificando pré-requisitos"

    if ! command -v dotnet &>/dev/null; then
        err ".NET SDK não encontrado. Instale em: https://dotnet.microsoft.com/download"
        exit 1
    fi
    info ".NET SDK: $(dotnet --version)"

    if ! command -v flutter &>/dev/null; then
        err "Flutter não encontrado. Instale em: https://flutter.dev/docs/get-started/install"
        exit 1
    fi
    info "Flutter: $(flutter --version --machine 2>/dev/null | python3 -c 'import sys,json; d=json.load(sys.stdin); print(d.get("frameworkVersion","?"))' 2>/dev/null || flutter --version | head -1 | awk '{print $2}')"

    if ! command -v dotnet-ef &>/dev/null && ! dotnet ef --version &>/dev/null 2>&1; then
        warn "dotnet-ef não encontrado. Instalando..."
        dotnet tool install --global dotnet-ef
        export PATH="$PATH:$HOME/.dotnet/tools"
    fi
    info "dotnet-ef: $(dotnet ef --version 2>/dev/null | head -1)"
}

check_mysql() {
    title "Verificando MySQL"
    if mysqladmin ping -h 127.0.0.1 --silent 2>/dev/null; then
        info "MySQL: rodando"
        return 0
    fi

    warn "MySQL não está rodando. Tentando iniciar via Homebrew..."
    if command -v brew &>/dev/null; then
        brew services start mysql
        sleep 3
        if mysqladmin ping -h 127.0.0.1 --silent 2>/dev/null; then
            info "MySQL iniciado com sucesso"
            return 0
        fi
    fi

    err "MySQL não está rodando."
    err "Inicie manualmente: brew services start mysql"
    err "Ou se instalado de outro modo: sudo systemctl start mysql"
    exit 1
}

check_credentials() {
    local secrets_output
    secrets_output=$(dotnet user-secrets list --project "$API_DIR" 2>/dev/null || echo "")

    if echo "$secrets_output" | grep -q "ConnectionStrings:DefaultConnection"; then
        info "Credenciais configuradas via user-secrets"
        return 0
    fi

    if [[ -n "${ConnectionStrings__DefaultConnection:-}" ]]; then
        info "Credenciais configuradas via variável de ambiente"
        return 0
    fi

    err "Credenciais do banco não configuradas."
    echo ""
    echo "  Execute o comando 'setup' primeiro:"
    echo "  ${CYAN}./dev.sh setup${NC}"
    echo ""
    exit 1
}

run_setup() {
    title "Configuração inicial — credenciais de desenvolvimento"
    echo ""
    echo "Este projeto usa dotnet user-secrets para credenciais locais."
    echo "As credenciais NÃO são salvas no repositório git."
    echo ""

    read -rp "  String de conexão MySQL (ex: Server=localhost;Database=GestaoImoveisDB;User=root;Password=suasenha;): " conn_string
    read -rp "  JWT Secret (mínimo 32 chars, ex: minha_chave_super_secreta_para_gestao_imoveis_2026): " jwt_secret

    if [[ ${#jwt_secret} -lt 32 ]]; then
        err "JWT Secret muito curto. Use pelo menos 32 caracteres."
        exit 1
    fi

    cd "$API_DIR"
    dotnet user-secrets set "ConnectionStrings:DefaultConnection" "$conn_string"
    dotnet user-secrets set "Jwt:Secret" "$jwt_secret"

    info "Credenciais salvas com sucesso."
    echo ""
    info "Agora execute: ${CYAN}./dev.sh migrate${NC} para criar as tabelas."
}

run_migrate() {
    title "Aplicando migrations"
    check_mysql
    check_credentials
    cd "$API_DIR"
    info "Executando dotnet ef database update..."
    dotnet ef database update
    info "Migrations aplicadas com sucesso."
}

start_api() {
    title "Iniciando API"
    check_mysql
    check_credentials
    info "API iniciando em http://localhost:$API_PORT ..."
    info "Swagger: http://localhost:$API_PORT/swagger"
    cd "$API_DIR"
    ASPNETCORE_ENVIRONMENT=Development ASPNETCORE_URLS="http://0.0.0.0:$API_PORT" dotnet run --no-launch-profile
}

start_api_background() {
    check_mysql
    check_credentials
    info "API iniciando em background (http://localhost:$API_PORT)..."
    cd "$API_DIR"
    ASPNETCORE_ENVIRONMENT=Development ASPNETCORE_URLS="http://0.0.0.0:$API_PORT" dotnet run --no-launch-profile &
    API_PID=$!
    info "API PID: $API_PID"

    # Aguarda a API responder
    local attempts=0
    while ! curl -sf "http://localhost:$API_PORT/swagger/index.html" &>/dev/null; do
        sleep 1
        attempts=$((attempts + 1))
        if [[ $attempts -ge 30 ]]; then
            err "API não iniciou em 30s. Verifique os logs."
            kill "$API_PID" 2>/dev/null || true
            exit 1
        fi
    done
    info "API pronta após ${attempts}s"
}

start_flutter() {
    title "Iniciando Flutter"
    cd "$FLUTTER_DIR"
    flutter pub get
    flutter run
}

run_all() {
    check_prereqs
    start_api_background
    trap "info 'Encerrando API (PID: $API_PID)...'; kill $API_PID 2>/dev/null || true" EXIT INT TERM
    start_flutter
}

# ── Ponto de entrada ──────────────────────────────────────────────────────────

CMD="${1:-all}"

case "$CMD" in
    setup)
        run_setup
        ;;
    migrate)
        check_prereqs
        run_migrate
        ;;
    api)
        check_prereqs
        start_api
        ;;
    flutter)
        check_prereqs
        start_flutter
        ;;
    all)
        run_all
        ;;
    *)
        echo "Uso: ./dev.sh [setup|migrate|api|flutter|all]"
        echo ""
        echo "  setup   → configurar credenciais do banco (primeira vez)"
        echo "  migrate → aplicar migrations no banco"
        echo "  api     → subir só a API"
        echo "  flutter → rodar só o Flutter"
        echo "  all     → API + Flutter (padrão)"
        exit 1
        ;;
esac
