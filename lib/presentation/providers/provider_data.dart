import 'package:dashboard_app/domain/domain.dart';
import 'package:dashboard_app/infrastructure/infrastructure.dart';
import 'package:dashboard_app/infrastructure/usecases/usecases.dart';
import 'package:dashboard_app/shared/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider_data.g.dart';

@Riverpod(keepAlive: true)
Future<Map<String, dynamic>> listCenterCosts(
    ListCenterCostsRef ref, BuildContext context) async {
  final RepositoryData repository =
      RepositoryDataI(datasource: DatasourceDataI());
  final useCase = UseCaseData(repository: repository);
  final token = await GeneralUtils.getToken();
  final response = await useCase.callGetListCenterCosts(token ?? '');
  // ignore: use_build_context_synchronously
  GeneralUtils.validateResponse(response, context);
  return response;
}

@riverpod
Future<Map<String, dynamic>> getDataToAdmin(
    GetDataToAdminRef ref, BuildContext context,
    {String year = '',
    String month = '',
    bool isAdmin = true,
    bool isDataExpanded = false}) async {
  final RepositoryData repository =
      RepositoryDataI(datasource: DatasourceDataI());
  final useCase = UseCaseData(repository: repository);
  final token = await GeneralUtils.getToken();
  Map<String, dynamic> response;
  if (isDataExpanded) {
    response = await useCase.callGetDataToAdminExpanded(
      token ?? '',
      year: year,
      month: month,
    );
  } else {
    response = await useCase.callGetDataToAdmin(token ?? '',
        year: year, month: month, isAdmin: isAdmin);
  }
  // ignore: use_build_context_synchronously
  GeneralUtils.validateResponse(response, context);
  return response;
}

@riverpod
Future<Map<String, dynamic>> getDetailsMovements(
    GetDetailsMovementsRef ref, BuildContext context,
    {String id = '', String year = ''}) async {
  final RepositoryData repository =
      RepositoryDataI(datasource: DatasourceDataI());
  final useCase = UseCaseData(repository: repository);
  final token = await GeneralUtils.getToken();
  final response = await useCase.callGetDatilsMovements(
    token ?? '',
    id: id,
    year: year,
  );
  // ignore: use_build_context_synchronously
  GeneralUtils.validateResponse(response, context);
  return response;
}

@riverpod
class IsDataExpanded extends _$IsDataExpanded {
  @override
  bool build() {
    return false;
  }

  void changeValue(bool value) {
    state = value;
  }
}

@riverpod
class TotalExpenses extends _$TotalExpenses {
  @override
  int build() {
    return 0;
  }

  void changeValue(int value) {
    state = value;
  }
}

@riverpod
class Presupuesto extends _$Presupuesto {
  @override
  int build() {
    return 0;
  }

  void changeValue(int value) {
    state = value;
  }
}

@riverpod
class CenterCost extends _$CenterCost {
  String centerCost = 'Selecione un centro de costo';
  @override
  String build() {
    return centerCost;
  }

  void changeValue(String value) {
    state = value;
  }

  void reset() {
    state = 'Selecione un centro de costo';
  }
}

@riverpod
class Counts extends _$Counts {
  Map<String, dynamic> data = {};
  Map<String, dynamic> originalData = {};
  @override
  Map<String, dynamic> build() {
    return data;
  }

  void changeValue(Map<String, dynamic> value) {
    state = value;
    originalData = Map<String, dynamic>.from(value);
  }

  void reset() {
    state = {};
    originalData = {};
  }

  void filter(String query) {
    if (query.isEmpty) {
      // Si la consulta está vacía, retorna todos los datos
      state = Map<String, dynamic>.from(originalData);
    } else {
      // Si la consulta no está vacía, filtra los datos
      state = {};
      originalData.entries
          .where(
              (entry) => entry.key.toLowerCase().contains(query.toLowerCase()))
          .forEach((entry) {
        state[entry.key] = entry.value;
      });
    }
  }
}

@riverpod
Future<Map<String, dynamic>> getDetailsAccount(
    GetDetailsAccountRef ref, BuildContext context,
    {String id = '', String year = '', String month = '', int page = 1}) async {
  final RepositoryData repository =
      RepositoryDataI(datasource: DatasourceDataI());
  final useCase = UseCaseData(repository: repository);
  final token = await GeneralUtils.getToken();
  final response = await useCase.callGetDatilsAccount(token ?? '',
      id: id, year: year, month: month, page: page);
  // ignore: use_build_context_synchronously
  GeneralUtils.validateResponse(response, context);
  return response;
}

@Riverpod(keepAlive: true)
class GetIndexToDetails extends _$GetIndexToDetails {
  @override
  int build() {
    return 1;
  }

  void changeValue(int value) {
    state = value;
  }

  void increment() {
    state++;
  }

  void reset() {
    state = 1;
  }
}
