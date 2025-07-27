import 'package:meneani/features/client_appointment_services/domain/entities/set_appointment_entiti.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ClientServices {
  final SupabaseClient _supabaseClient = Supabase.instance.client;

  Future<List<Map<String, dynamic>>> getSpecialistAppointmentServices(
    String specialistType,
  ) async {
    var response = await _supabaseClient
        .from("appointment_service")
        .select(
          "price ,descriptions,id,specialist_id, specialist(uFName , uLName , image ,uSpecialistAddress , uSpecialistType)",
        )
        .eq("state", true)
        .eq("specialist.uSpecialistType", specialistType);

    return response.where((val) => val["specialist"] != null).toList();
  }

  Future<void> setClientAppointment(
    SetAppointmentEntiti appointmentEntiti,
  ) async {
    await _supabaseClient.from("appointment").insert({
      "specialis_id": appointmentEntiti.specialistId,
      "client_id": _supabaseClient.auth.currentUser!.id,
      "appointment_date": appointmentEntiti.appointmentDateTime.toString(),
      "appointmen_id": appointmentEntiti.id,
    });
  }

  Future<List<Map<String, dynamic>>> getAppointmentOfService(
    int id,
    String date,
  ) async {
    return await _supabaseClient
        .from("appointment")
        .select("appointment_date")
        .eq("appointmen_id", id)
        .gte("appointment_date", date);
  }

  Stream getAppointmentOfServiceStraem(int id, String date) {
    final stream = _supabaseClient
        .from("appointment")
        .stream(primaryKey: ["id"])
        .eq("appointmen_id", id);
    return stream;
  }
}
