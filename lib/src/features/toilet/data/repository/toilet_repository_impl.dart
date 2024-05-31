import 'dart:io';

import 'package:digital_profile/src/features/toilet/data/model/toilet_model.dart';
import 'package:digital_profile/src/features/toilet/domain/repository/toilet_repository.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class ImplToiletRepository extends ToiletRepository {
  @override
  Future<List<ToiletModel>> getToiletData(
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
      Response<dynamic> responseFromServer =
          await dio.get('$baseUrl/${endPoint}17');
      if (responseFromServer.statusCode == 200) {
        final List<dynamic> result = responseFromServer.data['result'];
        return result.map((e) => ToiletModel.fromJson(e)).toList();
      } else {
        throw Exception(responseFromServer.statusCode);
      }
    } catch (errMsg) {
      throw Exception('Unable to load religion data $errMsg');
    }
  }
}
