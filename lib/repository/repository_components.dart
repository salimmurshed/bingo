import 'dart:convert';

import 'package:bingo_wholesale/data_models/models/component_models/all_city_model.dart';
import 'package:bingo_wholesale/data_models/models/component_models/all_country_model.dart';
import 'package:bingo_wholesale/data_models/models/component_models/customer_type_model.dart';
import 'package:bingo_wholesale/data_models/models/component_models/priceing_group_model.dart';
import 'package:bingo_wholesale/data_models/models/component_models/sales_zone_model.dart';
import 'package:bingo_wholesale/data_models/models/component_models/tax_id_type_model.dart';
import 'package:bingo_wholesale/services/network/network_urls.dart';
import 'package:bingo_wholesale/services/storage/db.dart';
import 'package:bingo_wholesale/services/storage/deviceStorage.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import '../../../app/locator.dart';
import 'package:stacked/stacked.dart';

import '../data_models/models/component_models/fie_list_creditline_request_model.dart';
import '../data_models/models/component_models/grace_period_group.dart';
import '../data_models/models/component_models/partner_with_currency_list.dart';
import '../services/local_data/local_data.dart';
import '../services/local_data/table_names.dart';
import '../services/network/web_service.dart';

@lazySingleton
class RepositoryComponents with ReactiveServiceMixin {
  final WebService _webService = locator<WebService>();
  final ZDeviceStorage _deviceStorage = locator<ZDeviceStorage>();
  final LocalData _localData = locator<LocalData>();
  RepositoryComponents() {
    listenToReactiveValues([]);
  }
  TaxIdType taxIdType = TaxIdType();
  CustomerTypeModel customerType = CustomerTypeModel();
  GracePeriodGroupModel gracePeriodGroup = GracePeriodGroupModel();
  FieCreditLineRequestModel allFieCreditLine = FieCreditLineRequestModel();
  PricingGroupModel pricingGroup = PricingGroupModel();
  SalesZoneModel salesZone = SalesZoneModel();
  ReactiveValue<AllCountryModel> allCountryData =
      ReactiveValue(AllCountryModel());
  ReactiveValue<AllCityModel> allCityData = ReactiveValue(AllCityModel());

  void getComponentsReady() {
    getTaxIdType();
    getCustomerType();
    getGracePeriodGroup();
    getPricingGroup();
    getSalesZone();
  }

  void getComponentsRetailerReady() {
    getAllFieListForCreditLine();
  }

  void getTaxIdType() async {
    Response response = await _webService.getRequest(NetworkUrls.taxIdType);
    _deviceStorage.setString(DataBase.taxIdType, response.body);
    taxIdType = TaxIdType.fromJson(jsonDecode(response.body));
    print(taxIdType);
  }

  void getCustomerType() async {
    Response response = await _webService.getRequest(NetworkUrls.customerType);
    _deviceStorage.setString(DataBase.customerType, response.body);
    customerType = CustomerTypeModel.fromJson(jsonDecode(response.body));
  }

  void getGracePeriodGroup() async {
    Response response =
        await _webService.getRequest(NetworkUrls.gracePeriodGroup);
    _deviceStorage.setString(DataBase.gracePeriodGroup, response.body);
    gracePeriodGroup =
        GracePeriodGroupModel.fromJson(jsonDecode(response.body));
  }

  void getPricingGroup() async {
    Response response = await _webService.getRequest(NetworkUrls.pricingGroup);
    _deviceStorage.setString(DataBase.pricingGroup, response.body);
    pricingGroup = PricingGroupModel.fromJson(jsonDecode(response.body));
  }

  void getSalesZone() async {
    Response response = await _webService.getRequest(NetworkUrls.salesZone);
    _deviceStorage.setString(DataBase.salesZone, response.body);
    salesZone = SalesZoneModel.fromJson(jsonDecode(response.body));
  }

  Future getCountry() async {
    if (allCountryData.value.data == null) {
      Response response = await _webService.getRequest(NetworkUrls.countryUri);
      _deviceStorage.setString(DataBase.allCountry, response.body);
      allCountryData.value =
          AllCountryModel.fromJson(jsonDecode(response.body));
    }
  }

  Future getCity() async {
    if (allCityData.value.data == null) {
      Response response = await _webService.getRequest(NetworkUrls.cityUri);
      _deviceStorage.setString(DataBase.allCity, response.body);
      allCityData.value = AllCityModel.fromJson(jsonDecode(response.body));
    }
  }

  Future getAllFieListForCreditLine() async {
    try {
      Response response =
          await _webService.getRequest(NetworkUrls.allFieListForCreditLine);
      allFieCreditLine =
          FieCreditLineRequestModel.fromJson(jsonDecode(response.body));
      _localData.insert(
          TableNames.fieFistForCreditlineRequest, allFieCreditLine.data!);
      notifyListeners();
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<PartnerWithCurrencyList> getWholesalerWithCurrenct() async {
    try {
      Response response =
          await _webService.getRequest(NetworkUrls.partnerWithCurrencyList);
      return PartnerWithCurrencyList.fromJson(jsonDecode(response.body));
    } catch (e) {
      rethrow;
    }
  }
}
