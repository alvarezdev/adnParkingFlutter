part of 'vehicle_list_bloc.dart';

@immutable
abstract class VehicleListEvent extends Equatable {
  const VehicleListEvent();
  @override
  List<Object> get props => [];
}

class VehicleList extends VehicleListEvent {}