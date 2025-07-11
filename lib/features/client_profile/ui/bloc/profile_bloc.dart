import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meneani/core/errors/failures.dart';
import 'package:meneani/features/client_profile/domain/entities/client_entiti.dart';
import 'package:meneani/features/client_profile/domain/repository/profile_repository.dart';
import 'package:meneani/features/client_profile/domain/usecase/Get_Profile_data.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({required this.profileRepository}) : super(ProfileInitial());
  final ProfileRepository profileRepository;
  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is GetUserProfileDataEvent) {
      emit(ProfileLoadingState());
      var response = await GetProfileDataUsecase(
        profileRepository: profileRepository,
      ).call();
      response.fold(
        (failure) {
          if (failure is ServerFailure) {
            emit(ProfileErrorState(errorMassege: failure.errorMassege));
          }
        },
        (value) {
          if (value != null) {
            emit(ProfileLoadedState(clientEntiti: value));
          }
        },
      );
    }
  }
}
