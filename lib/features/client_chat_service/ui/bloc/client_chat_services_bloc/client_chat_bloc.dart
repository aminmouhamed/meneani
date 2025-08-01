import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meneani/core/errors/failures.dart';
import 'package:meneani/features/client_chat_service/domain/entiti/specialist_chat_service_entiti.dart';
import 'package:meneani/features/client_chat_service/domain/usecase/get_specialist_chat_service_usecase.dart';
import 'package:meneani/features/client_chat_service/domain/usecase/insert_chat_room_usecase.dart';

part 'client_chat_event.dart';
part 'client_chat_state.dart';

class ClientChatBloc extends Bloc<ClientChatEvent, ClientChatState> {
  final GetSpecialistChatServiceUsecase getSpecialistChatServiceUsecase;
  final InsertChatRoomUsecase insertChatRoomUsecase;
  ClientChatBloc({
    required this.getSpecialistChatServiceUsecase,
    required this.insertChatRoomUsecase,
  }) : super(ClientChatInitial()) {
    on<ClientChatEvent>((event, emit) async {
      // if (state is ClientChatInitial) {
      //   add(GetSpecialistChatServicesEvent());
      // }
      if (event is GetSpecialistChatServicesEvent) {
        emit(ClientChatServiceLoadingState());
        var responce = await getSpecialistChatServiceUsecase(
          event.specialistType,
        );
        responce.fold(
          (failur) {
            if (failur is ServerFailure) {
              emit(
                ClientChatServiceErrorState(errorMassege: failur.errorMassege),
              );
            }
          },
          (value) {
            emit(ClientChatServiceLoadedState(chatService: value));
          },
        );
      }
      if (event is ClientChatServiceInsertChatRoomEvent) {
        var response = await insertChatRoomUsecase(event.specialistId);
        response.fold(
          (failure) {
            if (failure is ServerFailure) {
              emit(
                ClientChatServiceErrorState(errorMassege: failure.errorMassege),
              );
            }
          },
          (val) {
            emit(ClientChatServiceInsertLoadedState(roomId: val));
          },
        );
      }
    });
  }
}
