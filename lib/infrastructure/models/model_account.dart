class ModelAccounts {
  String codigoEmpresa;
  String codigoCuenta;
  String descripcionCuenta;
  int detalle;
  int gasto;
  String codigoGrupo;
  String tipoGasto;
  int orden;
  int centroCosto;
  String codigoCuentaGasto;
  List<Balance> balances;
  List<Balance> balancesPresupuestarios;

  ModelAccounts({
    required this.codigoEmpresa,
    required this.codigoCuenta,
    required this.descripcionCuenta,
    required this.detalle,
    required this.gasto,
    required this.codigoGrupo,
    required this.tipoGasto,
    required this.orden,
    required this.centroCosto,
    required this.codigoCuentaGasto,
    required this.balances,
    required this.balancesPresupuestarios,
  });

  factory ModelAccounts.fromJson(Map<String, dynamic> json) {
    return ModelAccounts(
      codigoEmpresa: json['codigoEmpresa'],
      codigoCuenta: json['codigoCuenta'],
      descripcionCuenta: json['descripcionCuenta'],
      detalle: json['detalle'],
      gasto: json['gasto'],
      codigoGrupo: json['codigoGrupo'],
      tipoGasto: json['tipoGasto'],
      orden: json['orden'],
      centroCosto: json['centroCosto'],
      codigoCuentaGasto: json['codigoCuentaGasto'],
      balances: (json['balances'] as List)
          .map((e) => Balance.fromJson(e as Map<String, dynamic>))
          .toList(),
      balancesPresupuestarios: (json['balancesPresupuestarios'] as List)
          .map((e) => Balance.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'codigoEmpresa': codigoEmpresa,
        'codigoCuenta': codigoCuenta,
        'descripcionCuenta': descripcionCuenta,
        'detalle': detalle,
        'gasto': gasto,
        'codigoGrupo': codigoGrupo,
        'tipoGasto': tipoGasto,
        'orden': orden,
        'centroCosto': centroCosto,
        'codigoCuentaGasto': codigoCuentaGasto,
        'balances': balances.map((e) => e.toJson()).toList(),
        'balancesPresupuestarios':
            balancesPresupuestarios.map((e) => e.toJson()).toList(),
      };
}

class Balance {
  int periodo;
  int mes;
  String cuenta;
  String? centroCosto;
  int debitos;
  int creditos;
  String empresa;
  String sucursal;
  PlanCuentaCc? planCuentaCc;

  Balance({
    required this.periodo,
    required this.mes,
    required this.cuenta,
    this.centroCosto,
    required this.debitos,
    required this.creditos,
    required this.empresa,
    required this.sucursal,
    this.planCuentaCc,
  });

  factory Balance.fromJson(Map<String, dynamic> json) {
    return Balance(
      periodo: json['periodo'],
      mes: json['mes'],
      cuenta: json['cuenta'],
      centroCosto: json['centroCosto'],
      debitos: json['debitos'],
      creditos: json['creditos'],
      empresa: json['empresa'],
      sucursal: json['sucursal'],
      planCuentaCc: json['planCuentaCc'] != null
          ? PlanCuentaCc.fromJson(json['planCuentaCc'])
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'periodo': periodo,
        'mes': mes,
        'cuenta': cuenta,
        'centroCosto': centroCosto,
        'debitos': debitos,
        'creditos': creditos,
        'empresa': empresa,
        'sucursal': sucursal,
        'planCuentaCc': planCuentaCc?.toJson(),
      };
}

class PlanCuentaCc {
  String codigoEmpresa;
  String codigoCuenta;
  String descripcionCuenta;
  int detalle;
  int presupuesto;
  String codigoCuentaGasto;
  String centroCostoAcumulado1;
  String centroCostoAcumulado2;

  PlanCuentaCc({
    required this.codigoEmpresa,
    required this.codigoCuenta,
    required this.descripcionCuenta,
    required this.detalle,
    required this.presupuesto,
    required this.codigoCuentaGasto,
    required this.centroCostoAcumulado1,
    required this.centroCostoAcumulado2,
  });

  factory PlanCuentaCc.fromJson(Map<String, dynamic> json) {
    return PlanCuentaCc(
      codigoEmpresa: json['codigoEmpresa'],
      codigoCuenta: json['codigoCuenta'],
      descripcionCuenta: json['descripcionCuenta'],
      detalle: json['detalle'],
      presupuesto: json['presupuesto'],
      codigoCuentaGasto: json['codigoCuentaGasto'],
      centroCostoAcumulado1: json['centroCostoAcumulado1'],
      centroCostoAcumulado2: json['centroCostoAcumulado2'],
    );
  }

  Map<String, dynamic> toJson() => {
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
