import 'package:bingo_wholesale/const/all_const.dart';import 'package:bingo_wholesale/presentation/ui/home_screen/home_screen_view.dart';import 'package:flutter/cupertino.dart';import 'package:flutter/material.dart';import 'package:stacked/stacked.dart';import 'dashboard_screen_view_model.dart';class DashboardScreenView extends StatelessWidget {  @override  Widget build(BuildContext context) {    return ViewModelBuilder<DashboardScreenViewModel>.reactive(      viewModelBuilder: () => DashboardScreenViewModel(),      builder: (context, model, child) {        return DefaultTabController(          initialIndex: 0,          length: model.numberOfTabs,          child: Builder(            builder: (context) {              return Scaffold(                floatingActionButtonLocation:                    FloatingActionButtonLocation.centerDocked,                floatingActionButton: FloatingActionButton(                  onPressed: () {                    model.onChangedTab(context, 2);                  },                  child: Icon(                    Icons.add,                    size: 40.0,                    color: AppColors.fontWhite,                  ),                  elevation: 2.0,                ),                body: TabBarView(                  physics: NeverScrollableScrollPhysics(),                  children: <Widget>[                    HomeScreenView(),                    Container(                      color: Colors.green,                    ),                    Container(                      color: Colors.yellow,                    ),                    Container(                      color: Colors.blue,                    ),                    Container(                      color: Colors.purple,                    ),                  ],                ),                bottomNavigationBar: BottomAppBar(                  notchMargin: 0.0,                  shape: CircularNotchedRectangle(),                  child: Padding(                    padding: const EdgeInsets.symmetric(horizontal: 12.0),                    child: Row(                      mainAxisAlignment: MainAxisAlignment.spaceBetween,                      children: <Widget>[                        IconButton(                            icon: Image.asset(                              AppAsset.navDashboardIcon,                              color: model.selectedNumber == 0                                  ? AppColors.navBarActiveColor                                  : AppColors.navBarInactiveColor,                              height: model.iconHeight,                            ),                            onPressed: () {                              model.onChangedTab(context, 0);                            }),                        IconButton(                            icon: Image.asset(                              AppAsset.navStatIcon,                              color: model.selectedNumber == 1                                  ? AppColors.navBarActiveColor                                  : AppColors.navBarInactiveColor,                              height: model.iconHeight,                            ),                            onPressed: () {                              model.onChangedTab(context, 1);                            }),                        const SizedBox(width: 40), // The dummy child                        IconButton(                            icon: Image.asset(                              AppAsset.navOrder,                              color: model.selectedNumber == 3                                  ? AppColors.navBarActiveColor                                  : AppColors.navBarInactiveColor,                              height: model.iconHeight,                            ),                            onPressed: () {                              model.onChangedTab(context, 3);                            }),                        IconButton(                            icon: Image.asset(                              AppAsset.navBellIcon,                              color: model.selectedNumber == 4                                  ? AppColors.navBarActiveColor                                  : AppColors.navBarInactiveColor,                              height: model.iconHeight,                            ),                            onPressed: () {                              model.onChangedTab(context, 4);                            }),                      ],                    ),                  ),                ),              );            },          ),        );      },    );  }}