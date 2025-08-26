import 'package:dartz/dartz.dart';
import 'package:naji/core/errors/failures.dart';

import 'package:naji/features/home/domain/entiti/client_entiti.dart';
import 'package:naji/features/home/domain/repository/home_repository.dart';

class GetClientDataUsecase {
  final HomeRepository homeRepository;
  GetClientDataUsecase({required this.homeRepository});
  Future<Either<Failures, int>> call() async {
    return await homeRepository.getClientData();
  }
}
