import 'package:digital_profile/src/features/toilet/data/model/toilet_model.dart';

abstract class ToiletRepository {
  Future<List<ToiletModel>> getToiletData(String baseUrl, String endPoint);
}
