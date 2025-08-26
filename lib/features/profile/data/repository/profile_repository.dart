import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:naji/core/errors/failures.dart';
import 'package:naji/features/profile/data/models/client_mode.dart';
import 'package:naji/features/profile/data/services/profile_services.dart';
import 'package:naji/features/profile/domain/entities/client_entiti.dart';
import 'package:naji/features/profile/domain/repository/profile_repository.dart';

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

  @override
  Future<Either<Failures, int>> setClientImageProfile(File image) async {
    try {
      var response = profileServices.setClientImageProfile(image);
      return Future.value(right(1));
    } on Exception catch (e) {
      return Future.value(left(ServerFailure(errorMassege: e.toString())));
    }
  }
}
