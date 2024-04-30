import 'package:dashboard_app/infrastructure/models/models.dart';
import 'package:dashboard_app/presentation/providers/providers.dart';
import 'package:dashboard_app/presentation/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ViewAccountsLevel5Widget extends ConsumerWidget {
  const ViewAccountsLevel5Widget({super.key, required this.model});
  final ModelAccounts model;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(model.descripcionCuenta),
      leading: const CircleAvatar(
        child: Icon(Icons.account_balance),
      ),
      trailing: SizedBox(
          width: 100,
          child: Row(children: [
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ViewChartBarCategory(
                    codigoCuenta: model.codigoCuenta,
                  );
                }));
              },
              icon: const Icon(Icons.bar_chart_outlined),
            ),
            IconButton(
              onPressed: () {
                final getIndexToDetailsNotifier =
                    ref.read(getIndexToDetailsProvider.notifier);
                getIndexToDetailsNotifier.reset();
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DetailsCategories(codigoCuenta: model.codigoCuenta);
                }));
              },
              icon: const Icon(Icons.remove_red_eye),
            )
          ])),
    );
  }
}
