import 'dart:io';

import 'package:digital_profile/src/features/animal_husbandry/data/model/animals_model.dart';
import 'package:digital_profile/src/features/animal_husbandry/domain/repository/animals_repository.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class ImplAnimalRepository extends AnimalRepository {
  @override
  Future<List<AnimalsModel>> getAnimalsData(
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
      Response<dynamic> response = await dio.get('$baseUrl/${endPoint}23');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['result'];
        return data.map((e) => AnimalsModel.fromJson(e)).toList();
      } else {
        throw Exception(response.statusCode);
      }
    } catch (errMsg) {
      throw Exception("Unable to load animals data $errMsg");
    }
  }
}
