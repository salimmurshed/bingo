import 'dart:convert';
import 'package:bingo_wholesale/data_models/models/failure.dart';
import 'package:bingo_wholesale/repository/repository_components.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:bingo_wholesale/const/app_extensions/widgets_extensions.dart';
import 'package:bingo_wholesale/const/app_strings.dart';
import 'package:bingo_wholesale/data_models/models/store_model/store_model.dart';
import 'package:bingo_wholesale/services/network/network_urls.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';
import 'dart:convert' as convert;
import '../../app/locator.dart';
import '../const/connectivity.dart';
import '../const/database_helper.dart';
import '../../services/network/network_info.dart';
import '../data_models/construction_model/wholesaler_data.dart';
import '../data_models/enums/status_name.dart';
import '../data_models/models/association_request_model/association_request_model.dart';
import '../data_models/models/component_models/partner_with_currency_list.dart';
import '../data_models/models/component_models/response_model.dart';
import '../data_models/models/retailer_bank_list/retailer_bank_list.dart';
import '../data_models/models/retailer_credit_line_req_model/retailer_credit_line_req_model.dart';
import '../data_models/models/retailer_creditline_request_details_model/retailer_creditline_request_details_model.dart';
import '../data_models/models/retailer_wholesaler_association_request_model/retailer_wholesaler_association_request_model.dart';
import '../data_models/models/update_response_model/update_response_model.dart';
import '../data_models/models/wholesaler_list_model/wholesaler_list_model.dart';
import '../presentation/widgets/alert/alert_dialog.dart';
import '../services/local_data/local_data.dart';
import '../services/local_data/table_names.dart';
import '../services/navigation/navigationService.dart';
import '../services/network/web_service.dart';

@lazySingleton
class RepositoryRetailer with ReactiveServiceMixin {
  final dbHelper = DatabaseHelper.instance;
  var networkInfo = locator<NetworkInfoService>();
  final WebService _webService = locator<WebService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final RepositoryComponents _repositoryComponents =
      locator<RepositoryComponents>();
  final LocalData _localData = locator<LocalData>();
  RepositoryRetailer() {
    listenToReactiveValues([
      retailerAssociationRequestDetailsList,
      associationRequestRetailerDetails,
      setScreenBusy,
      wholesalerAssociationRequestData,
      fieAssociationRequestData,
      creditLineInformation,
      globalMessage,
      retailerCreditLineReqDetails
    ]);
  }

  ///List
  List<StoreData> storeList = [];
  List<WholeSalerOrFiaListData> wholeSaleList = [];
  List<WholeSalerOrFiaListData> fiaList = [];
  ReactiveValue<List<RetailerCreditLineRequestData>>
      retailerCreditLineRequestData =
      ReactiveValue<List<RetailerCreditLineRequestData>>([]);
  ReactiveValue<ResponseMessages> globalMessage =
      ReactiveValue(ResponseMessages());

  ///List

  ///ReactiveValue
  ReactiveValue<List<AssociationRequestData>> wholesalerAssociationRequestData =
      ReactiveValue([]);
  ReactiveValue<List<AssociationRequestData>> fieAssociationRequestData =
      ReactiveValue([]);
  ReactiveValue<RetailerAssociationRequestDetailsModel>
      associationRequestRetailerDetails =
      ReactiveValue(RetailerAssociationRequestDetailsModel());

  ReactiveValue<List<RetailerAssociationRequestDetailsModel>>
      retailerAssociationRequestDetailsList =
      ReactiveValue<List<RetailerAssociationRequestDetailsModel>>([]);
  ReactiveValue<List<RetailerAssociationRequestDetailsModel>>
      retailerFieAssociationRequestDetailsList =
      ReactiveValue<List<RetailerAssociationRequestDetailsModel>>([]);

  ReactiveValue<bool> setScreenBusy = ReactiveValue(false);
  ReactiveValue<List<WholesalersData>> creditLineInformation =
      ReactiveValue<List<WholesalersData>>([]);
  ReactiveValue<RetailerCreditLineReqDetailsModel>
      retailerCreditLineReqDetails =
      ReactiveValue(RetailerCreditLineReqDetailsModel());

  ///ReactiveValue

  void refreshGlobalMessage() async {
    await Future.delayed(const Duration(seconds: 5));
    globalMessage.value = ResponseMessages();
    notifyListeners();
  }

