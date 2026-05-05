import 'package:intl/intl.dart';

abstract final class MoneyFormatter {
  static final _formatter = NumberFormat.currency(
    locale: 'pt_BR',
    symbol: 'R\$',
    decimalDigits: 2,
  );

  static String format(double amount) => _formatter.format(amount);

  static double? tryParse(String text) {
    final cleaned = text
        .replaceAll('R\$', '')
        .replaceAll('.', '')
        .replaceAll(',', '.')
        .trim();
    return double.tryParse(cleaned);
  }
}
