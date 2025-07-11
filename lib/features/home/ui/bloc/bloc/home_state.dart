part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  final ClientEntiti clientEntiti;

  HomeLoadedState({required this.clientEntiti});
}

class HomeErrorState extends HomeState {
  final String errorMassege;

  HomeErrorState({required this.errorMassege});
}
