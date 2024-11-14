import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@injectable
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
