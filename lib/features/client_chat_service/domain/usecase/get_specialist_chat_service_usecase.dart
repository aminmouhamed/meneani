import 'package:dartz/dartz.dart';
import 'package:naji/core/errors/failures.dart';
import 'package:naji/features/client_chat_service/domain/entiti/specialist_chat_service_entiti.dart';
import 'package:naji/features/client_chat_service/domain/repository/client_chat_service_repository.dart';

class GetSpecialistChatServiceUsecase {
  final ClientChatServiceRepository clientChatServiceRepository;

  GetSpecialistChatServiceUsecase({required this.clientChatServiceRepository});
  Future<Either<Failures, List<SpecialistChatServiceEntiti>>> call(
    String specialistType,
  ) async {
    return await clientChatServiceRepository.getSpecialistChatService(
      specialistType,
    );
  }
}
