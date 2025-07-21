part of 'client_service_bloc.dart';

abstract class ClientServiceState extends Equatable {
  const ClientServiceState();

  @override
  List<Object> get props => [];
}

class ClientServiceInitial extends ClientServiceState {}

class ClientServiceAppointmentLoadingState extends ClientServiceState {}

class ClientServiceAppointmentLoadedState extends ClientServiceState {
  final List<AppointmentEntiti> spesialistAppointments;

  ClientServiceAppointmentLoadedState({required this.spesialistAppointments});
}

class ClientServiceAppointmentErrorState extends ClientServiceState {
  final String errorMassege;

  ClientServiceAppointmentErrorState({required this.errorMassege});
}
