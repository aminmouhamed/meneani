import 'package:dartz/dartz.dart';
import 'package:meneani/core/errors/failures.dart';
import 'package:meneani/features/messaging/domain/entiti/message_entiti.dart';

abstract class MessagingServiceRepository {
  Future<Either<Failures, int>> sendMessage({roomId, message});
}
