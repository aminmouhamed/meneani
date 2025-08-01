import 'package:supabase_flutter/supabase_flutter.dart';

class SpecialistChatService {
  final SupabaseClient _supabaseClient = Supabase.instance.client;

  Future<Map<String, dynamic>> setSpecialistChatServiceSetting(
    bool state,
    String price,
  ) async {
    await _supabaseClient
        .from("chat_service")
        .update({"state": state, "price": price})
        .eq("specialistid", _supabaseClient.auth.currentUser!.id);
    return await _getSpecialistChatServiceSetting();
  }

  Future<Map<String, dynamic>> _getSpecialistChatServiceSetting() async {
    var response = await _supabaseClient
        .from("chat_service")
        .select("state , price")
        .eq("specialistid", _supabaseClient.auth.currentUser!.id);
    return response[0];
  }

  Future<void> insertSpecialistChatServiceSetting() async {
    await _supabaseClient.from("chat_service").insert({
      "specialistid": _supabaseClient.auth.currentUser!.id,
      "state": false,
      "price": "0",
    });
  }
}
