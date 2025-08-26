import 'package:dartz/dartz.dart';
import 'package:naji/core/errors/failures.dart';
import 'package:naji/features/auth/login/domain/entiti/user_entiti.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class LoginRepository {
  Future<Either<Failures, AuthResponse>> logInWithEmailAndPassword(
    UserEntiti userEntiti,
  );
}
