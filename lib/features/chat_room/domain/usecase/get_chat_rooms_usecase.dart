import 'package:dartz/dartz.dart';
import 'package:naji/core/errors/failures.dart';
import 'package:naji/features/chat_room/domain/entiti/chat_room_entiti.dart';
import 'package:naji/features/chat_room/domain/repository/chat_rooms_repository.dart';

class GetChatRoomsUsecase {
  final ChatRoomsRepository chatRoomsRepository;

  GetChatRoomsUsecase({required this.chatRoomsRepository});
  Future<Either<Failures, List<ChatRoomEntiti>>> call() async {
    return await chatRoomsRepository.getChatRooms();
  }
}
