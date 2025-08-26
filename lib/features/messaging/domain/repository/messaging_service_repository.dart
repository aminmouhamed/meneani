import 'package:dartz/dartz.dart';
import 'package:naji/core/errors/failures.dart';
import 'package:naji/features/messaging/domain/entiti/message_entiti.dart';

abstract class MessagingServiceRepository {
  Future<Either<Failures, int>> sendMessage({roomId, message});
}
