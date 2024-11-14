//@GeneratedMicroModule;InfrastructurePackageModule;package:infrastructure/infrastructure.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:domain/domain.dart' as _i494;
import 'package:infrastructure/src/ticket_entry/persistence/dao/ticket_entry_car/ticket_entry_car_dao.dart'
    as _i70;
import 'package:infrastructure/src/ticket_entry/persistence/dao/ticket_entry_motorcycle/ticket_entry_motorcycle_dao.dart'
    as _i549;
import 'package:infrastructure/src/ticket_entry/persistence/database/ticket_entry_database.dart'
    as _i487;
import 'package:infrastructure/src/ticket_entry/repository/contracts/ticket_entry_repository_database.dart'
    as _i272;
import 'package:infrastructure/src/ticket_entry/repository/production/ticket_entry_db_repository.dart'
    as _i96;
import 'package:infrastructure/src/ticket_entry/repository/ticket_entry_proxy.dart'
    as _i358;
import 'package:injectable/injectable.dart' as _i526;

class InfrastructurePackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    gh.singleton<_i487.TicketEntryDatabase>(() => _i487.TicketEntryDatabase());
    gh.factory<_i549.TicketEntryMotorcycleDao>(
        () => _i549.TicketEntryMotorcycleDao(gh<_i487.TicketEntryDatabase>()));
    gh.factory<_i70.TicketEntryCarDao>(
        () => _i70.TicketEntryCarDao(gh<_i487.TicketEntryDatabase>()));
    gh.factory<_i272.TicketEntryRepositoryDatabase>(
        () => _i96.TicketEntryDbRepository(
              gh<_i70.TicketEntryCarDao>(),
              gh<_i549.TicketEntryMotorcycleDao>(),
            ));
    gh.factory<_i494.TicketEntryRepository>(() =>
        _i358.TicketEntryProxy(gh<_i272.TicketEntryRepositoryDatabase>()));
  }
}
