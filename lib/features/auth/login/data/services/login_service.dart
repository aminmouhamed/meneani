import 'package:meneani/features/auth/login/domain/entiti/user_entiti.dart';
import 'package:meneani/features/auth/signin/domain/entiti/client_entiti.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginService {
  final SupabaseClient _supabaseClient = Supabase.instance.client;
  Future<AuthResponse> loginWithEmailAndPassword(UserEntiti userEntiti) async {
    AuthResponse response = await _supabaseClient.auth.signInWithPassword(
      password: userEntiti.password,
      email: userEntiti.email,
    );
    return Future.value(response);
  }
}
