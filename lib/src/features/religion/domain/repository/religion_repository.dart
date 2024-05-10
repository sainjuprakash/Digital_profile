import 'package:digital_profile/src/features/religion/data/model/religion_model.dart';

abstract class ReligionRepository {
  Future<List<ReligionModel>> getReligionData();
}
