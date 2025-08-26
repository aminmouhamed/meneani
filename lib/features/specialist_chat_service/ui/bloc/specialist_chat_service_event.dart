part of 'specialist_chat_service_bloc.dart';

abstract class SpecialistChatServiceEvent extends Equatable {
  const SpecialistChatServiceEvent();

  @override
  List<Object> get props => [];
}

class SpecialistChatServiceSetSettingEvent extends SpecialistChatServiceEvent {
  final String price;
  final bool state;

  SpecialistChatServiceSetSettingEvent({
    required this.price,
    required this.state,
  });
}

class GetChatServiceSettingsEvent extends SpecialistChatServiceEvent {}
