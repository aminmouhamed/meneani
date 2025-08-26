import 'package:dartz/dartz.dart';
import 'package:naji/core/errors/failures.dart';

import 'package:naji/features/client_chat_service/domain/entiti/specialist_chat_service_entiti.dart';

abstract class ClientChatServiceRepository {
  Future<Either<Failures, List<SpecialistChatServiceEntiti>>>
  getSpecialistChatService(String specialistType);

  Future<Either<Failures, Stream>> getChatStream(
    String senderId,
    String reciverId,
  );
  Future<Either<Failures, String>> insertChatRoom(String specialistId);
}
