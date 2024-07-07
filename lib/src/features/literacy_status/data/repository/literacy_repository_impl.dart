import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import '../../domain/repository/literacy_repository.dart';
import '../model/literacy_model.dart';

class ImplLiteracyRepository extends LiteracyRepository {
  final dio = Dio();

  @override
  Future<List<LiteracyModel>> getLiteracyData(
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
          await dio.get('$baseUrl/${endPoints}7');
      if (responseFromServer.statusCode == 200) {
        List<dynamic> data = responseFromServer.data['result'];
        print(data);
        return data.map((e) => LiteracyModel.fromJson(e)).toList();
      } else {
        throw Exception(responseFromServer.statusCode);
      }
    } catch (errMsg) {
      throw Exception('Unable to load disability dara $errMsg');
    }
  }
}
