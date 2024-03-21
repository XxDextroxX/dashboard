import 'package:dashboard_app/domain/domain.dart';
import 'package:dashboard_app/infrastructure/models/models.dart';

class UseCaseAuth {
  final RepositoryAuth repository;

  UseCaseAuth({required this.repository});

  Future<Map<String, dynamic>> callLogin(String email, String password) async {
    return await repository.login(email, password);
  }

  Future<Map<String, dynamic>> callRegister(
      UsersModel model, String token) async {
    return await repository.registerUser(model, token);
  }

  Future<Map<String, dynamic>> callCheckSession(String token) async {
    return await repository.checkSession(token);
  }

  Future<Map<String, dynamic>> callLogout(String token) async {
    return await repository.logout(token);
  }

  Future<Map<String, dynamic>> callUpdateUser(UsersModel model, String token,
      {String? oldPassword, String? password}) async {
    return await repository.updateUser(model, token,
        oldPassword: oldPassword, password: password);
  }

  Future<Map<String, dynamic>> callListUsers(String token) async {
    return await repository.listUsers(token);
  }

  Future<Map<String, dynamic>> callRecoveryCode(
      String email, String token) async {
    return await repository.recoveryCode(email, token);
  }

  Future<Map<String, dynamic>> callRecoveryPassword(
      String code, String password, String token) async {
    return await repository.recoveryPassword(code, password, token);
  }

  Future<Map<String, dynamic>> callAdminUser(String email, String token,
      {bool active = true}) async {
    return await repository.adminUser(
      email,
      token,
      active: active,
    );
  }
}
