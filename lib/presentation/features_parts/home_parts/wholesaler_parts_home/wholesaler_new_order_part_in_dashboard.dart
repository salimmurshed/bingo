part of '../../../ui/home_screen/home_screen_view.dart';

class WholesalerNewOrderPartInDashboard extends StatelessWidget {
  const WholesalerNewOrderPartInDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  AppMargins.wholesalerInDashboardMarginB,

      padding:
        AppPaddings.wholesalerInDashboardPadding,

      decoration: BoxDecoration(
        borderRadius: AppRadius.wholesalerInDashboardRadius,
        border: Border.all(color: AppColors.borderColors),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getNiceText("Order From:Domanica Inc", nxtln: true),
              statusNamesEnumFromServer("Pending").toStatus(),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              getNiceText("S. No: 1"),
              getNiceText(
                "Amount: RD\$ 8,752.16",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
