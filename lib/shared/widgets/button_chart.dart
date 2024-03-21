import 'package:dashboard_app/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ButtonsChart extends ConsumerWidget {
  const ButtonsChart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDataExpanded = ref.watch(isDataExpandedProvider);
    final isDataExpandedNotifier = ref.watch(isDataExpandedProvider.notifier);
    final totalExpensesIntance = ref.watch(totalExpensesProvider.notifier);
    final presupuestoIntance = ref.watch(presupuestoProvider.notifier);
    final countsNotifier = ref.watch(countsProvider.notifier);
    return SizedBox(
      width: 250,
      child: SwitchListTile(
          title: Text('Expandir grafico',
              style: TextStyle(color: Theme.of(context).primaryColorDark)),
          value: isDataExpanded,
          onChanged: (value) {
            isDataExpandedNotifier.changeValue(value);
            totalExpensesIntance.changeValue(0);
            presupuestoIntance.changeValue(0);
            countsNotifier.reset();
          }),
    );
  }
}
