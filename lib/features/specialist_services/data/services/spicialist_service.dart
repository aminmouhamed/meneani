import 'package:meneani/features/specialist_services/domain/entities/appointment_entiti.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SpecialistService {
  SupabaseClient _supabase = Supabase.instance.client;
  Future<Map<String, dynamic>> updateEppointmentService(
    AppointmentEntiti appointment,
  ) async {
    String uid = _supabase.auth.currentUser!.id;
    await _supabase
        .from("appointment_service")
        .update({
          "price": appointment.price,
          "descriptions": "",
          "state": appointment.service_state,
        })
        .eq("specialist_id", uid);
    return await getAppointmentService();
  }

  Future<Map<String, dynamic>> getAppointmentService() async {
    String uid = _supabase.auth.currentUser!.id;
    var response = await _supabase
        .from("appointment_service")
        .select(" price , descriptions , state ")
        .eq("specialist_id", uid);
    return response[0];
  }
}
