import 'dart:io';

import 'package:digital_profile/src/features/residence/data/model/residence_model.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import '../../domain/repository/residence_repository.dart';

class ImplResidenceRepository extends ResidenceRepository {
  @override
  Future<List<ResidenceModel>> getResidenceData() async {
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
          'http://rubytest.git.com.np/api/household/reports?table_no=table8');

      if (responseFromServer.statusCode == 200) {
        List<dynamic> data = responseFromServer.data['result'];
        return data.map((e) => ResidenceModel.fromJson(e)).toList();
      } else {
        throw Exception(responseFromServer.statusCode);
      }
    } catch (errMsg) {
      throw Exception("Unable to load residence data $errMsg");
    }
  }
}
