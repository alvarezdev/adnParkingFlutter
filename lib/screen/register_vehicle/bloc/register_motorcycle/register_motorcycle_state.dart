part of 'register_motorcycle_bloc.dart';

@immutable
abstract class RegisterMotorcycleState extends Equatable {
  const RegisterMotorcycleState();
  @override
  List<Object> get props => [];
}

class RegisterMotorcycleStarted extends RegisterMotorcycleState {}

class RegisterMotorcycleLoading extends RegisterMotorcycleState {}

class RegisterMotorcycleSuccess extends RegisterMotorcycleState {}

class RegisterMotorcycleError extends RegisterMotorcycleState {
  const RegisterMotorcycleError(this.message);
  final String message;
  @override
  List<Object> get props => [message];
}