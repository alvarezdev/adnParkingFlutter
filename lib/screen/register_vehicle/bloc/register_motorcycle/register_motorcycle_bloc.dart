import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'register_motorcycle_event.dart';
part 'register_motorcycle_state.dart';

@injectable
class RegisterMotorcycleBloc
    extends Bloc<RegisterMotorcycleEvent, RegisterMotorcycleState> {
  RegisterMotorcycleBloc({required TicketEntryMotorcycleService ticketEntryCarService})
      : _ticketEntryCarService = ticketEntryCarService,
        super(RegisterMotorcycleStarted()) {
    on<RegisterMotorcycle>(_registerCar);
  }

  final TicketEntryMotorcycleService _ticketEntryCarService;

  Future<void> _registerCar(
      RegisterMotorcycle event, Emitter<RegisterMotorcycleState> emit) async {
    emit(RegisterMotorcycleLoading());
    try {
      final ticket = TicketEntry(event.vehicle, DateTime.now());
      await _ticketEntryCarService.addTicketEntry(ticket);
      emit(RegisterMotorcycleSuccess());
    } catch (e) {
      emit(RegisterMotorcycleError(e.toString()));
    }
  }

  @override
  Future<void> close() {
    debugPrint('RegisterMotorcycleBloc - close $_ticketEntryCarService');
    return super.close();
  }
}
