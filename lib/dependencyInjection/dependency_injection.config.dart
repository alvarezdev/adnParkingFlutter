// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:adn_parking_flutter/screen/pay/bloc/delete_vehicle/delete_vehicle_bloc.dart'
    as _i365;
import 'package:adn_parking_flutter/screen/pay/bloc/vehicle_list/vehicle_list_bloc.dart'
    as _i666;
import 'package:adn_parking_flutter/screen/register_vehicle/bloc/register_car/register_car_bloc.dart'
    as _i956;
import 'package:adn_parking_flutter/screen/register_vehicle/bloc/register_motorcycle/register_motorcycle_bloc.dart'
    as _i336;
import 'package:domain/domain.dart' as _i494;
import 'package:domain/domain.module.dart' as _i941;
import 'package:get_it/get_it.dart' as _i174;
import 'package:infrastructure/infrastructure.module.dart' as _i460;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i336.RegisterMotorcycleBloc>(() => _i336.RegisterMotorcycleBloc(
        ticketEntryCarService: gh<_i494.TicketEntryMotorcycleService>()));
    gh.factory<_i956.RegisterCarBloc>(() => _i956.RegisterCarBloc(
        ticketEntryCarService: gh<_i494.TicketEntryCarService>()));
    gh.factory<_i666.VehicleListBloc>(() => _i666.VehicleListBloc(
          ticketEntryCarService: gh<_i494.TicketEntryCarService>(),
          ticketEntryMotorcycleService:
              gh<_i494.TicketEntryMotorcycleService>(),
        ));
    gh.factory<_i365.DeleteVehicleBloc>(() => _i365.DeleteVehicleBloc(
          ticketEntryCarService: gh<_i494.TicketEntryCarService>(),
          ticketEntryMotorcycleService:
              gh<_i494.TicketEntryMotorcycleService>(),
        ));
    await _i460.InfrastructurePackageModule().init(gh);
    await _i941.DomainPackageModule().init(gh);
    return this;
  }
}
