import 'package:adn_parking_flutter/screen/screen.dart';

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
        title: Text(AppLocalizations.of(context).register_vehicle),
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<RegisterCarBloc, RegisterCarState>(
            listener: (context, state) {
              if (state is RegisterCarSuccess) {
                showToast(
                    AppLocalizations.of(context).correctly_registered_car);
                Navigator.pop(context);
              } else if (state is RegisterCarError) {
                showToast(state.message);
              }
            },
          ),
          BlocListener<RegisterMotorcycleBloc, RegisterMotorcycleState>(
            listener: (context, state) {
              if (state is RegisterMotorcycleSuccess) {
                showToast(AppLocalizations.of(context)
                    .correctly_registered_motorcycle);
                Navigator.pop(context);
              } else if (state is RegisterMotorcycleError) {
                showToast(state.message);
              }
            },
          ),
        ],
        child: _container(),
      ),
    );
  }

  Widget _container() {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(Dimensions.d20),
        child: Column(
          children: [
            const SizedBox(height: Dimensions.d20),
            Text(AppLocalizations.of(context).select_vehicle_type),
            const SizedBox(height: Dimensions.d20),
            _radioButton(),
            const SizedBox(height: Dimensions.d20),
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
        Flexible(child: Text(AppLocalizations.of(context).car)),
        Radio<VehicleType>(
          value: VehicleType.motorcycle,
          groupValue: selectedVehicleType,
          onChanged: (value) {
            setState(() {
              selectedVehicleType = value ?? VehicleType.motorcycle;
            });
          },
        ),
        Flexible(child: Text(AppLocalizations.of(context).motorcycle)),
      ],
    );
  }
}
