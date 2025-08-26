import 'package:dartz/dartz.dart';
import 'package:naji/core/errors/failures.dart';
import 'package:naji/features/auth/login/domain/entiti/user_entiti.dart';
import 'package:naji/features/auth/login/domain/repository/login_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LogInWithEmailAndPasswordUseCase {
  final LoginRepository loginRepository;

  LogInWithEmailAndPasswordUseCase({required this.loginRepository});
  Future<Either<Failures, AuthResponse>> call(UserEntiti userEntiti) async {
    return await loginRepository.logInWithEmailAndPassword(userEntiti);
  }
}
