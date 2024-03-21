import 'package:dashboard_app/domain/domain.dart';
import 'package:dashboard_app/infrastructure/models/users_model.dart';

class RepositoryAuthI extends RepositoryAuth {
  final DatasourceAuth datasource;
  RepositoryAuthI({required this.datasource});
  @override
  Future<Map<String, dynamic>> adminUser(String email, String token,
      {bool active = true}) async {
    return await datasource.adminUser(email, token, active: active);
  }

  @override
  Future<Map<String, dynamic>> checkSession(String token) async {
    return await datasource.checkSession(token);
  }

  @override
  Future<Map<String, dynamic>> listUsers(String token) async {
    return await datasource.listUsers(token);
  }

  @override
  Future<Map<String, dynamic>> login(String email, String password) async {
    return await datasource.login(email, password);
  }

  @override
  Future<Map<String, dynamic>> logout(String token) async {
    return await datasource.logout(token);
  }

  @override
  Future<Map<String, dynamic>> recoveryCode(String email, String token) async {
    return await datasource.recoveryCode(email, token);
  }

  @override
  Future<Map<String, dynamic>> recoveryPassword(
      String code, String password, String token) async {
    return await datasource.recoveryPassword(code, password, token);
  }

  @override
  Future<Map<String, dynamic>> registerUser(
      UsersModel model, String token) async {
    return await datasource.registerUser(model, token);
  }

  @override
  Future<Map<String, dynamic>> updateUser(UsersModel model, String token,
      {String? oldPassword, String? password}) async {
    return await datasource.updateUser(model, token,
        oldPassword: oldPassword, password: password);
  }
}
