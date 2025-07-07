import 'package:dartz/dartz.dart';
import 'package:meneani/core/errors/failures.dart';
import 'package:meneani/features/auth/login/domain/entiti/user_entiti.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class LoginRepository {
  Future<Either<Failures, AuthResponse>> logInWithEmailAndPassword(
    UserEntiti userEntiti,
  );
}
