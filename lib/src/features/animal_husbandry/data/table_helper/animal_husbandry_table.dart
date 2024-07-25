import 'package:drift/drift.dart';

class AnimalTable extends Table {
  TextColumn get villageName => text()();
  IntColumn get wardNumber => integer()();
  IntColumn get wardHouses => integer().nullable()();
  IntColumn get wardBirds => integer().nullable()();
  IntColumn get wardLivestock => integer().nullable()();
}
