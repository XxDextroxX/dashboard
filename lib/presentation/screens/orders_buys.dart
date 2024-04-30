import 'package:dashboard_app/infrastructure/models/models.dart';
import 'package:dashboard_app/presentation/providers/providers.dart';
import 'package:dashboard_app/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrdersBuysPage extends ConsumerStatefulWidget {
  const OrdersBuysPage({super.key});

  @override
  OrdersBuysPageState createState() => OrdersBuysPageState();
}

class OrdersBuysPageState extends ConsumerState<OrdersBuysPage> {
  DateTime firstDate = DateTime.now();
  String dateStart = 'Fecha inicial';
  String dateEnd = DateTime.now().toString().substring(0, 10);
  bool searchAll = true;
  bool searchAproved = false;
  bool searchPending = false;
  List<OrdersBuys> ordersBuys = [];
  late ScrollController _scrollController;
  bool canSearch = true;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    final date = DateTime.now();
    firstDate = DateTime(date.year, date.month, 1);
    dateStart = firstDate.toString().substring(0, 10);

    super.initState();
  }

  void _onScroll() async {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      print('LLego al final de la lista ${canSearch}');

      if (canSearch) {
        final pageNotifier = ref.read(pageQueryOrdersBuysProvider.notifier);
        pageNotifier.increment();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final page = ref.watch(pageQueryOrdersBuysProvider);
    final updateState = ref.watch(updateStateProvider);
    final updateStateNotifier = ref.watch(updateStateProvider.notifier);
    final getData = ref.watch(getOrdersBuysProvider(context,
        fechainicio: dateStart,
        fechafin: dateEnd,
        estado: getStatus(),
        page: page,
        updateState: updateState));
    return Scaffold(
        appBar: AppBar(
          title: const Text('Ordenes de Compras'),
          actions: [
            IconButton(
              onPressed: () {
                updateStateNotifier.changeValue();
              },
              icon: const Icon(Icons.refresh),
            ),
          ],
        ),
        drawer: const DrawerWidget(),
        body: Column(
          children: [
            Row(
              children: [
                _dateRange(size),
                _containerFilter(size),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              child: getData.when(
                data: (data) {
                  if ((data['orders'] == null || data['orders'].isEmpty) &&
                      ordersBuys.isEmpty) {
                    return const Column(
                      children: [
                        SizedBox(
                          height: 100,
                        ),
                        WidgetEmpty(),
                      ],
                    );
                  }
                  canSearch = true;
                  List<OrdersBuys> auxList = data['orders'] as List<OrdersBuys>;
                  if (auxList.isEmpty) {
                    canSearch = false;
                  }
                  ordersBuys.addAll(auxList);
                  auxList.clear();
                  print('ordersBuys: ${ordersBuys.length}');
                  return null;
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
            Expanded(
              child: SizedBox(
                width: size.width,
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: ordersBuys.length,
                  itemBuilder: (context, index) {
                    return CardOrdersBuys(
                        model: ordersBuys[index], index: index);
                  },
                ),
              ),
            )
          ],
        ));
  }

  String? getStatus() {
    if (searchAll) {
      return 'todas';
    }
    if (searchAproved) {
      return 'aprobadas';
    }
    if (searchPending) {
      return 'no aprobadas';
    }
    return null;
  }

  Widget _containerFilter(Size size) {
    return SizedBox(
      width: size.width * 0.5,
      child: Column(
        children: [
          _searchAll(),
          _searchAproved(),
          _searchPending(),
        ],
      ),
    );
  }

  Widget _searchAproved() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 20),
          child: const Text('Aprobados'),
        ),
        const SizedBox(width: 20),
        Checkbox(
            value: searchAproved,
            onChanged: (value) {
              ref.watch(pageQueryOrdersBuysProvider.notifier).reset();
              setState(() {
                searchAproved = value!;
                searchAll = false;
                searchPending = false;
                ordersBuys.clear();
              });
            })
      ],
    );
  }

  Widget _searchPending() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 20),
          child: const Text('Pendientes'),
        ),
        const SizedBox(width: 20),
        Checkbox(
            value: searchPending,
            onChanged: (value) {
              ref.watch(pageQueryOrdersBuysProvider.notifier).reset();
              setState(() {
                searchPending = value!;
                searchAll = false;
                searchAproved = false;
                ordersBuys.clear();
              });
            })
      ],
    );
  }

  Widget _searchAll() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 20),
          child: const Text('Todos'),
        ),
        const SizedBox(width: 50),
        Checkbox(
            value: searchAll,
            onChanged: (value) {
              ref.watch(pageQueryOrdersBuysProvider.notifier).reset();
              setState(() {
                searchAll = value!;
                searchAproved = false;
                searchPending = false;
                ordersBuys.clear();
              });
            })
      ],
    );
  }

  Widget _dateRange(Size size) {
    return SizedBox(
      width: size.width * 0.5,
      child: Column(
        children: [
          _dateStart(size),
          const SizedBox(height: 30),
          _dateEnd(size),
        ],
      ),
    );
  }

  Widget _dateStart(Size size) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.only(left: size.width * 0.05),
          width: size.width * 0.3,
          child: Text(dateStart),
        ),
        IconButton(
            onPressed: () {
              _selectDate(context).then((value) {
                setState(() {
                  dateStart = value;
                  ordersBuys.clear();
                });
              });
            },
            icon: const Icon(Icons.calendar_month))
      ],
    );
  }

  Widget _dateEnd(Size size) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.only(left: size.width * 0.05),
          width: size.width * 0.3,
          child: Text(dateEnd),
        ),
        IconButton(
            onPressed: () {
              _selectDate(context).then((value) {
                setState(() {
                  dateEnd = value;
                  ordersBuys.clear();
                });
              });
            },
            icon: const Icon(Icons.calendar_month))
      ],
    );
  }

  Future<String> _selectDate(
    BuildContext context,
  ) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Considera cambiar esto a tu fecha inicial
      firstDate:
          DateTime(2018), // La primera fecha que el usuario puede seleccionar
      lastDate:
          DateTime(2030), // La última fecha que el usuario puede seleccionar
    );

    if (picked != null) {
      final dateStart = picked.toString().substring(0, 10);
      return dateStart;
    } else {
      return '';
    }
  }
}
