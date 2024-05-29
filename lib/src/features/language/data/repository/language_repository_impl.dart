import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import '../../domain/repository/language_repository.dart';
import '../models/language_model.dart';

class GetLanguageRepository extends LanguageRepository {

  @override
  Future<List<LanguageModel>> getLanguageData(String baseUrl) async {
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
      Response<dynamic> responseFromServer = await dio.get(
          '$baseUrl/api/household/reports?table_no=table5');
      if (responseFromServer.statusCode == 200) {
        final List<dynamic> results = responseFromServer.data['result'];
        //print(results);
        return results.map((e) => LanguageModel.fromJson(e)).toList();
      } else {
        throw Exception(responseFromServer.statusCode);
      }
    } catch (error) {
      throw Exception('Failed to load Language data : $error');
    }
  }
}
