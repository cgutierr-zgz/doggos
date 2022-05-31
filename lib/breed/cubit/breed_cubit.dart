import 'package:bloc/bloc.dart';

class BreedCubit extends Cubit<int> {
  BreedCubit() : super(0);

  void updateQuantity(int number) => emit(state + number);
}
