import 'package:dartz/dartz.dart';
import 'package:gotrue/src/types/auth_response.dart';
import 'package:meneani/core/errors/failures.dart';
import 'package:meneani/features/auth/login/data/services/login_service.dart';
import 'package:meneani/features/auth/login/domain/entiti/user_entiti.dart';
import 'package:meneani/features/auth/login/domain/repository/login_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ImplLoginRepository extends LoginRepository {
  final LoginService loginService;

  ImplLoginRepository({required this.loginService});
  @override
  Future<Either<Failures, AuthResponse>> logInWithEmailAndPassword(
    UserEntiti userEntiti,
  ) async {
    try {
      AuthResponse response = await loginService.loginWithEmailAndPassword(
        userEntiti,
      );
      return Future.value(right(response));
    } on AuthApiException catch (e) {
      print(e);
      return left(ServerFailure(errorMassege: e.message));
    }
  }
}
