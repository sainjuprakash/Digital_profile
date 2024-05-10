import 'dart:io';

import 'package:digital_profile/src/features/age_table2_2/data/model/population_acc_age.dart';
import 'package:digital_profile/src/features/age_table2_2/domain/repository/population_acc_age_repository.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class ImplAgeRepository extends AgeRepository {
  final dio = Dio();
  @override
  Future<List<AgePopulationModel>> getAgeData() async {
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
          'http://rubytest.git.com.np/api/household/reports?table_no=table2_2');
      if (responseFromServer.statusCode == 200) {
        List<dynamic> data = responseFromServer.data['result'];
        return data.map((e) => AgePopulationModel.fromJson(e)).toList();
      } else {
        throw Exception(responseFromServer.statusCode);
      }
    } catch (errMsg) {
      throw Exception("Unable to load data accoriding to age $errMsg");
    }
  }
}
