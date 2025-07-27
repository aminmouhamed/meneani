import 'package:dartz/dartz.dart';
import 'package:meneani/core/errors/failures.dart';
import 'package:meneani/features/client_chat_service/domain/entiti/message_entiti.dart';
import 'package:meneani/features/client_chat_service/domain/entiti/specialist_chat_service_entiti.dart';

abstract class ClientChatServiceRepository {
  Future<Either<Failures, List<SpecialistChatServiceEntiti>>>
  getSpecialistChatService(String specialistType);

  Future<Either<Failures, int>> insertChatMassege(MessageEntiti massegEntiti);

  Future<Either<Failures, Stream>> getChatStream(
    String senderId,
    String reciverId,
  );
}
