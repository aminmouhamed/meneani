import 'dart:convert';

import 'package:meneani/features/specialist_chat_service/domain/entiti/specialist_chat_service_setting_entiti.dart';

class SpecialistChatServiceSettingModel {
  final bool state;
  final String price;

  SpecialistChatServiceSettingModel({required this.state, required this.price});
  factory SpecialistChatServiceSettingModel.fromJson(
    Map<String, dynamic> jsonData,
  ) {
    return SpecialistChatServiceSettingModel(
      state: jsonData["state"],
      price: jsonData["price"],
    );
  }
  SpecialistChatServiceSettingEntiti toEntiti() {
    return SpecialistChatServiceSettingEntiti(
      state: this.state,
      price: this.price,
    );
  }
}
