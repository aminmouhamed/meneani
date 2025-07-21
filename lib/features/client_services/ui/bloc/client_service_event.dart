part of 'client_service_bloc.dart';

abstract class ClientServiceEvent extends Equatable {
  const ClientServiceEvent();

  @override
  List<Object> get props => [];
}

class GetSpecialistAppointmentEvent extends ClientServiceEvent {
  final String SpecialistType;

  GetSpecialistAppointmentEvent({required this.SpecialistType});
}
