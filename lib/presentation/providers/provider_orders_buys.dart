import 'package:dashboard_app/domain/domain.dart';
import 'package:dashboard_app/infrastructure/infrastructure.dart';
import 'package:dashboard_app/shared/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider_orders_buys.g.dart';

@riverpod
Future<Map<String, dynamic>> getOrdersBuys(
    GetOrdersBuysRef ref, BuildContext context,
    {String? fechainicio,
    String? fechafin,
    String? estado,
    int page = 1,
    required bool updateState}) async {
  final RepositoryOrdersBuys repository =
      RepositoryOrdersBuysI(datasource: DatasourceOrdersBuysI());
  final useCase = UseCaseOrdersBuys(repository: repository);
  final token = await GeneralUtils.getToken();
  final response = await useCase.callGetDataOrdersBuys(
    token ?? '',
    fechainicio: fechainicio,
    fechafin: fechafin,
    estado: estado,
    page: page,
  );
  // ignore: use_build_context_synchronously
  GeneralUtils.validateResponse(response, context);
  return response;
}

@riverpod
class PageQueryOrdersBuys extends _$PageQueryOrdersBuys {
  @override
  int build() {
    return 1;
  }

  void increment() {
    state++;
  }

  void reset() {
    state = 1;
  }
}

@riverpod
class UpdateState extends _$UpdateState {
  @override
  bool build() {
    return true;
  }

  void changeValue() {
    state = !state;
  }
}
