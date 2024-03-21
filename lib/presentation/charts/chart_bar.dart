import 'package:dashboard_app/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartBar extends ConsumerStatefulWidget {
  const ChartBar({super.key, required this.data});
  final Map<String, dynamic> data;

  @override
  ChartBarState createState() => ChartBarState();
}

class ChartBarState extends ConsumerState<ChartBar> {
  List<_SalesData> data = [];

  @override
  void initState() {
    super.initState();
    widget.data.forEach((key, value) {
      data.add(_SalesData(key, value.toDouble()));
    });
  }

  @override
  Widget build(BuildContext context) {
    final centerCost = ref.watch(centerCostProvider);
    return Container(
        padding: const EdgeInsets.all(10),
        height: 350,
        width: 1000,
        child: Column(children: [
          //Initialize the chart widget
          SfCartesianChart(
              primaryXAxis: const CategoryAxis(),
              primaryYAxis:
                  NumericAxis(numberFormat: NumberFormat("#,##0.00", "es_ES")),
              // Enable legend
              legend: const Legend(isVisible: true),
              // Enable tooltip
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <CartesianSeries<_SalesData, String>>[
                BarSeries<_SalesData, String>(
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
