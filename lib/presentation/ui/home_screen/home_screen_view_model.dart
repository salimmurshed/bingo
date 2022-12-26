import 'package:bingo_wholesale/app/router.dart';

import 'package:bingo_wholesale/const/app_bar_titles.dart';
import 'package:bingo_wholesale/data_models/models/store_model/store_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../app/locator.dart';
import '../../../data/data_source/cards_properties_list.dart';
import '../../../data/data_source/confirmation.dart';
import '../../../data/data_source/invoices_data.dart';
import '../../../data/data_source/recommandation_data.dart';
import '../../../data_models/construction_model/confirmation_model/confirmation_model.dart';
import '../../../data_models/construction_model/dashboard_card_properties_model/dashboard_card_properties_model.dart';
import '../../../data_models/construction_model/invoice_model/invoice_model.dart';
import '../../../data_models/construction_model/recommandation_deposite_model/recommandation_deposite_model.dart';
import '../../../data_models/enums/data_source.dart';
import '../../../data_models/enums/home_page_bottom_tabs.dart';
import '../../../data_models/models/association_request_model/association_request_model.dart';
import '../../../data_models/models/association_request_wholesaler_model/association_request_wholesaler_model.dart';
import '../../../data_models/models/component_models/response_model.dart';
import '../../../data_models/models/retailer_credit_line_req_model/retailer_credit_line_req_model.dart';
import '../../../data_models/models/user_model/user_model.dart';
import '../../../data_models/models/wholesaler_credit_line_model/wholesaler_credit_line_model.dart';
import '../../../repository/repository_retailer.dart';
import '../../../repository/repository_wholesaler.dart';
import '../../../services/auth_service/auth_service.dart';
import '../../../services/navigation/navigationService.dart';

class GetId {
  String id;
  RetailerTypeAssociationRequest type;
  GetId({this.id = "", this.type = RetailerTypeAssociationRequest.wholesaler});
}

class HomeScreenViewModel extends ReactiveViewModel {
  final AuthService _authService = locator<AuthService>();
  NavigationService _navigationService = locator<NavigationService>();
  final RepositoryRetailer _RepositoryRetailer = locator<RepositoryRetailer>();
  final RepositoryWholesaler _repositoryWholesaler =
      locator<RepositoryWholesaler>();
  //mock data
  List<ConfirmationModel> get confirmationData => confirmationDataMockList;
  //mock data
  List<InvoiceModel> invoiceData = invoiceMock;

  List<StoreData> get storeData => _RepositoryRetailer.storeList;

  List<AssociationRequestData> get wholesalerAssociationRequestData =>
      _RepositoryRetailer.wholesalerAssociationRequestData.value;
  List<AssociationRequestData> get fieAssociationRequestData =>
      _RepositoryRetailer.fieAssociationRequestData.value;
  // _associationRequestData;

  List<AssociationRequestWholesalerData> get wholesalerAssociationRequest =>
      _repositoryWholesaler.wholesalerAssociationRequest.value;

  List<RetailerCreditLineRequestData> get retailerCreditLineRequestData =>
      _RepositoryRetailer.retailerCreditLineRequestData.value;
  List<WholesalerCreditLineData> get wholesalerCreditLineRequestData =>
      _repositoryWholesaler.wholesalerCreditLineRequestData;

  //mock data
  List<RecommendationModel> recommadationData = recommadationDataMockUp;

  GlobalKey<ScaffoldState> get key => _navigationService.scaffoldKey;
  UserModel get user => _authService.user.value;
  HomePageBottomTabs homeScreenBottomTabs = HomePageBottomTabs.dashboard;

  HomePageRequestTabsW requestTabTitleWholesaler =
      HomePageRequestTabsW.associateRequest;
  HomePageRequestTabsR requestTabTitleRetailer =
      HomePageRequestTabsR.wAssociateRequest;
  HomePageSettingTabs settingTabTitle = HomePageSettingTabs.stores;
  String appBarTitle = "DASHBOARD";

  bool get isRetailer => _authService.isRetailer.value;
  bool get hasCreditLineNextPage => _repositoryWholesaler.hasCreditLineNextPage;
  ResponseMessages get globalMessage => _RepositoryRetailer.globalMessage.value;
  HomeScreenViewModel() {
    isRetailer ? getRetailerDocuments() : getWholesalerData();
  }
  void getRetailerDocuments() {
    _RepositoryRetailer.getStores();
    _RepositoryRetailer.getWholesaler();
    _RepositoryRetailer.getFia();
    getRetailersAssociationData();
    // getCreditLinesList();
  }

