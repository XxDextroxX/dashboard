import 'package:dashboard_app/shared/validator/validator.dart';

class ChangePassword {
  Password? oldPassword;
  Password? password;

  ChangePassword({
    this.oldPassword,
    this.password,
  });

  ChangePassword.fromJson(Map<String, dynamic> json) {
    oldPassword = Password.dirty(json['oldPassword']);
    password = Password.dirty(json['password']);
  }

  Map<String, dynamic> toJson() {
    return {
      'oldPassword': oldPassword,
      'password': password,
    };
  }

  ChangePassword copyWith({
    Password? oldPassword,
    Password? password,
  }) {
    return ChangePassword(
      oldPassword: oldPassword ?? this.oldPassword,
      password: password ?? this.password,
    );
  }
}
