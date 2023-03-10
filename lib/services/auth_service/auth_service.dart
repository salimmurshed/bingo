import 'package:bingo_wholesale/repository/repository_components.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';
import 'dart:convert' as convert;
import '../../app/locator.dart';
import '../../const/database_helper.dart';
import '../../data_models/models/user_model/user_model.dart';
import '../../main.dart';
import '../../repository/repository_retailer.dart';
import '../navigation/navigationService.dart';
import '../network/network_info.dart';
import '../network/network_urls.dart';
import '../storage/db.dart';
import '../storage/deviceStorage.dart';
import 'package:http/http.dart' as http;
import 'dart:io' show Platform;

@lazySingleton
class AuthService with ReactiveServiceMixin {
  final http.Client _client = http.Client();
  RepositoryRetailer RepositoryRetailerImpl = RepositoryRetailer();
  ZDeviceStorage _storage = locator<ZDeviceStorage>();
  RepositoryComponents _repositoryComponents = locator<RepositoryComponents>();
  NavigationService _navigationService = locator<NavigationService>();
  final dbHelper = DatabaseHelper.instance;
  ReactiveValue<UserModel> user = ReactiveValue(UserModel());
  ReactiveValue<bool> isRetailer = ReactiveValue(false);
  var networkInfo = locator<NetworkInfoService>();
  AuthService() {
    listenToReactiveValues([user, isRetailer]);
  }
  // Future<Position> getLocation() async {
  //   Position position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.low);
  //   print(position.latitude);
  //   print(position.longitude);
  //   return position;
  // }

  void getLoggedUserDetails() {
    user.value = UserModel.fromJson(
        convert.jsonDecode(_storage.getString(DataBase.userData)));
    isRetailer.value = _storage.getString(DataBase.userType).toLowerCase() ==
            "Retailer".toLowerCase()
        ? true
        : false;
    notifyListeners();
  }

  Future<UserModel> login(String email, String password) async {
    // Position position = await getLocation();
    Uri url = NetworkUrls.loginUrl;
    final _response = await _client.post(url, body: {
      'email': email,
      'password': password,
      // 'email': 'anacaona@mailinator.com',
      // 'password': '12345678',
      // 'email': 'info@bepensa.com.do',
      // 'password': 'Password@213',
      // 'email': 'mayorista1@mailinator.com',
      // 'email': 'wprueba@mailinator.com',
      // 'email': 'matias@mailinator.com',
      // 'password': 'Password@123',
      'device_type': Platform.isAndroid ? "android" : "ios",
      'device_token': deviceToken,
      'latitude': "00000000",
      'longitude': "11111111"
    });
    try {
      final responseData =
          UserModel.fromJson(convert.jsonDecode(_response.body));
      _storage.setString(DataBase.userData, _response.body);
      user.value = responseData;
      if (responseData.success!) {
        user.value = responseData;
        _storage.setString(DataBase.userToken, user.value.data!.token);
        _storage.setString(DataBase.userType, user.value.data!.enrollmentType);
        print(_storage.getString(DataBase.userType));
        isRetailer.value =
            _storage.getString(DataBase.userType).toLowerCase() ==
                    "Retailer".toLowerCase()
                ? true
                : false;
        notifyListeners();
        if (!isRetailer.value) {
          _repositoryComponents.getComponentsReady();
        } else {
          _repositoryComponents.getComponentsRetailerReady();
        }
        notifyListeners();
        return responseData;
      } else {
        return responseData;
      }
    } catch (e) {
      rethrow;
      // return Left(AppExceptions.handle(e).failure);
    }
  }
}
