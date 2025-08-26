part of 'appointment_list_bloc.dart';

abstract class AppointmentListEvent extends Equatable {
  const AppointmentListEvent();

  @override
  List<Object> get props => [];
}

class GetSpecialistAppointmentListEvent extends AppointmentListEvent {}

class DeleteAppointmentEvent extends AppointmentListEvent {
  final int id;

  DeleteAppointmentEvent({required this.id});
}
