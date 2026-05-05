import 'package:flutter/material.dart';
import 'package:gestao_imoveis/core/extensions/date_extension.dart';

class DatePickerField extends StatefulWidget {
  const DatePickerField({
    super.key,
    required this.label,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.onChanged,
    this.validator,
  });

  final String label;
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final ValueChanged<DateTime>? onChanged;
  final FormFieldValidator<DateTime>? validator;

  @override
  State<DatePickerField> createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {
  DateTime? _selectedDate;
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.initialDate != null) {
      _selectedDate = widget.initialDate;
      _controller.text = widget.initialDate!.toBrDate();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? now,
      firstDate: widget.firstDate ?? DateTime(2000),
      lastDate: widget.lastDate ?? DateTime(2100),
      locale: const Locale('pt', 'BR'),
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _controller.text = picked.toBrDate();
      });
      widget.onChanged?.call(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FormField<DateTime>(
      initialValue: _selectedDate,
      validator: widget.validator,
      builder: (state) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _controller,
            readOnly: true,
            onTap: _pickDate,
            decoration: InputDecoration(
              labelText: widget.label,
              hintText: 'dd/mm/aaaa',
              prefixIcon: const Icon(Icons.calendar_today_outlined),
              errorText: state.errorText,
              suffixIcon: const Icon(Icons.arrow_drop_down),
            ),
          ),
        ],
      ),
    );
  }
}
