// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get app_name => 'Parking';

  @override
  String get enter_vehicle => 'Enter vehicle';

  @override
  String get exit_vehicle => 'Exit vehicle';

  @override
  String get accept_button => 'Accept';

  @override
  String get cancel_button => 'Cancel';

  @override
  String get pay_button => 'Pay';

  @override
  String get register_vehicle => 'Register vehicle';

  @override
  String get correctly_registered_car => 'Car correctly registered';

  @override
  String get correctly_registered_motorcycle =>
      'Motorcycle correctly registered';

  @override
  String get select_vehicle_type => 'Select vehicle type';

  @override
  String get car => 'Car';

  @override
  String get motorcycle => 'Motorcycle';

  @override
  String get cylinder_capacity => 'Cylinder capacity';

  @override
  String get enter_cylinder_capacity => 'Enter the cylinder capacity';

  @override
  String get plate => 'Plate';

  @override
  String get search_plate => 'Search plate';

  @override
  String get car_list_title => 'Car list';

  @override
  String get error_message_text_field => 'Enter the correct value';

  @override
  String get data_not_available => 'No data available';

  @override
  String get amount_to_pay => 'Amount to pay: ';

  @override
  String get invoice_paid_successfully =>
      'The vehicle has successfully paid its invoice';

  @override
  String get empty_field_cylinder_capacity =>
      'The cylinder capacity field cannot be empty';
}
