import 'package:drift/drift.dart';

class MeatTable extends Table {
  TextColumn get villageName => text()();
  IntColumn get wardNumber => integer()();
  IntColumn get animalsQuantity => integer().nullable()();
  IntColumn get meatKg => integer().nullable()();
  IntColumn get meatEarning => integer().nullable()();
  IntColumn get houseCount => integer().nullable()();
}
