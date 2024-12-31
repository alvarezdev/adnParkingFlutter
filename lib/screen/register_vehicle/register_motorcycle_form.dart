import 'package:adn_parking_flutter/screen/register_vehicle/bloc/register_motorcycle/register_motorcycle_bloc.dart';
import 'package:adn_parking_flutter/screen/register_vehicle/register_vehicle_form.dart';
import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterMotorcycleForm extends RegisterVehicleForm {
  const RegisterMotorcycleForm({super.key});

  @override
  State<RegisterMotorcycleForm> createState() => _RegisterMotorcycleForm();
}

class _RegisterMotorcycleForm
    extends StateRegisterVehicleForm<RegisterMotorcycleForm> {
  final TextEditingController cylinderController = TextEditingController();
  static const String _cylinder = "Cilindraje";

  @override
  Widget buildAdditionalFields() {
    return SizedBox(
      height: 50,
      child: TextFormField(
        controller: cylinderController,
        decoration: InputDecoration(
          labelText: _cylinder,
          border: textFieldBorderDecoration,
          focusedBorder: textFieldBorderDecoration,
          enabledBorder: textFieldBorderDecoration,
          labelStyle:
              const TextStyle(color: CupertinoColors.label, fontSize: 15),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Ingrese el cilindraje";
          }
          return null;
        },
      ),
    );
  }

  @override
  onSubmit(BuildContext context) {
    BlocProvider.of<RegisterMotorcycleBloc>(context).add(
      RegisterMotorcycle(
        Motorcycle(
          plateController.text,
          double.parse(cylinderController.text),
        ),
      ),
    );
  }
}
