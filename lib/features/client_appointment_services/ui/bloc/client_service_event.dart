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

class SetClientAppointmentEvent extends ClientServiceEvent {
  final SetAppointmentEntiti appointmentEntiti;

  SetClientAppointmentEvent({required this.appointmentEntiti});
}

class GetClientAppointmentOfService extends ClientServiceEvent {
  final int id;
  final String date;

  GetClientAppointmentOfService({required this.id, required this.date});
}
