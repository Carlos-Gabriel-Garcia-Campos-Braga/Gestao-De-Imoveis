// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$propertyRemoteDataSourceHash() =>
    r'84316ab9fcbb69fa36f40b3fde7478f4671c2f7e';

/// See also [propertyRemoteDataSource].
@ProviderFor(propertyRemoteDataSource)
final propertyRemoteDataSourceProvider =
    Provider<PropertyRemoteDataSource>.internal(
  propertyRemoteDataSource,
  name: r'propertyRemoteDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$propertyRemoteDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PropertyRemoteDataSourceRef = ProviderRef<PropertyRemoteDataSource>;
String _$propertyRepositoryHash() =>
    r'92292ba411554f800c7752322c5cf4770443fe29';

/// See also [propertyRepository].
@ProviderFor(propertyRepository)
final propertyRepositoryProvider = Provider<IPropertyRepository>.internal(
  propertyRepository,
  name: r'propertyRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$propertyRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PropertyRepositoryRef = ProviderRef<IPropertyRepository>;
String _$propertyDetailHash() => r'd64bd77a2d254f4148df3be82f7801601555ade8';

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

/// See also [propertyDetail].
@ProviderFor(propertyDetail)
const propertyDetailProvider = PropertyDetailFamily();

/// See also [propertyDetail].
class PropertyDetailFamily extends Family<AsyncValue<Property>> {
  /// See also [propertyDetail].
  const PropertyDetailFamily();

  /// See also [propertyDetail].
  PropertyDetailProvider call(
    int id,
  ) {
    return PropertyDetailProvider(
      id,
    );
  }

  @override
  PropertyDetailProvider getProviderOverride(
    covariant PropertyDetailProvider provider,
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
  String? get name => r'propertyDetailProvider';
}

/// See also [propertyDetail].
class PropertyDetailProvider extends AutoDisposeFutureProvider<Property> {
  /// See also [propertyDetail].
  PropertyDetailProvider(
    int id,
  ) : this._internal(
          (ref) => propertyDetail(
            ref as PropertyDetailRef,
            id,
          ),
          from: propertyDetailProvider,
          name: r'propertyDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$propertyDetailHash,
          dependencies: PropertyDetailFamily._dependencies,
          allTransitiveDependencies:
              PropertyDetailFamily._allTransitiveDependencies,
          id: id,
        );

  PropertyDetailProvider._internal(
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
    FutureOr<Property> Function(PropertyDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PropertyDetailProvider._internal(
        (ref) => create(ref as PropertyDetailRef),
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
  AutoDisposeFutureProviderElement<Property> createElement() {
    return _PropertyDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PropertyDetailProvider && other.id == id;
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
mixin PropertyDetailRef on AutoDisposeFutureProviderRef<Property> {
  /// The parameter `id` of this provider.
  int get id;
}

class _PropertyDetailProviderElement
    extends AutoDisposeFutureProviderElement<Property> with PropertyDetailRef {
  _PropertyDetailProviderElement(super.provider);

  @override
  int get id => (origin as PropertyDetailProvider).id;
}

String _$propertyInspectionsHash() =>
    r'bddf4827a9c6189b5f9a3387f6d101d8d4e70412';

/// See also [propertyInspections].
@ProviderFor(propertyInspections)
const propertyInspectionsProvider = PropertyInspectionsFamily();

/// See also [propertyInspections].
class PropertyInspectionsFamily
    extends Family<AsyncValue<List<InspectionReport>>> {
  /// See also [propertyInspections].
  const PropertyInspectionsFamily();

  /// See also [propertyInspections].
  PropertyInspectionsProvider call(
    int id,
  ) {
    return PropertyInspectionsProvider(
      id,
    );
  }

  @override
  PropertyInspectionsProvider getProviderOverride(
    covariant PropertyInspectionsProvider provider,
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
  String? get name => r'propertyInspectionsProvider';
}

/// See also [propertyInspections].
class PropertyInspectionsProvider
    extends AutoDisposeFutureProvider<List<InspectionReport>> {
  /// See also [propertyInspections].
  PropertyInspectionsProvider(
    int id,
  ) : this._internal(
          (ref) => propertyInspections(
            ref as PropertyInspectionsRef,
            id,
          ),
          from: propertyInspectionsProvider,
          name: r'propertyInspectionsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$propertyInspectionsHash,
          dependencies: PropertyInspectionsFamily._dependencies,
          allTransitiveDependencies:
              PropertyInspectionsFamily._allTransitiveDependencies,
          id: id,
        );

  PropertyInspectionsProvider._internal(
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
    FutureOr<List<InspectionReport>> Function(PropertyInspectionsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PropertyInspectionsProvider._internal(
        (ref) => create(ref as PropertyInspectionsRef),
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
  AutoDisposeFutureProviderElement<List<InspectionReport>> createElement() {
    return _PropertyInspectionsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PropertyInspectionsProvider && other.id == id;
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
mixin PropertyInspectionsRef
    on AutoDisposeFutureProviderRef<List<InspectionReport>> {
  /// The parameter `id` of this provider.
  int get id;
}

class _PropertyInspectionsProviderElement
    extends AutoDisposeFutureProviderElement<List<InspectionReport>>
    with PropertyInspectionsRef {
  _PropertyInspectionsProviderElement(super.provider);

  @override
  int get id => (origin as PropertyInspectionsProvider).id;
}

String _$propertyStatusFilterHash() =>
    r'bfcb592d2897f281e3236c2520cbff52761919b4';

/// See also [PropertyStatusFilter].
@ProviderFor(PropertyStatusFilter)
final propertyStatusFilterProvider =
    AutoDisposeNotifierProvider<PropertyStatusFilter, PropertyStatus?>.internal(
  PropertyStatusFilter.new,
  name: r'propertyStatusFilterProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$propertyStatusFilterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PropertyStatusFilter = AutoDisposeNotifier<PropertyStatus?>;
String _$propertyListHash() => r'd6f4afc1e2442132b5fdc6f3635ea745781aa5be';

/// See also [PropertyList].
@ProviderFor(PropertyList)
final propertyListProvider =
    AutoDisposeAsyncNotifierProvider<PropertyList, List<Property>>.internal(
  PropertyList.new,
  name: r'propertyListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$propertyListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PropertyList = AutoDisposeAsyncNotifier<List<Property>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
