import 'dart:io';

import 'package:digital_profile/src/features/home_facilities/data/model/home_facilities_model.dart';
import 'package:digital_profile/src/features/home_facilities/domain/repository/home_facilities_repository.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class ImplHomeFacilitiesRepository extends HomeFacilitiesRepository {
  @override
  Future<List<HomeFacilitiesModel>> getHomeFacilities() async {
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
          'http://rubytest.git.com.np/api/household/reports?table_no=table18');
      if (responseFromServer.statusCode == 200) {
        List<dynamic> results = responseFromServer.data['result'];
        //print(results);
        return results.map((e) => HomeFacilitiesModel.fromJson(e)).toList();
      } else {
        throw Exception(responseFromServer.statusCode);
      }
    } catch (errMsg) {
      throw Exception("failed to load home facilities data $errMsg");
    }
    throw UnimplementedError();
  }
}
