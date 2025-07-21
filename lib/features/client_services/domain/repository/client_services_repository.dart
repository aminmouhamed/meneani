import 'package:dartz/dartz.dart';
import 'package:meneani/core/errors/failures.dart';
import 'package:meneani/features/client_services/domain/entities/appointment_entiti.dart';

abstract class ClientServicesRepository {
  Future<Either<Failures, List<AppointmentEntiti>>>
  getSpecialistAppointmentServices(String specialistType);
}
