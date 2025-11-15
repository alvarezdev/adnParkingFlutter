import 'package:adn_parking_flutter/screen/register_vehicle/register_vehicle_form.dart';
import 'package:adn_parking_flutter/screen/screen.dart';
import 'package:flutter/cupertino.dart';

class RegisterMotorcycleForm extends RegisterVehicleForm {
  const RegisterMotorcycleForm({super.key});

  @override
  State<RegisterMotorcycleForm> createState() => _RegisterMotorcycleForm();
}

class _RegisterMotorcycleForm
    extends StateRegisterVehicleForm<RegisterMotorcycleForm> {
  final TextEditingController cylinderController = TextEditingController();

  @override
  Widget buildAdditionalFields() {
    return SizedBox(
      height: Dimensions.d50,
      child: TextFormField(
        controller: cylinderController,
        decoration: InputDecoration(
          labelText: AppLocalizations.of(context).cylinder_capacity,
          border: textFieldBorderDecoration,
          focusedBorder: textFieldBorderDecoration,
          enabledBorder: textFieldBorderDecoration,
          labelStyle:
              const TextStyle(color: CupertinoColors.label, fontSize: 15),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return AppLocalizations.of(context).enter_cylinder_capacity;
          }
          return null;
        },
      ),
    );
  }

  @override
  onSubmit(BuildContext context) {
    try {
      context.read<RegisterMotorcycleBloc>().add(
            RegisterMotorcycle(
          Motorcycle(
            plateController.text,
            double.parse(cylinderController.text.isEmpty
                ? '0'
                : cylinderController.text),
          ),
        ),
      );
    } on BusinessException catch (e) {
      showToast(e.message);
    } catch (e) {
      showToast(e.toString());
    }
  }
}
