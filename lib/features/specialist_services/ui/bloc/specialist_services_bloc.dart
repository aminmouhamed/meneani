import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:naji/core/errors/failures.dart';
import 'package:naji/features/specialist_services/domain/entities/appointment_entiti.dart';
import 'package:naji/features/specialist_services/domain/usecases/enabel_appointment_service.dart';
import 'package:naji/features/specialist_services/domain/usecases/get_appointment_setting.dart';

part 'specialist_services_event.dart';
part 'specialist_services_state.dart';

class SpecialistServicesBloc
    extends Bloc<SpecialistServicesEvent, SpecialistServicesState> {
  final GetAppointmentSetting getAppointmentSetting;
  final UpdateAppointmentServiceUsecase updateAppointmentService;
  final TextEditingController price = TextEditingController();
  SpecialistServicesBloc({
    required this.getAppointmentSetting,
    required this.updateAppointmentService,
  }) : super(SpecialistServicesInitial()) {
    on<SpecialistServicesEvent>((event, emit) async {
      if (event is SpecialistGetAppointmentSettingEvent) {
        emit(SpecialistAppointmentServiceLoadingState());
        var response = await getAppointmentSetting();
        response.fold(
          (failure) {
            if (failure is ServerFailure) {
              emit(
                SpecialistServiceErrorState(errorMessage: failure.errorMassege),
              );
            }
          },
          (value) {
            if (value != null) {
              print(value.price);
              emit(
                SpecialistAppointmentServiceLoadedState(
                  appointmentEntiti: value,
                ),
              );
            }
          },
        );
      }
      if (event is SpecialistUpdateAppointmentSettingEvent) {
        emit(SpecialistAppointmentServiceLoadingState());
        var response = await updateAppointmentService(
          AppointmentEntiti(
            service_state: event.serviceState,
            price: event.price,
            description: "",
          ),
        );
        response.fold(
          (failure) {
            if (failure is ServerFailure) {
              emit(
                SpecialistServiceErrorState(errorMessage: failure.errorMassege),
              );
            }
          },
          (value) {
            if (value != null) {
              emit(
                SpecialistAppointmentServiceLoadedState(
                  appointmentEntiti: value,
                ),
              );
            }
          },
        );
      }
    });
  }
  @override
  Future<void> close() {
    price.dispose();
    return super.close();
  }
}
