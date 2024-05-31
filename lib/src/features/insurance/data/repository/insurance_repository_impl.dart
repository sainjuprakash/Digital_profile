import 'dart:io';

import 'package:digital_profile/src/features/insurance/data/model/insurance_model.dart';
import 'package:digital_profile/src/features/insurance/domain/repository/insurance_repository.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class ImplInsuranceRepository extends InsuranceRepository {
  @override
  Future<List<InsuranceModel>> getInsuranceData(
      String baseUrl, String endPoint) async {
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
      Response<dynamic> response = await dio.get("$baseUrl/${endPoint}13");
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['result'];
        return data.map((e) => InsuranceModel.fromJson(e)).toList();
      } else {
        throw Exception(response.statusCode);
      }
    } catch (errMsg) {
      throw Exception("Unable to load insurance data $errMsg");
    }
  }
}
