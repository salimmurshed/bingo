import 'package:bingo_wholesale/const/all_const.dart';
import 'package:bingo_wholesale/const/app_sizes/app_icon_sizes.dart';
import 'package:bingo_wholesale/const/app_sizes/app_sizes.dart';
import 'package:bingo_wholesale/presentation/ui/add_sales/add_sales_view.dart';
import 'package:bingo_wholesale/presentation/ui/home_screen/home_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'bottom_tabs_view_model.dart';

class BottomTabsScreenView extends StatelessWidget {
  const BottomTabsScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BottomTabsScreenViewModel>.reactive(
      viewModelBuilder: () => BottomTabsScreenViewModel(),
      builder: (context, model, child) {
        return DefaultTabController(
          initialIndex: 0,
          length: model.numberOfTabs,
          child: Builder(
            builder: (context) {
              return WillPopScope(
                onWillPop: () => model.showExitPopup(context),
                child: Scaffold(
                  floatingActionButtonLocation:
                      FloatingActionButtonLocation.centerDocked,
                  floatingActionButton: FloatingActionButton(
                    onPressed: () {
                      model.onChangedTab(context, 2);
                    },
                    elevation: 2.0,
                    child: Icon(
                      Icons.add,
                      size: AppIconSizes.s40,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  body: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: <Widget>[
                      const HomeScreenView(),
                      Container(
                        color: Colors.green,
                      ),
                      AddSalesView(),
                      Container(
                        color: Colors.blue,
                      ),
                      Container(
                        color: Colors.purple,
                      ),
                    ],
                  ),
                  bottomNavigationBar: BottomAppBar(
                    notchMargin: 0.0,
                    shape: const CircularNotchedRectangle(),
                    child: Padding(
                      padding: AppPaddings.bottomTabBarH,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          IconButton(
                              icon: Image.asset(
                                AppAsset.navDashboardIcon,
                                color: model.selectedNumber == 0
                                    ? AppColors.navBarActiveColor
                                    : AppColors.navBarInactiveColor,
                                height: model.iconHeight,
                              ),
                              onPressed: () {
                                model.onChangedTab(context, 0);
                              }),
                          IconButton(
                              icon: Image.asset(
                                AppAsset.navStatIcon,
                                color: model.selectedNumber == 1
                                    ? AppColors.navBarActiveColor
                                    : AppColors.navBarInactiveColor,
                                height: model.iconHeight,
                              ),
                              onPressed: () {
                                model.onChangedTab(context, 1);
                              }),
                          40.0.giveWidth,
                          IconButton(
                              icon: Image.asset(
                                AppAsset.navOrder,
                                color: model.selectedNumber == 3
                                    ? AppColors.navBarActiveColor
                                    : AppColors.navBarInactiveColor,
                                height: model.iconHeight,
                              ),
                              onPressed: () {
                                model.onChangedTab(context, 3);
                              }),
                          IconButton(
                              icon: Image.asset(
                                AppAsset.navBellIcon,
                                color: model.selectedNumber == 4
                                    ? AppColors.navBarActiveColor
                                    : AppColors.navBarInactiveColor,
                                height: model.iconHeight,
                              ),
                              onPressed: () {
                                model.onChangedTab(context, 4);
                              }),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
