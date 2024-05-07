import 'dart:io';

import 'package:digital_profile/src/features/ethnicity_population/data/model/ethnicity_population.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import '../../domain/repository/ethnicity_population_repository.dart';

class ImplEthnicityPopulationRepository extends EthnicityPopulationRepository {
  @override
  Future<List<EthnicityPopulationModel>> getEthnicityPopulation() async {
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
          'http://rubytest.git.com.np/api/household/reports?table_no=table4');
      if (responseFromServer.statusCode == 200) {
        List<dynamic> results = responseFromServer.data['result'];
        //print(results);
        return results
            .map((e) => EthnicityPopulationModel.fromJson(e))
            .toList();
      } else {
        throw Exception(responseFromServer.statusCode);
      }
    } catch (errMsg) {
      print(errMsg);
      throw Exception("failed to load ethnicity population data $errMsg");
    }
  }
}
