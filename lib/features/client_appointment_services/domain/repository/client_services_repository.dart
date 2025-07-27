import 'package:dartz/dartz.dart';
import 'package:meneani/core/errors/failures.dart';
import 'package:meneani/features/client_appointment_services/domain/entities/appointment_entiti.dart';
import 'package:meneani/features/client_appointment_services/domain/entities/get_appointment_entiti.dart';
import 'package:meneani/features/client_appointment_services/domain/entities/set_appointment_entiti.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class ClientServicesRepository {
  Future<Either<Failures, List<AppointmentEntiti>>>
  getSpecialistAppointmentServices(String specialistType);

  Future<Either<Failures, int>> setClientAppointment(
    SetAppointmentEntiti appointmentEntiti,
  );

  Future<Either<Failures, List<GetAppointmentEntiti>>> getAppointmentOfService(
    int id,
    String date,
  );
  Future<Either<Failures, Stream>> getAppointmentOfServiceStream(
    int id,
    String date,
  );
}
