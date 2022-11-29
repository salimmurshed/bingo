import '../../app/app_config.dart';

class NetworkUrls {
  NetworkUrls._();
  static Uri loginUrl = Uri.parse("${Config.baseURL}login");
  static Uri countryUrl = Uri.parse("${Config.baseURL}country-list");
  static Uri storeUrl = Uri.parse("${Config.baseURL}store-list");

  //Wholesaler
  static Uri wholesalerListUri = Uri.parse("${Config.baseURL}wholesaler-list");
  static Uri requestWholesaler =
      Uri.parse("${Config.baseURL}add-retailer-wholesaler-association-request");
  //Fie association
  static Uri fiaListURI = Uri.parse("${Config.baseURL}fie-list");
  static Uri requestFia =
      Uri.parse("${Config.baseURL}add-retailer-fie-association-request");

  static Uri requestAssociationList = Uri.parse(
      "${Config.baseURL}retailer-wholesaler-association-request-list");
  static Uri requestAssociationListForWholesaler = Uri.parse(
      "${Config.baseURL}wholesaler-retailer-association-request-list");
  static Uri viewWholesalerRetailerAssociationRequest = Uri.parse(
      "${Config.baseURL}view-wholesaler-retailer-association-request");
  static Uri viewRetailerWholesalerAssociationRequest = Uri.parse(
      "${Config.baseURL}view-retailer-wholesaler-association-request");

  //components urls

  static Uri taxIdType = Uri.parse("${Config.baseURL}tax-id-type-list");
  static Uri customerType = Uri.parse("${Config.baseURL}customer-type-list");
  static Uri gracePeriodGroup =
      Uri.parse("${Config.baseURL}grace-period-groups-list");
  static Uri pricingGroup = Uri.parse("${Config.baseURL}pricing-groups-list");
  static Uri salesZone =
      Uri.parse("${Config.baseURL}wholesaler-sales-zone-list");
}
