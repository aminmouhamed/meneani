part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class GetUserProfileDataEvent extends ProfileEvent {}

class SetUserImageProfileEvent extends ProfileEvent {
  final File image;

  SetUserImageProfileEvent({required this.image});
}
