import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileServices {
  SupabaseClient _supabaseClient = Supabase.instance.client;
  Future<Map<dynamic, dynamic>> getUserData() async {
    Map<String, dynamic> result = {};
    late String uid = _supabaseClient.auth.currentUser!.id;

    var data = await _supabaseClient
        .from("client")
        .select("uFName , uLName")
        .eq("id", uid);

    result = data[0];

    return result;
  }
}
