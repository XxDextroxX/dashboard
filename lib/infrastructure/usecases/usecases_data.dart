import 'package:dashboard_app/domain/domain.dart';

class UseCaseData {
  final RepositoryData repository;

  UseCaseData({required this.repository});

  Future<Map<String, dynamic>> callGetListCenterCosts(String token) async {
    return await repository.getListCenterCosts(token);
  }

  Future<Map<String, dynamic>> callGetDataToAdmin(String token,
      {String year = '', String month = '', bool isAdmin = true}) async {
    return await repository.getDataToAdmin(token,
        year: year, month: month, isAdmin: isAdmin);
  }

  Future<Map<String, dynamic>> callGetDataToAdminExpanded(String token,
      {String year = '', String month = ''}) async {
    return await repository.getDataToAdminExpanded(token,
        year: year, month: month);
  }

  Future<Map<String, dynamic>> callGetDatilsAccount(String token,
      {String id = '',
      String year = '',
      String month = '',
      int page = 1}) async {
    return await repository.getDatilsAccount(token,
        id: id, year: year, month: month, page: page);
  }

  Future<Map<String, dynamic>> callGetDatilsMovements(String token,
      {String id = '', String year = ''}) async {
    return await repository.callGetDatilsMovements(token, id: id, year: year);
  }
}
