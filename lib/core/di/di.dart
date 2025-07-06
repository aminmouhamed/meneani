import 'package:get_it/get_it.dart';
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

  //! usecases
  getIT.registerLazySingleton(
    () => CreateClientAccountUseCase(createAccountRepository: getIT()),
  );
  getIT.registerSingleton(
    () => CreateSpecialistAccountUsecase(createAccountRepository: getIT()),
  );
  //! repository
  getIT.registerLazySingleton<CreateAccountRepository>(
    () => ImplCreateAccountRepository(createAccountService: getIT()),
  );
  //! sevices

  getIT.registerLazySingleton(() => CreateAccountService());
}
