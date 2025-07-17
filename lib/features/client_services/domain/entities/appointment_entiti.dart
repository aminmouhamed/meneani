import 'package:equatable/equatable.dart';

class AppointmentEntiti extends Equatable {
  final String fName;
  final String lName;
  final String image;
  final String specialistType;
  final String address;
  final String descriptions;
  final String prix;

  AppointmentEntiti({
    required this.address,
    required this.descriptions,
    required this.fName,
    required this.lName,
    required this.image,
    required this.specialistType,
    required this.prix,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [
    this.fName,
    this.lName,
    this.image,
    this.specialistType,
    this.prix,
    this.address,
    this.descriptions,
  ];
}
