import 'package:dashboard_app/domain/domain.dart';

class RepositoryDataI extends RepositoryData {
  final DatasourceData datasource;
  RepositoryDataI({required this.datasource});
  @override
  Future<Map<String, dynamic>> getListCenterCosts(String token) async {
    return await datasource.getListCenterCosts(token);
  }

  @override
  Future<Map<String, dynamic>> getDataToAdmin(String token,
      {String year = '', String month = '', bool isAdmin = true}) async {
    return await datasource.getDataToAdmin(token,
        year: year, month: month, isAdmin: isAdmin);
  }

  @override
  Future<Map<String, dynamic>> getDataToAdminExpanded(String token,
      {String year = '', String month = ''}) async {
    return await datasource.getDataToAdminExpanded(token,
        year: year, month: month);
  }

  @override
  Future<Map<String, dynamic>> getDatilsAccount(String token,
      {String id = '',
      String year = '',
      String month = '',
      int page = 1}) async {
    return await datasource.getDatilsAccount(token,
        id: id, year: year, month: month, page: page);
  }

  @override
  Future<Map<String, dynamic>> callGetDatilsMovements(String token,
      {String id = '', String year = ''}) async {
    return await datasource.callGetDatilsMovements(token, id: id, year: year);
  }
}
