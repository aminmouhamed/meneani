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

  getIT.registerFactory(() => HomeBloc(homeRepository: getIT()));
  //! usecases

  getIT.registerLazySingleton(
    () => GetClientDataUsecase(homeRepository: getIT()),
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

  //_____________END______________
}
