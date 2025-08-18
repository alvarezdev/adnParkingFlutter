import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
  ];

  /// No description provided for @app_name.
  ///
  /// In es, this message translates to:
  /// **'Parking'**
  String get app_name;

  /// No description provided for @enter_vehicle.
  ///
  /// In es, this message translates to:
  /// **'Ingresar vehículo'**
  String get enter_vehicle;

  /// No description provided for @exit_vehicle.
  ///
  /// In es, this message translates to:
  /// **'Salida de vehículo'**
  String get exit_vehicle;

  /// No description provided for @accept_button.
  ///
  /// In es, this message translates to:
  /// **'Aceptar'**
  String get accept_button;

  /// No description provided for @cancel_button.
  ///
  /// In es, this message translates to:
  /// **'Cancelar'**
  String get cancel_button;

  /// No description provided for @pay_button.
  ///
  /// In es, this message translates to:
  /// **'Pagar'**
  String get pay_button;

  /// No description provided for @register_vehicle.
  ///
  /// In es, this message translates to:
  /// **'Registrar vehículo'**
  String get register_vehicle;

  /// No description provided for @correctly_registered_car.
  ///
  /// In es, this message translates to:
  /// **'Carro registrado correctamente'**
  String get correctly_registered_car;

  /// No description provided for @correctly_registered_motorcycle.
  ///
  /// In es, this message translates to:
  /// **'Moto registrada correctamente'**
  String get correctly_registered_motorcycle;

  /// No description provided for @select_vehicle_type.
  ///
  /// In es, this message translates to:
  /// **'Seleccione el tipo de vehículo'**
  String get select_vehicle_type;

  /// No description provided for @car.
  ///
  /// In es, this message translates to:
  /// **'Carro'**
  String get car;

  /// No description provided for @motorcycle.
  ///
  /// In es, this message translates to:
  /// **'Moto'**
  String get motorcycle;

  /// No description provided for @cylinder_capacity.
  ///
  /// In es, this message translates to:
  /// **'Cilindraje'**
  String get cylinder_capacity;

  /// No description provided for @enter_cylinder_capacity.
  ///
  /// In es, this message translates to:
  /// **'Ingrese el cilindraje'**
  String get enter_cylinder_capacity;

  /// No description provided for @plate.
  ///
  /// In es, this message translates to:
  /// **'Placa'**
  String get plate;

  /// No description provided for @search_plate.
  ///
  /// In es, this message translates to:
  /// **'Buscar placa'**
  String get search_plate;

  /// No description provided for @car_list_title.
  ///
  /// In es, this message translates to:
  /// **'Lista de vehículos'**
  String get car_list_title;

  /// No description provided for @error_message_text_field.
  ///
  /// In es, this message translates to:
  /// **'Ingrese el valor correcto'**
  String get error_message_text_field;

  /// No description provided for @data_not_available.
  ///
  /// In es, this message translates to:
  /// **'No hay datos disponibles'**
  String get data_not_available;

  /// No description provided for @amount_to_pay.
  ///
  /// In es, this message translates to:
  /// **'Valor a pagar: '**
  String get amount_to_pay;

  /// No description provided for @invoice_paid_successfully.
  ///
  /// In es, this message translates to:
  /// **'El vehículo ha cancelado su factura con éxito'**
  String get invoice_paid_successfully;

  /// No description provided for @empty_field_cylinder_capacity.
  ///
  /// In es, this message translates to:
  /// **'El campo cilindraje no puede estar vacío'**
  String get empty_field_cylinder_capacity;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
