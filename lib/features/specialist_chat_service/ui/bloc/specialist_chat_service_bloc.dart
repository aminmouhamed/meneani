import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:naji/core/errors/failures.dart';
import 'package:naji/features/client_chat_service/domain/usecase/get_specialist_chat_service_usecase.dart';
import 'package:naji/features/specialist_chat_service/domain/entiti/specialist_chat_service_setting_entiti.dart';
import 'package:naji/features/specialist_chat_service/domain/usecase/specialist_get_chat_service_setting_usecase.dart';
import 'package:naji/features/specialist_chat_service/domain/usecase/specialist_set_chat_service_usecase.dart';

part 'specialist_chat_service_event.dart';
part 'specialist_chat_service_state.dart';

class SpecialistChatServiceBloc
    extends Bloc<SpecialistChatServiceEvent, SpecialistChatServiceState> {
  final SpecialistSetChatServiceUsecase specialistSetChatServiceUsecase;
  final SpecialistGetChatServiceSettingUsecase
  specialistGetChatServiceSettingUsecase;
  late TextEditingController price = TextEditingController();
  SpecialistChatServiceBloc({
    required this.specialistSetChatServiceUsecase,
    required this.specialistGetChatServiceSettingUsecase,
  }) : super(SpecialistChatServiceInitial()) {
    on<SpecialistChatServiceEvent>((event, emit) async {
      if (event is SpecialistChatServiceSetSettingEvent) {
        emit(SpecialistChatServiceLoadingState());
        var response = await specialistSetChatServiceUsecase(
          event.state,
          event.price,
        );
        response.fold(
          (failur) {
            if (failur is ServerFailure) {
              emit(
                SpecialistChatServiceErrorState(
                  errorMasseg: failur.errorMassege,
                ),
              );
            }
          },
          (value) {
            emit(SpecialistChatServiceLoadedState(serviceSettingEntiti: value));
          },
        );
      }
      if (event is GetChatServiceSettingsEvent) {
        emit(SpecialistChatServiceLoadingState());
        var response = await specialistGetChatServiceSettingUsecase();
        response.fold(
          (failure) {
            if (failure is ServerFailure) {
              emit(
                SpecialistChatServiceErrorState(
                  errorMasseg: failure.errorMassege,
                ),
              );
            }
          },
          (value) {
            emit(SpecialistChatServiceLoadedState(serviceSettingEntiti: value));
          },
        );
      }
    });
  }
  @override
  Future<void> close() {
    price.dispose();
    return super.close();
  }
}
