import 'package:dartz/dartz.dart';
import 'package:meneani/core/errors/failures.dart';
import 'package:meneani/features/specialist_services/domain/entities/appointment_entiti.dart';
import 'package:meneani/features/specialist_services/domain/repository/specialis_appointment_service.dart';

class GetAppointmentSetting {
  final SpecialisServicesRepository servicesRepository;

  GetAppointmentSetting({required this.servicesRepository});
  Future<Either<Failures, AppointmentEntiti>> call() async {
    return servicesRepository.GetAppointmentService();
  }
}
