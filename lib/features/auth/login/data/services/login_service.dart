import 'package:dartz/dartz.dart';
import 'package:meneani/core/const/constent.dart';
import 'package:meneani/core/const/user_public_data.dart';
import 'package:meneani/features/auth/login/domain/entiti/user_entiti.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginService {
  final SupabaseClient _supabaseClient = Supabase.instance.client;
  UserPublicData userData = UserPublicData.instence;
  Future<AuthResponse> loginWithEmailAndPassword(UserEntiti userEntiti) async {
    AuthResponse response = await _supabaseClient.auth.signInWithPassword(
      password: userEntiti.password,
      email: userEntiti.email,
    );
    var uType = await _supabaseClient
        .from("user_type")
        .select("type")
        .eq("id", response.user!.id);
    await sharedPreferences!.setString("user_type", uType[0]["type"]);
    userData.UserType = uType[0]["type"];
    var data = await _supabaseClient
        .from(uType[0]["type"])
        .select("uFName , uLName ,image")
        .eq("id", response.user!.id);
    userData.insertUserData(
      fName: data[0]["uFName"],
      lName: data[0]["uLName"],
      image: data[0]["image"] != null ? data[0]["image"] : "",
    );

    return Future.value(response);
  }
}
