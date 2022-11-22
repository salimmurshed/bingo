import 'package:bingo_wholesale/data_models/models/store_model/store_model.dart';import 'package:bingo_wholesale/presentation/common_widgets/alert/error_alert.dart';import 'package:bingo_wholesale/services/local_data/local_data.dart';import 'package:bingo_wholesale/services/local_data/table_names.dart';import 'package:dartz/dartz.dart';import 'package:injectable/injectable.dart';import 'package:stacked/stacked.dart';import '../../app/locator.dart';import '../../const/database_helper.dart';import '../../data/data_source/confirmation.dart';import '../../data/data_source/recommandation_data.dart';import '../../data/repository_impl.dart';import '../../data_models/models/confirmation_model/confirmation_model.dart';import '../../data_models/models/country_list_model/country_list_model.dart';import '../../data_models/models/failure.dart';import '../../data_models/models/recommandation_deposite_model/recommandation_deposite_model.dart';import '../navigation/navigationService.dart';@lazySingletonclass ApiService with ReactiveServiceMixin {  ApiService() {    listenToReactiveValues([countryList]);  }  RepositoryImpl repositoryImpl = RepositoryImpl();  LocalData _localData = locator<LocalData>();  NavigationService _navigationService = locator<NavigationService>();  final dbHelper = DatabaseHelper.instance;  //MockUp Data start here  List<ConfirmationModel> confirmationData = confirmationDataMockList;  List<ReccomandationModel> recommadationData = recommadationDataMockUp;  //MockUp Data ends here  // CountryListModel countries = CountryListModel();  // StoreModel store = StoreModel();  ReactiveValue<List<CountryData>> countryList = ReactiveValue([]);  ReactiveValue<List<StoreData>> storeList = ReactiveValue([]);  Future<void> getCountriesData() async {    dbHelper.queryAllRows(TableNames.countryTableName).then((value) {      countryList.value = value.map((d) => CountryData.fromJson(d)).toList();      notifyListeners();    });    Either<Failure, CountryListModel> resultOrExeption =        await repositoryImpl.getCountries();    resultOrExeption.fold(        (error) => _navigationService.displayDialog(              ErrorAlert(error),            ), (result) {      // countries = result;      countryList.value = result.data ?? [];      _localData.insert(TableNames.countryTableName, result.data!);      notifyListeners();    });  }  Future<void> geStoreData() async {    dbHelper.queryAllRows(TableNames.storeTableName).then((value) {      storeList.value = value.map((d) => StoreData.fromJson(d)).toList();      print("call Local");      notifyListeners();    });    Either<Failure, StoreModel> resultOrExeption =        await repositoryImpl.getStores();    resultOrExeption.fold(        (error) => _navigationService.displayDialog(              ErrorAlert(error),            ), (result) {      // store = result;      storeList.value = result.data ?? [];      print(storeList.value[0].remarks);      print(result);      _localData.insert(TableNames.storeTableName, result.data!);      notifyListeners();    });  }}