import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestao_imoveis/core/errors/failure.dart';
import 'package:gestao_imoveis/core/router/route_names.dart';
import 'package:gestao_imoveis/features/property/domain/entities/inspection_report.dart';
import 'package:gestao_imoveis/features/property/domain/entities/property.dart';
import 'package:gestao_imoveis/features/property/domain/value_objects/inspection_type.dart';
import 'package:gestao_imoveis/features/property/domain/value_objects/property_status.dart';
import 'package:gestao_imoveis/features/property/domain/value_objects/property_type.dart';
import 'package:gestao_imoveis/features/property/presentation/providers/property_providers.dart';
import 'package:gestao_imoveis/shared/widgets/app_bottom_sheet.dart';
import 'package:gestao_imoveis/shared/widgets/app_button.dart';
import 'package:gestao_imoveis/shared/widgets/error_view.dart';
import 'package:gestao_imoveis/shared/widgets/section_header.dart';
import 'package:gestao_imoveis/shared/widgets/skeleton_list.dart';
import 'package:gestao_imoveis/shared/widgets/status_badge.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class PropertyDetailScreen extends ConsumerWidget {
  const PropertyDetailScreen({super.key, required this.id});

  final int id;

  StatusBadgeType _badgeType(PropertyStatus status) => switch (status) {
        PropertyStatus.vacant => StatusBadgeType.vacant,
        PropertyStatus.occupied => StatusBadgeType.occupied,
        PropertyStatus.maintenance => StatusBadgeType.maintenance,
      };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final propertyAsync = ref.watch(propertyDetailProvider(id));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Imóvel'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            tooltip: 'Editar imóvel',
            onPressed: () => context.pushNamed(
              RouteNames.editProperty,
              pathParameters: {'id': '$id'},
            ),
          ),
          PopupMenuButton<String>(
            onSelected: (value) async {
              if (value == 'archive') {
                final confirmed = await showDialog<bool>(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text('Arquivar imóvel'),
                    content: const Text(
                      'O imóvel será movido para o arquivo e não aparecerá mais nas listas ativas. Deseja continuar?',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(ctx, false),
                        child: const Text('Cancelar'),
                      ),
                      FilledButton(
                        onPressed: () => Navigator.pop(ctx, true),
                        child: const Text('Arquivar'),
                      ),
                    ],
                  ),
                );
                if (confirmed ?? false) {
                  try {
                    await ref
                        .read(propertyRepositoryProvider)
                        .archive(id);
                    ref.invalidate(propertyListProvider);
                    ref.invalidate(vacantPropertiesProvider);
                    if (context.mounted) context.pop();
                  } catch (e) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(e.toString())),
                      );
                    }
                  }
                }
              }
            },
            itemBuilder: (_) => const [
              PopupMenuItem(
                value: 'archive',
                child: ListTile(
                  leading: Icon(Icons.archive_outlined),
                  title: Text('Arquivar imóvel'),
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ],
          ),
        ],
      ),
      body: propertyAsync.when(
        loading: () => const SkeletonList(itemCount: 3, itemHeight: 120),
        error: (error, _) => ErrorView(
          failure: error is Failure
              ? error
              : Failure.unknown(message: error.toString()),
          onRetry: () => ref.invalidate(propertyDetailProvider(id)),
        ),
        data: (property) => _PropertyDetailBody(
          property: property,
          propertyId: id,
          badgeType: _badgeType(property.status),
          onStatusChanged: (status) async {
            await ref
                .read(propertyListProvider.notifier)
                .updateStatus(id, status);
            ref.invalidate(propertyDetailProvider(id));
          },
        ),
      ),
    );
  }
}

class _PropertyDetailBody extends ConsumerWidget {
  const _PropertyDetailBody({
    required this.property,
    required this.propertyId,
    required this.badgeType,
    required this.onStatusChanged,
  });

  final Property property;
  final int propertyId;
  final StatusBadgeType badgeType;
  final void Function(PropertyStatus) onStatusChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final inspectionsAsync = ref.watch(propertyInspectionsProvider(propertyId));

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header card
          Card(
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          property.description,
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      StatusBadge(badgeType),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    property.type.label,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 16,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          property.fullAddress,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Icons.pin_drop_outlined,
                        size: 16,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'CEP: ${property.zipCode}',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Actions
          Row(
            children: [
              Expanded(
                child: AppButton(
                  label: 'Alterar status',
                  icon: Icons.swap_horiz,
                  variant: AppButtonVariant.outline,
                  onPressed: () => _showStatusSheet(context),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: AppButton(
                  label: 'Nova vistoria',
                  icon: Icons.checklist,
                  onPressed: () => context.pushNamed(
                    RouteNames.newInspection,
                    pathParameters: {'id': '$propertyId'},
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Inspections section
          const SectionHeader(title: 'VISTORIAS'),
          inspectionsAsync.when(
            loading: () => const SkeletonList(itemCount: 3, itemHeight: 80),
            error: (error, _) => ErrorView(
              failure: error is Failure
                  ? error
                  : Failure.unknown(message: error.toString()),
              onRetry: () =>
                  ref.invalidate(propertyInspectionsProvider(propertyId)),
            ),
            data: (inspections) => inspections.isEmpty
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: Center(
                      child: Text(
                        'Nenhuma vistoria registrada.',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                  )
                : ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: inspections.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 8),
                    itemBuilder: (_, index) =>
                        _InspectionCard(inspection: inspections[index]),
                  ),
          ),
        ],
      ),
    );
  }

  void _showStatusSheet(BuildContext context) {
    AppBottomSheet.show<void>(
      context,
      title: 'Alterar status',
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: PropertyStatus.values
            .map(
              (s) => ListTile(
                leading: Icon(_statusIcon(s)),
                title: Text(s.label),
                trailing: property.status == s
                    ? const Icon(Icons.check, color: Colors.green)
                    : null,
                onTap: () {
                  Navigator.of(context).pop();
                  onStatusChanged(s);
                },
              ),
            )
            .toList(),
      ),
    );
  }

  IconData _statusIcon(PropertyStatus status) => switch (status) {
        PropertyStatus.vacant => Icons.lock_open,
        PropertyStatus.occupied => Icons.home,
        PropertyStatus.maintenance => Icons.build,
      };
}

class _InspectionCard extends StatelessWidget {
  const _InspectionCard({required this.inspection});

  final InspectionReport inspection;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dateFormat = DateFormat('dd/MM/yyyy HH:mm', 'pt_BR');

    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: theme.colorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                inspection.type == InspectionType.entry
                    ? Icons.login
                    : Icons.logout,
                size: 20,
                color: theme.colorScheme.onSecondaryContainer,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    inspection.type.label,
                    style: theme.textTheme.titleSmall
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    inspection.inspector,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  if (inspection.notes != null)
                    Text(
                      inspection.notes!,
                      style: theme.textTheme.bodySmall,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                ],
              ),
            ),
            Text(
              dateFormat.format(inspection.inspectedAt),
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
