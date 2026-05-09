import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestao_imoveis/core/errors/failure.dart';
import 'package:gestao_imoveis/core/router/route_names.dart';
import 'package:gestao_imoveis/features/leasing/domain/entities/rental_contract.dart';
import 'package:gestao_imoveis/features/leasing/domain/value_objects/contract_status.dart';
import 'package:gestao_imoveis/features/leasing/presentation/providers/leasing_providers.dart';
import 'package:gestao_imoveis/shared/widgets/contract_card.dart';
import 'package:gestao_imoveis/shared/widgets/empty_state.dart';
import 'package:gestao_imoveis/shared/widgets/error_view.dart';
import 'package:gestao_imoveis/shared/widgets/skeleton_list.dart';
import 'package:gestao_imoveis/shared/widgets/status_badge.dart';
import 'package:go_router/go_router.dart';

class ContractListScreen extends ConsumerStatefulWidget {
  const ContractListScreen({super.key});

  @override
  ConsumerState<ContractListScreen> createState() => _ContractListScreenState();
}

class _ContractListScreenState extends ConsumerState<ContractListScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final contractsAsync = ref.watch(contractListProvider);
    final onRentersTab = _tabController.index == 1;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Contratos'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Contratos'),
            Tab(text: 'Inquilinos'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _ContractTab(contractsAsync: contractsAsync),
          const _RentersTab(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => onRentersTab
            ? context.pushNamed(RouteNames.newRenter)
            : context.pushNamed(RouteNames.newContract),
        tooltip: onRentersTab ? 'Novo inquilino' : 'Novo contrato',
        child: Icon(onRentersTab ? Icons.person_add : Icons.add),
      ),
    );
  }
}

class _ContractTab extends ConsumerWidget {
  const _ContractTab({required this.contractsAsync});

  final AsyncValue<List<RentalContract>> contractsAsync;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return contractsAsync.when(
      loading: () => const SkeletonList(itemCount: 5, itemHeight: 140),
      error: (error, _) => ErrorView(
        failure: error is Failure
            ? error
            : Failure.unknown(message: error.toString()),
        onRetry: () => ref.invalidate(contractListProvider),
      ),
      data: (contracts) => contracts.isEmpty
          ? EmptyState(
              icon: Icons.description_outlined,
              title: 'Nenhum contrato',
              subtitle: 'Crie o primeiro contrato de locação.',
              actionLabel: 'Novo contrato',
              onAction: () =>
                  context.pushNamed(RouteNames.newContract),
            )
          : RefreshIndicator(
              onRefresh: () =>
                  ref.read(contractListProvider.notifier).refresh(),
              child: ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: contracts.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (_, i) => _buildCard(context, contracts[i]),
              ),
            ),
    );
  }

  StatusBadgeType _badgeType(ContractStatus status) => switch (status) {
        ContractStatus.active => StatusBadgeType.active,
        ContractStatus.expired => StatusBadgeType.expired,
        ContractStatus.terminated => StatusBadgeType.terminated,
      };

  Widget _buildCard(BuildContext context, RentalContract contract) {
    return ContractCard(
      renterName: contract.renter.name,
      propertyAddress: contract.fullAddress,
      rentValue: contract.rentalValue,
      startDate: contract.startContract,
      endDate: contract.endContract,
      status: _badgeType(contract.status),
      readjustmentPending: contract.readjustmentPending,
      onTap: () => context.pushNamed(
        RouteNames.contractDetail,
        pathParameters: {'id': '${contract.id}'},
      ),
    );
  }
}

class _RentersTab extends ConsumerWidget {
  const _RentersTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rentersAsync = ref.watch(renterListProvider);

    return rentersAsync.when(
      loading: () => const SkeletonList(itemCount: 5, itemHeight: 72),
      error: (error, _) => ErrorView(
        failure: error is Failure
            ? error
            : Failure.unknown(message: error.toString()),
        onRetry: () => ref.invalidate(renterListProvider),
      ),
      data: (renters) => renters.isEmpty
          ? EmptyState(
              icon: Icons.person_outline,
              title: 'Nenhum inquilino',
              subtitle: 'Cadastre o primeiro inquilino.',
              actionLabel: 'Novo inquilino',
              onAction: () => context.pushNamed(RouteNames.newRenter),
            )
          : RefreshIndicator(
              onRefresh: () =>
                  ref.read(renterListProvider.notifier).refresh(),
              child: ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: renters.length,
                separatorBuilder: (_, __) => const SizedBox(height: 8),
                itemBuilder: (_, i) {
                  final r = renters[i];
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text(r.name[0].toUpperCase()),
                    ),
                    title: Text(r.name),
                    subtitle: Text(r.formattedCpf),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => context.pushNamed(
                      RouteNames.renterDetail,
                      pathParameters: {'id': '${r.id}'},
                    ),
                  );
                },
              ),
            ),
    );
  }
}
