import 'package:bingo_wholesale/const/all_const.dart';
import 'package:bingo_wholesale/const/app_bar_titles.dart';
import 'package:bingo_wholesale/const/app_sizes/app_sizes.dart';
import 'package:bingo_wholesale/const/app_styles/app_box_decoration.dart';
import 'package:bingo_wholesale/const/utils.dart';
import 'package:bingo_wholesale/presentation/widgets/buttons/submit_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/buttons/cancel_button.dart';
import 'add_association_request_screen_view_model.dart';

class AddAssociationRequestView extends StatelessWidget {
  const AddAssociationRequestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddAssociationRequestViewModel>.reactive(
      viewModelBuilder: () => AddAssociationRequestViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: model.isRetailer
                ? AppColors.appBarColorRetailer
                : AppColors.appBarColorWholesaler,
            title: Text(
              AppBarTitles.addRequest,
            ),
          ),
          body: DefaultTabController(
            initialIndex: 0,
            length: 2,
            child: Column(
              children: [
                Padding(
                  padding: AppPaddings.associationRequestTabBarWidgetV,
                  child: Container(
                    padding: AppPaddings.zero,
                    margin: AppPaddings.zero,
                    width: 320,
                    decoration: AppBoxDecoration.tabBarShadowDecoration,
                    child: TabBar(
                      indicatorWeight: 0.1,
                      indicatorColor: AppColors.transparent,
                      padding: AppPaddings.zero,
                      labelPadding: AppPaddings.zero,
                      isScrollable: false,
                      indicatorPadding: AppPaddings.zero,
                      onTap: (int i) {
                        model.changeTabBar(i);
                      },
                      tabs: [
                        tabBarThisClass(
                          AppString.wholesaler,
                          model.wholeSalerOrFia,
                          0,
                        ),
                        tabBarThisClass(
                          AppString.financialInstitution,
                          model.wholeSalerOrFia,
                          1,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    dragStartBehavior: DragStartBehavior.down,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      wholesalerTab(model),
                      financialInstitution(model),
                    ],
                  ),
                ),
                15.0.giveHeight,
                Padding(
                  padding: AppPaddings.associationRequestButtonsWidgetV,
                  child: model.isAddRequestBusy
                      ? CircularProgressIndicator(
                          color: AppColors.loader1,
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CancelButton(
                              onPressed: model.cancelButtonPressed,
                              active: true,
                              text: AppString.cancelButton.toUpperCase(),
                              height: 45,
                              width: 165,
                            ),
                            SubmitButton(
                              onPressed: model.wholeSalerOrFia == 0
                                  ? model.sendWholesalerRequest
                                  : model.sendFiaRequest,
                              active: true,
                              text: AppString.submitButton.toUpperCase(),
                              height: 45,
                              width: 165,
                            ),
                          ],
                        ),
                ),
                40.0.giveHeight,
              ],
            ),
          ),
        );
      },
    );
  }

  financialInstitution(AddAssociationRequestViewModel model) {
    return SingleChildScrollView(
      child: Padding(
        padding: AppPaddings.associationRequestTabBarView,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: AppPaddings.associationRequestTabBarView,
              child: const Text(
                AppString.selectMultipleFia,
                style: AppTextStyles.addRequestHeader,
              ),
            ),
            for (var i = 0; i < model.fiaList.length; i++)
              InkWell(
                onTap: () {
                  model.addRemoveFia(i);
                },
                child: Card(
                  elevation: 2,
                  child: Padding(
                    padding: AppPaddings.associationRequestTabBarViewListCard,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        model.selectedFia.contains(model.fiaList[i].uniqueId)
                            ? const Icon(
                                Icons.check_box_outlined,
                                color: AppColors.checkBoxColor,
                              )
                            : const Icon(
                                Icons.check_box_outline_blank,
                                color: AppColors.checkBoxColor,
                              ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 60.0.wp,
                              child: Text(
                                model.fiaList[i].name!,
                                style: AppTextStyles.addRequestHeader,
                              ),
                            ),
                            SizedBox(
                              width: 60.0.wp,
                              child: Text(
                                model.fiaList[i].uniqueId!,
                                style: AppTextStyles.addRequestSubTitle,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            20.0.giveHeight,
            endOfData(),
            20.0.giveHeight,
          ],
        ),
      ),
    );
  }

  wholesalerTab(AddAssociationRequestViewModel model) {
    return SingleChildScrollView(
      child: Padding(
        padding: AppPaddings.associationRequestTabBarView,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: AppPaddings.associationRequestTabBarView,
              child: const Text(
                AppString.selectMultipleWholesaler,
                style: AppTextStyles.addRequestHeader,
              ),
            ),
            Column(
              children: [
                for (var i = 0; i < model.wholeSaleList.length; i++)
                  InkWell(
                    onTap: () {
                      model.addRemoveWholesaler(i);
                    },
                    child: Card(
                      elevation: 2,
                      child: Padding(
                        padding:
                            AppPaddings.associationRequestTabBarViewListCard,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            model.selectedWholeSaler
                                    .contains(model.wholeSaleList[i].uniqueId)
                                ? const Icon(
                                    Icons.check_box_outlined,
                                    color: AppColors.checkBoxColor,
                                  )
                                : const Icon(
                                    Icons.check_box_outline_blank,
                                    color: AppColors.checkBoxColor,
                                  ),
                            const SizedBox(
                              width: 20.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 60.0.wp,
                                  child: Text(
                                    model.wholeSaleList[i].name!,
                                    style: AppTextStyles.addRequestHeader,
                                  ),
                                ),
                                SizedBox(
                                  width: 60.0.wp,
                                  child: Text(
                                    model.wholeSaleList[i].uniqueId!,
                                    style: AppTextStyles.addRequestSubTitle,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                20.0.giveHeight,
                endOfData(),
              ],
            ),
            20.0.giveHeight,
          ],
        ),
      ),
    );
  }

  tabBarThisClass(String text, int selectedIndex, int widgetNumber) {
    return Container(
      width: 160.0,
      height: 40.0,
      padding: AppPaddings.zero,
      margin: AppPaddings.zero,
      decoration: BoxDecoration(
        borderRadius: selectedIndex == 0
            ? AppRadius.associationReqtabL
            : AppRadius.associationReqtabR,
        color: selectedIndex == widgetNumber
            ? AppColors.appBarColor
            : AppColors.transparent,
      ),
      child: Center(
        child: Text(
          text,
          style: selectedIndex == widgetNumber
              ? AppTextStyles.addRequestTabBar
              : AppTextStyles.addRequestTabBar
                  .copyWith(color: AppColors.blackColor),
        ),
      ),
    );
  }
}
