part of 'messaging_service_bloc.dart';

abstract class MessagingServiceState extends Equatable {
  const MessagingServiceState();

  @override
  List<Object> get props => [];
}

class MessagingServiceInitial extends MessagingServiceState {}
