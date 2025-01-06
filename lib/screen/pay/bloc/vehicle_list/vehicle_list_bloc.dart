import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'vehicle_list_event.dart';
part 'vehicle_list_state.dart';

@injectable
class VehicleListBloc extends Bloc<VehicleListEvent, CarListState> {
  VehicleListBloc({
    required TicketEntryCarService ticketEntryCarService,
    required TicketEntryMotorcycleService ticketEntryMotorcycleService, 
  })  : _ticketEntryCarService = ticketEntryCarService, 
        _ticketEntryMotorcycleService = ticketEntryMotorcycleService,
        super(VehicleListStarted()) {
    on<VehicleList>(_registerCar);
  }

  final TicketEntryCarService _ticketEntryCarService;
  final TicketEntryMotorcycleService _ticketEntryMotorcycleService;

  Future<void> _registerCar(VehicleList event, Emitter<CarListState> emit) async {
    emit(VehicleListLoading());
    try {
      final result = await _ticketEntryCarService.getListTicket();
      final resultMotorcycle = await _ticketEntryMotorcycleService.getListTicket();
      result.addAll(resultMotorcycle);
      emit(VehicleListSuccess(ticketEntryList: result));
    } catch (e) {
      emit(CarListError(e.toString()));
    }
  }

  @override
  Future<void> close() {
    debugPrint('VehicleListBloc - close $_ticketEntryCarService');
    return super.close();
  }
}
