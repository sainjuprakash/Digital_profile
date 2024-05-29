import 'dart:io';

import 'package:digital_profile/src/features/marriage/data/model/marriage_status_model.dart';
import 'package:digital_profile/src/features/marriage/domain/repository/marriage_status_repository.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class ImplMarriageRepository extends MarriageRepository {
  final dio = Dio();
  @override
  Future<List<MarriageStatusModel>> getMarriageData(
      String baseUrl, String endpoints) async {
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
      Response<dynamic> response = await dio.get("$baseUrl/${endpoints}10");
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['result'];
        return data.map((e) => MarriageStatusModel.fromJson(e)).toList();
      } else {
        throw Exception(response.statusCode);
      }
    } catch (errMsg) {
      throw Exception('Unable to load marriage data $errMsg');
    }
  }
}
