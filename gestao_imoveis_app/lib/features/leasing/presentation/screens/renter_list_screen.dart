import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestao_imoveis/core/errors/failure.dart';
import 'package:gestao_imoveis/core/router/route_names.dart';
import 'package:gestao_imoveis/features/leasing/presentation/providers/leasing_providers.dart';
import 'package:gestao_imoveis/shared/widgets/empty_state.dart';
import 'package:gestao_imoveis/shared/widgets/error_view.dart';
import 'package:gestao_imoveis/shared/widgets/renter_card.dart';
import 'package:gestao_imoveis/shared/widgets/skeleton_list.dart';
import 'package:go_router/go_router.dart';

class RenterListScreen extends ConsumerWidget {
  const RenterListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rentersAsync = ref.watch(renterListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Inquilinos')),
      body: rentersAsync.when(
        loading: () => const SkeletonList(itemHeight: 72),
        error: (error, _) => ErrorView(
          failure: error is Failure
              ? error
              : Failure.unknown(message: error.toString()),
          onRetry: () => ref.invalidate(renterListProvider),
        ),
        data: (renters) => renters.isEmpty
            ? EmptyState(
                icon: Icons.person_outline,
                title: 'Nenhum inquilino cadastrado',
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
                    return RenterCard(
                      name: r.name,
                      cpf: r.cpf,
                      onTap: () => context.pushNamed(
                        RouteNames.renterDetail,
                        pathParameters: {'id': '${r.id}'},
                      ),
                    );
                  },
                ),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pushNamed(RouteNames.newRenter),
        child: const Icon(Icons.person_add),
      ),
    );
  }
}
