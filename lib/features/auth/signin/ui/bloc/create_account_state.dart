part of 'create_account_bloc.dart';

abstract class CreateAccountState extends Equatable {
  const CreateAccountState();

  @override
  List<Object> get props => [];
}

class CreateAccountInitial extends CreateAccountState {}

class CreateAccountLoadingState extends CreateAccountState {}

class CreateAccountLoadedState extends CreateAccountState {}

class CreateAccountErrorState extends CreateAccountState {
  final String errorMessage;

  CreateAccountErrorState({required this.errorMessage});
}
