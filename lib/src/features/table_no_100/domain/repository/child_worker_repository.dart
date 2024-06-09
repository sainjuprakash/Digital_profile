import '../../data/model/child_worker_model.dart';

abstract class ChildWorkerRepository {
  Future<List<ChildWorkerModel>> getChildData(String baseUrl, String endPoint);
}
