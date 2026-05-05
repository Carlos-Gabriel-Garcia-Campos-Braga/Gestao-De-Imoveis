import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestao_imoveis/core/errors/failure.dart';
import 'package:gestao_imoveis/core/extensions/double_extension.dart';
import 'package:gestao_imoveis/core/router/route_names.dart';
import 'package:gestao_imoveis/core/theme/app_colors.dart';
import 'package:gestao_imoveis/features/billing/presentation/providers/billing_providers.dart';
import 'package:gestao_imoveis/features/dashboard/presentation/providers/dashboard_providers.dart';
import 'package:gestao_imoveis/features/identity/presentation/providers/auth_providers.dart';
import 'package:gestao_imoveis/features/leasing/presentation/providers/leasing_providers.dart';
import 'package:gestao_imoveis/shared/widgets/empty_state.dart';
import 'package:gestao_imoveis/shared/widgets/error_view.dart';
import 'package:gestao_imoveis/shared/widgets/invoice_card.dart';
import 'package:gestao_imoveis/shared/widgets/kpi_card.dart';
import 'package:gestao_imoveis/shared/widgets/section_header.dart';
import 'package:gestao_imoveis/shared/widgets/status_badge.dart';
import 'package:go_router/go_router.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);
    final kpisAsync = ref.watch(dashboardKpisProvider);
    final dueSoonAsync = ref.watch(dueSoonInvoicesProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          user != null ? 'Olá, ${user.name.split(' ').first}' : 'Dashboard',
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.invalidate(dashboardKpisProvider);
              ref.invalidate(dueSoonInvoicesProvider);
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () => context.pushNamed(RouteNames.settings),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(dashboardKpisProvider);
          ref.invalidate(dueSoonInvoicesProvider);
          ref.invalidate(contractListProvider);
          ref.invalidate(invoiceListProvider);
        },
        child: CustomScrollView(
          slivers: [
            // KPI grid
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              sliver: SliverToBoxAdapter(
                child: kpisAsync.when(
                  loading: () => const _KpiGridSkeleton(),
                  error: (_, __) => const SizedBox.shrink(),
                  data: (kpis) => _KpiGrid(kpis: kpis),
                ),
              ),
            ),

            // Vence em breve
            const SliverPadding(
              padding: EdgeInsets.fromLTRB(16, 24, 16, 8),
              sliver: SliverToBoxAdapter(
                child: SectionHeader(title: 'Vence em breve'),
              ),
            ),

            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: dueSoonAsync.when(
                loading: () => const SliverToBoxAdapter(
                  child: LinearProgressIndicator(),
                ),
                error: (e, _) => SliverToBoxAdapter(
                  child: ErrorView(
                    failure: e is Failure ? e : const Failure.network(),
                    onRetry: () => ref.invalidate(dueSoonInvoicesProvider),
                  ),
                ),
                data: (invoices) {
                  if (invoices.isEmpty) {
                    return const SliverToBoxAdapter(
                      child: EmptyState(
                        icon: Icons.check_circle_outline,
                        title: 'Nenhuma cobrança pendente',
                        subtitle: 'Tudo em dia!',
                      ),
                    );
                  }
                  return SliverList.separated(
                    itemCount: invoices.length,
                    separatorBuilder: (_, __) =>
                        const SizedBox(height: 10),
                    itemBuilder: (_, i) {
                      final inv = invoices[i];
                      return InvoiceCard(
                        amount: inv.amount,
                        dueDate: inv.dueDate,
                        status: StatusBadgeType.pending,
                        onTap: () => context.pushNamed(
                          RouteNames.invoiceDetail,
                          pathParameters: {'id': '${inv.id}'},
                        ),
                      );
                    },
                  );
                },
              ),
            ),

            const SliverPadding(padding: EdgeInsets.only(bottom: 32)),
          ],
        ),
      ),
    );
  }
}

class _KpiGrid extends StatelessWidget {
  const _KpiGrid({required this.kpis});

  final DashboardKpis kpis;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 1.05,
      children: [
        KpiCard(
          value: '${(kpis.occupancyRate * 100).toStringAsFixed(0)}%',
          label: 'Ocupação',
          icon: Icons.apartment,
          color: AppColors.primary,
          trend: kpis.occupancyRate >= 0.8 ? KpiTrend.up : KpiTrend.down,
        ),
        KpiCard(
          value: '${kpis.activeContracts}',
          label: 'Contratos ativos',
          icon: Icons.description,
          color: AppColors.success,
        ),
        KpiCard(
          value: kpis.monthlyRevenue.toBRL(),
          label: 'Receita mensal',
          icon: Icons.payments_outlined,
          color: AppColors.success,
          trend: KpiTrend.up,
        ),
        KpiCard(
          value: '${kpis.overdueInvoices}',
          label: 'Cobranças vencidas',
          icon: Icons.warning_amber,
          color: kpis.overdueInvoices > 0 ? AppColors.danger : AppColors.neutral,
          trend: kpis.overdueInvoices > 0 ? KpiTrend.down : KpiTrend.neutral,
        ),
      ],
    );
  }
}

class _KpiGridSkeleton extends StatelessWidget {
  const _KpiGridSkeleton();

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 1.05,
      children: List.generate(
        4,
        (_) => Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerLow,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
