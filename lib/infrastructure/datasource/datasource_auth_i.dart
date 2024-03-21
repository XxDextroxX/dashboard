import 'package:dashboard_app/config/config.dart';
import 'package:dashboard_app/domain/domain.dart';
import 'package:dashboard_app/infrastructure/models/models.dart';
import 'package:dio/dio.dart';

class DatasourceAuthI implements DatasourceAuth {
  final dio = Dio(
    BaseOptions(
        baseUrl: Environment.apiUrl,
        validateStatus: (status) {
          return status! < 500;
        }),
  );

  @override
  Future<Map<String, dynamic>> checkSession(String token) async {
    try {
      final response = await dio.get('/auth/check-session',
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      final user = UserModel.fromJson(response.data['data'] ?? {});
      return {
        'status': true,
        'user': user,
        'accessToken': response.data['accessToken'],
        'message': 'Sesion activa',
        'code': 200
      };
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return {
          'status': false,
          'message': 'Error de autorizacion',
          'code': 401,
        };
      }
      return {
        'status': false,
        'message': 'Error al iniciar sesion ${e.response?.data['message']}',
        'data': null,
        'code': 500,
        'accessToken': e.response?.data['accessToken'],
      };
    } catch (e) {
      return {
        'status': false,
        'message': 'Error al iniciar sesion ${e.toString()}',
        'data': null,
        'code': 500
      };
    }
  }

  @override
  Future<Map<String, dynamic>> listUsers(String token) async {
    try {
      final response = await dio.get('/auth/users',
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      final data = (response.data['data'] ?? []) as List;
      final users = data
          .map((e) => UsersModel.fromJson(e as Map<String, dynamic>))
          .toList();
      return {
        'status': true,
        'users': users,
        'accessToken': response.data['accessToken'],
        'message': 'Lista de usuarios',
        'code': 200
      };
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return {
          'status': false,
          'message': 'Error de autorizacion',
          'code': 401,
        };
      }
      return {
        'status': false,
        'message': '${e.response?.data['message']}',
        'data': null,
        'code': 500,
        'accessToken': e.response?.data['accessToken'],
      };
    } catch (e) {
      return {
        'status': false,
        'message': e.toString(),
        'data': null,
        'code': 500
      };
    }
  }

