import 'package:equatable/equatable.dart';

class ClientAppointmentEntiti extends Equatable {
  final String fName;
  final String lName;
  final String dateTime;
  final String image;
  final int id;

  ClientAppointmentEntiti({
    required this.fName,
    required this.lName,
    required this.dateTime,
    required this.image,
    required this.id,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    this.dateTime,
    this.fName,
    this.lName,
    this.image,
    this.id,
  ];
}
