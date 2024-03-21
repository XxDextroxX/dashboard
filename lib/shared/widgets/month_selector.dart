import 'package:dashboard_app/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MonthSelector extends ConsumerWidget {
  const MonthSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(indexSelectorMonthProvider);
    final indexIntance = ref.watch(indexSelectorMonthProvider.notifier);
    final totalExpensesIntance = ref.watch(totalExpensesProvider.notifier);
    final presupuestoIntance = ref.watch(presupuestoProvider.notifier);
    final countsNotifier = ref.watch(countsProvider.notifier);
    PageController pageController = PageController(
      initialPage: index,
      viewportFraction: 0.4,
    );
    return SizedBox(
      height: 50,
      child: PageView(
          controller: pageController,
          onPageChanged: (value) {
            indexIntance.changeIndex(value);
            totalExpensesIntance.changeValue(0);
            presupuestoIntance.changeValue(0);
            countsNotifier.reset();
          },
          children: [
            _pageItem('Enero', 0, index, context),
            _pageItem('Febrero', 1, index, context),
            _pageItem('Marzo', 2, index, context),
            _pageItem('Abril', 3, index, context),
            _pageItem('Mayo', 4, index, context),
            _pageItem('Junio', 5, index, context),
            _pageItem('Julio', 6, index, context),
            _pageItem('Agosto', 7, index, context),
            _pageItem('Septiembre', 8, index, context),
            _pageItem('Octubre', 9, index, context),
            _pageItem('Noviembre', 10, index, context),
            _pageItem('Diciembre', 11, index, context),
          ]),
    );
  }

  Widget _pageItem(
      String name, int position, int currentPage, BuildContext context) {
    var alignment = Alignment.center;
    final selected = TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).primaryColorDark,
    );
    final unSelected = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.normal,
      color: Colors.grey[700],
    );
    return Align(
      alignment: alignment,
      child: Text(
        name,
        style: position == currentPage ? selected : unSelected,
      ),
    );
  }
}
