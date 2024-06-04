import 'dart:io';

import 'package:digital_profile/src/features/table_no_64/data/model/expenses_model.dart';
import 'package:digital_profile/src/features/table_no_64/domain/repository/expenses_repository.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class ImplExpensesRepository extends ExpensesRepository {
  @override
  Future<List<ExpensesModel>> getExpensesData(
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
          await dio.get('$baseUrl/${endPoint}64');
      if (responseFromServer.statusCode == 200) {
        final List<dynamic> result = responseFromServer.data['result'];
        return result.map((e) => ExpensesModel.fromJson(e)).toList();
      } else {
        throw Exception(responseFromServer.statusCode);
      }
    } catch (errMsg) {
      throw Exception('Unable to load data $errMsg');
    }
  }
}
