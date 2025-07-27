part of 'client_chat_bloc.dart';

abstract class ClientChatEvent extends Equatable {
  const ClientChatEvent();

  @override
  List<Object> get props => [];
}

class GetSpecialistChatServicesEvent extends ClientChatEvent {
  final String specialistType;

  GetSpecialistChatServicesEvent({required this.specialistType});
}
