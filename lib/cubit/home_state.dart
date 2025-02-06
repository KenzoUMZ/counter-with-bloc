import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final int? counter;
  
  const HomeState({
    this.counter = 0,
  });

  HomeState copyWith({
    int? counter,
  }) {
    return HomeState(
      counter: counter,
    );
  }

  @override
  List<Object?> get props => [
        counter,
      ];
}
