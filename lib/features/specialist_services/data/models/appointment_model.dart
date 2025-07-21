import 'package:meneani/features/specialist_services/domain/entities/appointment_entiti.dart';

class AppointmentModel {
  final String price;
  final String description;
  final bool service_state;

  AppointmentModel({
    required this.price,
    required this.description,
    required this.service_state,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> jsonData) {
    return AppointmentModel(
      price: jsonData["price"],
      description: jsonData["descriptions"],
      service_state: jsonData["state"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "price": this.price,
      "descriptions": this.description,
      "state": this.service_state,
    };
  }

  AppointmentEntiti toEntiti() {
    return AppointmentEntiti(
      service_state: service_state,
      price: price,
      description: this.description,
    );
  }
}
