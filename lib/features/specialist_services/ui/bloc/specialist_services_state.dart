part of 'specialist_services_bloc.dart';

abstract class SpecialistServicesState extends Equatable {
  const SpecialistServicesState();

  @override
  List<Object> get props => [];
}

class SpecialistServicesInitial extends SpecialistServicesState {}

class SpecialistAppointmentServiceLoadingState
    extends SpecialistServicesState {}

class SpecialistAppointmentServiceLoadedState extends SpecialistServicesState {
  final AppointmentEntiti appointmentEntiti;

  SpecialistAppointmentServiceLoadedState({required this.appointmentEntiti});
}

class SpecialistServiceErrorState extends SpecialistServicesState {
  final String errorMessage;

  SpecialistServiceErrorState({required this.errorMessage});
}
