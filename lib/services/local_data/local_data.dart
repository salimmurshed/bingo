import 'package:injectable/injectable.dart';

import '../../const/database_helper.dart';

@lazySingleton
class LocalData {
  final dbHelper = DatabaseHelper.instance;
  void insert(tableName, tableData) async {
    for (int i = 0; i < tableData.length; i++) {
      var id = await dbHelper.insert(tableName, tableData[i].toJson());
      print(id);
    }
  }

  Future deleteDB() async {
    await dbHelper.deleteDB();
  }

  void delete(tableName) async {
    dbHelper.delete(tableName);
  }
}
