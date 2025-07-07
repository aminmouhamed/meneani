import 'package:dartz/dartz.dart';
import 'package:meneani/core/errors/failures.dart';
import 'package:meneani/features/auth/login/domain/entiti/user_entiti.dart';
import 'package:meneani/features/auth/login/domain/repository/login_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LogInWithEmailAndPasswordUseCase {
  final LoginRepository loginRepository;

  LogInWithEmailAndPasswordUseCase({required this.loginRepository});
  Future<Either<Failures, AuthResponse>> call(UserEntiti userEntiti) async {
    return await loginRepository.logInWithEmailAndPassword(userEntiti);
  }
}
