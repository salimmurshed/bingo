part of '../../../ui/home_screen/home_screen_view.dart';

class RetailerDashboardRequestSettingTabPart extends StatelessWidget {
  final HomeScreenViewModel model;
  const RetailerDashboardRequestSettingTabPart(this.model, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPaddings.retailerDashboardRequestPaddingB,
      color: AppColors.background,
      width: 100.0.wp,
      height: 11.0.hp,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SubmitButton(
              active: model.homeScreenBottomTabs == HomePageBottomTabs.dashboard
                  ? true
                  : false,
              onPressed: () {
                model.changeSecondaryBottomTab(HomePageBottomTabs.dashboard);
              },
              width: 114.0,
              height: 30.0,
              text: AppString.dashBoard.toUpperCase(),
            ),
            SubmitButton(
              active: model.homeScreenBottomTabs == HomePageBottomTabs.requests
                  ? true
                  : false,
              onPressed: () {
                model.changeSecondaryBottomTab(HomePageBottomTabs.requests);
              },
              width: 114.0,
              height: 30.0,
              text: AppString.requests.toUpperCase(),
            ),
            SubmitButton(
              active: model.homeScreenBottomTabs == HomePageBottomTabs.settings
                  ? true
                  : false,
              onPressed: () {
                model.changeSecondaryBottomTab(HomePageBottomTabs.settings);
              },
              width: 114.0,
              height: 30.0,
              text: AppString.settings.toUpperCase(),
            ),
            SubmitButton(
              active: model.homeScreenBottomTabs ==
                      HomePageBottomTabs.accountBalance
                  ? true
                  : false,
              onPressed: () {
                model.changeSecondaryBottomTab(
                    HomePageBottomTabs.accountBalance);
              },
              width: 114.0,
              height: 30.0,
              text: AppString.accountBalance.toUpperCase(),
            ),
          ],
        ),
      ),
    );
  }
}
