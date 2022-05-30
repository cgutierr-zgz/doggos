import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:doggos/home/home.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required DogsRepository dogsRepository})
      : super(const LoadingState()) {
    _dogsRepository = dogsRepository;

    on<Fetching>(_fetchingData);
    on<ErrorFetching>(_fetchFailed);
  }

  late final DogsRepository _dogsRepository;

  Future<void> _fetchingData(Fetching event, Emitter emit) async {
    emit(const LoadingState());

    try {
      emit(const LoadedState());
    } catch (e) {
      add(ErrorFetching(exception: Exception(e)));
    }
  }

  Future<void> _fetchFailed(ErrorFetching event, Emitter emit) async {
    log('Error: ${event.exception}');
    emit(ErrorState(exception: event.exception));
    emit(const LoadingState());
  }
}
