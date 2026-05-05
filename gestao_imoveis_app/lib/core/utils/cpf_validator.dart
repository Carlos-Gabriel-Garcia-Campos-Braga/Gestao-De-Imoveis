abstract final class CpfValidator {
  static bool isValid(String cpf) {
    final digits = cpf.replaceAll(RegExp(r'\D'), '');

    if (digits.length != 11) return false;
    if (RegExp(r'^(\d)\1{10}$').hasMatch(digits)) return false;

    return _calcDigit(digits, 9) == int.parse(digits[9]) &&
        _calcDigit(digits, 10) == int.parse(digits[10]);
  }

  static int _calcDigit(String digits, int length) {
    var sum = 0;
    for (var i = 0; i < length; i++) {
      sum += int.parse(digits[i]) * (length + 1 - i);
    }
    final remainder = (sum * 10) % 11;
    return remainder == 10 ? 0 : remainder;
  }
}
