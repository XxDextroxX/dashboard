class UsersModel {
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
  bool isAdmin;

  UsersModel({
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
    this.isAdmin = false,
  });

  factory UsersModel.fromJson(Map<String, dynamic> json) {
    bool isDeleted = false;
    if (json["isDeleted"] is bool) {
      isDeleted = json["isDeleted"];
    } else if (json["isDeleted"] is String) {
      isDeleted = json["isDeleted"].toLowerCase() == 'true';
    }
    return UsersModel(
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
      };

//copyWith
  UsersModel copyWith({
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
  }) {
    return UsersModel(
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
    );
  }
}
