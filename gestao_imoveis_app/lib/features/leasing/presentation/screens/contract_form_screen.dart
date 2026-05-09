import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestao_imoveis/core/errors/failure.dart';
import 'package:gestao_imoveis/features/leasing/domain/entities/renter.dart';
import 'package:gestao_imoveis/features/leasing/domain/usecases/create_contract_use_case.dart';
import 'package:gestao_imoveis/features/leasing/domain/value_objects/economic_index.dart';
import 'package:gestao_imoveis/features/leasing/presentation/providers/leasing_providers.dart';
import 'package:gestao_imoveis/features/property/domain/entities/property.dart';
import 'package:gestao_imoveis/features/property/presentation/providers/property_providers.dart';
import 'package:gestao_imoveis/shared/widgets/app_button.dart';
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

  Renter? _selectedRenter;
  Property? _selectedProperty;

  DateTime? _startDate;
  DateTime? _endDate;
  double? _rentalValue;
  EconomicIndex _preferredIndex = EconomicIndex.ipca;

  bool _loading = false;
  String? _errorMessage;

  Future<void> _pickRenter(List<Renter> renters) async {
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

    if (selected != null) setState(() => _selectedRenter = selected);
  }

  Future<void> _pickProperty(List<Property> properties) async {
    if (properties.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Nenhum imóvel disponível para locação.')),
      );
      return;
    }

    final selected = await showModalBottomSheet<Property>(
      context: context,
      isScrollControlled: true,
      builder: (_) => _PropertyPickerSheet(properties: properties),
    );

    if (selected != null) setState(() => _selectedProperty = selected);
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    if (_selectedRenter == null) {
      setState(() => _errorMessage = 'Selecione um inquilino.');
      return;
    }
    if (_selectedProperty == null) {
      setState(() => _errorMessage = 'Selecione um imóvel.');
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
        propertyId: _selectedProperty!.id,
        startContract: _startDate!,
        endContract: _endDate!,
        rentalValue: _rentalValue!,
        preferredIndex: _preferredIndex,
      );

      ref.invalidate(contractListProvider);
      ref.invalidate(propertyListProvider);  // imóvel passou a Occupied
      ref.invalidate(vacantPropertiesProvider);

      if (mounted) Navigator.of(context).pop();
    } on Failure catch (f) {
      setState(() {
        _loading = false;
        _errorMessage = f.userMessage;
      });
    } catch (e) {
      setState(() {
        _loading = false;
        _errorMessage = e.toString().replaceFirst('Exception: ', '');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final rentersAsync = ref.watch(renterListProvider);
    final renters = rentersAsync.valueOrNull ?? [];

    final propertiesAsync = ref.watch(vacantPropertiesProvider);
    final properties = propertiesAsync.valueOrNull ?? [];

    return Scaffold(
      appBar: AppBar(title: const Text('Novo Contrato')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // ── Inquilino ──────────────────────────────────────────────────
            const SectionHeader(title: 'Inquilino'),
            const SizedBox(height: 8),
            _PickerTile(
              icon: Icons.person_outline,
              label: _selectedRenter?.name ?? 'Selecionar inquilino',
              hasValue: _selectedRenter != null,
              isLoading: rentersAsync.isLoading,
              onTap: rentersAsync.isLoading ? null : () => _pickRenter(renters),
            ),

            const SizedBox(height: 24),

            // ── Imóvel ─────────────────────────────────────────────────────
            const SectionHeader(title: 'Imóvel'),
            const SizedBox(height: 8),
            _PickerTile(
              icon: Icons.apartment_outlined,
              label: _selectedProperty != null
                  ? _selectedProperty!.fullAddress
                  : 'Selecionar imóvel disponível',
              hasValue: _selectedProperty != null,
              isLoading: propertiesAsync.isLoading,
              onTap: propertiesAsync.isLoading
                  ? null
                  : () => _pickProperty(properties),
            ),
            if (_selectedProperty != null) ...[
              const SizedBox(height: 6),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Text(
                  _selectedProperty!.description,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                ),
              ),
            ],

            const SizedBox(height: 24),

            // ── Período ────────────────────────────────────────────────────
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

            // ── Valores ────────────────────────────────────────────────────
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

// ── Componente reutilizável de picker ──────────────────────────────────────────

class _PickerTile extends StatelessWidget {
  const _PickerTile({
    required this.icon,
    required this.label,
    required this.hasValue,
    required this.isLoading,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool hasValue;
  final bool isLoading;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.outline,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon,
                color: hasValue
                    ? Theme.of(context).colorScheme.primary
                    : null),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: hasValue
                    ? null
                    : TextStyle(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurfaceVariant,
                      ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (isLoading)
              const SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            else
              const Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }
}

// ── Sheet de seleção de inquilino ─────────────────────────────────────────────

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

// ── Sheet de seleção de imóvel ────────────────────────────────────────────────

class _PropertyPickerSheet extends StatelessWidget {
  const _PropertyPickerSheet({required this.properties});

  final List<Property> properties;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      minChildSize: 0.4,
      maxChildSize: 0.9,
      expand: false,
      builder: (_, controller) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Selecionar Imóvel',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: ListView.builder(
              controller: controller,
              itemCount: properties.length,
              itemBuilder: (_, i) {
                final p = properties[i];
                return ListTile(
                  leading: const CircleAvatar(
                    child: Icon(Icons.apartment),
                  ),
                  title: Text(p.description),
                  subtitle: Text(
                    p.fullAddress,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () => Navigator.of(context).pop(p),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
