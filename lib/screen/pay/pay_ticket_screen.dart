import 'package:adn_parking_flutter/screen/pay/bloc/delete_vehicle/delete_vehicle_bloc.dart';
import 'package:adn_parking_flutter/screen/pay/bloc/vehicle_list/vehicle_list_bloc.dart';
import 'package:adn_parking_flutter/screen/pay/widget/vehicle_item.dart';
import 'package:adn_parking_flutter/shared/alert_dialog/alert_dialog_widget.dart';
import 'package:adn_parking_flutter/shared/dimensions.dart';
import 'package:adn_parking_flutter/shared/toast/toast_widget.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PayTicketScreen extends StatefulWidget {
  const PayTicketScreen({super.key});

  static const routeName = 'pay-ticket-screen';

  @override
  State<PayTicketScreen> createState() => _PayTicketScreen();
}

class _PayTicketScreen extends State<PayTicketScreen> {
  static const String _initialLetterCar = "C";
  static const String _initialLetterMotorcycle = "M";

  final TextEditingController plateController = TextEditingController();
  late List<TicketEntry> ticketEntryList = [];
  late List<TicketEntry> ticketEntryListFiltered = [];
  late List<TicketEntry> ticketEntryListMutable = [];
  late bool isFiltered = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).car_list_title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Primero, el BlocConsumer para VehicleListBloc
            BlocConsumer<VehicleListBloc, CarListState>(
              listener: (context, state) {
                if (state is CarListError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)),
                  );
                }
              },
              builder: (context, state) {
                if (state is VehicleListLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is VehicleListSuccess) {
                  if (!isFiltered) {
                    ticketEntryList = state.ticketEntryList;
                    ticketEntryListFiltered = state.ticketEntryList;
                    ticketEntryListMutable = state.ticketEntryList;
                  }
                  return _container();
                } else {
                  return Center(
                      child: Text(AppLocalizations.of(context).car_list_title));
                }
              },
            ),
            BlocListener<DeleteVehicleBloc, DeleteVehicleState>(
              listener: (context, state) {
                if (state is DeleteVehicleError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)),
                  );
                } else if (state is DeleteVehicleSuccess) {
                  showToast(
                      AppLocalizations.of(context).invoice_paid_successfully);
                  BlocProvider.of<VehicleListBloc>(context).add(VehicleList());
                }
              },
              child: const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _container() {
    if (isFiltered) {
      ticketEntryListMutable = ticketEntryListFiltered;
    } else {
      ticketEntryListMutable = ticketEntryList;
    }
    return Center(
      child: Column(
        children: [
          const SizedBox(height: Dimensions.d15),
          textFieldPlate(),
          const SizedBox(height: Dimensions.d15),
          ListView.builder(
            shrinkWrap: true,
            itemCount: ticketEntryListMutable.length,
            itemBuilder: (context, index) {
              final ticketEntry = ticketEntryListMutable[index];
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Dimensions.d15,
                ),
                child: VehicleItem(
                  vehicle: ticketEntry.vehicle,
                  vehicleType: ticketEntryListMutable[index].vehicle is Car
                      ? _initialLetterCar
                      : _initialLetterMotorcycle,
                  onTap: showEndPaymentAlertDialog(ticketEntry),
                ),
              );
            },
          ),
          const SizedBox(height: Dimensions.d15),
        ],
      ),
    );
  }

  Widget textFieldPlate() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Dimensions.d15,
      ),
      child: TextFormField(
        controller: plateController,
        decoration: InputDecoration(
          labelText: AppLocalizations.of(context).search_plate,
          border: textFieldBorderDecoration,
          focusedBorder: textFieldBorderDecoration,
          enabledBorder: textFieldBorderDecoration,
          labelStyle:
              const TextStyle(color: Colors.black, fontSize: Dimensions.d15),
          hintText: AppLocalizations.of(context).search_plate,
          prefixIcon: const Icon(Icons.search),
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              plateController.clear();
              isFiltered = false;
              setState(() {});
            },
          ),
        ),
        onChanged: (value) {
          isFiltered = true;
          setState(() {
            ticketEntryListFiltered = ticketEntryList
                .where((element) => element.vehicle.plate.contains(value))
                .toList();
          });
        },
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

  int calculateTicketValue(TicketEntry ticketEntry) {
    if (ticketEntry.vehicle is Motorcycle) {
      return TicketExitMotorcycle(ticketEntry, DateTime.now())
          .calculateParkingValue();
    } else {
      return TicketExitCar(ticketEntry, DateTime.now()).calculateParkingValue();
    }
  }

  Function(Vehicle) showEndPaymentAlertDialog(TicketEntry ticketEntry) {
    return (Vehicle vehicle) {
      final value = calculateTicketValue(ticketEntry);
      AlertDialogWidget.show(
        context: context,
        title: AppLocalizations.of(context).pay_button,
        description:
            AppLocalizations.of(context).amount_to_pay + value.toString(),
        actions: [
          TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(AppLocalizations.of(context).cancel_button)),
          TextButton(
            onPressed: () {
              BlocProvider.of<DeleteVehicleBloc>(context)
                  .add(DeleteVehicle(vehicle));
              Navigator.of(context).pop();
            },
            child: Text(AppLocalizations.of(context).accept_button),
          ),
        ],
      );
    };
  }
}
