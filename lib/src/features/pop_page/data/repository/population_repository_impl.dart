import 'dart:io';

import 'package:digital_profile/src/features/pop_page/data/models/population_model.dart';
import 'package:digital_profile/src/features/pop_page/data/models/population_response_model.dart';
import 'package:digital_profile/src/features/pop_page/domain/repository/population_repository.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class GetPopulationRepository extends PopulationRepository {
  final dio = Dio();
  @override
  Future<List<PopulationModel>> getPopData() async {
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

    //String endPoint = 'http://rubytest.git.com.np/api/pop';
    dynamic response = await dio.get('http://rubytest.git.com.np/api/pop');
    //print(response);
    if (response.statusCode == 200) {
      final responseModel = PopulationResponseModel.fromJson(response.data);
      return responseModel.result;
    } else {
      //print(response.reasonPhrase);
      throw Exception(response.reasonPhrase);
    }
  }
}
