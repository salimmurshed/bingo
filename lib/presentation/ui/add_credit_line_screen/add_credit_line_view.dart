import 'dart:io';

import 'package:bingo_wholesale/const/all_const.dart';
import 'package:bingo_wholesale/const/app_bar_titles.dart';
import 'package:bingo_wholesale/const/app_extensions/sizes.dart';
import 'package:bingo_wholesale/presentation/widgets/text_fields/name_text_field.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/dialog/mult_select_dialog.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:stacked/stacked.dart';

import '../../../const/app_colors.dart';
import '../../../const/app_sizes/app_sizes.dart';
import '../../../const/app_strings.dart';
import '../../../const/app_styles/app_box_decoration.dart';
import '../../../const/app_styles/app_text_styles.dart';
import '../../../const/utils.dart';
import '../../../data/data_source/visit_frequently_list.dart';
import '../../../data_models/models/component_models/fie_list_creditline_request_model.dart';
import '../../widgets/buttons/submit_button.dart';
import '../../widgets/cards/files_viewer_body.dart';
import '../../widgets/cards/loader/loader.dart';
import 'add_credit_line_view_model.dart';

part '../../features_parts/request_credit_lint_parts/question_answer_part.dart';
part '../../features_parts/request_credit_lint_parts/multiple_search_selection_part.dart';
part '../../features_parts/request_credit_lint_parts/image_credit_line_parts.dart';

