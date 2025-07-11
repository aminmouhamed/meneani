import 'package:dartz/dartz.dart';
import 'package:meneani/core/errors/failures.dart';
import 'package:meneani/features/client_profile/domain/entities/client_entiti.dart';

abstract class ProfileRepository {
  Future<Either<Failures, ClientEntiti>> getClientData();
}
