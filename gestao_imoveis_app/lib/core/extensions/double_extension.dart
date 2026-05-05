import 'package:intl/intl.dart';

extension DoubleExtension on double {
  String toBRL() {
    final formatter = NumberFormat.currency(
      locale: 'pt_BR',
      symbol: 'R\$',
      decimalDigits: 2,
    );
    return formatter.format(this);
  }

  String toCurrencyString() {
    final formatter = NumberFormat('#,##0.00', 'pt_BR');
    return formatter.format(this);
  }
}

extension NullableDoubleExtension on double? {
  String toBRLOrEmpty() => this?.toBRL() ?? '';
}
