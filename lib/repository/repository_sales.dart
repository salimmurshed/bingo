import 'package:bingo_wholesale/services/network/web_service.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import '../../../app/locator.dart';
import 'package:stacked/stacked.dart';
import 'dart:convert' as convert;
import '../const/connectivity.dart';
import '../data_models/models/all_sales_model/all_sales_model.dart';
import '../services/local_data/local_data.dart';
import '../services/local_data/table_names.dart';
import '../services/network/network_urls.dart';

@lazySingleton
class RepositorySales with ReactiveServiceMixin {
  final LocalData _localData = locator<LocalData>();
  final WebService _webService = locator<WebService>();

  List<AllSalesData> allSalesData = [];

  RepositorySales() {
    listenToReactiveValues([]);
  }

  void addSales(Map<String, String?> body) {
    _localData.insert(TableNames.wholesalerCreditlineRequestList, body);
  }

  Future getWholesalersAssociationData() async {
    bool connection = await checkConnectivity();
    if (connection) {
      try {
        Response response = await _webService
            .postRequest((NetworkUrls.salesList), {"per_page": '10'});
        final responseData =
            AllSalesModel.fromJson(convert.jsonDecode(response.body));
        allSalesData = responseData.data!.data!;
        await Future.delayed(const Duration(seconds: 1));
      } on Exception catch (e) {
        print(e.toString());
        // _navigationService.displayDialog(AlertDialogMessage(e.toString()));
      }
    }
    notifyListeners();
  }
}
