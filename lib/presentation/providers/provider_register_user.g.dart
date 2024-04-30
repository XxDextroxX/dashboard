// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider_register_user.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$registerUsersHash() => r'c3489abfd44c1062a4c95a380205424009f69d51';

/// See also [RegisterUsers].
@ProviderFor(RegisterUsers)
final registerUsersProvider =
    AutoDisposeNotifierProvider<RegisterUsers, RegisterUserModel>.internal(
  RegisterUsers.new,
  name: r'registerUsersProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$registerUsersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$RegisterUsers = AutoDisposeNotifier<RegisterUserModel>;
String _$listUsersHash() => r'0992e44a0aa21e524c81fcbca6e5cd56befc593b';

/// See also [ListUsers].
@ProviderFor(ListUsers)
final listUsersProvider =
    AutoDisposeNotifierProvider<ListUsers, List<UsersModel>>.internal(
  ListUsers.new,
  name: r'listUsersProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$listUsersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ListUsers = AutoDisposeNotifier<List<UsersModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
