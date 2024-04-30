class OrdersBuys {
  int? id;
  String? ordencompraxs;
  String? fechaingreso;
  String? fechaaprob;
  String? aprobadopor;
  String? motivo;
  String? proveedor;
  int? estado;
  String? centrocosto;
  String? numcompra;
  double? valorTotal;

  OrdersBuys({
    required this.id,
    required this.ordencompraxs,
    required this.fechaingreso,
    required this.fechaaprob,
    required this.aprobadopor,
    required this.motivo,
    required this.proveedor,
    required this.estado,
    required this.centrocosto,
    required this.numcompra,
    required this.valorTotal,
  });

  OrdersBuys.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ordencompraxs = json['ordencompraxs'];
    fechaingreso = json['fechaingreso'];
    fechaaprob = json['fechaaprob'];
    aprobadopor = json['aprobadopor'];
    motivo = json['motivo'];
    proveedor = json['proveedor'];
    estado = json['estado'];
    centrocosto = json['centrocosto'];
    numcompra = json['numcompra'];
    valorTotal = double.tryParse(json['valortotal'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['ordencompraxs'] = ordencompraxs;
    data['fechaingreso'] = fechaingreso;
    data['fechaaprob'] = fechaaprob;
    data['aprobadopor'] = aprobadopor;
    data['motivo'] = motivo;
    data['proveedor'] = proveedor;
    data['estado'] = estado;
    data['centrocosto'] = centrocosto;
    data['numcompra'] = numcompra;
    data['valortotal'] = valorTotal;

    return data;
  }
}
