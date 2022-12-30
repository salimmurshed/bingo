import 'package:bingo_wholesale/const/all_const.dart';
import 'package:bingo_wholesale/const/app_extensions/status.dart';
import 'package:bingo_wholesale/const/app_extensions/strings_extention.dart';
import 'package:bingo_wholesale/const/app_extensions/widgets_extensions.dart';
import 'package:bingo_wholesale/const/app_sizes/app_sizes.dart';
import 'package:bingo_wholesale/const/app_styles/app_box_decoration.dart';
import 'package:bingo_wholesale/const/utils.dart';
import 'package:bingo_wholesale/data_models/construction_model/static_data_models/visit_frequent_list_model.dart';
import 'package:bingo_wholesale/presentation/ui/home_screen/home_screen_view_model.dart';
import 'package:bingo_wholesale/presentation/widgets/buttons/cancel_button.dart';
import 'package:bingo_wholesale/presentation/widgets/buttons/submit_button.dart';
import 'package:bingo_wholesale/presentation/widgets/cards/loader/loader.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../data_models/enums/data_source.dart';
import '../../../data_models/enums/status_name.dart';
import '../../../data_models/models/association_wholesaler_equest_details_model/association_wholesaler_equest_details_model.dart';
import '../../../data_models/models/component_models/sales_zone_model.dart';
import '../../widgets/dropdowns/selected_dropdown.dart';
import '../../widgets/text_fields/name_text_field.dart';
import 'association_request_details_screen_view_model.dart';

