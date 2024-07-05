import 'package:digital_profile/src/features/residence/data/database/residence_database.dart';

Future<int?> addResidence(ResidenceTableData entry) async {
  final db = ResidenceDatabase();
  final dataEntered = db.createItem(entry);
  return dataEntered;
}

Future<List<ResidenceTableData>> getAllResidenceData() async {
  final db = ResidenceDatabase();
  try {
    final List<ResidenceTableData> residenceData =
        await db.select(db.residenceTable).get();
    return residenceData;
  } catch (errMsg) {
    throw Exception(errMsg);
  }
}
