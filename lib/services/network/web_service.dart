import 'package:bingo_wholesale/presentation/widgets/alert/alert_dialog.dart';import 'package:http/http.dart' as http;import 'package:http/http.dart';import 'package:injectable/injectable.dart';import '../../app/locator.dart';import '../navigation/navigationService.dart';import '../storage/db.dart';import '../storage/deviceStorage.dart';import 'network_info.dart';@lazySingletonclass WebService {  Map<String, String> get headers => {        "Accept": "application/json",        "Authorization": "Bearer ${_storage.getString(DataBase.userToken)}",      };  //service  ZDeviceStorage _storage = locator<ZDeviceStorage>();  NavigationService _navigationService = locator<NavigationService>();  final http.Client _client = http.Client();  NetworkInfoService networkInfo = locator<NetworkInfoService>();  Future<Response> postRequest(jsonBody, uri) async {    // Response response;    try {      Response response = await _client.post(        uri,        headers: headers,        body: jsonBody,      );      return response;    } on Exception catch (e) {      _navigationService.displayDialog(AlertDialogMessage(e.toString()));      rethrow;    }  }  Future<Response> getRequest(uri) async {    if (await networkInfo.isConnected) {      try {        Response response = await _client.get(          uri,          headers: headers,        );        return response;      } on Exception catch (e) {        // _navigationService.displayDialog(AlertDialogMessage(e.toString()));        rethrow;      }    } else {      // _navigationService.displayDialog(AlertDialogMessage(      //     DataSource.noInternetConnection.getFailure().message));      throw Exception('BarException');    }  }}