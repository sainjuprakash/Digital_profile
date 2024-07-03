import '../database/ethnicity_population_database.dart';

Future<int?> addEthnicityPop(EthnicityPopTableData entry) async {
  final db = EthnicityPopDatabase();
  final dataEntered = await db.createItem(entry);
  return dataEntered;
}

Future<List<EthnicityPopTableData>> getALlEthnicityPop() async {
  final db = EthnicityPopDatabase();
  try {
    final List<EthnicityPopTableData> ethnicityData =
        await db.select(db.ethnicityPopTable).get();
    return ethnicityData;
  } catch (e) {
    throw Exception(e);
  }
}
