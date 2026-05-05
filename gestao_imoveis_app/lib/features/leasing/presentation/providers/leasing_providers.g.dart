// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leasing_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$leasingRemoteDataSourceHash() =>
    r'df577b6a16a3d59a9942a0d65b47c874146c7a65';

/// See also [leasingRemoteDataSource].
@ProviderFor(leasingRemoteDataSource)
final leasingRemoteDataSourceProvider =
    Provider<LeasingRemoteDataSource>.internal(
  leasingRemoteDataSource,
  name: r'leasingRemoteDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$leasingRemoteDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LeasingRemoteDataSourceRef = ProviderRef<LeasingRemoteDataSource>;
String _$rentalContractRepositoryHash() =>
    r'20dd5741aa85b8d4108a08af6abcfba9c294be31';

/// See also [rentalContractRepository].
@ProviderFor(rentalContractRepository)
final rentalContractRepositoryProvider =
    Provider<IRentalContractRepository>.internal(
  rentalContractRepository,
  name: r'rentalContractRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$rentalContractRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RentalContractRepositoryRef = ProviderRef<IRentalContractRepository>;
String _$renterRepositoryHash() => r'4cd457fd78b8254484d4ff509141e181c2ddd142';

/// See also [renterRepository].
@ProviderFor(renterRepository)
final renterRepositoryProvider = Provider<IRenterRepository>.internal(
  renterRepository,
  name: r'renterRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$renterRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RenterRepositoryRef = ProviderRef<IRenterRepository>;
String _$renterDetailHash() => r'c906627f07d3c1b82441b27f31b78bd60a6a8afb';

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

/// See also [renterDetail].
@ProviderFor(renterDetail)
const renterDetailProvider = RenterDetailFamily();

/// See also [renterDetail].
class RenterDetailFamily extends Family<AsyncValue<Renter>> {
  /// See also [renterDetail].
  const RenterDetailFamily();

  /// See also [renterDetail].
  RenterDetailProvider call(
    int id,
  ) {
    return RenterDetailProvider(
      id,
    );
  }

  @override
  RenterDetailProvider getProviderOverride(
    covariant RenterDetailProvider provider,
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
  String? get name => r'renterDetailProvider';
}

/// See also [renterDetail].
class RenterDetailProvider extends AutoDisposeFutureProvider<Renter> {
  /// See also [renterDetail].
  RenterDetailProvider(
    int id,
  ) : this._internal(
          (ref) => renterDetail(
            ref as RenterDetailRef,
            id,
          ),
          from: renterDetailProvider,
          name: r'renterDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$renterDetailHash,
          dependencies: RenterDetailFamily._dependencies,
          allTransitiveDependencies:
              RenterDetailFamily._allTransitiveDependencies,
          id: id,
        );

  RenterDetailProvider._internal(
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
    FutureOr<Renter> Function(RenterDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RenterDetailProvider._internal(
        (ref) => create(ref as RenterDetailRef),
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
  AutoDisposeFutureProviderElement<Renter> createElement() {
    return _RenterDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RenterDetailProvider && other.id == id;
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
mixin RenterDetailRef on AutoDisposeFutureProviderRef<Renter> {
  /// The parameter `id` of this provider.
  int get id;
}

class _RenterDetailProviderElement
    extends AutoDisposeFutureProviderElement<Renter> with RenterDetailRef {
  _RenterDetailProviderElement(super.provider);

  @override
  int get id => (origin as RenterDetailProvider).id;
}

String _$contractListHash() => r'39b1c1328cb4798a258872bc81a8c5f220af5126';

/// See also [ContractList].
@ProviderFor(ContractList)
final contractListProvider = AutoDisposeAsyncNotifierProvider<ContractList,
    List<RentalContract>>.internal(
  ContractList.new,
  name: r'contractListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$contractListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ContractList = AutoDisposeAsyncNotifier<List<RentalContract>>;
String _$renterListHash() => r'0eee00a4677e94deabb4f04ccfd8de435740327a';

/// See also [RenterList].
@ProviderFor(RenterList)
final renterListProvider =
    AutoDisposeAsyncNotifierProvider<RenterList, List<Renter>>.internal(
  RenterList.new,
  name: r'renterListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$renterListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$RenterList = AutoDisposeAsyncNotifier<List<Renter>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
