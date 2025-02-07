import 'package:counter_with_bloc/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  void addCounter(int n) {
    int counter = state.counter ?? 0;
    int inputUser;
    inputUser = counter + n;
    emit(state.copyWith(counter: inputUser));
  }
}
