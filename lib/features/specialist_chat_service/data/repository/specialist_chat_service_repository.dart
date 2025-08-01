import 'package:dartz/dartz.dart';
import 'package:meneani/core/errors/failures.dart';

import 'package:meneani/features/specialist_chat_service/data/model/specialist_chat_service_setting_model.dart';
import 'package:meneani/features/specialist_chat_service/data/service/specialist_chat_service.dart';
import 'package:meneani/features/specialist_chat_service/domain/entiti/specialist_chat_service_setting_entiti.dart';
import 'package:meneani/features/specialist_chat_service/domain/repository/specialist_chat_service_repository.dart';

class ImplSpecialistChatServiceRepository
    implements SpecialistChatServiceRepository {
  final SpecialistChatService specialistChatService;

  ImplSpecialistChatServiceRepository({required this.specialistChatService});
  @override
  Future<Either<Failures, SpecialistChatServiceSettingEntiti>>
  specialistSetChatServiceSetting(bool state, String price) async {
    try {
      try {
        var response = await specialistChatService
            .setSpecialistChatServiceSetting(state, price);
        SpecialistChatServiceSettingModel specialistChat =
            SpecialistChatServiceSettingModel.fromJson(response);
        SpecialistChatServiceSettingEntiti specialistChatServiceSettingEntiti =
            specialistChat.toEntiti();
        return Future.value(right(specialistChatServiceSettingEntiti));
      } catch (e) {
        await specialistChatService.insertSpecialistChatServiceSetting();
        return await specialistSetChatServiceSetting(state, price);
      }
    } on Exception catch (e) {
      return Future.value(left(ServerFailure(errorMassege: e.toString())));
    }
  }
}
