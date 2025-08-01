import 'package:supabase_flutter/supabase_flutter.dart';

class ClientChatService {
  final SupabaseClient _supabaseClient = Supabase.instance.client;
  Future<List<Map<String, dynamic>>> getSpecialistChatService(
    String specialistType,
  ) async {
    List<Map<String, dynamic>> response = await _supabaseClient
        .from("chat_service")
        .select(
          "specialistid , price ,specialist(uSpecialistType , uFName , uLName , image) ",
        )
        .eq("state", true)
        .eq("specialist.uSpecialistType", specialistType);

    return response.where((val) => val["specialist"] != null).toList();
  }

  Future<void> inserChatRoom(String specialistId) async {
    List<String> roomId = [specialistId, _supabaseClient.auth.currentUser!.id];
    roomId.sort();
    await _supabaseClient.from("chat_room").insert({
      "client_id": _supabaseClient.auth.currentUser!.id,
      "specialist_id": specialistId,
      "room_id": roomId.join("_"),
    });
  }

  Future<Map<String, dynamic>> selectChatRoom(String specialistId) async {
    List<String> roomId = [specialistId, _supabaseClient.auth.currentUser!.id];
    roomId.sort();
    var response = await _supabaseClient
        .from("chat_room")
        .select("room_id")
        .eq("room_id", roomId.join("_"));
    return response[0];
  }
}
