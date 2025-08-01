import 'package:dartz/dartz.dart';
import 'package:meneani/core/errors/failures.dart';
import 'package:meneani/features/specialist_chat_service/domain/entiti/specialist_chat_service_setting_entiti.dart';

abstract class SpecialistChatServiceRepository {
  Future<Either<Failures, SpecialistChatServiceSettingEntiti>>
  specialistSetChatServiceSetting(bool state, String price);
}
