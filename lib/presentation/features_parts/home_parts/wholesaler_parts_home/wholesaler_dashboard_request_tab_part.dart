part of '../../../ui/home_screen/home_screen_view.dart';

class WholesalerDashboardRequestTabPart extends StatelessWidget {
  final HomeScreenViewModel model;
  const WholesalerDashboardRequestTabPart(this.model, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: AppMargins.wholesalerDashboardRequestTabMarginH,
      padding: AppPaddings.wholesalerDashboardRequestTabPaddingB,
      color: AppColors.background,
      width: 100.0.wp,
      height: 10.0.hp,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SubmitButton(
              active: model.homeScreenBottomTabs == HomePageBottomTabs.dashboard
                  ? true
                  : false,
              onPressed: () {
                model.changeSecondaryBottomTab(HomePageBottomTabs.dashboard);
              },
              width: 174.0,
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
              width: 174.0,
              height: 30.0,
              text: AppString.requests.toUpperCase(),
            ),
          ],
        ),
      ),
    );
  }
}
