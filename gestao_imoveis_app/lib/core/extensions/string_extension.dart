extension StringExtension on String {
  String formatCpf() {
    final digits = replaceAll(RegExp(r'\D'), '');
    if (digits.length != 11) return this;
    return '${digits.substring(0, 3)}.${digits.substring(3, 6)}.${digits.substring(6, 9)}-${digits.substring(9)}';
  }

  String formatZipCode() {
    final digits = replaceAll(RegExp(r'\D'), '');
    if (digits.length != 8) return this;
    return '${digits.substring(0, 5)}-${digits.substring(5)}';
  }

  String formatPhone() {
    final digits = replaceAll(RegExp(r'\D'), '');
    if (digits.length == 11) {
      return '(${digits.substring(0, 2)}) ${digits.substring(2, 7)}-${digits.substring(7)}';
    }
    if (digits.length == 10) {
      return '(${digits.substring(0, 2)}) ${digits.substring(2, 6)}-${digits.substring(6)}';
    }
    return this;
  }

  String get onlyDigits => replaceAll(RegExp(r'\D'), '');

  bool get isBlank => trim().isEmpty;
}
