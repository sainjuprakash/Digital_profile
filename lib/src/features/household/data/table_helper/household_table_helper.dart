import 'dart:convert';

import 'package:digital_profile/src/features/household/data/database/household_database.dart';
import 'package:drift/drift.dart';

import '../model/individual_family_model.dart';

final db = HouseholdDatabase();

Future<int?> addHousehold(HouseholdTableData entry) async {
  await db.createItem(entry);
}

Future<List<HouseholdTableData>> getAllHouseholdData() async {
  try {
    final List<HouseholdTableData> householdData =
        await db.select(db.householdTable).get();
    return householdData;
  } catch (e) {
    throw Exception(e);
  }
}

class IndividualFamilyDataListConverter
    extends TypeConverter<List<IndividualFamilyData>, String> {
  const IndividualFamilyDataListConverter();

  @override
  List<IndividualFamilyData> fromSql(String fromDb) {
    final List<dynamic> jsonList = jsonDecode(fromDb);
    return jsonList
        .map((jsonItem) =>
            IndividualFamilyData.fromJson(jsonItem as Map<String, dynamic>))
        .toList();
  }

  @override
  String toSql(List<IndividualFamilyData> value) {
    final List<Map<String, dynamic>> jsonList =
        value.map((item) => item.toJson()).toList();
    return jsonEncode(jsonList);
  }
}
