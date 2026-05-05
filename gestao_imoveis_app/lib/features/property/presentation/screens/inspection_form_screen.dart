import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestao_imoveis/core/errors/failure.dart';
import 'package:gestao_imoveis/features/property/domain/value_objects/inspection_type.dart';
import 'package:gestao_imoveis/features/property/presentation/providers/property_providers.dart';
import 'package:gestao_imoveis/shared/widgets/app_button.dart';
import 'package:gestao_imoveis/shared/widgets/app_text_field.dart';

class InspectionFormScreen extends ConsumerStatefulWidget {
  const InspectionFormScreen({super.key, required this.propertyId});

  final int propertyId;

  @override
  ConsumerState<InspectionFormScreen> createState() =>
      _InspectionFormScreenState();
}

class _InspectionFormScreenState extends ConsumerState<InspectionFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _inspectorController = TextEditingController();
  final _notesController = TextEditingController();

  InspectionType _selectedType = InspectionType.entry;
  bool _isSubmitting = false;
  String? _errorMessage;

  @override
  void dispose() {
    _inspectorController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    setState(() {
      _isSubmitting = true;
      _errorMessage = null;
    });

    try {
      await ref.read(propertyRepositoryProvider).addInspection(
            widget.propertyId,
            type: _selectedType.toApiString,
            inspector: _inspectorController.text.trim(),
            notes: _notesController.text.trim().isEmpty
                ? null
                : _notesController.text.trim(),
          );

      ref.invalidate(propertyInspectionsProvider(widget.propertyId));

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
        title: const Text('Nova Vistoria'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Inspection type selector
            Text(
              'Tipo de vistoria',
              style: theme.textTheme.labelLarge,
            ),
            const SizedBox(height: 8),
            SegmentedButton<InspectionType>(
              segments: InspectionType.values
                  .map(
                    (t) => ButtonSegment(
                      value: t,
                      label: Text(t.label),
                      icon: Icon(
                        t == InspectionType.entry ? Icons.login : Icons.logout,
                      ),
                    ),
                  )
                  .toList(),
              selected: {_selectedType},
              onSelectionChanged: (selection) {
                if (selection.isNotEmpty) {
                  setState(() => _selectedType = selection.first);
                }
              },
            ),
            const SizedBox(height: 24),

            AppTextField(
              label: 'Vistoriador',
              hint: 'Nome do responsável pela vistoria',
              controller: _inspectorController,
              prefixIcon: Icons.person_outline,
              validator: (v) {
                if (v == null || v.trim().isEmpty) return 'Campo obrigatório.';
                if (v.trim().length < 2) return 'Mínimo de 2 caracteres.';
                return null;
              },
            ),
            const SizedBox(height: 16),

            AppTextField(
              label: 'Observações (opcional)',
              hint: 'Descreva o estado do imóvel, pendências, etc.',
              controller: _notesController,
              maxLines: 5,
              keyboardType: TextInputType.multiline,
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
                  style: TextStyle(color: theme.colorScheme.onErrorContainer),
                ),
              ),
              const SizedBox(height: 16),
            ],

            AppButton(
              label: 'Registrar Vistoria',
              icon: Icons.checklist_outlined,
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
