import 'package:adn_parking_flutter/dependencyInjection/dependency_injection.dart';
import 'package:adn_parking_flutter/screen/home/home_screen.dart';
import 'package:adn_parking_flutter/screen/pay/bloc/delete_vehicle/delete_vehicle_bloc.dart';
import 'package:adn_parking_flutter/screen/pay/bloc/vehicle_list/vehicle_list_bloc.dart';
import 'package:adn_parking_flutter/screen/pay/pay_ticket_screen.dart';
import 'package:adn_parking_flutter/screen/register_vehicle/bloc/register_car/register_car_bloc.dart';
import 'package:adn_parking_flutter/screen/register_vehicle/bloc/register_motorcycle/register_motorcycle_bloc.dart';
import 'package:adn_parking_flutter/screen/register_vehicle/register_vehicle_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static Map<String, WidgetBuilder> routes = {
    HomeScreen.routeName: (context) => const HomeScreen(),
    RegisterVehicleScreen.routeName: (context) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => getIt<RegisterCarBloc>(),
            ),
            BlocProvider(
              create: (_) => getIt<RegisterMotorcycleBloc>(),
            ),
          ],
          child: const RegisterVehicleScreen(),
        ),
    // PayTicketScreen.routeName: (context) => BlocProvider(
    //       create: (_) => getIt<VehicleListBloc>()..add(VehicleList()),
    //       child: const PayTicketScreen(),
    //     ),
    PayTicketScreen.routeName: (context) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => getIt<VehicleListBloc>()..add(VehicleList()),
            ),
            BlocProvider(
              create: (_) => getIt<DeleteVehicleBloc>(),
            ),
          ],
          child: const PayTicketScreen(),
        ),
  };
}
