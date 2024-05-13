import 'package:digital_profile/src/features/literacy_status/data/model/literacy_model.dart';

abstract class LiteracyRepository {
  Future<List<LiteracyModel>> getLiteracyData();
}
