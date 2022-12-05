import 'package:bingo_wholesale/const/app_extensions/widgets_extensions.dart';
import 'package:bingo_wholesale/data_models/enums/status_name.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';

import '../app/locator.dart';
import '../const/app_strings.dart';
import '../const/database_helper.dart';
import '../data_models/models/association_request_wholesaler_model/association_request_wholesaler_model.dart';
import '../data_models/models/association_wholesaler_equest_details_model/association_wholesaler_equest_details_model.dart';
import '../data_models/models/update_response_model/update_response_model.dart';
import '../presentation/widgets/alert/alert_dialog.dart';
import '../services/local_data/local_data.dart';
import '../services/local_data/table_names.dart';
import '../services/navigation/navigationService.dart';
import '../services/network/network_info.dart';
import '../services/network/network_urls.dart';
import 'dart:convert' as convert;

import '../services/network/web_service.dart';

@lazySingleton
class RepositoryWholesaler with ReactiveServiceMixin {
  RepositoryWholesaler() {
    listenToReactiveValues([
      setScreenBusy,
      associationRequestWholesalerDetailsReactive,
      associationRequestWholesalerDetails,
      associationRequestWholesalerData
    ]);
    // _localData.delete(TableNames.countryTableName);
    // _localData.delete(TableNames.storeTableName);
    // _localData.delete(TableNames.wholesalerList);
    // _localData.delete(TableNames.fiaList);
    // _localData.delete(TableNames.retailerAssociationList);
    // _localData.delete(TableNames.wholeSalerAssociationList);
  }
  final dbHelper = DatabaseHelper.instance;
  var networkInfo = locator<NetworkInfoService>();
  final WebService _webService = locator<WebService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final LocalData _localData = locator<LocalData>();

  ReactiveValue<List<AssociationRequestWholesalerData>>
      associationRequestWholesalerData = ReactiveValue([]);
  ReactiveValue<AssociationWholesalerRequestDetailsModel>
      associationRequestWholesalerDetails =
      ReactiveValue(AssociationWholesalerRequestDetailsModel());
  ReactiveValue<List<AssociationWholesalerRequestDetailsModel>>
      associationRequestWholesalerDetailsReactive =
      ReactiveValue<List<AssociationWholesalerRequestDetailsModel>>([]);

  ReactiveValue<bool> setScreenBusy = ReactiveValue(false);

  //all Wholesaler Association list
  void getWholesalersAssociationData() async {
    dbHelper.queryAllRows(TableNames.wholeSalerAssociationList).then((value) {
      associationRequestWholesalerData.value = value
          .map((d) => AssociationRequestWholesalerData.fromJson(d))
          .toList();
    });
    try {
      Response response = await _webService
          .getRequest(NetworkUrls.requestAssociationListForWholesaler);
      final responseData = AssociationRequestWholesalerModel.fromJson(
          convert.jsonDecode(response.body));
      associationRequestWholesalerData.value = responseData.data!;
      _localData.insert(
          TableNames.wholeSalerAssociationList, responseData.data!);
    } on Exception catch (e) {
      _navigationService.displayDialog(AlertDialogMessage(e.toString()));
    }
    notifyListeners();
  }

  Future<void> getWholesalersAssociationDetails(String uniqueId) async {
    print("response.body");
    int index = 0;
    bool isAvailable = false;
    if (associationRequestWholesalerDetailsReactive.value.isNotEmpty) {
      index = associationRequestWholesalerDetailsReactive.value.indexWhere(
          (element) =>
              element.data![0].companyInformation![0].uniqueId == uniqueId);
    }
    if (associationRequestWholesalerDetailsReactive.value.isNotEmpty) {
      isAvailable = associationRequestWholesalerDetailsReactive.value
          .where((element) =>
              element.data![0].companyInformation![0].uniqueId == uniqueId)
          .isNotEmpty;
    }
    if (isAvailable) {
      associationRequestWholesalerDetails.value =
          associationRequestWholesalerDetailsReactive.value[index];
    } else {
      try {
        setScreenBusy.value = true;
        notifyListeners();
        var jsonBody = {"unique_id": uniqueId};
        Response response = await _webService.postRequest(
            jsonBody, NetworkUrls.viewWholesalerRetailerAssociationRequest);
        final responseData = AssociationWholesalerRequestDetailsModel.fromJson(
            convert.jsonDecode(response.body));
        associationRequestWholesalerDetailsReactive.value.add(responseData);
        associationRequestWholesalerDetails.value = responseData;
        setScreenBusy.value = false;
        notifyListeners();
      } on Exception catch (e) {
        _navigationService.displayDialog(AlertDialogMessage(e.toString()));
      }
    }
    notifyListeners();
  }

