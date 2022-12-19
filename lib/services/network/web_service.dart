import 'dart:convert';
import 'dart:io';
import 'package:bingo_wholesale/presentation/widgets/alert/alert_dialog.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

import '../../app/locator.dart';
import '../navigation/navigationService.dart';
import '../storage/db.dart';
import '../storage/deviceStorage.dart';
import 'network_info.dart';

@lazySingleton
class WebService {
  Map<String, String> get headers => {
        "Accept": "application/json",
        "Authorization": "Bearer ${_storage.getString(DataBase.userToken)}",
      };
  //service
  ZDeviceStorage _storage = locator<ZDeviceStorage>();
  NavigationService _navigationService = locator<NavigationService>();
  final http.Client _client = http.Client();
  NetworkInfoService networkInfo = locator<NetworkInfoService>();

  Future<Response> postRequest(
    uri,
    jsonBody,
  ) async {
    try {
      Response response = await _client.post(
        uri,
        headers: headers,
        body: jsonBody,
      );

      return response;
    } on Exception catch (e) {
      _navigationService.displayDialog(AlertDialogMessage(e.toString()));
      rethrow;
    }
  }

  Future<Response> getRequest(uri) async {
    if (await networkInfo.isConnected) {
      try {
        Response response = await _client.get(
          uri,
          headers: headers,
        );
        return response;
      } on Exception catch (_) {
        // _navigationService.displayDialog(AlertDialogMessage(e.toString()));
        rethrow;
      }
    } else {
      throw Exception('BarException');
    }
  }

  http.MultipartRequest getResponse(Uri uri) {
    MultipartRequest request = http.MultipartRequest("POST", uri);
    return request;
  }

  Future<Response> sendMultiPartRequest(
      Uri uri, MultipartRequest requests, List files) async {
    var request = http.MultipartRequest("POST", uri);
    request = requests;
    request.headers.addAll(headers);
    request.headers.addAll(
      {'Content-Type': 'multipart/form-data'},
    );

    try {
      List<http.MultipartFile> multipartFiles = [];
      for (File file in files) {
        var f = await http.MultipartFile.fromPath("documents", file.path);
        multipartFiles.add(f);
      }
      request.files.addAll(multipartFiles);
      //files of multipart end

      // print(request.files.map((element) => print(element.length)));
      http.Response response =
          await http.Response.fromStream(await request.send());
      final responseData = json.decode(response.body);
      print(responseData);
      return response;
    } on Exception catch (_) {
      rethrow;
    }
    // print('Uploaded! ${response.body} ++ ${response.statusCode}');
  }
}
