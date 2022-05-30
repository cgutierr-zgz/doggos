import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:doggos/home/home.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required DogsRepository dogsRepository})
      : super(const InitialState()) {
    _dogsRepository = dogsRepository;

    on<FetchData>(_fetchingData);
    on<ErrorFetching>(_fetchFailed);
  }

  late final DogsRepository _dogsRepository;

  Future<void> _fetchingData(FetchData event, Emitter emit) async {
    emit(const LoadingState());

    try {
      final breeds = await _dogsRepository.fetchBreeds();

      // Just to add some delay to the response
      await Future<void>.delayed(const Duration(milliseconds: 500));
      emit(LoadedState(breeds: breeds));
    } catch (e) {
      add(ErrorFetching(exception: Exception(e)));
    }
  }

  Future<void> _fetchFailed(ErrorFetching event, Emitter emit) async {
    log('Error: ${event.exception}');
    emit(ErrorState(exception: event.exception));
  }
}
