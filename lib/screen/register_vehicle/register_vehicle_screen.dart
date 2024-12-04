import 'package:adn_parking_flutter/screen/register_vehicle/bloc/register_vehicle_bloc.dart';
import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterVehicleScreen extends StatefulWidget {
  const RegisterVehicleScreen({super.key});

  static const routeName = 'register-vehicle-screen';

  @override
  State<RegisterVehicleScreen> createState() => _RegisterVehicleScreen();
}

class _RegisterVehicleScreen extends State<RegisterVehicleScreen> {
  static const String _errorMessage = "Ingrese el valor correcto";
  static const String _plate = "Placa";

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                textFieldPlate(),
                const SizedBox(height: 15),
                TextButton(
                  onPressed: () {
                    BlocProvider.of<RegisterVehicleBloc>(context).add(
                      RegisterVehicle(
                        Car(controller.text),
                      ),
                    );
                  },
                  child: const SizedBox(
                    width: double.infinity,
                    child: Center(
                      child: Text("Aceptar"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget textFieldPlate() {
    return SizedBox(
      height: 50,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: _plate,
          border: textFieldBorderDecoration,
          focusedBorder: textFieldBorderDecoration,
          enabledBorder: textFieldBorderDecoration,
          labelStyle:
              const TextStyle(color: CupertinoColors.label, fontSize: 15),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return _errorMessage;
          }
          return null;
        },
      ),
    );
  }

  InputBorder textFieldBorderDecoration = OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
  );
}
