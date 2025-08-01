import 'dart:ffi';

import 'package:supabase_flutter/supabase_flutter.dart';

class MessagingService {
  SupabaseClient _supabaseClient = Supabase.instance.client;

  Future<void> sendMessage({roomId, messege}) async {
    List<String> chatRoom = roomId.split("_");
    String reciverId = "";
    chatRoom.forEach((val) {
      if (val != _supabaseClient.auth.currentUser!.id) {
        reciverId = val;
      }
    });
    await _supabaseClient.from("chat_room_message").insert({
      "senderId": _supabaseClient.auth.currentUser!.id,
      "reciverId": reciverId,
      "room_id": roomId,
      "message": messege,
    });
  }
}