class AddCreditLineView extends StatelessWidget {
  const AddCreditLineView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddCreditLineViewModel>.reactive(
      onModelReady: (AddCreditLineViewModel model) {
        if (ModalRoute.of(context)!.settings.arguments != null) {
          model
              .setDetails(ModalRoute.of(context)!.settings.arguments as String);
        }
      },
      viewModelBuilder: () => AddCreditLineViewModel(),
      builder: (context, model, child) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.appBarColorRetailer,
              title: model.isView
                  ? Text(AppBarTitles.creditLineInformation)
                  : Text(AppBarTitles.creditLineRequest),
            ),
            body: model.isBusy
                ? const LoaderWidget()
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: AppPaddings.cardBody,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              commonText(AppString.creditLineInformation),
                              10.0.giveHeight,
                              if (model.isView)
                                Container(
                                  padding:
                                      AppPaddings.screenARDSWidgetInnerPadding,
                                  decoration: AppBoxDecoration.shadowBox,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      commonText(model
                                          .retailerCreditLineReqDetails
                                          .data!
                                          .wholesalerName!),
                                      18.0.giveHeight,
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 50.0.wp,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                getNiceText(
                                                    "${AppString.currency}:"
                                                    "${model.retailerCreditLineReqDetails.data!.currency!}",
                                                    nxtln: true),
                                                12.0.giveHeight,
                                                getNiceText(
                                                    "${AppString.averagePurchaseTicket}:"
                                                    "${model.retailerCreditLineReqDetails.data!.averagePurchaseTickets!}",
                                                    nxtln: true),
                                                12.0.giveHeight,
                                                getNiceText(
                                                    "${AppString.requestedAmount}:"
                                                    "${model.retailerCreditLineReqDetails.data!.requestedAmount!}",
                                                    nxtln: true),
                                              ],
                                            ),
                                          ),
                                          12.0.giveHeight,
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              getNiceText(
                                                  "${AppString.monthlyPurchase}:"
                                                  "${model.retailerCreditLineReqDetails.data!.monthlyPurchase}",
                                                  nxtln: true),
                                              12.0.giveHeight,
                                              getNiceText(
                                                  "${AppString.visitFrequency}:"
                                                  "${AppList.checkVisiteFrequency(model.retailerCreditLineReqDetails.data!.visitFrequency!)}",
                                                  nxtln: true),
                                              12.0.giveHeight,
                                              getNiceText(
                                                  "${AppString.fie}"
                                                  "${model.retailerCreditLineReqDetails.data!.fieName!}",
                                                  nxtln: true),
                                            ],
                                          ),
                                          12.0.giveHeight,
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              if (!model.isView)
                                for (var i = 0;
                                    i < model.creditLineInformation.length;
                                    i++)
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          if (!model.isView) {
                                            model.gotoUpdateWholesalerScreen(i);
                                          }
                                        },
                                        child: Container(
                                          padding: AppPaddings
                                              .screenARDSWidgetInnerPadding,
                                          decoration:
                                              AppBoxDecoration.shadowBox,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              commonText(model
                                                  .creditLineInformation[i]
                                                  .wholesaler!
                                                  .wholesalerName!),
                                              18.0.giveHeight,
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    width: 50.0.wp,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        getNiceText(
                                                            "${AppString.currency}:"
                                                            "${model.creditLineInformation[i].currency!}",
                                                            nxtln: true),
                                                        12.0.giveHeight,
                                                        getNiceText(
                                                            "${AppString.averagePurchaseTicket}:"
                                                            "${model.creditLineInformation[i].averageTicket!}",
                                                            nxtln: true),
                                                        12.0.giveHeight,
                                                        getNiceText(
                                                            "${AppString.requestedAmount}:"
                                                            "${model.creditLineInformation[i].amount!}",
                                                            nxtln: true),
                                                      ],
                                                    ),
                                                  ),
                                                  12.0.giveHeight,
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      getNiceText(
                                                          "${AppString.monthlyPurchase}:"
                                                          "${model.creditLineInformation[i].monthlyPurchase}",
                                                          nxtln: true),
                                                      12.0.giveHeight,
                                                      getNiceText(
                                                          "${AppString.visitFrequency}:"
                                                          "${model.creditLineInformation[i].visitFrequency!.title!}",
                                                          nxtln: true),
                                                    ],
                                                  ),
                                                  12.0.giveHeight,
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      10.0.giveHeight,
                                    ],
                                  ),
                              validationText(
                                  model.creditLineInformationErrorMessage),
                              10.0.giveHeight,
                              if (!model.isView)
                                model.allWholesalers.data![0].wholesalerData!
                                        .isEmpty
                                    ? Center(
                                        child: Padding(
                                          padding:
                                              EdgeInsets.only(bottom: 10.0),
                                          child: Text(
                                            AppString.noWholesaler,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      )
                                    : Align(
                                        alignment: Alignment.centerRight,
                                        child: SubmitButton(
                                          onPressed:
                                              model.gotoAddWholesalerScreen,
                                          width: 100.0,
                                          text: AppString.addNewWholesaler,
                                        ),
                                      ),
                              10.0.giveHeight,
                              Container(
                                padding:
                                    AppPaddings.screenARDSWidgetInnerPadding,
                                decoration: AppBoxDecoration.shadowBox,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    20.0.giveHeight,
                                    NameTextField(
                                      enable: !model.isView,
                                      readOnly: model.isView,
                                      controller: model.crn1Controller,
                                      fieldName: AppString.crn1TextField,
                                    ),
                                    validationText(model.crn1ErrorMessage),
                                    // 20.0.giveHeight,
                                    NameTextField(
                                      enable: !model.isView,
                                      readOnly: model.isView,
                                      controller: model.crn2Controller,
                                      fieldName: AppString.crn2TextField,
                                    ),
                                    20.0.giveHeight,
                                    NameTextField(
                                      enable: !model.isView,
                                      readOnly: model.isView,
                                      controller: model.crn3Controller,
                                      fieldName: AppString.crn3TextField,
                                    ),
                                    20.0.giveHeight,
                                    NameTextField(
                                      enable: !model.isView,
                                      isNumber: true,
                                      readOnly: model.isView,
                                      controller: model.crp1Controller,
                                      fieldName: AppString.crp1TextField,
                                    ),
                                    validationText(model.crp1ErrorMessage),
                                    // 20.0.giveHeight,
                                    NameTextField(
                                      enable: !model.isView,
                                      isNumber: true,
                                      readOnly: model.isView,
                                      controller: model.crp2Controller,
                                      fieldName: AppString.crp2TextField,
                                    ),
                                    20.0.giveHeight,
                                    NameTextField(
                                      enable: !model.isView,
                                      isNumber: true,
                                      readOnly: model.isView,
                                      controller: model.crp3Controller,
                                      fieldName: AppString.crp3TextField,
                                    ),
                                    20.0.giveHeight,
                                    if (!model.isView)
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          MultipleSearchSelectionPart(model),
                                          validationText(
                                              model.fileListErrorMessage),
                                          10.0.giveHeight,
                                          Divider(),
                                          10.0.giveHeight,
                                          Text(
                                            AppString.uploadFie,
                                            style: AppTextStyles.successStyle,
                                          ),
                                          10.0.giveHeight,
                                          SubmitButton(
                                            onPressed: model.pickFiles,
                                            width: 100.0,
                                            text: AppString.chooseFiles,
                                          ),
                                          validationText(
                                              model.filesErrorMessage),
                                          10.0.giveHeight,
                                          FilesViewerBody(model.files),
                                          10.0.giveHeight,
                                          Divider(),
                                          10.0.giveHeight,
                                          Text(
                                            AppString.chooseOptions,
                                            style: AppTextStyles.successStyle,
                                          ),
                                          10.0.giveHeight,
                                          10.0.giveHeight,
                                          submitButton(
                                              AppString.bingoCanForwardRequest,
                                              model.selectedOption,
                                              1,
                                              model.changeSelectedOption),
                                          20.0.giveHeight,
                                          submitButton(
                                              AppString.specificFIA,
                                              model.selectedOption,
                                              0,
                                              model.changeSelectedOption),
                                          validationText(
                                              model.selectedOptionErrorMessage),
                                          if (model.selectedOption == 0)
                                            20.0.giveHeight,
                                          if (model.selectedOption == 0)
                                            Container(
                                              decoration: AppBoxDecoration
                                                  .borderDecoration,
                                              height: 50.0,
                                              child: ButtonTheme(
                                                alignedDropdown: true,
                                                padding: AppPaddings.zero,
                                                child:
                                                    DropdownButtonHideUnderline(
                                                  child: DropdownButton<
                                                      FieCreditLineRequestData>(
                                                    hint: Text(
                                                      AppString.selectFie,
                                                      style: const TextStyle(
                                                        fontSize: 12,
                                                        color:
                                                            Color(0xFFa5a5a5),
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    itemHeight: 50.0,
                                                    elevation: 8,
                                                    isDense: false,
                                                    isExpanded: true,
                                                    value: model.selectedFie,
                                                    icon: const Icon(Icons
                                                        .arrow_drop_down_outlined),
                                                    items: [
                                                      for (var i = 0;
                                                          i <
                                                              model
                                                                  .allFieCreditLine
                                                                  .length;
                                                          i++)
                                                        DropdownMenuItem<
                                                            FieCreditLineRequestData>(
                                                          value: model
                                                              .allFieCreditLine[i],
                                                          child: Text(model
                                                              .allFieCreditLine[
                                                                  i]
                                                              .bpName!),
                                                        )
                                                    ],
                                                    onChanged:
                                                        (FieCreditLineRequestData?
                                                            newValue) {
                                                      model.changeSingleFie(
                                                          newValue!);
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                          10.0.giveHeight,
                                          Divider(),
                                          10.0.giveHeight,
                                          GestureDetector(
                                            onTap:
                                                model.changeAcceptTermCondition,
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                model.acceptTermCondition
                                                    ? const Icon(
                                                        Icons.check_box,
                                                        color: AppColors
                                                            .checkBoxSelected,
                                                      )
                                                    : const Icon(
                                                        Icons
                                                            .check_box_outline_blank,
                                                        color:
                                                            AppColors.checkBox,
                                                      ),
                                                10.0.giveWidth,
                                                Flexible(
                                                  child: Text(AppString
                                                      .acceptTermAndConditions),
                                                ),
                                              ],
                                            ),
                                          ),
                                          validationText(model
                                              .acceptTermConditionErrorMessage),
                                          50.0.giveHeight,
                                          if (model.allWholesalers.data![0]
                                              .wholesalerData!.isNotEmpty)
                                            model.isButtonBusy
                                                ? const Center(
                                                    child: SizedBox(
                                                      height: 16.0,
                                                      width: 16.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        color:
                                                            AppColors.loader1,
                                                      ),
                                                    ),
                                                  )
                                                : SubmitButton(
                                                    onPressed: () {
                                                      model.addCreditLine(
                                                          context);
                                                    },
                                                    width: 100.0.wp,
                                                    height: 45.0,
                                                    text: AppString
                                                        .createCreditLineRequest,
                                                  ),
                                        ],
                                      ),
                                    37.0.giveHeight,
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        if (model.isView)
                          Padding(
                            padding: AppPaddings.cardBodyHorizontal,
                            child: Container(
                              padding: AppPaddings.screenARDSWidgetInnerPadding,
                              decoration: AppBoxDecoration.shadowBox,
                              child: ImageCreditLineParts(model),
                            ),
                          ),
                        20.0.giveHeight,
                        if (model.isView)
                          Padding(
                            padding: AppPaddings.cardBodyHorizontal,
                            child: Container(
                              padding: AppPaddings.screenARDSWidgetInnerPadding,
                              decoration: AppBoxDecoration.shadowBox,
                              child: QuestionAnswerPart(model),
                            ),
                          ),
                      ],
                    ),
                  ),
          ),
        );
      },
    );
  }

  submitButton(
    String text,
    int selected,
    int index,
    void Function(int) changeSelectedOption,
  ) {
    return GestureDetector(
      onTap: () {
        changeSelectedOption(index);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          selected == index
              ? const Icon(
                  Icons.circle,
                  color: AppColors.checkBoxSelected,
                )
              : const Icon(
                  Icons.circle_outlined,
                  color: AppColors.checkBox,
                ),
          10.0.giveWidth,
          Flexible(
            child: Text(text),
          ),
        ],
      ),
    );
  }
}
