import 'package:dartz/dartz.dart';
import 'package:meneani/core/errors/failures.dart';
import 'package:meneani/features/specialist_services/domain/entities/appointment_entiti.dart';

abstract class SpecialisServicesRepository {
  Future<Either<Failures, AppointmentEntiti>> updateAppointmentService(
    AppointmentEntiti appointment,
  );
  Future<Either<Failures, AppointmentEntiti>> GetAppointmentService();
}
