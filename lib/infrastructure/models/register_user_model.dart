import 'package:dashboard_app/shared/validator/validator.dart';

class RegisterUserModel {
  GeneralField name;
  GeneralField role;
  GeneralField linkedCenterCodemp;
  GeneralField linkedCenterCodcuenta;
  Email email;

  RegisterUserModel({
    this.name = const GeneralField.pure(),
    this.role = const GeneralField.pure(),
    this.linkedCenterCodemp = const GeneralField.pure(),
    this.linkedCenterCodcuenta = const GeneralField.pure(),
    this.email = const Email.pure(),
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'role': role,
      'linkedCenterCodemp': linkedCenterCodemp,
      'linkedCenterCodcuenta': linkedCenterCodcuenta,
      'email': email,
    };
  }

  RegisterUserModel copyWith({
    GeneralField? name,
    GeneralField? role,
    GeneralField? linkedCenterCodemp,
    GeneralField? linkedCenterCodcuenta,
    Email? email,
  }) {
    return RegisterUserModel(
      name: name ?? this.name,
      role: role ?? this.role,
      linkedCenterCodemp: linkedCenterCodemp ?? this.linkedCenterCodemp,
      linkedCenterCodcuenta:
          linkedCenterCodcuenta ?? this.linkedCenterCodcuenta,
      email: email ?? this.email,
    );
  }
}
