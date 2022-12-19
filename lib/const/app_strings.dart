import 'package:bingo_wholesale/presentation/ui/add_store_screen/add_store_screen_view.dart';

class AppString {
  AppString._();
  static String emailAddredd = 'Email Address';
  static String password = 'Password';
  static String login = 'login';

  static String forgotPassword = 'Forgot Password?';
  static String createAccount = 'Create new account ?';

  static String dashboardConfirmText = 'Aprobaciones pendientes /\n'
      'Confirmaciones de entrega';
  static String dashboardRecommendation = 'Recomendaciones de depósito';
  static String companyInformation = 'Company Information';
  static String contactInformation = 'Contact Information';
  static String ownerLegalRepresentative = 'Owner/Legal Representative';
  static String internalInformation = 'Internal Information';
  static String viewRetailerStores = 'View Retailer Stores';
  static String noDataInTable = 'No data available in table';
  static String internalID = "Internal ID";
  static String selectCustomerType = "Customer Type";
  static String gracePeriodGroups = "Grace Period Groups";
  static String pricingGroups = "Pricing Groups";
  static String salesZone = "Sales Zone";
  static String selectWholeSaler = "Select WholeSaler";
  static String allowOrders = "Allow Orders";
  static String customerSinceDate = "Customer Since Date";
  static String monthlySales = "Monthly Sales";
  static String averageSalesTicket = "Average Sales Ticket";
  static String visitFrequency = "Visit Frequency";
  static String suggestedCreditLineAmount = "Suggested Credit Line Amount";
  static String activationRequirement = "Activation code is required";
  static String put6DigitCode = "Please add "
      "valid 6 numbers code";

  //all buttons
  static String addNew = 'Add New';
  static String chooseFiles = 'Choose Files';
  static String approve = 'aprove';
  static String reject = 'reject';
  static String submitButton = 'submit';
  static String closeButton = 'Close';
  static String cancelButton = 'cancel';
  static String startPayment = 'Start payment';
  static String offlineApprove = 'Offline aprove';
  static String activationCode = 'ACTIVATION CODE';
  static String accept = 'Accept';
  static String viewDocuments = 'View Documents';
  static String noText = 'No';
  static String yesText = 'Yes';

  //app bar title
  static String dashBoard = 'DashBoard';
  static String requests = 'requests';
  static String settings = 'settings';
  static String accountBalance = 'ACCOUNT BALANCE';
  static String requestsDetail = 'requests detail';

  static String associationRequests = 'Association Requests';
  static String creditLineRequests = 'Credit Line Requests';
//screen texts
  static String users = 'Users';
  static String roles = 'Roles';
  static String status = "Status";
  static String stores = 'Stores';
  static String invoices = 'Invoices';
  static String manageAccount = 'Manage Account';
  static String companyProfile = 'Company Profile';
  static String newOrderRequest = 'New Order Requests';
  static String emailTitle = 'Email';
  static String phoneTitle = 'Phone';

  // error handler
  static const String badRequestError = "bad_request_error";
  static const String noContent = "no_content";
  static const String forbiddenError = "forbidden_error";
  static const String unauthorizedError = "unauthorized_error";
  static const String notFoundError = "not_found_error";
  static const String conflictError = "conflict_error";
  static const String internalServerError = "internal_server_error";
  static const String unknownError = "unknown_error";
  static const String timeoutError = "timeout_error";
  static const String defaultError = "default_error";
  static const String cacheError = "cache_error";
  static const String noInternetError = "Please check internet connection";
  static const String success = "success";
  static const String invite = 'Invite';
  static const String applicationInformation = 'Application information';
  static const String appBarTitle = 'SafeOurTomorrow';
  static const String mainProjectAppBarTitle = 'Create Sub Project';
  static const String pleaseCheckText = "Please "
      "re-cheack your "
      "all fields";

  //App request

