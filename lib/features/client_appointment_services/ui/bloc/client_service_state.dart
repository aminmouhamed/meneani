part of 'client_service_bloc.dart';

abstract class ClientServiceState extends Equatable {
  const ClientServiceState();

  @override
  List<Object> get props => [];
}

class ClientServiceInitial extends ClientServiceState {}

//! appointment Services Page
class ClientServiceAppointmentLoadingState extends ClientServiceState {}

class ClientServiceAppointmentLoadedState extends ClientServiceState {
  final List<AppointmentEntiti> spesialistAppointments;

  ClientServiceAppointmentLoadedState({required this.spesialistAppointments});
}

class ClientServiceAppointmentErrorState extends ClientServiceState {
  final String errorMassege;

  ClientServiceAppointmentErrorState({required this.errorMassege});
}

//! appointment page
// set
class ClientServiceSetAppointmentLoadingState extends ClientServiceState {}

class ClientServiceSetAppointmentLoadedState extends ClientServiceState {}

class ClientServiceSetAppointmentErrorState extends ClientServiceState {
  final String errorMassege;

  ClientServiceSetAppointmentErrorState({required this.errorMassege});
}

//get
class ClientServiceGetAppointmentLoadingState extends ClientServiceState {}

class ClientServiceGetAppointmentLoadedState extends ClientServiceState {
  final Stream appointmentStream;

  ClientServiceGetAppointmentLoadedState({required this.appointmentStream});
}

class ClientServiceGetAppointmentErrorState extends ClientServiceState {
  final String errorMassege;

  ClientServiceGetAppointmentErrorState({required this.errorMassege});
}
