import 'package:bingo_wholesale/const/app_strings.dart';
import 'package:bingo_wholesale/data_models/construction_model/wholesaler_data.dart';
import 'package:bingo_wholesale/repository/repository_components.dart';
import 'package:bingo_wholesale/repository/repository_retailer.dart';
import 'package:bingo_wholesale/services/navigation/navigationService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../app/locator.dart';
import '../../../data/data_source/visit_frequently_list.dart';
import '../../../data_models/construction_model/static_data_models/visit_frequent_list_model.dart';
import '../../../data_models/models/component_models/partner_with_currency_list.dart';
// import '../../../data_models/models/component_models/partner_with_currency_list.dart';

class AddWholesalerViewModel extends ReactiveViewModel {
  AddWholesalerViewModel() {
    getWholesalerWithCurrenct();
  }
  final RepositoryRetailer _repositoryRetailer = locator<RepositoryRetailer>();
  final RepositoryComponents _repositoryComponents =
      locator<RepositoryComponents>();
  final NavigationService _navigationService = locator<NavigationService>();

  String submitButton = AppString.submitButton;
  WholesalerData? selectWholesaler;
  String selectCurrency = AppString.selectCurrency;
  List<String> allCurrency = [];
  int selectWholesalerIndex = 0;
  VisitFrequentListModel? visitFrequency;

  TextEditingController purchaseController = TextEditingController();
  TextEditingController averageTicketController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  List<WholesalersData> _creditLineInformation = [];
  List<WholesalersData> get creditLineInformation => _creditLineInformation;
  PartnerWithCurrencyList _allWholesalers = PartnerWithCurrencyList();
  PartnerWithCurrencyList get allWholesalers => _allWholesalers;
  List<VisitFrequentListModel> visitFrequentlyList =
      AppList.visitFrequentlyList;
  WholesalersData wholesalerData = WholesalersData();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;

  bool isNew = true;
  String wholesalerNameHint = AppString.selectWholeSaler;

  void setDetails(WholesalersData arguments) {
    print(arguments.monthlyPurchase);
    wholesalerData = arguments;
    submitButton = AppString.update;
    isNew = false;
    preFix(arguments);
    notifyListeners();
  }

  void getWholesalerWithCurrenct() async {
    setBusy(true);
    notifyListeners();
    _allWholesalers = await _repositoryComponents.getWholesalerWithCurrenct();
    setBusy(false);
    notifyListeners();
  }

  void changeSelectWholesaler(WholesalerData v) {
    allCurrency.clear();
    selectWholesaler = v;
    notifyListeners();
    int index = allWholesalers.data![0].wholesalerData!
        .indexWhere((element) => element.bpIdW == v.bpIdW);
    allCurrency.add(AppString.selectCurrency);
    allCurrency.addAll(allWholesalers
        .data![0].wholesalerData![index].wholesalerCurrency!
        .map((e) => e.currency!)
        .toList());
    notifyListeners();
  }

  preFix(WholesalersData data) {
    print("currencycurrency");
    print(data.currency);
    wholesalerNameHint = data.wholesaler!.wholesalerName!;
    selectCurrency = data.currency!;
    visitFrequency = data.visitFrequency!;
    purchaseController.text = data.monthlyPurchase!;
    averageTicketController.text = data.averageTicket!;
    amountController.text = data.amount!;
    notifyListeners();
  }

  void changeSelectCurrency(String v) {
    selectCurrency = v;
    notifyListeners();
  }

  void changeVisitFrequency(VisitFrequentListModel v) {
    visitFrequency = v;
    notifyListeners();
  }

  bool canSubmitData() {
    if (selectWholesaler != null &&
        selectCurrency.isNotEmpty &&
        purchaseController.text.isNotEmpty &&
        averageTicketController.text.isNotEmpty &&
        visitFrequency != null &&
        amountController.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  void sendErrorMessage() {
    if (selectWholesaler == null) {
      _wValidationText = AppString.requiredFieldText;
      notifyListeners();
    } else {
      _wValidationText = "";
      notifyListeners();
    }
    if (selectCurrency.isEmpty) {
      _cValidationText = AppString.requiredFieldText;
      notifyListeners();
    } else {
      _cValidationText = "";
      notifyListeners();
    }
    if (purchaseController.text.isEmpty) {
      _mPValidationText = AppString.requiredFieldText;
      notifyListeners();
    } else {
      _mPValidationText = "";
      notifyListeners();
    }
    if (averageTicketController.text.isEmpty) {
      _aPValidationText = AppString.requiredFieldText;
      notifyListeners();
    } else {
      _aPValidationText = "";
      notifyListeners();
    }
    if (visitFrequency == null) {
      _vFValidationText = AppString.requiredFieldText;
      notifyListeners();
    } else {
      _vFValidationText = "";
      notifyListeners();
    }
    if (amountController.text.isEmpty) {
      _rAValidationText = AppString.requiredFieldText;
      notifyListeners();
    } else {
      _rAValidationText = "";
      notifyListeners();
    }
  }

  Future<void> load() async {
    setBusy(true);
    notifyListeners();
    await Future.delayed(const Duration(seconds: 1));
    setBusy(false);
    notifyListeners();
  }

  void addWholesaler(context) async {
    var snackBar;
    sendErrorMessage();
    if (canSubmitData()) {
      WholesalersData item = WholesalersData(
          id: DateTime.now().microsecondsSinceEpoch.toString(),
          wholesaler: selectWholesaler,
          currency: selectCurrency,
          monthlyPurchase: purchaseController.text,
          averageTicket: averageTicketController.text,
          visitFrequency: visitFrequency,
          amount: amountController.text);
      _repositoryRetailer.addCreditLineInformation(item);
      snackBar = const SnackBar(
        content: Text("Data have been saved!"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      await load();
      _navigationService.pop();
    }
  }

  Future<void> updateWholesaler(context) async {
    var snackBar;
    sendErrorMessage();
    if (canSubmitData()) {
      WholesalersData item = WholesalersData(
          id: wholesalerData.id!,
          wholesaler: selectWholesaler,
          currency: selectCurrency,
          monthlyPurchase: purchaseController.text,
          averageTicket: averageTicketController.text,
          visitFrequency: visitFrequency,
          amount: amountController.text);
      _repositoryRetailer.updateWholesaler(wholesalerData.id!, item);
      snackBar = const SnackBar(
        content: Text("Data have been updated!"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      await load();
      _navigationService.pop();
    }
  }

  void removeCreditLineInformation() {
    _repositoryRetailer.removeCreditLineInformation(wholesalerData.id!);
    _navigationService.pop();
  }

  String _wValidationText = "";
  String _cValidationText = "";
  String _mPValidationText = "";
  String _aPValidationText = "";
  String _vFValidationText = "";
  String _rAValidationText = "";
  String get wholesalerValidationText => _wValidationText;
  String get currencyValidationText => _cValidationText;
  String get mPValidationText => _mPValidationText;
  String get aPValidationText => _aPValidationText;
  String get vFValidationText => _vFValidationText;
  String get rAValidationText => _rAValidationText;
  bool isTextFieldValidate = false;

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_repositoryRetailer];
}
