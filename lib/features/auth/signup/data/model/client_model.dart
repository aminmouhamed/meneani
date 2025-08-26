import 'package:naji/features/auth/signup/data/model/user_model.dart';
import 'package:naji/features/auth/signup/domain/entiti/client_entiti.dart';

class ClientModel extends UserModel {
  final String uFName;
  final String uLName;
  final String uNationalId;
  final String uAge;
  final String uGender;

  ClientModel({
    required super.email,
    required this.uFName,
    required this.uLName,
    required this.uNationalId,
    required this.uAge,
    required super.phone,
    required super.password,
    required this.uGender,
  });
  factory ClientModel.fromEntiti(ClientEntiti clientEntiti) {
    return ClientModel(
      uFName: clientEntiti.uFName,
      uLName: clientEntiti.uLName,
      uNationalId: clientEntiti.uNationalId,

      uGender: clientEntiti.uGender,

      uAge: clientEntiti.uAge,
      phone: clientEntiti.phone,
      password: clientEntiti.password,

      email: clientEntiti.email,
    );
  }
  factory ClientModel.fromJson(Map<dynamic, dynamic> jsonData) {
    return ClientModel(
      uFName: jsonData["uFName"],
      uLName: jsonData["uLName"],
      uNationalId: jsonData["uNationalId"],
      uAge: jsonData["uAge"],
      phone: jsonData["uphone"],
      password: jsonData["uPassword"],
      uGender: jsonData["uGender"],
      email: jsonData["email"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "uFName": uFName,
      "uLName": uLName,
      "uNationalId": uNationalId,
      "uAge": uAge,
      "uPhone": phone,
      "uGender": uGender,
      "uPhone": phone,
    };
  }
}
