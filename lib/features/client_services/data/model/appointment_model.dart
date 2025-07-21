import 'package:meneani/features/client_services/domain/entities/appointment_entiti.dart';

class AppointmentModel {
  final String fName;
  final String lName;
  final String image;
  final String specialistType;
  final String address;
  final String descriptions;
  final String price;

  AppointmentModel({
    required this.fName,
    required this.lName,
    required this.image,
    required this.specialistType,
    required this.address,
    required this.descriptions,
    required this.price,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> jsonData) {
    return AppointmentModel(
      fName: jsonData["specialist"]["uFName"],
      lName: jsonData["specialist"]["uLName"],
      image: jsonData["specialist"]["image"],
      specialistType: jsonData["specialist"]["uSpecialistType"],
      address: jsonData["specialist"]["uSpecialistAddress"],
      descriptions: jsonData["descriptions"],
      price: jsonData["price"],
    );
  }
  AppointmentEntiti toEntiti() {
    return AppointmentEntiti(
      address: this.address,
      descriptions: this.descriptions,
      fName: this.fName,
      lName: this.lName,
      image: this.image,
      specialistType: this.specialistType,
      prix: this.price,
    );
  }
}
