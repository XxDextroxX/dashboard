import 'package:dashboard_app/infrastructure/models/models.dart';
import 'package:flutter/material.dart';

class WidgetDetailsAccounts extends StatelessWidget {
  const WidgetDetailsAccounts(
      {super.key, required this.model, required this.index});
  final DetailsAccounts model;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Theme.of(context).primaryColorDark)),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _text('Index', (index + 1).toString()),
            _text('Clave de Movimiento', model.claveMovimiento.toString()),
            _text('Fecha', model.fecha.toString().substring(0, 10)),
            _text('Código empresa', model.codigoEmpresa ?? 'N/A'),
            _text('Código sucursal', model.codigoSucursal ?? 'N/A'),
            _text('Cuenta', model.cuenta.toString()),
            _text('Debitos', model.debitos.toString()),
            _text('Creditos', model.creditos.toString()),
            _text('Comentarios', model.comments.toString()),
          ],
        ),
      ),
    );
  }

  Widget _text(String text, String value) {
    return ListTile(
      dense: true,
      contentPadding: const EdgeInsets.all(0),
      title: Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(value),
      trailing: const Icon(Icons.info),
    );
  }
}
