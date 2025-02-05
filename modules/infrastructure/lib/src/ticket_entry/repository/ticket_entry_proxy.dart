import 'package:domain/domain.dart';
import 'package:infrastructure/src/ticket_entry/repository/contracts/ticket_entry_repository_database.dart';
import 'package:injectable/injectable.dart';

@Injectable(as:TicketEntryRepository)
class TicketEntryProxy implements TicketEntryRepository{
  TicketEntryProxy(
      TicketEntryRepositoryDatabase ticketEntryDbRepository,
      ) : _ticketEntryDbRepository = ticketEntryDbRepository;

  final TicketEntryRepositoryDatabase _ticketEntryDbRepository;

  @override
  Future<void> add(TicketEntry ticket) async {
    _ticketEntryDbRepository.add(ticket);
  }

  @override
  Future<bool> delete(String id) async {
    return (await _ticketEntryDbRepository.delete(id)) == null ? true : false ;
  }

  @override
  Future<TicketEntry?> getById(String id)  {
    return _ticketEntryDbRepository.getById(id);
  }

  @override
  Future<List<TicketEntry>> getList() async {
    return _ticketEntryDbRepository.getList();
  }

}