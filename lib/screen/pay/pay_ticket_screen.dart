import 'package:adn_parking_flutter/screen/pay/bloc/car_list/car_list_bloc.dart';
import 'package:adn_parking_flutter/screen/pay/widget/vehicle_item.dart';
import 'package:adn_parking_flutter/shared/dimensions.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PayTicketScreen extends StatefulWidget {
  const PayTicketScreen({super.key});

  static const routeName = 'pay-ticket-screen';

  @override
  State<PayTicketScreen> createState() => _PayTicketScreen();
}

class _PayTicketScreen extends State<PayTicketScreen> {
  static const String _errorMessage = "Ingrese el valor correcto";
  static const String _plate = "Buscar placa";

  final TextEditingController plateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Carros"),
      ),
      body: BlocConsumer<CarListBloc, CarListState>(
        listener: (context, state) {
          if (state is CarListError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          if (state is CarListLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CarListSuccess) {
            return _screen(state.ticketEntryList);
          } else {
            return const Center(child: Text("No hay datos disponibles"));
          }
        },
      ),
    );
  }

  Widget _screen(List<TicketEntry> ticketEntryList) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 15),
          textFieldPlate(),
          const SizedBox(height: 15),
          Expanded(
            child: ListView.builder(
              itemCount: ticketEntryList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Dimensions.d15,
                  ),
                  child: VehicleItem(
                    plate: ticketEntryList[index].vehicle.plate,
                    vehicleType:
                        ticketEntryList[index].vehicle is Car ? "C" : "M",
                    onTap: () {},
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 15),
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
          labelText: _plate,
          border: textFieldBorderDecoration,
          focusedBorder: textFieldBorderDecoration,
          enabledBorder: textFieldBorderDecoration,
          labelStyle:
              const TextStyle(color: Colors.black, fontSize: Dimensions.d15),
          hintText: _plate,
          prefixIcon: const Icon(Icons.search),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return _errorMessage;
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
