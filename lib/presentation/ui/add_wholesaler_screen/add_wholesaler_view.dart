import 'package:bingo_wholesale/const/all_const.dart';import 'package:bingo_wholesale/const/app_bar_titles.dart';import 'package:bingo_wholesale/data_models/construction_model/wholesaler_data.dart';import 'package:bingo_wholesale/presentation/widgets/buttons/submit_button.dart';import 'package:flutter/cupertino.dart';import 'package:flutter/material.dart';import 'package:stacked/stacked.dart';import '../../../const/app_colors.dart';import '../../../const/app_sizes/app_sizes.dart';import '../../../const/app_strings.dart';import '../../../const/app_styles/app_box_decoration.dart';import '../../widgets/dropdowns/selected_dropdown_field.dart';import '../../widgets/text_fields/name_text_field.dart';import 'add_wholesaler_view_model.dart';class AddWholesalerView extends StatelessWidget {  const AddWholesalerView({super.key});  @override  Widget build(BuildContext context) {    return ViewModelBuilder<AddWholesalerViewModel>.reactive(        onModelReady: (AddWholesalerViewModel model) {          if (ModalRoute.of(context)!.settings.arguments != null) {            model.setDetails(                ModalRoute.of(context)!.settings.arguments as WholesalerData);          }        },        viewModelBuilder: () => AddWholesalerViewModel(),        builder: (context, model, child) {          return Scaffold(            appBar: AppBar(              backgroundColor: AppColors.appBarColorRetailer,              title: Text(AppBarTitles.addWholesaler),            ),            body: SingleChildScrollView(              child: Container(                margin: AppMargins.cardBody,                padding: AppPaddings.screenARDSWidgetInnerPadding,                decoration: AppBoxDecoration.shadowBox,                child: Column(                  mainAxisSize: MainAxisSize.min,                  crossAxisAlignment: CrossAxisAlignment.start,                  children: [                    SelectedDropdownField(                      onChange: (String value) {                        model.changeSelectWholesaler(value);                      },                      dropdownValue: model.selectWholesaler,                      // hintText: AppString.selectWholesaler,                      fieldName: AppString.selectWholesaler,                      withHint: false,                      items: [AppString.selectWholesaler, 'a', 'b', 'c', 's'],                    ),                    20.0.giveHeight,                    SelectedDropdownField(                      onChange: (String value) {                        model.changeSelectCurrency(value);                      },                      dropdownValue: model.selectCurrency,                      hintText: AppString.selectCurrency,                      fieldName: AppString.selectCurrency,                      items: [AppString.selectCurrency, 'a', 'b', 'c', 's'],                    ),                    20.0.giveHeight,                    NameTextField(                      fieldName: AppString.monthlyPurchase,                      controller: model.purchaseController,                    ),                    20.0.giveHeight,                    NameTextField(                      fieldName: AppString.averagePurchaseTicket,                      controller: model.averageTicketController,                    ),                    20.0.giveHeight,                    SelectedDropdownField(                      onChange: (String value) {                        model.changeVisitFrequency(value);                      },                      dropdownValue: model.visitFrequency,                      hintText: AppString.visitFrequency,                      fieldName: AppString.visitFrequency,                      items: [AppString.visitFrequency, 'a', 'b', 'c', 's'],                    ),                    20.0.giveHeight,                    NameTextField(                      fieldName: AppString.requestedAmount,                      controller: model.amountController,                    ),                    30.0.giveHeight,                    SubmitButton(                      onPressed: model.isNew                          ? model.addWholesaler                          : model.updateWholesaler,                      width: 100.0.wp,                      text: model.submitButton.toUpperCase(),                      height: 45.0,                    ),                    if (!model.isNew) 20.0.giveHeight,                    if (!model.isNew)                      SubmitButton(                        onPressed: model.removeCreditLineInformation,                        width: 100.0.wp,                        color: AppColors.statusReject,                        text: AppString.remove.toUpperCase(),                        height: 45.0,                      ),                    40.0.giveHeight,                  ],                ),              ),            ),          );        });  }}