import 'package:dartz/dartz.dart';
import 'package:meneani/core/errors/failures.dart';
import 'package:meneani/features/auth/signin/data/model/client_model.dart';
import 'package:meneani/features/auth/signin/data/model/specialist_model.dart';
import 'package:meneani/features/auth/signin/data/services/create_account_services.dart';
import 'package:meneani/features/auth/signin/domain/entiti/client_entiti.dart';
import 'package:meneani/features/auth/signin/domain/entiti/specialist_entiti.dart';
import 'package:meneani/features/auth/signin/domain/repository/create_account_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ImplCreateAccountRepository implements CreateAccountRepository {
  final CreateAccountService createAccountService;

  ImplCreateAccountRepository({required this.createAccountService});
  @override
  Future<Either<Failures, AuthResponse>> createClientAccount(
    ClientEntiti clientEntiti,
  ) async {
    try {
      var response = await createAccountService.createClientAccount(
        ClientModel.fromEntiti(clientEntiti),
      );
      return Future.value(right(response));
    } on AuthApiException catch (e) {
      return Future.value(left(ServerFailure(errorMassege: e.message)));
    }
  }

  @override
  Future<Either<Failures, AuthResponse>> createSpecialistAccount(
    SpecialistEntiti specialistEntiti,
  ) async {
    try {
      var response = await createAccountService.createSpecialistAccount(
        SpecialistModel.fromEntiti(specialistEntiti),
      );
      return Future.value(right(response));
    } on AuthApiException catch (e) {
      return Future.value(left(ServerFailure(errorMassege: e.message)));
    }
  }
}
