import 'package:dartz/dartz.dart';
import 'package:meneani/core/errors/failures.dart';
import 'package:meneani/features/auth/login/domain/entiti/user_entiti.dart';
import 'package:meneani/features/home/domain/entiti/client_entiti.dart';
import 'package:meneani/features/home/domain/entiti/get_client_appointment_entiti.dart';

abstract class HomeRepository {
  Future<Either<Failures, int>> getClientData();

  Future<Either<Failures, List<GetClientAppointmentEntiti>>>
  getClientAppointment();
  Future<Either<Failures, int>> deleteCilentAppointment(int id);
}
