import 'package:naji/core/const/user_public_data.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ChatRoomsService {
  final SupabaseClient _supabaseClient = Supabase.instance.client;
  final UserPublicData _userData = UserPublicData.instence;
  Future<List<Map<String, dynamic>>> getChatRooms() async {
    String userType = _userData.UserType == "client" ? "specialist" : "client";
    var response = _supabaseClient
        .from("chat_room")
        .select("room_id ,${userType}(uFName , uLName , image , id)")
        .eq("${_userData.UserType}_id", _supabaseClient.auth.currentUser!.id);
    return response;
  }
}
