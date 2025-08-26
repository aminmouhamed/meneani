import 'package:dartz/dartz.dart';
import 'package:naji/core/errors/failures.dart';
import 'package:naji/features/specialist_services/data/models/appointment_model.dart';
import 'package:naji/features/specialist_services/data/models/client_appointment_model.dart';
import 'package:naji/features/specialist_services/data/services/spicialist_service.dart';
import 'package:naji/features/specialist_services/domain/entities/appointment_entiti.dart';
import 'package:naji/features/specialist_services/domain/entities/client_appointment_entiti.dart';
import 'package:naji/features/specialist_services/domain/repository/specialis_appointment_service.dart';

class ImplSpecialistServicesRepository implements SpecialisServicesRepository {
  final SpecialistService specialistService;

  ImplSpecialistServicesRepository({required this.specialistService});
  @override
  Future<Either<Failures, AppointmentEntiti>> updateAppointmentService(
    AppointmentEntiti appointment,
  ) async {
    try {
      AppointmentModel _appointmentModel = AppointmentModel.fromJson(
        await specialistService.updateEppointmentService(appointment),
      );
      AppointmentEntiti _appointmentEntiti = _appointmentModel.toEntiti();
      return Future.value(right(_appointmentEntiti));
    } on Exception catch (e) {
      return Future.value(left(ServerFailure(errorMassege: e.toString())));
    }
  }

  @override
  Future<Either<Failures, AppointmentEntiti>> GetAppointmentService() async {
    try {
      AppointmentModel _appointmentModel = AppointmentModel.fromJson(
        await specialistService.getAppointmentService(),
      );
      AppointmentEntiti _appointmentEntiti = _appointmentModel.toEntiti();
      return Future.value(right(_appointmentEntiti));
    } on Exception catch (e) {
      return Future.value(left(ServerFailure(errorMassege: e.toString())));
    }
  }

  @override
  Future<Either<Failures, List<ClientAppointmentEntiti>>> getAppointmentList(
    DateTime dateTime,
  ) async {
    try {
      var response = await specialistService.getAppointmentsList(dateTime);
      List<ClientAppointmentEntiti> appointmentEntiti = response.map((element) {
        ClientAppointmentModel appointmentModel =
            ClientAppointmentModel.fromJson(element);
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
}