  //updateWholesalerRetailerAssociationStatus
  Future<UpdateResponseModel> updateWholesalerRetailerAssociationStatus(
      dynamic data, String uniqueId, int statusID) async {
    int index = associationRequestWholesalerDetailsReactive.value.indexWhere(
        (element) =>
            element.data![0].companyInformation![0].uniqueId == uniqueId);
    notifyListeners();
    try {
      Response response = await _webService.postRequest(
          data, NetworkUrls.updateWholesalerRetailerAssociationStatus);
      final responseData =
          UpdateResponseModel.fromJson(convert.jsonDecode(response.body));
      associationRequestWholesalerDetailsReactive.value[index].data![0].companyInformation![0].status =
          statusID == 1
              ? describeEnum(StatusNames.accepted).toUpperCamelCase()
              : statusID == 3
                  ? describeEnum(StatusNames.verified).toUpperCamelCase()
                  : describeEnum(StatusNames.active).toUpperCamelCase();
      if (statusID == 4) {
        associationRequestWholesalerDetailsReactive.value.removeAt(index);
        var jsonBody = {"unique_id": uniqueId};
        Response responseGet = await _webService.postRequest(
            jsonBody, NetworkUrls.viewWholesalerRetailerAssociationRequest);

        final responseDataGet =
            AssociationWholesalerRequestDetailsModel.fromJson(
                convert.jsonDecode(responseGet.body));
        associationRequestWholesalerDetailsReactive.value.add(responseDataGet);
        associationRequestWholesalerDetails.value = responseDataGet;
        associationRequestWholesalerData.value
            .removeWhere((element) => element.associationUniqueId == uniqueId);
        notifyListeners();
      }
      if (!responseData.success!) {
        _navigationService
            .animatedDialog(AlertDialogMessage(responseData.message!));
      }
      associationRequestWholesalerDetails.value =
          associationRequestWholesalerDetailsReactive.value[index];
      notifyListeners();
      return responseData;
      // throw "Done";
    } on Exception catch (e) {
      throw e;
    }
  }

  void rejectRequest(dynamic data, String uniqueId) async {
    int index = associationRequestWholesalerDetailsReactive.value.indexWhere(
        (element) =>
            element.data![0].companyInformation![0].uniqueId == uniqueId);
    int index2 = associationRequestWholesalerData.value
        .indexWhere((element) => element.uniqueId == uniqueId);
    Response response = await _webService.postRequest(
        data, NetworkUrls.updateRetailerWholesalerAssociationStatus);
    final responseData =
        UpdateResponseModel.fromJson(convert.jsonDecode(response.body));
    if (responseData.success!) {
      _navigationService.animatedDialog(
          const AlertDialogMessage(AppString.rejectionCompleteSuccessful));
      associationRequestWholesalerDetailsReactive
          .value[index]
          .data![0]
          .companyInformation![0]
          .status = describeEnum(StatusNames.rejected).toUpperCamelCase();
      associationRequestWholesalerData.value[index2].status =
          describeEnum(StatusNames.rejected).toUpperCamelCase();
      notifyListeners();
    } else {
      _navigationService.animatedDialog(
          const AlertDialogMessage(AppString.rejectionCompleteUnsuccessful));
    }
  }
}
