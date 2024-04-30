import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:dashboard_app/domain/domain.dart';
import 'package:dashboard_app/infrastructure/infrastructure.dart';
import 'package:dashboard_app/infrastructure/models/models.dart';
import 'package:dashboard_app/presentation/screens/details_order_buys.dart';
import 'package:dashboard_app/shared/utils/utils.dart';
import 'package:flutter/material.dart';

class CardOrdersBuys extends StatefulWidget {
  const CardOrdersBuys({super.key, required this.model, required this.index});
  final OrdersBuys model;
  final int index;

  @override
  State<CardOrdersBuys> createState() => _CardOrdersBuysState();
}

class _CardOrdersBuysState extends State<CardOrdersBuys> {
  bool isApprove = false;

  @override
  void initState() {
    isApprove = widget.model.estado == 2;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Theme.of(context).primaryColorDark),
      ),
      child: ListTile(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return DetailsOrderBuys(model: widget.model);
          }));
        },
        // leading: CircleAvatar(
        //   backgroundColor: Theme.of(context).primaryColorDark,
        //   child: Text('${widget.index + 1}'),
        // ),
        trailing: IconButton(
          onPressed: () {
            if (isApprove) {
              return;
            }
            CustomDialogs.generalDialog(
              // ignore: use_build_context_synchronously
              context: context,
              title: 'Aprobar orden de compra',
              content: '¿Desea aprobar esta orden de compra?',
              onPressed: () async {
                final RepositoryOrdersBuys repository =
                    RepositoryOrdersBuysI(datasource: DatasourceOrdersBuysI());
                final useCase = UseCaseOrdersBuys(repository: repository);
                final token = await GeneralUtils.getToken();
                final response = await useCase.callApproveOrders(token!,
                    ordencompraxs: widget.model.ordencompraxs ?? '',
                    centrocosto: widget.model.centrocosto ?? '');
                // ignore: use_build_context_synchronously
                GeneralUtils.validateResponse(response, context);
                if (response['status']) {
                  AnimatedSnackBar.material('Orden de compra aprobada',
                          type: AnimatedSnackBarType.success,
                          mobileSnackBarPosition: MobileSnackBarPosition.bottom)
                      // ignore: use_build_context_synchronously
                      .show(context);
                  setState(() {
                    isApprove = true;
                  });
                } else {
                  AnimatedSnackBar.material(
                          response['message'] ?? 'Orden de compra no aprobada',
                          type: AnimatedSnackBarType.error,
                          mobileSnackBarPosition: MobileSnackBarPosition.bottom)
                      // ignore: use_build_context_synchronously
                      .show(context);
                }
                // ignore: use_build_context_synchronously
                Navigator.pop(context);
              },
            );
          },
          icon: isApprove
              ? const Icon(Icons.done, color: Colors.green)
              : const Icon(Icons.close, color: Colors.red),
        ),
        title: Text('#O.C: ${widget.model.ordencompraxs}'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                'Fecha de ingreso: ${widget.model.fechaingreso.toString().substring(0, 10)}'),
            Text('Motivo: ${widget.model.motivo}'),
            // Text(widget.model.ordencompraxs??''),
          ],
        ),
      ),
    );
  }
}
