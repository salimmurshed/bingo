import 'package:bingo_wholesale/app/locator.dart';import 'package:bingo_wholesale/app/router.dart';import 'package:bingo_wholesale/data_models/models/retailer_creditline_request_details_model/retailer_creditline_request_details_model.dart';import 'package:bingo_wholesale/repository/repository_retailer.dart';import 'package:bingo_wholesale/services/navigation/navigationService.dart';import 'package:flutter/cupertino.dart';import 'package:stacked/stacked.dart';import '../../../data_models/construction_model/wholesaler_data.dart';class AddCreditLineViewModel extends ReactiveViewModel {  NavigationService _navigationService = locator<NavigationService>();  RepositoryRetailer _repositoryRetailer = locator<RepositoryRetailer>();  bool acceptTermCondition = false;  int selectedOption = 10;  TextEditingController crn1Controller = TextEditingController();  TextEditingController crn2Controller = TextEditingController();  TextEditingController crn3Controller = TextEditingController();  TextEditingController crp1Controller = TextEditingController();  TextEditingController crp2Controller = TextEditingController();  TextEditingController crp3Controller = TextEditingController();  List<WholesalerData> get creditLineInformation =>      _repositoryRetailer.creditLineInformation.value;  RetailerCreditLineReqDetailsModel _retailerCreditLineReqDetails =      RetailerCreditLineReqDetailsModel();  RetailerCreditLineReqDetailsModel get retailerCreditLineReqDetails =>      _retailerCreditLineReqDetails;  void changeAcceptTermCondition() {    acceptTermCondition = !acceptTermCondition;    notifyListeners();  }  void changeSelectedOption(int v) {    selectedOption = v;    print("v $v");    notifyListeners();  }  void gotoAddWholesalerScreen() {    _navigationService.pushNamed(Routes.addWholesalerView);  }  void gotoUpdateWholesalerScreen(int index) {    WholesalerData data = WholesalerData(        id: creditLineInformation[index].id,        wholesaler: creditLineInformation[index].wholesaler,        currency: creditLineInformation[index].currency,        monthlyPurchase: creditLineInformation[index].monthlyPurchase,        averageTicket: creditLineInformation[index].averageTicket,        visitFrequency: creditLineInformation[index].visitFrequency,        amount: creditLineInformation[index].amount);    _navigationService.pushNamed(Routes.addWholesalerView, arguments: data);  }  @override  List<ReactiveServiceMixin> get reactiveServices => [_repositoryRetailer];  void setDetails(String arguments) async {    setBusy(true);    notifyListeners();    await _repositoryRetailer.getCreditLinesDetails(arguments);    _retailerCreditLineReqDetails =        _repositoryRetailer.retailerCreditLineReqDetails;    crn1Controller.text =        _retailerCreditLineReqDetails.data!.commercialNameOne!;    crn2Controller.text =        _retailerCreditLineReqDetails.data!.commercialNameTwo!;    crn3Controller.text =        _retailerCreditLineReqDetails.data!.commercialNameThree!;    crp1Controller.text =        _retailerCreditLineReqDetails.data!.commercialPhoneOne!;    crp2Controller.text =        _retailerCreditLineReqDetails.data!.commercialPhoneTwo!;    crp3Controller.text =        _retailerCreditLineReqDetails.data!.commercialPhoneThree!;    setBusy(false);    notifyListeners();  }}