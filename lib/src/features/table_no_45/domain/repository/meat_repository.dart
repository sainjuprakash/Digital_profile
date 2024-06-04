import '../../data/model/meat_model.dart';

abstract class MeatRepository {
  Future<List<MeatModel>> getMeatData(String baseUrl, String endPoint);
}
