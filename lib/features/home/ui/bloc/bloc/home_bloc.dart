import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meneani/core/errors/failures.dart';
import 'package:meneani/features/home/domain/entiti/client_entiti.dart';
import 'package:meneani/features/home/domain/repository/home_repository.dart';
import 'package:meneani/features/home/domain/usecase/get_client_data_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;
  HomeBloc({required this.homeRepository}) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      if (event is GetUsreDataEvent) {
        emit(HomeLoadingState());

        var response = await GetClientDataUsecase(
          homeRepository: homeRepository,
        ).call();
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
