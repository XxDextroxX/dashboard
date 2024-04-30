import 'package:dashboard_app/domain/domain.dart';

class RepositoryOrdersBuysI extends RepositoryOrdersBuys {
  final DatasourceOrdersBuys datasource;

  RepositoryOrdersBuysI({required this.datasource});

  @override
  Future<Map<String, dynamic>> getDataOrdersBuys(String token,
      {String? fechainicio,
      String? fechafin,
      String? estado,
      int page = 1}) async {
    return await datasource.getDataOrdersBuys(token,
        fechainicio: fechainicio,
        fechafin: fechafin,
        estado: estado,
        page: page);
  }

  @override
  Future<Map<String, dynamic>> approveOrders(String token,
      {required String ordencompraxs, required String centrocosto}) async {
    return await datasource.approveOrders(token,
        ordencompraxs: ordencompraxs, centrocosto: centrocosto);
  }
}
