part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class Fetching extends HomeEvent {
  const Fetching();

  @override
  List<Object> get props => [];
}

class ErrorFetching extends HomeEvent {
  const ErrorFetching({required this.exception});
  final Exception exception;

  @override
  List<Object> get props => [];
}
