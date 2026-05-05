abstract final class ApiConstants {
  static const baseUrl = 'http://192.168.2.162:5001';

  // Identity
  static const login = '/api/user/login';
  static const register = '/api/user/register';
  static const refresh = '/api/user/refresh';
  static const changePassword = '/api/user/password';

  // Property
  static const properties = '/api/property';
  static String propertyById(int id) => '/api/property/$id';
  static String propertyByStatus(String status) => '/api/property/status/$status';
  static String propertyInspections(int id) => '/api/property/$id/inspections';
  static String updateProperty(int id) => '/api/property/$id';
  static String updatePropertyStatus(int id) => '/api/property/$id/status';

  // Leasing
  static const contracts = '/api/rentalcontract';
  static String applyReadjustment(int id) => '/api/rentalcontract/$id/readjustment';
  static const renters = '/api/renter';
  static String renterById(int id) => '/api/renter/$id';
  static String verifyCpf(String cpf) => '/api/renter/verifycpf/$cpf';

  // Billing
  static const invoices = '/api/invoice';
  static String invoiceById(int id) => '/api/invoice/$id';
  static String invoicesByContract(int contractId) => '/api/invoice/contract/$contractId';
  static const overdueInvoices = '/api/invoice/overdue';
  static const dueSoonInvoices = '/api/invoice/due-soon';
  static String registerPayment(int id) => '/api/invoice/$id/payment';
  static String generatePix(int id) => '/api/invoice/$id/pix';
  static String markOverdue(int id) => '/api/invoice/$id/overdue';
}
