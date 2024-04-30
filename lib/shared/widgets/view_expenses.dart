import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
      onTap: () {
        context.push('/view-count-level5/$codigoCuenta');
      },
      title: Text(category),
      subtitle: Text(
        '% ${expenses.toStringAsFixed(2)}',
        style: TextStyle(color: expenses >= 100 ? Colors.red : Colors.green),
      ),
      leading: const CircleAvatar(
        child: Icon(Icons.account_balance),
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
    );
  }
}
