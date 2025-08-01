part of 'specialist_chat_service_bloc.dart';

abstract class SpecialistChatServiceState extends Equatable {
  const SpecialistChatServiceState();

  @override
  List<Object> get props => [];
}

class SpecialistChatServiceInitial extends SpecialistChatServiceState {}

class SpecialistChatServiceLoadingState extends SpecialistChatServiceState {}

class SpecialistChatServiceLoadedState extends SpecialistChatServiceState {
  final SpecialistChatServiceSettingEntiti serviceSettingEntiti;

  SpecialistChatServiceLoadedState({required this.serviceSettingEntiti});
}

class SpecialistChatServiceErrorState extends SpecialistChatServiceState {
  final String errorMasseg;

  SpecialistChatServiceErrorState({required this.errorMasseg});
}
