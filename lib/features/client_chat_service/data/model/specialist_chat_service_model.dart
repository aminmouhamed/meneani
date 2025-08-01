import 'package:meneani/features/client_chat_service/domain/entiti/specialist_chat_service_entiti.dart';

class SpecialistChatServiceModel {
  final String fName;
  final String lName;
  final String price;
  final String specialistId;
  final String specialistType;
  final String image;

  SpecialistChatServiceModel({
    required this.fName,
    required this.lName,
    required this.price,
    required this.specialistId,
    required this.specialistType,
    required this.image,
  });

  factory SpecialistChatServiceModel.fromJson(Map<String, dynamic> jsonData) {
    return SpecialistChatServiceModel(
      fName: jsonData["specialist"]["uFName"],
      lName: jsonData["specialist"]["uLName"],
      price: jsonData["price"],
      specialistId: jsonData["specialistid"],
      specialistType: jsonData["specialist"]["uSpecialistType"],
      image: jsonData["specialist"]["image"],
    );
  }
  SpecialistChatServiceEntiti toEntiti() {
    return SpecialistChatServiceEntiti(
      image: this.image,
      specialistId: this.specialistId,
      fName: this.fName,
      lName: this.lName,
      specialistType: this.specialistType,
      price: this.price,
    );
  }
}
