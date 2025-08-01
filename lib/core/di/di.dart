import 'package:get_it/get_it.dart';
import 'package:meneani/features/auth/login/data/repository/login_repository.dart';
import 'package:meneani/features/auth/login/data/services/login_service.dart';
import 'package:meneani/features/auth/login/domain/repository/login_repository.dart';
import 'package:meneani/features/auth/login/domain/usecase/lognin_with_email_and_password_usecase.dart';
import 'package:meneani/features/auth/login/ui/bloc/bloc/login_bloc.dart';
import 'package:meneani/features/auth/signup/data/repository/create_account_repository.dart';
import 'package:meneani/features/auth/signup/data/services/create_account_services.dart';
import 'package:meneani/features/auth/signup/domain/repository/create_account_repository.dart';
import 'package:meneani/features/auth/signup/domain/usecase/create_client_account_usecase.dart';
import 'package:meneani/features/auth/signup/domain/usecase/create_specialist_account_usecase.dart';
import 'package:meneani/features/auth/signup/ui/bloc/create_account_bloc.dart';
import 'package:meneani/features/chat_room/data/repository/chat_rooms_repository.dart';
import 'package:meneani/features/chat_room/data/service/chat_rooms_service.dart';
import 'package:meneani/features/chat_room/domain/repository/chat_rooms_repository.dart';
import 'package:meneani/features/chat_room/domain/usecase/get_chat_rooms_usecase.dart';
import 'package:meneani/features/chat_room/ui/bloc/chat_rooms_bloc.dart';
import 'package:meneani/features/client_appointment_services/data/repository/client_service_repository.dart';
import 'package:meneani/features/client_appointment_services/data/service/client_services_services.dart';
import 'package:meneani/features/client_appointment_services/domain/repository/client_services_repository.dart';
import 'package:meneani/features/client_appointment_services/domain/usecase/get_appointment_of_service_usecase.dart';
import 'package:meneani/features/client_appointment_services/domain/usecase/get_specialist_eppointment_services.dart';
import 'package:meneani/features/client_appointment_services/domain/usecase/set_client_appointment_usecase.dart';
import 'package:meneani/features/client_appointment_services/ui/bloc/client_service_bloc.dart';
import 'package:meneani/features/client_chat_service/data/repository/client_chat_service_repository.dart';
import 'package:meneani/features/client_chat_service/data/service/client_chat_service.dart';
import 'package:meneani/features/client_chat_service/domain/repository/client_chat_service_repository.dart';
import 'package:meneani/features/client_chat_service/domain/usecase/get_specialist_chat_service_usecase.dart';
import 'package:meneani/features/client_chat_service/domain/usecase/insert_chat_room_usecase.dart';
import 'package:meneani/features/client_chat_service/ui/bloc/client_chat_services_bloc/client_chat_bloc.dart';
import 'package:meneani/features/home/domain/usecase/delete_client_appointment.dart';
import 'package:meneani/features/home/domain/usecase/get_client_appointment.dart';
import 'package:meneani/features/home/ui/bloc/home_service_bloc.dart';
import 'package:meneani/features/messaging/data/repository/messaging_service-repository.dart';
import 'package:meneani/features/messaging/data/service/Messaging_service.dart';
import 'package:meneani/features/messaging/domain/repository/messaging_service_repository.dart';
import 'package:meneani/features/messaging/domain/usecase/send_message_usecase.dart';
import 'package:meneani/features/messaging/ui/bloc/messaging_service_bloc.dart';
import 'package:meneani/features/profile/data/repository/profile_repository.dart';
import 'package:meneani/features/profile/data/services/profile_services.dart';
import 'package:meneani/features/profile/domain/repository/profile_repository.dart';
import 'package:meneani/features/profile/domain/usecase/Get_Profile_data.dart';
import 'package:meneani/features/profile/ui/bloc/profile_bloc.dart';
import 'package:meneani/features/home/data/repository/home_repository.dart';
import 'package:meneani/features/home/data/services/home_service.dart';
import 'package:meneani/features/home/domain/repository/home_repository.dart';
import 'package:meneani/features/home/domain/usecase/get_client_data_usecase.dart';
import 'package:meneani/features/home/ui/bloc/bloc/home_bloc.dart';
import 'package:meneani/features/specialist_chat_service/data/repository/specialist_chat_service_repository.dart';
import 'package:meneani/features/specialist_chat_service/data/service/specialist_chat_service.dart';
import 'package:meneani/features/specialist_chat_service/domain/repository/specialist_chat_service_repository.dart';
import 'package:meneani/features/specialist_chat_service/domain/usecase/specialist_set_chat_service_usecase.dart';
import 'package:meneani/features/specialist_chat_service/ui/bloc/specialist_chat_service_bloc.dart';
import 'package:meneani/features/specialist_services/data/repository/specialist_services_repository.dart';
import 'package:meneani/features/specialist_services/data/services/spicialist_service.dart';
import 'package:meneani/features/specialist_services/domain/repository/specialis_appointment_service.dart';
import 'package:meneani/features/specialist_services/domain/usecases/enabel_appointment_service.dart';
import 'package:meneani/features/specialist_services/domain/usecases/get_appointment_setting.dart';
import 'package:meneani/features/specialist_services/ui/bloc/specialist_services_bloc.dart';