  void getRetailersAssociationData() async {
    setBusy(true);
    notifyListeners();
    await Future.delayed(Duration(seconds: 1));
    await _RepositoryRetailer.getRetailersAssociationData();
    await _RepositoryRetailer.getRetailersFieAssociationData();
    await _RepositoryRetailer.getCreditLinesList();
    // associationRequestData = _RepositoryRetailer.associationRequestData.value;
    setBusy(false);
    notifyListeners();
  }

  // void getCreditLinesList() async {
  //   setBusy(true);
  //   notifyListeners();
  //   setBusy(false);
  //   notifyListeners();
  // }

  // isRetailer ? getRetailerDocuments() :getWholesalerDocuments();
  void getWholesalerData() async {
    setBusy(true);
    notifyListeners();
    await _repositoryWholesaler.getWholesalersAssociationData();
    await _repositoryWholesaler.getCreditLinesList();
    setBusy(false);
    notifyListeners();
  }

  void changeSecondaryBottomTab(HomePageBottomTabs v) {
    homeScreenBottomTabs = v;
    switch (v) {
      case HomePageBottomTabs.dashboard:
        appBarTitle = AppBarTitles.dashBoard;
        break;
      case HomePageBottomTabs.requests:
        appBarTitle = AppBarTitles.request;
        break;
      case HomePageBottomTabs.settings:
        appBarTitle = AppBarTitles.settings;
        break;
      case HomePageBottomTabs.accountBalance:
        appBarTitle = AppBarTitles.accountBalance;
        break;
      default:
        appBarTitle = AppBarTitles.dashBoard;
    }
    notifyListeners();
  }

  void changeRequestTabWholesaler(int i, BuildContext context) {
    requestTabTitleWholesaler = i == 0
        ? HomePageRequestTabsW.associateRequest
        : HomePageRequestTabsW.creditLineRequest;
    DefaultTabController.of(context)!.animateTo(i);
    notifyListeners();
  }

  void changeRequestTabRetailer(int i, BuildContext context) {
    requestTabTitleRetailer = i == 0
        ? HomePageRequestTabsR.wAssociateRequest
        : requestTabTitleRetailer = i == 1
            ? HomePageRequestTabsR.fAssociateRequest
            : HomePageRequestTabsR.creditLineRequest;
    DefaultTabController.of(context)!.animateTo(i);
    notifyListeners();
  }

  bool changeButton(scrollNotification) {
    if (scrollNotification is ScrollEndNotification) ;
    return false;
  }

  void changeSettingTab(HomePageSettingTabs title) {
    settingTabTitle = title;
    notifyListeners();
  }

  //navigate services

  void gotoSalesDetailsScreen(ConfirmationModel data) {
    _navigationService.pushNamed(Routes.salesDetailsScreen, arguments: data);
  }

  void gotoAddNewRequest(
      RetailerTypeAssociationRequest retailerTypeAssociationRequest) {
    _navigationService.pushNamed(Routes.addNewAssociationRequest,
        arguments: retailerTypeAssociationRequest);
  }

  void gotoViewCreditLineWholeSaler(int j) {
    _navigationService.pushNamed(Routes.viewCreditLineRequestWholesalerView,
        arguments: wholesalerCreditLineRequestData[j]);
  }

  void loadMoreCreditLineWholesaler() {
    _repositoryWholesaler.loadMoreCreditLinesList();
  }

  void gotoAddNewStore() {
    _navigationService.pushNamed(Routes.addStoreView);
  }

  void gotoViewStore(int j) {
    _navigationService.pushNamed(Routes.addStoreView, arguments: storeData[j]);
  }

  void gotoAssociationRequestDetailsScreen(
      String id, RetailerTypeAssociationRequest type) {
    GetId v = GetId(id: id, type: type);
    print(id);
    _navigationService.pushNamed(Routes.associationRequestDetailsScreen,
        arguments: v);
  }

  void gotoAddManageAccount() {
    _navigationService.pushNamed(Routes.addManageAccountView);
  }

  void gotoViewManageAccount(int j) {
    _navigationService.pushNamed(Routes.addManageAccountView);
  }

  ///[CreditLine]
  void gotoAddCreditLine() {
    _navigationService.pushNamed(Routes.addCreditLineView);
  }

  void gotoViewCreditLine(int j) {
    _navigationService.pushNamed(Routes.addCreditLineView,
        arguments: retailerCreditLineRequestData[j].creditlineUniqueId);
  }

  List<DashboardCardPropertiesModel> retailerCardsPropertiesList =
      retailerCardsPropertiesListData;
  List<DashboardCardPropertiesModel> wholesalerCardsPropertiesList =
      wholesalerCardsPropertiesListData;
  @override
  List<ReactiveServiceMixin> get reactiveServices =>
      [_authService, _RepositoryRetailer, _repositoryWholesaler];
}
