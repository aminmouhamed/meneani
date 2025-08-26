import 'package:dartz/dartz.dart';
import 'package:naji/core/errors/failures.dart';
import 'package:naji/features/specialist_services/domain/entities/appointment_entiti.dart';
import 'package:naji/features/specialist_services/domain/repository/specialis_appointment_service.dart';

class UpdateAppointmentServiceUsecase {
  final SpecialisServicesRepository specialisAppointmentsRepository;

  UpdateAppointmentServiceUsecase({
    required this.specialisAppointmentsRepository,
  });
  Future<Either<Failures, AppointmentEntiti>> call(
    AppointmentEntiti appointment,
  ) {
    return specialisAppointmentsRepository.updateAppointmentService(
      appointment,
    );
  }
}
