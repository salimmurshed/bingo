import 'package:bingo_wholesale/const/all_const.dart';
import 'package:bingo_wholesale/repository/repository_retailer.dart';
import 'package:bingo_wholesale/services/navigation/navigationService.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../app/locator.dart';
import '../../../data/data_source/bank_account_type.dart';
import '../../../data_models/models/component_models/bank_list.dart';
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
    } else {
      bankAccountValidation = "";
    }
    if (ibanController.text.isEmpty) {
      ibanValidation = AppString.ibanValidationText;
    } else {
      ibanValidation = "";
    }
    notifyListeners();
    if (selectedBankAccountType != null &&
        selectedBankName != null &&
        selectedCurrency != null &&
        bankAccountController.text.isNotEmpty &&
        ibanController.text.isNotEmpty) {
      var bodyForAdd = {
        "bank_account_type": selectedBankAccountType!.id.toString(),
        "bank_name": selectedBankName!.bpName,
        "bank_unique_id": selectedBankName!.bankUniqueId,
        "currency": selectedCurrency,
        "bank_account_number": bankAccountController.text,
        "iban": ibanController.text,
      };
      var bodyForEdit = {
        "unique_id": bankDetails!.uniqueId!,
        "bank_account_type": selectedBankAccountType!.id.toString(),
        "bank_name": selectedBankName!.bpName,
        "bank_unique_id": selectedBankName!.bankUniqueId,
        "currency": selectedCurrency,
        "bank_account_number": bankAccountController.text,
        "iban": ibanController.text,
      };
      // var body = isEdit ? bodyForEdit : bodyForAdd;
      await _repositoryRetailer
          .addRetailerBankAccounts(isEdit ? bodyForEdit : bodyForAdd);
      _navigationService.pop();
      setBusy(false);
      notifyListeners();
    }
  }

  //
  // @override
  // List<ReactiveServiceMixin> get reactiveServices => [_repositoryComponents];
}
