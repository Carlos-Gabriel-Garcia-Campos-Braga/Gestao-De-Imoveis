import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestao_imoveis/core/errors/failure.dart';
import 'package:gestao_imoveis/features/identity/domain/usecases/change_password_use_case.dart';
import 'package:gestao_imoveis/features/identity/presentation/providers/auth_providers.dart';
import 'package:gestao_imoveis/shared/widgets/app_button.dart';
import 'package:gestao_imoveis/shared/widgets/app_text_field.dart';

class ChangePasswordScreen extends ConsumerStatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  ConsumerState<ChangePasswordScreen> createState() =>
      _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends ConsumerState<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _currentController = TextEditingController();
  final _newController = TextEditingController();
  final _confirmController = TextEditingController();

  bool _loading = false;
  String? _errorMessage;
  bool _success = false;

  @override
  void dispose() {
    _currentController.dispose();
    _newController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _loading = true;
      _errorMessage = null;
    });

    try {
      final repo = ref.read(authRepositoryProvider);
      await ChangePasswordUseCase(repo).execute(
        currentPassword: _currentController.text,
        newPassword: _newController.text,
      );
      setState(() {
        _loading = false;
        _success = true;
      });
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
      appBar: AppBar(title: const Text('Alterar Senha')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            if (_success) ...[
              Card(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Icon(
                        Icons.check_circle_outline,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Senha alterada com sucesso!',
                          style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
            AppTextField(
              controller: _currentController,
              label: 'Senha atual',
              obscureText: true,
              validator: (v) =>
                  (v == null || v.isEmpty) ? 'Senha atual obrigatória' : null,
            ),
            const SizedBox(height: 16),
            AppTextField(
              controller: _newController,
              label: 'Nova senha',
              obscureText: true,
              validator: (v) {
                if (v == null || v.isEmpty) return 'Nova senha obrigatória';
                if (v.length < 6) return 'Mínimo de 6 caracteres';
                return null;
              },
            ),
            const SizedBox(height: 16),
            AppTextField(
              controller: _confirmController,
              label: 'Confirmar nova senha',
              obscureText: true,
              validator: (v) {
                if (v != _newController.text) return 'Senhas não coincidem';
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
              label: 'Alterar senha',
              isLoading: _loading,
              onPressed: _success ? null : _submit,
            ),
          ],
        ),
      ),
    );
  }
}
