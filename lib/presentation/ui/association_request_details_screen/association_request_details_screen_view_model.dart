import 'package:bingo_wholesale/presentation/widgets/alert/yes_no_dialog.dart';
import 'package:bingo_wholesale/repository/repository_components.dart';
import 'package:bingo_wholesale/repository/repository_retailer.dart';
import 'package:bingo_wholesale/services/navigation/navigationService.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

import '../../../app/locator.dart';
import '../../../const/app_strings.dart';
import '../../../data/data_source/visit_frequently_list.dart';
import '../../../data_models/construction_model/static_data_models/visit_frequent_list_model.dart';
import '../../../data_models/enums/data_source.dart';
import '../../../data_models/enums/status_name.dart';
import '../../../data_models/models/association_wholesaler_equest_details_model/association_wholesaler_equest_details_model.dart';
import '../../../data_models/models/component_models/sales_zone_model.dart';
import '../../../data_models/models/component_models/tax_id_type_model.dart';
import '../../../data_models/models/retailer_wholesaler_association_request_model/retailer_wholesaler_association_request_model.dart';
import '../../../data_models/models/update_response_model/update_response_model.dart';
import '../../../repository/repository_wholesaler.dart';
import '../../../services/auth_service/auth_service.dart';
import '../../widgets/alert/activation_dialog.dart';
import '../../widgets/alert/alert_dialog.dart';
import '../../widgets/alert/date_picker.dart';
import '../home_screen/home_screen_view_model.dart';

class AssociationRequestDetailsScreenModel extends ReactiveViewModel {
  // AssociationRequestDetailsScreenModel() {}

  //locator service
  final AuthService _authService = locator<AuthService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final RepositoryWholesaler _repositoryWholesaler =
      locator<RepositoryWholesaler>();
  final RepositoryRetailer _repositoryRetailer = locator<RepositoryRetailer>();
  final RepositoryComponents _repositoryComponents =
      locator<RepositoryComponents>();

  //get methods
  bool get isRetailer => _authService.isRetailer.value;
  bool get setScreenBusy => isRetailer
      ? _repositoryRetailer.setScreenBusy.value
      : _repositoryWholesaler.setScreenBusy.value;

