import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meneani/core/errors/failures.dart';
import 'package:meneani/features/client_services/domain/entities/appointment_entiti.dart';
import 'package:meneani/features/client_services/domain/usecase/get_specialist_eppointment_services.dart';

part 'client_service_event.dart';
part 'client_service_state.dart';

class ClientServiceBloc extends Bloc<ClientServiceEvent, ClientServiceState> {
  final GetSpecialistEppointmentServicesUsecase
  getSpecialistEppointmentServices;
  ClientServiceBloc({required this.getSpecialistEppointmentServices})
    : super(ClientServiceInitial()) {
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
    });
  }
}
