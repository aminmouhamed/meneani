import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meneani/core/errors/failures.dart';
import 'package:meneani/features/client_appointment_services/domain/entities/appointment_entiti.dart';
import 'package:meneani/features/client_appointment_services/domain/entities/get_appointment_entiti.dart';
import 'package:meneani/features/client_appointment_services/domain/entities/set_appointment_entiti.dart';
import 'package:meneani/features/client_appointment_services/domain/usecase/get_appointment_of_service_usecase.dart';
import 'package:meneani/features/client_appointment_services/domain/usecase/get_specialist_eppointment_services.dart';
import 'package:meneani/features/client_appointment_services/domain/usecase/set_client_appointment_usecase.dart';

part 'client_service_event.dart';
part 'client_service_state.dart';

class ClientServiceBloc extends Bloc<ClientServiceEvent, ClientServiceState> {
  final GetSpecialistEppointmentServicesUsecase
  getSpecialistEppointmentServices;
  final SetClientAppointmentUsecase setClientAppointmentUsecase;
  final GetAppointmentOfServiceUsecase getAppointmentOfServiceUsecase;
  ClientServiceBloc({
    required this.getAppointmentOfServiceUsecase,
    required this.getSpecialistEppointmentServices,
    required this.setClientAppointmentUsecase,
  }) : super(ClientServiceInitial()) {
    on<ClientServiceEvent>((event, emit) async {
      if (event is GetSpecialistAppointmentEvent) {
        emit(ClientServiceAppointmentLoadingState());
        var response = await getSpecialistEppointmentServices(
          event.SpecialistType,
        );
        response.fold(
          (failur) {
            if (failur is ServerFailure) {
              emit(
                ClientServiceAppointmentErrorState(
                  errorMassege: failur.errorMassege,
                ),
              );
            }
          },
          (values) {
            if (values != null) {
              emit(
                ClientServiceAppointmentLoadedState(
                  spesialistAppointments: values,
                ),
              );
            }
          },
        );
      }
      if (event is SetClientAppointmentEvent) {
        emit(ClientServiceSetAppointmentLoadingState());
        var response = await setClientAppointmentUsecase(
          event.appointmentEntiti,
        );
        response.fold(
          (failure) {
            if (failure is ServerFailure) {
              emit(
                ClientServiceSetAppointmentErrorState(
                  errorMassege: failure.errorMassege,
                ),
              );
            }
          },
          (value) {
            print("prosses is done !");
            emit(ClientServiceSetAppointmentLoadedState());
          },
        );
      }
      if (event is GetClientAppointmentOfService) {
        emit(ClientServiceGetAppointmentLoadingState());
        var response = await getAppointmentOfServiceUsecase(
          event.id,
          event.date,
        );
        response.fold(
          (failure) {
            if (failure is ServerFailure) {
              print(failure.errorMassege);
              emit(
                ClientServiceGetAppointmentErrorState(
                  errorMassege: failure.errorMassege,
                ),
              );
            }
          },
          (value) {
            emit(
              ClientServiceGetAppointmentLoadedState(appointmentStream: value),
            );
          },
        );
      }
    });
  }
}