  void callDetails(GetId arguments) async {
    uniqueId = arguments.id;
    type = arguments.type;
    print(arguments.id);
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (isRetailer) {
        setBusy(true);
        notifyListeners();
        if (arguments.type == RetailerTypeAssociationRequest.wholesaler) {
          await _repositoryRetailer.getRetailerAssociationDetails(arguments.id);
          _associationRequestRetailerDetails =
              _repositoryRetailer.associationRequestRetailerDetails.value;
          _companyInformationRetails =
              associationRequestRetailerDetails.data![0].companyInformation![0];
          _contactInformationRetails =
              associationRequestRetailerDetails.data![0].contactInformation![0];
          notifyListeners();
        } else {
          await _repositoryRetailer
              .getRetailerFieAssociationDetails(arguments.id);
          _associationRequestRetailerDetails =
              _repositoryRetailer.associationRequestRetailerDetails.value;
          _companyInformationRetails =
              associationRequestRetailerDetails.data![0].companyInformation![0];
          _contactInformationRetails =
              associationRequestRetailerDetails.data![0].contactInformation![0];
          notifyListeners();
        }

        setBusy(false);
        notifyListeners();
      } else {
        //RetailerTypeAssociationRequest
        await _repositoryWholesaler
            .getWholesalersAssociationDetails(arguments.id);
        _associationRequestWholesalerDetails =
            _repositoryWholesaler.wholesalerAssociationRequestDetails.value;
        presetFunction();
      }
    });
  }

  AssociationWholesalerRequestDetailsModel
      _associationRequestWholesalerDetails =
      AssociationWholesalerRequestDetailsModel();
  // _repositoryWholesaler
  //     .wholesalerAssociationRequestDetails.value;
  RetailerAssociationRequestDetailsModel _associationRequestRetailerDetails =
      RetailerAssociationRequestDetailsModel();
  // _repositoryRetailer.associationRequestRetailerDetails.value;
  AssociationWholesalerRequestDetailsModel
      get associationRequestWholesalerDetails =>
          _associationRequestWholesalerDetails;
  RetailerAssociationRequestDetailsModel
      get associationRequestRetailerDetails =>
          _associationRequestRetailerDetails;
  CompanyInformationRetails _companyInformationRetails =
      CompanyInformationRetails();
  ContactInformationRetails _contactInformationRetails =
      ContactInformationRetails();
  CompanyInformationRetails get companyInformationRetails =>
      _companyInformationRetails;
  ContactInformationRetails get contactInformationRetails =>
      _contactInformationRetails;

  ContactInformation get contactInformation =>
      associationRequestWholesalerDetails.data![0].contactInformation![0];
  InternalInformation get internalInformation =>
      associationRequestWholesalerDetails.data![0].internalInformation![0];
  CreditlineInformation get creditlineInformation =>
      associationRequestWholesalerDetails.data![0].creditlineInformation![0];
  CompanyInformation get companyInformation =>
      associationRequestWholesalerDetails.data![0].companyInformation![0];
  //local variables
  String selectedCustomerType =
      "${AppString.selectText} ${AppString.selectCustomerType}";
  String selectedGracePeriodGroups =
      "${AppString.selectText} ${AppString.gracePeriodGroups}";
  String selectedPricingGroups =
      "${AppString.selectText} ${AppString.pricingGroups}";
  String selectedSalesZoneString =
      AppString.selectedSalesZoneStringDefaultValue;
  String selectedAllowOrders =
      "${AppString.selectText} ${AppString.allowOrders}";
  String selectedCustomerSinceDate =
      "${AppString.selectText} ${AppString.customerSinceDate}";
  int? selectedVisitFrequency;
  int status = 0;
  String uniqueId = "";
  RetailerTypeAssociationRequest type =
      RetailerTypeAssociationRequest.wholesaler;

  //local text controllers
  TextEditingController internalIdController = TextEditingController();
  TextEditingController monthlySalesController = TextEditingController();
  TextEditingController averageSalesTicketController = TextEditingController();
  TextEditingController suggestedCreditLineController = TextEditingController();
  TextEditingController selectDate = TextEditingController();
  TextEditingController setVerificationCoded = TextEditingController();

  //get service data list
  TaxIdType get taxIdType => _repositoryComponents.taxIdType;
  List<String> get customerType => _repositoryComponents.customerType.data!
      .map((e) => e.customerType!)
      .toList();
  List<String> get gracePeriodGroup =>
      _repositoryComponents.gracePeriodGroup.data!
          .map((e) => e.gracePeriodGroup!)
          .toList();
  List<String> get pricingGroup => _repositoryComponents.pricingGroup.data!
      .map((e) => e.pricingGroups!)
      .toList();
  List<SalesZoneModelData> get salesZone =>
      _repositoryComponents.salesZone.data!;
  List<String> allowOrdersList = [AppString.yesText, AppString.noText];
  List<VisitFrequentListModel> visitFrequentlyList =
      AppList.visitFrequentlyList;

  int getStatus(String status) {
    switch (status.toLowerCase()) {
      case "accepted":
        return 1;
      case "rejected":
        return 2;
      case "verified":
        return 3;
      case "active":
        return 4;
      case "completed":
        return 5;
      default:
        return 0;
    }
  }

  void presetFunction() {
    internalIdController.text = internalInformation.internalId!;
    monthlySalesController.text = creditlineInformation.monthlySales!;
    averageSalesTicketController.text =
        creditlineInformation.averageSalesTicket!;
    suggestedCreditLineController.text =
        creditlineInformation.suggestedCreditlineAmount!;
    selectDate.text =
        DateFormat('dd/MM/yyyy').format(DateTime.now()).toString();
    selectedCustomerType = internalInformation.customerType!.isEmpty
        ? "${AppString.selectText} ${AppString.selectCustomerType}"
        : internalInformation.customerType!;
    selectedGracePeriodGroups = internalInformation.gracePeriodGroup == ""
        ? "${AppString.selectText} ${AppString.gracePeriodGroups}"
        : internalInformation.gracePeriodGroup!;
    selectedAllowOrders = internalInformation.allowOrders == 0
        ? AppString.noText
        : AppString.yesText;
    selectedPricingGroups = internalInformation.pricingGroup!.isEmpty
        ? "${AppString.selectText} ${AppString.pricingGroups}"
        : internalInformation.pricingGroup!;
    selectedSalesZoneString = internalInformation.salesZone == null
        ? selectedSalesZoneString
        : internalInformation.salesZone!;
    selectedVisitFrequency = creditlineInformation.visitFrequency == 0
        ? selectedVisitFrequency
        : creditlineInformation.visitFrequency!;
    status = getStatus(_repositoryWholesaler.wholesalerAssociationRequestDetails
        .value.data![0].companyInformation![0].status!);
    notifyListeners();
  }

  void openCalender() async {
    selectDate.text = (DateFormat('dd/MM/yyyy')
            .format(await _navigationService.animatedDialog(DatePicker())))
        .toString();
    notifyListeners();
  }

  void gotoBackScreen() {
    _navigationService.pop();
  }

  void changeCustomerType(String data) {
    selectedCustomerType = data;
    notifyListeners();
  }

  void changeGracePeriodGroups(String data) {
    selectedGracePeriodGroups = data;
    notifyListeners();
  }

  void changePricingGroups(String data) {
    selectedPricingGroups = data;
    notifyListeners();
  }

  void changeSalesZone(String data) {
    selectedSalesZoneString = data;
    notifyListeners();
  }

  void changeAllowOrders(String data) {
    selectedAllowOrders = data;
    notifyListeners();
  }

  void changeCustomerSinceDate(String data) {
    selectedCustomerSinceDate = data;
    notifyListeners();
  }

  void changeVisitFrequency(int data) {
    selectedVisitFrequency = data;
    notifyListeners();
  }

  void cancelButton() {
    _navigationService.pop();
  }

  void updateWholesalerRetailerAssociationStatus() async {
    bool isItemPostAble() {
      return internalIdController.text != "" &&
          monthlySalesController.text != "" &&
          averageSalesTicketController.text != "" &&
          suggestedCreditLineController.text != "" &&
          selectedCustomerType !=
              "${AppString.selectText} ${AppString.selectCustomerType}" &&
          selectedGracePeriodGroups !=
              "${AppString.selectText} ${AppString.gracePeriodGroups}" &&
          selectedPricingGroups !=
              "${AppString.selectText} ${AppString.pricingGroups}" &&
          selectedSalesZoneString !=
              AppString.selectedSalesZoneStringDefaultValue &&
          selectedAllowOrders !=
              "${AppString.selectText} ${AppString.allowOrders}" &&
          selectedVisitFrequency != 0;
    }

    if (!isItemPostAble()) {
      _navigationService
          .animatedDialog(const AlertDialogMessage(AppString.pleaseCheckText));
    }

    var sendData = {
      "unique_id": uniqueId,
      "action": "4",
      "internal_id": internalIdController.text,
      "customer_type": selectedCustomerType.toString(),
      "grace_period_group": selectedGracePeriodGroups.toString(),
      "pricing_group": selectedPricingGroups.toString(),
      "sales_zone_unique_id": selectedSalesZoneString.toString(),
      "allow_orders": selectedAllowOrders == "Yes" ? '1' : '0',
      "customer_since_date": selectDate.text,
      "monthly_sales": monthlySalesController.text,
      "average_sales_ticket": averageSalesTicketController.text,
      "visit_frequency": selectedVisitFrequency.toString(),
      "suggested_creditline_amount": suggestedCreditLineController.text
    };
    try {
      setBusy(true);
      notifyListeners();
      await _repositoryWholesaler.updateWholesalerRetailerAssociationStatus(
          sendData, uniqueId, 4);

      setBusy(false);
      notifyListeners();
    } on Exception catch (e) {
      setBusy(false);
      notifyListeners();
      _navigationService.displayDialog(AlertDialogMessage(e.toString()));
    }
  }

  void openActivationCodeDialog(int statusID) async {
    var sendData = {
      "unique_id": uniqueId,
      "action": statusID.toString(),
    };
    try {
      setBusy(true);
      notifyListeners();
      UpdateResponseModel data =
          await _repositoryWholesaler.updateWholesalerRetailerAssociationStatus(
              sendData, uniqueId, statusID);
      if (companyInformation.status!.toLowerCase() ==
          describeEnum(StatusNames.verified)) {
        _navigationService.displayDialog(ActivationDialog(
            activationCode: data.data!.activationCode!,
            isRetailer: isRetailer));
      }
      setBusy(false);
      notifyListeners();
    } on Exception catch (e) {
      setBusy(false);
      notifyListeners();
      _navigationService.displayDialog(AlertDialogMessage(e.toString()));
    }
  }

  void openActivationCodeSubmitForRetailerDialog(int statusID) async {
    var code = await _navigationService
        .animatedDialog(ActivationDialog(isRetailer: isRetailer));
    print('code');
    print(code);
    var sendData = {
      "unique_id": uniqueId,
      "action": statusID.toString(),
      "activation_code": code,
    };

    try {
      if (code.isEmpty) {
        _navigationService
            .displayDialog(AlertDialogMessage(AppString.activationRequirement));
      } else if (code.toString().length != 6) {
        _navigationService
            .animatedDialog(AlertDialogMessage(AppString.put6DigitCode));
      } else if (code != null) {
        setBusy(true);
        notifyListeners();
        UpdateResponseModel data =
            await _repositoryRetailer.updateRetailerWholesalerAssociationStatus(
                sendData, uniqueId, statusID);
        _navigationService.animatedDialog(AlertDialogMessage(data.message!));
      }
      await Future.delayed(const Duration(seconds: 1));
      setBusy(false);
      notifyListeners();
    } on Exception catch (e) {
      _navigationService.displayDialog(AlertDialogMessage(e.toString()));
      setBusy(false);
      notifyListeners();
    }
  }

  Future<void> deleteRequest(String statusID) async {
    bool yesNo = await _navigationService.animatedDialog(
          YesNoDialog(
            submitButtonText: AppString.reject,
            title: AppString.wantToRejectTitle,
            content: AppString.wantToRejectContent,
          ),
        ) ??
        false;
    try {
      var data = {
        "unique_id": uniqueId,
        "action": statusID.toString(),
      };
      if (yesNo == true) {
        isRetailer
            ? _repositoryRetailer.rejectRequest(data, uniqueId)
            : _repositoryWholesaler.rejectRequest(data, uniqueId);
      }
    } catch (e) {}
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices =>
      [_repositoryWholesaler, _repositoryRetailer, _repositoryComponents];
}
