import 'package:dashboard_app/infrastructure/models/models.dart';
import 'package:dashboard_app/presentation/charts/charts.dart';
import 'package:dashboard_app/presentation/providers/providers.dart';
import 'package:dashboard_app/shared/utils/utils.dart';
import 'package:dashboard_app/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashBoardPage extends ConsumerStatefulWidget {
  const DashBoardPage({super.key});

  @override
  DashBoardPageState createState() => DashBoardPageState();
}

class DashBoardPageState extends ConsumerState<DashBoardPage> {
  final year = DateTime.now().year;
  bool isAdmin = true;
  @override
  Widget build(BuildContext context) {
    final user = UserModel.instance();
    isAdmin = user.role == 'admin' ? true : false;
    final totalExpenses = ref.watch(totalExpensesProvider);
    final presupuesto = ref.watch(presupuestoProvider);
    final index = ref.watch(indexSelectorMonthProvider);
    final counts = ref.watch(countsProvider);
    final countsNotifier = ref.watch(countsProvider.notifier);
    final keys = counts.keys.toList();
    final isDataExpanded = ref.watch(isDataExpandedProvider);
    final getData = ref.watch(getDataToAdminProvider(context,
        year: year.toString(),
        month: (index + 1).toString(),
        isDataExpanded: isDataExpanded,
        isAdmin: isAdmin));
    return Scaffold(
      body: SingleChildScrollView(
        child: getData.when(
          data: (data) {
            if (data['data'] == null || data['data'].isEmpty) {
              return const Column(
                children: [
                  MonthSelector(),
                  SizedBox(
                    height: 200,
                  ),
                  WidgetEmpty(),
                ],
              );
            }
            final dataNew = data['data'] as Map<String, dynamic>;
            return Column(
              children: [
                if (!isAdmin)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      user.accounts?.descripcionCuenta ?? '',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                if (isAdmin) const MonthSelector(),
                _expenses(expenses: totalExpenses, income: presupuesto),
                if (isAdmin) const ButtonsChart(),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ChartLine(
                        data: dataNew,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomInputs(
                    colorStyle: Theme.of(context).primaryColor,
                    hintText: 'Buscar',
                    suffixIcon: const Icon(
                      Icons.search,
                    ),
                    onChanged: (value) {
                      countsNotifier.filter(value);
                    },
                  ),
                ),
                counts.isNotEmpty
                    ? ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: keys.length,
                        itemBuilder: (context, index) {
                          final key = keys[index];
                          final value = counts[key];
                          return ViewExpenses(
                            codigoCuenta: value['codigoCuenta'],
                            category: key,
                            expenses: value['gastoPorcentual'] != null
                                ? value['gastoPorcentual'].toDouble()
                                : 0,
                            debits: value['debitos'],
                            credits: value['creditos'],
                            balance: value['balance'],
                          );
                        })
                    : const WidgetEmpty()
              ],
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
        ),
      ),
    );
  }

  Widget _expenses({required int expenses, required int income}) {
    final incomes = income > expenses;
    return Row(children: [
      Expanded(
          child: _incomes(
              GeneralUtils.formatearComoDinero(
                  double.tryParse(expenses.toString()) ?? 0),
              'Gastos')),
      Expanded(
          child: _incomes(
              GeneralUtils.formatearComoDinero(
                  double.tryParse(income.toString()) ?? 0),
              'Presupuesto',
              isIncome: !incomes)),
    ]);
  }

  Widget _incomes(String number, String title, {bool isIncome = true}) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isIncome ? Colors.green : Colors.red,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(children: [
        Text(
          '\$ $number',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(title)
      ]),
    );
  }
}
