import 'package:equatable/equatable.dart';

class ClientEntiti extends Equatable {
  final String fName;
  final String lName;

  ClientEntiti({required this.fName, required this.lName});
  @override
  // TODO: implement props
  List<Object?> get props => [this.fName, this.lName];
}
