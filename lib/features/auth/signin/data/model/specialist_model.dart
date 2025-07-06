import 'package:meneani/features/auth/signin/data/model/user_model.dart';
import 'package:meneani/features/auth/signin/domain/entiti/specialist_entiti.dart';

class SpecialistModel extends UserModel {
  final String uFName;
  final String uLName;
  final String uNationalId;
  final String uDiplomaId;
  final String uAge;
  final String uGender;
  final String uSpecialistType;
  final String uSpecialistAddress;

  SpecialistModel({
    required this.uFName,
    required this.uLName,
    required this.uNationalId,
    required this.uDiplomaId,
    required this.uGender,
    required this.uSpecialistType,
    required this.uAge,
    required super.phone,
    required super.password,
    required this.uSpecialistAddress,
    required super.email,
  });
  factory SpecialistModel.fromEntiti(SpecialistEntiti spEntiti) {
    return SpecialistModel(
      uFName: spEntiti.uFName,
      uLName: spEntiti.uLName,
      uNationalId: spEntiti.uNationalId,
      uDiplomaId: spEntiti.uDiplomaId,
      uGender: spEntiti.uGender,
      uSpecialistType: spEntiti.uSpecialistType,
      uAge: spEntiti.uAge,
      phone: spEntiti.phone,
      password: spEntiti.password,
      uSpecialistAddress: spEntiti.uSpecialistAddress,
      email: spEntiti.uEmail,
    );
  }
  factory SpecialistModel.fromJson(Map<dynamic, dynamic> jsonData) {
    return SpecialistModel(
      uFName: jsonData["uFName"],
      uLName: jsonData["uLName"],
      uNationalId: jsonData["uNationalId"],
      uAge: jsonData["uAge"],
      phone: jsonData["uphone"],
      password: jsonData["uPassword"],
      uDiplomaId: jsonData["uDiplomaId"],
      uGender: jsonData["uGender"],
      uSpecialistType: jsonData["uSpecialistType"],
      uSpecialistAddress: jsonData["uSpecialistAddress"],
      email: jsonData["uEmail"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "uFName": uFName,
      "uLName": uLName,
      "uNationalId": uNationalId,
      "uAge": uAge,
      "uPhone": phone,
      "uDiplomaId": uDiplomaId,
      "uGender": uGender,
      "uSpecialistType": uSpecialistType,
      "uSpecialistAddress": uSpecialistAddress,
    };
  }
}
