part of 'delete_vehicle_bloc.dart';

@immutable
abstract class DeleteVehicleEvent extends Equatable {
  const DeleteVehicleEvent();
  @override
  List<Object> get props => [];
}

class DeleteVehicle extends DeleteVehicleEvent {
  const DeleteVehicle(this.vehicle);

  final Vehicle vehicle;

  @override
  List<Object> get props => [vehicle];
}