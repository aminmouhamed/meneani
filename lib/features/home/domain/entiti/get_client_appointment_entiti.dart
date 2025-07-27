import 'package:equatable/equatable.dart';

class GetClientAppointmentEntiti extends Equatable {
  final String specialistFName;
  final String specialisLName;
  final String appointmentDate;
  final String specialistImage;
  final String specialistAddress;
  final String specialistType;
  final int id;

  GetClientAppointmentEntiti({
    required this.id,
    required this.specialistFName,
    required this.specialisLName,
    required this.appointmentDate,
    required this.specialistImage,
    required this.specialistAddress,
    required this.specialistType,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    this.appointmentDate,
    this.specialistFName,
    this.specialisLName,
    this.specialistImage,
    this.specialistType,
    this.specialistAddress,
    this.id,
  ];
}