  ReactiveValue<List<WholesalerData>> sortedWholsaler =
      ReactiveValue<List<WholesalerData>>([]);
  List<WholesalerData> creditLineInformations = [];
  void getSortedWholsaler() {
    for (WholesalersData i in creditLineInformation.value) {
      creditLineInformations.add(i.wholesaler!);
    }
    sortedWholsaler.value = _repositoryComponents
        .wholesalerWithCurrency.value.data![0].wholesalerData!
        .where((element) => !(creditLineInformations
            .any((e) => e.wholesalerName == element.wholesalerName)))
        .toList();
    notifyListeners();
  }

  Future getCreditLinesList() async {
    dbHelper
        .queryAllRows(TableNames.retailerCreditlineRequestList)
        .then((value) {
      retailerCreditLineRequestData.value =
          value.map((d) => RetailerCreditLineRequestData.fromJson(d)).toList();
    });
    try {
      Response response = await _webService
          .getRequest(NetworkUrls.retailerCreditlineRequestList);
      final responseData = RetailerCreditLineRequestModel.fromJson(
          convert.jsonDecode(response.body));
      retailerCreditLineRequestData.value = responseData.data!.data!;
      _localData.insert(
          TableNames.retailerCreditlineRequestList, responseData.data!.data!);
      notifyListeners();
    } on Exception catch (_) {
      // _navigationService.displayDialog(AlertDialogMessage(e.toString()));
    }
    notifyListeners();
  }

  Future getCreditLinesDetails(String id) async {
    var jsonBody = {"creditline_unique_id": id};
    try {
      Response response = await _webService.postRequest(
        NetworkUrls.retailerCreditlineRequestDetails,
        jsonBody,
      );
      final responseData = RetailerCreditLineReqDetailsModel.fromJson(
          convert.jsonDecode(response.body));
      retailerCreditLineReqDetails.value = responseData;
    } on Exception catch (_) {
      // _navigationService.displayDialog(AlertDialogMessage(e.toString()));
    }
    notifyListeners();
  }

  void addCreditLineInformation(WholesalersData value) {
    creditLineInformation.value.add(value);
    notifyListeners();
  }

  void updateWholesaler(String id, WholesalersData item) {
    int index =
        creditLineInformation.value.indexWhere((element) => element.id == id);
    creditLineInformation.value[index].wholesaler = item.wholesaler;
    creditLineInformation.value[index].currency = item.currency;
    creditLineInformation.value[index].monthlyPurchase = item.monthlyPurchase;
    creditLineInformation.value[index].averageTicket = item.averageTicket;
    creditLineInformation.value[index].visitFrequency = item.visitFrequency;
    creditLineInformation.value[index].amount = item.amount;
    notifyListeners();
  }

  void removeCreditLineInformation(String id) {
    int index =
        creditLineInformation.value.indexWhere((element) => element.id == id);
    creditLineInformation.value.removeAt(index);
    notifyListeners();
  }

  //all store
  void getStores() async {
    dbHelper.queryAllRows(TableNames.storeTableName).then((value) {
      storeList = value.map((d) => StoreData.fromJson(d)).toList();
    });
    try {
      Response response = await _webService.getRequest(NetworkUrls.storeUrl);
      final responseData =
          StoreModel.fromJson(convert.jsonDecode(response.body));
      storeList = responseData.data!;
      _localData.insert(TableNames.storeTableName, responseData.data!);
    } on Exception catch (_) {
      // _navigationService.displayDialog(AlertDialogMessage(e.toString()));
    }

    notifyListeners();
  }

  //all wholesaler list
  void getWholesaler() async {
    dbHelper.queryAllRows(TableNames.wholesalerList).then((value) {
      wholeSaleList =
          value.map((d) => WholeSalerOrFiaListData.fromJson(d)).toList();
    });
    try {
      Response response =
          await _webService.getRequest(NetworkUrls.wholesalerListUri);
      final responseData =
          WholeSalerOrFiaListModel.fromJson(convert.jsonDecode(response.body));
      wholeSaleList = responseData.data!;
      _localData.insert(TableNames.wholesalerList, responseData.data!);
    } on Exception catch (_) {
      // _navigationService.displayDialog(AlertDialogMessage(e.toString()));
    }
    notifyListeners();
  }

