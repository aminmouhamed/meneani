import 'package:equatable/equatable.dart';

class ClientEntiti extends Equatable {
  final String fName;

  ClientEntiti({required this.fName});
  @override
  // TODO: implement props
  List<Object?> get props => [this.fName];
}
