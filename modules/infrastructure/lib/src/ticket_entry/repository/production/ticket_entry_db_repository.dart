import 'package:domain/domain.dart';
import 'package:infrastructure/src/ticket_entry/anticorruption/ticket_entry_translator.dart';
import 'package:infrastructure/src/ticket_entry/persistence/dao/ticket_entry_car/ticket_entry_car_dao.dart';
import 'package:infrastructure/src/ticket_entry/persistence/dao/ticket_entry_motorcycle/ticket_entry_motorcycle_dao.dart';
import 'package:infrastructure/src/ticket_entry/repository/contracts/ticket_entry_repository_database.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: TicketEntryRepositoryDatabase)
class TicketEntryDbRepository extends TicketEntryRepositoryDatabase {
  TicketEntryDbRepository(TicketEntryCarDao ticketEntryCarDao,
      TicketEntryMotorcycleDao ticketEntryMotorcycleDaoDao)
      : _ticketEntryCarDao = ticketEntryCarDao,
        _ticketEntryMotorcycleDao = ticketEntryMotorcycleDaoDao;

  final TicketEntryCarDao _ticketEntryCarDao;
  final TicketEntryMotorcycleDao _ticketEntryMotorcycleDao;

  @override
  Future<void> add(TicketEntry ticket) async {
    final ticketEntry = ticket.vehicle;

    if (ticketEntry is Car) {
      _ticketEntryCarDao.insertTicketEntry(
          TicketEntryTranslator.fromCarDomainToDatabase(ticket));
    } else {
      _ticketEntryMotorcycleDao.insertTicketEntry(
          TicketEntryTranslator.fromMotorcyleDomainToDatabase(ticket));
    }
  }

  @override
  Future<List<TicketEntry>> getList() async {
    final cars = await _ticketEntryCarDao.getAllTickets();
    var listCar =
        cars.map(TicketEntryTranslator.fromCarDatabaseToDomain).toList();
    final motorcycles = await _ticketEntryMotorcycleDao.getAllTickets();
    var listMotorcycles = motorcycles
        .map(TicketEntryTranslator.fromMotorcycleDatabaseToDomain)
        .toList();
    listCar.addAll(listMotorcycles);
    return listCar;
  }

  @override
  Future<TicketEntry?> delete(String id) async {
    var ticketCar = await _ticketEntryCarDao.getTicketEntryById(id);
    var ticketMotorcycle =
        await _ticketEntryMotorcycleDao.getTicketEntryById(id);
    TicketEntry? result;
    if (ticketCar != null) {
      _ticketEntryCarDao.deleteTicketEntry(ticketCar.id);
      result = await getById(id);
    }
    if (ticketMotorcycle != null) {
      _ticketEntryMotorcycleDao.deleteTicketEntry(ticketMotorcycle.id);
      result = await getById(id);
    }
    return result;
  }

  @override
  Future<TicketEntry?> getById(String id) async {
    var ticketCar = await _ticketEntryCarDao.getTicketEntryById(id);
    var ticketMotorcycle =
        await _ticketEntryMotorcycleDao.getTicketEntryById(id);
    if (ticketCar != null) {
      return TicketEntryTranslator.fromCarDatabaseToDomain(ticketCar);
    }
    if (ticketMotorcycle != null) {
      return TicketEntryTranslator.fromMotorcycleDatabaseToDomain(
          ticketMotorcycle);
    }
    return null;
  }
}
