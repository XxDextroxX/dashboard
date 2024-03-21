import 'package:dashboard_app/presentation/providers/providers.dart';
import 'package:dashboard_app/presentation/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ViewExpenses extends ConsumerWidget {
  const ViewExpenses(
      {super.key,
      required this.category,
      required this.expenses,
      required this.debits,
      required this.credits,
      required this.balance,
      required this.codigoCuenta});

  final String category;
  final double expenses;
  final int debits;
  final int credits;
  final int balance;
  final String codigoCuenta;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(category),
      subtitle: Text('% ${expenses.toStringAsFixed(2)}'),
      leading: const CircleAvatar(
        child: Icon(Icons.category),
      ),
      trailing: SizedBox(
          width: 100,
          child: Row(children: [
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ViewChartBarCategory(
                    codigoCuenta: codigoCuenta,
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
                  return DetailsCategories(codigoCuenta: codigoCuenta);
                }));
              },
              icon: const Icon(Icons.remove_red_eye),
            )
          ])),
    );
  }
}
