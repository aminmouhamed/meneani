part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  List<GetClientAppointmentEntiti>? appointmentList;

  HomeLoadedState({this.appointmentList});
}

class HomeErrorState extends HomeState {
  final String errorMassege;

  HomeErrorState({required this.errorMassege});
}
