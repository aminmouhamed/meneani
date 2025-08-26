import 'package:dartz/dartz.dart';
import 'package:naji/core/const/constent.dart';
import 'package:naji/core/const/user_public_data.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeService {
  SupabaseClient _supabaseClient = Supabase.instance.client;
  UserPublicData _userData = UserPublicData.instence;
  Future<void> getUserData() async {
    if (_userData.userImage.isEmpty ||
        _userData.userfName.isEmpty ||
        _userData.userlName.isEmpty) {
      String? userType = await sharedPreferences!.getString("user_type");
      // Map<String, dynamic> result = {};
      // late String uid = _supabaseClient.auth.currentUser!.id;
      // var data = await _supabaseClient
      //     .from(userType!)
      //     .select("uFName , uLName , image")
      //     .eq("id", uid);
      // result = data[0];
      _userData.UserType = userType!;
      _userData.insertUserData(
        fName: await sharedPreferences!.getString("uFName")!,
        lName: await sharedPreferences!.getString("uLName")!,
        image: await sharedPreferences!.getString("image")!,
      );
    }
  }

  Future<List<Map<String, dynamic>>> getClientAppointment() async {
    var response = await _supabaseClient
        .from("appointment")
        .select(
          "id, appointment_date , specialist(uFName , uLName ,uSpecialistType , uSpecialistAddress , image)",
        )
        .eq("client_id", _supabaseClient.auth.currentUser!.id);
    return response;
  }

  Future<void> deleteClientAppointment(int id) async {
    await _supabaseClient.from("appointment").delete().eq("id", id);
  }
}
