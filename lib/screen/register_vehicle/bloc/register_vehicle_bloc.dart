import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'register_vehicle_event.dart';
part 'register_vehicle_state.dart';

@injectable
class RegisterVehicleBloc
    extends Bloc<RegisterVehicleEvent, RegisterVehicleState> {
  RegisterVehicleBloc({required TicketEntryCarService ticketEntryCarService})
      : _ticketEntryCarService = ticketEntryCarService,
        super(RegisterCarStarted()) {
    on<RegisterVehicle>(_registerCar);
  }

  final TicketEntryCarService _ticketEntryCarService;

  Future<void> _registerCar(
      RegisterVehicle event, Emitter<RegisterVehicleState> emit) async {
    emit(RegisterCarLoading());
    try {
      final ticket = TicketEntry(event.vehicle, DateTime.now());
      await _ticketEntryCarService.addTicketEntry(ticket);
      emit(RegisterCarSuccess());
    } catch (e) {
      emit(RegisterCarError(e.toString()));
    }
  }

  @override
  Future<void> close() {
    debugPrint('HomeBloc - close $_ticketEntryCarService');
    return super.close();
  }
}
