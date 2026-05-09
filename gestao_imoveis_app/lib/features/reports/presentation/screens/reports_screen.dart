import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestao_imoveis/core/constants/api_constants.dart';
import 'package:gestao_imoveis/core/network/dio_provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class ReportsScreen extends ConsumerStatefulWidget {
  const ReportsScreen({super.key});

  @override
  ConsumerState<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends ConsumerState<ReportsScreen> {
  int _selectedYear = DateTime.now().year;
  bool _loadingPdf = false;
  bool _loadingXlsx = false;

  List<int> get _years {
    final current = DateTime.now().year;
    return List.generate(6, (i) => current - i);
  }

  Future<void> _download(String path, String fileName, bool isPdf) async {
    setState(() {
      if (isPdf) {
        _loadingPdf = true;
      } else {
        _loadingXlsx = true;
      }
    });

    try {
      final dio = ref.read(dioProvider);
      final response = await dio.get<List<int>>(
        path,
        options: Options(responseType: ResponseType.bytes),
      );

      final dir = await getTemporaryDirectory();
      final file = File('${dir.path}/$fileName');
      await file.writeAsBytes(response.data!);

      await Share.shareXFiles([XFile(file.path)], subject: fileName);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao baixar relatório: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          if (isPdf) {
            _loadingPdf = false;
          } else {
            _loadingXlsx = false;
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Relatórios')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Relatório de Receitas',
              style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 4),
            Text(
              'Exporta todas as cobranças do ano selecionado com totais, status e dados do inquilino.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 24),
            InputDecorator(
              decoration: const InputDecoration(
                labelText: 'Ano de referência',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<int>(
                  value: _selectedYear,
                  isExpanded: true,
                  items: _years
                      .map((y) => DropdownMenuItem(value: y, child: Text('$y')))
                      .toList(),
                  onChanged: (v) => setState(() => _selectedYear = v ?? _selectedYear),
                ),
              ),
            ),
            const SizedBox(height: 32),
            _DownloadButton(
              label: 'Baixar PDF',
              icon: Icons.picture_as_pdf_outlined,
              color: theme.colorScheme.error,
              loading: _loadingPdf,
              onTap: () => _download(
                ApiConstants.annualReportPdf(_selectedYear),
                'relatorio-receitas-$_selectedYear.pdf',
                true,
              ),
            ),
            const SizedBox(height: 12),
            _DownloadButton(
              label: 'Baixar Excel (.xlsx)',
              icon: Icons.table_chart_outlined,
              color: const Color(0xFF1D6F42),
              loading: _loadingXlsx,
              onTap: () => _download(
                ApiConstants.annualReportXlsx(_selectedYear),
                'relatorio-receitas-$_selectedYear.xlsx',
                false,
              ),
            ),
            const SizedBox(height: 32),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.info_outline,
                    size: 18,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'O relatório inclui: endereço do imóvel, nome do inquilino, CPF, '
                      'data de vencimento, valor cobrado, valor pago e status. '
                      'Ideal para declaração de IR.',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DownloadButton extends StatelessWidget {
  const _DownloadButton({
    required this.label,
    required this.icon,
    required this.color,
    required this.loading,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final Color color;
  final bool loading;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: OutlinedButton.icon(
        onPressed: loading ? null : onTap,
        icon: loading
            ? SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(strokeWidth: 2, color: color),
              )
            : Icon(icon, color: color),
        label: Text(
          label,
          style: TextStyle(color: color, fontWeight: FontWeight.w600),
        ),
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: color),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
