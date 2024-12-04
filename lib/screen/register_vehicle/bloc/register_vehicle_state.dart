part of 'register_vehicle_bloc.dart';

@immutable
abstract class RegisterVehicleState extends Equatable {
  const RegisterVehicleState();
  @override
  List<Object> get props => [];
}

class RegisterCarStarted extends RegisterVehicleState {}

class RegisterCarLoading extends RegisterVehicleState {}

class RegisterCarSuccess extends RegisterVehicleState {}

class RegisterCarError extends RegisterVehicleState {
  const RegisterCarError(this.message);
  final String message;
  @override
  List<Object> get props => [message];
}