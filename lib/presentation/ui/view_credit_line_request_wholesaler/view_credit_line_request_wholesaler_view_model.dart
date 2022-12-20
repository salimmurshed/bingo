import 'package:bingo_wholesale/const/app_extensions/amount_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

import '../../../data/data_source/visit_frequently_list.dart';
import '../../../data_models/models/wholesaler_credit_line_model/wholesaler_credit_line_model.dart';

class ViewCreditLineRequestWholesalerViewModel extends BaseViewModel {
  WholesalerCreditLineData? _wholesalerCreditLineData;
  TextEditingController customerSinceController = TextEditingController();
  TextEditingController monthlySalesController = TextEditingController();
  TextEditingController averageSalesTicketController = TextEditingController();
  TextEditingController visitFrequencyController = TextEditingController();
  TextEditingController recommandedCreditLintController =
      TextEditingController();
  TextEditingController currencyController = TextEditingController();
  TextEditingController monthlyPurchaseController = TextEditingController();
  TextEditingController averagePurchaseTicketController =
      TextEditingController();
  TextEditingController requestedAmountController = TextEditingController();
  WholesalerCreditLineData get wholesalerCreditLineData =>
      _wholesalerCreditLineData!;
  void setCreditLineDetails(WholesalerCreditLineData arguments) {
    _wholesalerCreditLineData = arguments;
    customerSinceController.text = arguments.customerSinceDate!;
    monthlySalesController.text = arguments.monthlySales!.priceString();
    averageSalesTicketController.text =
        arguments.averageSalesTicket!.priceString();
    visitFrequencyController.text =
        AppList.visitFrequentlyList[arguments.visitFrequency!].title!;
    recommandedCreditLintController.text = arguments.rcCrlineAmt!.priceString();
    currencyController.text = arguments.currency!;
    monthlyPurchaseController.text = arguments.monthlyPurchase!.priceString();
    averagePurchaseTicketController.text = arguments.averagePurchaseTickets!;
    requestedAmountController.text = arguments.requestedAmount!.priceString();
  }
}
