import 'package:dartz/dartz.dart';
import 'package:meneani/core/errors/failures.dart';

import 'package:meneani/features/home/domain/entiti/client_entiti.dart';
import 'package:meneani/features/home/domain/repository/home_repository.dart';

class GetClientDataUsecase {
  final HomeRepository homeRepository;
  GetClientDataUsecase({required this.homeRepository});
  Future<Either<Failures, int>> call() async {
    return await homeRepository.getClientData();
  }
}
