import 'package:dartz/dartz.dart';
import 'package:naji/core/errors/failures.dart';
import 'package:naji/features/client_appointment_services/data/model/appointment_model.dart';
import 'package:naji/features/client_appointment_services/data/service/client_services_services.dart';
import 'package:naji/features/client_appointment_services/domain/entities/appointment_entiti.dart';
import 'package:naji/features/client_appointment_services/domain/entities/get_appointment_entiti.dart';
import 'package:naji/features/client_appointment_services/domain/entities/set_appointment_entiti.dart';
import 'package:naji/features/client_appointment_services/domain/repository/client_services_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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

      if (response.length != 0) {
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

  @override
  Future<Either<Failures, int>> setClientAppointment(
    SetAppointmentEntiti appointmentEntiti,
  ) async {
    try {
      await clientServices.setClientAppointment(appointmentEntiti);
      return Future.value(right(1));
    } on Exception catch (e) {
      return Future.value(left(ServerFailure(errorMassege: e.toString())));
    }
  }

  @override
  Future<Either<Failures, List<GetAppointmentEntiti>>> getAppointmentOfService(
    int id,
    String date,
  ) async {
    try {
      var response = await clientServices.getAppointmentOfService(id, date);

      List<GetAppointmentEntiti> data = response.map((element) {
        DateTime dateTime = DateTime.parse(
          element["appointment_date"].toString(),
        );
        return GetAppointmentEntiti(
          time: "${dateTime.hour}:${dateTime.minute}",
          date: "${dateTime.day}/${dateTime.month}/${dateTime.year}",
        );
      }).toList();
      if (data.length == 0) {
        return Future.value(
          left(ServerFailure(errorMassege: "no data evalibel")),
        );
      }
      return Future.value(right(data));
    } on Exception catch (e) {
      return Future.value(left(ServerFailure(errorMassege: e.toString())));
    }
  }

  @override
  Future<Either<Failures, Stream>> getAppointmentOfServiceStream(
    int id,
    String date,
  ) async {
    try {
      final response = await clientServices.getAppointmentOfServiceStraem(
        id,
        date,
      );

      return Future.value(right(response));
    } on Exception catch (e) {
      return Future.value(left(ServerFailure(errorMassege: e.toString())));
    }
  }
}
