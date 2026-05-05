import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestao_imoveis/core/errors/failure.dart';
import 'package:gestao_imoveis/core/utils/cpf_validator.dart';
import 'package:gestao_imoveis/features/leasing/domain/usecases/create_renter_use_case.dart';
import 'package:gestao_imoveis/features/leasing/domain/usecases/verify_cpf_use_case.dart';
import 'package:gestao_imoveis/features/leasing/presentation/providers/leasing_providers.dart';
import 'package:gestao_imoveis/shared/widgets/app_button.dart';
import 'package:gestao_imoveis/shared/widgets/app_text_field.dart';
import 'package:gestao_imoveis/shared/widgets/cpf_text_field.dart';

class RenterFormScreen extends ConsumerStatefulWidget {
  const RenterFormScreen({super.key});

  @override
  ConsumerState<RenterFormScreen> createState() => _RenterFormScreenState();
}

class _RenterFormScreenState extends ConsumerState<RenterFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _cpfController = TextEditingController();
  final _phoneController = TextEditingController();

  bool _loading = false;
  String? _errorMessage;

  @override
  void dispose() {
    _nameController.dispose();
    _cpfController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _loading = true;
      _errorMessage = null;
    });

    try {
      final rawCpf = _cpfController.text.replaceAll(RegExp(r'\D'), '');
      final repo = ref.read(renterRepositoryProvider);

      final alreadyExists = await VerifyCpfUseCase(repo).execute(rawCpf);
      if (alreadyExists) {
        setState(() {
          _loading = false;
          _errorMessage = 'CPF já cadastrado no sistema.';
        });
        return;
      }

      await CreateRenterUseCase(repo).execute(
        name: _nameController.text.trim(),
        cpf: rawCpf,
        phoneNumber: _phoneController.text.replaceAll(RegExp(r'\D'), ''),
      );

      ref.invalidate(renterListProvider);
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
      appBar: AppBar(title: const Text('Novo Inquilino')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            AppTextField(
              controller: _nameController,
              label: 'Nome completo',
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? 'Nome obrigatório' : null,
            ),
            const SizedBox(height: 16),
            CpfTextField(
              controller: _cpfController,
              validator: (v) {
                final digits = (v ?? '').replaceAll(RegExp(r'\D'), '');
                if (digits.isEmpty) return 'CPF obrigatório';
                if (!CpfValidator.isValid(digits)) return 'CPF inválido';
                return null;
              },
            ),
            const SizedBox(height: 16),
            AppTextField(
              controller: _phoneController,
              label: 'Telefone',
              keyboardType: TextInputType.phone,
              validator: (v) {
                final digits = (v ?? '').replaceAll(RegExp(r'\D'), '');
                if (digits.length < 10) return 'Telefone inválido';
                return null;
              },
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
              label: 'Cadastrar inquilino',
              isLoading: _loading,
              onPressed: _submit,
            ),
          ],
        ),
      ),
    );
  }
}
