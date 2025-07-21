import 'dart:io';

import 'package:meneani/core/const/user_public_data.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileServices {
  SupabaseClient _supabaseClient = Supabase.instance.client;
  UserPublicData userData = UserPublicData.instence;
  Future<Map<dynamic, dynamic>> getUserData() async {
    Map<String, dynamic> result = {};
    late String uid = _supabaseClient.auth.currentUser!.id;

    var data = await _supabaseClient
        .from(userData.UserType)
        .select("uFName , uLName , image")
        .eq("id", uid);

    result = data[0];

    return result;
  }

  Future<void> setClientImageProfile(File image) async {
    String uid = _supabaseClient.auth.currentUser!.id;
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    String path = "images/${fileName}";
    await _supabaseClient.storage.from("users").upload(path, image);
    String? publicUrl = await _supabaseClient.storage
        .from("users")
        .getPublicUrl(path);
    var response = await _supabaseClient
        .from(userData.UserType)
        .update({"image": publicUrl})
        .eq("id", uid);
    userData.userImage = publicUrl;
  }
}
