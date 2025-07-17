import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:meneani/core/errors/failures.dart';
import 'package:meneani/features/profile/domain/repository/profile_repository.dart';

class SetClientImageProfileUseCase {
  final ProfileRepository profileRepository;
  SetClientImageProfileUseCase({required this.profileRepository});
  Future<Either<Failures, int>> call(File image) async {
    return await profileRepository.setClientImageProfile(image);
  }
}
