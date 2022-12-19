import 'package:bingo_wholesale/app/router.dart';import 'package:bingo_wholesale/const/app_bar_titles.dart';import 'package:bingo_wholesale/data_models/models/store_model/store_model.dart';import 'package:flutter/material.dart';import 'package:stacked/stacked.dart';import '../../../app/locator.dart';import '../../../data/data_source/cards_properties_list.dart';import '../../../data/data_source/confirmation.dart';import '../../../data/data_source/invoices_data.dart';import '../../../data/data_source/recommandation_data.dart';import '../../../data_models/construction_model/confirmation_model/confirmation_model.dart';import '../../../data_models/construction_model/dashboard_card_properties_model/dashboard_card_properties_model.dart';import '../../../data_models/construction_model/invoice_model/invoice_model.dart';import '../../../data_models/construction_model/recommandation_deposite_model/recommandation_deposite_model.dart';import '../../../data_models/enums/home_page_bottom_tabs.dart';import '../../../data_models/models/association_request_model/association_request_model.dart';import '../../../data_models/models/association_request_wholesaler_model/association_request_wholesaler_model.dart';import '../../../data_models/models/component_models/response_model.dart';import '../../../data_models/models/retailer_credit_line_req_model/retailer_credit_line_req_model.dart';import '../../../data_models/models/user_model/user_model.dart';import '../../../repository/repository_retailer.dart';import '../../../repository/repository_wholesaler.dart';import '../../../services/auth_service/auth_service.dart';import '../../../services/navigation/navigationService.dart';class GetId {  String id;  GetId({this.id = ""});}class HomeScreenViewModel extends ReactiveViewModel {  final AuthService _authService = locator<AuthService>();  NavigationService _navigationService = locator<NavigationService>();  final RepositoryRetailer _RepositoryRetailer = locator<RepositoryRetailer>();  final RepositoryWholesaler _repositoryWholesaler =      locator<RepositoryWholesaler>();  //mock data  List<ConfirmationModel> get confirmationData => confirmationDataMockList;  //mock data  List<InvoiceModel> invoiceData = invoiceMock;  List<StoreData> get storeData => _RepositoryRetailer.storeList;  List<AssociationRequestData> get associationRequestData =>      _RepositoryRetailer.associationRequestData.value;  // _associationRequestData;  List<AssociationRequestWholesalerData> _wholesalerAssociationRequest = [];  List<AssociationRequestWholesalerData> get wholesalerAssociationRequest =>      _wholesalerAssociationRequest;  List<RetailerCreditLineRequestData> get retailerCreditLineRequestData =>      _RepositoryRetailer.retailerCreditLineRequestData.value;  //mock data  List<RecommendationModel> recommadationData = recommadationDataMockUp;  GlobalKey<ScaffoldState> get key => _navigationService.scaffoldKey;  UserModel get user => _authService.user.value;  HomePageBottomTabs homeScreenBottomTabs = HomePageBottomTabs.dashboard;  HomePageRequestTabs requestTabTitle = HomePageRequestTabs.associateRequest;  HomePageSettingTabs settingTabTitle = HomePageSettingTabs.stores;  String appBarTitle = "DASHBOARD";  bool get isRetailer => _authService.isRetailer.value;  ResponseMessages get globalMessage => _RepositoryRetailer.globalMessage.value;  HomeScreenViewModel() {    isRetailer ? getRetailerDocuments() : getWholesalerData();  }  void getRetailerDocuments() {    _RepositoryRetailer.getStores();    _RepositoryRetailer.getWholesaler();    _RepositoryRetailer.getFia();    getRetailersAssociationData();    getCreditLinesList();  }  void getRetailersAssociationData() async {    setBusy(true);    notifyListeners();    await _RepositoryRetailer.getRetailersAssociationData();    // associationRequestData = _RepositoryRetailer.associationRequestData.value;    setBusy(false);    notifyListeners();  }  void getCreditLinesList() async {    setBusy(true);    notifyListeners();    await _RepositoryRetailer.getCreditLinesList();    setBusy(false);    notifyListeners();  }  // isRetailer ? getRetailerDocuments() :getWholesalerDocuments();  void getWholesalerData() async {    setBusy(true);    notifyListeners();    await _repositoryWholesaler.getWholesalersAssociationData();    _wholesalerAssociationRequest =        _repositoryWholesaler.wholesalerAssociationRequest.value;    setBusy(false);    notifyListeners();  }  void gotoSalesDetailsScreen(ConfirmationModel data) {    _navigationService.pushNamed(Routes.salesDetailsScreen, arguments: data);  }  void changeSecondaryBottomTab(HomePageBottomTabs v) {    homeScreenBottomTabs = v;    switch (v) {      case HomePageBottomTabs.dashboard:        appBarTitle = AppBarTitles.dashBoard;        break;      case HomePageBottomTabs.requests:        appBarTitle = AppBarTitles.request;        break;      case HomePageBottomTabs.settings:        appBarTitle = AppBarTitles.settings;        break;      case HomePageBottomTabs.accountBalance:        appBarTitle = AppBarTitles.accountBalance;        break;      default:        appBarTitle = AppBarTitles.dashBoard;    }    notifyListeners();  }  void changeRequestTab(int i, BuildContext context) {    requestTabTitle = i == 0        ? HomePageRequestTabs.associateRequest        : HomePageRequestTabs.creditLineRequest;    DefaultTabController.of(context)!.animateTo(i);    notifyListeners();  }  bool changeButton(scrollNotification) {    if (scrollNotification is ScrollEndNotification) ;    return false;  }  void changeSettingTab(HomePageSettingTabs title) {    settingTabTitle = title;    notifyListeners();  }  //navigate services  void gotoAddNewRequest() {    _navigationService.pushNamed(Routes.addNewAssociationRequest);  }  void gotoAddNewStore() {    _navigationService.pushNamed(Routes.addStoreView);  }  void gotoViewStore(int j) {    _navigationService.pushNamed(Routes.addStoreView, arguments: storeData[j]);  }  void gotoAssociationRequestDetailsScreen(String id) {    GetId v = GetId(id: id);    _navigationService.pushNamed(Routes.associationRequestDetailsScreen,        arguments: v);  }  void gotoAddManageAccount() {    _navigationService.pushNamed(Routes.addManageAccountView);  }  void gotoViewManageAccount(int j) {    _navigationService.pushNamed(Routes.addManageAccountView);  }  ///[CreditLine]  void gotoAddCreditLine() {    _navigationService.pushNamed(Routes.addCreditLineView);  }  void gotoViewCreditLine(int j) {    _navigationService.pushNamed(Routes.addCreditLineView,        arguments: retailerCreditLineRequestData[j].creditlineUniqueId);  }  List<DashboardCardPropertiesModel> retailerCardsPropertiesList =      retailerCardsPropertiesListData;  List<DashboardCardPropertiesModel> wholesalerCardsPropertiesList =      wholesalerCardsPropertiesListData;  @override  List<ReactiveServiceMixin> get reactiveServices =>      [_authService, _RepositoryRetailer, _repositoryWholesaler];}