import 'package:adn_parking_flutter/shared/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class RegisterVehicleForm extends StatefulWidget {
  const RegisterVehicleForm({super.key});

  @override
  State<RegisterVehicleForm> createState();
}

abstract class StateRegisterVehicleForm<T extends RegisterVehicleForm> extends State<T> {
  static const String _errorMessage = "Ingrese el valor correcto";
  static const String _plate = "Placa";

  final TextEditingController plateController = TextEditingController();

  // Método abstracto para agregar campos específicos a los formularios hijos
  Widget buildAdditionalFields();

  onSubmit(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          textFieldPlate(),
          const SizedBox(height: 10),
          buildAdditionalFields(),
          const SizedBox(height: 15),
          TextButton(
            onPressed: () {
              onSubmit(context);
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
    );
  }

  Widget textFieldPlate() {
    return SizedBox(
      height: 50,
      child: TextFormField(
        controller: plateController,
        decoration: InputDecoration(
          labelText: _plate,
          border: textFieldBorderDecoration,
          focusedBorder: textFieldBorderDecoration,
          enabledBorder: textFieldBorderDecoration,
          labelStyle:
              const TextStyle(color: CupertinoColors.label, fontSize: Dimensions.d15),
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
    borderRadius: BorderRadius.circular(Dimensions.d5),
  );
}
