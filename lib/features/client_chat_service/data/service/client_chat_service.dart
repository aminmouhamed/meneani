import 'package:supabase_flutter/supabase_flutter.dart';

class ClientChatService {
  final SupabaseClient _supabaseClient = Supabase.instance.client;
  Future<List<Map<String, dynamic>>> getSpecialistChatService(
    String specialistType,
  ) async {
    List<Map<String, dynamic>> response = await _supabaseClient
        .from("chat_service")
        .select(
          "specialistId , price ,specialist.uSpecialistType , specialist.uFName , specialist.uLName , specialist.image ",
        )
        .eq("specialist.uSpecialistType", specialistType)
        .eq("state", true);
    return response;
  }
}
