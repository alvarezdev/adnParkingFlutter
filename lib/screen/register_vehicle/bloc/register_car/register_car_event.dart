part of 'register_car_bloc.dart';

@immutable
abstract class RegisterCarEvent extends Equatable {
  const RegisterCarEvent();
  @override
  List<Object> get props => [];
}

class RegisterCar extends RegisterCarEvent {
  const RegisterCar(this.vehicle);

  final Vehicle vehicle;

  @override
  List<Object> get props => [vehicle];
}