import 'package:bloc/bloc.dart';

class BreedCubit extends Cubit<int> {
  BreedCubit() : super(0);

  void updateQuantity(int number) {
    if (state < 3 || number.isNegative) emit(state + number);
  }
}
