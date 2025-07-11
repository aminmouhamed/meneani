part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class ProfileLoadedState extends ProfileState {
  final ClientEntiti clientEntiti;

  ProfileLoadedState({required this.clientEntiti});
}

class ProfileErrorState extends ProfileState {
  final String errorMassege;

  ProfileErrorState({required this.errorMassege});
}
