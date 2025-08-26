import 'package:dartz/dartz.dart';
import 'package:naji/core/errors/failures.dart';
import 'package:naji/features/home/domain/entiti/get_client_appointment_entiti.dart';
import 'package:naji/features/home/domain/repository/home_repository.dart';

class GetClientAppointmentUseCase {
  final HomeRepository homeRepository;
  GetClientAppointmentUseCase({required this.homeRepository});
  Future<Either<Failures, List<GetClientAppointmentEntiti>>> call() async {
    return await homeRepository.getClientAppointment();
  }
}
