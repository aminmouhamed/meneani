import 'package:dartz/dartz.dart';
import 'package:naji/core/errors/failures.dart';
import 'package:naji/features/client_appointment_services/domain/entities/set_appointment_entiti.dart';
import 'package:naji/features/client_appointment_services/domain/repository/client_services_repository.dart';

class SetClientAppointmentUsecase {
  final ClientServicesRepository clientServicesRepository;

  SetClientAppointmentUsecase({required this.clientServicesRepository});

  Future<Either<Failures, int>> call(
    SetAppointmentEntiti appointmentEntiti,
  ) async {
    return await clientServicesRepository.setClientAppointment(
      appointmentEntiti,
    );
  }
}
