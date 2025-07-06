part of 'create_account_bloc.dart';

abstract class CreateAccountEvent extends Equatable {
  const CreateAccountEvent();

  @override
  List<Object> get props => [];
}

class CreateClientAccountEvent extends CreateAccountEvent {}

class CreateSpecialistAccountEvent extends CreateAccountEvent {}
