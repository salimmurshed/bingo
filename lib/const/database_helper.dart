import 'dart:io';

import 'package:bingo_wholesale/services/local_data/table_names.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  final _databaseName = "bingo_database_17.db";
  final _databaseVersion = 17;

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
        "${DataBaseHelperKeys.id} INTEGER ,"
        "${DataBaseHelperKeys.country} TEXT PRIMARY KEY NOT NULL,"
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
        "${DataBaseHelperKeys.id} INTEGER ,"
        "${DataBaseHelperKeys.uniqueId} TEXT PRIMARY KEY NOT NULL,"
        "${DataBaseHelperKeys.name} TEXT NOT NULL,"
        "${DataBaseHelperKeys.city} TEXT NOT NULL,"
        "${DataBaseHelperKeys.address} INTEGER NOT NULL,"
        "${DataBaseHelperKeys.remarks} TEXT NOT NULL,"
        "${DataBaseHelperKeys.status} TEXT NOT NULL"
        ")");
    await db.execute("CREATE TABLE ${TableNames.wholesalerList}("
        "${DataBaseHelperKeys.id} INTEGER ,"
        "${DataBaseHelperKeys.uniqueId} TEXT PRIMARY KEY NOT NULL,"
        "${DataBaseHelperKeys.name} TEXT NOT NULL"
        ")");
    await db.execute("CREATE TABLE ${TableNames.fiaList}("
        "${DataBaseHelperKeys.id} INTEGER,"
        "${DataBaseHelperKeys.uniqueId} TEXT PRIMARY KEY NOT NULL,"
        "${DataBaseHelperKeys.name} TEXT NOT NULL"
        ")");
    await db.execute("CREATE TABLE ${TableNames.retailerAssociationList}("
        "${DataBaseHelperKeys.uniqueId} TEXT PRIMARY KEY NOT NULL,"
        "${DataBaseHelperKeys.associationUniqueId} TEXT NOT NULL,"
        "${DataBaseHelperKeys.wholesalerName} TEXT NOT NULL,"
        "${DataBaseHelperKeys.fieName} TEXT NOT NULL,"
        "${DataBaseHelperKeys.phoneNumber} TEXT NOT NULL,"
        "${DataBaseHelperKeys.id} TEXT NOT NULL,"
        "${DataBaseHelperKeys.email} TEXT NOT NULL,"
        "${DataBaseHelperKeys.status} TEXT NOT NULL,"
        "${DataBaseHelperKeys.statusFie} TEXT NOT NULL"
        ")");
    await db.execute("CREATE TABLE ${TableNames.retailerFieAssociationList}("
        "${DataBaseHelperKeys.uniqueId} TEXT PRIMARY KEY NOT NULL,"
        "${DataBaseHelperKeys.associationUniqueId} TEXT NOT NULL,"
        "${DataBaseHelperKeys.wholesalerName} TEXT NOT NULL,"
        "${DataBaseHelperKeys.fieName} TEXT NOT NULL,"
        "${DataBaseHelperKeys.phoneNumber} TEXT NOT NULL,"
        "${DataBaseHelperKeys.id} TEXT NOT NULL,"
        "${DataBaseHelperKeys.email} TEXT NOT NULL,"
        "${DataBaseHelperKeys.status} TEXT NOT NULL,"
        "${DataBaseHelperKeys.statusFie} TEXT NOT NULL"
        ")");
    await db.execute("CREATE TABLE ${TableNames.wholeSalerAssociationList}("
        "${DataBaseHelperKeys.uniqueId} TEXT  PRIMARY KEY NOT NULL,"
        "${DataBaseHelperKeys.associationUniqueId} TEXT NOT NULL,"
        "${DataBaseHelperKeys.retailerName} TEXT NOT NULL,"
        "${DataBaseHelperKeys.phoneNumber} TEXT NOT NULL,"
        "${DataBaseHelperKeys.id} TEXT NOT NULL,"
        "${DataBaseHelperKeys.email} TEXT NOT NULL,"
        "${DataBaseHelperKeys.status} TEXT NOT NULL"
        ")");
    await db.execute("CREATE TABLE ${TableNames.retailerCreditlineRequestList}("
        "${DataBaseHelperKeys.creditlineUniqueId} TEXT PRIMARY KEY NOT NULL,"
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
        "${DataBaseHelperKeys.id} INTEGER KEY,"
        "${DataBaseHelperKeys.fieUniqueId} TEXT PRIMARY KEY NOT NULL,"
        "${DataBaseHelperKeys.bpName} TEXT NOT NULL"
        ")");
    await db
        .execute("CREATE TABLE ${TableNames.wholesalerCreditlineRequestList}("
            "${DataBaseHelperKeys.id} INTEGER PRIMARY KEY NOT NULL,"
            "${DataBaseHelperKeys.uniqueId} TEXT NOT NULL,"
            "${DataBaseHelperKeys.associationId} INTEGER NOT NULL,"
            "${DataBaseHelperKeys.fieId} TEXT NOT NULL,"
            "${DataBaseHelperKeys.bpIdF} INTEGER NOT NULL,"
            "${DataBaseHelperKeys.bpIdR} INTEGER NOT NULL,"
            "${DataBaseHelperKeys.monthlyPurchase} TEXT NOT NULL,"
            "${DataBaseHelperKeys.averagePurchaseTickets} TEXT NOT NULL,"
            "${DataBaseHelperKeys.requestedAmount} TEXT NOT NULL,"
            "${DataBaseHelperKeys.customerSinceDate} TEXT NOT NULL,"
            "${DataBaseHelperKeys.monthlySales} TEXT NOT NULL,"
            "${DataBaseHelperKeys.averageSalesTicket} TEXT NOT NULL,"
            "${DataBaseHelperKeys.rcCrlineAmt} TEXT NOT NULL,"
            "${DataBaseHelperKeys.visitFrequency} INTEGER NOT NULL,"
            "${DataBaseHelperKeys.creditOfficerGroup} TEXT NOT NULL,"
            "${DataBaseHelperKeys.commercialName1} TEXT NOT NULL,"
            "${DataBaseHelperKeys.commercialPhone1} TEXT NOT NULL,"
            "${DataBaseHelperKeys.commercialName2} TEXT NOT NULL,"
            "${DataBaseHelperKeys.commercialPhone2} TEXT NOT NULL,"
            "${DataBaseHelperKeys.commercialName3} TEXT NOT NULL,"
            "${DataBaseHelperKeys.commercialPhone3} TEXT NOT NULL,"
            "${DataBaseHelperKeys.currency} TEXT NOT NULL,"
            "${DataBaseHelperKeys.financialStatements} TEXT NOT NULL,"
            "${DataBaseHelperKeys.status} INTEGER NOT NULL,"
            "${DataBaseHelperKeys.country} TEXT NOT NULL,"
            "${DataBaseHelperKeys.statusFie} INTEGER NOT NULL,"
            "${DataBaseHelperKeys.approvedCreditLineAmount} INTEGER NOT NULL,"
            "${DataBaseHelperKeys.approvedCreditLineCurrency} TEXT NOT NULL,"
            "${DataBaseHelperKeys.clInternalId} TEXT NOT NULL,"
            "${DataBaseHelperKeys.startDate} TEXT NOT NULL,"
            "${DataBaseHelperKeys.expirationDate} TEXT NOT NULL,"
            "${DataBaseHelperKeys.clApprovedDate} TEXT NOT NULL,"
            "${DataBaseHelperKeys.clType} INTEGER NOT NULL,"
            "${DataBaseHelperKeys.isForward} INTEGER NOT NULL,"
            "${DataBaseHelperKeys.actionBy} TEXT NOT NULL,"
            "${DataBaseHelperKeys.actionEnrollement} TEXT NOT NULL,"
            "${DataBaseHelperKeys.authorizationDate} TEXT NOT NULL,"
            "${DataBaseHelperKeys.isFieRespond} INTEGER NOT NULL,"
            "${DataBaseHelperKeys.type} TEXT NOT NULL,"
            "${DataBaseHelperKeys.parentClId} INTEGER NOT NULL,"
            "${DataBaseHelperKeys.createdAt} TEXT NOT NULL,"
            "${DataBaseHelperKeys.updatedAt} TEXT NOT NULL,"
            "${DataBaseHelperKeys.fieName} TEXT NOT NULL,"
            "${DataBaseHelperKeys.retailerName} TEXT NOT NULL,"
            "${DataBaseHelperKeys.fieUniqueId} TEXT NOT NULL,"
            "${DataBaseHelperKeys.wholesalerUniqueId} TEXT NOT NULL,"
            "${DataBaseHelperKeys.associationUniqueId} TEXT NOT NULL,"
            "${DataBaseHelperKeys.statusDescription} TEXT NOT NULL,"
            "${DataBaseHelperKeys.dateRequested} TEXT NOT NULL"
            ")");

    await db.execute("CREATE TABLE ${TableNames.retailerList}("
        "${DataBaseHelperKeys.bpIdR} TEXT PRIMARY KEY NOT NULL,"
        "${DataBaseHelperKeys.internalId} TEXT NOT NULL,"
        "${DataBaseHelperKeys.associationUniqueId} TEXT NOT NULL,"
        "${DataBaseHelperKeys.retailerName} TEXT NOT NULL"
        ")");
    await db.execute("CREATE TABLE ${TableNames.storeList}("
        "${DataBaseHelperKeys.storeId} TEXT PRIMARY KEY NOT NULL,"
        "${DataBaseHelperKeys.name} TEXT NOT NULL,"
        "${DataBaseHelperKeys.city} TEXT NOT NULL,"
        "${DataBaseHelperKeys.address} TEXT NOT NULL,"
        "${DataBaseHelperKeys.associationIdStore} TEXT NOT NULL,"
        "${DataBaseHelperKeys.saleType} TEXT NOT NULL,"
        "${DataBaseHelperKeys.creditlineId} TEXT NOT NULL,"
        "${DataBaseHelperKeys.approvedCreditLineCurrency} TEXT NOT NULL,"
        "${DataBaseHelperKeys.availableAmount} NUMBER NOT NULL"
        ")");
    await db.execute("CREATE TABLE ${TableNames.createSales}("
        "${DataBaseHelperKeys.id}  INTEGER PRIMARY KEY AUTOINCREMENT,"
        "${DataBaseHelperKeys.bpIdR} TEXT NOT NULL,"
        "${DataBaseHelperKeys.storeId} TEXT NOT NULL,"
        "${DataBaseHelperKeys.wholesalerStoreId} TEXT NOT NULL,"
        "${DataBaseHelperKeys.saleType} TEXT NOT NULL,"
        "${DataBaseHelperKeys.invoiceNumber} TEXT NOT NULL,"
        "${DataBaseHelperKeys.orderNumber} TEXT NOT NULL,"
        "${DataBaseHelperKeys.currency} TEXT NOT NULL,"
        "${DataBaseHelperKeys.amount} TEXT NOT NULL,"
        "${DataBaseHelperKeys.description} TEXT NOT NULL"
        ")");
    await db.execute("CREATE TABLE ${TableNames.retailerBankAccounts}("
        "${DataBaseHelperKeys.uniqueId}  INTEGER PRIMARY KEY,"
        "${DataBaseHelperKeys.status} TEXT NOT NULL,"
        "${DataBaseHelperKeys.bankAccountType} TEXT NOT NULL,"
        "${DataBaseHelperKeys.currency} TEXT NOT NULL,"
        "${DataBaseHelperKeys.bankAccountNumber} TEXT NOT NULL,"
        "${DataBaseHelperKeys.iban} TEXT NOT NULL,"
        "${DataBaseHelperKeys.updatedAt} TEXT NOT NULL,"
        "${DataBaseHelperKeys.fieId} TEXT NOT NULL,"
        "${DataBaseHelperKeys.fieName} TEXT NOT NULL,"
        "${DataBaseHelperKeys.statusDescription} TEXT NOT NULL"
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
    await db.delete(TableNames.wholesalerCreditlineRequestList);
    await db.delete(TableNames.retailerList);
    await db.delete(TableNames.createSales);
    await db.delete(TableNames.retailerFieAssociationList);
    await db.delete(TableNames.storeList);
    await db.delete(TableNames.retailerBankAccounts);
  }

  Future<List<Map<String, dynamic>>> queryAllRows(tblName) async {
    Database db = await instance.database;
    return await db.query(tblName);
  }

  Future<List<Map<String, dynamic>>> queryAllSortedRows(
      String tblName, String field, String? arg) async {
    Database db = await instance.database;
    return await db.query(tblName, where: '$field  = ?', whereArgs: [arg]);
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

  // static String id = 'id';
  // static String uniqueId = 'unique_id';
  static String associationId = 'association_id';
  static String fieId = 'fie_id';
  static String bpIdF = 'bp_id_f';
  static String bpIdR = 'bp_id_r';
  static String monthlyPurchase = 'monthly_purchase';
  static String averagePurchaseTickets = 'average_purchase_tickets';
  // static String requestedAmount = 'requested_amount';
  static String customerSinceDate = 'customer_since_date';
  static String monthlySales = 'monthly_sales';
  static String averageSalesTicket = 'average_sales_ticket';
  static String rcCrlineAmt = 'rc_crline_amt';
  static String visitFrequency = 'visit_frequency';
  static String creditOfficerGroup = 'credit_officer_group';
  static String commercialName1 = 'commercial_name_1';
  static String commercialPhone1 = 'commercial_phone_1';
  static String commercialName2 = 'commercial_name_2';
  static String commercialPhone2 = 'commercial_phone_2';
  static String commercialName3 = 'commercial_name_3';
  static String commercialPhone3 = 'commercial_phone_3';
  // static String currency = 'currency';
  static String financialStatements = 'financial_statements';
  // static String status = 'status';
  // static String country = 'country';
  // static String statusFie = 'status_fie';
  static String approvedCreditLineAmount = 'approved_credit_line_amount';
  static String approvedCreditLineCurrency = 'approved_credit_line_currency';
  static String clInternalId = 'cl_internal_id';
  static String startDate = 'start_date';
  static String expirationDate = 'expiration_date';
  static String clApprovedDate = 'cl_approved_date';
  static String clType = 'cl_type';
  static String isForward = 'is_forward';
  static String actionBy = 'action_by';
  static String actionEnrollement = 'action_enrollement';
  static String authorizationDate = 'authorization_date';
  static String isFieRespond = 'is_fie_respond';
  // static String type = 'type';
  static String parentClId = 'parent_cl_id';
  static String createdAt = 'created_at';
  static String updatedAt = 'updated_at';
  static String internalId = 'internal_id';
  // static String associationUniqueId = 'association_unique_id';
  static String storeId = 'store_id';
  static String wholesalerStoreId = 'wholesaler_store_id';
  static String saleType = 'sale_type';
  static String invoiceNumber = 'invoice_number';
  static String orderNumber = 'order_number';
  static String amount = 'amount';
  static String description = 'description';
  static String creditlineId = 'creditline_id';
  static String associationIdStore = 'associationId';
  static String availableAmount = 'available_amount';
  static String bankAccountType = 'bank_account_type';
  static String bankAccountNumber = 'bank_account_number';
  static String iban = 'iban';
}
