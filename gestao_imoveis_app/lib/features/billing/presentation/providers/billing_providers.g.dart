// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'billing_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$billingRemoteDataSourceHash() =>
    r'b383594282c7bcce3293f263df14e1fe90105658';

/// See also [billingRemoteDataSource].
@ProviderFor(billingRemoteDataSource)
final billingRemoteDataSourceProvider =
    Provider<BillingRemoteDataSource>.internal(
  billingRemoteDataSource,
  name: r'billingRemoteDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$billingRemoteDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef BillingRemoteDataSourceRef = ProviderRef<BillingRemoteDataSource>;
String _$invoiceRepositoryHash() => r'c5f1ac89d60b509de9673c26b278f1e3d73192bb';

/// See also [invoiceRepository].
@ProviderFor(invoiceRepository)
final invoiceRepositoryProvider = Provider<IInvoiceRepository>.internal(
  invoiceRepository,
  name: r'invoiceRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$invoiceRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef InvoiceRepositoryRef = ProviderRef<IInvoiceRepository>;
String _$invoiceDetailHash() => r'a801be03ff02e5e3e2eb60629353fbdc698488d9';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [invoiceDetail].
@ProviderFor(invoiceDetail)
const invoiceDetailProvider = InvoiceDetailFamily();

/// See also [invoiceDetail].
class InvoiceDetailFamily extends Family<AsyncValue<Invoice>> {
  /// See also [invoiceDetail].
  const InvoiceDetailFamily();

  /// See also [invoiceDetail].
  InvoiceDetailProvider call(
    int id,
  ) {
    return InvoiceDetailProvider(
      id,
    );
  }

  @override
  InvoiceDetailProvider getProviderOverride(
    covariant InvoiceDetailProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'invoiceDetailProvider';
}

/// See also [invoiceDetail].
class InvoiceDetailProvider extends AutoDisposeFutureProvider<Invoice> {
  /// See also [invoiceDetail].
  InvoiceDetailProvider(
    int id,
  ) : this._internal(
          (ref) => invoiceDetail(
            ref as InvoiceDetailRef,
            id,
          ),
          from: invoiceDetailProvider,
          name: r'invoiceDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$invoiceDetailHash,
          dependencies: InvoiceDetailFamily._dependencies,
          allTransitiveDependencies:
              InvoiceDetailFamily._allTransitiveDependencies,
          id: id,
        );

  InvoiceDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<Invoice> Function(InvoiceDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: InvoiceDetailProvider._internal(
        (ref) => create(ref as InvoiceDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Invoice> createElement() {
    return _InvoiceDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is InvoiceDetailProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin InvoiceDetailRef on AutoDisposeFutureProviderRef<Invoice> {
  /// The parameter `id` of this provider.
  int get id;
}

class _InvoiceDetailProviderElement
    extends AutoDisposeFutureProviderElement<Invoice> with InvoiceDetailRef {
  _InvoiceDetailProviderElement(super.provider);

  @override
  int get id => (origin as InvoiceDetailProvider).id;
}

String _$overdueInvoicesHash() => r'427583537d410977878429c43ab59544a2bae78b';

/// See also [overdueInvoices].
@ProviderFor(overdueInvoices)
final overdueInvoicesProvider =
    AutoDisposeFutureProvider<List<Invoice>>.internal(
  overdueInvoices,
  name: r'overdueInvoicesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$overdueInvoicesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef OverdueInvoicesRef = AutoDisposeFutureProviderRef<List<Invoice>>;
String _$dueSoonInvoicesHash() => r'b9a46b5ad3aab7aebeb0d4e62be4dcd08ed2482a';

/// See also [dueSoonInvoices].
@ProviderFor(dueSoonInvoices)
final dueSoonInvoicesProvider =
    AutoDisposeFutureProvider<List<Invoice>>.internal(
  dueSoonInvoices,
  name: r'dueSoonInvoicesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$dueSoonInvoicesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DueSoonInvoicesRef = AutoDisposeFutureProviderRef<List<Invoice>>;
String _$invoiceListHash() => r'76711ee4b39bcea91d4293ea93d5774bdcc2b627';

/// See also [InvoiceList].
@ProviderFor(InvoiceList)
final invoiceListProvider =
    AutoDisposeAsyncNotifierProvider<InvoiceList, List<Invoice>>.internal(
  InvoiceList.new,
  name: r'invoiceListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$invoiceListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$InvoiceList = AutoDisposeAsyncNotifier<List<Invoice>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
