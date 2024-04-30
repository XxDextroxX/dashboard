// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider_orders_buys.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getOrdersBuysHash() => r'9a2eb1a7d8c407b15fa00a4aa0e6326c2eca6bc7';

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

/// See also [getOrdersBuys].
@ProviderFor(getOrdersBuys)
const getOrdersBuysProvider = GetOrdersBuysFamily();

/// See also [getOrdersBuys].
class GetOrdersBuysFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [getOrdersBuys].
  const GetOrdersBuysFamily();

  /// See also [getOrdersBuys].
  GetOrdersBuysProvider call(
    BuildContext context, {
    String? fechainicio,
    String? fechafin,
    String? estado,
    int page = 1,
    required bool updateState,
  }) {
    return GetOrdersBuysProvider(
      context,
      fechainicio: fechainicio,
      fechafin: fechafin,
      estado: estado,
      page: page,
      updateState: updateState,
    );
  }

  @override
  GetOrdersBuysProvider getProviderOverride(
    covariant GetOrdersBuysProvider provider,
  ) {
    return call(
      provider.context,
      fechainicio: provider.fechainicio,
      fechafin: provider.fechafin,
      estado: provider.estado,
      page: provider.page,
      updateState: provider.updateState,
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
  String? get name => r'getOrdersBuysProvider';
}

/// See also [getOrdersBuys].
class GetOrdersBuysProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [getOrdersBuys].
  GetOrdersBuysProvider(
    BuildContext context, {
    String? fechainicio,
    String? fechafin,
    String? estado,
    int page = 1,
    required bool updateState,
  }) : this._internal(
          (ref) => getOrdersBuys(
            ref as GetOrdersBuysRef,
            context,
            fechainicio: fechainicio,
            fechafin: fechafin,
            estado: estado,
            page: page,
            updateState: updateState,
          ),
          from: getOrdersBuysProvider,
          name: r'getOrdersBuysProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getOrdersBuysHash,
          dependencies: GetOrdersBuysFamily._dependencies,
          allTransitiveDependencies:
              GetOrdersBuysFamily._allTransitiveDependencies,
          context: context,
          fechainicio: fechainicio,
          fechafin: fechafin,
          estado: estado,
          page: page,
          updateState: updateState,
        );

  GetOrdersBuysProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.context,
    required this.fechainicio,
    required this.fechafin,
    required this.estado,
    required this.page,
    required this.updateState,
  }) : super.internal();

  final BuildContext context;
  final String? fechainicio;
  final String? fechafin;
  final String? estado;
  final int page;
  final bool updateState;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(GetOrdersBuysRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetOrdersBuysProvider._internal(
        (ref) => create(ref as GetOrdersBuysRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        context: context,
        fechainicio: fechainicio,
        fechafin: fechafin,
        estado: estado,
        page: page,
        updateState: updateState,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _GetOrdersBuysProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetOrdersBuysProvider &&
        other.context == context &&
        other.fechainicio == fechainicio &&
        other.fechafin == fechafin &&
        other.estado == estado &&
        other.page == page &&
        other.updateState == updateState;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);
    hash = _SystemHash.combine(hash, fechainicio.hashCode);
    hash = _SystemHash.combine(hash, fechafin.hashCode);
    hash = _SystemHash.combine(hash, estado.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);
    hash = _SystemHash.combine(hash, updateState.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetOrdersBuysRef on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `context` of this provider.
  BuildContext get context;

  /// The parameter `fechainicio` of this provider.
  String? get fechainicio;

  /// The parameter `fechafin` of this provider.
  String? get fechafin;

  /// The parameter `estado` of this provider.
  String? get estado;

  /// The parameter `page` of this provider.
  int get page;

  /// The parameter `updateState` of this provider.
  bool get updateState;
}

class _GetOrdersBuysProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with GetOrdersBuysRef {
  _GetOrdersBuysProviderElement(super.provider);

  @override
  BuildContext get context => (origin as GetOrdersBuysProvider).context;
  @override
  String? get fechainicio => (origin as GetOrdersBuysProvider).fechainicio;
  @override
  String? get fechafin => (origin as GetOrdersBuysProvider).fechafin;
  @override
  String? get estado => (origin as GetOrdersBuysProvider).estado;
  @override
  int get page => (origin as GetOrdersBuysProvider).page;
  @override
  bool get updateState => (origin as GetOrdersBuysProvider).updateState;
}

String _$pageQueryOrdersBuysHash() =>
    r'0dcc71bb9ecf1287c22303d1b81fb97310df8edb';

/// See also [PageQueryOrdersBuys].
@ProviderFor(PageQueryOrdersBuys)
final pageQueryOrdersBuysProvider =
    AutoDisposeNotifierProvider<PageQueryOrdersBuys, int>.internal(
  PageQueryOrdersBuys.new,
  name: r'pageQueryOrdersBuysProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pageQueryOrdersBuysHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PageQueryOrdersBuys = AutoDisposeNotifier<int>;
String _$updateStateHash() => r'0ad64c733cf526e48136140877424b261ed4af3a';

/// See also [UpdateState].
@ProviderFor(UpdateState)
final updateStateProvider =
    AutoDisposeNotifierProvider<UpdateState, bool>.internal(
  UpdateState.new,
  name: r'updateStateProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$updateStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UpdateState = AutoDisposeNotifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
