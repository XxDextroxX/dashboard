import 'package:dashboard_app/infrastructure/models/models.dart';
import 'package:flutter/material.dart';

class DetailsOrderBuys extends StatelessWidget {
  const DetailsOrderBuys({super.key, required this.model});
  final OrdersBuys model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detalles de orden de compra'),
          backgroundColor: Theme.of(context).primaryColorDark,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              _text('Orden de compra', model.ordencompraxs ?? ''),
              _text('Fecha de ingreso',
                  model.fechaingreso.toString().substring(0, 10)),
              _text(
                  'Fecha aprobación',
                  model.fechaaprob != null
                      ? model.fechaaprob.toString().substring(0, 10)
                      : 'Pendiente'),
              _text('Aprobado por: ', model.aprobadopor ?? 'Desconocido'),
              _text('Motivo', model.motivo ?? ''),
              _text('Proveedor', model.proveedor ?? ''),
              _text('Estado', model.estado.toString()),
              _text('Centro de costo', model.centrocosto ?? ''),
              // _text('Número de compra', model.numcompra ?? 'Desconocido'),
              _text('Valor total', model.valorTotal.toString()),
            ],
          ),
        ));
  }

  Widget _text(String text, String value, {Color? color}) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      title: Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(
        value,
        style: TextStyle(color: color ?? Colors.black),
      ),
      trailing: const Icon(Icons.info),
    );
  }
}
