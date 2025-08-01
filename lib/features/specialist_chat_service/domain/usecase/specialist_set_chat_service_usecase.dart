import 'package:dartz/dartz.dart';
import 'package:meneani/core/errors/failures.dart';
import 'package:meneani/features/specialist_chat_service/domain/entiti/specialist_chat_service_setting_entiti.dart';
import 'package:meneani/features/specialist_chat_service/domain/repository/specialist_chat_service_repository.dart';

class SpecialistSetChatServiceUsecase {
  final SpecialistChatServiceRepository specialistChatServiceRepository;

  SpecialistSetChatServiceUsecase({
    required this.specialistChatServiceRepository,
  });

  Future<Either<Failures, SpecialistChatServiceSettingEntiti>> call(
    bool state,
    String price,
  ) async {
    return await specialistChatServiceRepository
        .specialistSetChatServiceSetting(state, price);
  }
}
