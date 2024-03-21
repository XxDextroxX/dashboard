import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:dashboard_app/infrastructure/models/models.dart';
import 'package:dashboard_app/presentation/providers/providers.dart';
import 'package:dashboard_app/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailsCategories extends ConsumerStatefulWidget {
  const DetailsCategories({super.key, required this.codigoCuenta});
  final String codigoCuenta;

  @override
  DetailsCategoriesState createState() => DetailsCategoriesState();
}

class DetailsCategoriesState extends ConsumerState<DetailsCategories> {
  late ScrollController _scrollController;
  List<DetailsAccounts> allData = [];
  double currentScrollPosition = 0.0;
  bool canSearch = true;
  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  void _onScroll() async {
    currentScrollPosition = _scrollController.position.pixels;
    double currentScroll = _scrollController.position.pixels;
    double maxScroll = _scrollController.position.maxScrollExtent;
    bool isScrollingDown = _scrollController.position.axis == Axis.vertical;
    if (currentScroll >= maxScroll && isScrollingDown) {
      print('LLego al final de la lista');
      if (canSearch) {
        final getIndexToDetailsNotifier =
            ref.read(getIndexToDetailsProvider.notifier);
        getIndexToDetailsNotifier.increment();
      }
    }
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final size = MediaQuery.of(context).size;
    final year = DateTime.now().year;
    final index = ref.watch(indexSelectorMonthProvider);
    final getIndexToDetails = ref.watch(getIndexToDetailsProvider);
    final getDetailsAccount = ref.watch(
      getDetailsAccountProvider(context,
          id: widget.codigoCuenta,
          year: year.toString(),
          month: (index + 1).toString(),
          page: getIndexToDetails),
    );
    print('main $getIndexToDetails');
    return Scaffold(
        appBar: AppBar(
          title: Text('Código cuenta ${widget.codigoCuenta}'),
        ),
        body: getDetailsAccount.when(
          data: (data) {
            if (allData.isNotEmpty &&
                (data['data'] as List<DetailsAccounts>).length < 20) {
              canSearch = false;
              AnimatedSnackBar.material('No hay mas registros',
                      type: AnimatedSnackBarType.error,
                      mobileSnackBarPosition: MobileSnackBarPosition.bottom)
                  // ignore: use_build_context_synchronously
                  .show(context);
            }
            if ((data['data'] == null || data['data'].isEmpty) &&
                allData.isEmpty) {
              return const Column(
                children: [
                  SizedBox(
                    height: 200,
                  ),
                  WidgetEmpty(),
                ],
              );
            }
            allData.addAll(data['data'] as List<DetailsAccounts>);
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _scrollController.jumpTo(currentScrollPosition);
            });
            return SizedBox(
                height: size.height * 1,
                width: double.infinity,
                child: NotificationListener<ScrollEndNotification>(
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                          columnSpacing: 50,
                          headingRowHeight: 50,
                          headingRowColor: MaterialStateProperty.resolveWith(
                              (states) => Theme.of(context).primaryColor),
                          columns: const [
                            DataColumn(
                                label: Text(
                              'N°',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                            DataColumn(
                                label: Text(
                              'Fecha',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                            DataColumn(
                                label: Text(
                              'Debitos',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                            DataColumn(
                                label: Text(
                              'Comentario',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                          ],
                          rows: allData
                              .map((e) => DataRow(cells: [
                                    DataCell(Text('${allData.indexOf(e) + 1}')),
                                    DataCell(Text(
                                        e.fecha.toString().substring(0, 10))),
                                    DataCell(Text(e.debitos.toString())),
                                    DataCell(SizedBox(
                                        width: 400,
                                        child: Text(e.comments ?? ''))),
                                  ]))
                              .toList()),
                    ),
                  ),
                ));
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
