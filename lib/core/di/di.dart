import 'package:get_it/get_it.dart';
import 'package:meneani/features/auth/login/data/repository/login_repository.dart';
import 'package:meneani/features/auth/login/data/services/login_service.dart';
import 'package:meneani/features/auth/login/domain/repository/login_repository.dart';
import 'package:meneani/features/auth/login/domain/usecase/lognin_with_email_and_password_usecase.dart';
import 'package:meneani/features/auth/login/ui/bloc/bloc/login_bloc.dart';
import 'package:meneani/features/auth/signin/data/repository/create_account_repository.dart';
import 'package:meneani/features/auth/signin/data/services/create_account_services.dart';
import 'package:meneani/features/auth/signin/domain/repository/create_account_repository.dart';
import 'package:meneani/features/auth/signin/domain/usecase/create_client_account_usecase.dart';
import 'package:meneani/features/auth/signin/domain/usecase/create_specialist_account_usecase.dart';
import 'package:meneani/features/auth/signin/ui/bloc/create_account_bloc.dart';

GetIt getIT = GetIt.instance;

Future<void> init() async {
  //! bloc
  getIT.registerFactory(() => CreateAccountBloc(getIT()));
  getIT.registerFactory(() => LoginBloc(loginRepository: getIT()));
  //! usecases
  getIT.registerLazySingleton(
    () => CreateClientAccountUseCase(createAccountRepository: getIT()),
  );
  getIT.registerLazySingleton(
    () => CreateSpecialistAccountUsecase(createAccountRepository: getIT()),
  );

  getIT.registerLazySingleton(
    () => LogInWithEmailAndPasswordUseCase(loginRepository: getIT()),
  );
  //! repository
  getIT.registerLazySingleton<CreateAccountRepository>(
    () => ImplCreateAccountRepository(createAccountService: getIT()),
  );
  getIT.registerLazySingleton<LoginRepository>(
    () => ImplLoginRepository(loginService: getIT()),
  );
  //! sevices
  getIT.registerLazySingleton(() => LoginService());
  getIT.registerLazySingleton(() => CreateAccountService());
}
