import 'package:naji/features/auth/signup/data/model/client_model.dart';
import 'package:naji/features/auth/signup/data/model/specialist_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CreateAccountService {
  final SupabaseClient _supabaseClient = Supabase.instance.client;
  Future<AuthResponse> createClientAccount(ClientModel clientmodel) async {
    var response = await _supabaseClient.auth.signUp(
      password: clientmodel.password,
      email: clientmodel.email,
      data: {"phone": "0558313593"},
    );

    var client = _supabaseClient.from("client");
    var type = _supabaseClient.from("user_type");
    var jsondata = clientmodel.toJson();
    jsondata["id"] = response.user!.id;
    await client.insert(jsondata);
    await type.insert({"id": response.user!.id, "type": "client"});
    await _supabaseClient.auth.signOut();
    return Future.value(response);
  }

  Future<AuthResponse> createSpecialistAccount(
    SpecialistModel specialistModel,
  ) async {
    var response = await _supabaseClient.auth.signUp(
      password: specialistModel.password,
      email: specialistModel.email,
    );
    var specialist = _supabaseClient.from("specialist");
    var type = _supabaseClient.from("user_type");
    var jsondata = specialistModel.toJson();
    jsondata["id"] = response.user!.id;
    await type.insert({"id": response.user!.id, "type": "specialist"});
    await specialist.insert(jsondata);
    await _supabaseClient.from("appointment_service").insert({
      "specialist_id": response.user!.id,
      "price": "0",
      "descriptions": "",
      "state": false,
    });
    await _supabaseClient.auth.signOut();
    return Future.value(response);
  }
}
