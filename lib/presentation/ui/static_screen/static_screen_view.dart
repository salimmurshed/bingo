import 'package:bingo_wholesale/const/all_const.dart';
import 'package:bingo_wholesale/const/app_bar_titles.dart';
import 'package:bingo_wholesale/const/app_extensions/status.dart';
import 'package:bingo_wholesale/presentation/ui/static_screen/static_screen_view_model.dart';
import 'package:bingo_wholesale/presentation/widgets/buttons/tab_bar_button.dart';
import 'package:bingo_wholesale/presentation/widgets/cards/status_card_four_part.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../const/app_colors.dart';
import '../../widgets/cards/sales_status_card.dart';
import '../../widgets/cards/status_card.dart';
import '../../widgets/dropdowns/selected_dropdown.dart';

part '../../features_parts/static tabs_parts/sales_tab.dart';

class StaticView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StaticViewModel>.reactive(
        viewModelBuilder: () => StaticViewModel(),
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.appBarColorWholesaler,
              title: Text(AppBarTitles.sales),
            ),
            body: getViewForIndex(model.currentTabIndex, model),
            bottomNavigationBar: BottomNavigationBar(
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              backgroundColor: AppColors.backgroundSecondary,
              currentIndex: model.currentTabIndex,
              onTap: model.setTabIndex,
              items: [
                BottomNavigationBarItem(
                  label: "",
                  icon: TabBarButton(
                      active: model.currentTabIndex == 0 ? true : false,
                      text: "ORDERS"),
                ),
                BottomNavigationBarItem(
                  label: "",
                  icon: TabBarButton(
                      active: model.currentTabIndex == 1 ? true : false,
                      text: "SALES"),
                ),
                BottomNavigationBarItem(
                  label: "",
                  icon: TabBarButton(
                      active: model.currentTabIndex == 2 ? true : false,
                      text: "CUSTOMERS"),
                ),
              ],
            ),
          );
        });
  }

  Widget getViewForIndex(int index, StaticViewModel model) {
    switch (index) {
      case 0:
        return SizedBox();
      case 1:
        return SalesTab(model);
      case 2:
        return SizedBox();
    }
    return SizedBox();
  }
}
