import 'package:domain/domain.dart';
import 'package:test/test.dart';

void main() {
  group('constructor', () {
    test('zeroCylinderCapacity_exception', () {
      //Arrange
      const String plate = "FI1100";
      const double cylinderCapacity = 0;
      //Act
      //Assert
      expect(() => Motorcycle(plate, cylinderCapacity),
          throwsA(isA<BusinessException>()));
    });

    test('correctMotorcyclePlate', () {
      //Arrange
      const String plate = "FI1100";
      const double cylinderCapacity = 100.0;
      //Act
      Motorcycle motorcycle = Motorcycle(plate, cylinderCapacity);
      //Assert
      expect(motorcycle.plate, equals(Car(plate).plate));
    });
  });
}
