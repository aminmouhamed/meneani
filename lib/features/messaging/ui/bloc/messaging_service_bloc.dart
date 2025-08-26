import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:naji/core/errors/failures.dart';
import 'package:naji/features/messaging/domain/usecase/send_message_usecase.dart';

part 'messaging_service_event.dart';
part 'messaging_service_state.dart';

class MessagingServiceBloc
    extends Bloc<MessagingServiceEvent, MessagingServiceState> {
  final SendMessageUsecase sendMessageUsecase;
  MessagingServiceBloc({required this.sendMessageUsecase})
    : super(MessagingServiceInitial()) {
    on<MessagingServiceEvent>((event, emit) async {
      if (event is SendMessageEvent) {
        var response = await sendMessageUsecase(
          message: event.message,
          roomId: event.roomId,
        );
        response.fold((failure) {
          if (failure is ServerFailure) {
            print(failure.errorMassege);
          }
        }, (value) {});
      }
    });
  }
}
