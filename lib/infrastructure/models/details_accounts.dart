class DetailsAccounts {
  int? id;
  int? claveMovimiento;
  String? fecha;
  String? codigoEmpresa;
  String? codigoSucursal;
  String? cuenta;
  String? centroCosto;
  String? comments;
  int? debitos;
  int? creditos;
  String? numeroOrden;
  String? numeroFondo;
  String? referencia;
  String? nombre;
  String? tipoReferencia;
  String? documentoReferencia;

  DetailsAccounts({
    this.id,
    this.claveMovimiento,
    this.fecha,
    this.codigoEmpresa,
    this.codigoSucursal,
    this.cuenta,
    this.centroCosto,
    this.comments,
    this.debitos,
    this.creditos,
    this.numeroOrden,
    this.numeroFondo,
    this.referencia,
    this.nombre,
    this.tipoReferencia,
    this.documentoReferencia,
  });

  DetailsAccounts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    claveMovimiento = json['claveMovimiento'];
    fecha = json['fecha'];
    codigoEmpresa = json['codigoEmpresa'];
    codigoSucursal = json['codigoSucursal'];
    cuenta = json['cuenta'];
    centroCosto = json['centroCosto'];
    comments = json['comentario'];
    debitos = json['debitos'];
    creditos = json['creditos'];
    numeroOrden = json['numeroOrden'];
    numeroFondo = json['numeroFondo'];
    referencia = json['referencia'];
    nombre = json['nombre'];
    tipoReferencia = json['tipoReferencia'];
    documentoReferencia = json['documentoReferencia'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'claveMovimiento': claveMovimiento,
      'fecha': fecha,
      'codigoEmpresa': codigoEmpresa,
      'codigoSucursal': codigoSucursal,
      'cuenta': cuenta,
      'centroCosto': centroCosto,
      'comentario': comments,
      'debitos': debitos,
      'creditos': creditos,
      'numeroOrden': numeroOrden,
      'numeroFondo': numeroFondo,
      'referencia': referencia,
      'nombre': nombre,
      'tipoReferencia': tipoReferencia,
      'documentoReferencia': documentoReferencia,
    };
  }
}
