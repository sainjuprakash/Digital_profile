import 'dart:io';

import 'package:digital_profile/src/features/household/data/model/family_details_model.dart';
import 'package:digital_profile/src/features/household/domain/repository/household_repository.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class ImplHouseholdRepository implements HouseholdRepository {
  @override
  Future<List<FamilyDetailsModel>> getFamilyDetails(String houseHoldUrl) async {
    final dio = Dio();
    dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        // Don't trust any certificate just because their root cert is trusted.
        final HttpClient client =
            HttpClient(context: SecurityContext(withTrustedRoots: false));
        // You can test the intermediate / root cert here. We just ignore it.
        client.badCertificateCallback =
            ((X509Certificate cert, String host, int port) => true);
        return client;
      },
    );
    try {
      Response<dynamic> response = await dio
          .get(houseHoldUrl);
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data.map((e) => FamilyDetailsModel.fromJson(e)).toList();
      } else {
        throw Exception(response.statusCode);
      }
    } catch (errMsg) {
      throw Exception("Unable to load data $errMsg");
    }
  }
}
