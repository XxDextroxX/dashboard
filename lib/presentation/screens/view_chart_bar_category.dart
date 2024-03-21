import 'package:dashboard_app/presentation/charts/charts.dart';
import 'package:dashboard_app/presentation/providers/providers.dart';
import 'package:dashboard_app/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ViewChartBarCategory extends ConsumerWidget {
  const ViewChartBarCategory({super.key, required this.codigoCuenta});
  final String codigoCuenta;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final year = DateTime.now().year;
    final getDetailsMovements = ref.watch(getDetailsMovementsProvider(context,
        year: year.toString(), id: codigoCuenta));
    return Scaffold(
        appBar: AppBar(
          title: Text('Cuenta $codigoCuenta'),
        ),
        body: getDetailsMovements.when(
          data: (data) {
            print('data ${data}');
            if (data['data'] == null || data['data'].isEmpty) {
              return const Center(
                child: WidgetEmpty(),
              );
            }
            final dataNew = data['data'] as Map<String, dynamic>;
            return ChartBar(data: dataNew);
          },
          error: (error, stackTrace) {
            return Center(
              child: Text(error.toString()),
            );
          },
          loading: () {
            return const WidgetLoading();
          },
        ));
  }
}
