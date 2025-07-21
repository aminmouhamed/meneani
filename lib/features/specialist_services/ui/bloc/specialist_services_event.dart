part of 'specialist_services_bloc.dart';

abstract class SpecialistServicesEvent extends Equatable {
  const SpecialistServicesEvent();

  @override
  List<Object> get props => [];
}

class SpecialistGetAppointmentSettingEvent extends SpecialistServicesEvent {}

class SpecialistUpdateAppointmentSettingEvent extends SpecialistServicesEvent {
  final bool serviceState;
  final String price;

  SpecialistUpdateAppointmentSettingEvent({
    required this.serviceState,
    required this.price,
  });
}
