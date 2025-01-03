import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'car_list_event.dart';
part 'car_list_state.dart';

@injectable
class CarListBloc extends Bloc<CarListEvent, CarListState> {
  CarListBloc({
    required TicketEntryCarService ticketEntryCarService,
  })  : _ticketEntryCarService = ticketEntryCarService,
        super(CarListStarted()) {
    on<CarList>(_registerCar);
  }

  final TicketEntryCarService _ticketEntryCarService;

  Future<void> _registerCar(CarList event, Emitter<CarListState> emit) async {
    emit(CarListLoading());
    try {
      final result = await _ticketEntryCarService.getListTicketEntry();
      emit(CarListSuccess(ticketEntryList: result));
    } catch (e) {
      emit(CarListError(e.toString()));
    }
  }

  @override
  Future<void> close() {
    debugPrint('CarListBloc - close $_ticketEntryCarService');
    return super.close();
  }
}
