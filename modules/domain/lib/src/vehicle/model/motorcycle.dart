import 'package:domain/domain.dart';

class Motorcycle extends Vehicle {
  Motorcycle(super.plate, this._cylinderCapacity) {
    _cylinderCapacityValidation(_cylinderCapacity);
  }

  final double _cylinderCapacity;

  static const String _zeroCylinderCapacityMsg =
      "The cylinder capacity of the vehicle must be greater than zero";

  double get cylinderCapacity => _cylinderCapacity;

  void _cylinderCapacityValidation(double cylinderCapacity) {
    if (cylinderCapacity <= 0) {
      throw BusinessException(_zeroCylinderCapacityMsg);
    }
  }
}
