import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gestao_imoveis/core/constants/app_strings.dart';
import 'package:gestao_imoveis/core/utils/cpf_validator.dart';

class CpfTextField extends StatefulWidget {
  const CpfTextField({
    super.key,
    required this.controller,
    this.onChanged,
    this.validator,
    this.enabled = true,
  });

  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final bool enabled;

  @override
  State<CpfTextField> createState() => _CpfTextFieldState();
}

class _CpfTextFieldState extends State<CpfTextField> {
  bool _isValid = true;

  void _onChanged(String value) {
    final digits = value.replaceAll(RegExp(r'\D'), '');
    if (digits.length == 11) {
      setState(() => _isValid = CpfValidator.isValid(digits));
    } else {
      setState(() => _isValid = true);
    }
    widget.onChanged?.call(value);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: TextInputType.number,
      onChanged: _onChanged,
      enabled: widget.enabled,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        _CpfInputFormatter(),
      ],
      validator: widget.validator ??
          (value) {
            final digits = (value ?? '').replaceAll(RegExp(r'\D'), '');
            if (digits.isEmpty) return AppStrings.requiredField;
            if (!CpfValidator.isValid(digits)) return AppStrings.invalidCpf;
            return null;
          },
      decoration: InputDecoration(
        labelText: AppStrings.cpf,
        hintText: '000.000.000-00',
        prefixIcon: const Icon(Icons.badge_outlined),
        errorText: !_isValid ? AppStrings.invalidCpf : null,
      ),
    );
  }
}

class _CpfInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final digits = newValue.text.replaceAll(RegExp(r'\D'), '');
    if (digits.length > 11) return oldValue;

    final buffer = StringBuffer();
    for (var i = 0; i < digits.length; i++) {
      if (i == 3 || i == 6) buffer.write('.');
      if (i == 9) buffer.write('-');
      buffer.write(digits[i]);
    }

    final formatted = buffer.toString();
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
