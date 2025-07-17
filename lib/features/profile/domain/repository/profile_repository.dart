import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:meneani/core/errors/failures.dart';
import 'package:meneani/features/profile/domain/entities/client_entiti.dart';

abstract class ProfileRepository {
  Future<Either<Failures, ClientEntiti>> getClientData();
  Future<Either<Failures, int>> setClientImageProfile(File image);
}
