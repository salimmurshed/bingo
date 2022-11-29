import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';

import '../app/locator.dart';
import '../const/database_helper.dart';
import '../data_models/models/association_request_wholesaler_model/association_request_wholesaler_model.dart';
import '../data_models/models/association_wholesaler_equest_details_model/association_wholesaler_equest_details_model.dart';
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
      associationRequestWholesalerDetails
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

  List<AssociationRequestWholesalerData> associationRequestWholesalerData = [];
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
      associationRequestWholesalerData = value
          .map((d) => AssociationRequestWholesalerData.fromJson(d))
          .toList();
    });
    try {
      Response response = await _webService
          .getRequest(NetworkUrls.requestAssociationListForWholesaler);
      final responseData = AssociationRequestWholesalerModel.fromJson(
          convert.jsonDecode(response.body));
      associationRequestWholesalerData = responseData.data!;
      _localData.insert(
          TableNames.wholeSalerAssociationList, responseData.data!);
    } on Exception catch (e) {
      _navigationService.displayDialog(AlertDialogMessage(e.toString()));
    }
    notifyListeners();
  }

  Future<void> getWholesalersAssociationDetails(String id) async {
    print("response.body");
    int index = 0;
    bool isAvailable = false;
    if (associationRequestWholesalerDetailsReactive.value.isNotEmpty) {
      index = associationRequestWholesalerDetailsReactive.value.indexWhere(
          (element) => element.data![0].companyInformation![0].uniqueId == id);
    }
    if (associationRequestWholesalerDetailsReactive.value.isNotEmpty) {
      isAvailable = associationRequestWholesalerDetailsReactive.value
          .where((element) =>
              element.data![0].companyInformation![0].uniqueId == id)
          .isNotEmpty;
    }
    if (isAvailable) {
      associationRequestWholesalerDetails.value =
          associationRequestWholesalerDetailsReactive.value[index];
    } else {
      try {
        setScreenBusy.value = true;
        notifyListeners();
        var jsonBody = {"unique_id": id};
        Response response = await _webService.postRequest(
            jsonBody, NetworkUrls.viewWholesalerRetailerAssociationRequest);
        print(response.body);
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
  void updateWholesalerRetailerAssociationStatus(id) async {
    try {
      setScreenBusy.value = true;
      notifyListeners();
      var jsonBody = {"unique_id": id};
      Response response = await _webService.postRequest(
          jsonBody, NetworkUrls.viewWholesalerRetailerAssociationRequest);
      final responseData = AssociationWholesalerRequestDetailsModel.fromJson(
          convert.jsonDecode(response.body));
      associationRequestWholesalerDetailsReactive.value.add(responseData);
      associationRequestWholesalerDetails.value = responseData;
      setScreenBusy.value = false;
      notifyListeners();
    } on Exception catch (e) {
      setScreenBusy.value = false;
      notifyListeners();
      _navigationService.displayDialog(AlertDialogMessage(e.toString()));
    }
  }
}
