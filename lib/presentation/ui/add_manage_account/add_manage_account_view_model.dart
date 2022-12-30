import 'package:bingo_wholesale/const/all_const.dart';
import 'package:bingo_wholesale/repository/repository_retailer.dart';
import 'package:bingo_wholesale/services/navigation/navigationService.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../app/locator.dart';
import '../../../const/app_bar_titles.dart';
import '../../../data/data_source/bank_account_type.dart';
import '../../../data_models/models/component_models/bank_list.dart';
import '../../../data_models/models/failure.dart';
import '../../../data_models/models/retailer_bank_list/retailer_bank_list.dart';
import '../../../repository/repository_components.dart';

class AddManageAccountViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final RepositoryRetailer _repositoryRetailer = locator<RepositoryRetailer>();
  final RepositoryComponents _repositoryComponents =
      locator<RepositoryComponents>();

  List<BankAccountTypeModel> bankAccountType = BankInfo.bankAccountType;
  List<BankListData> get retailerBankList =>
      _repositoryComponents.retailerBankList;
  List<String> currency = [];

  BankAccountTypeModel? selectedBankAccountType;
  BankListData? selectedBankName;
  String? selectedCurrency;

  TextEditingController bankAccountController = TextEditingController();
  TextEditingController ibanController = TextEditingController();

  String bankAccountTypeValidation = "";
  String bankNameValidation = "";
  String currencyValidation = "";
  String bankAccountValidation = "";
  String ibanValidation = "";
  RetailerBankListData? bankDetails;
  bool isEdit = false;
  String appBarTitle = AppBarTitles.addManageAccount;

  void setData(RetailerBankListData arguments) {
    bankDetails = arguments;
    bankAccountController.text = arguments.bankAccountNumber!;
    ibanController.text = arguments.iban!;
    selectedBankAccountType = bankAccountType
        .firstWhere((element) => element.id == arguments.bankAccountType!);
    selectedBankName = retailerBankList
        .firstWhere((element) => element.bpName == arguments.fieName!);
    if (selectedBankName != null) {
      selectedCurrency = null;
      currency = selectedBankName!.currency!;
      selectedCurrency = selectedBankName!.currency!
          .firstWhere((element) => element == arguments.currency);
    }
    appBarTitle = AppBarTitles.editManageAccount;
    isEdit = true;
    notifyListeners();
  }

  void changeBankAccountType(BankAccountTypeModel value) {
    selectedBankAccountType = value;
    notifyListeners();
  }

  void changeRetailerBankList(BankListData value) {
    selectedBankName = value;
    selectedCurrency = null;
    currency = value.currency!;
    notifyListeners();
  }

  void changeCurrency(String value) {
    selectedCurrency = value;
    notifyListeners();
  }

  Future<void> addAccount() async {
    setBusy(true);
    notifyListeners();
    if (selectedBankAccountType == null) {
      bankAccountTypeValidation = AppString.bankAccountTypeValidationText;
    } else {
      bankAccountTypeValidation = "";
    }
    if (selectedBankName == null) {
      bankNameValidation = AppString.bankNameValidationText;
    } else {
      bankNameValidation = "";
    }
    if (selectedBankName != null) {
      if (selectedCurrency == null) {
        currencyValidation = AppString.currencyValidationText;
      } else {
        currencyValidation = "";
      }
    }
    if (bankAccountController.text.isEmpty) {
      bankAccountValidation = AppString.bankAccountValidationText;
    } else if (bankAccountController.text.length < 8) {
      bankAccountValidation = AppString.bankAccountLengthValidationText;
    } else {
      bankAccountValidation = "";
    }
    if (ibanController.text.isEmpty) {
      ibanValidation = AppString.ibanValidationText;
    } else if (ibanController.text.length < 8) {
      ibanValidation = AppString.ibanLengthValidationText;
    } else {
      ibanValidation = "";
    }
    notifyListeners();
    if (selectedBankAccountType != null &&
        selectedBankName != null &&
        selectedCurrency != null &&
        bankAccountController.text.isNotEmpty &&
        ibanController.text.isNotEmpty &&
        ibanController.text.length >= 8 &&
        bankAccountController.text.length >= 8) {
      var body = {
        "bank_account_type": selectedBankAccountType!.id.toString(),
        "bank_name": selectedBankName!.bpName,
        "bank_unique_id": selectedBankName!.bankUniqueId,
        "currency": selectedCurrency,
        "bank_account_number": bankAccountController.text,
        "iban": ibanController.text,
      };
      Failure failure = await _repositoryRetailer.addRetailerBankAccounts(body);
      endResponseMessage(failure);
      setBusy(false);
      notifyListeners();
    } else {
      setBusy(false);
      notifyListeners();
    }
  }

  Future<void> editAccount() async {
    setBusy(true);
    notifyListeners();
    if (selectedBankAccountType == null) {
      bankAccountTypeValidation = AppString.bankAccountTypeValidationText;
    } else {
      bankAccountTypeValidation = "";
    }
    if (selectedBankName == null) {
      bankNameValidation = AppString.bankNameValidationText;
    } else {
      bankNameValidation = "";
    }
    if (selectedBankName != null) {
      if (selectedCurrency == null) {
        currencyValidation = AppString.currencyValidationText;
      } else {
        currencyValidation = "";
      }
    }
    if (bankAccountController.text.isEmpty) {
      bankAccountValidation = AppString.bankAccountValidationText;
    } else if (bankAccountController.text.length < 8) {
      bankAccountValidation = AppString.bankAccountLengthValidationText;
    } else {
      bankAccountValidation = "";
    }
    if (ibanController.text.isEmpty) {
      ibanValidation = AppString.ibanValidationText;
    } else if (ibanController.text.length < 8) {
      ibanValidation = AppString.ibanLengthValidationText;
    } else {
      ibanValidation = "";
    }
    notifyListeners();
    if (selectedBankAccountType != null &&
        selectedBankName != null &&
        selectedCurrency != null &&
        bankAccountController.text.isNotEmpty &&
        ibanController.text.isNotEmpty &&
        ibanController.text.length >= 8 &&
        bankAccountController.text.length >= 8) {
      var body = {
        "unique_id": bankDetails!.uniqueId!,
        "bank_account_type": selectedBankAccountType!.id.toString(),
        "bank_name": selectedBankName!.bpName,
        "bank_unique_id": selectedBankName!.bankUniqueId,
        "currency": selectedCurrency,
        "bank_account_number": bankAccountController.text,
        "iban": ibanController.text,
      };
      Failure failure = await _repositoryRetailer.addRetailerBankAccounts(body);
      endResponseMessage(failure);
      setBusy(false);
      notifyListeners();
    } else {
      setBusy(false);
      notifyListeners();
    }
  }

  String responseMessage = "";
  bool responseStatus = false;
  void endResponseMessage(Failure failure) async {
    responseMessage = failure.message;
    responseStatus = failure.status;
    notifyListeners();
    if (failure.status) {
      await Future.delayed(const Duration(seconds: 1));
      _navigationService.pop();
    }
    await Future.delayed(const Duration(seconds: 3));
    responseMessage = "";
    notifyListeners();
  }

  //
  // @override
  // List<ReactiveServiceMixin> get reactiveServices => [_repositoryComponents];
}