  static const String orderID = 'Order ID: ';
  static const String invoiceTo = 'Invoice to: ';
  static const String fieName = 'FIE Name: ';
  static const String dateOfInvoice = 'Date Of Invoice:';
  static const String orderNumber = 'Order Number:';
  static const String dueDate = 'Due Date:';
  static const String salesStep = 'Sales Step:';
  static const String bingoStoreID = 'Bingo Store ID:';
  static const String fie = 'FIE: ';
  static const String serialNo = 'S. No: ';
  static const String fiaName = 'Nombre de la FIE: ';
  static const String balance = 'Balance: ';
  static const String caNumber = 'Número de la CA del Banco';
  static const String expireDate = 'Fecha de Vencimiento Cantidad de Venta:';
  static const String depositRecommendation = 'Recomendaciones de depósito::';
  static const String wantToRejectTitle = 'Rejection request';
  static const String wantToRejectContent = 'Do you really want to reject this '
      'request?';
  static const String rejectionCompleteSuccessful = "Your request "
      "rejection is completed";
  static const String rejectionCompleteUnsuccessful = "Your request "
      "rejection is unsuccessful";

  //association text
  static const String taxId = 'Tax ID';
  static const String associationDate = 'Association Date';
  static const String companyAddress = 'Company Address';
  static const String firstName = 'First Name';
  static const String lastName = 'First Name';
  static const String position = 'Last Name';
  static const String id = 'ID';
  static const String taxIdType = 'Tax Id Type';
  static const String phoneNumber = 'Phone Number';
  static const String category = 'Category';
  static const String email = 'Email';
  static const String idType = 'ID Type';
  static const String country = 'Country';
  static const String city = 'City';
  static const String setPricing = 'Set Pricing';

  /// [AddStoreView] AddStoreView text
  static const String locationName = 'Location Name';
  static const String address = 'Address';
  static const String frontBusinessPhoto = 'Front Business Photo';
  static const String signBoardPhoto = 'Sign Board Photo';
  static const String remark = 'Remark';
  static const String updateStore = 'Update Store';
  static const String update = 'Update';
  static const String remove = 'remove';
  static String addStore = "Add STORE";
  static String editStore = "UPDATE STORE";
  static String addManageAccount = "Add Manage Account";
  static String bankAccounttype = "Bank Account type";
  static String bankName = "Bank Name";
  static String currency = "Currency";
  static String bankAccountNumber = "Bank Account Number";
  static String iban = "IBAN";
  static String monthlyPurchase = "Monthly Purchase";
  static String averagePurchaseTicket = "Average Purchase Ticket";
  static String requestedAmount = "Requested Amount";
  static String createCreditLineRequest = "CREATE CREDIT LINE REQUEST";
  static String acceptTermAndConditions = "Accept Terms & Condition and "
      "authorize"
      " Bingo to send Credit Line Request detail to Financial Institutions";
  static String bingoCanForwardRequest = "Allow Bingo to forward this Credit "
      "Line "
      "Request to As Many Finacial Institutions deemed appropriate";
  static String specificFIA = "Send Credit Line Request To a Specific "
      "Financial institution";
  static String requiredFieldText = "This page can not be empty";

  //Select Items
  static String selectFie = "Select Single Fie";
  static const String selectText = 'Select';
  static const String selectedSalesZoneStringDefaultValue = 'XXXXXX';
  static const String selectedWholeSalerStringDefaultValue = 'XXXXXX';
  static const String selectMultipleWholesaler = 'Select Multiple Wholesaler';
  static const String selectMultipleFia = 'Select Multiple FIE';
  static String selectCountry = "Select Country";
  static String selectCity = "Select City";
  static String selectWholesaler = "Select Wholesaler";
  static String selectCurrency = "Currency";

  //tab names
  static String wholesaler = "Wholesaler";
  static String financialInstitution = "Financial Institution";

  //text field data
  static String crn1TextField = "Commercial Reference Name 1";
  static String crn2TextField = "Commercial Reference Name 2";
  static String crn3TextField = "Commercial Reference Name 3";
  static String crp1TextField = "Commercial Reference Phone No. 1";
  static String crp2TextField = "Commercial Reference Phone No. 2";
  static String crp3TextField = "Commercial Reference Phone No. 3";

  //body title
  static String creditLineInformation = "Credit Line Information";
  static String selectMultipleFie = "Select Financial Institution With Whom "
      "You Are Working";
  static String uploadFie = "Upload Financial Statements";
  static String chooseOptions = "Choose Options";
  static String questionAnswers = "Question answers";
  static String files = "Files";
  // static String uploadFie = "Commercial";
  // static String uploadFie = "Commercial";

}
