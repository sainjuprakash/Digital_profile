import 'package:digital_profile/src/features/table_no_100/data/database/child_worker_database.dart';

final db = ChildWorkerDatabase();
Future<int?> addChildData(ChildWorkerTableData entry) async {
  db.createItem(entry);
}

Future<List<ChildWorkerTableData>> getAllChildData() async {
  try {
    List<ChildWorkerTableData> childData =
        await db.select(db.childWorkerTable).get();
    return childData;
  } catch (errMsg) {
    throw Exception(errMsg);
  }
}
