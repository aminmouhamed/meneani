import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:naji/core/errors/failures.dart';
import 'package:naji/features/chat_room/domain/entiti/chat_room_entiti.dart';
import 'package:naji/features/chat_room/domain/usecase/get_chat_rooms_usecase.dart';

part 'chat_rooms_event.dart';
part 'chat_rooms_state.dart';

class ChatRoomsBloc extends Bloc<ChatRoomsEvent, ChatRoomsState> {
  final GetChatRoomsUsecase getChatRoomsUsecase;
  ChatRoomsBloc({required this.getChatRoomsUsecase})
    : super(ChatRoomsInitial()) {
    on<ChatRoomsEvent>((event, emit) async {
      if (event is GetChatRoomsEvent) {
        emit(ChatRoomsLoadingState());
        var response = await getChatRoomsUsecase();
        response.fold(
          (failure) {
            if (failure is ServerFailure) {
              emit(ChatRoomsErrorState(errorMessage: failure.errorMassege));
            }
          },
          (value) {
            emit(ChatRoomsLoadedState(chatRooms: value));
          },
        );
      }
    });
  }
}
