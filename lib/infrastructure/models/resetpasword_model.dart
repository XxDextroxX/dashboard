import 'package:dashboard_app/shared/validator/validator.dart';

class ResetPasswordModel {
  GeneralField code;
  Password password;
  Password confirmPassword;

  ResetPasswordModel({
    this.code = const GeneralField.pure(),
    this.password = const Password.pure(),
    this.confirmPassword = const Password.pure(),
  });

  factory ResetPasswordModel.fromJson(Map<String, dynamic> json) {
    return ResetPasswordModel(
      code: GeneralField.dirty(json['code']),
      password: Password.dirty(json['password']),
      confirmPassword: Password.dirty(json['confirmPassword']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code.value,
      'password': password.value,
      'confirmPassword': confirmPassword.value,
    };
  }

  ResetPasswordModel copyWith({
    GeneralField? code,
    Password? password,
    Password? confirmPassword,
  }) {
    return ResetPasswordModel(
      code: code ?? this.code,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }
}
