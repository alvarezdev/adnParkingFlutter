part of 'car_list_bloc.dart';

@immutable
abstract class CarListState extends Equatable {
  const CarListState();
  @override
  List<Object> get props => [];
}

class CarListStarted extends CarListState {}

class CarListLoading extends CarListState {}

class CarListSuccess extends CarListState {

const CarListSuccess({required this.ticketEntryList});

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