// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider_register.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$registerUserHash() => r'57dbf69023fbc5fb6cc6a9ba3ba8dcdf36c32ea8';

/// See also [RegisterUser].
@ProviderFor(RegisterUser)
final registerUserProvider =
    AutoDisposeNotifierProvider<RegisterUser, AuthModel>.internal(
  RegisterUser.new,
  name: r'registerUserProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$registerUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$RegisterUser = AutoDisposeNotifier<AuthModel>;
String _$validatePasswordRecoveryHash() =>
    r'64168cf13008886e071f6b437eb3d21ffb03fa0a';

/// See also [ValidatePasswordRecovery].
@ProviderFor(ValidatePasswordRecovery)
final validatePasswordRecoveryProvider =
    AutoDisposeNotifierProvider<ValidatePasswordRecovery, Email>.internal(
  ValidatePasswordRecovery.new,
  name: r'validatePasswordRecoveryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$validatePasswordRecoveryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ValidatePasswordRecovery = AutoDisposeNotifier<Email>;
String _$resetPasswordHash() => r'd6efb6ade78dfb8af7e23ceb9355bf407afb8c10';

/// See also [ResetPassword].
@ProviderFor(ResetPassword)
final resetPasswordProvider =
    AutoDisposeNotifierProvider<ResetPassword, ResetPasswordModel>.internal(
  ResetPassword.new,
  name: r'resetPasswordProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$resetPasswordHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ResetPassword = AutoDisposeNotifier<ResetPasswordModel>;
String _$changeNewPasswordHash() => r'eaf8a0a28ce2c9c0ca4ad39d956b08bfa1c6a912';

/// See also [ChangeNewPassword].
@ProviderFor(ChangeNewPassword)
final changeNewPasswordProvider =
    AutoDisposeNotifierProvider<ChangeNewPassword, ChangePassword>.internal(
  ChangeNewPassword.new,
  name: r'changeNewPasswordProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$changeNewPasswordHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ChangeNewPassword = AutoDisposeNotifier<ChangePassword>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
