import 'package:adn_parking_flutter/screen/register_vehicle/register_vehicle_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routeName = 'home-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Parking"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  // Navigator.pushNamed(
                  //   context,
                  //   PayScreen.routeName,
                  // );
                  Navigator.pushNamed(context, RegisterVehicleScreen.routeName);
                },
                child: const SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: Text("Ingresar Vehículo"),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  // Navigator.pushNamed(
                  //   context,
                  //   PayScreen.routeName,
                  // );
                },
                child: const SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: Text("Salida de Vehículo"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
