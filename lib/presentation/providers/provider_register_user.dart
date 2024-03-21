import 'package:animated_snack_bar/animated_snack_bar.dart';
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

part 'provider_register_user.g.dart';

@riverpod
class RegisterUsers extends _$RegisterUsers {
  bool isValidForm = false;
  @override
  RegisterUserModel build() {
    return RegisterUserModel();
  }

  void changeName(String name) {
    state = state.copyWith(name: GeneralField.dirty(name));
    isValidForm = Formz.validate([
      state.name,
      state.email,
      state.role,
      // state.linkedCenterCodcuenta,
      // state.linkedCenterCodemp
    ]);
  }

  void changeEmail(String email) {
    state = state.copyWith(email: Email.dirty(email));
    isValidForm = Formz.validate([
      state.name,
      state.email,
      state.role,
      // state.linkedCenterCodcuenta,
      // state.linkedCenterCodemp
    ]);
  }

  void changeRole(String role) {
    state = state.copyWith(role: GeneralField.dirty(role));
    isValidForm = Formz.validate([
      state.name,
      state.email,
      state.role,
      // state.linkedCenterCodcuenta,
      // state.linkedCenterCodemp
    ]);
  }

  void changeLinkedCenterCodcuenta(String linkedCenterCodcuenta) {
    state = state.copyWith(
        linkedCenterCodcuenta: GeneralField.dirty(linkedCenterCodcuenta));
    isValidForm = Formz.validate([
      state.name,
      state.email,
      state.role,
      // state.linkedCenterCodcuenta,
      // state.linkedCenterCodemp
    ]);
  }

  void changeLinkedCenterCodemp(String linkedCenterCodemp) {
    state = state.copyWith(
        linkedCenterCodemp: GeneralField.dirty(linkedCenterCodemp));
    isValidForm = Formz.validate([
      state.name,
      state.email,
      state.role,
      // state.linkedCenterCodcuenta,
      // state.linkedCenterCodemp
    ]);
  }

  Future<bool> createUser(BuildContext context, {bool isAdmin = false}) async {
    if (!isValidForm || state.role.value.isEmpty) {
      // ignore: use_build_context_synchronously
      AnimatedSnackBar.material('Formulario no valido',
              type: AnimatedSnackBarType.error,
              mobileSnackBarPosition: MobileSnackBarPosition.bottom)
          .show(context);
      return false;
    }
    if (!isAdmin) {
      if (state.linkedCenterCodcuenta.value.isEmpty ||
          state.linkedCenterCodemp.value.isEmpty) {
        // ignore: use_build_context_synchronously
        AnimatedSnackBar.material('Seleccionar centro de costos',
                type: AnimatedSnackBarType.error,
                mobileSnackBarPosition: MobileSnackBarPosition.bottom)
            .show(context);
        return false;
      }
    }
    final RepositoryAuth respository =
        RepositoryAuthI(datasource: DatasourceAuthI());
    final useCaseAuth = UseCaseAuth(repository: respository);
    final token = await GeneralUtils.getToken();
    final model = UsersModel(
      email: state.email.value,
      name: state.name.value,
      role: state.role.value,
      linkedCenterCodcuenta: state.linkedCenterCodcuenta.value,
      linkedCenterCodemp: state.linkedCenterCodemp.value,
      isAdmin: isAdmin,
    );
    final response = await useCaseAuth.callRegister(model, token ?? '');
    final isValidResponse =
        // ignore: use_build_context_synchronously
        await GeneralUtils.validateResponse(response, context);
    if (isValidResponse) {
      reset();
      // ignore: use_build_context_synchronously
      context.pop();
      // ignore: use_build_context_synchronously
      AnimatedSnackBar.material('Usuario creado',
              type: AnimatedSnackBarType.success,
              mobileSnackBarPosition: MobileSnackBarPosition.bottom)
          .show(context);
      return true;
    } else {
      // ignore: use_build_context_synchronously
      AnimatedSnackBar.material(response['message'] ?? 'Error',
              type: AnimatedSnackBarType.error,
              mobileSnackBarPosition: MobileSnackBarPosition.bottom)
          .show(context);
      return false;
    }
  }

  void reset() {
    state = RegisterUserModel();
    isValidForm = false;
  }
}

@riverpod
class ListUsers extends _$ListUsers {
  List<UsersModel> usersList = [];

  @override
  List<UsersModel> build() {
    return usersList;
  }

  Future<void> setUsersList(BuildContext context) async {
    final RepositoryAuth respository =
        RepositoryAuthI(datasource: DatasourceAuthI());
    final useCaseAuth = UseCaseAuth(repository: respository);
    final token = await GeneralUtils.getToken();
    final response = await useCaseAuth.callListUsers(token ?? '');
    final isValidResponse =
        // ignore: use_build_context_synchronously
        await GeneralUtils.validateResponse(response, context);
    if (isValidResponse) {
      state = [];
      state = response['users'];
    }
  }

  Future<bool> adminUser(
      String email, bool isActive, BuildContext context) async {
    final RepositoryAuth respository =
        RepositoryAuthI(datasource: DatasourceAuthI());
    final useCaseAuth = UseCaseAuth(repository: respository);
    final token = await GeneralUtils.getToken();
    final response =
        await useCaseAuth.callAdminUser(email, token ?? '', active: isActive);
    final isValidResponse =
        // ignore: use_build_context_synchronously
        await GeneralUtils.validateResponse(response, context);
    if (isValidResponse) {
      // ignore: use_build_context_synchronously
      AnimatedSnackBar.material('Cambio exitoso',
              type: AnimatedSnackBarType.success,
              mobileSnackBarPosition: MobileSnackBarPosition.bottom)
          .show(context);
      return true;
    } else {
      // ignore: use_build_context_synchronously
      AnimatedSnackBar.material('Error al cambiar',
              type: AnimatedSnackBarType.success,
              mobileSnackBarPosition: MobileSnackBarPosition.bottom)
          .show(context);
      return false;
    }
  }
}
