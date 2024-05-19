import 'dart:io';

import 'package:digital_profile/src/features/electricity/data/model/electricity_model.dart';
import 'package:digital_profile/src/features/electricity/domain/repository/electricity_repository.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class ImplElectricityRepository extends ElectricityRepository {
  @override
  Future<List<ElectricityModel>> getElectricityData() async {
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
      Response<dynamic> response = await dio.get(
          "http://rubytest.git.com.np/api/household/reports?table_no=table16");
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['result'];
        return data.map((e) => ElectricityModel.fromJson(e)).toList();
      } else {
        throw Exception(response.statusCode);
      }
    } catch (errMsg) {
      throw Exception("Unable to load electricity data $errMsg");
    }
  }
}
