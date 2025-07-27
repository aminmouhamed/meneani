import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'client_messaging_event.dart';
part 'client_messaging_state.dart';

class ClientMessagingBloc extends Bloc<ClientMessagingEvent, ClientMessagingState> {
  ClientMessagingBloc() : super(ClientMessagingInitial()) {
    on<ClientMessagingEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
