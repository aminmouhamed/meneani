import 'package:dartz/dartz.dart';
import 'package:meneani/core/errors/failures.dart';
import 'package:meneani/features/auth/signup/domain/entiti/specialist_entiti.dart';
import 'package:meneani/features/auth/signup/domain/repository/create_account_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CreateSpecialistAccountUsecase {
  final CreateAccountRepository createAccountRepository;

  CreateSpecialistAccountUsecase({required this.createAccountRepository});

  Future<Either<Failures, AuthResponse>> call(
    SpecialistEntiti specialistEntiti,
  ) {
    return createAccountRepository.createSpecialistAccount(specialistEntiti);
  }
}
