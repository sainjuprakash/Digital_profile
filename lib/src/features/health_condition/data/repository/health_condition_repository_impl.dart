import 'dart:io';

import 'package:digital_profile/src/features/health_condition/data/model/health_condition_model.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import '../../domain/repository/health_condition_repository.dart';

class ImplHealthConditionRepository extends HealthConditionRepository {
  @override
  Future<List<HealthConditionModel>> getHealthCondition() async {
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
          'https://rubytest.git.com.np/api/household/reports?table_no=table11');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['result'];
        return data.map((e) => HealthConditionModel.fromJson(e)).toList();
      } else {
        throw Exception(response.statusCode);
      }
    } catch (errMsg) {
      throw Exception("Unable to load health condition data $errMsg");
    }
  }
}
