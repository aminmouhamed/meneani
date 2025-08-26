import 'package:dartz/dartz.dart' show Either;
import 'package:naji/core/errors/failures.dart';
import 'package:naji/features/specialist_chat_service/domain/entiti/specialist_chat_service_setting_entiti.dart';
import 'package:naji/features/specialist_chat_service/domain/repository/specialist_chat_service_repository.dart';
import 'package:naji/features/specialist_services/domain/entities/appointment_entiti.dart';

class SpecialistGetChatServiceSettingUsecase {
  final SpecialistChatServiceRepository specialistChatServiceRepository;

  SpecialistGetChatServiceSettingUsecase({
    required this.specialistChatServiceRepository,
  });
  Future<Either<Failures, SpecialistChatServiceSettingEntiti>> call() async {
    return specialistChatServiceRepository.getChatServiceSetting();
  }
}