class AssociationRequestDetailsScreen extends StatelessWidget {
  const AssociationRequestDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AssociationRequestDetailsScreenModel>.reactive(
        onModelReady: (AssociationRequestDetailsScreenModel model) {
          model
              .callDetails(ModalRoute.of(context)!.settings.arguments as GetId);
        },
        viewModelBuilder: () => AssociationRequestDetailsScreenModel(),
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(AppAsset.searchIcon),
                ),
                15.0.giveWidth,
              ],
              leading: IconButton(
                onPressed: model.gotoBackScreen,
                icon: const Icon(
                  Icons.arrow_back_ios_outlined,
                  color: AppColors.background,
                ),
              ),
              title: Text(AppString.requestsDetail.toUpperCase()),
              backgroundColor: model.isRetailer
                  ? AppColors.appBarColorRetailer
                  : AppColors.appBarColorWholesaler,
            ),
            body:
                //ShimmerScreen(number: 2),

                model.setScreenBusy
                    ? SizedBox(
                        width: 100.0.wp,
                        height: 100.0.hp,
                        child: const Center(
                          child: LoaderWidget(),
                        ),
                      )
                    : model.isRetailer
                        ? retailersBody(model)
                        : wholesalerBody(model),
          );
        });
  }

  Widget retailersBody(AssociationRequestDetailsScreenModel model) {
    return Stack(
      children: [
        Padding(
          padding: AppPaddings.screenARDSWidgetPadding,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    commonText(AppString.companyInformation),
                    if (model.type == RetailerTypeAssociationRequest.wholesaler)
                      "${model.companyInformationRetails.status}" !=
                                  describeEnum(StatusNames.active)
                                      .toUpperCamelCase() &&
                              "${model.companyInformationRetails.status}" !=
                                  describeEnum(StatusNames.rejected)
                                      .toUpperCamelCase()
                          ? InkWell(
                              onTap: () {
                                model.deleteRequest("2");
                              },
                              child: const Icon(
                                Icons.cancel_schedule_send,
                                color: AppColors.redColor,
                                size: 24,
                              ),
                            )
                          : const SizedBox()
                    else
                      "${model.companyInformationRetails.statusFie}" !=
                                  describeEnum(StatusNames.active)
                                      .toUpperCamelCase() &&
                              "${model.companyInformationRetails.statusFie}" !=
                                  describeEnum(StatusNames.rejected)
                                      .toUpperCamelCase()
                          ? InkWell(
                              onTap: () {
                                model.deleteRequest("2");
                              },
                              child: const Icon(
                                Icons.cancel_schedule_send,
                                color: AppColors.redColor,
                                size: 24,
                              ),
                            )
                          : const SizedBox(),
                  ],
                ),
                18.0.giveHeight,
                Container(
                  margin: AppMargins.screenARDSWidgetMarginH,
                  padding: AppPaddings.screenARDSWidgetInnerPadding,
                  decoration: AppBoxDecoration.shadowBox,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      commonText(
                          '${model.companyInformationRetails.companyName}'),
                      18.0.giveHeight,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          getNiceText(
                              "${AppString.taxId}:${model.companyInformationRetails.taxId}",
                              nxtln: true),
                          getNiceText(
                              "${AppString.associationDate}:${model.companyInformationRetails.associationDate}",
                              nxtln: true),
                        ],
                      ),
                      12.0.giveHeight,
                      SizedBox(
                        width: 319.0,
                        child: getNiceText(
                            "${AppString.companyAddress}:${model.companyInformationRetails.companyAddress}",
                            nxtln: true),
                      ),
                    ],
                  ),
                ),
                30.0.giveHeight,
                commonText(AppString.contactInformation),
                18.0.giveHeight,
                Container(
                  margin: AppMargins.screenARDSWidgetMarginH,
                  padding: AppPaddings.screenARDSWidgetInnerPadding,
                  decoration: AppBoxDecoration.shadowBox,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 40.0.wp,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                getNiceText(
                                    "${AppString.firstName}:${model.contactInformationRetails.firstName}",
                                    nxtln: true),
                                15.0.giveHeight,
                                getNiceText(
                                    "${AppString.position}:${model.contactInformationRetails.position}",
                                    nxtln: true),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              getNiceText(
                                  "${AppString.lastName}:${model.contactInformationRetails.lastName}",
                                  nxtln: true),
                              15.0.giveHeight,
                              getNiceText(
                                  "${AppString.id}: ${model.contactInformationRetails.id}",
                                  nxtln: true),
                            ],
                          ),
                        ],
                      ),
                      15.0.giveHeight,
                      getNiceText(
                          "${AppString.companyAddress}:${model.companyInformationRetails.companyAddress}",
                          nxtln: true),
                    ],
                  ),
                ),
                if (model.companyInformationRetails.status != null)
                  if (model.companyInformationRetails.status!.toLowerCase() ==
                      describeEnum(StatusNames.verified))
                    if (!model.isFie)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          32.0.giveHeight,
                          Align(
                            alignment: Alignment.topCenter,
                            child: SubmitButton(
                              onPressed: () {
                                model.openActivationCodeSubmitForRetailerDialog(
                                    3);
                              },
                              width: 325.0,
                              height: 45.0,
                              active: true,
                              text: AppString.activationCode,
                            ),
                          ),
                        ],
                      )
              ],
            ),
          ),
        ),
        if (model.isBusy) const LoaderWidget()
      ],
    );
  }

  Widget wholesalerBody(AssociationRequestDetailsScreenModel model) {
    return Stack(
      children: [
        Padding(
          padding: AppPaddings.screenARDSWidgetPadding,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: AppMargins.screenARDSWidgetMarginH,
                  padding: AppPaddings.screenARDSWidgetInnerPadding,
                  decoration: AppBoxDecoration.shadowBox,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          commonText(model.companyInformation.retailerName!),
                          "${model.companyInformation.status}" !=
                                      describeEnum(StatusNames.active)
                                          .toUpperCamelCase() &&
                                  "${model.companyInformation.status}" !=
                                      describeEnum(StatusNames.rejected)
                                          .toUpperCamelCase()
                              ? InkWell(
                                  onTap: () {
                                    model.deleteRequest("2");
                                  },
                                  child: const Icon(
                                    Icons.cancel_schedule_send,
                                    color: AppColors.statusReject,
                                    size: 24,
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      ),
                      18.0.giveHeight,
                      const Divider(),
                      18.0.giveHeight,
                      Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("${AppString.status}:"),
                            statusNamesEnumFromServer(
                                    "${model.companyInformation.status}")
                                .toStatus(
                                    textStyle: AppTextStyles.noDataTextStyle)
                          ],
                        ),
                      ),
                      18.0.giveHeight,
                      const Divider(),
                      10.0.giveHeight,
                      _subTitleText(
                          "${AppString.taxIdType}: ${model.companyInformation.taxIdType}"),
                      _subTitleText(
                          "${AppString.taxId} ${model.companyInformation.taxId}"),
                      _subTitleText(
                          "${AppString.phoneNumber}: ${model.companyInformation.phoneNumber}"),
                      _subTitleText(
                          "${AppString.category}: ${model.companyInformation.category}"),
                      _subTitleText(
                          "${AppString.companyAddress}: ${model.companyInformation.companyAddress}"),
                      30.0.giveHeight,
                      if (model.companyInformation.status!.toLowerCase() ==
                          describeEnum(StatusNames.accepted))
                        Center(
                          child: SubmitButton(
                            onPressed: () {
                              model.openActivationCodeDialog(3);
                            },
                            text: AppString.activationCode,
                            height: 45.0,
                            width: 325.0,
                          ),
                        ),
                      if (model.companyInformation.status!.toLowerCase() ==
                          describeEnum(StatusNames.verified))
                        Center(
                          child: SubmitButton(
                            onPressed: () {
                              model.openActivationCodeDialog(3);
                            },
                            text: AppString.activationCode,
                            height: 45.0,
                            width: 325.0,
                          ),
                        ),
                      if (model.companyInformation.status!.toLowerCase() ==
                          describeEnum(StatusNames.pending))
                        Center(
                          child: SubmitButton(
                            onPressed: () {
                              model.openActivationCodeDialog(1);
                            },
                            text: AppString.accept,
                            height: 45.0,
                            width: 325.0,
                          ),
                        ),
                      30.0.giveHeight,
                    ],
                  ),
                ),
                30.0.giveHeight,
                commonText(AppString.ownerLegalRepresentative),
                18.0.giveHeight,
                Container(
                  margin: AppMargins.screenARDSWidgetMarginH,
                  width: double.infinity,
                  padding: AppPaddings.screenARDSWidgetInnerPadding,
                  decoration: AppBoxDecoration.shadowBox,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _subTitleText(
                          "${AppString.firstName}: ${model.contactInformation.firstName}"),
                      _subTitleText(
                          "${AppString.login}: ${model.contactInformation.lastName}"),
                      _subTitleText(
                          "${AppString.email}: ${model.contactInformation.email}"),
                      _subTitleText(
                          "${AppString.idType}: ${model.contactInformation.idType}"),
                      _subTitleText(
                          "${AppString.id}: ${model.contactInformation.id}"),
                      _subTitleText(
                          "${AppString.phoneNumber}: ${model.contactInformation.phoneNumber}"),
                      _subTitleText(
                          "${AppString.country}: ${model.contactInformation.country}"),
                      _subTitleText(
                          "${AppString.city}: ${model.contactInformation.city}"),
                      _subTitleText(
                          "${AppString.position}: ${model.contactInformation.position}"),
                      if (model.contactInformation.companyDocument!.isNotEmpty)
                        SubmitButton(
                          onPressed: model.changeViewDocumentOpen,
                          color: !model.isViewDocumentOpen
                              ? AppColors.activeButtonColor
                              : AppColors.toggleConfirmed,
                          height: 30.0,
                          width: 123.0,
                          text: AppString.viewDocuments,
                        ),
                      10.0.giveHeight,
                      if (model.isViewDocumentOpen)
                        SizedBox(
                          width: 100.0.wp,
                          child: Wrap(
                            runSpacing: 10.0,
                            spacing: 10.0,
                            runAlignment: WrapAlignment.spaceBetween,
                            children: [
                              for (CompanyDocument doc
                                  in model.contactInformation.companyDocument!)
                                GestureDetector(
                                  onTap: () {
                                    if (doc.url != null ||
                                        doc.url!.isNotEmpty) {
                                      model
                                          .launchInBrowser(Uri.parse(doc.url!));
                                    }
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.borderColors,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    height: 100.0,
                                    width: 100.0,
                                    child: Center(
                                      child: Text(doc.name!),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        )
                    ],
                  ),
                ),
                32.0.giveHeight,
                commonText(AppString.internalInformation),
                18.0.giveHeight,
                Container(
                  margin: AppMargins.screenARDSWidgetMarginH,
                  width: double.infinity,
                  padding: AppPaddings.screenARDSWidgetInnerPadding,
                  decoration: AppBoxDecoration.shadowBox,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      NameTextField(
                        controller: model.internalIdController,
                        fieldName: AppString.internalID.isRequired,
                      ),
                      if (model.internalIdValidation != "")
                        validationText(model.internalIdValidation),
                      24.0.giveHeight,
                      SelectedDropdown<String>(
                        hintText: AppString.selectCustomerType,
                        fieldName: AppString.selectCustomerType.isRequired,
                        items: model.customerType
                            .map((e) => DropdownMenuItem<String>(
                                  value: e,
                                  child: Text(e),
                                ))
                            .toList(),
                        dropdownValue: model.selectedCustomerType,
                        onChange: (String value) {
                          model.changeCustomerType(value);
                        },
                      ),
                      if (model.selectedCustomerTypeValidation != "")
                        validationText(model.selectedCustomerTypeValidation),
                      24.0.giveHeight,
                      SelectedDropdown<String>(
                        fieldName: AppString.gracePeriodGroups.isRequired,
                        hintText: AppString.gracePeriodGroups,
                        items: model.gracePeriodGroup
                            .map((e) => DropdownMenuItem<String>(
                                  value: e,
                                  child: Text(e),
                                ))
                            .toList(),
                        dropdownValue: model.selectedGracePeriodGroups,
                        onChange: (String value) {
                          model.changeGracePeriodGroups(value);
                        },
                      ),
                      if (model.selectedGracePeriodGroupsValidation != "")
                        validationText(
                            model.selectedGracePeriodGroupsValidation),
                      24.0.giveHeight,
                      SelectedDropdown<String>(
                        fieldName: AppString.pricingGroups.isRequired,
                        hintText: AppString.pricingGroups,
                        items: model.pricingGroup
                            .map((e) => DropdownMenuItem<String>(
                                  value: e,
                                  child: Text(e),
                                ))
                            .toList(),
                        dropdownValue: model.selectedPricingGroups,
                        onChange: (String value) {
                          model.changePricingGroups(value);
                        },
                      ),
                      if (model.selectedPricingGroupsValidation != "")
                        validationText(model.selectedPricingGroupsValidation),
                      24.0.giveHeight,
                      SelectedDropdown<SalesZoneModelData>(
                        fieldName: AppString.salesZone.isRequired,
                        hintText: AppString.salesZone,
                        items: model.salesZone
                            .map((e) => DropdownMenuItem<SalesZoneModelData>(
                                  value: e,
                                  child: Text(e.zoneName!),
                                ))
                            .toList(),
                        dropdownValue: model.selectedSalesZoneString,
                        onChange: (SalesZoneModelData value) {
                          model.changeSalesZone(value);
                        },
                      ),
                      if (model.selectedSalesZoneStringValidation != "")
                        validationText(model.selectedSalesZoneStringValidation),
                      24.0.giveHeight,
                      SelectedDropdown(
                        fieldName: AppString.allowOrders.isRequired,
                        hintText: AppString.allowOrders,
                        items: model.allowOrdersList
                            .map((e) => DropdownMenuItem<String>(
                                  value: e,
                                  child: Text(e),
                                ))
                            .toList(),
                        dropdownValue: model.selectedAllowOrders,
                        onChange: (String value) {
                          model.changeAllowOrders(value);
                        },
                      ),
                      if (model.selectedAllowOrdersValidation != "")
                        validationText(model.selectedAllowOrdersValidation),
                      24.0.giveHeight,
                    ],
                  ),
                ),
                32.0.giveHeight,
                commonText(AppString.viewRetailerStores),
                18.0.giveHeight,
                model.internalInformation.retailerStoreDetails!.isNotEmpty
                    ? SizedBox(
                        width: 100.0.wp,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (RetailerStoreDetails doc in model
                                .internalInformation.retailerStoreDetails!)
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 20.0,
                                  horizontal: 10.0,
                                ),
                                margin: EdgeInsets.only(bottom: 5.0),
                                decoration: BoxDecoration(
                                  color: AppColors.borderColors,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                width: 100.0.wp,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      doc.storeName!,
                                      style: AppTextStyles.retailerStoreCard,
                                    ),
                                    Text(
                                      doc.location!,
                                      style: AppTextStyles.retailerStoreCard
                                          .copyWith(
                                              fontWeight:
                                                  AppFontWeighs.regular),
                                    ),
                                    Text(
                                      doc.salesZone!,
                                      style: AppTextStyles.retailerStoreCard
                                          .copyWith(
                                              fontWeight:
                                                  AppFontWeighs.regular),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      )
                    : Center(
                        child: Text(
                          AppString.noDataInTable,
                          style: AppTextStyles.noDataTextStyle,
                        ),
                      ),
                32.0.giveHeight,
                commonText(AppString.creditLine),
                18.0.giveHeight,
                Container(
                  margin: AppMargins.screenARDSWidgetMarginH,
                  width: double.infinity,
                  padding: AppPaddings.screenARDSWidgetInnerPadding,
                  decoration: AppBoxDecoration.shadowBox,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppString.customerSinceDate.isRequired),
                      10.0.giveHeight,
                      SizedBox(
                        height: 45.0,
                        child: TextField(
                          readOnly: true,
                          decoration: AppInputStyles.ashOutlineBorder,
                          onTap: model.openCalender,
                          controller: model.selectDate,
                        ),
                      ),
                      if (model.selectDateValidation != "")
                        validationText(model.selectDateValidation),
                      24.0.giveHeight,
                      NameTextField(
                        controller: model.monthlySalesController,
                        fieldName: AppString.monthlySales.isRequired,
                      ),
                      if (model.monthlySalesValidation != "")
                        validationText(model.monthlySalesValidation),
                      24.0.giveHeight,
                      NameTextField(
                        controller: model.averageSalesTicketController,
                        fieldName: AppString.averageSalesTicket.isRequired,
                      ),
                      if (model.averageSalesTicketValidation != "")
                        validationText(model.averageSalesTicketValidation),
                      24.0.giveHeight,
                      SelectedDropdown<VisitFrequentListModel>(
                        fieldName: AppString.visitFrequency.isRequired,
                        hintText: AppString.visitFrequency,
                        items: model.visitFrequentlyList
                            .map(
                                (e) => DropdownMenuItem<VisitFrequentListModel>(
                                      value: e,
                                      child: Text(e.title!),
                                    ))
                            .toList(),
                        dropdownValue: model.selectedVisitFrequency,
                        onChange: (VisitFrequentListModel value) {
                          model.changeVisitFrequency(value);
                        },
                      ),
                      if (model.selectedVisitFrequencyValidation != "")
                        validationText(model.selectedVisitFrequencyValidation),
                      24.0.giveHeight,
                      NameTextField(
                        controller: model.suggestedCreditLineController,
                        fieldName:
                            AppString.suggestedCreditLineAmount.isRequired,
                      ),
                      if (model.suggestedCreditLineValidation != "")
                        validationText(model.suggestedCreditLineValidation),
                      24.0.giveHeight,
                    ],
                  ),
                ),
                20.0.giveHeight,
                if ("${model.companyInformation.status}" ==
                    describeEnum(StatusNames.completed).toUpperCamelCase())
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CancelButton(
                        onPressed: model.cancelButton,
                        text: AppString.cancelButton,
                        width: 40.0.wp,
                      ),
                      SubmitButton(
                        onPressed:
                            model.updateWholesalerRetailerAssociationStatus,
                        text: AppString.setPricing,
                        width: 40.0.wp,
                      ),
                    ],
                  ),
                40.0.giveHeight,
              ],
            ),
          ),
        ),
        if (model.isBusy) const LoaderWidget()
      ],
    );
  }

  _subTitleText(String text) {
    return getNiceText(
      text,
      style: AppTextStyles.requestDetailsSubTitle,
      padding: 5.0,
    );
  }
}
