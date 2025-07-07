import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meneani/features/auth/login/domain/repository/login_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({required this.loginRepository}) : super(LoginInitial());
  final LoginRepository loginRepository;
  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {}
}
