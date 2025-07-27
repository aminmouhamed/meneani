import 'package:dartz/dartz.dart';
import 'package:meneani/core/errors/failures.dart';
import 'package:meneani/features/client_appointment_services/domain/entities/appointment_entiti.dart';
import 'package:meneani/features/client_appointment_services/domain/repository/client_services_repository.dart';

class GetSpecialistEppointmentServicesUsecase {
  final ClientServicesRepository clientServicesRepository;

  GetSpecialistEppointmentServicesUsecase({
    required this.clientServicesRepository,
  });
  Future<Either<Failures, List<AppointmentEntiti>>> call(
    String specialistType,
  ) {
    return clientServicesRepository.getSpecialistAppointmentServices(
      specialistType,
    );
  }
}
