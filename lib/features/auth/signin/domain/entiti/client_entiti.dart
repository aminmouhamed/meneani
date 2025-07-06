import 'package:equatable/equatable.dart';

class ClientEntiti extends Equatable {
  final String phone;
  final String email;
  final String password;
  final String uFName;
  final String uLName;
  final String uNationalId;
  final String uAge;
  final String uGender;

  const ClientEntiti({
    required this.phone,
    required this.password,
    required this.uFName,
    required this.uLName,
    required this.uNationalId,
    required this.uAge,
    required this.uGender,
    required this.email,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    phone,
    password,
    uFName,
    uLName,
    uNationalId,
    uAge,
    uGender,
    email,
  ];
}
