import 'package:adn_parking_flutter/screen/register_vehicle/bloc/register_car/register_car_bloc.dart';
import 'package:adn_parking_flutter/screen/register_vehicle/bloc/register_motorcycle/register_motorcycle_bloc.dart';
import 'package:adn_parking_flutter/screen/register_vehicle/register_car_form.dart';
import 'package:adn_parking_flutter/screen/register_vehicle/register_motorcycle_form.dart';
import 'package:adn_parking_flutter/shared/toast_widget.dart';
import 'package:adn_parking_flutter/shared/vehicle_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterVehicleScreen extends StatefulWidget {
  const RegisterVehicleScreen({super.key});

  static const routeName = 'register-vehicle-screen';

  @override
  State<RegisterVehicleScreen> createState() => _RegisterVehicleScreenState();
}

class _RegisterVehicleScreenState extends State<RegisterVehicleScreen> {
  VehicleType selectedVehicleType = VehicleType.car;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registrar Vehículo"),
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<RegisterCarBloc, RegisterCarState>(
            listener: (context, state) {
              if (state is RegisterCarSuccess) {
                showToast("Carro registrado correctamente");
                Navigator.pop(context);
              }
            },
          ),
          BlocListener<RegisterMotorcycleBloc, RegisterMotorcycleState>(
            listener: (context, state) {
              if (state is RegisterMotorcycleSuccess) {
                showToast("Moto registrada correctamente");
                Navigator.pop(context);
              }
            },
          ),
        ],
        child: _screen(),
      ),
    );
  }

  Widget _screen() {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text('Seleccionar tipo de vehículo:'),
            const SizedBox(height: 20),
            _radioButton(),
            const SizedBox(height: 20),
            Expanded(
              child: selectedVehicleType == VehicleType.car
                  ? const RegisterCarForm()
                  : const RegisterMotorcycleForm(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _radioButton() {
    return Row(
      children: [
        Radio<VehicleType>(
          value: VehicleType.car,
          groupValue: selectedVehicleType,
          onChanged: (value) {
            setState(() {
              selectedVehicleType = value ?? VehicleType.car;
            });
          },
        ),
        const Flexible(child: Text("Carro")),
        Radio<VehicleType>(
          value: VehicleType.motorcycle,
          groupValue: selectedVehicleType,
          onChanged: (value) {
            setState(() {
              selectedVehicleType = value ?? VehicleType.motorcycle;
            });
          },
        ),
        const Flexible(child: Text("Moto")),
      ],
    );
  }
}
