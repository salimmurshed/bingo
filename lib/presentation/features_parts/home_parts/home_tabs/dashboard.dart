part of '../../../ui/home_screen/home_screen_view.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key, required this.model, required this.isRetailer})
      : super(key: key);
  final HomeScreenViewModel model;
  final bool isRetailer;
  @override
  Widget build(BuildContext context) {
    print(isRetailer);
    return isRetailer
        ? Padding(
            padding: AppPaddings.dashboardCardPadding,
            child: SizedBox(
              width: 100.0.wp,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    20.0.giveHeight,
                    Wrap(
                      runAlignment: WrapAlignment.spaceBetween,
                      runSpacing: OtherSizes.runSpacing,
                      spacing: OtherSizes.spacing,
                      children: [
                        for (var i = 0;
                            i < model.retailerCardsPropertiesList.length;
                            i++)
                          DashboardTilesCard(
                            color: model.retailerCardsPropertiesList[i].color!,
                            icon: model.retailerCardsPropertiesList[i].icon!,
                            amount:
                                model.retailerCardsPropertiesList[i].amount!,
                            title: model.retailerCardsPropertiesList[i].title!,
                          ),
                      ],
                    ),
                    Padding(
                      padding: AppPaddings.dashboardOtherCardPadding,
                      child: Card(
                        child: Container(
                          width: 100.0.wp,
                          padding: AppPaddings.dashboardOtherCardPadding,
                          decoration: AppBoxDecoration.dashboardCardDecoration,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppString.dashboardConfirmText,
                                style:
                                    AppTextStyles.dashboardHeadTitle.copyWith(
                                  fontWeight: AppFontWeighs.semiBold,
                                ),
                              ),
                              for (int i = 0;
                                  i <
                                      (model.confirmationData.length < 2
                                          ? model.confirmationData.length
                                          : 2);
                                  i++)
                                RetailerConfirmationCardInDashboard(
                                  model.confirmationData[i], function: () {},
                                  // function: () {
                                  //   model.gotoSalesDetailsScreen(
                                  //       model.confirmationData[i]);
                                  // },
                                ),
                              Text(
                                AppString.dashboardRecommendation,
                                style:
                                    AppTextStyles.dashboardHeadTitle.copyWith(
                                  fontWeight: AppFontWeighs.semiBold,
                                ),
                              ),
                              Container(
                                margin: AppMargins.dashboardCalenderMarginV,
                                padding: AppPaddings.dashboardCalenderPaddingH,
                                decoration: AppBoxDecoration
                                    .dashboardCardDecoration
                                    .copyWith(
                                  borderRadius: AppRadius.s50Padding,
                                ),
                                width: double.infinity,
                                height: 33.0,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      'Hoy - 25/07/2022',
                                      style:
                                          AppTextStyles.dashboardHeadTitleAsh,
                                    ),
                                    Icon(
                                      Icons.arrow_drop_down_sharp,
                                      color: AppColors.ashColor,
                                    )
                                  ],
                                ),
                              ),
                              RetailerRecommendationCardInDashboard(
                                model.recommadationData[0],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : Padding(
            padding: AppPaddings.dashboardCardPadding,
            child: SizedBox(
              width: 100.0.wp,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    20.0.giveHeight,
                    Wrap(
                      runAlignment: WrapAlignment.spaceBetween,
                      runSpacing: OtherSizes.runSpacing,
                      spacing: OtherSizes.spacing,
                      children: [
                        for (var i = 0;
                            i < model.wholesalerCardsPropertiesList.length;
                            i++)
                          DashboardTilesCard(
                            color:
                                model.wholesalerCardsPropertiesList[i].color!,
                            icon: model.wholesalerCardsPropertiesList[i].icon!,
                            amount:
                                model.wholesalerCardsPropertiesList[i].amount!,
                            title:
                                model.wholesalerCardsPropertiesList[i].title!,
                          ),
                      ],
                    ),
                    Padding(
                      padding: AppPaddings.dashboardOtherCardPadding,
                      child: Card(
                        child: Container(
                          width: 100.0.wp,
                          padding: AppPaddings.dashboardOtherCardPadding,
                          decoration: AppBoxDecoration.dashboardCardDecoration,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppString.invoices,
                                style:
                                    AppTextStyles.dashboardHeadTitle.copyWith(
                                  fontWeight: AppFontWeighs.semiBold,
                                ),
                              ),
                              25.0.giveHeight,
                              for (int i = 0;
                                  i <
                                      (model.invoiceData.length < 4
                                          ? model.invoiceData.length
                                          : 4);
                                  i++)
                                WholesalerInvoicePartInDashboard(
                                    model.invoiceData[i]),
                              Text(
                                AppString.newOrderRequest,
                                style:
                                    AppTextStyles.dashboardHeadTitle.copyWith(
                                  fontWeight: AppFontWeighs.semiBold,
                                ),
                              ),
                              25.0.giveHeight,
                              for (int i = 0; i < 4; i++)
                                const WholesalerNewOrderPartInDashboard(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
