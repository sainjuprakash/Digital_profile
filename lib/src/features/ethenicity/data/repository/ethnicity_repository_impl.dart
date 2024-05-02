import 'dart:io';

import 'package:digital_profile/src/features/ethenicity/data/models/ethnicity_model.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import '../../domain/repository/ethnicity_repository.dart';

class GetEthenicityRepository extends EthnicityRepository {
  @override
  Future<List<EthnicityModel>> getEthnicityData() async {
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
      Response<dynamic> responseFromServer =
          await dio.get('http://rubytest.git.com.np/api/ethnicity');
      if (responseFromServer.statusCode == 200) {
        List<dynamic> results = responseFromServer.data['result'];
        print(results);
        return results.map((e) => EthnicityModel.fromJson(e)).toList();
      } else {
        throw Exception(responseFromServer.statusCode);
      }
    } catch (error) {
      throw Exception('Failed to load Ethnicity data : $error');
    }
  }
}
