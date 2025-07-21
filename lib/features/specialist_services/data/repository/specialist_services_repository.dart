import 'package:dartz/dartz.dart';
import 'package:meneani/core/errors/failures.dart';
import 'package:meneani/features/specialist_services/data/models/appointment_model.dart';
import 'package:meneani/features/specialist_services/data/services/spicialist_service.dart';
import 'package:meneani/features/specialist_services/domain/entities/appointment_entiti.dart';
import 'package:meneani/features/specialist_services/domain/repository/specialis_appointment_service.dart';

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
}
