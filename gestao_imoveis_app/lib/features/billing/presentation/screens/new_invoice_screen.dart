import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestao_imoveis/core/errors/failure.dart';
import 'package:gestao_imoveis/features/billing/domain/usecases/create_invoice_use_case.dart';
import 'package:gestao_imoveis/features/billing/presentation/providers/billing_providers.dart';
import 'package:gestao_imoveis/features/leasing/domain/entities/rental_contract.dart';
import 'package:gestao_imoveis/features/leasing/presentation/providers/leasing_providers.dart';
import 'package:gestao_imoveis/shared/widgets/app_button.dart';
import 'package:gestao_imoveis/shared/widgets/app_text_field.dart';
import 'package:gestao_imoveis/shared/widgets/date_picker_field.dart';
import 'package:gestao_imoveis/shared/widgets/money_text_field.dart';

class NewInvoiceScreen extends ConsumerStatefulWidget {
  const NewInvoiceScreen({super.key});

  @override
  ConsumerState<NewInvoiceScreen> createState() => _NewInvoiceScreenState();
}

class _NewInvoiceScreenState extends ConsumerState<NewInvoiceScreen> {
  final _formKey = GlobalKey<FormState>();
  final _descriptionController = TextEditingController();

  RentalContract? _selectedContract;
  DateTime? _dueDate;
  double _amount = 0;

  bool _loading = false;
  String? _errorMessage;

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _loading = true;
      _errorMessage = null;
    });

    try {
      final repo = ref.read(invoiceRepositoryProvider);
      await CreateInvoiceUseCase(repo).execute(
        rentalContractId: _selectedContract!.id,
        description: _descriptionController.text.trim(),
        dueDate: _dueDate!,
        amount: _amount,
      );
      ref.invalidate(invoiceListProvider);
      if (mounted) Navigator.of(context).pop();
    } on Failure catch (f) {
      setState(() {
        _loading = false;
        _errorMessage = f.userMessage;
      });
    } catch (e) {
      setState(() {
        _loading = false;
        _errorMessage = 'Erro inesperado. Tente novamente.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final contractsAsync = ref.watch(contractListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Nova Cobrança')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            contractsAsync.when(
              loading: () => const LinearProgressIndicator(),
              error: (_, __) => const SizedBox.shrink(),
              data: (contracts) {
                final active = contracts
                    .where((c) => c.endContract.isAfter(DateTime.now()))
                    .toList();
                return DropdownButtonFormField<RentalContract>(
                  initialValue: _selectedContract,
                  decoration:
                      const InputDecoration(labelText: 'Contrato'),
                  items: active
                      .map((c) => DropdownMenuItem(
                            value: c,
                            child: Text(
                              '${c.renter.name} — ${c.street}, ${c.number}',
                              overflow: TextOverflow.ellipsis,
                            ),
                          ))
                      .toList(),
                  validator: (v) =>
                      v == null ? 'Selecione um contrato' : null,
                  onChanged: (v) {
                    setState(() {
                      _selectedContract = v;
                      if (v != null) _amount = v.rentalValue;
                    });
                  },
                );
              },
            ),
            const SizedBox(height: 16),
            AppTextField(
              controller: _descriptionController,
              label: 'Descrição',
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? 'Descrição obrigatória' : null,
            ),
            const SizedBox(height: 16),
            DatePickerField(
              label: 'Vencimento',
              firstDate: DateTime.now().subtract(const Duration(days: 30)),
              lastDate: DateTime.now().add(const Duration(days: 365)),
              onChanged: (d) => _dueDate = d,
              validator: (v) => v == null ? 'Data obrigatória' : null,
            ),
            const SizedBox(height: 16),
            MoneyTextField(
              initialValue: _selectedContract?.rentalValue ?? 0,
              onChanged: (v) => _amount = v ?? 0,
            ),
            if (_errorMessage != null) ...[
              const SizedBox(height: 16),
              Text(
                _errorMessage!,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
            ],
            const SizedBox(height: 24),
            AppButton(
              label: 'Criar cobrança',
              isLoading: _loading,
              onPressed: _submit,
            ),
          ],
        ),
      ),
    );
  }
}
