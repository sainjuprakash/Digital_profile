import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import '../../domain/repository/house_condition_repository.dart';
import '../model/house_condition_model.dart';

class ImplHouseRepository extends HouseConditionRepository {
  @override
  Future<List<HouseConditionModel>> getHomeData() async {
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
      Response<dynamic> response = await dio.get(
          "http://rubytest.git.com.np/api/household/reports?table_no=table31");
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['result'];
        return data.map((e) => HouseConditionModel.fromJson(e)).toList();
      } else {
        throw Exception(response.statusCode);
      }
    } catch (errMsg) {
      throw Exception("Unable to load house condition data $errMsg");
    }
  }
}
