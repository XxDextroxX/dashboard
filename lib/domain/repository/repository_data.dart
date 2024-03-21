abstract class RepositoryData {
  Future<Map<String, dynamic>> getListCenterCosts(String token);
  Future<Map<String, dynamic>> getDataToAdmin(String token,
      {String year = '', String month = '', bool isAdmin = true});
  Future<Map<String, dynamic>> getDataToAdminExpanded(String token,
      {String year = '', String month = ''});
  Future<Map<String, dynamic>> getDatilsAccount(String token,
      {String id = '', String year = '', String month = '', int page = 1});
  Future<Map<String, dynamic>> callGetDatilsMovements(String token,
      {String id = '', String year = ''});
}
