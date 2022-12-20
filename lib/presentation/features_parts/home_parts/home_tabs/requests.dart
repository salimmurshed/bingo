part of '../../../ui/home_screen/home_screen_view.dart';

class Requests extends StatelessWidget {
  const Requests({Key? key, required this.model, required this.isRetailer})
      : super(key: key);
  final HomeScreenViewModel model;
  final bool isRetailer;

  @override
  Widget build(BuildContext context) {
    return model.isBusy
        ? SizedBox(
            width: 100.0.wp,
            height: 100.0.hp,
            child: const Center(
              child: LoaderWidget(),
            ),
          )
        : isRetailer
            ? Padding(
                padding: AppPaddings.requestSettingCardPadding,
                child: SizedBox(
                  width: 100.0.wp,
                  child: DefaultTabController(
                    length: 2,
                    initialIndex: 0,
                    child: Column(
                      children: [
                        RetailerTabsInRequestTab(model),
                        Expanded(
                          child: TabBarView(
                            dragStartBehavior: DragStartBehavior.down,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    if (model.globalMessage.message != null)
                                      SnackBarRepo(
                                        success: !model.globalMessage.success!,
                                        text: model.globalMessage.message!,
                                      ),
                                    Padding(
                                      padding: AppPaddings
                                          .requestSettingTabColumnPadding,
                                      child: SizedBox(
                                        width: 100.0.wp,
                                        height: 80.0,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const SizedBox(),
                                            SubmitButton(
                                              onPressed:
                                                  model.gotoAddNewRequest,
                                              width: 100.0,
                                              text: AppString.addNew,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    if (model.associationRequestData.isEmpty)
                                      const Center(
                                        child: Text("No Data"),
                                      ),
                                    for (int j = 0;
                                        j < model.associationRequestData.length;
                                        j++)
                                      StatusCard(
                                        onTap: () {
                                          model
                                              .gotoAssociationRequestDetailsScreen(
                                                  model
                                                      .associationRequestData[j]
                                                      .associationUniqueId!);
                                        },
                                        title: model.associationRequestData[j]
                                            .wholesalerName!,
                                        subTitle:
                                            model.associationRequestData[j].id!,
                                        status: model
                                            .associationRequestData[j].status!,
                                        bodyFirstKey: AppString.emailTitle,
                                        bodyFirstValue: model
                                            .associationRequestData[j].email!,
                                        bodySecondKey: AppString.phoneTitle,
                                        bodySecondValue: model
                                            .associationRequestData[j]
                                            .phoneNumber!,
                                      ),
                                    20.0.giveHeight,
                                  ],
                                ),
                              ),
                              SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: AppPaddings
                                          .requestSettingTabColumnPadding,
                                      child: SizedBox(
                                        width: 100.0.wp,
                                        height: 80.0,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const SizedBox(),
                                            SubmitButton(
                                              onPressed:
                                                  model.gotoAddCreditLine,
                                              width: 100.0,
                                              text: AppString.addNew,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    for (int j = 0;
                                        j <
                                            model.retailerCreditLineRequestData
                                                .length;
                                        j++)
                                      StatusCardCreditLine(
                                        onTap: () {
                                          model.gotoViewCreditLine(j);
                                        },
                                        title: model
                                            .retailerCreditLineRequestData[j]
                                            .wholesalerName!,
                                        subTitle: model
                                            .retailerCreditLineRequestData[j]
                                            .wholesalerUniqueId!
                                            .substring(10, 18),
                                        status: model
                                            .retailerCreditLineRequestData[j]
                                            .status!,
                                        statusDescription: model
                                            .retailerCreditLineRequestData[j]
                                            .statusDescription!,
                                        bodyFirstKey: "Date "
                                            "Requested:",
                                        bodyFirstValue: model
                                            .retailerCreditLineRequestData[j]
                                            .dateRequested!,
                                        bodySecondKey: "Amount:",
                                        bodySecondValue:
                                            "${model.retailerCreditLineRequestData[j].currency} ${model.retailerCreditLineRequestData[j].requestedAmount}",
                                      ),
                                    20.0.giveHeight,
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : Padding(
                padding: AppPaddings.requestSettingCardPadding,
                child: SizedBox(
                  width: 100.0.wp,
                  child: DefaultTabController(
                    length: 2,
                    initialIndex: 0,
                    child: Column(
                      children: [
                        RetailerTabsInRequestTab(model),
                        Expanded(
                          child: TabBarView(
                            dragStartBehavior: DragStartBehavior.down,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              SingleChildScrollView(
                                child: SizedBox(
                                  width: 100.0.wp,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      if (model
                                          .wholesalerAssociationRequest.isEmpty)
                                        const Center(
                                          child: Text("No Data"),
                                        ),
                                      for (int j = 0;
                                          j <
                                              model.wholesalerAssociationRequest
                                                  .length;
                                          j++)
                                        StatusCard(
                                          onTap: () {
                                            model.gotoAssociationRequestDetailsScreen(
                                                model
                                                    .wholesalerAssociationRequest[
                                                        j]
                                                    .associationUniqueId!);
                                          },
                                          title: model
                                              .wholesalerAssociationRequest[j]
                                              .retailerName!,
                                          subTitle: model
                                              .wholesalerAssociationRequest[j]
                                              .id!,
                                          status: model
                                              .wholesalerAssociationRequest[j]
                                              .status!,
                                          bodyFirstKey: AppString.emailTitle,
                                          bodyFirstValue: model
                                              .wholesalerAssociationRequest[j]
                                              .email!,
                                          bodySecondKey: AppString.phoneTitle,
                                          bodySecondValue: model
                                              .wholesalerAssociationRequest[j]
                                              .phoneNumber!,
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                              SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    for (int j = 0;
                                        j <
                                            model
                                                .wholesalerCreditLineRequestData
                                                .length;
                                        j++)
                                      StatusCardCreditLine(
                                        onTap: () {
                                          model.gotoViewCreditLineWholeSaler(j);
                                        },
                                        title: model
                                            .wholesalerCreditLineRequestData[j]
                                            .retailerName!,
                                        subTitle: model
                                            .wholesalerCreditLineRequestData[j]
                                            .uniqueId!
                                            .substring(0, 8),
                                        status: model
                                            .wholesalerCreditLineRequestData[j]
                                            .status!,
                                        statusDescription: model
                                            .wholesalerCreditLineRequestData[j]
                                            .statusDescription!,
                                        bodyFirstKey: "Date "
                                            "Requested: ",
                                        bodyFirstValue: model
                                            .wholesalerCreditLineRequestData[j]
                                            .dateRequested!,
                                        bodySecondKey: "Amount:",
                                        bodySecondValue: model
                                            .wholesalerCreditLineRequestData[j]
                                            .requestedAmount!,
                                      ),
                                    if (model.hasCreditLineNextPage)
                                      loadMore(
                                          model.loadMoreCreditLineWholesaler),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        // model.requestTabTitle ==
                        //         HomePageRequestTabs.associateRequest
                        //     ? Padding(
                        //         padding: AppPaddings.requestSettingTabViewPadding,
                        //         child: SingleChildScrollView(
                        //           child: SizedBox(
                        //               width: 100.0.wp,
                        //               child: Column(
                        //                 mainAxisAlignment:
                        //                     MainAxisAlignment.center,
                        //                 crossAxisAlignment:
                        //                     CrossAxisAlignment.center,
                        //                 children: [
                        //                   if (model.wholesalerAssociationRequest
                        //                       .isEmpty)
                        //                     const Center(
                        //                       child: Text("No Data"),
                        //                     ),
                        //                   for (int j = 0;
                        //                       j <
                        //                           model
                        //                               .wholesalerAssociationRequest
                        //                               .length;
                        //                       j++)
                        //                     StatusCard(
                        //                       onTap: () {
                        //                         model.gotoAssociationRequestDetailsScreen(
                        //                             model
                        //                                 .wholesalerAssociationRequest[
                        //                                     j]
                        //                                 .associationUniqueId!);
                        //                       },
                        //                       title: model
                        //                           .wholesalerAssociationRequest[j]
                        //                           .retailerName!,
                        //                       subTitle: model
                        //                           .wholesalerAssociationRequest[j]
                        //                           .id!,
                        //                       status: model
                        //                           .wholesalerAssociationRequest[j]
                        //                           .status!,
                        //                       bodyFirstKey: AppString.emailTitle,
                        //                       bodyFirstValue: model
                        //                           .wholesalerAssociationRequest[j]
                        //                           .email!,
                        //                       bodySecondKey: AppString.phoneTitle,
                        //                       bodySecondValue: model
                        //                           .wholesalerAssociationRequest[j]
                        //                           .phoneNumber!,
                        //                     )
                        //                 ],
                        //               )),
                        //         ),
                        //       )
                        //     : Padding(
                        //         padding: AppPaddings.requestSettingTabViewPadding,
                        //         child: SingleChildScrollView(
                        //           child: Column(
                        //             mainAxisAlignment: MainAxisAlignment.center,
                        //             crossAxisAlignment: CrossAxisAlignment.center,
                        //             children: [
                        //               Padding(
                        //                 padding: AppPaddings
                        //                     .requestSettingTabColumnPadding,
                        //                 child: SizedBox(
                        //                   width: 100.0.wp,
                        //                   height: 80.0,
                        //                   child: Row(
                        //                     mainAxisAlignment:
                        //                         MainAxisAlignment.spaceBetween,
                        //                     crossAxisAlignment:
                        //                         CrossAxisAlignment.center,
                        //                     children: [
                        //                       const SizedBox(),
                        //                       SubmitButton(
                        //                         width: 100.0,
                        //                         text: AppString.addNew,
                        //                       ),
                        //                     ],
                        //                   ),
                        //                 ),
                        //               ),
                        //               for (int j = 0; j < 10; j++)
                        //                 StatusCard(
                        //                   title: "Mayorista prueba 1",
                        //                   subTitle: "00302309495",
                        //                   status: "Pending Wholesaler Review",
                        //                   bodyFirstKey: "Date "
                        //                       "Requested: ",
                        //                   bodyFirstValue: "2022-07-20 03:14:53",
                        //                   bodySecondKey: "Amount:",
                        //                   bodySecondValue: "RD\$ 1,000.00",
                        //                 ),
                        //             ],
                        //           ),
                        //         ),
                        //       ),
                      ],
                    ),
                  ),
                ),
              );
  }
}
