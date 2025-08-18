// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get app_name => 'Parking';

  @override
  String get enter_vehicle => 'Ingresar vehículo';

  @override
  String get exit_vehicle => 'Salida de vehículo';

  @override
  String get accept_button => 'Aceptar';

  @override
  String get cancel_button => 'Cancelar';

  @override
  String get pay_button => 'Pagar';

  @override
  String get register_vehicle => 'Registrar vehículo';

  @override
  String get correctly_registered_car => 'Carro registrado correctamente';

  @override
  String get correctly_registered_motorcycle => 'Moto registrada correctamente';

  @override
  String get select_vehicle_type => 'Seleccione el tipo de vehículo';

  @override
  String get car => 'Carro';

  @override
  String get motorcycle => 'Moto';

  @override
  String get cylinder_capacity => 'Cilindraje';

  @override
  String get enter_cylinder_capacity => 'Ingrese el cilindraje';

  @override
  String get plate => 'Placa';

  @override
  String get search_plate => 'Buscar placa';

  @override
  String get car_list_title => 'Lista de vehículos';

  @override
  String get error_message_text_field => 'Ingrese el valor correcto';

  @override
  String get data_not_available => 'No hay datos disponibles';

  @override
  String get amount_to_pay => 'Valor a pagar: ';

  @override
  String get invoice_paid_successfully =>
      'El vehículo ha cancelado su factura con éxito';

  @override
  String get empty_field_cylinder_capacity =>
      'El campo cilindraje no puede estar vacío';
}
