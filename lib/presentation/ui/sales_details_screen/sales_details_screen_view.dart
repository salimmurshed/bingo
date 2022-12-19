import 'package:bingo_wholesale/const/all_const.dart';
import 'package:bingo_wholesale/const/app_extensions/status.dart';
import 'package:bingo_wholesale/const/app_sizes/app_sizes.dart';
import 'package:bingo_wholesale/const/app_styles/app_box_decoration.dart';
import 'package:bingo_wholesale/const/utils.dart';
import 'package:bingo_wholesale/presentation/ui/sales_details_screen/sales_details_screen_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../const/app_bar_titles.dart';
import '../../../const/app_colors.dart';
import '../../../data_models/construction_model/confirmation_model/confirmation_model.dart';
import '../../../data_models/enums/status_name.dart';
import '../../widgets/buttons/submit_button.dart';

class SalesDetailsScreenView extends StatelessWidget {
  const SalesDetailsScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SalesDetailsScreenViewModel>.reactive(
        onModelReady: (SalesDetailsScreenViewModel model) => model.setData(
            ModalRoute.of(context)!.settings.arguments as ConfirmationModel),
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
                            model.singleConfirmationData.invoice!,
                            style: AppTextStyles.dashboardHeadTitle
                                .copyWith(fontWeight: AppFontWeighs.semiBold),
                          ),
                          Text(
                            "USD ${model.singleConfirmationData.invoice!}",
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
                      statusNamesEnumFromServer(
                              model.singleConfirmationData.status)
                          .toStatus(
                              isIconAvailable: false,
                              textStyle: AppTextStyles.dashboardHeadTitle),
                      Padding(
                        padding: AppPaddings.salesDetailsDeviderPadding,
                        child: Divider(),
                      ),
                      SizedBox(
                        width: 100.0.wp - 100,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            getNiceText(
                                "${AppString.invoiceTo}"
                                " ${model.singleConfirmationData.invoiceTo}",
                                style: AppTextStyles.dashboardHeadTitle),
                            getNiceText(
                                "${AppString.fieName}"
                                " ${model.singleConfirmationData.fie}",
                                style: AppTextStyles.dashboardHeadTitle),
                            getNiceText(
                                "${AppString.dateOfInvoice}"
                                " ${model.singleConfirmationData.date}",
                                style: AppTextStyles.dashboardHeadTitle),
                            getNiceText(
                                "${AppString.orderNumber}"
                                " ${model.singleConfirmationData.orderId}",
                                style: AppTextStyles.dashboardHeadTitle),
                            getNiceText(
                                "${AppString.dueDate}"
                                " ${model.singleConfirmationData.dueDate}",
                                style: AppTextStyles.dashboardHeadTitle),
                            getNiceText(
                                "${AppString.bingoStoreID}"
                                " ${model.singleConfirmationData.bingoStoreId}",
                                style: AppTextStyles.dashboardHeadTitle),
                            getNiceText(
                                "${AppString.salesStep}"
                                " ${model.singleConfirmationData.salesStep}",
                                style: AppTextStyles.dashboardHeadTitle),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 50.0,
                      ),
                      if (statusNamesEnumFromServer(
                              model.singleConfirmationData.status) ==
                          StatusNames.saleApprovalDelivered)
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
                      if (statusNamesEnumFromServer(
                              model.singleConfirmationData.status) !=
                          StatusNames.saleApprovalDelivered)
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
