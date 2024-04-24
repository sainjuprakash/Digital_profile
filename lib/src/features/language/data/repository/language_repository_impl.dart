import 'dart:io';
import 'package:digital_profile/src/features/language/data/models/language_model.dart';
import 'package:digital_profile/src/features/language/domain/repository/language_repository.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class GetLanguageRepository extends LanguageRepository {
  final dio = Dio();
  @override
  Future<List<LanguageModel>> getLanguageData() async {
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
          await dio.get('http://rubytest.git.com.np/api/language');
      if (responseFromServer.statusCode == 200) {
        final List<dynamic> results = responseFromServer.data['result'];
        return results.map((e) => LanguageModel.fromJson(e)).toList();
      } else {
        throw Exception(responseFromServer.statusCode);
      }
    } catch (error) {
      throw Exception('Failed to load Language data : $error');
    }
  }
}
