import 'package:dartz/dartz.dart';
import 'package:meneani/core/errors/failures.dart';
import 'package:meneani/features/messaging/data/service/Messaging_service.dart';
import 'package:meneani/features/messaging/domain/repository/messaging_service_repository.dart';

class ImplMessagingServiceRepository implements MessagingServiceRepository {
  final MessagingService messagingService;

  ImplMessagingServiceRepository({required this.messagingService});
  @override
  Future<Either<Failures, int>> sendMessage({roomId, message}) async {
    try {
      await messagingService.sendMessage(roomId: roomId, messege: message);
      return Future.value(right(1));
    } on Exception catch (e) {
      return Future.value(left(ServerFailure(errorMassege: e.toString())));
    }
  }
}
