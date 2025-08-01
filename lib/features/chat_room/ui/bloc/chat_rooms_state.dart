part of 'chat_rooms_bloc.dart';

abstract class ChatRoomsState extends Equatable {
  const ChatRoomsState();

  @override
  List<Object> get props => [];
}

class ChatRoomsInitial extends ChatRoomsState {}

class ChatRoomsLoadingState extends ChatRoomsState {}

class ChatRoomsLoadedState extends ChatRoomsState {
  final List<ChatRoomEntiti> chatRooms;

  ChatRoomsLoadedState({required this.chatRooms});
}

class ChatRoomsErrorState extends ChatRoomsState {
  final String errorMessage;

  ChatRoomsErrorState({required this.errorMessage});
}
