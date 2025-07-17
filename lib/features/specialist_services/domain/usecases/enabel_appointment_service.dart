import 'package:dartz/dartz.dart';
import 'package:meneani/core/errors/failures.dart';
import 'package:meneani/features/specialist_services/domain/entities/appointment_entiti.dart';
import 'package:meneani/features/specialist_services/domain/repository/specialis_appointment_service.dart';

class EnabelAppointmentServiceUsecase {
  final SpecialisServicesRepository specialisAppointmentsRepository;

  EnabelAppointmentServiceUsecase({
    required this.specialisAppointmentsRepository,
  });
  Future<Either<Failures, AppointmentEntiti>> call(
    AppointmentEntiti appointment,
  ) {
    return specialisAppointmentsRepository.enabelAppointmentService(
      appointment,
    );
  }
}
