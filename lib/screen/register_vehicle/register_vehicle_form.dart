import 'package:adn_parking_flutter/shared/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

abstract class RegisterVehicleForm extends StatefulWidget {
  const RegisterVehicleForm({super.key});

  @override
  State<RegisterVehicleForm> createState();
}

abstract class StateRegisterVehicleForm<T extends RegisterVehicleForm>
    extends State<T> {

  final TextEditingController plateController = TextEditingController();

  Widget buildAdditionalFields();

  onSubmit(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          textFieldPlate(),
          const SizedBox(height: Dimensions.d10),
          buildAdditionalFields(),
          const SizedBox(height: Dimensions.d15),
          TextButton(
            onPressed: () {
              onSubmit(context);
            },
            child: SizedBox(
              width: double.infinity,
              child: Center(
                child: Text(AppLocalizations.of(context).accept_button),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget textFieldPlate() {
    return SizedBox(
      height: Dimensions.d50,
      child: TextFormField(
        controller: plateController,
        onChanged: (value) {
          if (value.isNotEmpty) {
            plateController.value = TextEditingValue(
              text: value.toUpperCase(),
              selection: TextSelection.fromPosition(
                TextPosition(offset: value.length),
              ),
            );
          }
        },
        decoration: InputDecoration(
          labelText: AppLocalizations.of(context).search_plate,
          border: textFieldBorderDecoration,
          focusedBorder: textFieldBorderDecoration,
          enabledBorder: textFieldBorderDecoration,
          labelStyle: const TextStyle(
              color: CupertinoColors.label, fontSize: Dimensions.d15),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return AppLocalizations.of(context).error_message_text_field;
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
