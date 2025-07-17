import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meneani/core/errors/failures.dart';
import 'package:meneani/features/auth/login/domain/entiti/user_entiti.dart';
import 'package:meneani/features/auth/login/domain/repository/login_repository.dart';
import 'package:meneani/features/auth/login/domain/usecase/lognin_with_email_and_password_usecase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository loginRepository;
  late TextEditingController email = TextEditingController();
  late TextEditingController password = TextEditingController();
  LoginBloc({required this.loginRepository}) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is LogInWithEmailAndPasswordEvent) {
        emit(LogInLoadingState());
        var response = await LogInWithEmailAndPasswordUseCase(
          loginRepository: loginRepository,
        ).call(UserEntiti(email: email.text, password: password.text));

        response.fold(
          (failure) {
            if (failure is ServerFailure) {
              emit(LogInErrorState(errorMessage: failure.errorMassege));
            }
          },
          (value) {
            if (value.user != null) {
              emit(LogInLoadedState(authResponse: value));
            }
          },
        );
      }
    });
  }
}