GetIt getIT = GetIt.instance;

Future<void> init() async {
  //! Create Account featur

  //! Bloc
  getIT.registerFactory(() => CreateAccountBloc(getIT()));
  //! UseCase
  getIT.registerLazySingleton(
    () => CreateClientAccountUseCase(createAccountRepository: getIT()),
  );
  getIT.registerLazySingleton(
    () => CreateSpecialistAccountUsecase(createAccountRepository: getIT()),
  );
  //! Repository
  getIT.registerLazySingleton<CreateAccountRepository>(
    () => ImplCreateAccountRepository(createAccountService: getIT()),
  );
  //!Services
  getIT.registerLazySingleton(() => CreateAccountService());

  //----------------------------------------------------------------------------
  //! Login

  //!bloc
  getIT.registerFactory(() => LoginBloc(loginRepository: getIT()));

  //!Usecase

  getIT.registerLazySingleton(
    () => LogInWithEmailAndPasswordUseCase(loginRepository: getIT()),
  );

  //!Repository
  getIT.registerLazySingleton<LoginRepository>(
    () => ImplLoginRepository(loginService: getIT()),
  );

  //!Services

  getIT.registerLazySingleton(() => LoginService());

  //----------------------------------------------------------------------------

  //!Home
  //! bloc

  getIT.registerFactory(() => HomeBloc(getClientDataUsecase: getIT()));
  getIT.registerFactory(
    () => HomeServiceBloc(
      getClientAppointmentUseCase: getIT(),
      deleteClientAppointmentUseCase: getIT(),
    ),
  );
  //! usecases

  getIT.registerLazySingleton(
    () => GetClientDataUsecase(homeRepository: getIT()),
  );
  getIT.registerLazySingleton(
    () => GetClientAppointmentUseCase(homeRepository: getIT()),
  );
  getIT.registerLazySingleton(
    () => DeleteClientAppointmentUseCase(homeRepository: getIT()),
  );
  //! repository

  getIT.registerLazySingleton<HomeRepository>(
    () => ImplHomeRepository(homeService: getIT()),
  );
  //! sevices

  getIT.registerLazySingleton(() => HomeService());

  //----------------------------------------------------------------------------

  //!Profile
  //!Bloc
  getIT.registerFactory(() => ProfileBloc(profileRepository: getIT()));

  //!UseCase
  getIT.registerLazySingleton(
    () => GetProfileDataUsecase(profileRepository: getIT()),
  );

  //!Repository

  getIT.registerLazySingleton<ProfileRepository>(
    () => ImplProfileRepository(profileServices: getIT()),
  );

  //!Services
  getIT.registerLazySingleton(() => ProfileServices());

  //----------------------------------------------------------------------------

  //!Specialist_services
  //!Bloc
  getIT.registerFactory(
    () => SpecialistServicesBloc(
      getAppointmentSetting: getIT(),
      updateAppointmentService: getIT(),
    ),
  );

  //!UseCase
  getIT.registerLazySingleton(
    () => GetAppointmentSetting(servicesRepository: getIT()),
  );
  getIT.registerLazySingleton(
    () => UpdateAppointmentServiceUsecase(
      specialisAppointmentsRepository: getIT(),
    ),
  );

  //!Repository

  getIT.registerLazySingleton<SpecialisServicesRepository>(
    () => ImplSpecialistServicesRepository(specialistService: getIT()),
  );

  //!Services
  getIT.registerLazySingleton(() => SpecialistService());

  //----------------------------------------------------------------------------
  //!Specialist_chat_services
  //!Bloc
  getIT.registerFactory(
    () => SpecialistChatServiceBloc(specialistSetChatServiceUsecase: getIT()),
  );

  //!UseCase
  getIT.registerLazySingleton(
    () => SpecialistSetChatServiceUsecase(
      specialistChatServiceRepository: getIT(),
    ),
  );

  //!Repository

  getIT.registerLazySingleton<SpecialistChatServiceRepository>(
    () => ImplSpecialistChatServiceRepository(specialistChatService: getIT()),
  );

  //!Services
  getIT.registerLazySingleton(() => SpecialistChatService());

  //----------------------------------------------------------------------------
  //!Client_appointment_services
  //!Bloc
  getIT.registerFactory(
    () => ClientServiceBloc(
      getSpecialistEppointmentServices: getIT(),
      setClientAppointmentUsecase: getIT(),
      getAppointmentOfServiceUsecase: getIT(),
    ),
  );

  //!UseCase
  getIT.registerLazySingleton(
    () => GetSpecialistEppointmentServicesUsecase(
      clientServicesRepository: getIT(),
    ),
  );
  getIT.registerLazySingleton(
    () => SetClientAppointmentUsecase(clientServicesRepository: getIT()),
  );
  getIT.registerLazySingleton(
    () => GetAppointmentOfServiceUsecase(clientServicesRepository: getIT()),
  );
  //!Repository

  getIT.registerLazySingleton<ClientServicesRepository>(
    () => ImplClientServiceRepository(clientServices: getIT()),
  );

  //!Services
  getIT.registerLazySingleton(() => ClientServices());

  //----------------------------------------------------------------------------
  //!Client_chat_services
  //!Bloc
  getIT.registerFactory(
    () => ClientChatBloc(
      getSpecialistChatServiceUsecase: getIT(),
      insertChatRoomUsecase: getIT(),
    ),
  );

  //!UseCase
  getIT.registerLazySingleton(
    () => GetSpecialistChatServiceUsecase(clientChatServiceRepository: getIT()),
  );
  getIT.registerLazySingleton(
    () => InsertChatRoomUsecase(clientChatServiceRepository: getIT()),
  );

  //!Repository

  getIT.registerLazySingleton<ClientChatServiceRepository>(
    () => ImplClientChatServiceRepository(clientChatService: getIT()),
  );

  //!Services
  getIT.registerLazySingleton(() => ClientChatService());

  //----------------------------------------------------------------------------
  //!Messaging_services
  //!Bloc
  getIT.registerFactory(
    () => MessagingServiceBloc(sendMessageUsecase: getIT()),
  );

  //!UseCase
  getIT.registerLazySingleton(
    () => SendMessageUsecase(messagingServiceRepository: getIT()),
  );
  //!Repository
  getIT.registerLazySingleton<MessagingServiceRepository>(
    () => ImplMessagingServiceRepository(messagingService: getIT()),
  );
  //!Services
  getIT.registerLazySingleton(() => MessagingService());

  //!Chat_room
  //!Bloc
  getIT.registerFactory(() => ChatRoomsBloc(getChatRoomsUsecase: getIT()));

  //!UseCase
  getIT.registerLazySingleton(
    () => GetChatRoomsUsecase(chatRoomsRepository: getIT()),
  );
  //!Repository
  getIT.registerLazySingleton<ChatRoomsRepository>(
    () => ImplChatRoomsRepository(chatRoomsService: getIT()),
  );
  //!Services
  getIT.registerLazySingleton(() => ChatRoomsService());
  //_____________END______________
}
