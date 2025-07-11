import 'package:dartz/dartz.dart';
import 'package:meneani/core/errors/failures.dart';
import 'package:meneani/features/client_profile/data/models/client_mode.dart';
import 'package:meneani/features/client_profile/data/services/profile_services.dart';
import 'package:meneani/features/client_profile/domain/entities/client_entiti.dart';
import 'package:meneani/features/client_profile/domain/repository/profile_repository.dart';

class ImplProfileRepository implements ProfileRepository {
  final ProfileServices profileServices;

  ImplProfileRepository({required this.profileServices});
  @override
  Future<Either<Failures, ClientEntiti>> getClientData() async {
    try {
      var data = await profileServices.getUserData();
      ClientMode _clientModel = ClientMode.fromJson(data);
      return Future.value(right(_clientModel.toEntiti()));
    } on Exception catch (e) {
      return Future.value(left(ServerFailure(errorMassege: e.toString())));
    }
  }
}
