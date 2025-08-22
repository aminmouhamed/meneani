import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
part 'connectivity_event.dart';
part 'connectivity_state.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  final connectionChecker = InternetConnectionChecker.instance;
  StreamSubscription? _conectionsState;
  ConnectivityBloc() : super(ConnectivityInitial()) {
    on<ConnectivityEvent>((event, emit) async {
      if (event is IsConnected) {
        print('Connected to the internet');
        emit(ConnectivityHasConnectionsState());
      } else if (event is IsDesConnected) {
        print('Disconnected from the internet');
        emit(ConnectivityDontHaveConnectionsState());
      }
    });
    _conectionsState = connectionChecker.onStatusChange.listen((
      InternetConnectionStatus status,
    ) {
      if (status == InternetConnectionStatus.connected) {
        add(IsConnected());
      } else {
        add(IsDesConnected());
      }
    });
  }

  @override
  Future<void> close() {
    connectionChecker.dispose();
    return super.close();
  }
}
