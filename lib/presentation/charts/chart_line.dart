import 'package:dashboard_app/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class ChartLine extends ConsumerStatefulWidget {
  const ChartLine({super.key, required this.data});
  final Map<String, dynamic> data;

  @override
  ChartLineState createState() => ChartLineState();
}

class ChartLineState extends ConsumerState<ChartLine> {
  List<_SalesData> data = [];

  @override
  void initState() {
    super.initState();
    widget.data.forEach((key, value) {
      data.add(_SalesData(key, value['totalExpenses'].toDouble()));
    });
  }

  @override
  Widget build(BuildContext context) {
    final totalExpensesIntance = ref.watch(totalExpensesProvider.notifier);
    final presupuestoIntance = ref.watch(presupuestoProvider.notifier);
    final centerCostNotifier = ref.watch(centerCostProvider.notifier);
    final countsNotifier = ref.watch(countsProvider.notifier);
    final getIndexToDetailsNotifier =
        ref.watch(getIndexToDetailsProvider.notifier);
    final centerCost = ref.watch(centerCostProvider);
    // final isDataExpanded = ref.watch(isDataExpandedProvider);
    return Container(
        padding: const EdgeInsets.all(10),
        height: 350,
        width: 1000,
        child: Column(children: [
          //Initialize the chart widget
          SfCartesianChart(
              primaryXAxis: const CategoryAxis(
                  // majorGridLines: MajorGridLines(width: 0),
                  // labelRotation: -90,
                  // labelAlignment: LabelAlignment.center,
                  ),
              primaryYAxis:
                  NumericAxis(numberFormat: NumberFormat("#,##0.00", "es_ES")),
              // Enable legend
              legend: const Legend(isVisible: true),
              // Enable tooltip
              tooltipBehavior: TooltipBehavior(enable: true),
              onDataLabelTapped: (DataLabelTapDetails args) {
                String centroDeCostos = data[args.pointIndex].centroDeCostos;
                int totalExpenses =
                    widget.data[centroDeCostos]['totalExpenses'];
                int presupuesto = widget.data[centroDeCostos]['presupuesto'];
                Map<String, dynamic> counts =
                    widget.data[centroDeCostos]['cuentas'];
                totalExpensesIntance.changeValue(totalExpenses);
                presupuestoIntance.changeValue(presupuesto);
                centerCostNotifier.changeValue(centroDeCostos);
                countsNotifier.changeValue(counts);
                getIndexToDetailsNotifier.reset();
              },
              series: <CartesianSeries<_SalesData, String>>[
                LineSeries<_SalesData, String>(
                    dataSource: data,
                    xValueMapper: (_SalesData sales, _) => sales.centroDeCostos,
                    yValueMapper: (_SalesData sales, _) => sales.totalExpenses,
                    name: centerCost,
                    // Enable data label
                    dataLabelSettings: const DataLabelSettings(isVisible: true))
              ]),
        ]));
  }
}

class _SalesData {
  _SalesData(this.centroDeCostos, this.totalExpenses);

  final String centroDeCostos;
  final double totalExpenses;
}
