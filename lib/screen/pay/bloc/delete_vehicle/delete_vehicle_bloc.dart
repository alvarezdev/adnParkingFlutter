import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'delete_vehicle_event.dart';
part 'delete_vehicle_state.dart';

@injectable
class DeleteVehicleBloc extends Bloc<DeleteVehicleEvent, DeleteVehicleState> {
  DeleteVehicleBloc({
    required TicketEntryCarService ticketEntryCarService,
    required TicketEntryMotorcycleService ticketEntryMotorcycleService,
  })  : _ticketEntryCarService = ticketEntryCarService, 
        _ticketEntryMotorcycleService = ticketEntryMotorcycleService,
        super(DeleteVehicleStarted()) {
    on<DeleteVehicle>(_deleteVehcile);
  }

  final TicketEntryCarService _ticketEntryCarService;
  final TicketEntryMotorcycleService _ticketEntryMotorcycleService;

  Future<void> _deleteVehcile(
      DeleteVehicle event, Emitter<DeleteVehicleState> emit) async {
    emit(DeleteVehicleLoading());
    try {
      if (event.vehicle is Motorcycle) {
        await _ticketEntryMotorcycleService.deleteTicket(event.vehicle.plate);
        
      } else {
        await _ticketEntryCarService.deleteTicket(event.vehicle.plate);
      }
      emit(DeleteVehicleSuccess());
    } catch (e) {
      emit(DeleteVehicleError(e.toString()));
    }
  }

  @override
  Future<void> close() {
    debugPrint('DeleteVehicleBloc - close $_ticketEntryCarService');
    return super.close();
  }
}
