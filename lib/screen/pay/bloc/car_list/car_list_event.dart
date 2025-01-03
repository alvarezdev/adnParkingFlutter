part of 'car_list_bloc.dart';

@immutable
abstract class CarListEvent extends Equatable {
  const CarListEvent();
  @override
  List<Object> get props => [];
}

class CarList extends CarListEvent {}