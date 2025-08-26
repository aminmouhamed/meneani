import 'package:naji/features/specialist_services/domain/entities/client_appointment_entiti.dart';

class ClientAppointmentModel {
  final String fName;
  final String lName;
  final String dateTime;
  final String image;
  final int id;

  ClientAppointmentModel({
    required this.fName,
    required this.lName,
    required this.dateTime,
    required this.image,
    required this.id,
  });

  factory ClientAppointmentModel.fromJson(Map<String, dynamic> jsonData) {
    return ClientAppointmentModel(
      fName: jsonData["client"]["uFName"],
      lName: jsonData["client"]["uLName"],
      dateTime: jsonData["appointment_date"],
      image: jsonData["client"]["image"],
      id: jsonData["id"],
    );
  }
  ClientAppointmentEntiti toEntiti() {
    return ClientAppointmentEntiti(
      fName: fName,
      lName: lName,
      dateTime: dateTime,
      image: image,
      id: id,
    );
  }
}
