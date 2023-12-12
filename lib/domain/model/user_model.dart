import 'dart:ffi';

class UserModel {
  final String email;
  final String password;
  final Bool isAuth;

  UserModel({
    required this.email,
    required this.password,
    required this.isAuth,
});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    email: json['email'] as String,
    password: json['password'] as String,
    isAuth: json['isAuth'] as Bool,
  );
}