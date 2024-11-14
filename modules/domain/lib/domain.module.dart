//@GeneratedMicroModule;DomainPackageModule;package:domain/domain.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:domain/domain.dart' as _i494;
import 'package:domain/src/ticket_entry/service/ticket_entry_car_service.dart'
    as _i568;
import 'package:domain/src/ticket_entry/service/ticket_entry_motorcycle_service.dart'
    as _i1054;
import 'package:injectable/injectable.dart' as _i526;

class DomainPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    gh.factory<_i568.TicketEntryCarService>(
        () => _i568.TicketEntryCarService(gh<_i494.TicketEntryRepository>()));
    gh.factory<_i1054.TicketEntryMotorcycleService>(() =>
        _i1054.TicketEntryMotorcycleService(gh<_i494.TicketEntryRepository>()));
  }
}