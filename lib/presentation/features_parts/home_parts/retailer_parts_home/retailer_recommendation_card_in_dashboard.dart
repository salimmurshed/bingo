part of '../../../ui/home_screen/home_screen_view.dart';

class RetailerRecommendationCardInDashboard extends StatelessWidget {
  final RecommendationModel recommadationData;
  const RetailerRecommendationCardInDashboard(this.recommadationData,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPaddings.retailerRecommandationPadding,
      decoration: BoxDecoration(
        borderRadius: AppRadius.retailerRecommandationCardRadius,
        border: Border.all(
          color: AppColors.borderColors,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClassifiedText(
                      text1: "${AppString.fiaName}\n",
                      text2: "${recommadationData.fie}"),
                  ClassifiedText(
                      text1: "${AppString.balance}:\n",
                      text2: "RD\$ ${recommadationData.balance}"),
                ],
              ),
              10.0.giveWidth,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 40.0.wp,
                    child: RichText(
                      // maxLines: 3,
                      text: TextSpan(
                        text: '${AppString.caNumber}\n',
                        style: AppTextStyles.dashboardHeadTitleAsh,
                        children: <TextSpan>[
                          TextSpan(
                            text: "${recommadationData.caNumber}",
                            style: AppTextStyles.dashboardHeadTitleAsh
                                .copyWith(fontWeight: AppFontWeighs.semiBold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ClassifiedText(
                      text1: AppString.serialNo,
                      text2: "${recommadationData.sNo}"),
                ],
              ),
            ],
          ),
          ClassifiedText(
              text1: "${AppString.expireDate} \n",
              text2: "RD\$ "
                  "${recommadationData.expiration}"),
          ClassifiedText(
              text1: "${AppString.depositRecommendation} \n",
              text2: "RD\$ "
                  "${recommadationData.depositReccomandation}"),
        ],
      ),
    );
  }
}
