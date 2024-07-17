import 'package:drift/drift.dart';

class EarthquakeDamageTable extends Table{
  IntColumn get wardNumber => integer()();
  IntColumn get isDamaged => integer().nullable()();
  IntColumn get isNotDamages => integer().nullable()();
  IntColumn get notAvailable => integer().nullable()();
  IntColumn get total => integer().nullable()();


}