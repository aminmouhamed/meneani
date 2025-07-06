import 'package:equatable/equatable.dart';

class SpecialistEntiti extends Equatable {
  final String phone;
  final String password;
  final String uFName;
  final String uLName;
  final String uNationalId;
  final String uDiplomaId;
  final String uAge;
  final String uGender;
  final String uSpecialistType;
  final String uSpecialistAddress;
  final String uEmail;

  const SpecialistEntiti({
    required this.phone,
    required this.password,
    required this.uFName,
    required this.uLName,
    required this.uNationalId,
    required this.uDiplomaId,
    required this.uAge,
    required this.uGender,
    required this.uSpecialistType,
    required this.uSpecialistAddress,
    required this.uEmail,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    phone,
    password,
    uFName,
    uLName,
    uNationalId,
    uDiplomaId,
    uAge,
    uGender,
    uSpecialistType,
    uSpecialistAddress,
    uEmail,
  ];
}
