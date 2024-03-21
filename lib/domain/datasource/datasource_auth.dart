import 'package:dashboard_app/infrastructure/models/models.dart';

abstract class DatasourceAuth {
  Future<Map<String, dynamic>> login(String email, String password);
  Future<Map<String, dynamic>> registerUser(UsersModel model, String token);
  Future<Map<String, dynamic>> checkSession(String token);
  Future<Map<String, dynamic>> logout(String token);
  Future<Map<String, dynamic>> updateUser(UsersModel model, String token,
      {String? oldPassword, String? password});
  Future<Map<String, dynamic>> listUsers(String token);
  Future<Map<String, dynamic>> recoveryCode(String email, String token);
  Future<Map<String, dynamic>> recoveryPassword(
      String code, String password, String token);
  Future<Map<String, dynamic>> adminUser(String email, String token,
      {bool active = true});
}
