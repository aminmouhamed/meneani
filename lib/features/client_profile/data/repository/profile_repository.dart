import 'package:dartz/dartz.dart';
import 'package:meneani/core/errors/failures.dart';
import 'package:meneani/features/client_profile/domain/entities/client_entiti.dart';
import 'package:meneani/features/client_profile/domain/repository/profile_repository.dart';

class ImolProfileRepository implements ProfileRepository {
  @override
  Future<Either<Failures, ClientEntiti>> getClientData() {
    // TODO: implement getClientData
    throw UnimplementedError();
  }
}
