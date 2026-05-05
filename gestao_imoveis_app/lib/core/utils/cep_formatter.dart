abstract final class CepFormatter {
  static bool isValid(String cep) {
    final digits = cep.replaceAll(RegExp(r'\D'), '');
    return digits.length == 8;
  }

  static String format(String cep) {
    final digits = cep.replaceAll(RegExp(r'\D'), '');
    if (digits.length != 8) return cep;
    return '${digits.substring(0, 5)}-${digits.substring(5)}';
  }

  static String onlyDigits(String cep) => cep.replaceAll(RegExp(r'\D'), '');
}
