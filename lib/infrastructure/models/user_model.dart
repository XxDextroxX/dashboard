class UserModel {
  static UserModel? _instance;

  String? id;
  String? name;
  String? lastName;
  String? email;
  String? role;
  String? linkedCenterCodemp;
  String? linkedCenterCodcuenta;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  AccountsModel? accounts;

  UserModel._({
    this.id,
    this.name,
    this.lastName,
    this.email,
    this.role,
    this.linkedCenterCodemp,
    this.linkedCenterCodcuenta,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.accounts,
  });

  factory UserModel.instance() {
    _instance ??= UserModel._();
    return _instance!;
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    bool isDeleted = false;
    if (json["isDeleted"] is bool) {
      isDeleted = json["isDeleted"];
    } else if (json["isDeleted"] is String) {
      isDeleted = json["isDeleted"].toLowerCase() == 'true';
    }
    return UserModel._(
      id: json["id"] is int ? json["id"].toString() : json["id"] ?? '',
      name: json["name"] ?? '',
      lastName: json["lastName"] ?? '',
      email: json["email"] ?? '',
      role: json["role"] ?? '',
      linkedCenterCodemp: json["linkedCenterCodemp"] ?? '',
      linkedCenterCodcuenta: json["linkedCenterCodcuenta"] ?? '',
      isDeleted: isDeleted,
      createdAt: json["createdAt"] ?? '',
      updatedAt: json["updatedAt"] ?? '',
      accounts: json["planCuentaCC"] != null
          ? AccountsModel.fromJson(json["planCuentaCC"])
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'lastName': lastName,
        'email': email,
        'role': role,
        'linkedCenterCodemp': linkedCenterCodemp,
        'linkedCenterCodcuenta': linkedCenterCodcuenta,
        'isDeleted': isDeleted,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'planCuentaCC': accounts?.toJson(),
      };

//copyWith
  UserModel copyWith({
    String? id,
    String? email,
    String? password,
    String? name,
    String? lastName,
    String? role,
    String? linkedCenterCodemp,
    String? linkedCenterCodcuenta,
    bool? isDeleted,
    String? createdAt,
    String? updatedAt,
    AccountsModel? accounts,
  }) {
    return UserModel._(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      role: role ?? this.role,
      linkedCenterCodemp: linkedCenterCodemp ?? this.linkedCenterCodemp,
      linkedCenterCodcuenta:
          linkedCenterCodcuenta ?? this.linkedCenterCodcuenta,
      isDeleted: isDeleted ?? this.isDeleted,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      accounts: accounts ?? this.accounts,
    );
  }

  void setData(UserModel user) {
    id = user.id;
    email = user.email;
    name = user.name;
    lastName = user.lastName;
    role = user.role;
    linkedCenterCodemp = user.linkedCenterCodemp;
    linkedCenterCodcuenta = user.linkedCenterCodcuenta;
    isDeleted = user.isDeleted;
    createdAt = user.createdAt;
    updatedAt = user.updatedAt;
    accounts = user.accounts;
  }

  UserModel getData() {
    return UserModel._(
      id: id,
      email: email,
      name: name,
      lastName: lastName,
      role: role,
      linkedCenterCodemp: linkedCenterCodemp,
      linkedCenterCodcuenta: linkedCenterCodcuenta,
      isDeleted: isDeleted,
      createdAt: createdAt,
      updatedAt: updatedAt,
      accounts: accounts,
    );
  }
}

class AccountsModel {
  String? codigoEmpresa;
  String? codigoCuenta;
  String? descripcionCuenta;
  int? detalle;
  int? presupuesto;
  String? codigoCuentaGasto;
  String? centroCostoAcumulado1;
  String? centroCostoAcumulado2;

  AccountsModel({
    this.codigoEmpresa,
    this.codigoCuenta,
    this.descripcionCuenta,
    this.detalle,
    this.presupuesto,
    this.codigoCuentaGasto,
    this.centroCostoAcumulado1,
    this.centroCostoAcumulado2,
  });

  factory AccountsModel.fromJson(Map<String, dynamic> json) {
    return AccountsModel(
      codigoCuenta: json["codigoCuenta"] ?? '',
      descripcionCuenta: json["descripcionCuenta"] ?? '',
      presupuesto: json["presupuesto"] ?? 0,
      codigoCuentaGasto: json["codigoCuentaGasto"] ?? '',
      centroCostoAcumulado1: json["centroCostoAcumulado1"] ?? '',
      centroCostoAcumulado2: json["centroCostoAcumulado2"] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'codigoCuenta': codigoCuenta,
        'descripcionCuenta': descripcionCuenta,
        'presupuesto': presupuesto,
        'codigoCuentaGasto': codigoCuentaGasto,
        'centroCostoAcumulado1': centroCostoAcumulado1,
        'centroCostoAcumulado2': centroCostoAcumulado2,
      };

  AccountsModel copyWith({
    String? codigoCuenta,
    String? descripcionCuenta,
    int? presupuesto,
    String? codigoCuentaGasto,
    String? centroCostoAcumulado1,
    String? centroCostoAcumulado2,
  }) {
    return AccountsModel(
      codigoCuenta: codigoCuenta ?? this.codigoCuenta,
      descripcionCuenta: descripcionCuenta ?? this.descripcionCuenta,
      presupuesto: presupuesto ?? this.presupuesto,
      codigoCuentaGasto: codigoCuentaGasto ?? this.codigoCuentaGasto,
      centroCostoAcumulado1:
          centroCostoAcumulado1 ?? this.centroCostoAcumulado1,
      centroCostoAcumulado2:
          centroCostoAcumulado2 ?? this.centroCostoAcumulado2,
    );
  }
}
