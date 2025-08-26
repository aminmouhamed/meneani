import 'package:dartz/dartz.dart';
import 'package:naji/core/errors/failures.dart';
import 'package:naji/features/specialist_services/domain/entities/appointment_entiti.dart';
import 'package:naji/features/specialist_services/domain/entities/client_appointment_entiti.dart';

abstract class SpecialisServicesRepository {
  Future<Either<Failures, AppointmentEntiti>> updateAppointmentService(
    AppointmentEntiti appointment,
  );
  Future<Either<Failures, AppointmentEntiti>> GetAppointmentService();

  Future<Either<Failures, List<ClientAppointmentEntiti>>> getAppointmentList(
    DateTime dateTime,
  );
}
