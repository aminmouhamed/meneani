import 'package:dartz/dartz.dart';
import 'package:naji/core/errors/failures.dart';
import 'package:naji/features/specialist_services/domain/entities/appointment_entiti.dart';
import 'package:naji/features/specialist_services/domain/repository/specialis_appointment_service.dart';

class GetAppointmentSetting {
  final SpecialisServicesRepository servicesRepository;

  GetAppointmentSetting({required this.servicesRepository});
  Future<Either<Failures, AppointmentEntiti>> call() async {
    return servicesRepository.GetAppointmentService();
  }
}