  Future sendWholesalerRequest(List<String> selectedWholeSaler) async {
    String value = selectedWholeSaler
        .toString()
        .replaceAll('[', "")
        .replaceAll(']', "")
        .replaceAll(' ', "");
    var jsonBody = {"unique_id": value};
    try {
      Response res = await _webService.postRequest(
        NetworkUrls.addRetailerWholesalerAssociationRequest,
        jsonBody,
      );
      Response response =
          await _webService.getRequest(NetworkUrls.requestAssociationList);
      final responseData =
          AssociationRequestModel.fromJson(convert.jsonDecode(response.body));
      wholesalerAssociationRequestData.value = responseData.data!;
      _localData.insert(TableNames.retailerAssociationList, responseData.data!);
      print('associationRequestData.value');
      print(wholesalerAssociationRequestData.value);
      _navigationService.pop();
      notifyListeners();
      ResponseMessages result = ResponseMessages.fromJson(jsonDecode(res.body));
      await getRetailersAssociationData();
      globalMessage.value = result;
      notifyListeners();
      refreshGlobalMessage();

      // print(res.reasonPhrase);
    } on Exception catch (e) {
      print(e);
    }
  }

  //all fia list
  void getFia() async {
    dbHelper.queryAllRows(TableNames.fiaList).then((value) {
      fiaList = value.map((d) => WholeSalerOrFiaListData.fromJson(d)).toList();
    });
    try {
      Response response = await _webService.getRequest(NetworkUrls.fiaListURI);
      final responseData =
          WholeSalerOrFiaListModel.fromJson(convert.jsonDecode(response.body));
      fiaList = responseData.data!;
      _localData.insert(TableNames.fiaList, responseData.data!);
    } on Exception catch (_) {
      // _navigationService.displayDialog(AlertDialogMessage(e.toString()));
    }
    notifyListeners();
  }

  Future sendFiaRequest(List<String> selectedFia) async {
    String value = selectedFia
        .toString()
        .replaceAll('[', "")
        .replaceAll(']', "")
        .replaceAll(' ', "");
    var jsonBody = {"unique_id": value};
    try {
      Response res = await _webService.postRequest(
        NetworkUrls.addRetailerFiaAssociationRequest,
        jsonBody,
      );
      ResponseMessages result = ResponseMessages.fromJson(jsonDecode(res.body));

      await getRetailersFieAssociationData();
      globalMessage.value = result;
      notifyListeners();
      refreshGlobalMessage();
    } on Exception catch (_) {
      rethrow;
    }
  }

  //all retailer Association list
  Future getRetailersAssociationData() async {
    dbHelper.queryAllRows(TableNames.retailerAssociationList).then((value) {
      wholesalerAssociationRequestData.value =
          value.map((d) => AssociationRequestData.fromJson(d)).toList();
      notifyListeners();
    });
    try {
      Response response =
          await _webService.getRequest(NetworkUrls.requestAssociationList);
      final responseData =
          AssociationRequestModel.fromJson(convert.jsonDecode(response.body));
      wholesalerAssociationRequestData.value = responseData.data!;
      _localData.insert(TableNames.retailerAssociationList, responseData.data!);
      notifyListeners();
    } on Exception catch (_) {
      // _navigationService.displayDialog(AlertDialogMessage(e.toString()));
    }
    notifyListeners();
  }

  Future getRetailersFieAssociationData() async {
    dbHelper.queryAllRows(TableNames.retailerFieAssociationList).then((value) {
      fieAssociationRequestData.value =
          value.map((d) => AssociationRequestData.fromJson(d)).toList();
      notifyListeners();
    });
    try {
      Response response =
          await _webService.getRequest(NetworkUrls.requestFieAssociationList);
      final responseData =
          AssociationRequestModel.fromJson(convert.jsonDecode(response.body));
      fieAssociationRequestData.value = responseData.data!;
      _localData.insert(
          TableNames.retailerFieAssociationList, responseData.data!);
      notifyListeners();
    } on Exception catch (_) {
      // _navigationService.displayDialog(AlertDialogMessage(e.toString()));
    }
    notifyListeners();
  }

  Future<void> getRetailerAssociationDetails(String id) async {
    int index = 0;
    bool isAvailable = false;
    if (retailerAssociationRequestDetailsList.value.isNotEmpty) {
      index = retailerAssociationRequestDetailsList.value.indexWhere(
          (element) => element.data![0].companyInformation![0].uniqueId == id);
    }
    if (retailerAssociationRequestDetailsList.value.isNotEmpty) {
      isAvailable = retailerAssociationRequestDetailsList.value
          .where((element) =>
              element.data![0].companyInformation![0].uniqueId == id)
          .isNotEmpty;
    }
    if (isAvailable) {
      associationRequestRetailerDetails.value =
          retailerAssociationRequestDetailsList.value[index];
    } else {
      try {
        setScreenBusy.value = true;
        notifyListeners();
        var jsonBody = {"unique_id": id};
        Response response = await _webService.postRequest(
          NetworkUrls.viewRetailerWholesalerAssociationRequest,
          jsonBody,
        );

        print(response.body);
        RetailerAssociationRequestDetailsModel responseData =
            RetailerAssociationRequestDetailsModel.fromJson(
                convert.jsonDecode(response.body));
        retailerAssociationRequestDetailsList.value.add(responseData);
        associationRequestRetailerDetails.value = responseData;
        setScreenBusy.value = false;
        notifyListeners();
      } on Exception catch (_) {
        setScreenBusy.value = false;
        notifyListeners();
      }
    }
    notifyListeners();
  }

