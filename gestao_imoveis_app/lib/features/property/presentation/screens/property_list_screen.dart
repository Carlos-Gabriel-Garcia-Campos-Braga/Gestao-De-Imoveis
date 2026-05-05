import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestao_imoveis/core/errors/failure.dart';
import 'package:gestao_imoveis/core/router/route_names.dart';
import 'package:gestao_imoveis/features/property/domain/entities/property.dart';
import 'package:gestao_imoveis/features/property/domain/value_objects/property_status.dart';
import 'package:gestao_imoveis/features/property/domain/value_objects/property_type.dart';
import 'package:gestao_imoveis/features/property/presentation/providers/property_providers.dart';
import 'package:gestao_imoveis/shared/widgets/app_card.dart';
import 'package:gestao_imoveis/shared/widgets/empty_state.dart';
import 'package:gestao_imoveis/shared/widgets/error_view.dart';
import 'package:gestao_imoveis/shared/widgets/skeleton_list.dart';
import 'package:gestao_imoveis/shared/widgets/status_badge.dart';
import 'package:go_router/go_router.dart';

class PropertyListScreen extends ConsumerWidget {
  const PropertyListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(propertyStatusFilterProvider);
    final propertiesAsync = ref.watch(propertyListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Imóveis'),
      ),
      body: Column(
        children: [
          _FilterChips(currentFilter: filter),
          Expanded(
            child: propertiesAsync.when(
              loading: () => const SkeletonList(itemCount: 5, itemHeight: 110),
              error: (error, _) => ErrorView(
                failure: error is Failure
                    ? error
                    : Failure.unknown(message: error.toString()),
                onRetry: () => ref.invalidate(propertyListProvider),
              ),
              data: (properties) => properties.isEmpty
                  ? EmptyState(
                      icon: Icons.apartment_outlined,
                      title: 'Nenhum imóvel encontrado',
                      subtitle: filter == null
                          ? 'Cadastre seu primeiro imóvel.'
                          : 'Nenhum imóvel com status "${filter.label}".',
                      actionLabel: filter == null ? 'Adicionar imóvel' : null,
                      onAction: filter == null
                          ? () => context.pushNamed(RouteNames.newProperty)
                          : null,
                    )
                  : RefreshIndicator(
                      onRefresh: () =>
                          ref.read(propertyListProvider.notifier).refresh(),
                      child: ListView.separated(
                        padding: const EdgeInsets.all(16),
                        itemCount: properties.length,
                        separatorBuilder: (_, __) =>
                            const SizedBox(height: 12),
                        itemBuilder: (_, index) => _PropertyCard(
                          property: properties[index],
                          onTap: () => context.pushNamed(
                            RouteNames.propertyDetail,
                            pathParameters: {
                              'id': '${properties[index].id}',
                            },
                          ),
                        ),
                      ),
                    ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pushNamed(RouteNames.newProperty),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _FilterChips extends ConsumerWidget {
  const _FilterChips({required this.currentFilter});

  final PropertyStatus? currentFilter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          _chip(
            context,
            ref,
            label: 'Todos',
            value: null,
            isSelected: currentFilter == null,
          ),
          const SizedBox(width: 8),
          ...PropertyStatus.values.map(
            (s) => Padding(
              padding: const EdgeInsets.only(right: 8),
              child: _chip(
                context,
                ref,
                label: s.label,
                value: s,
                isSelected: currentFilter == s,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _chip(
    BuildContext context,
    WidgetRef ref, {
    required String label,
    required PropertyStatus? value,
    required bool isSelected,
  }) {
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (_) =>
          ref.read(propertyStatusFilterProvider.notifier).set(value),
    );
  }
}

class _PropertyCard extends StatelessWidget {
  const _PropertyCard({
    required this.property,
    required this.onTap,
  });

  final Property property;
  final VoidCallback onTap;

  StatusBadgeType _badgeType(PropertyStatus status) => switch (status) {
        PropertyStatus.vacant => StatusBadgeType.vacant,
        PropertyStatus.occupied => StatusBadgeType.occupied,
        PropertyStatus.maintenance => StatusBadgeType.maintenance,
      };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppCard(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.apartment,
              color: theme.colorScheme.onPrimaryContainer,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  property.description,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  property.type.label,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          StatusBadge(_badgeType(property.status)),
        ],
      ),
    );
  }
}
