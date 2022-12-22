part of '../../../ui/home_screen/home_screen_view.dart';

class WholesalerTabsInRequestTab extends StatelessWidget {
  final HomeScreenViewModel model;
  const WholesalerTabsInRequestTab(this.model, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      height: 72,
      width: 100.0.wp,
      child: TabBar(
        controller: DefaultTabController.of(context),
        indicatorWeight: 0.1,
        indicatorColor: AppColors.transparent,
        padding: AppPaddings.zero,
        labelPadding: AppPaddings.zero,
        isScrollable: false,
        indicatorPadding: AppPaddings.zero,
        onTap: (int i) {
          model.changeRequestTabWholesaler(i, context);
        },
        // mainAxisAlignment: MainAxisAlignment.center,
        tabs: [
          TabBarButton(
            active: model.requestTabTitleWholesaler ==
                    HomePageRequestTabsW.associateRequest
                ? true
                : false,
            // width: 150.0,
            text: AppString.associationRequests,
          ),
          TabBarButton(
            active: model.requestTabTitleWholesaler ==
                    HomePageRequestTabsW.creditLineRequest
                ? true
                : false,
            // width: 150.0,
            text: AppString.creditLineRequests,
          ),
        ],
      ),
    );
  }
}
