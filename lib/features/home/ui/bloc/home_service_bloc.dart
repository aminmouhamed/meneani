import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:naji/core/errors/failures.dart';
import 'package:naji/features/client_appointment_services/ui/bloc/client_service_bloc.dart';
import 'package:naji/features/home/domain/entiti/get_client_appointment_entiti.dart';
import 'package:naji/features/home/domain/usecase/delete_client_appointment.dart';
import 'package:naji/features/home/domain/usecase/get_client_appointment.dart';

part 'home_service_event.dart';
part 'home_service_state.dart';

class HomeServiceBloc extends Bloc<HomeServiceEvent, HomeServiceState> {
  final GetClientAppointmentUseCase getClientAppointmentUseCase;
  final DeleteClientAppointmentUseCase deleteClientAppointmentUseCase;
  HomeServiceBloc({
    required this.deleteClientAppointmentUseCase,
    required this.getClientAppointmentUseCase,
  }) : super(HomeServiceInitial()) {
    on<HomeServiceEvent>((event, emit) async {
      if (event is HomeGetClientAppointmentEvent) {
        emit(HomeClientAppointmentLoadingState());
        var response = await getClientAppointmentUseCase();
        response.fold(
          (falure) {
            if (falure is ServerFailure) {
              emit(
                HomeClientAppointmentErrorState(
                  errorMassege: falure.errorMassege,
                ),
              );
            }
          },
          (value) {
            emit(HomeAppointmrntLoadedState(appointmentList: value));
          },
        );
      }
      if (event is DeleteClientAppointmentEvent) {
        emit(HomeClientAppointmentLoadingState());
        var response = await deleteClientAppointmentUseCase(event.id);
        response.fold(
          (falure) {
            if (falure is ServerFailure) {
              emit(
                HomeClientAppointmentErrorState(
                  errorMassege: falure.errorMassege,
                ),
              );
            }
          },
          (value) {
            add(HomeGetClientAppointmentEvent());
          },
        );
      }
    });
  }
}
