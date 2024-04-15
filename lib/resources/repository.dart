// {"error":, "results":}

import 'dart:convert';

import 'package:flutter/services.dart';

import 'family_details.dart';
import 'individual_family_data.dart';

Future<List<FamilyDetailsModel>> LoadFamilyData() async {
  String jsonData = await rootBundle.loadString('assets/familyData.json');
  List<dynamic> jsonList = json.decode(jsonData);
  print('-------------------------');
  print(jsonList);
  return jsonList.map((json) => FamilyDetailsModel.fromJson(json)).toList();
}

Future<List<IndividualFamilyData>> loadIndividualData() async{
  String jsonType= await rootBundle.loadString('assets/familyData.json');
  List<dynamic> jsonList =json.decode(jsonType);
  return jsonList.map((e) => IndividualFamilyData.fromJson(e)).toList();
}