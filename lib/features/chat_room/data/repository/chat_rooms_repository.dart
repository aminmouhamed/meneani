import 'package:dartz/dartz.dart';
import 'package:naji/core/errors/failures.dart';
import 'package:naji/features/chat_room/data/model/chat_room_model.dart';
import 'package:naji/features/chat_room/data/service/chat_rooms_service.dart';
import 'package:naji/features/chat_room/domain/entiti/chat_room_entiti.dart';
import 'package:naji/features/chat_room/domain/repository/chat_rooms_repository.dart';

class ImplChatRoomsRepository implements ChatRoomsRepository {
  final ChatRoomsService chatRoomsService;

  ImplChatRoomsRepository({required this.chatRoomsService});
  @override
  Future<Either<Failures, List<ChatRoomEntiti>>> getChatRooms() async {
    try {
      var response = await chatRoomsService.getChatRooms();
      List<ChatRoomEntiti> chatRooms = response.map((element) {
        return ChatRoomModel.fromJson(element).toEntiti();
      }).toList();
      if (response.length == 0) {
        return Future.value(left(ServerFailure(errorMassege: "no data !")));
      }
      return Future.value(right(chatRooms));
    } on Exception catch (e) {
      return Future.value(left(ServerFailure(errorMassege: e.toString())));
    }
  }
}
