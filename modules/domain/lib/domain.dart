library;

import 'package:injectable/injectable.dart';

export 'src/vehicle/model/vehicle.dart';
export 'src/vehicle/model/car.dart';
export 'src/vehicle/model/motorcycle.dart';

export 'src/ticket_entry/model/ticket_entry.dart';
export 'src/ticket_exit/model/ticket_exit_motorcycle.dart';
export 'src/ticket_exit/model/ticket_exit_car.dart';

export 'src/ticket_entry/repository/ticket_repository.dart';

export 'src/ticket_entry/service/ticket_entry_service.dart';
export 'src/ticket_entry/service/ticket_entry_car_service.dart';
export 'src/ticket_entry/service/ticket_entry_motorcycle_service.dart';

export 'src/shared/exception/business_exception.dart';

@InjectableInit.microPackage()
void initDomain() {}