part of 'register_vehicle_bloc.dart';

@immutable
abstract class RegisterVehicleEvent extends Equatable {
  const RegisterVehicleEvent();
  @override
  List<Object> get props => [];
}

class RegisterVehicle extends RegisterVehicleEvent {
  const RegisterVehicle(this.vehicle);

  final Vehicle vehicle;

  @override
  List<Object> get props => [vehicle];
}