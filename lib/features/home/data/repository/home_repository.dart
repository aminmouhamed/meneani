import 'package:dartz/dartz.dart';
import 'package:naji/core/errors/failures.dart';

import 'package:naji/features/home/data/models/get_client_appointment_model.dart';
import 'package:naji/features/home/data/services/home_service.dart';

import 'package:naji/features/home/domain/entiti/get_client_appointment_entiti.dart';
import 'package:naji/features/home/domain/repository/home_repository.dart';

class ImplHomeRepository implements HomeRepository {
  final HomeService homeService;

  ImplHomeRepository({required this.homeService});
  @override
  Future<Either<Failures, int>> getClientData() async {
    try {
      var data = await homeService.getUserData();

      return Future.value(right(1));
    } on Exception catch (e) {
      return Future.value(left(ServerFailure(errorMassege: e.toString())));
    }
  }

  @override
  Future<Either<Failures, List<GetClientAppointmentEntiti>>>
  getClientAppointment() async {
    try {
      var response = await homeService.getClientAppointment();
      List<GetClientAppointmentEntiti> appointmentEntiti = response.map((
        element,
      ) {
        GetClientAppointmentModel appointmentModel =
            GetClientAppointmentModel.fromJson(element);
        return appointmentModel.toEntiti();
      }).toList();
      if (appointmentEntiti.length == 0) {
        return Future.value(
          left(ServerFailure(errorMassege: "no data avalibel")),
        );
      }
      return Future.value(right(appointmentEntiti));
    } on Exception catch (e) {
      return Future.value(left(ServerFailure(errorMassege: e.toString())));
    }
  }

  @override
  Future<Either<Failures, int>> deleteCilentAppointment(int id) async {
    try {
      await homeService.deleteClientAppointment(id);
      return Future.value(right(1));
    } on Exception catch (e) {
      return Future.value(left(ServerFailure(errorMassege: e.toString())));
    }
  }
}
