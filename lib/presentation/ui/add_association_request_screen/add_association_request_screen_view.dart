import 'package:bingo_wholesale/const/all_const.dart';import 'package:bingo_wholesale/const/app_bar_titles.dart';import 'package:bingo_wholesale/const/app_styles/app_box_decoration.dart';import 'package:bingo_wholesale/const/utils.dart';import 'package:bingo_wholesale/presentation/common_widgets/buttons/submit_button.dart';import 'package:flutter/cupertino.dart';import 'package:flutter/gestures.dart';import 'package:flutter/material.dart';import 'package:stacked/stacked.dart';import '../../../const/app_colors.dart';import '../../common_widgets/buttons/cancel_button.dart';import 'add_association_request_screen_view_model.dart';class AddAssociationRequestScreenView extends StatelessWidget {  @override  Widget build(BuildContext context) {    return ViewModelBuilder<AddAssociationRequestScreenViewModel>.reactive(      viewModelBuilder: () => AddAssociationRequestScreenViewModel(),      builder: (context, model, child) {        return Scaffold(          appBar: AppBar(            backgroundColor: model.isRetailer                ? AppColors.appBarColorRetailer                : AppColors.appBarColorWholesaler,            title: Text(              AppBarTitles.addrequest,            ),          ),          body: DefaultTabController(            initialIndex: 0,            length: 2,            child: Column(              children: [                Padding(                  padding: const EdgeInsets.symmetric(vertical: 20.0),                  child: Container(                    padding: EdgeInsets.zero,                    margin: EdgeInsets.zero,                    width: 320,                    decoration: AppBoxDecoration.tabBarShadowDecoration,                    child: TabBar(                      indicatorWeight: 0.1,                      indicatorColor: AppColors.transparent,                      padding: EdgeInsets.zero,                      labelPadding: EdgeInsets.zero,                      isScrollable: false,                      indicatorPadding: EdgeInsets.zero,                      onTap: (int i) {                        model.changeTabBar(i);                      },                      tabs: [                        tabBarThisClass(                          "Wholesaler",                          model.wholeSalerOrFia,                          0,                        ),                        tabBarThisClass(                          "Financial Institution",                          model.wholeSalerOrFia,                          1,                        ),                      ],                    ),                  ),                ),                Expanded(                  child: TabBarView(                    dragStartBehavior: DragStartBehavior.down,                    physics: const NeverScrollableScrollPhysics(),                    children: [                      wholesalerTab(model),                      financialInstitution(model),                    ],                  ),                ),                15.0.gh,                Padding(                  padding: const EdgeInsets.symmetric(horizontal: 23.0),                  child: Row(                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,                    children: [                      CancelButton(                        onPressed: model.cancelButtonPressed,                        active: true,                        text: AppString.cancelButton,                        height: 45,                        width: 165,                      ),                      SubmitButton(                        onPressed: model.wholeSalerOrFia == 0                            ? model.sendWholesalerRequest                            : model.sendFiaRequest,                        active: true,                        text: AppString.submitButton,                        height: 45,                        width: 165,                      ),                    ],                  ),                ),                40.0.gh,              ],            ),          ),        );      },    );  }  financialInstitution(AddAssociationRequestScreenViewModel model) {    return SingleChildScrollView(      child: Padding(        padding: const EdgeInsets.symmetric(horizontal: 23.0),        child: Column(          crossAxisAlignment: CrossAxisAlignment.start,          children: [            const Padding(              padding: EdgeInsets.only(bottom: 23.0),              child: Text(                AppString.selectMultipleFia,                style: AppTextStyles.addRequestHeader,              ),            ),            for (var i = 0; i < model.fiaList.length; i++)              InkWell(                onTap: () {                  model.addRemoveFia(i);                },                child: Card(                  elevation: 2,                  child: Padding(                    padding: const EdgeInsets.symmetric(                        horizontal: 23.0, vertical: 12.0),                    child: Row(                      crossAxisAlignment: CrossAxisAlignment.start,                      children: [                        model.selectedFia.contains(model.fiaList[i].uniqueId)                            ? const Icon(                                Icons.check_box_outlined,                                color: AppColors.checkBoxColor,                              )                            : const Icon(                                Icons.check_box_outline_blank,                                color: AppColors.checkBoxColor,                              ),                        const SizedBox(                          width: 20.0,                        ),                        Column(                          crossAxisAlignment: CrossAxisAlignment.start,                          children: [                            SizedBox(                              width: 60.0.wp,                              child: Text(                                model.fiaList[i].name!,                                style: AppTextStyles.addRequestHeader,                              ),                            ),                            SizedBox(                              width: 60.0.wp,                              child: Text(                                model.fiaList[i].uniqueId!,                                style: AppTextStyles.addRequestSubTitle,                              ),                            ),                          ],                        ),                      ],                    ),                  ),                ),              ),            20.0.gh,            endOfData(),            20.0.gh,          ],        ),      ),    );  }  wholesalerTab(AddAssociationRequestScreenViewModel model) {    return SingleChildScrollView(      child: Padding(        padding: const EdgeInsets.symmetric(horizontal: 23.0),        child: Column(          crossAxisAlignment: CrossAxisAlignment.start,          children: [            const Padding(              padding: EdgeInsets.only(bottom: 23.0),              child: Text(                AppString.selectMultipleWholesaler,                style: AppTextStyles.addRequestHeader,              ),            ),            Column(              children: [                for (var i = 0; i < model.wholeSaleList.length; i++)                  InkWell(                    onTap: () {                      model.addRemoveWholesaler(i);                    },                    child: Card(                      elevation: 2,                      child: Padding(                        padding: const EdgeInsets.symmetric(                            horizontal: 23.0, vertical: 12.0),                        child: Row(                          crossAxisAlignment: CrossAxisAlignment.start,                          children: [                            model.selectedWholeSaler                                    .contains(model.wholeSaleList[i].uniqueId)                                ? const Icon(                                    Icons.check_box_outlined,                                    color: AppColors.checkBoxColor,                                  )                                : const Icon(                                    Icons.check_box_outline_blank,                                    color: AppColors.checkBoxColor,                                  ),                            const SizedBox(                              width: 20.0,                            ),                            Column(                              crossAxisAlignment: CrossAxisAlignment.start,                              children: [                                SizedBox(                                  width: 60.0.wp,                                  child: Text(                                    model.wholeSaleList[i].name!,                                    style: AppTextStyles.addRequestHeader,                                  ),                                ),                                SizedBox(                                  width: 60.0.wp,                                  child: Text(                                    model.wholeSaleList[i].uniqueId!,                                    style: AppTextStyles.addRequestSubTitle,                                  ),                                ),                              ],                            ),                          ],                        ),                      ),                    ),                  ),                20.0.gh,                endOfData(),              ],            ),            20.0.gh,          ],        ),      ),    );  }  tabBarThisClass(String text, int selectedIndex, int widgetNumber) {    return Container(      width: 160.0,      height: 40.0,      padding: EdgeInsets.zero,      margin: EdgeInsets.zero,      decoration: BoxDecoration(        borderRadius: selectedIndex == 0            ? const BorderRadius.only(                bottomLeft: Radius.circular(50.0),                topLeft: Radius.circular(50.0),              )            : const BorderRadius.only(                bottomRight: Radius.circular(50.0),                topRight: Radius.circular(50.0),              ),        color: selectedIndex == widgetNumber            ? AppColors.appBarColor            : AppColors.transparent,      ),      child: Center(        child: Text(          text,          style: selectedIndex == widgetNumber              ? AppTextStyles.addRequestTabBar              : AppTextStyles.addRequestTabBar                  .copyWith(color: AppColors.fontBlack),        ),      ),    );  }}