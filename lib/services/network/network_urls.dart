import '../../app/app_config.dart';

class NetworkUrls {
  NetworkUrls._();
  static Uri loginUrl = Uri.parse("${Config.baseURL}login");
  static Uri countryUrl = Uri.parse("${Config.baseURL}country-list");
  static Uri storeUrl = Uri.parse("${Config.baseURL}store-list");

  //Wholesaler
  static Uri wholesalerListUri = Uri.parse("${Config.baseURL}wholesaler-list");

  //association urls

  static Uri fiaListURI = Uri.parse("${Config.baseURL}fie-list");

  static Uri requestAssociationList = Uri.parse(
      "${Config.baseURL}retailer-wholesaler-association-request-list");
  static Uri requestFieAssociationList =
      Uri.parse("${Config.baseURL}retailer-fie-association-request-list");
  static String requestAssociationListForWholesaler =
      ("${Config.baseURL}wholesaler-retailer-association-request-list?page=");
  static Uri viewWholesalerRetailerAssociationRequest = Uri.parse(
      "${Config.baseURL}view-wholesaler-retailer-association-request");
  static Uri addRetailerWholesalerAssociationRequest =
      Uri.parse("${Config.baseURL}add-retailer-wholesaler-association-request");
  static Uri addRetailerFiaAssociationRequest =
      Uri.parse("${Config.baseURL}add-retailer-fie-association-request");
  static Uri viewRetailerWholesalerAssociationRequest = Uri.parse(
      "${Config.baseURL}view-retailer-wholesaler-association-request");
  static Uri viewRetailerFieAssociationRequest =
      Uri.parse("${Config.baseURL}view-retailer-fie-association-request");
  static Uri updateWholesalerRetailerAssociationStatus = Uri.parse(
      "${Config.baseURL}update-wholesaler-retailer-association-status");
  static Uri updateRetailerWholesalerAssociationStatus = Uri.parse(
      "${Config.baseURL}update-retailer-wholesaler-association-status");
  static Uri updateRetailerFieAssociationStatus =
      Uri.parse("${Config.baseURL}update-retailer-fie-association-status");
  static Uri retailerCreditlineRequestList =
      Uri.parse("${Config.baseURL}retailer-creditline-request-list");
  static Uri retailerCreditlineRequestDetails =
      Uri.parse("${Config.baseURL}retailer-creditline-request-details");
  static Uri addCreditlineRequests =
      Uri.parse("${Config.baseURL}add-creditline-requests");
  static Uri retailerCreditlineRequestreply =
      Uri.parse("${Config.baseURL}retailer-creditline-request-reply");
  static String wholesalerCreditlineRequestList =
      ("${Config.baseURL}wholesaler-creditline-request-list?page=");
  static Uri retailerList = Uri.parse("${Config.baseURL}retailer-list");
  static Uri retailerBankList =
      Uri.parse("${Config.baseURL}retailer-bank-list");
  static Uri storeCreditlineDetails =
      Uri.parse("${Config.baseURL}store-creditline-details");
  static Uri retailerBankAccountList =
      Uri.parse("${Config.baseURL}retailer-bank-account-list");
  static Uri addEditRetailerBankAccount =
      Uri.parse("${Config.baseURL}add-edit-retailer-bank-account");
  static Uri salesList = Uri.parse("${Config.baseURL}sales-list");

  //components urls

  static Uri taxIdType = Uri.parse("${Config.baseURL}tax-id-type-list");
  static Uri customerType = Uri.parse("${Config.baseURL}customer-type-list");
  static Uri gracePeriodGroup =
      Uri.parse("${Config.baseURL}grace-period-groups-list");
  static Uri pricingGroup = Uri.parse("${Config.baseURL}pricing-groups-list");
  static Uri salesZone =
      Uri.parse("${Config.baseURL}wholesaler-sales-zone-list");
  static Uri countryUri = Uri.parse("${Config.baseURL}country-list");
  static Uri cityUri = Uri.parse("${Config.baseURL}city-list");
  static Uri allFieListForCreditLine =
      Uri.parse("${Config.baseURL}all-fie-list-for-creditline-request");
  static Uri partnerWithCurrencyList =
      Uri.parse("${Config.baseURL}partner-with-currency-list");
}
