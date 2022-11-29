import 'package:bingo_wholesale/repository/repository_components.dart';
import 'package:bingo_wholesale/repository/repository_retailer.dart';
import 'package:bingo_wholesale/services/navigation/navigationService.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

import '../../../app/locator.dart';
import '../../../const/app_strings.dart';
import '../../../data_models/models/association_wholesaler_equest_details_model/association_wholesaler_equest_details_model.dart';
import '../../../data_models/models/component_models/sales_zone_model.dart';
import '../../../data_models/models/component_models/tax_id_type_model.dart';
import '../../../data_models/models/retailer_wholesaler_association_request_model/retailer_wholesaler_association_request_model.dart';
import '../../../repository/repository_wholesaler.dart';
import '../../../services/auth_service/auth_service.dart';
import '../../widgets/alert/activation_dialog.dart';
import '../../widgets/alert/date_picker.dart';

class AssociationRequestDetailsScreenModel extends ReactiveViewModel {
  AssociationRequestDetailsScreenModel() {}

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
  AssociationWholesalerRequestDetailsModel
      get associationRequestWholesalerDetails =>
          _repositoryWholesaler.associationRequestWholesalerDetails.value;
  RetailerAssociationRequestDetailsModel
      get associationRequestRetailerDetails =>
          _repositoryRetailer.associationRequestRetailerDetails;
  InternalInformation get internalInformation => _repositoryWholesaler
      .associationRequestWholesalerDetails
      .value
      .data![0]
      .internalInformation![0];
  CreditlineInformation get creditlineInformation => _repositoryWholesaler
      .associationRequestWholesalerDetails
      .value
      .data![0]
      .creditlineInformation!;

  //local variables
  String selectedCustomerType = "Select ${AppString.selectCustomerType}";
  String selectedGracePeriodGroups = "Select ${AppString.gracePeriodGroups}";
  String selectedPricingGroups = "Select ${AppString.pricingGroups}";
  String selectedSalesZoneString = "xxxxxx";
  String selectedAllowOrders = "Select ${AppString.allowOrders}";
  String selectedCustomerSinceDate = "Select ${AppString.customerSinceDate}";
  int selectedVisitFrequency = 0;
  int status = 0;
  String uniqueId = "";

  //local text controllers
  TextEditingController internalIdController = TextEditingController();
  TextEditingController monthlySalesController = TextEditingController();
  TextEditingController averageSalesTicketController = TextEditingController();
  TextEditingController suggestedCreditLineController = TextEditingController();
  TextEditingController selectDate = TextEditingController();

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
  List<String> allowOrdersList = ["Yes", "No"];
  List<dynamic> visitFrequentlyList = [
    {"id": 1, "title": "Twice a week"},
    {"id": 2, "title": "Weekly"},
    {"id": 3, "title": "Every two weeks"},
    {"id": 4, "title": "Every Three Weeks"},
    {"id": 5, "title": "Monthly"}
  ];

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
        ? selectedCustomerType
        : internalInformation.customerType!;
    selectedGracePeriodGroups = selectedGracePeriodGroups;
    selectedAllowOrders = internalInformation.allowOrders == 0 ? "No" : "Yes";
    selectedPricingGroups = internalInformation.pricingGroup!.isEmpty
        ? selectedPricingGroups
        : internalInformation.pricingGroup!;
    // selectedSalesZoneString = internalInformation.salesZone == null
    //     ? selectedSalesZoneString
    //     : internalInformation.salesZone!;
    // print('creditlineInformation.visitFrequency');
    // print(internalInformation.salesZone);
    selectedVisitFrequency = creditlineInformation.visitFrequency == null
        ? selectedVisitFrequency
        : creditlineInformation.visitFrequency!;
    status = getStatus(_repositoryWholesaler.associationRequestWholesalerDetails
        .value.data![0].companyInformation![0].status!);
    notifyListeners();
  }

  void openActivationCodeDialog() {
    _navigationService.displayDialog(const ActivationDialog());
  }

  void callDetails(String arguments) async {
    uniqueId = arguments;
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      isRetailer
          ? _repositoryRetailer.getRetailerAssociationDetails(arguments)
          : await _repositoryWholesaler
              .getWholesalersAssociationDetails(arguments);
      presetFunction();
    });
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
    print(selectedSalesZoneString);
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

  void updateStatus() {
    var data = {
      "unique_id": uniqueId,
      "action": status,
    };
    var dataForStatus4 = {
      "unique_id": uniqueId,
      "action": 4,
      "internal_id": internalIdController.text,
      "customer_type": selectedCustomerType,
      "grace_period_group": selectedGracePeriodGroups,
      "pricing_group": selectedPricingGroups,
      "sales_zone_unique_id": selectedSalesZoneString,
      "allow_orders": selectedAllowOrders,
      "customer_since_date": selectDate.text,
      "monthly_sales": monthlySalesController.text,
      "average_sales_ticket": averageSalesTicketController.text,
      "visit_frequency": selectedVisitFrequency,
      "suggested_creditline_amount": suggestedCreditLineController.text
    };
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices =>
      [_repositoryWholesaler, _repositoryRetailer, _repositoryComponents];
}
