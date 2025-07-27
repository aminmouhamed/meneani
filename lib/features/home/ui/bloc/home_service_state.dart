part of 'home_service_bloc.dart';

abstract class HomeServiceState extends Equatable {
  const HomeServiceState();

  @override
  List<Object> get props => [];
}

class HomeServiceInitial extends HomeServiceState {}

class HomeClientAppointmentLoadingState extends HomeServiceState {}

class HomeClientAppointmentErrorState extends HomeServiceState {
  final String errorMassege;

  HomeClientAppointmentErrorState({required this.errorMassege});
}

class HomeAppointmrntLoadedState extends HomeServiceState {
  final List<GetClientAppointmentEntiti> appointmentList;

  HomeAppointmrntLoadedState({required this.appointmentList});
}
