import 'package:equatable/equatable.dart';

class ClientEntiti extends Equatable {
  final String fName;
  final String lName;
  final String image;

  ClientEntiti({required this.fName, required this.lName, required this.image});
  @override
  // TODO: implement props
  List<Object?> get props => [this.fName, this.lName, this.image];
}
