import '../../data/model/animals_model.dart';

abstract class AnimalRepository {
  Future<List<AnimalsModel>> getAnimalsData();
}
