import 'package:injectable/injectable.dart';import 'package:stacked/stacked.dart';import 'dart:convert' as convert;import '../../app/locator.dart';import '../../app/router.dart';import '../../const/database_helper.dart';import '../../data_models/models/user_model/user_model.dart';import '../../repository/repository.dart';import '../navigation/navigationService.dart';import '../network/network_info.dart';import '../network/network_urls.dart';import '../storage/db.dart';import '../storage/deviceStorage.dart';import 'package:http/http.dart' as http;@lazySingletonclass AuthService with ReactiveServiceMixin {  final http.Client _client = http.Client();  Repository repositoryImpl = Repository();  ZDeviceStorage _storage = locator<ZDeviceStorage>();  NavigationService _navigationService = locator<NavigationService>();  final dbHelper = DatabaseHelper.instance;  ReactiveValue<UserModel> user = ReactiveValue(UserModel());  ReactiveValue<bool> isRetailer = ReactiveValue(false);  var networkInfo = locator<NetworkInfoService>();  AuthService() {    listenToReactiveValues([user, isRetailer]);  }  void getLoggedUserDetails() {    user.value = UserModel.fromJson(        convert.jsonDecode(_storage.getString(DataBase.userData)));    isRetailer.value = _storage.getString(DataBase.userType).toLowerCase() ==            "Retailer".toLowerCase()        ? true        : false;    notifyListeners();  }  Future<void> login(String email, String password) async {    Uri url = NetworkUrls.loginUrl;    final _response = await _client.post(url, body: {      'email': 'anacaona@mailinator.com',      'password': '12345678',      'device_type': 'android',      'device_token': 'dfreyh',      'latitude': '1234',      'longitude': '1234'    });    if (await networkInfo.isConnected) {      try {        final responseData =            UserModel.fromJson(convert.jsonDecode(_response.body));        _storage.setString(DataBase.userData, _response.body);        user.value = responseData;        if (responseData.success!) {          user.value = responseData;          _storage.setString(DataBase.userToken, user.value.data!.token);          print(_storage.getString(DataBase.userType));          isRetailer.value =              _storage.getString(DataBase.userType).toLowerCase() ==                      "Retailer".toLowerCase()                  ? true                  : false;          _storage.setString(              DataBase.userType, user.value.data!.enrollmentType);          _navigationService.pushNamed(Routes.dashboardScreen);        } else {          // return Left(Failure(          //     _response.statusCode,          //     responseData.message ?? ResponseMessage.DEFAULT,          //     responseData.success!));        }      } catch (e) {        // return Left(AppExceptions.handle(e).failure);      }    } else {      // _navigationService.displayDialog(Text("else"));      // return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());    }  }}