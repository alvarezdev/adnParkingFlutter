import 'package:domain/domain.dart';
import 'package:infrastructure/src/ticket_entry/repository/contracts/ticket_entry_repository_database.dart';


class TicketEntryCarDbRepositoryDev extends TicketEntryRepositoryDatabase{
  @override
  Future<void> add(TicketEntry ticket) {
    throw UnimplementedError();
  }

  @override
  Future<void> delete(String id) {
    throw UnimplementedError();
  }

  @override
  Future<TicketEntry?> getById(String id) {
    throw UnimplementedError();
  }

  @override
  Future<List<TicketEntry>> getList() {
    throw UnimplementedError();
  }


}