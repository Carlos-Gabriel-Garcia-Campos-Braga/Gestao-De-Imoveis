import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gestao_imoveis/core/constants/app_strings.dart';
import 'package:gestao_imoveis/core/utils/money_formatter.dart';

class MoneyTextField extends StatefulWidget {
  const MoneyTextField({
    super.key,
    this.controller,
    this.initialValue,
    this.label = 'Valor',
    this.onChanged,
    this.validator,
  });

  final TextEditingController? controller;
  final double? initialValue;
  final String label;
  final ValueChanged<double?>? onChanged;
  final FormFieldValidator<String>? validator;

  @override
  State<MoneyTextField> createState() => _MoneyTextFieldState();
}

class _MoneyTextFieldState extends State<MoneyTextField> {
  late final TextEditingController _effectiveController;

  @override
  void initState() {
    super.initState();
    _effectiveController = widget.controller ?? TextEditingController();
    if (widget.initialValue != null && _effectiveController.text.isEmpty) {
      _effectiveController.text = _format(widget.initialValue!);
    }
  }

  @override
  void didUpdateWidget(MoneyTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller == null &&
        widget.initialValue != oldWidget.initialValue &&
        widget.initialValue != null) {
      _effectiveController.text = _format(widget.initialValue!);
      widget.onChanged?.call(widget.initialValue);
    }
  }

  String _format(double value) =>
      value.toStringAsFixed(2).replaceAll('.', ',');

  @override
  void dispose() {
    if (widget.controller == null) _effectiveController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _effectiveController,
      keyboardType: TextInputType.number,
      inputFormatters: [_MoneyInputFormatter()],
      onChanged: (v) => widget.onChanged?.call(MoneyFormatter.tryParse(v)),
      validator: widget.validator ??
          (value) {
            if (value == null || value.isEmpty) return AppStrings.requiredField;
            final parsed = MoneyFormatter.tryParse(value);
            if (parsed == null || parsed <= 0) return 'Informe um valor válido';
            return null;
          },
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: 'R\$ 0,00',
        prefixIcon: const Icon(Icons.attach_money),
        prefixText: 'R\$ ',
      ),
    );
  }
}

class _MoneyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final digits = newValue.text.replaceAll(RegExp(r'\D'), '');
    if (digits.isEmpty) {
      return const TextEditingValue(
        selection: TextSelection.collapsed(offset: 0),
      );
    }

    final value = int.parse(digits) / 100;
    final formatted = value.toStringAsFixed(2).replaceAll('.', ',');

    final parts = formatted.split(',');
    final intPart = parts[0].replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
      (m) => '${m[1]}.',
    );
    final result = '$intPart,${parts[1]}';

    return TextEditingValue(
      text: result,
      selection: TextSelection.collapsed(offset: result.length),
    );
  }
}
