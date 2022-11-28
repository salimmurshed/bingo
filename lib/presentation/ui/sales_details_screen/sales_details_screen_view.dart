import 'package:bingo_wholesale/const/all_const.dart';import 'package:bingo_wholesale/const/app_extensions/status.dart';import 'package:bingo_wholesale/const/app_styles/app_box_decoration.dart';import 'package:bingo_wholesale/const/utils.dart';import 'package:bingo_wholesale/presentation/ui/sales_details_screen/sales_details_screen_view_model.dart';import 'package:flutter/cupertino.dart';import 'package:flutter/material.dart';import 'package:stacked/stacked.dart';import '../../../const/app_bar_titles.dart';import '../../../const/app_colors.dart';import '../../../data_models/construction_model/confirmation_model/confirmation_model.dart';import '../../../data_models/enums/status_name.dart';import '../../common_widgets/buttons/submit_button.dart';class SalesDetailsScreenView extends StatelessWidget {  @override  Widget build(BuildContext context) {    return ViewModelBuilder<SalesDetailsScreenViewModel>.reactive(        onModelReady: (SalesDetailsScreenViewModel model) => model.setData(            ModalRoute.of(context)!.settings.arguments as ConfirmationModel),        viewModelBuilder: () => SalesDetailsScreenViewModel(),        builder: (context, model, child) {          return Scaffold(            appBar: AppBar(              title: Text(AppBarTitles.salesDetails),              backgroundColor: model.isRetailer                  ? AppColors.appBarColorRetailer                  : AppColors.appBarColorWholesaler,            ),            body: Padding(              padding: const EdgeInsets.all(25.0),              child: Card(                elevation: 2.0,                shape: RoundedRectangleBorder(                  borderRadius: BorderRadius.circular(10.0),                ),                child: Container(                  // padding: EdgeInsets.all(25.0),                  margin: const EdgeInsets.all(25.0),                  decoration: AppBoxDecoration.dashboardCardDecoration.copyWith(                    borderRadius: BorderRadius.circular(10.0),                  ),                  child: Column(                    mainAxisSize: MainAxisSize.min,                    children: [                      Row(                        mainAxisAlignment: MainAxisAlignment.spaceBetween,                        children: [                          Text(                            model.singleConfirmationData.invoice!,                            style: AppTextStyles.dashboardHeadTitle                                .copyWith(fontWeight: AppFontWeighs.semiBold),                          ),                          Text(                            "USD ${model.singleConfirmationData.invoice!}",                            style: AppTextStyles.dashboardHeadTitle                                .copyWith(fontWeight: AppFontWeighs.semiBold),                          ),                        ],                      ),                      const Padding(                        padding: EdgeInsets.only(top: 27.0, bottom: 22.0),                        child: Divider(),                      ),                      Text(                        AppString.status,                        style: AppTextStyles.dashboardHeadTitle,                      ),                      statusNamesEnumFromServer(                              model.singleConfirmationData.status)                          .toStatus(                              isIconAvailable: false,                              textStyle: AppTextStyles.dashboardHeadTitle),                      const Padding(                        padding: EdgeInsets.only(top: 20.0, bottom: 22.0),                        child: Divider(),                      ),                      SizedBox(                        width: 100.0.wp - 100,                        child: Column(                          mainAxisSize: MainAxisSize.max,                          mainAxisAlignment: MainAxisAlignment.start,                          crossAxisAlignment: CrossAxisAlignment.start,                          children: [                            getNiceText(                                "Invoice To: ${model.singleConfirmationData.invoiceTo}",                                style: AppTextStyles.dashboardHeadTitle),                            getNiceText(                                "FIE Name: ${model.singleConfirmationData.fie}",                                style: AppTextStyles.dashboardHeadTitle),                            getNiceText(                                "Date Of Invoice: ${model.singleConfirmationData.date}",                                style: AppTextStyles.dashboardHeadTitle),                            getNiceText(                                "Order Number: ${model.singleConfirmationData.orderId}",                                style: AppTextStyles.dashboardHeadTitle),                            getNiceText(                                "Due Date: ${model.singleConfirmationData.dueDate}",                                style: AppTextStyles.dashboardHeadTitle),                            getNiceText(                                "Bingo Store ID: ${model.singleConfirmationData.bingoStoreId}",                                style: AppTextStyles.dashboardHeadTitle),                            getNiceText(                                "Sales Step: ${model.singleConfirmationData.salesStep}",                                style: AppTextStyles.dashboardHeadTitle),                          ],                        ),                      ),                      const SizedBox(                        height: 50.0,                      ),                      if (statusNamesEnumFromServer(                              model.singleConfirmationData.status) ==                          StatusNames.saleApprovalDelivered)                        SubmitButton(                          active: true,                          height: 45.0,                          text: AppString.startPayment.toUpperCase(),                        ),                      SubmitButton(                        onPressed: model.openQRDialog,                        active: true,                        height: 45.0,                        text: AppString.offlineApprove.toUpperCase(),                      ),                      if (statusNamesEnumFromServer(                              model.singleConfirmationData.status) !=                          StatusNames.saleApprovalDelivered)                        Column(                          children: [                            SubmitButton(                              active: true,                              height: 45.0,                              text: AppString.approve.toUpperCase(),                            ),                            const SizedBox(                              height: 24.0,                            ),                            SubmitButton(                              color: AppColors.statusReject,                              active: true,                              height: 45.0,                              text: AppString.reject.toUpperCase(),                            ),                          ],                        ),                      const SizedBox(                        height: 32.0,                      ),                    ],                  ),                ),              ),            ),          );        });  }}