class CenterCosts {
  String? codigoEmpresa;
  String? codigoCuenta;
  String? descripcionCuenta;
  int? detalle;
  int? presupuesto;
  String? codigoCuentaGasto;
  String? centroCostoAcumulado1;
  String? centroCostoAcumulado2;

  CenterCosts(
      {this.codigoEmpresa,
      this.codigoCuenta,
      this.descripcionCuenta,
      this.detalle,
      this.presupuesto,
      this.codigoCuentaGasto,
      this.centroCostoAcumulado1,
      this.centroCostoAcumulado2});

  factory CenterCosts.fromJson(Map<String, dynamic> json) {
    return CenterCosts(
      codigoEmpresa: json['codigoEmpresa'],
      codigoCuenta: json['codigoCuenta'],
      descripcionCuenta: json['descripcionCuenta'],
      detalle: int.tryParse(json['detalle'].toString()),
      presupuesto: int.tryParse(json['presupuesto'].toString()),
      codigoCuentaGasto: json['codigoCuentaGasto'],
      centroCostoAcumulado1: json['centroCostoAcumulado1'],
      centroCostoAcumulado2: json['centroCostoAcumulado2'],
    );
  }

  CenterCosts copyWith({
    String? codigoEmpresa,
    String? codigoCuenta,
    String? descripcionCuenta,
    int? detalle,
    int? presupuesto,
    String? codigoCuentaGasto,
    String? centroCostoAcumulado1,
    String? centroCostoAcumulado2,
  }) {
    return CenterCosts(
      codigoEmpresa: codigoEmpresa ?? this.codigoEmpresa,
      codigoCuenta: codigoCuenta ?? this.codigoCuenta,
      descripcionCuenta: descripcionCuenta ?? this.descripcionCuenta,
      detalle: detalle ?? this.detalle,
      presupuesto: presupuesto ?? this.presupuesto,
      codigoCuentaGasto: codigoCuentaGasto ?? this.codigoCuentaGasto,
      centroCostoAcumulado1:
          centroCostoAcumulado1 ?? this.centroCostoAcumulado1,
      centroCostoAcumulado2:
          centroCostoAcumulado2 ?? this.centroCostoAcumulado2,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'codigoEmpresa': codigoEmpresa,
      'codigoCuenta': codigoCuenta,
      'descripcionCuenta': descripcionCuenta,
      'detalle': detalle,
      'presupuesto': presupuesto,
      'codigoCuentaGasto': codigoCuentaGasto,
      'centroCostoAcumulado1': centroCostoAcumulado1,
      'centroCostoAcumulado2': centroCostoAcumulado2,
    };
  }
}
