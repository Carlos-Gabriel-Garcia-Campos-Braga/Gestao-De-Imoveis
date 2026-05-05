import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestao_imoveis/core/router/route_names.dart';
import 'package:gestao_imoveis/features/billing/presentation/screens/invoice_detail_screen.dart';
import 'package:gestao_imoveis/features/billing/presentation/screens/invoice_list_screen.dart';
import 'package:gestao_imoveis/features/billing/presentation/screens/new_invoice_screen.dart';
import 'package:gestao_imoveis/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:gestao_imoveis/features/identity/presentation/providers/auth_providers.dart';
import 'package:gestao_imoveis/features/identity/presentation/screens/change_password_screen.dart';
import 'package:gestao_imoveis/features/identity/presentation/screens/login_screen.dart';
import 'package:gestao_imoveis/features/identity/presentation/screens/settings_screen.dart';
import 'package:gestao_imoveis/features/leasing/presentation/screens/contract_detail_screen.dart';
import 'package:gestao_imoveis/features/leasing/presentation/screens/contract_form_screen.dart';
import 'package:gestao_imoveis/features/leasing/presentation/screens/contract_list_screen.dart';
import 'package:gestao_imoveis/features/leasing/presentation/screens/renter_detail_screen.dart';
import 'package:gestao_imoveis/features/leasing/presentation/screens/renter_form_screen.dart';
import 'package:gestao_imoveis/features/leasing/presentation/screens/renter_list_screen.dart';
import 'package:gestao_imoveis/features/property/presentation/screens/inspection_form_screen.dart';
import 'package:gestao_imoveis/features/property/presentation/screens/property_detail_screen.dart';
import 'package:gestao_imoveis/features/property/presentation/screens/property_form_screen.dart';
import 'package:gestao_imoveis/features/property/presentation/screens/property_list_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

class _MainScaffold extends StatelessWidget {
  const _MainScaffold({required this.child, required this.state});
  final Widget child;
  final GoRouterState state;

  int _tabIndex(String location) {
    if (location.startsWith('/properties')) return 1;
    if (location.startsWith('/leasing')) return 2;
    if (location.startsWith('/billing')) return 3;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final idx = _tabIndex(state.matchedLocation);
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: idx,
        onTap: (i) {
          switch (i) {
            case 0:
              context.go(RoutePaths.dashboard);
            case 1:
              context.go(RoutePaths.properties);
            case 2:
              context.go(RoutePaths.contracts);
            case 3:
              context.go(RoutePaths.billing);
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.apartment_outlined),
            activeIcon: Icon(Icons.apartment),
            label: 'Imóveis',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.description_outlined),
            activeIcon: Icon(Icons.description),
            label: 'Contratos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long_outlined),
            activeIcon: Icon(Icons.receipt_long),
            label: 'Cobranças',
          ),
        ],
      ),
    );
  }
}

@Riverpod(keepAlive: true)
GoRouter appRouter(Ref ref) {
  final refreshNotifier = ValueNotifier<int>(0);
  ref.listen(authNotifierProvider, (_, __) {
    refreshNotifier.value++;
  });
  ref.onDispose(refreshNotifier.dispose);

  return GoRouter(
    initialLocation: RoutePaths.dashboard,
    refreshListenable: refreshNotifier,
    redirect: (context, state) {
      final authState = ref.read(authNotifierProvider);

      if (authState.isLoading) return null;

      final authenticated = authState.valueOrNull != null;
      final onLogin = state.matchedLocation == RoutePaths.login;

      if (!authenticated && !onLogin) return RoutePaths.login;
      if (authenticated && onLogin) return RoutePaths.dashboard;
      return null;
    },
    routes: [
      GoRoute(
        path: RoutePaths.login,
        name: RouteNames.login,
        builder: (_, __) => const LoginScreen(),
      ),
      ShellRoute(
        builder: (_, state, child) =>
            _MainScaffold(state: state, child: child),
        routes: [
          GoRoute(
            path: RoutePaths.dashboard,
            name: RouteNames.dashboard,
            builder: (_, __) => const DashboardScreen(),
          ),

          // Property
          GoRoute(
            path: RoutePaths.properties,
            name: RouteNames.properties,
            builder: (_, __) => const PropertyListScreen(),
            routes: [
              GoRoute(
                path: 'new',
                name: RouteNames.newProperty,
                builder: (_, __) => const PropertyFormScreen(),
              ),
              GoRoute(
                path: ':id',
                name: RouteNames.propertyDetail,
                builder: (_, s) => PropertyDetailScreen(
                  id: int.parse(s.pathParameters['id']!),
                ),
                routes: [
                  GoRoute(
                    path: 'edit',
                    name: RouteNames.editProperty,
                    builder: (_, s) => PropertyFormScreen(
                      propertyId: int.parse(s.pathParameters['id']!),
                    ),
                  ),
                  GoRoute(
                    path: 'inspection',
                    name: RouteNames.newInspection,
                    builder: (_, s) => InspectionFormScreen(
                      propertyId: int.parse(s.pathParameters['id']!),
                    ),
                  ),
                ],
              ),
            ],
          ),

          // Leasing
          GoRoute(
            path: RoutePaths.contracts,
            name: RouteNames.contracts,
            builder: (_, __) => const ContractListScreen(),
            routes: [
              GoRoute(
                path: 'contracts/new',
                name: RouteNames.newContract,
                builder: (_, __) => const ContractFormScreen(),
              ),
              GoRoute(
                path: 'contracts/:id',
                name: RouteNames.contractDetail,
                builder: (_, s) => ContractDetailScreen(
                  contractId: int.parse(s.pathParameters['id']!),
                ),
              ),
              GoRoute(
                path: 'renters',
                name: RouteNames.renters,
                builder: (_, __) => const RenterListScreen(),
                routes: [
                  GoRoute(
                    path: 'new',
                    name: RouteNames.newRenter,
                    builder: (_, __) => const RenterFormScreen(),
                  ),
                  GoRoute(
                    path: ':id',
                    name: RouteNames.renterDetail,
                    builder: (_, s) => RenterDetailScreen(
                      renterId: int.parse(s.pathParameters['id']!),
                    ),
                  ),
                ],
              ),
            ],
          ),

          // Billing
          GoRoute(
            path: RoutePaths.billing,
            name: RouteNames.billing,
            builder: (_, __) => const InvoiceListScreen(),
            routes: [
              GoRoute(
                path: 'new',
                name: RouteNames.newInvoice,
                builder: (_, __) => const NewInvoiceScreen(),
              ),
              GoRoute(
                path: ':id',
                name: RouteNames.invoiceDetail,
                builder: (_, s) => InvoiceDetailScreen(
                  invoiceId: int.parse(s.pathParameters['id']!),
                ),
              ),
            ],
          ),
        ],
      ),

      GoRoute(
        path: RoutePaths.settings,
        name: RouteNames.settings,
        builder: (_, __) => const SettingsScreen(),
      ),
      GoRoute(
        path: RoutePaths.changePassword,
        name: RouteNames.changePassword,
        builder: (_, __) => const ChangePasswordScreen(),
      ),
    ],
  );
}
