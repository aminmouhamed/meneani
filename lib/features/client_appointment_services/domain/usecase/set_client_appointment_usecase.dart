import 'package:dartz/dartz.dart';
import 'package:meneani/core/errors/failures.dart';
import 'package:meneani/features/client_appointment_services/domain/entities/set_appointment_entiti.dart';
import 'package:meneani/features/client_appointment_services/domain/repository/client_services_repository.dart';

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
