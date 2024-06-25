import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import '../../domain/repository/population_repository.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../models/population_model.dart';

class GetPopulationRepository extends PopulationRepository {
  final dio = Dio();
  @override
  Future<List<PopulationModel>> getPopData(
      String? baseUrl, String? endPoint) async {
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
      Response<dynamic> response = await dio.get('$baseUrl/${endPoint}1');
      if (response.statusCode == 200) {
        final List<dynamic> results = response.data['result'];
        return results.map((e) => PopulationModel.fromJson(e)).toList();
      } else {
        throw Exception(response.statusCode);
      }
    } catch (error) {
      throw Exception('Failed to load population data : $error');
    }
  }
}

Future<bool> isConnectedToWiFi() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  return connectivityResult == ConnectivityResult.wifi;
}
