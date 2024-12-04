import 'package:adn_parking_flutter/dependencyInjection/dependency_injection.dart';
import 'package:adn_parking_flutter/screen/home/home_screen.dart';
import 'package:adn_parking_flutter/screen/register_vehicle/bloc/register_vehicle_bloc.dart';
import 'package:adn_parking_flutter/screen/register_vehicle/register_vehicle_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static Map<String, WidgetBuilder> routes = {
    HomeScreen.routeName: (context) => const HomeScreen(),
    RegisterVehicleScreen.routeName: (context) => BlocProvider(
      create: (_) => getIt<RegisterVehicleBloc>(),
      child: const RegisterVehicleScreen(),
    ),
  };

  //static const int _transitionDurationInMillis = 550;

  /*static RouteFactory onGenerateRoute = (RouteSettings settings) {
    final name = settings.name;

    if (name == MovieDetailScreen.routeName) {
      const transitionDuration =
      Duration(milliseconds: _transitionDurationInMillis);
      final args = settings.arguments;

      return PageRouteBuilder(
        transitionDuration: transitionDuration,
        reverseTransitionDuration: transitionDuration,
        pageBuilder: (_, animation, ___) {
          return FadeTransition(
            opacity: animation,
            child: BlocProvider(
              create: (_) =>
              getIt<MovieDetailBloc>(param1: args)..add(GetMovie()),
              child: const MovieDetailScreen(),
            ),
          );
        },
      );
    }
    return null;
  };*/
}