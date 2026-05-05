import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestao_imoveis/core/errors/failure.dart';
import 'package:gestao_imoveis/features/property/domain/value_objects/property_type.dart';
import 'package:gestao_imoveis/features/property/presentation/providers/property_providers.dart';
import 'package:gestao_imoveis/shared/widgets/app_button.dart';
import 'package:gestao_imoveis/shared/widgets/app_text_field.dart';
import 'package:gestao_imoveis/shared/widgets/cep_text_field.dart';

class PropertyFormScreen extends ConsumerStatefulWidget {
  const PropertyFormScreen({super.key, this.propertyId});

  final int? propertyId;

  @override
  ConsumerState<PropertyFormScreen> createState() => _PropertyFormScreenState();
}

class _PropertyFormScreenState extends ConsumerState<PropertyFormScreen> {
  final _formKey = GlobalKey<FormState>();

  final _descriptionController = TextEditingController();
  final _cepController = TextEditingController();
  final _numberController = TextEditingController();
  final _complementController = TextEditingController();

  String _street = '';
  String _neighborhood = '';
  String _city = '';
  String _stateCode = '';
  String _zipCode = '';

  PropertyType _selectedType = PropertyType.house;
  bool _isSubmitting = false;
  bool _isLoadingProperty = false;
  String? _errorMessage;

  bool get _isEditMode => widget.propertyId != null;

  @override
  void initState() {
    super.initState();
    if (_isEditMode) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _loadForEdit());
    }
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    _cepController.dispose();
    _numberController.dispose();
    _complementController.dispose();
    super.dispose();
  }

  Future<void> _loadForEdit() async {
    setState(() => _isLoadingProperty = true);
    try {
      final property =
          await ref.read(propertyDetailProvider(widget.propertyId!).future);
      if (!mounted) return;
      final zip = property.zipCode;
      setState(() {
        _descriptionController.text = property.description;
        _numberController.text = property.number ?? '';
        _complementController.text = property.complement ?? '';
        _selectedType = property.type;
        _street = property.street;
        _neighborhood = property.neighborhood;
        _city = property.city;
        _stateCode = property.state;
        _zipCode = zip;
        _cepController.text =
            zip.length == 8 ? '${zip.substring(0, 5)}-${zip.substring(5)}' : zip;
        _isLoadingProperty = false;
      });
    } catch (_) {
      if (mounted) setState(() => _isLoadingProperty = false);
    }
  }

  Future<void> _submit() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    if (_zipCode.isEmpty) {
      setState(
          () => _errorMessage = 'Informe um CEP válido para buscar o endereço.');
      return;
    }

    setState(() {
      _isSubmitting = true;
      _errorMessage = null;
    });

    try {
      final repo = ref.read(propertyRepositoryProvider);
      final description = _descriptionController.text.trim();
      final type = _selectedType.toApiString;
      final number = _numberController.text.trim().isEmpty
          ? null
          : _numberController.text.trim();
      final complement = _complementController.text.trim().isEmpty
          ? null
          : _complementController.text.trim();

      if (_isEditMode) {
        await repo.update(
          widget.propertyId!,
          description: description,
          type: type,
          zipCode: _zipCode,
          number: number,
          complement: complement,
        );
        ref.invalidate(propertyDetailProvider(widget.propertyId!));
      } else {
        await repo.create(
          description: description,
          type: type,
          zipCode: _zipCode,
          number: number,
          complement: complement,
        );
      }

      ref.invalidate(propertyListProvider);

      if (!mounted) return;
      Navigator.of(context).pop();
    } on Failure catch (f) {
      setState(() => _errorMessage = f.userMessage);
    } catch (e) {
      setState(() => _errorMessage = 'Ocorreu um erro inesperado.');
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(_isEditMode ? 'Editar Imóvel' : 'Novo Imóvel'),
      ),
      body: _isLoadingProperty
          ? const Center(child: CircularProgressIndicator())
          : Form(
              key: _formKey,
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  AppTextField(
                    label: 'Descrição',
                    hint: 'Ex: Apartamento Jardins, Casa Vila Madalena',
                    controller: _descriptionController,
                    prefixIcon: Icons.description_outlined,
                    validator: (v) {
                      if (v == null || v.trim().isEmpty) return 'Campo obrigatório.';
                      if (v.trim().length < 3) return 'Mínimo de 3 caracteres.';
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  DropdownButtonFormField<PropertyType>(
                    initialValue: _selectedType,
                    decoration: const InputDecoration(
                      labelText: 'Tipo',
                      prefixIcon: Icon(Icons.home_work_outlined),
                    ),
                    items: PropertyType.values
                        .map(
                          (t) => DropdownMenuItem(
                            value: t,
                            child: Text(t.label),
                          ),
                        )
                        .toList(),
                    onChanged: (t) {
                      if (t != null) setState(() => _selectedType = t);
                    },
                  ),
                  const SizedBox(height: 16),

                  CepTextField(
                    controller: _cepController,
                    onAddressFound: (address) {
                      setState(() {
                        _street = address.street;
                        _neighborhood = address.neighborhood;
                        _city = address.city;
                        _stateCode = address.state;
                        _zipCode = address.zipCode;
                      });
                    },
                  ),
                  const SizedBox(height: 16),

                  if (_street.isNotEmpty) ...[
                    AppTextField(
                      label: 'Logradouro',
                      initialValue: _street,
                      prefixIcon: Icons.signpost_outlined,
                      readOnly: true,
                      enabled: false,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: AppTextField(
                            label: 'Bairro',
                            initialValue: _neighborhood,
                            prefixIcon: Icons.location_city_outlined,
                            readOnly: true,
                            enabled: false,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          flex: 3,
                          child: AppTextField(
                            label: 'Cidade',
                            initialValue: _city,
                            readOnly: true,
                            enabled: false,
                          ),
                        ),
                        const SizedBox(width: 12),
                        SizedBox(
                          width: 64,
                          child: AppTextField(
                            label: 'UF',
                            initialValue: _stateCode,
                            readOnly: true,
                            enabled: false,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                  ],

                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: AppTextField(
                          label: 'Número (opcional)',
                          controller: _numberController,
                          prefixIcon: Icons.tag,
                          hint: 'S/N',
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        flex: 3,
                        child: AppTextField(
                          label: 'Complemento (opcional)',
                          controller: _complementController,
                          hint: 'Apto 42, Bloco B',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  if (_errorMessage != null) ...[
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.errorContainer,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        _errorMessage!,
                        style:
                            TextStyle(color: theme.colorScheme.onErrorContainer),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],

                  AppButton(
                    label: _isEditMode ? 'Salvar Alterações' : 'Cadastrar Imóvel',
                    icon: Icons.save_outlined,
                    isLoading: _isSubmitting,
                    isFullWidth: true,
                    onPressed: _submit,
                  ),
                ],
              ),
            ),
    );
  }
}
