abstract final class AppStrings {
  // General
  static const appName = 'Gestão de Imóveis';
  static const loading = 'Carregando...';
  static const retry = 'Tentar novamente';
  static const cancel = 'Cancelar';
  static const confirm = 'Confirmar';
  static const save = 'Salvar';
  static const edit = 'Editar';
  static const delete = 'Excluir';
  static const back = 'Voltar';
  static const close = 'Fechar';
  static const yes = 'Sim';
  static const no = 'Não';

  // Auth
  static const login = 'Entrar';
  static const logout = 'Sair';
  static const email = 'E-mail';
  static const password = 'Senha';
  static const confirmPassword = 'Confirmar senha';
  static const forgotPassword = 'Esqueceu a senha?';
  static const changePassword = 'Alterar senha';
  static const newPassword = 'Nova senha';
  static const currentPassword = 'Senha atual';

  // Nav
  static const dashboard = 'Início';
  static const properties = 'Imóveis';
  static const contracts = 'Contratos';
  static const billing = 'Cobranças';

  // Property
  static const newProperty = 'Novo imóvel';
  static const propertyDetails = 'Detalhes do imóvel';
  static const propertyAddress = 'Endereço';
  static const zipCode = 'CEP';
  static const street = 'Rua / Avenida';
  static const number = 'Número';
  static const complement = 'Complemento';
  static const neighborhood = 'Bairro';
  static const city = 'Cidade';
  static const state = 'Estado';
  static const propertyType = 'Tipo de imóvel';
  static const inspectionReport = 'Vistoria';
  static const newInspection = 'Nova vistoria';

  // Leasing
  static const newContract = 'Novo contrato';
  static const contractDetails = 'Detalhes do contrato';
  static const renter = 'Inquilino';
  static const renters = 'Inquilinos';
  static const newRenter = 'Novo inquilino';
  static const renterDetails = 'Detalhes do inquilino';
  static const cpf = 'CPF';
  static const phone = 'Telefone';
  static const startDate = 'Data de início';
  static const endDate = 'Data de término';
  static const rentValue = 'Valor do aluguel';
  static const economicIndex = 'Índice de reajuste';
  static const applyReadjustment = 'Aplicar reajuste';

  // Billing
  static const newInvoice = 'Nova cobrança';
  static const invoiceDetails = 'Detalhes da cobrança';
  static const dueDate = 'Vencimento';
  static const paidAt = 'Pago em';
  static const pixQrCode = 'QR Code PIX';
  static const registerPayment = 'Registrar pagamento';
  static const lateFee = 'Multa';
  static const interest = 'Juros';
  static const total = 'Total';

  // Empty states
  static const noProperties = 'Nenhum imóvel cadastrado';
  static const noPropertiesSubtitle = 'Cadastre seu primeiro imóvel para começar.';
  static const noContracts = 'Nenhum contrato cadastrado';
  static const noContractsSubtitle = 'Crie um contrato para começar.';
  static const noRenters = 'Nenhum inquilino cadastrado';
  static const noRentersSubtitle = 'Cadastre um inquilino para criar contratos.';
  static const noInvoices = 'Nenhuma cobrança encontrada';
  static const noInvoicesSubtitle = 'As cobranças aparecerão aqui.';

  // Errors
  static const requiredField = 'Campo obrigatório';
  static const invalidEmail = 'E-mail inválido';
  static const invalidCpf = 'CPF inválido';
  static const invalidCep = 'CEP inválido';
  static const passwordTooShort = 'Mínimo 6 caracteres';
  static const passwordsDontMatch = 'As senhas não coincidem';
  static const cpfAlreadyExists = 'Já existe um inquilino com este CPF';
}
