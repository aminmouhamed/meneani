import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:naji/core/errors/failures.dart';
import 'package:naji/features/profile/domain/entities/client_entiti.dart';
import 'package:naji/features/profile/domain/repository/profile_repository.dart';
import 'package:naji/features/profile/domain/usecase/Get_Profile_data.dart';
import 'package:naji/features/profile/domain/usecase/set_client_image_profile.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository profileRepository;
  ProfileBloc({required this.profileRepository}) : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) async {
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
              emit(ProfileLoadedState());
            }
          },
        );
      }
      if (event is SetUserImageProfileEvent) {
        emit(ProfileLoadingState());
        var response = await SetClientImageProfileUseCase(
          profileRepository: profileRepository,
        ).call(event.image);
        response.fold(
          (failure) {
            if (failure is ServerFailure) {
              emit(ProfileErrorState(errorMassege: failure.errorMassege));
            }
          },
          (value) {
            if (value != null) {
              emit(ProfileLoadedState());
            }
          },
        );
      }
    });
  }
}
