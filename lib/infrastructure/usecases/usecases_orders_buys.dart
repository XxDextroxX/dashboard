import 'package:dashboard_app/domain/domain.dart';

class UseCaseOrdersBuys {
  final RepositoryOrdersBuys repository;

  UseCaseOrdersBuys({required this.repository});

  Future<Map<String, dynamic>> callGetDataOrdersBuys(String token,
      {String? fechainicio,
      String? fechafin,
      String? estado,
      int page = 1}) async {
    return await repository.getDataOrdersBuys(token,
        fechainicio: fechainicio,
        fechafin: fechafin,
        estado: estado,
        page: page);
  }

  Future<Map<String, dynamic>> callApproveOrders(String token,
      {required String ordencompraxs, required String centrocosto}) async {
    return await repository.approveOrders(token,
        ordencompraxs: ordencompraxs, centrocosto: centrocosto);
  }
}
