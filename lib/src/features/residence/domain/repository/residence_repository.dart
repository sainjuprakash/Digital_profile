import '../../data/model/residence_model.dart';

abstract class ResidenceRepository {
  Future<List<ResidenceModel>> getResidenceData();
}
