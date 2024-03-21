import 'package:dashboard_app/shared/validator/validator.dart';

class AuthModel {
  bool isValidFormLogin;
  bool isValidFormRegister;
  Email email;
  NameUser name;
  Password password;
  Password confirmPassword;

  AuthModel({
    this.isValidFormLogin = false,
    this.isValidFormRegister = false,
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.name = const NameUser.pure(),
    this.confirmPassword = const Password.pure(),
  });

  AuthModel copyWith({
    bool? isValidFormLogin,
    bool? isValidFormRegister,
    Email? email,
    Password? password,
    NameUser? name,
    Password? confirmPassword,
  }) {
    return AuthModel(
      isValidFormLogin: isValidFormLogin ?? this.isValidFormLogin,
      isValidFormRegister: isValidFormRegister ?? this.isValidFormRegister,
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }

  //to json

  Map<String, dynamic> toJson() {
    return {
      'isValidFormLogin': isValidFormLogin,
      'isValidFormRegister': isValidFormRegister,
      'email': email.value,
      'password': password.value,
      'name': name.value,
      'confirmPassword': confirmPassword.value,
    };
  }
}
