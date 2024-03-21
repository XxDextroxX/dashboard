// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider_data.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$listCenterCostsHash() => r'1fee636722c9b20e420daadfffa9d1d4c8e77628';

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

/// See also [listCenterCosts].
@ProviderFor(listCenterCosts)
const listCenterCostsProvider = ListCenterCostsFamily();

/// See also [listCenterCosts].
class ListCenterCostsFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [listCenterCosts].
  const ListCenterCostsFamily();

  /// See also [listCenterCosts].
  ListCenterCostsProvider call(
    BuildContext context,
  ) {
    return ListCenterCostsProvider(
      context,
    );
  }

  @override
  ListCenterCostsProvider getProviderOverride(
    covariant ListCenterCostsProvider provider,
  ) {
    return call(
      provider.context,
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
  String? get name => r'listCenterCostsProvider';
}

/// See also [listCenterCosts].
class ListCenterCostsProvider extends FutureProvider<Map<String, dynamic>> {
  /// See also [listCenterCosts].
  ListCenterCostsProvider(
    BuildContext context,
  ) : this._internal(
          (ref) => listCenterCosts(
            ref as ListCenterCostsRef,
            context,
          ),
          from: listCenterCostsProvider,
          name: r'listCenterCostsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$listCenterCostsHash,
          dependencies: ListCenterCostsFamily._dependencies,
          allTransitiveDependencies:
              ListCenterCostsFamily._allTransitiveDependencies,
          context: context,
        );

  ListCenterCostsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.context,
  }) : super.internal();

  final BuildContext context;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(ListCenterCostsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ListCenterCostsProvider._internal(
        (ref) => create(ref as ListCenterCostsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        context: context,
      ),
    );
  }

  @override
  FutureProviderElement<Map<String, dynamic>> createElement() {
    return _ListCenterCostsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ListCenterCostsProvider && other.context == context;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ListCenterCostsRef on FutureProviderRef<Map<String, dynamic>> {
  /// The parameter `context` of this provider.
  BuildContext get context;
}

class _ListCenterCostsProviderElement
    extends FutureProviderElement<Map<String, dynamic>>
    with ListCenterCostsRef {
  _ListCenterCostsProviderElement(super.provider);

  @override
  BuildContext get context => (origin as ListCenterCostsProvider).context;
}

String _$getDataToAdminHash() => r'6db7d30f5ba41548888657b29827fb8a4ef8375f';

/// See also [getDataToAdmin].
@ProviderFor(getDataToAdmin)
const getDataToAdminProvider = GetDataToAdminFamily();

/// See also [getDataToAdmin].
class GetDataToAdminFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [getDataToAdmin].
  const GetDataToAdminFamily();

  /// See also [getDataToAdmin].
  GetDataToAdminProvider call(
    BuildContext context, {
    String year = '',
    String month = '',
    bool isAdmin = true,
    bool isDataExpanded = false,
  }) {
    return GetDataToAdminProvider(
      context,
      year: year,
      month: month,
      isAdmin: isAdmin,
      isDataExpanded: isDataExpanded,
    );
  }

  @override
  GetDataToAdminProvider getProviderOverride(
    covariant GetDataToAdminProvider provider,
  ) {
    return call(
      provider.context,
      year: provider.year,
      month: provider.month,
      isAdmin: provider.isAdmin,
      isDataExpanded: provider.isDataExpanded,
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
  String? get name => r'getDataToAdminProvider';
}

/// See also [getDataToAdmin].
class GetDataToAdminProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [getDataToAdmin].
  GetDataToAdminProvider(
    BuildContext context, {
    String year = '',
    String month = '',
    bool isAdmin = true,
    bool isDataExpanded = false,
  }) : this._internal(
          (ref) => getDataToAdmin(
            ref as GetDataToAdminRef,
            context,
            year: year,
            month: month,
            isAdmin: isAdmin,
            isDataExpanded: isDataExpanded,
          ),
          from: getDataToAdminProvider,
          name: r'getDataToAdminProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getDataToAdminHash,
          dependencies: GetDataToAdminFamily._dependencies,
          allTransitiveDependencies:
              GetDataToAdminFamily._allTransitiveDependencies,
          context: context,
          year: year,
          month: month,
          isAdmin: isAdmin,
          isDataExpanded: isDataExpanded,
        );

  GetDataToAdminProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.context,
    required this.year,
    required this.month,
    required this.isAdmin,
    required this.isDataExpanded,
  }) : super.internal();

  final BuildContext context;
  final String year;
  final String month;
  final bool isAdmin;
  final bool isDataExpanded;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(GetDataToAdminRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetDataToAdminProvider._internal(
        (ref) => create(ref as GetDataToAdminRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        context: context,
        year: year,
        month: month,
        isAdmin: isAdmin,
        isDataExpanded: isDataExpanded,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _GetDataToAdminProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetDataToAdminProvider &&
        other.context == context &&
        other.year == year &&
        other.month == month &&
        other.isAdmin == isAdmin &&
        other.isDataExpanded == isDataExpanded;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);
    hash = _SystemHash.combine(hash, year.hashCode);
    hash = _SystemHash.combine(hash, month.hashCode);
    hash = _SystemHash.combine(hash, isAdmin.hashCode);
    hash = _SystemHash.combine(hash, isDataExpanded.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetDataToAdminRef on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `context` of this provider.
  BuildContext get context;

  /// The parameter `year` of this provider.
  String get year;

  /// The parameter `month` of this provider.
  String get month;

  /// The parameter `isAdmin` of this provider.
  bool get isAdmin;

  /// The parameter `isDataExpanded` of this provider.
  bool get isDataExpanded;
}

class _GetDataToAdminProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with GetDataToAdminRef {
  _GetDataToAdminProviderElement(super.provider);

  @override
  BuildContext get context => (origin as GetDataToAdminProvider).context;
  @override
  String get year => (origin as GetDataToAdminProvider).year;
  @override
  String get month => (origin as GetDataToAdminProvider).month;
  @override
  bool get isAdmin => (origin as GetDataToAdminProvider).isAdmin;
  @override
  bool get isDataExpanded => (origin as GetDataToAdminProvider).isDataExpanded;
}

String _$getDetailsMovementsHash() =>
    r'b10e205a9f4c46d605455e968d65b029e37b562e';

/// See also [getDetailsMovements].
@ProviderFor(getDetailsMovements)
const getDetailsMovementsProvider = GetDetailsMovementsFamily();

/// See also [getDetailsMovements].
class GetDetailsMovementsFamily
    extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [getDetailsMovements].
  const GetDetailsMovementsFamily();

  /// See also [getDetailsMovements].
  GetDetailsMovementsProvider call(
    BuildContext context, {
    String id = '',
    String year = '',
  }) {
    return GetDetailsMovementsProvider(
      context,
      id: id,
      year: year,
    );
  }

  @override
  GetDetailsMovementsProvider getProviderOverride(
    covariant GetDetailsMovementsProvider provider,
  ) {
    return call(
      provider.context,
      id: provider.id,
      year: provider.year,
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
  String? get name => r'getDetailsMovementsProvider';
}

/// See also [getDetailsMovements].
class GetDetailsMovementsProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [getDetailsMovements].
  GetDetailsMovementsProvider(
    BuildContext context, {
    String id = '',
    String year = '',
  }) : this._internal(
          (ref) => getDetailsMovements(
            ref as GetDetailsMovementsRef,
            context,
            id: id,
            year: year,
          ),
          from: getDetailsMovementsProvider,
          name: r'getDetailsMovementsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getDetailsMovementsHash,
          dependencies: GetDetailsMovementsFamily._dependencies,
          allTransitiveDependencies:
              GetDetailsMovementsFamily._allTransitiveDependencies,
          context: context,
          id: id,
          year: year,
        );

  GetDetailsMovementsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.context,
    required this.id,
    required this.year,
  }) : super.internal();

  final BuildContext context;
  final String id;
  final String year;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(GetDetailsMovementsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetDetailsMovementsProvider._internal(
        (ref) => create(ref as GetDetailsMovementsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        context: context,
        id: id,
        year: year,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _GetDetailsMovementsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetDetailsMovementsProvider &&
        other.context == context &&
        other.id == id &&
        other.year == year;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, year.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetDetailsMovementsRef
    on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `context` of this provider.
  BuildContext get context;

  /// The parameter `id` of this provider.
  String get id;

  /// The parameter `year` of this provider.
  String get year;
}

class _GetDetailsMovementsProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with GetDetailsMovementsRef {
  _GetDetailsMovementsProviderElement(super.provider);

  @override
  BuildContext get context => (origin as GetDetailsMovementsProvider).context;
  @override
  String get id => (origin as GetDetailsMovementsProvider).id;
  @override
  String get year => (origin as GetDetailsMovementsProvider).year;
}

String _$getDetailsAccountHash() => r'b27200c627325d30af91228cc21e409883d37042';

/// See also [getDetailsAccount].
@ProviderFor(getDetailsAccount)
const getDetailsAccountProvider = GetDetailsAccountFamily();

/// See also [getDetailsAccount].
class GetDetailsAccountFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [getDetailsAccount].
  const GetDetailsAccountFamily();

  /// See also [getDetailsAccount].
  GetDetailsAccountProvider call(
    BuildContext context, {
    String id = '',
    String year = '',
    String month = '',
    int page = 1,
  }) {
    return GetDetailsAccountProvider(
      context,
      id: id,
      year: year,
      month: month,
      page: page,
    );
  }

  @override
  GetDetailsAccountProvider getProviderOverride(
    covariant GetDetailsAccountProvider provider,
  ) {
    return call(
      provider.context,
      id: provider.id,
      year: provider.year,
      month: provider.month,
      page: provider.page,
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
  String? get name => r'getDetailsAccountProvider';
}

/// See also [getDetailsAccount].
class GetDetailsAccountProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [getDetailsAccount].
  GetDetailsAccountProvider(
    BuildContext context, {
    String id = '',
    String year = '',
    String month = '',
    int page = 1,
  }) : this._internal(
          (ref) => getDetailsAccount(
            ref as GetDetailsAccountRef,
            context,
            id: id,
            year: year,
            month: month,
            page: page,
          ),
          from: getDetailsAccountProvider,
          name: r'getDetailsAccountProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getDetailsAccountHash,
          dependencies: GetDetailsAccountFamily._dependencies,
          allTransitiveDependencies:
              GetDetailsAccountFamily._allTransitiveDependencies,
          context: context,
          id: id,
          year: year,
          month: month,
          page: page,
        );

  GetDetailsAccountProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.context,
    required this.id,
    required this.year,
    required this.month,
    required this.page,
  }) : super.internal();

  final BuildContext context;
  final String id;
  final String year;
  final String month;
  final int page;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(GetDetailsAccountRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetDetailsAccountProvider._internal(
        (ref) => create(ref as GetDetailsAccountRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        context: context,
        id: id,
        year: year,
        month: month,
        page: page,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _GetDetailsAccountProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetDetailsAccountProvider &&
        other.context == context &&
        other.id == id &&
        other.year == year &&
        other.month == month &&
        other.page == page;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, year.hashCode);
    hash = _SystemHash.combine(hash, month.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetDetailsAccountRef
    on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `context` of this provider.
  BuildContext get context;

  /// The parameter `id` of this provider.
  String get id;

  /// The parameter `year` of this provider.
  String get year;

  /// The parameter `month` of this provider.
  String get month;

  /// The parameter `page` of this provider.
  int get page;
}

class _GetDetailsAccountProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with GetDetailsAccountRef {
  _GetDetailsAccountProviderElement(super.provider);

  @override
  BuildContext get context => (origin as GetDetailsAccountProvider).context;
  @override
  String get id => (origin as GetDetailsAccountProvider).id;
  @override
  String get year => (origin as GetDetailsAccountProvider).year;
  @override
  String get month => (origin as GetDetailsAccountProvider).month;
  @override
  int get page => (origin as GetDetailsAccountProvider).page;
}

String _$isDataExpandedHash() => r'e8e2eb0c21cb644309d342c8a6e1dca17b3cf7c3';

/// See also [IsDataExpanded].
@ProviderFor(IsDataExpanded)
final isDataExpandedProvider =
    AutoDisposeNotifierProvider<IsDataExpanded, bool>.internal(
  IsDataExpanded.new,
  name: r'isDataExpandedProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$isDataExpandedHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$IsDataExpanded = AutoDisposeNotifier<bool>;
String _$totalExpensesHash() => r'be5be7f04458d4c6b3a0e8addef5a883b8620cfa';

/// See also [TotalExpenses].
@ProviderFor(TotalExpenses)
final totalExpensesProvider =
    AutoDisposeNotifierProvider<TotalExpenses, int>.internal(
  TotalExpenses.new,
  name: r'totalExpensesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$totalExpensesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TotalExpenses = AutoDisposeNotifier<int>;
String _$presupuestoHash() => r'6f8c3fbab37416a541579da40d76031e274755bf';

/// See also [Presupuesto].
@ProviderFor(Presupuesto)
final presupuestoProvider =
    AutoDisposeNotifierProvider<Presupuesto, int>.internal(
  Presupuesto.new,
  name: r'presupuestoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$presupuestoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Presupuesto = AutoDisposeNotifier<int>;
String _$centerCostHash() => r'de4794998b0aaff1328b3442162552e053c91434';

/// See also [CenterCost].
@ProviderFor(CenterCost)
final centerCostProvider =
    AutoDisposeNotifierProvider<CenterCost, String>.internal(
  CenterCost.new,
  name: r'centerCostProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$centerCostHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CenterCost = AutoDisposeNotifier<String>;
String _$countsHash() => r'c0b4787654ad8e9207a5a3890b89864432edda89';

/// See also [Counts].
@ProviderFor(Counts)
final countsProvider =
    AutoDisposeNotifierProvider<Counts, Map<String, dynamic>>.internal(
  Counts.new,
  name: r'countsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$countsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Counts = AutoDisposeNotifier<Map<String, dynamic>>;
String _$getIndexToDetailsHash() => r'd7a1436ccb082ef8dfbf67ea0b008e32c382d01e';

/// See also [GetIndexToDetails].
@ProviderFor(GetIndexToDetails)
final getIndexToDetailsProvider =
    NotifierProvider<GetIndexToDetails, int>.internal(
  GetIndexToDetails.new,
  name: r'getIndexToDetailsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getIndexToDetailsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GetIndexToDetails = Notifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
