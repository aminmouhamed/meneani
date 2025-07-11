import 'package:dartz/dartz.dart';
import 'package:meneani/core/errors/failures.dart';
import 'package:meneani/features/home/data/models/client_mode.dart';
import 'package:meneani/features/home/data/services/home_service.dart';
import 'package:meneani/features/home/domain/entiti/client_entiti.dart';
import 'package:meneani/features/home/domain/repository/home_repository.dart';

class ImplHomeRepository implements HomeRepository {
  final HomeService homeService;

  ImplHomeRepository({required this.homeService});
  @override
  Future<Either<Failures, ClientEntiti>> getClientData() async {
    try {
      var data = await homeService.getUserData();
      ClientMode _clientModel = ClientMode.fromJson(data);
      return Future.value(right(_clientModel.toEntiti()));
    } on Exception catch (e) {
      return Future.value(left(ServerFailure(errorMassege: e.toString())));
    }
  }
}
