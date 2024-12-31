import 'package:adn_parking_flutter/screen/register_vehicle/bloc/register_car/register_car_bloc.dart';
import 'package:adn_parking_flutter/screen/register_vehicle/register_vehicle_form.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCarForm extends RegisterVehicleForm {
  const RegisterCarForm({super.key});

  @override
  State<RegisterCarForm> createState() => _RegisterCarForm();
}

class _RegisterCarForm extends StateRegisterVehicleForm<RegisterCarForm> {
  @override
  Widget buildAdditionalFields() {
    return const SizedBox();
  }

  @override
  onSubmit(BuildContext context) {
    BlocProvider.of<RegisterCarBloc>(context).add(
      RegisterCar(
        Car(plateController.text),
      ),
    );
  }
}
