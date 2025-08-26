import 'package:dartz/dartz.dart';
import 'package:naji/core/errors/failures.dart';
import 'package:naji/features/chat_room/domain/entiti/chat_room_entiti.dart';

abstract class ChatRoomsRepository {
  Future<Either<Failures, List<ChatRoomEntiti>>> getChatRooms();
}
