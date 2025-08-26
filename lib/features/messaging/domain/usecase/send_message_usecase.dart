import 'package:dartz/dartz.dart';
import 'package:naji/core/errors/failures.dart';
import 'package:naji/features/messaging/domain/repository/messaging_service_repository.dart';

class SendMessageUsecase {
  final MessagingServiceRepository messagingServiceRepository;

  SendMessageUsecase({required this.messagingServiceRepository});
  Future<Either<Failures, int>> call({roomId, message}) async {
    return await messagingServiceRepository.sendMessage(
      roomId: roomId,
      message: message,
    );
  }
}
