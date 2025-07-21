import 'package:dartz/dartz.dart';
import 'package:meneani/core/errors/failures.dart';
import 'package:meneani/features/client_services/data/model/appointment_model.dart';
import 'package:meneani/features/client_services/data/service/client_services_services.dart';
import 'package:meneani/features/client_services/domain/entities/appointment_entiti.dart';
import 'package:meneani/features/client_services/domain/repository/client_services_repository.dart';

class ImplClientServiceRepository implements ClientServicesRepository {
  final ClientServices clientServices;

  ImplClientServiceRepository({required this.clientServices});
  @override
  Future<Either<Failures, List<AppointmentEntiti>>>
  getSpecialistAppointmentServices(String specialistType) async {
    try {
      var response = await clientServices.getSpecialistAppointmentServices(
        specialistType,
      );
      if (response[0]["specialist"] != null) {
        List<AppointmentEntiti> _appointmentEntities = response.map((jsonData) {
          AppointmentModel _appointmentdata = AppointmentModel.fromJson(
            jsonData,
          );
          return _appointmentdata.toEntiti();
        }).toList();
        return Future.value(right(_appointmentEntities));
      }
      return Future.value(left(ServerFailure(errorMassege: "no data")));
    } on Exception catch (e) {
      return Future.value(left(ServerFailure(errorMassege: e.toString())));
    }
  }
}
