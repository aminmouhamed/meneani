import 'package:dartz/dartz.dart';
import 'package:meneani/core/errors/failures.dart';
import 'package:meneani/features/home/domain/repository/home_repository.dart';

class DeleteClientAppointmentUseCase {
  final HomeRepository homeRepository;

  DeleteClientAppointmentUseCase({required this.homeRepository});

  Future<Either<Failures, int>> call(int id) async {
    return await homeRepository.deleteCilentAppointment(id);
  }
}
