import 'package:flutter/foundation.dart';

class UserModel {
  final String email;
  final String password;

  UserModel({required this.email, required this.password});
  factory UserModel.fromJson(Map<dynamic, dynamic> jsonData) {
    return UserModel(email: jsonData["email"], password: jsonData["password"]);
  }
  Map<String, dynamic> toJson() {
    return {"email": this.email, "password": this.password};
  }
}
