part of 'register_motorcycle_bloc.dart';

@immutable
abstract class RegisterMotorcycleEvent extends Equatable {
  const RegisterMotorcycleEvent();
  @override
  List<Object> get props => [];
}

class RegisterMotorcycle extends RegisterMotorcycleEvent {
  const RegisterMotorcycle(this.vehicle);

  final Vehicle vehicle;

  @override
  List<Object> get props => [vehicle];
}