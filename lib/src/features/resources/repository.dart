// {"error":, "results":}

import 'dart:convert';


import 'package:flutter/services.dart';

import '../household/data/model/family_details_model.dart';
import '../household/data/model/individual_family_model.dart';

Future<List<FamilyDetailsModel>> LoadFamilyData() async {
  String jsonData = await rootBundle.loadString('assets/familyData.json');
  List<dynamic> jsonList = json.decode(jsonData);
  return jsonList.map((json) => FamilyDetailsModel.fromJson(json)).toList();
}

// todo: update to parse individual data
Future<List<IndividualFamilyData>> loadIndividualData() async {
  String jsonType = await rootBundle.loadString('assets/familyData.json');
  List<dynamic> jsonList = json.decode(jsonType);
  List<dynamic> groupFamily = jsonList.map((e) => e['group_family']).toList();
  return groupFamily.map((e) {
   // print("group family item: ${e}");
    return IndividualFamilyData.fromJson(e);
  }).toList();
  // return jsonList.map((e) {
  //   print("group family: ${e['group_family']}");
  //   final testObject = IndividualFamilyData.fromJson(e['group_family'][0]);
  //   return IndividualFamilyData.fromJson(e['group_family']);
  // }).toList();
}

