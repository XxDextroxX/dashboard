import 'package:dashboard_app/presentation/providers/providers.dart';
import 'package:dashboard_app/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ViewAccountsLevel5Page extends ConsumerWidget {
  const ViewAccountsLevel5Page({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentYear = DateTime.now().year;
    final getDataAccountLevel5 = ref.watch(getAccountLevel5Provider(
      context,
      id: id,
      year: currentYear.toString(),
      month: '13',
    ));
    return Scaffold(
        appBar: AppBar(title: const Text('Cuentas')),
        body: getDataAccountLevel5.when(
          data: (data) {
            if (data['data'] == null || data['data'].isEmpty) {
              return const Column(
                children: [
                  // MonthSelector(),
                  SizedBox(
                    height: 200,
                  ),
                  WidgetEmpty(),
                ],
              );
            }
            final dataNew = data['data'];
            return ListView.builder(
              itemCount: dataNew.length,
              itemBuilder: (context, index) {
                return ViewAccountsLevel5Widget(
                  model: dataNew[index],
                );
              },
            );
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
