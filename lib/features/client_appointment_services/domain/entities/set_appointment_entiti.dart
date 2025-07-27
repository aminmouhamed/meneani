import 'package:equatable/equatable.dart';

class SetAppointmentEntiti extends Equatable {
  final int id;
  final String specialistId;
  final DateTime appointmentDateTime;

  SetAppointmentEntiti({
    required this.id,
    required this.specialistId,
    required this.appointmentDateTime,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    this.appointmentDateTime,
    this.id,
    this.specialistId,
  ];
}
