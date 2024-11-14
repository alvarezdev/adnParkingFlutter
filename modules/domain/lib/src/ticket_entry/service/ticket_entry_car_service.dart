import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@injectable
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
