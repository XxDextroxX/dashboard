import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:dashboard_app/config/config.dart';
import 'package:dashboard_app/domain/domain.dart';
import 'package:dashboard_app/infrastructure/infrastructure.dart';
import 'package:dashboard_app/infrastructure/models/models.dart';
import 'package:dashboard_app/infrastructure/usecases/usecases.dart';
import 'package:dashboard_app/shared/utils/utils.dart';
import 'package:dashboard_app/shared/validator/validator.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider_register.g.dart';

@riverpod
class RegisterUser extends _$RegisterUser {
  @override
  AuthModel build() {
    return AuthModel();
  }

  void setName(String name) {
    state = state.copyWith(
      name: NameUser.dirty(name),
    );
    state = state.copyWith(
      isValidFormLogin: Formz.validate([state.email, state.password]),
    );
    state = state.copyWith(
      isValidFormRegister: Formz.validate(
          [state.name, state.email, state.password, state.confirmPassword]),
    );
  }

  void setEmail(String email) {
    state = state.copyWith(
      email: Email.dirty(email),
    );
    state = state.copyWith(
      isValidFormLogin: Formz.validate([state.email, state.password]),
    );
    state = state.copyWith(
      isValidFormRegister: Formz.validate(
          [state.name, state.email, state.password, state.confirmPassword]),
    );
  }

  void setPassword(String password) {
    state = state.copyWith(
      password: Password.dirty(password),
    );
    state = state.copyWith(
      isValidFormLogin: Formz.validate([state.email, state.password]),
    );
    state = state.copyWith(
      isValidFormRegister: Formz.validate(
          [state.name, state.email, state.password, state.confirmPassword]),
    );
  }

  void setConfirmPassword(String confirmPassword) {
    state = state.copyWith(
      confirmPassword: Password.dirty(confirmPassword),
    );
    state = state.copyWith(
      isValidFormLogin: Formz.validate([state.email, state.password]),
    );
    state = state.copyWith(
      isValidFormRegister: Formz.validate(
          [state.name, state.email, state.password, state.confirmPassword]),
    );
  }

  void reset() {
    state = AuthModel();
  }

  Future<void> login(BuildContext context) async {
    if (!state.isValidFormLogin) {
      AnimatedSnackBar.material('Formulario no válido',
              type: AnimatedSnackBarType.error,
              mobileSnackBarPosition: MobileSnackBarPosition.bottom)
          .show(context);
      return;
    }
    final RepositoryAuth respository =
        RepositoryAuthI(datasource: DatasourceAuthI());
    final useCaseAuth = UseCaseAuth(repository: respository);
    final response =
        await useCaseAuth.callLogin(state.email.value, state.password.value);
    final isValidResponse =
        // ignore: use_build_context_synchronously
        await GeneralUtils.validateResponse(response, context);
    if (isValidResponse) {
      final userModel = UserModel.instance();
      final user = response['user'];
      userModel.setData(user);
      // ignore: use_build_context_synchronously
      AnimatedSnackBar.material('Login exitoso',
              type: AnimatedSnackBarType.success,
              mobileSnackBarPosition: MobileSnackBarPosition.bottom)
          // ignore: use_build_context_synchronously
          .show(context);
      // ignore: use_build_context_synchronously
      getRoute(userModel.role ?? '', context);
    } else {
      // ignore: use_build_context_synchronously
      AnimatedSnackBar.material('Credenciales incorrectas',
              type: AnimatedSnackBarType.error,
              mobileSnackBarPosition: MobileSnackBarPosition.bottom)
          // ignore: use_build_context_synchronously
          .show(context);
    }
  }

  Future<void> checkStatus(BuildContext context) async {
    final RepositoryAuth respository =
        RepositoryAuthI(datasource: DatasourceAuthI());
    final useCaseAuth = UseCaseAuth(repository: respository);
    final token = await GeneralUtils.getToken();
    final response = await useCaseAuth.callCheckSession(token ?? '');
    final isValidResponse =
        // ignore: use_build_context_synchronously
        await GeneralUtils.validateResponse(response, context);
    if (isValidResponse) {
      final userModel = UserModel.instance();
      final user = response['user'];
      userModel.setData(user);
      // ignore: use_build_context_synchronously
      getRoute(userModel.role ?? '', context);
    } else {
      // ignore: use_build_context_synchronously
      context.go(PathRouter.login);
    }
  }

  void getRoute(String role, BuildContext context) {
    switch (role) {
      case 'admin':
        context.go(PathRouter.home);
        break;
      case 'supervisor':
        context.go(PathRouter.home);
        break;
      case 'root':
        context.go(PathRouter.adminUsers);
        break;
      default:
        context.go(PathRouter.login);
        break;
    }
  }

