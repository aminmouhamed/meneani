import 'package:equatable/equatable.dart';

class SpecialistChatServiceEntiti extends Equatable {
  final String image;
  final String specialistId;
  final String fName;
  final String lName;
  final String specialistType;
  final String price;

  SpecialistChatServiceEntiti({
    required this.image,
    required this.specialistId,
    required this.fName,
    required this.lName,
    required this.specialistType,
    required this.price,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    this.fName,
    this.lName,
    this.image,
    this.price,
    this.specialistId,
    this.specialistType,
  ];
}
