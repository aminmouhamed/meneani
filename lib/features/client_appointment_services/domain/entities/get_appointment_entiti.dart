import 'package:equatable/equatable.dart';

class GetAppointmentEntiti extends Equatable {
  final String time;
  final String date;

  GetAppointmentEntiti({required this.time, required this.date});
  @override
  // TODO: implement props
  List<Object?> get props => [this.date, this.time];
}
