part of 'chat_rooms_bloc.dart';

abstract class ChatRoomsEvent extends Equatable {
  const ChatRoomsEvent();

  @override
  List<Object> get props => [];
}

class GetChatRoomsEvent extends ChatRoomsEvent {}
