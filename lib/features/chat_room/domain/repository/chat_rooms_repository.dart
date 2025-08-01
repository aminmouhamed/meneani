import 'package:dartz/dartz.dart';
import 'package:meneani/core/errors/failures.dart';
import 'package:meneani/features/chat_room/domain/entiti/chat_room_entiti.dart';

abstract class ChatRoomsRepository {
  Future<Either<Failures, List<ChatRoomEntiti>>> getChatRooms();
}
