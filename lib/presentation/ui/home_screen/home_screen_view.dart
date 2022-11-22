import 'package:auto_size_text/auto_size_text.dart';import 'package:bingo_wholesale/const/all_const.dart';import 'package:bingo_wholesale/const/app_extensions/status.dart';import 'package:bingo_wholesale/data_models/models/confirmation_model/confirmation_model.dart';import 'package:bingo_wholesale/data_models/models/invoice_model/invoice_model.dart';import 'package:bingo_wholesale/data_models/models/recommandation_deposite_model/recommandation_deposite_model.dart';import 'package:flutter/material.dart';import 'package:stacked/stacked.dart';import '../../../const/utils.dart';import '../../common_widgets/buttons/submit_button.dart';import '../../common_widgets/cards/status_card.dart';import '../../common_widgets/cards/status_card_four_part.dart';import '../../common_widgets/text/classified_text.dart';import '../../common_widgets/cards/account_balance_card.dart';import '../../common_widgets/cards/dashboard_tiles_card.dart';import 'home_screen_view_model.dart';part "../../features_screen_widget/home_screen_parts/retailer_parts_home_screen/retailer_confirmation_card_in_dashboard.dart";part "../../features_screen_widget/home_screen_parts/retailer_parts_home_screen/retailer_dashboard_request_setting_tab_part.dart";part "../../features_screen_widget/home_screen_parts/retailer_parts_home_screen/retailer_tabs_in_setting_tab.dart";part "../../features_screen_widget/home_screen_parts/retailer_parts_home_screen/retailer_tabs_in_request_tab.dart";part "../../features_screen_widget/home_screen_parts/retailer_parts_home_screen/retailer_recommandation_card_in_dashboard.dart";part "../../features_screen_widget/home_screen_parts/wholesaler_parts_of_home_screen/wholesaler_invoice_part_in_dashboard.dart";part "../../features_screen_widget/home_screen_parts/wholesaler_parts_of_home_screen/wholesaler_new_order_part_in_dashboard.dart";part "../../features_screen_widget/home_screen_parts/wholesaler_parts_of_home_screen/wholesaler_dashboard_request_tab_part.dart";class HomeScreenView extends StatelessWidget {  @override  Widget build(BuildContext context) {    return ViewModelBuilder<HomeScreenViewModel>.reactive(      viewModelBuilder: () => HomeScreenViewModel(),      builder: (context, model, child) {        return Scaffold(          appBar: AppBar(            actions: [              IconButton(                onPressed: () {},                icon: Image.asset(AppAsset.searchIcon),              ),              const SizedBox(                width: 15.0,              ),            ],            leading: IconButton(              onPressed: () {},              icon: Image.asset(AppAsset.moreIcon),            ),            title: Text(model.appBarTitle),            backgroundColor: model.isRetailer                ? AppColors.appBarColorRetailer                : AppColors.appBarColorWholesaler,          ),          body: _retailer(model),        );      },    );  }}_retailer(HomeScreenViewModel model) {  return SizedBox(    height: 100.00.hp,    child: Stack(      children: [        model.secondaryBottomTab == 0            ? Padding(                padding: EdgeInsets.only(bottom: 10.0.hp),                child: SizedBox(                  width: 100.0.wp,                  child: SingleChildScrollView(                    child: Column(                      mainAxisAlignment: MainAxisAlignment.center,                      crossAxisAlignment: CrossAxisAlignment.center,                      children: [                        const SizedBox(                          height: 20.0,                        ),                        Wrap(                          runAlignment: WrapAlignment.spaceBetween,                          runSpacing: 16.0,                          spacing: 16.0,                          children: [                            for (var i = 0;                                i < model.retailerCardsPropertiesList.length;                                i++)                              DashboardTilesCard(                                color:                                    model.retailerCardsPropertiesList[i].color!,                                icon:                                    model.retailerCardsPropertiesList[i].icon!,                                amount: model                                    .retailerCardsPropertiesList[i].amount!,                                title:                                    model.retailerCardsPropertiesList[i].title!,                              ),                          ],                        ),                        Padding(                          padding: const EdgeInsets.all(18.0),                          child: Card(                            child: Container(                              width: 100.0.wp,                              padding: const EdgeInsets.all(18.0),                              decoration: BoxDecoration(                                borderRadius: BorderRadius.circular(6.0),                                color: AppColors.background,                              ),                              child: Column(                                crossAxisAlignment: CrossAxisAlignment.start,                                children: [                                  Text(                                    AppString.dashboardConfirmText,                                    style:                                        TextStyles.dashboardHeadTitle.copyWith(                                      fontWeight: AppFontWeighs.semiBold,                                    ),                                  ),                                  for (int i = 0;                                      i <                                          (model.confirmationData.length < 2                                              ? model.confirmationData.length                                              : 2);                                      i++)                                    RetailerConfirmationCardInDashboard(                                      model.confirmationData[i],                                      function: () {                                        model.gotoSalesDetailsScreen(                                            model.confirmationData[i]);                                      },                                    ),                                  Text(                                    AppString.dashboardRecommendation,                                    style:                                        TextStyles.dashboardHeadTitle.copyWith(                                      fontWeight: AppFontWeighs.semiBold,                                    ),                                  ),                                  Container(                                    margin: const EdgeInsets.symmetric(                                      vertical: 25.0,                                    ),                                    decoration: BoxDecoration(                                      color: AppColors.borderColors,                                      borderRadius: BorderRadius.circular(50.0),                                    ),                                    width: double.infinity,                                    height: 33.0,                                    child: Padding(                                      padding: const EdgeInsets.symmetric(                                        horizontal: 21.0,                                      ),                                      child: Row(                                        mainAxisAlignment:                                            MainAxisAlignment.spaceBetween,                                        children: const [                                          Text(                                            'Hoy - 25/07/2022',                                            style: TextStyles                                                .dashboardHeadTitleAsh,                                          ),                                          Icon(                                            Icons.arrow_drop_down_sharp,                                            color: AppColors.fontAsh,                                          )                                        ],                                      ),                                    ),                                  ),                                  RetailerRecommandationCardInDashboard(                                    model.recommadationData[0],                                  ),                                ],                              ),                            ),                          ),                        ),                      ],                    ),                  ),                ),              )            : model.secondaryBottomTab == 1                ? Padding(                    padding: EdgeInsets.only(bottom: 10.0.hp),                    child: SizedBox(                      width: 100.0.wp,                      child: Stack(                        children: [                          RetailerTabsInRequestTab(model),                          model.requestTabIndex == 0                              ? Padding(                                  padding: const EdgeInsets.only(top: 72),                                  child: SingleChildScrollView(                                    child: Column(                                      mainAxisAlignment:                                          MainAxisAlignment.center,                                      crossAxisAlignment:                                          CrossAxisAlignment.center,                                      children: [                                        Padding(                                          padding: const EdgeInsets.symmetric(                                              horizontal: 12.0),                                          child: SizedBox(                                            width: 100.0.wp,                                            height: 80.0,                                            child: Row(                                              mainAxisAlignment:                                                  MainAxisAlignment                                                      .spaceBetween,                                              crossAxisAlignment:                                                  CrossAxisAlignment.center,                                              children: [                                                const SizedBox(),                                                SubmitButton(                                                  onPressed:                                                      model.gotoAddNewRequest,                                                  width: 100.0,                                                  text: AppString.addNew,                                                ),                                              ],                                            ),                                          ),                                        ),                                        for (int j = 0; j < 10; j++)                                          StatusCard(                                            title: "Banco Adopem de "                                                "Ahorrosy Crédito ",                                            subTitle: ""                                                "00302309495",                                            status: "Active",                                            bodyFirstKey: "Email",                                            bodyFirstValue:                                                "anacaona@mailnator.com",                                            bodySecondKey: "Phone",                                            bodySecondValue: "8095484834",                                          )                                      ],                                    ),                                  ),                                )                              : Padding(                                  padding: const EdgeInsets.only(top: 72),                                  child: SingleChildScrollView(                                    child: Column(                                      mainAxisAlignment:                                          MainAxisAlignment.center,                                      crossAxisAlignment:                                          CrossAxisAlignment.center,                                      children: [                                        Padding(                                          padding: const EdgeInsets.symmetric(                                              horizontal: 12.0),                                          child: SizedBox(                                            width: 100.0.wp,                                            height: 80.0,                                            child: Row(                                              mainAxisAlignment:                                                  MainAxisAlignment                                                      .spaceBetween,                                              crossAxisAlignment:                                                  CrossAxisAlignment.center,                                              children: [                                                const SizedBox(),                                                SubmitButton(                                                  width: 100.0,                                                  text: AppString.addNew,                                                ),                                              ],                                            ),                                          ),                                        ),                                        for (int j = 0; j < 10; j++)                                          StatusCard(                                            title: "Mayorista prueba 1",                                            subTitle: "00302309495",                                            status: "Pending Wholesaler Review",                                            bodyFirstKey: "Date "                                                "Requested: ",                                            bodyFirstValue:                                                "2022-07-20 03:14:53",                                            bodySecondKey: "Amount:",                                            bodySecondValue: "RD\$ 1,000.00",                                          ),                                      ],                                    ),                                  ),                                ),                        ],                      ),                    ),                  )                : model.secondaryBottomTab == 2                    ? Padding(                        padding: EdgeInsets.only(bottom: 10.0.hp),                        child: SizedBox(                          width: 100.0.wp,                          child: Stack(                            children: [                              RetailerTabsInSettingTab(model),                              model.settingTabIndex == 0                                  ? Padding(                                      padding: const EdgeInsets.only(top: 72),                                      child: SingleChildScrollView(                                        child: Column(                                          mainAxisAlignment:                                              MainAxisAlignment.center,                                          crossAxisAlignment:                                              CrossAxisAlignment.center,                                          children: [                                            Padding(                                              padding:                                                  const EdgeInsets.symmetric(                                                      horizontal: 12.0),                                              child: SizedBox(                                                width: 100.0.wp,                                                height: 80.0,                                                child: Row(                                                  mainAxisAlignment:                                                      MainAxisAlignment                                                          .spaceBetween,                                                  crossAxisAlignment:                                                      CrossAxisAlignment.center,                                                  children: [                                                    const SizedBox(),                                                    SubmitButton(                                                      width: 100.0,                                                      text: AppString.addNew,                                                    ),                                                  ],                                                ),                                              ),                                            ),                                            for (int j = 0; j < 10; j++)                                              StatusCard(                                                title: "JOHN DOE".toUpperCase(),                                                subTitle: "",                                                status: "Active",                                                bodyFirstKey: "Email",                                                bodyFirstValue:                                                    "johndoe@mailnator.com",                                                bodySecondKey: "Role:",                                                bodySecondValue: "Finance",                                              ),                                          ],                                        ),                                      ),                                    )                                  : model.settingTabIndex == 1                                      ? Padding(                                          padding:                                              const EdgeInsets.only(top: 72),                                          child: SingleChildScrollView(                                            child: Column(                                              mainAxisAlignment:                                                  MainAxisAlignment.center,                                              crossAxisAlignment:                                                  CrossAxisAlignment.center,                                              children: [                                                for (int j = 0; j < 10; j++)                                                  StatusCard(                                                    title: "Admin",                                                    subTitle: "",                                                    status: "Active",                                                    bodyFirstKey: "Date: ",                                                    bodyFirstValue:                                                        "2021-07-05 01:50:54",                                                    bodySecondKey: "",                                                    bodySecondValue: "",                                                  ),                                              ],                                            ),                                          ),                                        )                                      : model.settingTabIndex == 2                                          ? Padding(                                              padding: const EdgeInsets.only(                                                  top: 72),                                              child: SingleChildScrollView(                                                child: Column(                                                  mainAxisAlignment:                                                      MainAxisAlignment.center,                                                  crossAxisAlignment:                                                      CrossAxisAlignment.center,                                                  children: [                                                    Padding(                                                      padding: const EdgeInsets                                                              .symmetric(                                                          horizontal: 12.0),                                                      child: SizedBox(                                                        width: 100.0.wp,                                                        height: 80.0,                                                        child: Row(                                                          mainAxisAlignment:                                                              MainAxisAlignment                                                                  .spaceBetween,                                                          crossAxisAlignment:                                                              CrossAxisAlignment                                                                  .center,                                                          children: [                                                            const SizedBox(),                                                            SubmitButton(                                                              width: 100.0,                                                              text: AppString                                                                  .addNew,                                                            ),                                                          ],                                                        ),                                                      ),                                                    ),                                                    for (int j = 0;                                                        j <                                                            model.storeData                                                                .length;                                                        j++)                                                      StatusCardFourPart(                                                        title: model                                                            .storeData[j].name!,                                                        subTitle: model                                                            .storeData[j].city!,                                                        status: model                                                            .storeData[j]                                                            .status!,                                                        bodyFirstKey:                                                            "Remark: ${model.storeData[j].remarks!}",                                                      ),                                                  ],                                                ),                                              ),                                            )                                          : Padding(                                              padding: const EdgeInsets.only(                                                  top: 72),                                              child: SingleChildScrollView(                                                child: Column(                                                  mainAxisAlignment:                                                      MainAxisAlignment.center,                                                  crossAxisAlignment:                                                      CrossAxisAlignment.center,                                                  children: [                                                    Padding(                                                      padding: const EdgeInsets                                                              .symmetric(                                                          horizontal: 12.0),                                                      child: SizedBox(                                                        width: 100.0.wp,                                                        height: 80.0,                                                        child: Row(                                                          mainAxisAlignment:                                                              MainAxisAlignment                                                                  .spaceBetween,                                                          crossAxisAlignment:                                                              CrossAxisAlignment                                                                  .center,                                                          children: [                                                            const SizedBox(),                                                            SubmitButton(                                                              width: 100.0,                                                              text: AppString                                                                  .addNew,                                                            ),                                                          ],                                                        ),                                                      ),                                                    ),                                                    for (int j = 0; j < 10; j++)                                                      StatusCardFourPart(                                                        title: "Banco 1",                                                        subTitle:                                                            "2022-06-05 18:15:28",                                                        status: "Active",                                                        bodyFirstKey:                                                            "Acc Type: Saving",                                                        bodyFirstValue:                                                            "Currency: DOP",                                                        bodySecondKey:                                                            "Acc No.: 885585585",                                                        bodySecondValue:                                                            "IBAN: ",                                                      ),                                                  ],                                                ),                                              ),                                            ),                            ],                          ),                        ),                      )                    : Padding(                        padding: EdgeInsets.only(bottom: 10.0.hp),                        child: SizedBox(                          width: 100.0.wp,                          child: Padding(                            padding: const EdgeInsets.only(top: 25.0),                            child: SingleChildScrollView(                              child: Column(                                mainAxisAlignment: MainAxisAlignment.center,                                crossAxisAlignment: CrossAxisAlignment.center,                                children: [                                  for (int j = 0; j < 10; j++)                                    AccountBalanceCard(                                      title: "Balance: RD\$ 0"                                          ".00",                                      subTitleList: const [                                        "Account Type: Saving",                                        "Acc"                                            "ount No.: ",                                        "Bank Name: Banco Prueba "                                            "1",                                        "IBAN: ",                                        "Date:2022-06-19 18:52:42",                                        "Date/Time Updated: "                                            "2022-06-19 18:52:42"                                      ],                                    )                                ],                              ),                            ),                          ),                        ),                      ),        Positioned(          bottom: 0.0,          child: RetailerDashboardRequestSettingTabPart(model),        ),      ],    ),  );}_wholesaler(HomeScreenViewModel model) {  return SizedBox(    height: 100.00.hp,    child: Stack(      children: [        Padding(          padding: EdgeInsets.only(bottom: 10.0.hp),          child: SizedBox(            width: 100.0.wp,            child: SingleChildScrollView(              child: Column(                mainAxisAlignment: MainAxisAlignment.center,                crossAxisAlignment: CrossAxisAlignment.center,                children: [                  const SizedBox(                    height: 20.0,                  ),                  Wrap(                    runAlignment: WrapAlignment.spaceBetween,                    runSpacing: 16.0,                    spacing: 16.0,                    children: [                      for (var i = 0;                          i < model.wholesalerCardsPropertiesList.length;                          i++)                        DashboardTilesCard(                          color: model.wholesalerCardsPropertiesList[i].color!,                          icon: model.wholesalerCardsPropertiesList[i].icon!,                          amount:                              model.wholesalerCardsPropertiesList[i].amount!,                          title: model.wholesalerCardsPropertiesList[i].title!,                        ),                    ],                  ),                  Padding(                    padding: const EdgeInsets.all(18.0),                    child: Card(                      child: Container(                        width: 100.0.wp,                        padding: const EdgeInsets.all(18.0),                        decoration: BoxDecoration(                          borderRadius: BorderRadius.circular(6.0),                          color: AppColors.background,                        ),                        child: Column(                          crossAxisAlignment: CrossAxisAlignment.start,                          children: [                            Text(                              AppString.invoices,                              style: TextStyles.dashboardHeadTitle.copyWith(                                fontWeight: AppFontWeighs.semiBold,                              ),                            ),                            const SizedBox(                              height: 25.0,                            ),                            for (int i = 0;                                i <                                    (model.invoiceData.length < 4                                        ? model.invoiceData.length                                        : 4);                                i++)                              WholesalerInvoicePartInDashboard(                                  model.invoiceData[i]),                            Text(                              AppString.newOrderRequest,                              style: TextStyles.dashboardHeadTitle.copyWith(                                fontWeight: AppFontWeighs.semiBold,                              ),                            ),                            const SizedBox(                              height: 25.0,                            ),                            for (int i = 0; i < 4; i++)                              const WholesalerNewOrderPartInDashboard(),                          ],                        ),                      ),                    ),                  ),                ],              ),            ),          ),        ),        Positioned(          bottom: 0.0,          child: WholesalerDashboardRequestTabPart(model),        ),      ],    ),  );}