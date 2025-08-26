import 'package:dartz/dartz.dart';
import 'package:naji/core/errors/failures.dart';

import 'package:naji/features/specialist_services/domain/entities/client_appointment_entiti.dart';
import 'package:naji/features/specialist_services/domain/repository/specialis_appointment_service.dart';

class GetAppointmentListUsecase {
  final SpecialisServicesRepository specialisServicesRepository;

  GetAppointmentListUsecase({required this.specialisServicesRepository});
  Future<Either<Failures, List<ClientAppointmentEntiti>>> call(
    DateTime dateTime,
  ) {
    return specialisServicesRepository.getAppointmentList(dateTime);
  }
}
