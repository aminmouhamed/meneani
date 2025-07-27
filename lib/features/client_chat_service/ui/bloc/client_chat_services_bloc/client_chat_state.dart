part of 'client_chat_bloc.dart';

abstract class ClientChatState extends Equatable {
  const ClientChatState();

  @override
  List<Object> get props => [];
}

class ClientChatInitial extends ClientChatState {}

class ClientChatServiceLoadingState extends ClientChatState {}

class ClientChatServiceLoadedState extends ClientChatState {
  final List<SpecialistChatServiceEntiti> chatService;

  ClientChatServiceLoadedState({required this.chatService});
}

class ClientChatServiceErrorState extends ClientChatState {
  final String errorMassege;

  ClientChatServiceErrorState({required this.errorMassege});
}
