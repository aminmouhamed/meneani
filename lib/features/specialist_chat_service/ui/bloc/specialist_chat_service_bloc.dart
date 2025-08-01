import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:meneani/core/errors/failures.dart';
import 'package:meneani/features/specialist_chat_service/domain/entiti/specialist_chat_service_setting_entiti.dart';
import 'package:meneani/features/specialist_chat_service/domain/usecase/specialist_set_chat_service_usecase.dart';

part 'specialist_chat_service_event.dart';
part 'specialist_chat_service_state.dart';

class SpecialistChatServiceBloc
    extends Bloc<SpecialistChatServiceEvent, SpecialistChatServiceState> {
  final SpecialistSetChatServiceUsecase specialistSetChatServiceUsecase;
  late TextEditingController price = TextEditingController();
  SpecialistChatServiceBloc({required this.specialistSetChatServiceUsecase})
    : super(SpecialistChatServiceInitial()) {
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
    });
  }
}
