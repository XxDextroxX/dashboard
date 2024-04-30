import 'package:dashboard_app/config/config.dart';
import 'package:dashboard_app/domain/domain.dart';
import 'package:dashboard_app/infrastructure/models/order_buys_model.dart';
import 'package:dio/dio.dart';

class DatasourceOrdersBuysI implements DatasourceOrdersBuys {
  final dio = Dio(
    BaseOptions(
      baseUrl: Environment.apiUrl,
      // validateStatus: (status) {
      //   return status! < 500;
      // }
    ),
  );

  @override
  Future<Map<String, dynamic>> getDataOrdersBuys(String token,
      {String? fechainicio,
      String? fechafin,
      String? estado,
      int page = 1}) async {
    bool filterByRange = fechainicio != null && fechafin != null;
    bool filterByState = estado != null;
    String path = '/ordenes-de-compras?page=$page';
    if (filterByRange) {
      path += '&fechainicio=$fechainicio&fechafin=$fechafin';
    }
    if (filterByState) {
      path += '&estado=$estado';
    }
    try {
      final response = await dio.get(path,
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      // print('response:11 ${response}');
      final data = (response.data['data'] ?? []) as List;
      final orders = data.map((e) => OrdersBuys.fromJson(e)).toList();
      return {
        'status': true,
        'orders': orders,
        'accessToken': response.data['accessToken'],
        'message': 'Ordenes de compras cargadas',
        'code': 200
      };
    } on DioException catch (e) {
      print('e.response: ${e.response}');
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
      print('e: $e');
      return {
        'status': false,
        'message': e.toString(),
        'data': null,
        'code': 500
      };
    }
  }

  @override
  Future<Map<String, dynamic>> approveOrders(String token,
      {required String ordencompraxs, required String centrocosto}) async {
    try {
      final response = await dio.patch(
          '/ordenes-de-compras/approve/$ordencompraxs/$centrocosto',
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      return {
        'status': true,
        'accessToken': response.data['accessToken'],
        'message': 'Ordene de compra aprobada',
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
