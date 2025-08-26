import 'package:dartz/dartz.dart';
import 'package:naji/core/errors/failures.dart';
import 'package:naji/features/profile/domain/entities/client_entiti.dart';
import 'package:naji/features/profile/domain/repository/profile_repository.dart';

class GetProfileDataUsecase {
  final ProfileRepository profileRepository;

  GetProfileDataUsecase({required this.profileRepository});
  Future<Either<Failures, ClientEntiti>> call() async {
    return await profileRepository.getClientData();
  }
}
