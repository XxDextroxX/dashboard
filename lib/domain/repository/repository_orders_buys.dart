abstract class RepositoryOrdersBuys {
  Future<Map<String, dynamic>> getDataOrdersBuys(String token,
      {String? fechainicio, String? fechafin, String? estado, int page = 1});
  Future<Map<String, dynamic>> approveOrders(String token,
      {required String ordencompraxs, required String centrocosto});
}
