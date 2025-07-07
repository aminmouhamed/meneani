part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LogInLoadingState extends LoginState {}

class LogInLoadedState extends LoginState {}

class LogInErrorState extends LoginState {
  final String errorMessage;

  LogInErrorState({required this.errorMessage});
}
