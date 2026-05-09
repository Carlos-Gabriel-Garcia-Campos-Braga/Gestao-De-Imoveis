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
  static const archivedProperties = '/api/property/archived';
  static String archiveProperty(int id) => '/api/property/$id/archive';
  static String unarchiveProperty(int id) => '/api/property/$id/unarchive';

  // Leasing
  static const contracts = '/api/rentalcontract';
  static String applyReadjustment(int id) => '/api/rentalcontract/$id/readjustment';
  static const archivedContracts = '/api/rentalcontract/archived';
  static String archiveContract(int id) => '/api/rentalcontract/$id/archive';
  static String unarchiveContract(int id) => '/api/rentalcontract/$id/unarchive';
  static String terminateContract(int id) => '/api/rentalcontract/$id/terminate';
  static const renters = '/api/renter';
  static String renterById(int id) => '/api/renter/$id';
  static String verifyCpf(String cpf) => '/api/renter/verifycpf/$cpf';
  static const archivedRenters = '/api/renter/archived';
  static String archiveRenter(int id) => '/api/renter/$id/archive';
  static String unarchiveRenter(int id) => '/api/renter/$id/unarchive';

  // Reports
  static String annualReportPdf(int year) => '/api/report/annual/$year/pdf';
  static String annualReportXlsx(int year) => '/api/report/annual/$year/xlsx';
  static String contractPdf(int id) => '/api/report/contract/$id/pdf';

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
