import 'package:naji/features/home/domain/entiti/get_client_appointment_entiti.dart';

class GetClientAppointmentModel {
  final String specialistFName;
  final String specialisLName;
  final String appointmentDate;
  final String specialistImage;
  final String specialistAddress;
  final String specialistType;
  final int id;

  GetClientAppointmentModel({
    required this.id,
    required this.specialistFName,
    required this.specialisLName,
    required this.appointmentDate,
    required this.specialistImage,
    required this.specialistAddress,
    required this.specialistType,
  });

  factory GetClientAppointmentModel.fromJson(Map<String, dynamic> jsonData) {
    return GetClientAppointmentModel(
      id: jsonData["id"],
      specialistFName: jsonData["specialist"]["uFName"],
      specialisLName: jsonData["specialist"]["uLName"],
      appointmentDate: jsonData["appointment_date"],
      specialistImage: jsonData["specialist"]["image"],
      specialistAddress: jsonData["specialist"]["uSpecialistAddress"],
      specialistType: jsonData["specialist"]["uSpecialistType"],
    );
  }
  GetClientAppointmentEntiti toEntiti() {
    return GetClientAppointmentEntiti(
      specialistFName: this.specialistFName,
      specialisLName: this.specialisLName,
      appointmentDate: this.appointmentDate,
      specialistImage: this.specialistImage,
      specialistAddress: this.specialistAddress,
      specialistType: this.specialistType,
      id: this.id,
    );
  }
}
