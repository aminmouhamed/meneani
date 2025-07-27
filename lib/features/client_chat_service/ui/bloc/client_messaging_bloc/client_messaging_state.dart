part of 'client_messaging_bloc.dart';

abstract class ClientMessagingState extends Equatable {
  const ClientMessagingState();
  
  @override
  List<Object> get props => [];
}

class ClientMessagingInitial extends ClientMessagingState {}
