import 'package:bingo_wholesale/repository/repository_components.dart';
import 'package:flutter/scheduler.dart';
import 'package:stacked/stacked.dart';

import '../../../app/locator.dart';
import '../../../app/router.dart';
import '../../../services/auth_service/auth_service.dart';
import '../../../services/navigation/navigationService.dart';
import '../../../services/storage/db.dart';
import '../../../services/storage/deviceStorage.dart';

class SplashScreenViewModel extends ReactiveViewModel {
  ZDeviceStorage _storage = locator<ZDeviceStorage>();
  NavigationService _navigationService = locator<NavigationService>();
  final AuthService _authService = locator<AuthService>();
  final RepositoryComponents _repositoryComponents =
      locator<RepositoryComponents>();

  SplashScreenViewModel() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      // requestFilePermission();

      alreadyLogIn();
    });
    print(_storage.getString(DataBase.userData));
    // _storage.clearData();
    if (_storage.getString(DataBase.userData).isNotEmpty) {
      print(_authService.isRetailer.value);
      if (!_authService.isRetailer.value) {
        _repositoryComponents.getComponentsReady();
      } else {
        _repositoryComponents.getComponentsRetailerReady();
      }
    }
  }

  Future<void> alreadyLogIn() async {
    await Future.delayed(Duration(seconds: 2));
    if (_storage.getString(DataBase.userToken).isNotEmpty) {
      _authService.getLoggedUserDetails();
      print(_storage.getString(DataBase.userToken));
      _navigationService.pushReplacementNamed(Routes.dashboardScreen);
    } else {
      _navigationService.pushReplacementNamed(Routes.login);
    }
  }

  // Position _currentPosition = Position(
  //     longitude: 000000,
  //     latitude: 000000,
  //     timestamp: DateTime.now(),
  //     accuracy: 1.0,
  //     altitude: 1.0,
  //     heading: 1.0,
  //     speed: 1.0,
  //     speedAccuracy: 1.0);
  // Position get currentPosition => _currentPosition;
  // getCurrentLocation() async {
  //   // LocationPermission permissionCheck = await Geolocator.checkPermission();
  //   // LocationPermission permission = await Geolocator.requestPermission();
  //   Geolocator.getCurrentPosition(
  //           desiredAccuracy: LocationAccuracy.best,
  //           forceAndroidLocationManager: true)
  //       .then((Position position) {
  //     _currentPosition = position;
  //     notifyListeners();
  //   }).catchError((e) {
  //     print(e);
  //   });
  // }

  // Future<bool> requestFilePermission() async {
  //   PermissionStatus result;
  //   // In Android we need to request the storage permission,
  //   // while in iOS is the photos permission
  //   if (Platform.isAndroid) {
  //     result = await Permission.location.request();
  //   } else {
  //     result = await Permission.location.request();
  //   }
  //
  //   if (result.isGranted) {
  //     return true;
  //   } else if (Platform.isIOS || result.isPermanentlyDenied) {
  //     SystemNavigator.pop();
  //   } else {
  //     SystemNavigator.pop();
  //   }
  //   return false;
  // }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_authService];
}
