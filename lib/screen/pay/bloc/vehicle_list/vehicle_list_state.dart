part of 'vehicle_list_bloc.dart';

@immutable
abstract class CarListState extends Equatable {
  const CarListState();
  @override
  List<Object> get props => [];
}

class VehicleListStarted extends CarListState {}

class VehicleListLoading extends CarListState {}

class VehicleListSuccess extends CarListState {

const VehicleListSuccess({required this.ticketEntryList});

  final List<TicketEntry> ticketEntryList;

  @override
  List<Object> get props => [ticketEntryList];
}

class CarListError extends CarListState {
  const CarListError(this.message);
  final String message;
  @override
  List<Object> get props => [message];
}