part of '../../../ui/home_screen/home_screen_view.dart';class RetailerDashboardRequestSettingTabPart extends StatelessWidget {  HomeScreenViewModel model;  RetailerDashboardRequestSettingTabPart(this.model);  @override  Widget build(BuildContext context) {    return Padding(      padding: const EdgeInsets.symmetric(horizontal: 12.0),      child: Container(        color: AppColors.background,        width: 100.0.wp - 24.0,        height: 10.0.hp,        child: Padding(          padding: const EdgeInsets.only(bottom: 20.0),          child: SingleChildScrollView(            scrollDirection: Axis.horizontal,            child: Row(              children: [                SubmitButton(                  active: model.secondaryBottomTab == 0 ? true : false,                  onPressed: () {                    model.changeSecondaryBottomTab(0);                  },                  width: 114.0,                  height: 30.0,                  text: AppString.dashBoard.toUpperCase(),                ),                SubmitButton(                  active: model.secondaryBottomTab == 1 ? true : false,                  onPressed: () {                    model.changeSecondaryBottomTab(1);                  },                  width: 114.0,                  height: 30.0,                  text: AppString.requests.toUpperCase(),                ),                SubmitButton(                  active: model.secondaryBottomTab == 2 ? true : false,                  onPressed: () {                    model.changeSecondaryBottomTab(2);                  },                  width: 114.0,                  height: 30.0,                  text: AppString.settings.toUpperCase(),                ),                SubmitButton(                  active: model.secondaryBottomTab == 3 ? true : false,                  onPressed: () {                    model.changeSecondaryBottomTab(3);                  },                  width: 114.0,                  height: 30.0,                  text: AppString.accountBalance.toUpperCase(),                ),              ],            ),          ),        ),      ),    );  }}