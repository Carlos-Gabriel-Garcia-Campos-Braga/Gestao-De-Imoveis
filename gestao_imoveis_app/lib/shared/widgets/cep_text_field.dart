import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gestao_imoveis/core/constants/app_strings.dart';
import 'package:gestao_imoveis/core/utils/cep_formatter.dart';

class AddressData {
  const AddressData({
    required this.street,
    required this.neighborhood,
    required this.city,
    required this.state,
    required this.zipCode,
  });

  final String street;
  final String neighborhood;
  final String city;
  final String state;
  final String zipCode;
}

class CepTextField extends StatefulWidget {
  const CepTextField({
    super.key,
    required this.controller,
    required this.onAddressFound,
    this.onChanged,
  });

  final TextEditingController controller;
  final ValueChanged<AddressData> onAddressFound;
  final ValueChanged<String>? onChanged;

  @override
  State<CepTextField> createState() => _CepTextFieldState();
}

class _CepTextFieldState extends State<CepTextField> {
  bool _isLoading = false;
  String? _error;

  Future<void> _lookupCep(String cep) async {
    final digits = cep.replaceAll(RegExp(r'\D'), '');
    if (digits.length != 8) return;

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final response = await Dio().get<Map<String, dynamic>>('https://viacep.com.br/ws/$digits/json/');
      final data = response.data;

      if (data == null || data.containsKey('erro')) {
        setState(() => _error = 'CEP não encontrado.');
        return;
      }

      widget.onAddressFound(
        AddressData(
          street: data['logradouro'] as String? ?? '',
          neighborhood: data['bairro'] as String? ?? '',
          city: data['localidade'] as String? ?? '',
          state: data['uf'] as String? ?? '',
          zipCode: digits,
        ),
      );
    } on DioException {
      setState(() => _error = 'Não foi possível buscar o CEP.');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: TextInputType.number,
      onChanged: (v) {
        widget.onChanged?.call(v);
        _lookupCep(v);
      },
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        _CepInputFormatter(),
      ],
      validator: (value) {
        final digits = (value ?? '').replaceAll(RegExp(r'\D'), '');
        if (digits.isEmpty) return AppStrings.requiredField;
        if (!CepFormatter.isValid(digits)) return AppStrings.invalidCep;
        return null;
      },
      decoration: InputDecoration(
        labelText: AppStrings.zipCode,
        hintText: '00000-000',
        prefixIcon: const Icon(Icons.location_on_outlined),
        errorText: _error,
        suffixIcon: _isLoading
            ? const Padding(
                padding: EdgeInsets.all(12),
                child: SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              )
            : null,
      ),
    );
  }
}

class _CepInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final digits = newValue.text.replaceAll(RegExp(r'\D'), '');
    if (digits.length > 8) return oldValue;

    final buffer = StringBuffer();
    for (var i = 0; i < digits.length; i++) {
      if (i == 5) buffer.write('-');
      buffer.write(digits[i]);
    }

    final formatted = buffer.toString();
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
