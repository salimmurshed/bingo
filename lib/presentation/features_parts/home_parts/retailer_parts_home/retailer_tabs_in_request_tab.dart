part of '../../../ui/home_screen/home_screen_view.dart';

class RetailerTabsInRequestTab extends StatelessWidget {
  final HomeScreenViewModel model;
  const RetailerTabsInRequestTab(this.model, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32.0),
      height: 72,
      child: TabBar(
        controller: DefaultTabController.of(context),
        indicatorWeight: 0.1,
        indicatorColor: AppColors.transparent,
        padding: AppPaddings.zero,
        labelPadding: AppPaddings.zero,
        isScrollable: true,
        indicatorPadding: AppPaddings.zero,
        onTap: (int i) {
          model.changeRequestTabRetailer(i, context);
        },
        // mainAxisAlignment: MainAxisAlignment.center,
        tabs: [
          TabBarButton(
            width: 50.0.wp,
            active: model.requestTabTitleRetailer ==
                    HomePageRequestTabsR.wAssociateRequest
                ? true
                : false,
            // width: 150.0,
            text: AppString.wAssociationRequests,
          ),
          TabBarButton(
            width: 50.0.wp,
            active: model.requestTabTitleRetailer ==
                    HomePageRequestTabsR.fAssociateRequest
                ? true
                : false,
            // width: 150.0,
            text: AppString.fAssociationRequests,
          ),
          TabBarButton(
            width: 50.0.wp,
            active: model.requestTabTitleRetailer ==
                    HomePageRequestTabsR.creditLineRequest
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
