import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meneani/core/errors/failures.dart';
import 'package:meneani/features/client_chat_service/domain/entiti/specialist_chat_service_entiti.dart';
import 'package:meneani/features/client_chat_service/domain/usecase/get_specialist_chat_service_usecase.dart';

part 'client_chat_event.dart';
part 'client_chat_state.dart';

class ClientChatBloc extends Bloc<ClientChatEvent, ClientChatState> {
  final GetSpecialistChatServiceUsecase getSpecialistChatServiceUsecase;
  ClientChatBloc({required this.getSpecialistChatServiceUsecase})
    : super(ClientChatInitial()) {
    on<ClientChatEvent>((event, emit) async {
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
    });
  }
}
