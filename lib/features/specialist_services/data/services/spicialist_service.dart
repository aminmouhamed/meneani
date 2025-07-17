import 'package:meneani/features/specialist_services/domain/entities/appointment_entiti.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SpecialistService {
  SupabaseClient _supabase = Supabase.instance.client;
  Future<Map<String, dynamic>> setEppointmentService(
    AppointmentEntiti appointment,
  ) async {
    String uid = _supabase.auth.currentUser!.id;
    AuthResponse response = await _supabase.from("appointment_service").insert({
      "specialist_id": uid,
      "price": appointment.price,
      "description": "",
      "state": appointment.service_state,
    });
    return await getAppointmentService();
  }

  Future<Map<String, dynamic>> getAppointmentService() async {
    String uid = _supabase.auth.currentUser!.id;
    var response = await _supabase
        .from("appointment_service")
        .select(" price , description , state ")
        .eq("specialist_id", uid);
    return response[0];
  }
}
