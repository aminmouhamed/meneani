import 'package:dartz/dartz.dart';
import 'package:naji/core/errors/failures.dart';
import 'package:naji/features/client_appointment_services/domain/entities/get_appointment_entiti.dart';
import 'package:naji/features/client_appointment_services/domain/repository/client_services_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GetAppointmentOfServiceUsecase {
  final ClientServicesRepository clientServicesRepository;

  GetAppointmentOfServiceUsecase({required this.clientServicesRepository});
  Future<Either<Failures, Stream>> call(int id, String date) async {
    return await clientServicesRepository.getAppointmentOfServiceStream(
      id,
      date,
    );
  }
}
