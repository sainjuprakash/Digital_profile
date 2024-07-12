import 'package:drift/drift.dart';

class LoanTable extends Table {
  IntColumn get wardNumber => integer()();
  IntColumn get agricultureLoan => integer().nullable()();
  IntColumn get houseExpLoan => integer().nullable()();
  IntColumn get businessLoan => integer().nullable()();
  IntColumn get foreignEmpLoan => integer().nullable()();
  IntColumn get educationLoan => integer().nullable()();
  IntColumn get medicalLoan => integer().nullable()();
  IntColumn get othersLoan => integer().nullable()();
  IntColumn get notAvailable => integer().nullable()();
  IntColumn get wardHouses => integer().nullable()();
  IntColumn get totalLoan => integer().nullable()();
}
