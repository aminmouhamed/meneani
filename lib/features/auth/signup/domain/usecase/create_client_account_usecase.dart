import 'package:dartz/dartz.dart';
import 'package:meneani/core/errors/failures.dart';
import 'package:meneani/features/auth/signup/domain/entiti/client_entiti.dart';
import 'package:meneani/features/auth/signup/domain/repository/create_account_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CreateClientAccountUseCase {
  final CreateAccountRepository createAccountRepository;

  CreateClientAccountUseCase({required this.createAccountRepository});
  Future<Either<Failures, AuthResponse>> call(ClientEntiti clientEntiti) async {
    return await createAccountRepository.createClientAccount(clientEntiti);
  }
}
