import 'package:dartz/dartz.dart';
import 'package:naji/core/errors/failures.dart';
import 'package:naji/features/specialist_chat_service/domain/entiti/specialist_chat_service_setting_entiti.dart';

abstract class SpecialistChatServiceRepository {
  Future<Either<Failures, SpecialistChatServiceSettingEntiti>>
  specialistSetChatServiceSetting(bool state, String price);
  Future<Either<Failures, SpecialistChatServiceSettingEntiti>>
  getChatServiceSetting();
}
