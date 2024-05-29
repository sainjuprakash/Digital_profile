import 'dart:io';

import 'package:digital_profile/src/features/disability/data/model/disability_model.dart';
import 'package:digital_profile/src/features/disability/domain/repository/disability_repository.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class ImplDisabilityRepository extends DisabilityRepository {
  final dio = Dio();
  @override
  Future<List<DisabilityModel>> getDisabilityData(
      String baseUrl, String endPoints) async {
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
          await dio.get('$baseUrl/${endPoints}9');
      if (responseFromServer.statusCode == 200) {
        List<dynamic> data = responseFromServer.data['result'];
        return data.map((e) => DisabilityModel.fromJson(e)).toList();
      } else {
        throw Exception(responseFromServer.statusCode);
      }
    } catch (errMsg) {
      throw Exception('Unable to load disability dara $errMsg');
    }
  }
}
