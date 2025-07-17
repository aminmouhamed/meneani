import 'package:dartz/dartz.dart';
import 'package:meneani/core/errors/failures.dart';
import 'package:meneani/features/auth/signup/domain/entiti/client_entiti.dart';
import 'package:meneani/features/auth/signup/domain/entiti/specialist_entiti.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class CreateAccountRepository {
  Future<Either<Failures, AuthResponse>> createClientAccount(
    ClientEntiti clientEntiti,
  );
  Future<Either<Failures, AuthResponse>> createSpecialistAccount(
    SpecialistEntiti specialistEntiti,
  );
}
