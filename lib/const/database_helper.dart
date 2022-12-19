import 'dart:io';

import 'package:bingo_wholesale/services/local_data/table_names.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  final _databaseName = "bingo_database_15.db";
  final _databaseVersion = 15;

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE ${TableNames.countryTableName} ("
        "${DataBaseHelperKeys.id} INTEGER PRIMARY KEY,"
        "${DataBaseHelperKeys.country} TEXT NOT NULL,"
        "${DataBaseHelperKeys.timezone} TEXT NOT NULL,"
        "${DataBaseHelperKeys.glId} INTEGER NOT NULL,"
        "${DataBaseHelperKeys.status} TEXT NOT NULL,"
        "${DataBaseHelperKeys.date} TEXT NOT NULL,"
        "${DataBaseHelperKeys.currency} TEXT NOT NULL,"
        "${DataBaseHelperKeys.branchLegal} TEXT NOT NULL,"
        "${DataBaseHelperKeys.address} TEXT NOT NULL,"
        "${DataBaseHelperKeys.taxid} TEXT NOT NULL,"
        "${DataBaseHelperKeys.taxIdType} TEXT NOT NULL,"
        "${DataBaseHelperKeys.countryCode} TEXT NOT NULL,"
        "${DataBaseHelperKeys.language} TEXT NOT NULL"
        ")");
    await db.execute("CREATE TABLE ${TableNames.storeTableName}("
        "${DataBaseHelperKeys.id} INTEGER PRIMARY KEY,"
        "${DataBaseHelperKeys.uniqueId} TEXT NOT NULL,"
        "${DataBaseHelperKeys.name} TEXT NOT NULL,"
        "${DataBaseHelperKeys.city} TEXT NOT NULL,"
        "${DataBaseHelperKeys.address} INTEGER NOT NULL,"
        "${DataBaseHelperKeys.remarks} TEXT NOT NULL,"
        "${DataBaseHelperKeys.status} TEXT NOT NULL"
        ")");
    await db.execute("CREATE TABLE ${TableNames.wholesalerList}("
        "${DataBaseHelperKeys.id} INTEGER PRIMARY KEY,"
        "${DataBaseHelperKeys.uniqueId} TEXT NOT NULL,"
        "${DataBaseHelperKeys.name} TEXT NOT NULL"
        ")");
    await db.execute("CREATE TABLE ${TableNames.fiaList}("
        "${DataBaseHelperKeys.id} INTEGER PRIMARY KEY,"
        "${DataBaseHelperKeys.uniqueId} TEXT NOT NULL,"
        "${DataBaseHelperKeys.name} TEXT NOT NULL"
        ")");
    await db.execute("CREATE TABLE ${TableNames.retailerAssociationList}("
        "${DataBaseHelperKeys.uniqueId} TEXT NOT NULL,"
        "${DataBaseHelperKeys.associationUniqueId} TEXT NOT NULL,"
        "${DataBaseHelperKeys.wholesalerName} TEXT NOT NULL,"
        "${DataBaseHelperKeys.phoneNumber} TEXT NOT NULL,"
        "${DataBaseHelperKeys.id} TEXT NOT NULL,"
        "${DataBaseHelperKeys.email} TEXT NOT NULL,"
        "${DataBaseHelperKeys.status} TEXT NOT NULL,"
        "${DataBaseHelperKeys.statusFie} TEXT NOT NULL"
        ")");
    await db.execute("CREATE TABLE ${TableNames.wholeSalerAssociationList}("
        "${DataBaseHelperKeys.uniqueId} TEXT NOT NULL,"
        "${DataBaseHelperKeys.associationUniqueId} TEXT NOT NULL,"
        "${DataBaseHelperKeys.retailerName} TEXT NOT NULL,"
        "${DataBaseHelperKeys.phoneNumber} TEXT NOT NULL,"
        "${DataBaseHelperKeys.id} TEXT NOT NULL,"
        "${DataBaseHelperKeys.email} TEXT NOT NULL,"
        "${DataBaseHelperKeys.status} TEXT NOT NULL"
        ")");
    await db.execute("CREATE TABLE ${TableNames.retailerCreditlineRequestList}("
        "${DataBaseHelperKeys.creditlineUniqueId} TEXT NOT NULL,"
        "${DataBaseHelperKeys.type} TEXT NOT NULL,"
        "${DataBaseHelperKeys.dateRequested} TEXT NOT NULL,"
        "${DataBaseHelperKeys.status} INT NOT NULL,"
        "${DataBaseHelperKeys.fieName} TEXT NOT NULL,"
        "${DataBaseHelperKeys.wholesalerName} TEXT NOT NULL,"
        "${DataBaseHelperKeys.fieUniqueId} TEXT NOT NULL,"
        "${DataBaseHelperKeys.wholesalerUniqueId} TEXT NOT NULL,"
        "${DataBaseHelperKeys.associationUniqueId} TEXT NOT NULL,"
        "${DataBaseHelperKeys.requestedAmount} TEXT NOT NULL,"
        "${DataBaseHelperKeys.statusDescription} TEXT NOT NULL,"
        "${DataBaseHelperKeys.currency} TEXT NOT NULL"
        ")");
    await db.execute("CREATE TABLE ${TableNames.fieFistForCreditlineRequest}("
        "${DataBaseHelperKeys.id} INTEGER PRIMARY KEY,"
        "${DataBaseHelperKeys.fieUniqueId} TEXT NOT NULL,"
        "${DataBaseHelperKeys.bpName} TEXT NOT NULL"
        ")");
  }

  Future<int> insert(tableName, row) async {
    Database db = await instance.database;
    return await db.insert(tableName, row,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  void delete(tableName) async {
    Database db = await instance.database;
    await db.delete(tableName);
  }

  Future deleteDB() async {
    Database db = await instance.database;
    await db.delete(TableNames.countryTableName);
    await db.delete(TableNames.fiaList);
    await db.delete(TableNames.retailerAssociationList);
    await db.delete(TableNames.storeTableName);
    await db.delete(TableNames.wholeSalerAssociationList);
    await db.delete(TableNames.wholesalerList);
    await db.delete(TableNames.retailerCreditlineRequestList);
    await db.delete(TableNames.fieFistForCreditlineRequest);
  }

  Future<List<Map<String, dynamic>>> queryAllRows(tblName) async {
    Database db = await instance.database;
    return await db.query(tblName);
  }

  // Future<int?> queryRowCount() async {
  //   Database db = await instance.database;
  //   return Sqflite.firstIntValue(
  //       await db.rawQuery('SELECT COUNT(*) FROM $countries'));
  // }

  // Future<int> update(Map<String, dynamic> row) async {
  //   Database db = await instance.database;
  //   int id = row['id'];
  //   return await db.update(countries, row, where: '$id = ?', whereArgs: [id]);
  // }

  // Future<int> delete(int id) async {
  //   Database db = await instance.database;
  //   return await db.delete(countries, where: '$id = ?', whereArgs: [id]);
  // }
}

class DataBaseHelperKeys {
  static String id = "id";
  static String country = 'country';
  static String timezone = 'timezone';
  static String glId = "gl_id";
  static String status = "status";
  static String date = "date";
  static String currency = 'currency';
  static String branchLegal = 'branch_legal';
  static String address = 'address';
  static String taxid = 'taxid';
  static String taxIdType = 'tax_id_type';
  static String countryCode = 'country_code';
  static String language = 'language';
  static String uniqueId = 'unique_id';
  static String name = 'name';
  static String city = 'city';
  static String remarks = 'remarks';
  static String associationUniqueId = 'association_unique_id';
  static String wholesalerName = 'wholesaler_name';
  static String retailerName = 'retailer_name';
  static String phoneNumber = 'phone_number';
  static String email = 'email';
  static String statusFie = 'status_fie';
  static String creditlineUniqueId = 'creditline_unique_id';
  static String type = 'type';
  static String dateRequested = 'date_requested';
  static String fieName = 'fie_name';
  static String fieUniqueId = 'fie_unique_id';
  static String wholesalerUniqueId = 'wholesaler_unique_id';
  static String statusDescription = 'status_description';
  static String requestedAmount = 'requested_amount';
  static String bpName = 'bp_name';
}
