import 'package:bingo_wholesale/const/all_const.dart';
import 'package:bingo_wholesale/const/app_extensions/status.dart';
import 'package:bingo_wholesale/const/app_sizes/app_sizes.dart';
import 'package:bingo_wholesale/const/app_styles/app_box_decoration.dart';
import 'package:bingo_wholesale/const/utils.dart';
import 'package:bingo_wholesale/presentation/ui/sales_details_screen/sales_details_screen_view_model.dart';
import 'package:bingo_wholesale/presentation/widgets/cards/sales_details_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../const/app_bar_titles.dart';
import '../../../const/app_colors.dart';
import '../../../data_models/construction_model/confirmation_model/confirmation_model.dart';
import '../../../data_models/enums/status_name.dart';
import '../../../data_models/models/all_sales_model/all_sales_model.dart';
import '../../widgets/buttons/submit_button.dart';

class SalesDetailsScreenView extends StatelessWidget {
  const SalesDetailsScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SalesDetailsScreenViewModel>.reactive(
        onModelReady: (SalesDetailsScreenViewModel model) => model.setData(
            ModalRoute.of(context)!.settings.arguments as AllSalesData),
        viewModelBuilder: () => SalesDetailsScreenViewModel(),
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(AppBarTitles.salesDetails),
              backgroundColor: model.isRetailer
                  ? AppColors.appBarColorRetailer
                  : AppColors.appBarColorWholesaler,
            ),
            body: Padding(
              padding: AppPaddings.salesDetailsMainCard,
              child: Card(
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                  borderRadius: AppRadius.salesDetailsRadius,
                ),
                child: Container(
                  margin: AppMargins.salesDetailsMainCardMargin,
                  decoration: AppBoxDecoration.dashboardCardDecoration.copyWith(
                    borderRadius: AppRadius.salesDetailsRadius,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            model.allSalesData.invoiceNumber!,
                            style: AppTextStyles.dashboardHeadTitle
                                .copyWith(fontWeight: AppFontWeighs.semiBold),
                          ),
                          Text(
                            "${model.allSalesData.currency!} ${model.allSalesData.amount!}",
                            style: AppTextStyles.dashboardHeadTitle
                                .copyWith(fontWeight: AppFontWeighs.semiBold),
                          ),
                        ],
                      ),
                      Padding(
                        padding: AppPaddings.salesDetailsDeviderPadding,
                        child: Divider(),
                      ),
                      Text(
                        AppString.status,
                        style: AppTextStyles.dashboardHeadTitle,
                      ),
                      model.allSalesData.status!.toSaleStatus(
                          text: model.allSalesData.statusDescription!),
                      // statusNamesEnumFromServer(model.allSalesData.status)
                      //     .toStatus(
                      //         isIconAvailable: false,
                      //         textStyle: AppTextStyles.dashboardHeadTitle),
                      Padding(
                        padding: AppPaddings.salesDetailsDeviderPadding,
                        child: Divider(),
                      ),
                      SalesDetails(
                        data: [
                          "${AppString.invoiceTo}"
                              " ${model.allSalesData.fieName}",
                          "${AppString.fieName}"
                              " ${model.allSalesData.fieName}",
                          "${AppString.dateOfInvoice}"
                              " ${model.allSalesData.saleDate}",
                          "${AppString.orderNumber}"
                              " ${model.allSalesData.orderNumber}",
                          "${AppString.dueDate}"
                              " ${model.allSalesData.dueDate}",
                          "${AppString.bingoStoreID}"
                              " ${model.allSalesData.amount}",
                          "${AppString.salesStep}"
                              " ${model.allSalesData.saleDate}",
                        ],
                      ),
                      const SizedBox(
                        height: 50.0,
                      ),
                      if (model.allSalesData.status == 1)
                        SubmitButton(
                          active: true,
                          height: 45.0,
                          text: AppString.startPayment.toUpperCase(),
                        ),
                      SubmitButton(
                        onPressed: model.openQRDialog,
                        active: true,
                        height: 45.0,
                        text: AppString.offlineApprove.toUpperCase(),
                      ),
                      if (model.allSalesData.status == 1)
                        Column(
                          children: [
                            SubmitButton(
                              active: true,
                              height: 45.0,
                              text: AppString.approve.toUpperCase(),
                            ),
                            const SizedBox(
                              height: 24.0,
                            ),
                            SubmitButton(
                              color: AppColors.statusReject,
                              active: true,
                              height: 45.0,
                              text: AppString.reject.toUpperCase(),
                            ),
                          ],
                        ),
                      const SizedBox(
                        height: 32.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
