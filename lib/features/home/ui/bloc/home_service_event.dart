part of 'home_service_bloc.dart';

abstract class HomeServiceEvent extends Equatable {
  const HomeServiceEvent();

  @override
  List<Object> get props => [];
}

class HomeGetClientAppointmentEvent extends HomeServiceEvent {}

class DeleteClientAppointmentEvent extends HomeServiceEvent {
  final int id;

  DeleteClientAppointmentEvent({required this.id});
}
