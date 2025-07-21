import 'package:supabase_flutter/supabase_flutter.dart';

class ClientServices {
  final SupabaseClient _supabaseClient = Supabase.instance.client;

  Future<List<Map<String, dynamic>>> getSpecialistAppointmentServices(
    String specialistType,
  ) async {
    var response = await _supabaseClient
        .from("appointment_service")
        .select(
          "price ,descriptions, specialist(uFName , uLName , image ,uSpecialistAddress , uSpecialistType)",
        )
        .eq("state", true)
        .eq("specialist.uSpecialistType", specialistType);

    return response;
  }
}
