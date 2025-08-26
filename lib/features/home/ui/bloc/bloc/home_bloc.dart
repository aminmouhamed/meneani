import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:naji/core/errors/failures.dart';

import 'package:naji/features/home/domain/entiti/get_client_appointment_entiti.dart';
import 'package:naji/features/home/domain/usecase/delete_client_appointment.dart';

import 'package:naji/features/home/domain/usecase/get_client_appointment.dart';
import 'package:naji/features/home/domain/usecase/get_client_data_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetClientDataUsecase getClientDataUsecase;

  HomeBloc({required this.getClientDataUsecase}) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      if (event is GetUsreDataEvent) {
        emit(HomeLoadingState());

        var response = await getClientDataUsecase();

        response.fold(
          (failure) {
            if (failure is ServerFailure) {
              emit(HomeErrorState(errorMassege: failure.errorMassege));
            }
          },
          (value) {
            emit(HomeLoadedState());
          },
        );
      }
    });
  }
}