  Future<void> getRetailerFieAssociationDetails(String id) async {
    int index = 0;
    bool isAvailable = false;
    if (retailerFieAssociationRequestDetailsList.value.isNotEmpty) {
      index = retailerFieAssociationRequestDetailsList.value.indexWhere(
          (element) => element.data![0].companyInformation![0].uniqueId == id);
    }
    if (retailerFieAssociationRequestDetailsList.value.isNotEmpty) {
      isAvailable = retailerFieAssociationRequestDetailsList.value
          .where((element) =>
              element.data![0].companyInformation![0].uniqueId == id)
          .isNotEmpty;
    }
    if (isAvailable) {
      associationRequestRetailerDetails.value =
          retailerFieAssociationRequestDetailsList.value[index];
    } else {
      try {
        setScreenBusy.value = true;
        notifyListeners();
        var jsonBody = {"unique_id": id};
        Response response = await _webService.postRequest(
          NetworkUrls.viewRetailerFieAssociationRequest,
          jsonBody,
        );

        RetailerAssociationRequestDetailsModel responseData =
            RetailerAssociationRequestDetailsModel.fromJson(
                convert.jsonDecode(response.body));
        retailerFieAssociationRequestDetailsList.value.add(responseData);
        associationRequestRetailerDetails.value = responseData;
        setScreenBusy.value = false;
        notifyListeners();
      } on Exception catch (_) {
        setScreenBusy.value = false;
        notifyListeners();
      }
    }
    notifyListeners();
  }

  Future<UpdateResponseModel> updateRetailerWholesalerAssociationStatus(
      dynamic data, String uniqueId, int statusID) async {
    int index = retailerAssociationRequestDetailsList.value.indexWhere(
        (element) =>
            element.data![0].companyInformation![0].uniqueId == uniqueId);
    notifyListeners();
    try {
      Response response = await _webService.postRequest(
        NetworkUrls.updateRetailerWholesalerAssociationStatus,
        data,
      );
      final responseData =
          UpdateResponseModel.fromJson(convert.jsonDecode(response.body));
      if (responseData.success!) {
        retailerAssociationRequestDetailsList
            .value[index]
            .data![0]
            .companyInformation![0]
            .status = describeEnum(StatusNames.completed).toUpperCamelCase();
        associationRequestRetailerDetails.value =
            retailerAssociationRequestDetailsList.value[index];
        // _navigationService.pop();
      }

      notifyListeners();
      return responseData;
      // throw "Done";
    } on Exception catch (e) {
      throw e;
    }
  }

