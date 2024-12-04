import 'package:adn_parking_flutter/dependencyInjection/dependency_injection.dart';
import 'package:adn_parking_flutter/screen/home/home_screen.dart';
import 'package:adn_parking_flutter/shared/routes.dart';
import 'package:flutter/material.dart';

void main() {
  configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    // return const MaterialApp(
    //   home: Scaffold(
    //     body: Center(
    //       child: Text('Hello World!'),
    //     ),
    //   ),
    // );

    return MaterialApp(
      title: 'Parking',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: HomeScreen.routeName,
      routes: AppRouter.routes,
    );
  }
}
