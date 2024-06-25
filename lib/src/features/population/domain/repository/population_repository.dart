
import '../../data/models/population_model.dart';

abstract class PopulationRepository{
   Future<List<PopulationModel>> getPopData(String? baseUrl,String? endPoint);
}