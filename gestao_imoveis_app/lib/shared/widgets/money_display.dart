import 'package:flutter/material.dart';
import 'package:gestao_imoveis/core/utils/money_formatter.dart';

enum MoneyDisplaySize { large, medium, small }

class MoneyDisplay extends StatelessWidget {
  const MoneyDisplay({
    super.key,
    required this.amount,
    this.size = MoneyDisplaySize.medium,
    this.color,
  });

  final double amount;
  final MoneyDisplaySize size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final fontSize = switch (size) {
      MoneyDisplaySize.large => 28.0,
      MoneyDisplaySize.medium => 18.0,
      MoneyDisplaySize.small => 14.0,
    };

    return Text(
      MoneyFormatter.format(amount),
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w700,
        color: color ?? Theme.of(context).colorScheme.onSurface,
        fontFamily: 'Poppins',
      ),
    );
  }
}
