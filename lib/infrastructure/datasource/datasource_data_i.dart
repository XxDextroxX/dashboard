import 'package:dashboard_app/config/config.dart';
import 'package:dashboard_app/domain/domain.dart';
import 'package:dashboard_app/infrastructure/models/models.dart';
import 'package:dio/dio.dart';

class DatasourceDataI implements DatasourceData {
  final dio = Dio(
    BaseOptions(
      baseUrl: Environment.apiUrl,
      // validateStatus: (status) {
      //   return status! < 500;
      // }
    ),
  );

  @override
  Future<Map<String, dynamic>> getDataToAdmin(String token,
      {String year = '', String month = '', bool isAdmin = true}) async {
    String path = '/centrocosto/by-period?year=$year&month=$month';
    if (!isAdmin) {
      path = '/centrocosto/cc-by-period?year=$year';
    }
    try {
      final response = await dio.get(path,
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      print('response: ${response}');
      final data = (response.data['data']) as Map<String, dynamic>;
      return {
        'status': true,
        'data': data,
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
  Future<Map<String, dynamic>> getDataToAdminExpanded(String token,
      {String year = '', String month = ''}) async {
    String path = '/centrocosto/by-period-expanded?year=$year&month=$month';
    try {
      final response = await dio.get(path,
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      final data = (response.data['data']) as Map<String, dynamic>;
      return {
        'status': true,
        'data': data,
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
  Future<Map<String, dynamic>> getListCenterCosts(String token) async {
    try {
      final response = await dio.get('/centrocosto',
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      final data = (response.data['data'] ?? []) as List;
      final centers = data.map((e) {
        return CenterCosts.fromJson(e as Map<String, dynamic>);
      }).toList();
      return {
        'status': true,
        'centers': centers,
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
  Future<Map<String, dynamic>> getDatilsAccount(String token,
      {String id = '',
      String year = '',
      String month = '',
      int page = 1}) async {
    String path =
        '/centrocosto/detalle-movimientos/$id?year=$year&month=$month&page=$page';
    try {
      final response = await dio.get(path,
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      final data = (response.data['data'] ?? []) as List;
      final details = data.map((e) {
        return DetailsAccounts.fromJson(e as Map<String, dynamic>);
      }).toList();
      return {
        'status': true,
        'data': details,
        'accessToken': response.data['accessToken'],
        'message': 'Datos encontrados',
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
  Future<Map<String, dynamic>> callGetDatilsMovements(String token,
      {String id = '', String year = ''}) async {
    try {
      final response = await dio.get(
          '/centrocosto/detalle-movimientos-global/$id?year=$year',
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      final data = (response.data['data']) as Map<String, dynamic>;
      return {
        'status': true,
        'data': data,
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
  Future<Map<String, dynamic>> getAccountLevel5(String token,
      {required id, required String year, required String month}) async {
    try {
      final response = await dio.get(
          '/centrocosto/level-5-accounts/$id?year=$year&month=$month',
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      final data = (response.data['data']) as List;
      final accounts = data.map((e) => ModelAccounts.fromJson(e)).toList();
      return {
        'status': true,
        'data': accounts,
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
}
