part of 'appointment_list_bloc.dart';

abstract class AppointmentListState extends Equatable {
  const AppointmentListState();

  @override
  List<Object> get props => [];
}

class AppointmentListInitial extends AppointmentListState {}

class AppointmentListLaodingState extends AppointmentListState {}

class AppointmentListLoadedState extends AppointmentListState {
  final List<ClientAppointmentEntiti> clientAppointments;

  AppointmentListLoadedState({required this.clientAppointments});
}

class AppointmentListErrorState extends AppointmentListState {
  final String errorMessage;

  AppointmentListErrorState({required this.errorMessage});
}
