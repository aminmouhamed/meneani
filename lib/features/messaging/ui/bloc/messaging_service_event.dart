part of 'messaging_service_bloc.dart';

abstract class MessagingServiceEvent extends Equatable {
  const MessagingServiceEvent();

  @override
  List<Object> get props => [];
}

class SendMessageEvent extends MessagingServiceEvent {
  final String message;
  final String roomId;

  SendMessageEvent({required this.message, required this.roomId});
}
