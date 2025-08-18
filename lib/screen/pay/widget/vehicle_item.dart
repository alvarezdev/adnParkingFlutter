import 'package:adn_parking_flutter/screen/screen.dart';

class VehicleItem extends StatelessWidget {
  const VehicleItem({
    super.key,
    required this.vehicle,
    required this.vehicleType,
    required this.onTap,
  });

  final Vehicle vehicle;
  final String vehicleType;
  final Function(Vehicle) onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(vehicle.plate),
        ),
        Expanded(
          child: Text(vehicleType),
        ),
        Expanded(
          child: TextButton(
            onPressed: () {
              onTap(vehicle);
            },
            child: SizedBox(
              width: double.infinity,
              child: Center(
                child: Text(AppLocalizations.of(context).pay_button),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
