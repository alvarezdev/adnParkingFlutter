import 'package:adn_parking_flutter/screen/pay/pay_ticket_screen.dart';
import 'package:adn_parking_flutter/screen/register_vehicle/register_vehicle_screen.dart';
import 'package:adn_parking_flutter/shared/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routeName = 'home-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).app_name),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.d30),
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    RegisterVehicleScreen.routeName,
                  );
                },
                child: SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: Text(AppLocalizations.of(context).enter_vehicle),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    PayTicketScreen.routeName,
                  );
                },
                child: SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: Text(AppLocalizations.of(context).exit_vehicle),
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
