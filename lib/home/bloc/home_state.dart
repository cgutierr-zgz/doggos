part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class InitialState extends HomeState {
  const InitialState();

  @override
  List<Object> get props => [];
}

class LoadingState extends HomeState {
  const LoadingState();

  @override
  List<Object> get props => [];
}

class LoadedState extends HomeState {
  const LoadedState({required this.breeds});
  final List<String> breeds;

  @override
  List<Object> get props => [breeds];
}

class ErrorState extends HomeState {
  const ErrorState({required this.exception});
  final Exception exception;

  @override
  List<Object> get props => [exception];
}
