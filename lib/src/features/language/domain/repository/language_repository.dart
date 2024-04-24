import 'package:digital_profile/src/features/language/data/models/language_model.dart';

abstract class LanguageRepository{
  Future<List<LanguageModel>> getLanguageData();
}