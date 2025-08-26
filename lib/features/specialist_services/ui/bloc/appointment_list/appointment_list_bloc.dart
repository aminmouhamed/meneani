import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:naji/core/errors/failures.dart';
import 'package:naji/features/specialist_services/domain/entities/client_appointment_entiti.dart';
import 'package:naji/features/specialist_services/domain/usecases/get_appointment_list_usecase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'appointment_list_event.dart';
part 'appointment_list_state.dart';

class AppointmentListBloc
    extends Bloc<AppointmentListEvent, AppointmentListState> {
  final GetAppointmentListUsecase getAppointmentListUsecase;
  AppointmentListBloc({required this.getAppointmentListUsecase})
    : super(AppointmentListInitial()) {
    on<AppointmentListEvent>((event, emit) async {
      if (event is GetSpecialistAppointmentListEvent) {
        emit(AppointmentListLaodingState());
        var response = await getAppointmentListUsecase(
          DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
          ),
        );
        response.fold(
          (failure) {
            if (failure is ServerFailure) {
              print(failure.errorMassege);
              emit(
                AppointmentListErrorState(errorMessage: failure.errorMassege),
              );
            }
          },
          (value) {
            value.forEach((element) {
              print(element.fName);
            });
            emit(AppointmentListLoadedState(clientAppointments: value));
          },
        );
      }
      if (event is DeleteAppointmentEvent) {
        await Supabase.instance.client
            .from("appointment")
            .delete()
            .eq("id", event.id);
        add(GetSpecialistAppointmentListEvent());
      }
    });
  }
}