  Future<void> updateUser(UsersModel model, BuildContext context,
      ChangeNewPassword changePasswordIntance,
      {String? oldPassword, String? password}) async {
    final RepositoryAuth respository =
        RepositoryAuthI(datasource: DatasourceAuthI());
    final useCaseAuth = UseCaseAuth(repository: respository);
    final token = await GeneralUtils.getToken();
    final response = await useCaseAuth.callUpdateUser(model, token ?? '',
        oldPassword: oldPassword, password: password);
    final isValidResponse =
        // ignore: use_build_context_synchronously
        await GeneralUtils.validateResponse(response, context);
    if (isValidResponse) {
      // ignore: use_build_context_synchronously

      if (response['user'] != null) {
        changePasswordIntance.reset();
        final userModel = UserModel.instance();
        userModel.name = model.name;
        userModel.lastName = model.lastName;
      }
      // ignore: use_build_context_synchronously
      AnimatedSnackBar.material(
              response['user'] != null
                  ? 'Actualizado'
                  : response['message'] ?? 'Actualizado',
              type: response['user'] != null
                  ? AnimatedSnackBarType.success
                  : AnimatedSnackBarType.error,
              mobileSnackBarPosition: MobileSnackBarPosition.bottom)
          .show(context);
    } else {
      // ignore: use_build_context_synchronously
      AnimatedSnackBar.material(response['message'] ?? 'Error',
              type: AnimatedSnackBarType.error,
              mobileSnackBarPosition: MobileSnackBarPosition.bottom)
          .show(context);
    }
  }
}

@riverpod
class ValidatePasswordRecovery extends _$ValidatePasswordRecovery {
  bool isValid = false;
  @override
  Email build() {
    return const Email.pure();
  }

  void setEmail(String email) {
    state = Email.dirty(email);
    isValid = Formz.validate([state]);
  }

  Future<void> getCode(
    BuildContext context,
  ) async {
    if (!isValid) {
      AnimatedSnackBar.material('Email no válido',
              type: AnimatedSnackBarType.error,
              mobileSnackBarPosition: MobileSnackBarPosition.bottom)
          .show(context);
      return;
    }
    final RepositoryAuth respository =
        RepositoryAuthI(datasource: DatasourceAuthI());
    final useCaseAuth = UseCaseAuth(repository: respository);
    final token = await GeneralUtils.getToken();
    final response =
        await useCaseAuth.callRecoveryCode(state.value, token ?? '');
    if (response['status']) {
      reset();
      // ignore: use_build_context_synchronously
      AnimatedSnackBar.material(response['message'] ?? 'Codigo enviado',
              type: AnimatedSnackBarType.success,
              mobileSnackBarPosition: MobileSnackBarPosition.bottom)
          .show(context);
      // ignore: use_build_context_synchronously
      context.push(PathRouter.resetPassword);
    } else {
      // ignore: use_build_context_synchronously
      AnimatedSnackBar.material(response['message'] ?? 'Error',
              type: AnimatedSnackBarType.error,
              mobileSnackBarPosition: MobileSnackBarPosition.bottom)
          .show(context);
    }
  }

  void reset() {
    state = const Email.pure();
    isValid = false;
  }
}

@riverpod
class ResetPassword extends _$ResetPassword {
  bool isValid = false;
  @override
  ResetPasswordModel build() {
    return ResetPasswordModel();
  }

  void setCode(String code) {
    state = state.copyWith(
      code: GeneralField.dirty(code),
    );
    isValid =
        Formz.validate([state.code, state.password, state.confirmPassword]);
  }

  void setPassword(String password) {
    state = state.copyWith(
      password: Password.dirty(password),
    );
    isValid =
        Formz.validate([state.code, state.password, state.confirmPassword]);
  }

  void setConfirmPassword(String confirmPassword) {
    state = state.copyWith(
      confirmPassword: Password.dirty(confirmPassword),
    );
    isValid =
        Formz.validate([state.code, state.password, state.confirmPassword]);
  }

  void reset() {
    state = ResetPasswordModel();
    isValid = false;
  }

  Future<void> resetPassword(BuildContext context) async {
    if (!isValid) {
      AnimatedSnackBar.material('Todos los campos son requeridos',
              type: AnimatedSnackBarType.error,
              mobileSnackBarPosition: MobileSnackBarPosition.bottom)
          .show(context);
      return;
    }
    final RepositoryAuth respository =
        RepositoryAuthI(datasource: DatasourceAuthI());
    final useCaseAuth = UseCaseAuth(repository: respository);
    final token = await GeneralUtils.getToken();
    final response = await useCaseAuth.callRecoveryPassword(
        state.code.value, state.password.value, token ?? '');
    if (response['status']) {
      reset();
      // ignore: use_build_context_synchronously
      AnimatedSnackBar.material(response['message'] ?? 'Cambio exitoso',
              type: AnimatedSnackBarType.success,
              mobileSnackBarPosition: MobileSnackBarPosition.bottom)
          .show(context);
      // ignore: use_build_context_synchronously
      context.push(PathRouter.login);
    } else {
      // ignore: use_build_context_synchronously
      AnimatedSnackBar.material(response['message'] ?? 'Error',
              type: AnimatedSnackBarType.error,
              mobileSnackBarPosition: MobileSnackBarPosition.bottom)
          .show(context);
    }
  }
}

@riverpod
class ChangeNewPassword extends _$ChangeNewPassword {
  bool isValid = false;
  @override
  ChangePassword build() {
    return ChangePassword();
  }

  void setOldPassword(String oldPassword) {
    state = state.copyWith(
      oldPassword: Password.dirty(oldPassword),
    );
    isValid = Formz.validate([state.password ?? const Password.pure()]);
  }

  void setPassword(String password) {
    state = state.copyWith(
      password: Password.dirty(password),
    );
    isValid = Formz.validate([state.password ?? const Password.pure()]);
  }

  void reset() {
    state = ChangePassword();
  }
}
