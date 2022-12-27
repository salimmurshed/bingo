import 'package:bingo_wholesale/const/all_const.dart';
import 'package:bingo_wholesale/const/app_bar_titles.dart';
import 'package:bingo_wholesale/data_models/construction_model/wholesaler_data.dart';
import 'package:bingo_wholesale/presentation/widgets/buttons/submit_button.dart';
import 'package:bingo_wholesale/presentation/widgets/cards/loader/loader.dart';
import 'package:bingo_wholesale/presentation/widgets/cards/single_lin_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../const/app_sizes/app_sizes.dart';
import '../../../const/app_styles/app_box_decoration.dart';
import '../../../const/utils.dart';
import '../../../data_models/construction_model/static_data_models/visit_frequent_list_model.dart';
import '../../../data_models/models/component_models/partner_with_currency_list.dart';
import '../../widgets/dropdowns/selected_dropdown_field.dart';
import '../../widgets/text_fields/name_text_field.dart';
import 'add_wholesaler_view_model.dart';

class AddWholesalerView extends StatelessWidget {
  const AddWholesalerView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddWholesalerViewModel>.reactive(
      onModelReady: (AddWholesalerViewModel model) {
        if (ModalRoute.of(context)!.settings.arguments != null) {
          model.setDetails(
              ModalRoute.of(context)!.settings.arguments as WholesalersData);
        }
      },
      viewModelBuilder: () => AddWholesalerViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.appBarColorRetailer,
            title: Text(AppBarTitles.addWholesaler),
          ),
          body: model.isBusy
              ? const LoaderWidget()
              : SingleChildScrollView(
                  child: Container(
                    margin: AppMargins.cardBody,
                    padding: AppPaddings.screenARDSWidgetInnerPadding,
                    decoration: AppBoxDecoration.shadowBox,
                    child: Form(
                      key: model.formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(AppString.selectWholeSaler),
                          20.0.giveHeight,
                          model.isBusy
                              ? const SingleLineShimmerScreen()
                              : Container(
                                  decoration: AppBoxDecoration.borderDecoration,
                                  height: 45.0,
                                  child: ButtonTheme(
                                    alignedDropdown: true,
                                    padding: AppPaddings.zero,
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<WholesalerData>(
                                        itemHeight: 50,
                                        hint: Text(
                                          model.wholesalerNameHint,
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFFa5a5a5),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        elevation: 0,
                                        isDense: false,
                                        isExpanded: true,
                                        value: model.selectWholesaler,
                                        icon: const Icon(
                                            Icons.arrow_drop_down_outlined),
                                        items: [
                                          for (var i = 0;
                                              i <
                                                  model.allWholesalers.data![0]
                                                      .wholesalerData!.length;
                                              i++)
                                            DropdownMenuItem<WholesalerData>(
                                              value: model.allWholesalers
                                                  .data![0].wholesalerData![i],
                                              child: Text(model
                                                  .allWholesalers
                                                  .data![0]
                                                  .wholesalerData![i]
                                                  .wholesalerName!),
                                            )
                                        ],
                                        onChanged: (WholesalerData? newValue) {
                                          model.changeSelectWholesaler(
                                              newValue!);
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                          if (model.wholesalerValidationText.isNotEmpty)
                            validationText(model.wholesalerValidationText),
                          if (model.selectWholesaler != null) 20.0.giveHeight,
                          if (model.selectWholesaler != null)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SelectedDropdownField(
                                  withHint: false,
                                  fieldName: AppString.selectCurrency,
                                  items: model.allCurrency,
                                  dropdownValue: model.selectCurrency,
                                  onChange: (String value) {
                                    model.changeSelectCurrency(value);
                                  },
                                ),
                                if (model.currencyValidationText.isNotEmpty)
                                  validationText(model.currencyValidationText),
                              ],
                            ),
                          20.0.giveHeight,
                          NameTextField(
                            isNumber: true,
                            fieldName: AppString.monthlyPurchase,
                            controller: model.purchaseController,
                          ),
                          if (model.mPValidationText.isNotEmpty)
                            validationText(model.mPValidationText),
                          20.0.giveHeight,
                          NameTextField(
                            isNumber: true,
                            fieldName: AppString.averagePurchaseTicket,
                            controller: model.averageTicketController,
                          ),
                          if (model.aPValidationText.isNotEmpty)
                            validationText(model.aPValidationText),
                          20.0.giveHeight,
                          Text(AppString.visitFrequency),
                          15.0.giveHeight,
                          Container(
                            decoration: AppBoxDecoration.borderDecoration,
                            height: 45.0,
                            child: ButtonTheme(
                              alignedDropdown: true,
                              padding: AppPaddings.zero,
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<VisitFrequentListModel>(
                                  hint: Text(
                                    AppString.visitFrequency,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFFa5a5a5),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  elevation: 0,
                                  isDense: false,
                                  isExpanded: true,
                                  value: model.visitFrequency,
                                  icon: const Icon(
                                      Icons.arrow_drop_down_outlined),
                                  items: [
                                    for (var i = 0;
                                        i < model.visitFrequentlyList.length;
                                        i++)
                                      DropdownMenuItem<VisitFrequentListModel>(
                                        value: model.visitFrequentlyList[i],
                                        child: Text(model
                                            .visitFrequentlyList[i].title!),
                                      )
                                  ],
                                  onChanged:
                                      (VisitFrequentListModel? newValue) {
                                    model.changeVisitFrequency(newValue!);
                                  },
                                ),
                              ),
                            ),
                          ),
                          if (model.vFValidationText.isNotEmpty)
                            validationText(model.vFValidationText),
                          20.0.giveHeight,
                          NameTextField(
                            isNumber: true,
                            fieldName: AppString.requestedAmount,
                            controller: model.amountController,
                          ),
                          if (model.rAValidationText.isNotEmpty)
                            validationText(model.rAValidationText),
                          30.0.giveHeight,
                          SubmitButton(
                            onPressed: () {
                              model.isNew
                                  ? model.addWholesaler(context)
                                  : model.updateWholesaler(context);
                            },
                            width: 100.0.wp,
                            text: model.submitButton.toUpperCase(),
                            height: 45.0,
                          ),
                          if (!model.isNew) 20.0.giveHeight,
                          if (!model.isNew)
                            SubmitButton(
                              onPressed: () {
                                model.removeCreditLineInformation(context);
                              },
                              width: 100.0.wp,
                              color: AppColors.statusReject,
                              text: AppString.remove.toUpperCase(),
                              height: 45.0,
                            ),
                          40.0.giveHeight,
                        ],
                      ),
                    ),
                  ),
                ),
        );
      },
    );
  }
}
