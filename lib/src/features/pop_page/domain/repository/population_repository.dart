import 'package:digital_profile/src/features/pop_page/data/models/population_model.dart';

abstract class PopulationRepository{
   Future<List<PopulationModel>> getPopData();
}