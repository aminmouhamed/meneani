import 'package:equatable/equatable.dart';

class AppointmentEntiti extends Equatable {
  final bool service_state;
  final String price;
  final String description;
  AppointmentEntiti({
    required this.service_state,
    required this.price,
    required this.description,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [this.price, this.service_state, this.description];
}
