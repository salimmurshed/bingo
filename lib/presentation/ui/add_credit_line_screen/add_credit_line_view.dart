import 'package:bingo_wholesale/const/app_bar_titles.dart';import 'package:bingo_wholesale/const/app_extensions/sizes.dart';import 'package:bingo_wholesale/presentation/widgets/text_fields/name_text_field.dart';import 'package:flutter/material.dart';import 'package:multiple_search_selection/multiple_search_selection.dart';import 'package:stacked/stacked.dart';import '../../../const/app_colors.dart';import '../../../const/app_sizes/app_sizes.dart';import '../../../const/app_strings.dart';import '../../../const/app_styles/app_box_decoration.dart';import '../../../const/app_styles/app_text_styles.dart';import '../../../const/utils.dart';import '../../../data_models/models/component_models/fie_list_creditline_request_model.dart';import '../../widgets/buttons/submit_button.dart';import '../../widgets/cards/loader/loader.dart';import 'add_credit_line_view_model.dart';class AddCreditLineView extends StatelessWidget {  const AddCreditLineView({super.key});  @override  Widget build(BuildContext context) {    return ViewModelBuilder<AddCreditLineViewModel>.reactive(        onModelReady: (AddCreditLineViewModel model) {          if (ModalRoute.of(context)!.settings.arguments != null) {            model.setDetails(                ModalRoute.of(context)!.settings.arguments as String);          }        },        viewModelBuilder: () => AddCreditLineViewModel(),        builder: (context, model, child) {          return Scaffold(            appBar: AppBar(              backgroundColor: AppColors.appBarColorRetailer,              title: Text(AppBarTitles.creditLineInformation),            ),            body: model.isBusy                ? LoaderWidget()                : SingleChildScrollView(                    child: Container(                      padding: AppPaddings.cardBody,                      child: Column(                        crossAxisAlignment: CrossAxisAlignment.start,                        children: [                          commonText('Credit Line Information'),                          10.0.giveHeight,                          for (var i = 0;                              i < model.creditLineInformation.length;                              i++)                            Column(                              crossAxisAlignment: CrossAxisAlignment.start,                              children: [                                GestureDetector(                                  onTap: () {                                    model.gotoUpdateWholesalerScreen(i);                                  },                                  child: Container(                                    padding: AppPaddings                                        .screenARDSWidgetInnerPadding,                                    decoration: AppBoxDecoration.shadowBox,                                    child: Column(                                      crossAxisAlignment:                                          CrossAxisAlignment.start,                                      mainAxisAlignment:                                          MainAxisAlignment.start,                                      children: [                                        commonText(model                                            .creditLineInformation[i]                                            .wholesaler!),                                        18.0.giveHeight,                                        Row(                                          crossAxisAlignment:                                              CrossAxisAlignment.start,                                          children: [                                            SizedBox(                                              width: 50.0.wp,                                              child: Column(                                                crossAxisAlignment:                                                    CrossAxisAlignment.start,                                                mainAxisAlignment:                                                    MainAxisAlignment.start,                                                children: [                                                  getNiceText(                                                      "Currency:${model.creditLineInformation[i].currency!}",                                                      nxtln: true),                                                  12.0.giveHeight,                                                  getNiceText(                                                      "Average Purchase Ticket:${model.creditLineInformation[i].averageTicket!}",                                                      nxtln: true),                                                  12.0.giveHeight,                                                  getNiceText(                                                      "Requested Amount:${model.creditLineInformation[i].amount!}",                                                      nxtln: true),                                                ],                                              ),                                            ),                                            12.0.giveHeight,                                            Column(                                              crossAxisAlignment:                                                  CrossAxisAlignment.start,                                              mainAxisAlignment:                                                  MainAxisAlignment.start,                                              children: [                                                getNiceText(                                                    "Monthly Purchase:${model.creditLineInformation[i].monthlyPurchase}",                                                    nxtln: true),                                                12.0.giveHeight,                                                getNiceText(                                                    "Visit Frequency:${model.creditLineInformation[i].visitFrequency}",                                                    nxtln: true),                                              ],                                            ),                                            12.0.giveHeight,                                          ],                                        )                                      ],                                    ),                                  ),                                ),                                10.0.giveHeight,                              ],                            ),                          20.0.giveHeight,                          Align(                            alignment: Alignment.centerRight,                            child: SubmitButton(                              onPressed: model.gotoAddWholesalerScreen,                              width: 100.0,                              text: AppString.addNew,                            ),                          ),                          30.0.giveHeight,                          Container(                            padding: AppPaddings.screenARDSWidgetInnerPadding,                            decoration: AppBoxDecoration.shadowBox,                            child: Column(                              crossAxisAlignment: CrossAxisAlignment.start,                              children: [                                20.0.giveHeight,                                NameTextField(                                  controller: model.crn1Controller,                                  fieldName: "Commercial Reference Name 1",                                ),                                20.0.giveHeight,                                NameTextField(                                  controller: model.crn2Controller,                                  fieldName: "Commercial Reference Name 2",                                ),                                20.0.giveHeight,                                NameTextField(                                  controller: model.crn3Controller,                                  fieldName: "Commercial Reference Name 3",                                ),                                20.0.giveHeight,                                NameTextField(                                  controller: model.crp1Controller,                                  fieldName: "Commercial Reference Phone No. 1",                                ),                                20.0.giveHeight,                                NameTextField(                                  controller: model.crp2Controller,                                  fieldName: "Commercial Reference Phone No. 2",                                ),                                20.0.giveHeight,                                NameTextField(                                  controller: model.crp3Controller,                                  fieldName: "Commercial Reference Phone No. 3",                                ),                                20.0.giveHeight,                                // NameTextField(                                //   fieldName:                                //       "Select Financial Institution With Whom "                                //       "You Are Working",                                // ),                                MultipleSearchSelection<                                    FieCreditLineRequestData>(                                  items:                                      model.allFieCreditLine, // List<Country>                                  fieldToCheck: (c) {                                    return c.bpName!; // String                                  },                                  itemBuilder: (item) {                                    return Padding(                                      padding: const EdgeInsets.all(6.0),                                      child: Container(                                        decoration: BoxDecoration(                                          borderRadius:                                              BorderRadius.circular(6),                                          color: Colors.white,                                        ),                                        child: Padding(                                          padding: const EdgeInsets.symmetric(                                            vertical: 20.0,                                            horizontal: 12,                                          ),                                          child: Text(item.bpName!),                                        ),                                      ),                                    );                                  },                                  pickedItemBuilder: (item) {                                    return Container(                                      decoration: BoxDecoration(                                        color: Colors.white,                                        border: Border.all(                                            color: Colors.grey[400]!),                                      ),                                      child: Padding(                                        padding: const EdgeInsets.all(8),                                        child: Text(item.bpName!),                                      ),                                    );                                  },                                  onTapShowedItem: () {},                                  onPickedChange: (items) {},                                  onItemAdded: (item) {},                                  onItemRemoved: (item) {},                                  sortShowedItems: true,                                  sortPickedItems: true,                                  fuzzySearch: FuzzySearch.jaro,                                  itemsVisibility:                                      ShowedItemsVisibility.alwaysOn,                                  title: Padding(                                    padding: const EdgeInsets.only(top: 12.0),                                    child: Text(                                      "Select Financial Institution With Whom "                                      "You Are Working",                                    ),                                  ),                                  showSelectAllButton: true,                                  maximumShowItemsHeight: 200,                                ),                                20.0.giveHeight,                                Text(                                  'Upload Financial Statements',                                  style: AppTextStyles.successStyle,                                ),                                10.0.giveHeight,                                SubmitButton(                                  // onPressed: model.gotoAddNewRequest,                                  width: 100.0,                                  text: AppString.chooseFiles,                                ),                                10.0.giveHeight,                                Text(                                  'Choose Options',                                  style: AppTextStyles.successStyle,                                ),                                20.0.giveHeight,                                submitButton(                                    AppString.bingoCanForwardRequest,                                    model.selectedOption,                                    0,                                    model.changeSelectedOption),                                20.0.giveHeight,                                submitButton(                                    AppString.specificFIA,                                    model.selectedOption,                                    1,                                    model.changeSelectedOption),                                20.0.giveHeight,                                GestureDetector(                                  onTap: model.changeAcceptTermCondition,                                  child: Row(                                    crossAxisAlignment:                                        CrossAxisAlignment.start,                                    children: [                                      model.acceptTermCondition                                          ? Icon(                                              Icons.check_box,                                              color: AppColors.checkBoxSelected,                                            )                                          : Icon(                                              Icons.check_box_outline_blank,                                              color: AppColors.checkBox,                                            ),                                      10.0.giveWidth,                                      Flexible(                                        child: Text(                                            AppString.acceptTermAndConditions),                                      ),                                    ],                                  ),                                ),                                50.0.giveHeight,                                SubmitButton(                                  width: 100.0.wp,                                  height: 45.0,                                  text: AppString.createCreditLineRequest,                                ),                                37.0.giveHeight,                              ],                            ),                          )                        ],                      ),                    ),                  ),          );        });  }  submitButton(    String text,    int selected,    int index,    void Function(int) changeSelectedOption,  ) {    return GestureDetector(        onTap: () {          changeSelectedOption(index);        },        child: Row(          crossAxisAlignment: CrossAxisAlignment.start,          children: [            selected == index                ? Icon(                    Icons.circle,                    color: AppColors.checkBoxSelected,                  )                : Icon(                    Icons.circle_outlined,                    color: AppColors.checkBox,                  ),            10.0.giveWidth,            Flexible(              child: Text(text),            ),          ],        ));  }}