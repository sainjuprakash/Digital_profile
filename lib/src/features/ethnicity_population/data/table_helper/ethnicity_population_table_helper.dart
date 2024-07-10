import '../database/ethnicity_population_database.dart';

final db = EthnicityPopDatabase();

Future<int?> addEthnicityPop(EthnicityPopTableData entry) async {
  await db.createItem(entry);
}

Future<List<EthnicityPopTableData>> getALlEthnicityPop() async {
  try {
    final List<EthnicityPopTableData> ethnicityData =
        await db.select(db.ethnicityPopTable).get();
    return ethnicityData;
  } catch (e) {
    throw Exception(e);
  }
}
