import 'package:flutter/material.dart';

class VehicleItem extends StatelessWidget {
  const VehicleItem({
    super.key,
    required this.plate,
    required this.vehicleType,
    required this.onTap,
  });

  final String plate;
  final String vehicleType;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(plate),
        ),
        Expanded(
          child: Text(vehicleType),
        ),
        Expanded(
          child: TextButton(
            onPressed: () {},
            child: const SizedBox(
              width: double.infinity,
              child: Center(
                child: Text("Pagar"),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
