abstract final class RouteNames {
  // Auth
  static const login = 'login';

  // Shell tabs
  static const dashboard = 'dashboard';
  static const properties = 'properties';
  static const contracts = 'contracts';
  static const billing = 'billing';

  // Property
  static const newProperty = 'new-property';
  static const propertyDetail = 'property-detail';
  static const editProperty = 'edit-property';
  static const newInspection = 'new-inspection';

  // Leasing
  static const newContract = 'new-contract';
  static const contractDetail = 'contract-detail';
  static const renters = 'renters';
  static const newRenter = 'new-renter';
  static const renterDetail = 'renter-detail';

  // Billing
  static const newInvoice = 'new-invoice';
  static const invoiceDetail = 'invoice-detail';

  // Settings
  static const settings = 'settings';
  static const changePassword = 'change-password';
}

abstract final class RoutePaths {
  static const login = '/login';
  static const dashboard = '/dashboard';
  static const properties = '/properties';
  static const newProperty = '/properties/new';
  static const propertyDetail = '/properties/:id';
  static const editProperty = '/properties/:id/edit';
  static const newInspection = '/properties/:id/inspection';
  static const contracts = '/leasing';
  static const newContract = '/leasing/contracts/new';
  static const contractDetail = '/leasing/contracts/:id';
  static const renters = '/leasing/renters';
  static const newRenter = '/leasing/renters/new';
  static const renterDetail = '/leasing/renters/:id';
  static const billing = '/billing';
  static const newInvoice = '/billing/new';
  static const invoiceDetail = '/billing/:id';
  static const settings = '/settings';
  static const changePassword = '/change-password';
}
