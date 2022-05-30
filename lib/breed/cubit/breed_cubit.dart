import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'breed_state.dart';

class BreedCubit extends Cubit<BreedState> {
  BreedCubit() : super(BreedInitial());
}
