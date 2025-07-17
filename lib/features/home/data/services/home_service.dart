import 'package:meneani/core/const/constent.dart';
import 'package:meneani/core/const/user_public_data.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeService {
  SupabaseClient _supabaseClient = Supabase.instance.client;
  UserPublicData _userData = UserPublicData.instence;
  Future<void> getUserData() async {
    if (_userData.userImage.isEmpty ||
        _userData.userfName.isEmpty ||
        _userData.userlName.isEmpty) {
      print("home service");
      String? userType = await sharedPreferences!.getString("user_type");
      Map<String, dynamic> result = {};
      late String uid = _supabaseClient.auth.currentUser!.id;
      var data = await _supabaseClient
          .from(userType!)
          .select("uFName , uLName , image")
          .eq("id", uid);
      result = data[0];
      _userData.insertUserData(
        fName: result["uFName"],
        lName: result["uLName"],
        image: result["image"],
      );
    }
  }
}
