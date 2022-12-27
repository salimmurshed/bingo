import 'package:bingo_wholesale/const/all_const.dart';
import 'package:bingo_wholesale/const/app_bar_titles.dart';
import 'package:bingo_wholesale/const/app_styles/app_box_decoration.dart';
import 'package:bingo_wholesale/const/utils.dart';
import 'package:bingo_wholesale/presentation/widgets/buttons/submit_button.dart';
import 'package:bingo_wholesale/presentation/widgets/cards/single_lin_shimmer.dart';
import 'package:bingo_wholesale/presentation/widgets/dropdowns/selected_dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../const/app_sizes/app_sizes.dart';
import '../../../data_models/construction_model/sale_types_model.dart';
import '../../../data_models/models/component_models/retailer_list_model.dart';
import '../../widgets/text_fields/name_text_field.dart';
import 'add_sales_view_model.dart';

class AddSalesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddSalesViewModel>.reactive(
        viewModelBuilder: () => AddSalesViewModel(),
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(AppBarTitles.addSales.toUpperCase()),
            ),
            body: SingleChildScrollView(
              child: Container(
                decoration: AppBoxDecoration.shadowBox,
                width: 100.0.wp,
                padding: AppPaddings.cardBody,
                margin: AppPaddings.cardBody,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ////Select Retailer
                        SelectedDropdown<RetailerListData>(
                            dropdownValue: model.selectRetailer,
                            fieldName: AppString.retailer,
                            hintText: AppString.selectRetailer,
                            items: model.retailerList
                                .map(
                                  (e) => DropdownMenuItem<RetailerListData>(
                                    value: e,
                                    child: Text(e.retailerName!),
                                  ),
                                )
                                .toList(),
                            onChange: (RetailerListData? newValue) {
                              model.changeRetailer(newValue!);
                            }),
                        if (model.retailerValidation.isNotEmpty)
                          validationText(model.retailerValidation),
                        if (model.selectRetailer != null) 20.0.giveHeight,
                        if (model.selectRetailer != null)
                          if (model.retailerList.isNotEmpty)
                            ////Colmado Troncoso
                            model.isStoreBusy
                                ? const SingleLineShimmerScreen()
                                : SelectedDropdown<StoreList>(
                                    dropdownValue: model.selectStore,
                                    fieldName: AppString.store,
                                    hintText: AppString.selectStore,
                                    items: model.sortedStoreList
                                        .map(
                                          (e) => DropdownMenuItem<StoreList>(
                                            value: e,
                                            child: Text(e.name!),
                                          ),
                                        )
                                        .toList(),
                                    onChange: (StoreList? newValue) {
                                      model.changeStore(newValue!);
                                    }),
                        if (model.selectStore != null)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              20.0.giveHeight,
                              Container(
                                padding: const EdgeInsets.all(17.0),
                                width: 100.0.wp,
                                // height: 65.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: AppColors.addSaleAmountSectionColor,
                                ),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      AppAsset.dollerSign,
                                      width: 28.0,
                                      height: 28.0,
                                    ),
                                    17.0.giveWidth,
                                    Flexible(
                                      child: RichText(
                                        text: TextSpan(
                                          text: AppString.availableAmount,
                                          style:
                                              AppTextStyles.addSaleGreenBoxText,
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: model.selectStore!.name!,
                                              style: AppTextStyles
                                                  .addSaleGreenBoxTextBold,
                                            ),
                                            TextSpan(
                                              text:
                                                  ' ${model.selectStore!.approvedCreditLineCurrency!}',
                                              style: AppTextStyles
                                                  .addSaleGreenBoxTextBold,
                                            ),
                                            TextSpan(
                                              text:
                                                  ' ${model.selectStore!.availableAmount!}',
                                              style: AppTextStyles
                                                  .addSaleGreenBoxTextBold,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        if (model.storeValidation.isNotEmpty)
                          validationText(model.storeValidation),
                        if (model.retailerList.isNotEmpty) 20.0.giveHeight,
                        SelectedDropdown<SaleTypesModel>(
                            dropdownValue: model.selectSaleType,
                            fieldName: AppString.salesType,
                            hintText: AppString.selectSaleType,
                            items: model.saleTypes
                                .map(
                                  (e) => DropdownMenuItem<SaleTypesModel>(
                                    value: e,
                                    child: Text(e.title!),
                                  ),
                                )
                                .toList(),
                            onChange: (SaleTypesModel? newValue) {
                              model.changeSaleType(newValue!);
                            }),
                        if (model.salesTypeValidation.isNotEmpty)
                          validationText(model.salesTypeValidation),
                        if (model.selectSaleType != null)
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              20.0.giveHeight,
                              if (model.selectSaleType!.initiate ==
                                  model.saleTypes[0].initiate)
                                NameTextField(
                                  controller: model.invoiceController,
                                  hintText: AppString.hintTextInvoiceController,
                                  fieldName: AppString.invoiceNumber,
                                ),
                              if (model.invoiceValidation.isNotEmpty)
                                validationText(model.invoiceValidation),
                              if (model.selectSaleType!.initiate ==
                                  model.saleTypes[1].initiate)
                                NameTextField(
                                  controller: model.orderController,
                                  hintText: AppString.hintTextOrderController,
                                  fieldName: AppString.orderNumberSale,
                                ),
                              if (model.orderValidation.isNotEmpty)
                                validationText(model.orderValidation),
                            ],
                          ),
                        20.0.giveHeight,
                        if (model.selectStore != null)
                          model.isStoreBusy
                              ? const SingleLineShimmerScreen()
                              : NameTextField(
                                  hintText:
                                      AppString.hintTextCurrencyController,
                                  readOnly: true,
                                  enable: false,
                                  controller: model.currencyController,
                                  fieldName: AppString.currency,
                                ),
                        if (model.selectStore != null) 20.0.giveHeight,
                        if (model.selectStore != null)
                          model.isStoreBusy
                              ? const SingleLineShimmerScreen()
                              : NameTextField(
                                  isNumber: true,
                                  onChanged: (String value) =>
                                      model.checkBalance(value),
                                  hintText: AppString.hintTextAmountController,
                                  controller: model.amountController,
                                  fieldName: AppString.amount,
                                ),
                        if (model.amountValidation.isNotEmpty)
                          validationText(model.amountValidation),
                        if (model.selectStore != null) 20.0.giveHeight,
                        NameTextField(
                          maxLine: 5,
                          hintText: AppString.hintTextDescriptionController,
                          controller: model.descriptionController,
                          fieldName: AppString.description,
                        ),
                        20.0.giveHeight,
                        SubmitButton(
                          onPressed: model.addNew,
                          height: 45.0,
                          text: AppString.addNewIcon,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
