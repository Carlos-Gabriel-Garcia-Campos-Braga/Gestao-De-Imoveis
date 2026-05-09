import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestao_imoveis/core/errors/failure.dart';
import 'package:gestao_imoveis/features/archive/presentation/providers/archive_providers.dart';
import 'package:gestao_imoveis/features/leasing/domain/entities/rental_contract.dart';
import 'package:gestao_imoveis/features/leasing/domain/entities/renter.dart';
import 'package:gestao_imoveis/features/leasing/presentation/providers/leasing_providers.dart';
import 'package:gestao_imoveis/features/property/domain/entities/property.dart';
import 'package:gestao_imoveis/features/property/presentation/providers/property_providers.dart';
import 'package:gestao_imoveis/shared/widgets/empty_state.dart';
import 'package:gestao_imoveis/shared/widgets/error_view.dart';
import 'package:intl/intl.dart';

class ArchiveScreen extends StatelessWidget {
  const ArchiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Arquivo'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Imóveis'),
              Tab(text: 'Contratos'),
              Tab(text: 'Inquilinos'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            _ArchivedPropertiesTab(),
            _ArchivedContractsTab(),
            _ArchivedRentersTab(),
          ],
        ),
      ),
    );
  }
}

// ── Imóveis arquivados ────────────────────────────────────────────────────────

class _ArchivedPropertiesTab extends ConsumerWidget {
  const _ArchivedPropertiesTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(archivedPropertiesProvider);
    return async.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => ErrorView(
        failure: e is Failure ? e : Failure.unknown(message: e.toString()),
        onRetry: () => ref.invalidate(archivedPropertiesProvider),
      ),
      data: (list) {
        if (list.isEmpty) {
          return const EmptyState(
            icon: Icons.apartment_outlined,
            title: 'Nenhum imóvel arquivado',
            subtitle: 'Imóveis arquivados aparecem aqui.',
          );
        }
        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: list.length,
          separatorBuilder: (_, __) => const SizedBox(height: 8),
          itemBuilder: (_, i) => _ArchivedPropertyTile(
            property: list[i],
            onRestore: () async {
              await ref
                  .read(propertyRepositoryProvider)
                  .unarchive(list[i].id);
              ref.invalidate(archivedPropertiesProvider);
              ref.invalidate(propertyListProvider);
              ref.invalidate(vacantPropertiesProvider);
            },
          ),
        );
      },
    );
  }
}

class _ArchivedPropertyTile extends StatelessWidget {
  const _ArchivedPropertyTile({
    required this.property,
    required this.onRestore,
  });

  final Property property;
  final Future<void> Function() onRestore;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const CircleAvatar(child: Icon(Icons.apartment)),
        title: Text(property.description),
        subtitle: Text(
          property.fullAddress,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: IconButton(
          icon: const Icon(Icons.unarchive_outlined),
          tooltip: 'Restaurar',
          onPressed: () => _confirmRestore(context),
        ),
      ),
    );
  }

  Future<void> _confirmRestore(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Restaurar imóvel'),
        content: const Text(
            'O imóvel voltará para as listas ativas. Deseja continuar?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Restaurar'),
          ),
        ],
      ),
    );
    if (confirmed ?? false) await onRestore();
  }
}

// ── Contratos arquivados ──────────────────────────────────────────────────────

class _ArchivedContractsTab extends ConsumerWidget {
  const _ArchivedContractsTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(archivedContractsProvider);
    return async.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => ErrorView(
        failure: e is Failure ? e : Failure.unknown(message: e.toString()),
        onRetry: () => ref.invalidate(archivedContractsProvider),
      ),
      data: (list) {
        if (list.isEmpty) {
          return const EmptyState(
            icon: Icons.description_outlined,
            title: 'Nenhum contrato arquivado',
            subtitle: 'Contratos arquivados aparecem aqui.',
          );
        }
        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: list.length,
          separatorBuilder: (_, __) => const SizedBox(height: 8),
          itemBuilder: (_, i) => _ArchivedContractTile(
            contract: list[i],
            onRestore: () async {
              await ref
                  .read(rentalContractRepositoryProvider)
                  .unarchive(list[i].id);
              ref.invalidate(archivedContractsProvider);
              ref.invalidate(contractListProvider);
            },
          ),
        );
      },
    );
  }
}

class _ArchivedContractTile extends StatelessWidget {
  const _ArchivedContractTile({
    required this.contract,
    required this.onRestore,
  });

  final RentalContract contract;
  final Future<void> Function() onRestore;

  @override
  Widget build(BuildContext context) {
    final fmt = DateFormat('dd/MM/yyyy');
    return Card(
      child: ListTile(
        leading: const CircleAvatar(child: Icon(Icons.description)),
        title: Text(contract.renter.name),
        subtitle: Text(
          '${contract.street} — '
          '${fmt.format(contract.startContract)} a ${fmt.format(contract.endContract)}',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'R\$ ${contract.rentalValue.toStringAsFixed(2).replaceAll('.', ',')}',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(width: 4),
            IconButton(
              icon: const Icon(Icons.unarchive_outlined),
              tooltip: 'Restaurar',
              onPressed: () => _confirmRestore(context),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _confirmRestore(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Restaurar contrato'),
        content: const Text(
            'O contrato voltará para as listas ativas. Deseja continuar?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Restaurar'),
          ),
        ],
      ),
    );
    if (confirmed ?? false) await onRestore();
  }
}

// ── Inquilinos arquivados ─────────────────────────────────────────────────────

class _ArchivedRentersTab extends ConsumerWidget {
  const _ArchivedRentersTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(archivedRentersProvider);
    return async.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => ErrorView(
        failure: e is Failure ? e : Failure.unknown(message: e.toString()),
        onRetry: () => ref.invalidate(archivedRentersProvider),
      ),
      data: (list) {
        if (list.isEmpty) {
          return const EmptyState(
            icon: Icons.person_outline,
            title: 'Nenhum inquilino arquivado',
            subtitle: 'Inquilinos arquivados aparecem aqui.',
          );
        }
        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: list.length,
          separatorBuilder: (_, __) => const SizedBox(height: 8),
          itemBuilder: (_, i) => _ArchivedRenterTile(
            renter: list[i],
            onRestore: () async {
              await ref
                  .read(renterRepositoryProvider)
                  .unarchive(list[i].id);
              ref.invalidate(archivedRentersProvider);
              ref.invalidate(renterListProvider);
            },
          ),
        );
      },
    );
  }
}

class _ArchivedRenterTile extends StatelessWidget {
  const _ArchivedRenterTile({
    required this.renter,
    required this.onRestore,
  });

  final Renter renter;
  final Future<void> Function() onRestore;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          child: Text(renter.name[0].toUpperCase()),
        ),
        title: Text(renter.name),
        subtitle: Text(renter.formattedCpf),
        trailing: IconButton(
          icon: const Icon(Icons.unarchive_outlined),
          tooltip: 'Restaurar',
          onPressed: () => _confirmRestore(context),
        ),
      ),
    );
  }

  Future<void> _confirmRestore(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Restaurar inquilino'),
        content: const Text(
            'O inquilino voltará para as listas ativas. Deseja continuar?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Restaurar'),
          ),
        ],
      ),
    );
    if (confirmed ?? false) await onRestore();
  }
}
