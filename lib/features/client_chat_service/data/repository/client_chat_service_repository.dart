import 'package:dartz/dartz.dart';
import 'package:meneani/core/errors/failures.dart';
import 'package:meneani/features/client_chat_service/data/model/specialist_chat_service_model.dart';
import 'package:meneani/features/client_chat_service/data/service/client_chat_service.dart';

import 'package:meneani/features/client_chat_service/domain/entiti/specialist_chat_service_entiti.dart';
import 'package:meneani/features/client_chat_service/domain/repository/client_chat_service_repository.dart';

class ImplClientChatServiceRepository implements ClientChatServiceRepository {
  final ClientChatService clientChatService;

  ImplClientChatServiceRepository({required this.clientChatService});
  @override
  Future<Either<Failures, Stream>> getChatStream(
    String senderId,
    String reciverId,
  ) {
    // TODO: implement getChatStream
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, List<SpecialistChatServiceEntiti>>>
  getSpecialistChatService(String specialistType) async {
    try {
      List<Map<String, dynamic>> responce = await clientChatService
          .getSpecialistChatService(specialistType);
      if (responce.length != 0) {
        List<SpecialistChatServiceEntiti> chatEntitis = responce.map((element) {
          SpecialistChatServiceModel chatModel =
              SpecialistChatServiceModel.fromJson(element);
          return chatModel.toEntiti();
        }).toList();
        return Future.value(right(chatEntitis));
      } else {
        return Future.value(left(ServerFailure(errorMassege: "no datat ! .")));
      }
    } on Exception catch (e) {
      return Future.value(left(ServerFailure(errorMassege: e.toString())));
    }
  }

  @override
  Future<Either<Failures, String>> insertChatRoom(String specialistId) async {
    try {
      try {
        var response = await clientChatService.selectChatRoom(specialistId);

        return Future.value(right(response["room_id"]));
      } catch (e) {
        await clientChatService.inserChatRoom(specialistId);
        return insertChatRoom(specialistId);
      }
    } on Exception catch (e) {
      return Future.value(left(ServerFailure(errorMassege: e.toString())));
    }
  }
}
