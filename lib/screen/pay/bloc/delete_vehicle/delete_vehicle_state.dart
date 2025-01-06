part of 'delete_vehicle_bloc.dart';

@immutable
abstract class DeleteVehicleState extends Equatable {
  const DeleteVehicleState();
  @override
  List<Object> get props => [];
}

class DeleteVehicleStarted extends DeleteVehicleState {}

class DeleteVehicleLoading extends DeleteVehicleState {}

class DeleteVehicleSuccess extends DeleteVehicleState {}

class DeleteVehicleError extends DeleteVehicleState {
  const DeleteVehicleError(this.message);
  final String message;
  @override
  List<Object> get props => [message];
}