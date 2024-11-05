import 'package:domain/domain.dart';

class TicketEntryCarService extends TicketEntryService {
  TicketEntryCarService(super.ticketRepository);

  @override
  int get maxCapacityVehicle => 20;

  @override
  Future<List<TicketEntry>> getListTicket() async {
    List<TicketEntry> tickets = await getListTicketEntry();
    return tickets.where((ticket) => ticket.vehicle is Car).toList();
  }
}