  @override
  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await dio
          .post('/auth/login', data: {'email': email, 'password': password});
      final user =
          UserModel.fromJson(response.data['user'] as Map<String, dynamic>);
      return {
        'status': true,
        'user': user,
        'accessToken': response.data['accessToken'],
        'message': 'Sesion iniciada',
        'code': 200
      };
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return {
          'status': false,
          'message': 'Error de autorizacion',
          'code': 401,
        };
      }
      return {
        'status': false,
        'message': 'Error al iniciar sesion ${e.response?.data['message']}',
        'data': null,
        'code': 500
      };
    } catch (e) {
      return {
        'status': false,
        'message': 'Error al iniciar sesion ${e.toString()}',
        'data': null,
        'code': 500
      };
    }
  }

  @override
  Future<Map<String, dynamic>> logout(String token) async {
    try {
      await dio.post('/auth/logout',
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      return {
        'status': true,
        'accessToken': null,
        'message': 'Sesion cerrada',
        'code': 201
      };
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return {
          'status': false,
          'message': 'Error de autorizacion',
          'code': 401,
        };
      }
      return {
        'status': false,
        'message': 'Error al cerrar sesion ${e.response?.data['message']}',
        'data': null,
        'code': 500
      };
    } catch (e) {
      return {
        'status': false,
        'message': 'Error al cerrar sesion ${e.toString()}',
        'data': null,
        'code': 500
      };
    }
  }

  @override
  Future<Map<String, dynamic>> recoveryCode(String email, String token) async {
    try {
      final response = await dio.post(
        '/auth/send-recovery-code/$email',
      );
      final message = response.data['message'][0];
      return {
        'status': true,
        'accessToken': null,
        'message': message,
        'code': 201
      };
    } on DioException catch (e) {
      print('error ${e.response?.data['message']}');
      if (e.response?.statusCode == 401) {
        return {
          'status': false,
          'message': 'Error de autorizacion',
          'code': 401,
        };
      }
      return {
        'status': false,
        'message': 'Error al enviar codigo ${e.response?.data['message']}',
        'data': null,
        'code': 500
      };
    } catch (e) {
      print('error ${e.toString()}');
      return {
        'status': false,
        'message': 'Error al enviar codigo ${e.toString()}',
        'data': null,
        'code': 500
      };
    }
  }

  @override
  Future<Map<String, dynamic>> recoveryPassword(
      String code, String password, String token) async {
    try {
      final response = await dio.post('/auth/recovery-password', data: {
        'recoveryCode': code,
        'newPassword': password,
      });
      final message = response.data['message'][0];
      return {
        'status': true,
        'accessToken': null,
        'message': message,
        'code': 201
      };
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return {
          'status': false,
          'message': 'Error de autorizacion',
          'code': 401,
        };
      }
      return {
        'status': false,
        'message': '${e.response?.data['message']}',
        'data': null,
        'code': 500
      };
    } catch (e) {
      return {
        'status': false,
        'message': 'Error al enviar codigo ${e.toString()}',
        'data': null,
        'code': 500
      };
    }
  }

  @override
  Future<Map<String, dynamic>> registerUser(
      UsersModel model, String token) async {
    try {
      final response = await dio.post('/auth/register',
          data: {
            'name': model.name,
            'role': model.role,
            'email': model.email,
            'linkedCenterCodemp': model.linkedCenterCodemp,
            'linkedCenterCodcuenta': model.linkedCenterCodcuenta
          },
          options: Options(
            headers: {'Authorization': 'Bearer $token'},
          ));
      String message = '';
      if (response.data['message'] != null) {
        message = response.data['message'][0];
      } else {
        message = response.data['data']['message'][0];
      }
      final accessToken = response.data['accessToken'];
      return {
        'status': true,
        'message': message,
        'accessToken': accessToken,
        'code': 201
      };
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return {
          'status': false,
          'message': 'Error de autorizacion',
          'code': 401,
        };
      }
      return {
        'status': false,
        'message': 'Error al crear usuario ${e.response?.data['message']}',
        'data': null,
        'code': 500,
        'accessToken': e.response?.data['accessToken'],
      };
    } catch (e) {
      return {
        'status': false,
        'message': 'Error al crear usuario ${e.toString()}',
        'data': null,
        'code': 500
      };
    }
  }

  @override
  Future<Map<String, dynamic>> updateUser(UsersModel model, String token,
      {String? oldPassword, String? password}) async {
    Map<String, dynamic> data = {
      'name': model.name,
      'lastName': model.lastName,
    };
    if (oldPassword != null && password != null) {
      data.addAll({'oldPassword': oldPassword, 'password': password});
    }
    try {
      final response = await dio.patch('/auth/user',
          data: data,
          options: Options(
            headers: {'Authorization': 'Bearer $token'},
          ));
      String message = '';
      if (response.data['error'] != null &&
          response.data['error']["message"] != null) {
        message = response.data["error"]['message'][0];
      } else if (response.data['data'] != null &&
          response.data['data']['message'] != null) {
        message = response.data['data']['message'];
      }
      UserModel? user;
      if (response.data['data'] != null) {
        user = UserModel.fromJson(response.data['data']);
      }
      final accessToken = response.data['accessToken'];
      return {
        'status': true,
        'user': user,
        'message': message,
        'accessToken': accessToken,
        'code': 201
      };
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return {
          'status': false,
          'message': 'Error de autorizacion',
          'code': 401,
        };
      }
      return {
        'status': false,
        'message': '${e.response?.data['message']}',
        'data': null,
        'code': 500,
        'accessToken': e.response?.data['accessToken'],
      };
    } catch (e) {
      return {
        'status': false,
        'message': 'Error al actualizar usuario ${e.toString()}',
        'data': null,
        'code': 500
      };
    }
  }

  @override
  Future<Map<String, dynamic>> adminUser(String email, String token,
      {bool active = true}) async {
    String path = '/auth/activate-user/$email';
    if (!active) {
      path = '/auth/deactivate-user/$email';
    }
    try {
      final response = await dio.post(path,
          options: Options(
            headers: {'Authorization': 'Bearer $token'},
          ));
      final message = response.data['data']['messages'][0];
      final accessToken = response.data['accessToken'];
      return {
        'status': true,
        'message': message,
        'accessToken': accessToken,
        'code': 201
      };
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return {
          'status': false,
          'message': 'Error de autorizacion',
          'code': 401,
        };
      }
      return {
        'status': false,
        'message': '${e.response?.data['message']}',
        'data': null,
        'code': 500,
        'accessToken': e.response?.data['accessToken'],
      };
    } catch (e) {
      return {
        'status': false,
        'message': 'Error al actualizar usuario ${e.toString()}',
        'data': null,
        'code': 500
      };
    }
  }
}
