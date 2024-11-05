import 'package:domain/domain.dart';

class TicketEntryMotorcycleService extends TicketEntryService {
  TicketEntryMotorcycleService(super.ticketRepository);

  @override
  int get maxCapacityVehicle => 10;

  @override
  Future<List<TicketEntry>> getListTicket() async {
    List<TicketEntry> tickets = await getListTicketEntry();
    return tickets.where((ticket) => ticket.vehicle is Motorcycle).toList();
  }
}
