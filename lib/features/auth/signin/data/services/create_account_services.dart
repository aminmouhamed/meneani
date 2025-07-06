import 'package:meneani/features/auth/signin/data/model/client_model.dart';
import 'package:meneani/features/auth/signin/data/model/specialist_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CreateAccountService {
  final SupabaseClient _supabaseClient = Supabase.instance.client;
  Future<AuthResponse> createClientAccount(ClientModel clientmodel) async {
    var response = await _supabaseClient.auth.signUp(
      password: clientmodel.password,
      email: clientmodel.email,
    );
    var client = _supabaseClient.from("client");
    var jsondata = clientmodel.toJson();
    jsondata["id"] = response.user!.id;
    await client.insert(jsondata);
    return Future.value(response);
  }

  Future<AuthResponse> createSpecialistAccount(
    SpecialistModel specialistModel,
  ) async {
    var response = await _supabaseClient.auth.signUp(
      password: specialistModel.password,
      email: specialistModel.email,
    );
    var client = _supabaseClient.from("client");
    var jsondata = specialistModel.toJson();
    jsondata["id"] = response.user!.id;
    await client.insert(jsondata);
    return Future.value(response);
  }
}
