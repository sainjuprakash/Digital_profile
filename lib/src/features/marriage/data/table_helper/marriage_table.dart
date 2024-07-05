import 'package:drift/drift.dart';

class MarriageTable extends Table{
  IntColumn get wardNumber => integer()();
  IntColumn get single => integer().nullable()();
  IntColumn get singleWoman => integer().nullable()();
  IntColumn get singleMan => integer().nullable()();
  IntColumn get married => integer().nullable()();
  IntColumn get polygami => integer().nullable()();
  IntColumn get divorced => integer().nullable()();
  IntColumn get remarried => integer().nullable()();
  IntColumn get seperated => integer().nullable()();
  IntColumn get underage => integer().nullable()();
  IntColumn get notAvailable => integer().nullable()();
  IntColumn get totalMaritalStatus => integer().nullable()();


}