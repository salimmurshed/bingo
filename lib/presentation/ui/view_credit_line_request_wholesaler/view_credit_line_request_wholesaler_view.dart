import 'package:bingo_wholesale/const/all_const.dart';
import 'package:bingo_wholesale/const/app_bar_titles.dart';
import 'package:bingo_wholesale/presentation/ui/view_credit_line_request_wholesaler/view_credit_line_request_wholesaler_view_model.dart';
import 'package:bingo_wholesale/presentation/widgets/text_fields/name_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../const/app_sizes/app_sizes.dart';
import '../../../const/app_styles/app_box_decoration.dart';
import '../../../const/utils.dart';
import '../../../data_models/models/wholesaler_credit_line_model/wholesaler_credit_line_model.dart';

class ViewCreditLineRequestWholesalerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ViewCreditLineRequestWholesalerViewModel>.reactive(
        viewModelBuilder: () => ViewCreditLineRequestWholesalerViewModel(),
        onModelReady: (ViewCreditLineRequestWholesalerViewModel model) => model
            .setCreditLineDetails(ModalRoute.of(context)!.settings.arguments
                as WholesalerCreditLineData),
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(AppBarTitles.creditLineDetaileTitle),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: AppPaddings.screenARDSWidgetInnerPadding,
                    // decoration: AppBoxDecoration.shadowBox,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        commonText(AppString.creditLineInformation),
                        18.0.giveHeight,
                        Container(
                          decoration: AppBoxDecoration.shadowBox,
                          padding: AppPaddings.screenARDSWidgetInnerPadding,
                          child: Column(
                            children: [
                              SizedBox(
                                width: 100.0.wp,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    NameTextField(
                                      enable: false,
                                      controller: model.customerSinceController,
                                      fieldName: AppString.customerSinceDate,
                                      readOnly: true,
                                    ),
                                    12.0.giveHeight,
                                    NameTextField(
                                      enable: false,
                                      controller: model.monthlySalesController,
                                      fieldName: AppString.monthlySales,
                                      readOnly: true,
                                    ),
                                    12.0.giveHeight,
                                    NameTextField(
                                      enable: false,
                                      controller:
                                          model.averageSalesTicketController,
                                      fieldName: AppString.averageSalesTicket,
                                      readOnly: true,
                                    ),
                                    12.0.giveHeight,
                                    NameTextField(
                                      enable: false,
                                      controller:
                                          model.visitFrequencyController,
                                      fieldName: AppString.visitFrequency,
                                      readOnly: true,
                                    ),
                                    12.0.giveHeight,
                                    NameTextField(
                                      enable: false,
                                      controller:
                                          model.recommandedCreditLintController,
                                      fieldName:
                                          AppString.recommendedCreditLineAmount,
                                      readOnly: true,
                                    ),
                                    12.0.giveHeight,
                                  ],
                                ),
                              ),
                              12.0.giveHeight,
                            ],
                          ),
                        ),
                        20.0.giveHeight,
                        commonText(AppString.retailerCompletedInfomation),
                        18.0.giveHeight,
                        Container(
                          decoration: AppBoxDecoration.shadowBox,
                          padding: AppPaddings.screenARDSWidgetInnerPadding,
                          child: Column(
                            children: [
                              SizedBox(
                                width: 100.0.wp,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    NameTextField(
                                      enable: false,
                                      controller: model.currencyController,
                                      fieldName: AppString.currency,
                                      readOnly: true,
                                    ),
                                    12.0.giveHeight,
                                    NameTextField(
                                      enable: false,
                                      controller:
                                          model.monthlyPurchaseController,
                                      fieldName: AppString.monthlyPurchase,
                                      readOnly: true,
                                    ),
                                    12.0.giveHeight,
                                    NameTextField(
                                      enable: false,
                                      controller:
                                          model.averagePurchaseTicketController,
                                      fieldName:
                                          AppString.averagePurchaseTicket,
                                      readOnly: true,
                                    ),
                                    12.0.giveHeight,
                                    NameTextField(
                                      enable: false,
                                      controller:
                                          model.requestedAmountController,
                                      fieldName: AppString.requestedAmount,
                                      readOnly: true,
                                    ),
                                    12.0.giveHeight,
                                    NameTextField(
                                      enable: false,
                                      controller:
                                          model.visitFrequencyController,
                                      fieldName: AppString.visitFrequency,
                                      readOnly: true,
                                    ),
                                    12.0.giveHeight,
                                  ],
                                ),
                              ),
                              12.0.giveHeight,
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