  Future<void> rejectRequest(dynamic data, String uniqueId) async {
    int index = retailerAssociationRequestDetailsList.value.indexWhere(
        (element) =>
            element.data![0].companyInformation![0].uniqueId == uniqueId);
    int index2 = wholesalerAssociationRequestData.value
        .indexWhere((element) => element.associationUniqueId == uniqueId);

    try {
      Response response = await _webService.postRequest(
        NetworkUrls.updateRetailerWholesalerAssociationStatus,
        data,
      );
      final responseData =
          UpdateResponseModel.fromJson(convert.jsonDecode(response.body));

      if (responseData.success!) {
        //responseData.success!
        _navigationService.animatedDialog(
            const AlertDialogMessage(AppString.rejectionCompleteSuccessful));
        retailerAssociationRequestDetailsList
            .value[index]
            .data![0]
            .companyInformation![0]
            .status = describeEnum(StatusNames.verified).toUpperCamelCase();
        wholesalerAssociationRequestData.value[index2].status =
            describeEnum(StatusNames.verified).toUpperCamelCase();
        notifyListeners();

        notifyListeners();
      } else {
        _navigationService.animatedDialog(
            const AlertDialogMessage(AppString.rejectionCompleteUnsuccessful));
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  Future<void> rejectRequestFie(dynamic data, String uniqueId) async {
    print("calllll");
    int index = retailerFieAssociationRequestDetailsList.value.indexWhere(
        (element) =>
            element.data![0].companyInformation![0].uniqueId == uniqueId);
    int index2 = fieAssociationRequestData.value
        .indexWhere((element) => element.uniqueId == uniqueId);
    print(index);
    print(index2);

    try {
      Response response = await _webService.postRequest(
        NetworkUrls.updateRetailerWholesalerAssociationStatus,
        data,
      );
      final responseData =
          UpdateResponseModel.fromJson(convert.jsonDecode(response.body));

      if (responseData.success!) {
        //responseData.success!

        retailerFieAssociationRequestDetailsList
            .value[index]
            .data![0]
            .companyInformation![0]
            .statusFie = describeEnum(StatusNames.verified).toUpperCamelCase();
        fieAssociationRequestData.value[index2].statusFie =
            describeEnum(StatusNames.verified).toUpperCamelCase();

        _navigationService.animatedDialog(
            const AlertDialogMessage(AppString.rejectionCompleteSuccessful));
        notifyListeners();
      } else {
        _navigationService.animatedDialog(
            const AlertDialogMessage(AppString.rejectionCompleteUnsuccessful));
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  http.MultipartRequest requestPostResponse() {
    MultipartRequest request =
        _webService.getResponse(NetworkUrls.addCreditlineRequests);
    return request;
  }

  http.MultipartRequest requestReplyResponse() {
    MultipartRequest request =
        _webService.getResponse(NetworkUrls.retailerCreditlineRequestreply);
    return request;
  }

  Future<Response> addCreditlineRequests(
      http.MultipartRequest request, List files) async {
    Response response = await _webService.sendMultiPartRequest(
        NetworkUrls.addCreditlineRequests, request, files);
    return response;
  }

  Future<Response> addReplyRequests(
      http.MultipartRequest request, List files) async {
    Response response = await _webService.sendMultiPartRequest(
        NetworkUrls.retailerCreditlineRequestreply, request, files);
    RetailerCreditLineReqDetailsModel body =
        RetailerCreditLineReqDetailsModel.fromJson(jsonDecode(response.body));
    if (!body.success!) {
      _navigationService.animatedDialog(AlertDialogMessage(body.message!));
    } else {
      retailerCreditLineReqDetails.value = body;
      int index = retailerCreditLineRequestData.value.indexWhere((element) =>
          element.associationUniqueId == body.data!.associationUniqueId);
      print(index);
      retailerCreditLineRequestData.value[index].statusDescription =
          body.data!.statusDescription;
      notifyListeners();
      _navigationService.animatedDialog(AlertDialogMessage(body.message!));
    }
    return response;
  }

  ReactiveValue<List<RetailerBankListData>> retailsBankAccounts =
      ReactiveValue<List<RetailerBankListData>>([]);

  Future<void> getRetailerBankAccounts() async {
    bool connection = await checkConnectivity();
    dbHelper.queryAllRows(TableNames.retailerBankAccounts).then((value) {
      retailsBankAccounts.value =
          value.map((d) => RetailerBankListData.fromJson(d)).toList();
      notifyListeners();
    });

    if (connection) {
      try {
        Response response = await _webService.getRequest(
          NetworkUrls.retailerBankAccountList,
        );
        RetailerBankList responseData =
            RetailerBankList.fromJson(convert.jsonDecode(response.body));
        retailsBankAccounts.value = responseData.data!;
        _localData.insert(TableNames.retailerBankAccounts, responseData.data!);
        notifyListeners();
      } on Exception catch (_) {
        notifyListeners();
      }
    }
    notifyListeners();
  }

  Future<Failure> addRetailerBankAccounts(Map<String, String?> jsonBody) async {
    bool connection = await checkConnectivity();
    if (connection) {
      try {
        Response response = await _webService.postRequest(
          NetworkUrls.addEditRetailerBankAccount,
          jsonBody,
        );
        RetailerBankList responseData =
            RetailerBankList.fromJson(convert.jsonDecode(response.body));
        retailsBankAccounts.value = responseData.data!;
        _localData.insert(TableNames.retailerBankAccounts, responseData.data!);
        notifyListeners();
        return Failure(
            status: responseData.success!, message: responseData.message!);
      } on Exception catch (_) {
        notifyListeners();
        rethrow;
      }
    } else {
      return Failure(status: false, message: ResponseMessage.noInternetError);
    }
  }
}
