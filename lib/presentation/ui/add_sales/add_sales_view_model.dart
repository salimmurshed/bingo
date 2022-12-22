import 'package:bingo_wholesale/data_models/construction_model/sale_types_model.dart';
import 'package:bingo_wholesale/services/auth_service/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

import '../../../app/locator.dart';
import '../../../data/data_source/sale_types.dart';
import '../../../data_models/models/component_models/retailer_list_model.dart';
import '../../../data_models/models/component_models/store_model.dart';
import '../../../data_models/models/user_model/user_model.dart';
import '../../../repository/repository_components.dart';

class AddSalesViewModel extends ReactiveViewModel {
  AddSalesViewModel() {
    // getRetailer();
  }
  final RepositoryComponents _repositoryComponents =
      locator<RepositoryComponents>();
  // final RepositorySales _repositorySales = locator<RepositorySales>();
  final AuthService _authService = locator<AuthService>();
  RetailerListData? selectRetailer;
  RetailerInformation? selectStore;
  SaleTypesModel? selectSaleType;
  UserModel get user => _authService.user.value;

  List<RetailerListData> get retailerList => _repositoryComponents.retailerList;
  List<RetailerInformation> get storeList => _repositoryComponents.storeList;
  List<SaleTypesModel> get saleTypes => saleTypesList;

  bool isStoreBusy = false;

  TextEditingController currencyController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController invoiceController = TextEditingController();
  TextEditingController orderController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  void setStoreBudy(bool v) {
    isStoreBusy = v;
    notifyListeners();
  }

  void changeRetailer(RetailerListData v) async {
    selectRetailer = v;
    selectStore = null;
    setStoreBudy(true);
    await _repositoryComponents.getStoreList(v.bpIdR);
    setStoreBudy(false);
    notifyListeners();
  }

  void changeStore(RetailerInformation v) async {
    selectStore = v;
    currencyController.text = selectStore!.approvedCreditLineCurrency!;
    notifyListeners();
  }

  void changeSaleType(SaleTypesModel v) async {
    selectSaleType = v;
    invoiceValidation = "";
    orderValidation = "";
    notifyListeners();
  }

  String retailerValidation = "";
  String storeValidation = "";
  String salesTypeValidation = "";
  String invoiceValidation = "";
  String orderValidation = "";
  String amountValidation = "";
  int maxEligibility = 100;
  void addNew() {
    if (selectRetailer == null) {
      retailerValidation = "Please select a retailer";
    } else {
      retailerValidation = "";
    }

    if (selectRetailer != null) {
      if (selectStore == null) {
        storeValidation = "Please select a store";
      } else {
        storeValidation = "";
      }
    }

    if (selectSaleType == null) {
      salesTypeValidation = "Please select a sales type";
    } else {
      salesTypeValidation = "";
    }
    if (selectSaleType != null) {
      if (selectSaleType!.initiate == saleTypes[0].initiate) {
        if (invoiceController.text.isEmpty) {
          invoiceValidation = "Please put invoice number";
          orderValidation = "";
        } else {
          invoiceValidation = "";
        }
      } else if (selectSaleType!.initiate == saleTypes[1].initiate) {
        if (orderController.text.isEmpty) {
          orderValidation = "Please put order number";
          invoiceValidation = "";
        } else {
          orderValidation = "";
        }
      } else {
        invoiceValidation = "";
        orderValidation = "";
      }
    }

    if (amountController.text.isEmpty) {
      amountValidation = "Amount can't be empty";
    } else if (int.parse(amountController.text) > maxEligibility) {
      amountValidation = "Amount can't be more than available balance\n"
          "you can purchase maximum ${selectStore!.approvedCreditLineCurrency!} $maxEligibility.";
    } else {
      amountValidation = "";
    }

    notifyListeners();
    print(user.data!.uniqueId);
    // var body = {
    //   DataBaseHelperKeys.bpIdR: selectRetailer!.bpIdR,
    //   DataBaseHelperKeys.storeId: selectStore!.storeId,
    //   DataBaseHelperKeys.wholesalerStoreId: user.data!.uniqueId,
    //   DataBaseHelperKeys.saleType: selectSaleType!.initiate,
    //   DataBaseHelperKeys.invoiceNumber: invoiceController.text,
    //   DataBaseHelperKeys.orderNumber: orderController.text,
    //   DataBaseHelperKeys.currency: selectStore!.approvedCreditLineCurrency,
    //   DataBaseHelperKeys.amount: amountController.text,
    //   DataBaseHelperKeys.description: descriptionController.text,
    // };
    // _repositorySales.addSales(body);
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_repositoryComponents];
}
