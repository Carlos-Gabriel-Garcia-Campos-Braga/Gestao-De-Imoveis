import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestao_imoveis/core/errors/failure.dart';
import 'package:gestao_imoveis/features/leasing/domain/entities/renter.dart';
import 'package:gestao_imoveis/features/leasing/domain/usecases/create_contract_use_case.dart';
import 'package:gestao_imoveis/features/leasing/domain/value_objects/economic_index.dart';
import 'package:gestao_imoveis/features/leasing/presentation/providers/leasing_providers.dart';
import 'package:gestao_imoveis/shared/widgets/app_button.dart';
import 'package:gestao_imoveis/shared/widgets/cep_text_field.dart';
import 'package:gestao_imoveis/shared/widgets/date_picker_field.dart';
import 'package:gestao_imoveis/shared/widgets/money_text_field.dart';
import 'package:gestao_imoveis/shared/widgets/section_header.dart';

class ContractFormScreen extends ConsumerStatefulWidget {
  const ContractFormScreen({super.key});

  @override
  ConsumerState<ContractFormScreen> createState() => _ContractFormScreenState();
}

class _ContractFormScreenState extends ConsumerState<ContractFormScreen> {
  final _formKey = GlobalKey<FormState>();

  // Renter selection
  Renter? _selectedRenter;

  // Address — filled by ViaCEP + manual input
  final _cepController = TextEditingController();
  final _numberController = TextEditingController();
  final _complementController = TextEditingController();
  AddressData? _addressData;

  // Contract
  DateTime? _startDate;
  DateTime? _endDate;
  double? _rentalValue;
  EconomicIndex _preferredIndex = EconomicIndex.ipca;

  bool _loading = false;
  String? _errorMessage;

  @override
  void dispose() {
    _cepController.dispose();
    _numberController.dispose();
    _complementController.dispose();
    super.dispose();
  }

  Future<void> _pickRenter() async {
    final rentersAsync = ref.read(renterListProvider);
    final renters = rentersAsync.valueOrNull ?? [];

    if (renters.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Nenhum inquilino cadastrado.')),
      );
      return;
    }

    final selected = await showModalBottomSheet<Renter>(
      context: context,
      builder: (_) => _RenterPickerSheet(renters: renters),
    );

    if (selected != null) {
      setState(() => _selectedRenter = selected);
    }
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    if (_selectedRenter == null) {
      setState(() => _errorMessage = 'Selecione um inquilino.');
      return;
    }
    if (_addressData == null) {
      setState(() => _errorMessage = 'Informe um CEP válido para buscar o endereço.');
      return;
    }
    if (_startDate == null || _endDate == null) {
      setState(() => _errorMessage = 'Informe as datas do contrato.');
      return;
    }
    if (_rentalValue == null || _rentalValue! <= 0) {
      setState(() => _errorMessage = 'Informe o valor do aluguel.');
      return;
    }

    setState(() {
      _loading = true;
      _errorMessage = null;
    });

    try {
      await CreateContractUseCase(ref.read(rentalContractRepositoryProvider))
          .execute(
        renterName: _selectedRenter!.name,
        renterCpf: _selectedRenter!.cpf,
        renterPhone: _selectedRenter!.phoneNumber,
        street: _addressData!.street,
        number: _numberController.text.trim(),
        complement: _complementController.text.trim().isEmpty
            ? null
            : _complementController.text.trim(),
        neighborhood: _addressData!.neighborhood,
        city: _addressData!.city,
        state: _addressData!.state,
        zipCode: _addressData!.zipCode,
        startContract: _startDate!,
        endContract: _endDate!,
        rentalValue: _rentalValue!,
        preferredIndex: _preferredIndex,
      );

      ref.invalidate(contractListProvider);
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
    return Scaffold(
      appBar: AppBar(title: const Text('Novo Contrato')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const SectionHeader(title: 'Inquilino'),
            const SizedBox(height: 8),
            InkWell(
              onTap: _pickRenter,
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 14),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.person_outline),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        _selectedRenter?.name ?? 'Selecionar inquilino',
                        style: _selectedRenter == null
                            ? TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurfaceVariant,
                              )
                            : null,
                      ),
                    ),
                    const Icon(Icons.chevron_right),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),
            const SectionHeader(title: 'Endereço do imóvel'),
            const SizedBox(height: 8),
            CepTextField(
              controller: _cepController,
              onAddressFound: (data) => setState(() => _addressData = data),
            ),
            if (_addressData != null) ...[
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color:
                      Theme.of(context).colorScheme.surfaceContainerLow,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '${_addressData!.street} — ${_addressData!.neighborhood}, '
                  '${_addressData!.city}/${_addressData!.state}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: TextFormField(
                    controller: _numberController,
                    decoration: const InputDecoration(labelText: 'Número'),
                    validator: (v) => (v == null || v.trim().isEmpty)
                        ? 'Obrigatório'
                        : null,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  flex: 3,
                  child: TextFormField(
                    controller: _complementController,
                    decoration:
                        const InputDecoration(labelText: 'Complemento'),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),
            const SectionHeader(title: 'Período do contrato'),
            const SizedBox(height: 8),
            DatePickerField(
              label: 'Data de início',
              initialDate: _startDate,
              onChanged: (d) => setState(() => _startDate = d),
            ),
            const SizedBox(height: 12),
            DatePickerField(
              label: 'Data de término',
              initialDate: _endDate,
              firstDate: _startDate ?? DateTime.now(),
              onChanged: (d) => setState(() => _endDate = d),
            ),

            const SizedBox(height: 24),
            const SectionHeader(title: 'Valores'),
            const SizedBox(height: 8),
            MoneyTextField(
              label: 'Valor do aluguel',
              onChanged: (v) => _rentalValue = v,
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<EconomicIndex>(
              initialValue: _preferredIndex,
              decoration:
                  const InputDecoration(labelText: 'Índice de reajuste'),
              items: EconomicIndex.values
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e.label),
                      ))
                  .toList(),
              onChanged: (v) => setState(() => _preferredIndex = v!),
            ),

            if (_errorMessage != null) ...[
              const SizedBox(height: 16),
              Text(
                _errorMessage!,
                style:
                    TextStyle(color: Theme.of(context).colorScheme.error),
              ),
            ],

            const SizedBox(height: 24),
            AppButton(
              label: 'Criar contrato',
              isLoading: _loading,
              onPressed: _submit,
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

class _RenterPickerSheet extends StatelessWidget {
  const _RenterPickerSheet({required this.renters});

  final List<Renter> renters;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            'Selecionar Inquilino',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        const Divider(height: 1),
        Flexible(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: renters.length,
            itemBuilder: (_, i) {
              final r = renters[i];
              return ListTile(
                leading: CircleAvatar(child: Text(r.name[0].toUpperCase())),
                title: Text(r.name),
                subtitle: Text(r.formattedCpf),
                onTap: () => Navigator.of(context).pop(r),
              );
            },
          ),
        ),
      ],
    );
  }
}
