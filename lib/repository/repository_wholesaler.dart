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
      wholesalerAssociationRequestDetailsReactive,
      wholesalerAssociationRequestDetails,
      wholesalerAssociationRequest
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
      wholesalerAssociationRequest = ReactiveValue([]);
  ReactiveValue<AssociationWholesalerRequestDetailsModel>
      wholesalerAssociationRequestDetails =
      ReactiveValue(AssociationWholesalerRequestDetailsModel());
  ReactiveValue<List<AssociationWholesalerRequestDetailsModel>>
      wholesalerAssociationRequestDetailsReactive =
      ReactiveValue<List<AssociationWholesalerRequestDetailsModel>>([]);

  ReactiveValue<bool> setScreenBusy = ReactiveValue(false);

  //all Wholesaler Association list
  Future getWholesalersAssociationData() async {
    dbHelper.queryAllRows(TableNames.wholeSalerAssociationList).then((value) {
      wholesalerAssociationRequest.value = value
          .map((d) => AssociationRequestWholesalerData.fromJson(d))
          .toList();
    });
    try {
      Response response = await _webService
          .getRequest(NetworkUrls.requestAssociationListForWholesaler);
      final responseData = AssociationRequestWholesalerModel.fromJson(
          convert.jsonDecode(response.body));
      wholesalerAssociationRequest.value = responseData.data!;
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
    if (wholesalerAssociationRequestDetailsReactive.value.isNotEmpty) {
      index = wholesalerAssociationRequestDetailsReactive.value.indexWhere(
          (element) =>
              element.data![0].companyInformation![0].uniqueId == uniqueId);
    }
    if (wholesalerAssociationRequestDetailsReactive.value.isNotEmpty) {
      isAvailable = wholesalerAssociationRequestDetailsReactive.value
          .where((element) =>
              element.data![0].companyInformation![0].uniqueId == uniqueId)
          .isNotEmpty;
    }
    if (isAvailable) {
      wholesalerAssociationRequestDetails.value =
          wholesalerAssociationRequestDetailsReactive.value[index];
    } else {
      try {
        setScreenBusy.value = true;
        notifyListeners();
        var jsonBody = {"unique_id": uniqueId};
        Response response = await _webService.postRequest(
          NetworkUrls.viewWholesalerRetailerAssociationRequest,
          jsonBody,
        );
        final responseData = AssociationWholesalerRequestDetailsModel.fromJson(
            convert.jsonDecode(response.body));
        wholesalerAssociationRequestDetailsReactive.value.add(responseData);
        wholesalerAssociationRequestDetails.value = responseData;
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
    int index = wholesalerAssociationRequestDetailsReactive.value.indexWhere(
        (element) =>
            element.data![0].companyInformation![0].uniqueId == uniqueId);
    notifyListeners();
    try {
      Response response = await _webService.postRequest(
        NetworkUrls.updateWholesalerRetailerAssociationStatus,
        data,
      );
      final responseData =
          UpdateResponseModel.fromJson(convert.jsonDecode(response.body));
      wholesalerAssociationRequestDetailsReactive.value[index].data![0].companyInformation![0].status =
          statusID == 1
              ? describeEnum(StatusNames.accepted).toUpperCamelCase()
              : statusID == 3
                  ? describeEnum(StatusNames.verified).toUpperCamelCase()
                  : describeEnum(StatusNames.active).toUpperCamelCase();
      if (statusID == 4) {
        wholesalerAssociationRequestDetailsReactive.value.removeAt(index);
        var jsonBody = {"unique_id": uniqueId};
        Response responseGet = await _webService.postRequest(
          NetworkUrls.viewWholesalerRetailerAssociationRequest,
          jsonBody,
        );

        final responseDataGet =
            AssociationWholesalerRequestDetailsModel.fromJson(
                convert.jsonDecode(responseGet.body));
        wholesalerAssociationRequestDetailsReactive.value.add(responseDataGet);
        wholesalerAssociationRequestDetails.value = responseDataGet;
        wholesalerAssociationRequest.value
            .removeWhere((element) => element.associationUniqueId == uniqueId);
        notifyListeners();
      }
      if (!responseData.success!) {
        _navigationService
            .animatedDialog(AlertDialogMessage(responseData.message!));
      }
      wholesalerAssociationRequestDetails.value =
          wholesalerAssociationRequestDetailsReactive.value[index];
      notifyListeners();
      return responseData;
      // throw "Done";
    } on Exception catch (e) {
      throw e;
    }
  }

  void rejectRequest(dynamic data, String uniqueId) async {
    int index = wholesalerAssociationRequestDetailsReactive.value.indexWhere(
        (element) =>
            element.data![0].companyInformation![0].uniqueId == uniqueId);
    int index2 = wholesalerAssociationRequest.value
        .indexWhere((element) => element.uniqueId == uniqueId);
    Response response = await _webService.postRequest(
      NetworkUrls.updateRetailerWholesalerAssociationStatus,
      data,
    );
    final responseData =
        UpdateResponseModel.fromJson(convert.jsonDecode(response.body));
    if (responseData.success!) {
      _navigationService.animatedDialog(
          const AlertDialogMessage(AppString.rejectionCompleteSuccessful));
      wholesalerAssociationRequestDetailsReactive
          .value[index]
          .data![0]
          .companyInformation![0]
          .status = describeEnum(StatusNames.rejected).toUpperCamelCase();
      wholesalerAssociationRequest.value[index2].status =
          describeEnum(StatusNames.rejected).toUpperCamelCase();
      notifyListeners();
    } else {
      _navigationService.animatedDialog(
          const AlertDialogMessage(AppString.rejectionCompleteUnsuccessful));
    }
  }
}
