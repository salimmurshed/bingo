import '../../app/app_config.dart';

class NetworkUrls {
  static Uri loginUrl = Uri.parse("${Config.baseURL}login");
  static Uri countryUrl = Uri.parse("${Config.baseURL}country-list");
  static Uri storeUrl = Uri.parse("${Config.baseURL}store-list");

  //Whole Saler
  static Uri wholesalerListUri = Uri.parse("${Config.baseURL}wholesaler-list");
  static Uri requestWholesaler =
      Uri.parse("${Config.baseURL}add-retailer-wholesaler-association-request");
  //Fie aAssociation
  static Uri fiaListURI = Uri.parse("${Config.baseURL}fie-list");
  static Uri requestFia =
      Uri.parse("${Config.baseURL}add-retailer-fie-association-request");
}
