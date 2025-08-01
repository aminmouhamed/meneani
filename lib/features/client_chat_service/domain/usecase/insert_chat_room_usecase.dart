import 'package:dartz/dartz.dart';
import 'package:meneani/core/errors/failures.dart';
import 'package:meneani/features/client_chat_service/domain/repository/client_chat_service_repository.dart';

class InsertChatRoomUsecase {
  final ClientChatServiceRepository clientChatServiceRepository;

  InsertChatRoomUsecase({required this.clientChatServiceRepository});
  Future<Either<Failures, String>> call(String specialistId) async {
    return clientChatServiceRepository.insertChatRoom(specialistId);
  }
}
