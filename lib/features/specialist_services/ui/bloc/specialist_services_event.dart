part of 'specialist_services_bloc.dart';

abstract class SpecialistServicesEvent extends Equatable {
  const SpecialistServicesEvent();

  @override
  List<Object> get props => [];
}

class SpecialistGetAppointmentSettingEvent extends SpecialistServicesEvent {}

class SpecialistSetAppointmentSettingEvent extends SpecialistServicesEvent {
  final AppointmentEntiti appointmentEntiti;

  SpecialistSetAppointmentSettingEvent({required this.appointmentEntiti});
}
