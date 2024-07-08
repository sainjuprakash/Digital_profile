import 'package:digital_profile/src/features/table_%20no_30/data/database/house_ownership_database.dart';

final db = OwnershipDatabase();

Future<int?> addHouseOwnershipData(OwnershipTableData entry) async {
  db.createItem(entry);
}

Future<List<OwnershipTableData>> getAllHouseOwnershipData() async {
  try {
    List<OwnershipTableData> ownershipData =
        await db.select(db.ownershipTable).get();
    return ownershipData;
  } catch (errMsg) {
    throw Exception(errMsg);
  }
}
