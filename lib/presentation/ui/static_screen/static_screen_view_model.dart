import 'package:bingo_wholesale/app/router.dart';
import 'package:bingo_wholesale/services/navigation/navigationService.dart';
import 'package:stacked/stacked.dart';

import '../../../app/locator.dart';
import '../../../data_models/models/all_sales_model/all_sales_model.dart';
import '../../../repository/repository_sales.dart';

class StaticViewModel extends BaseViewModel {
  final RepositorySales _repositorySales = locator<RepositorySales>();
  final NavigationService _navigationService = locator<NavigationService>();
  StaticViewModel() {
    getWholesalersAssociationData();
  }
  List<AllSalesData> get allSalesData => _repositorySales.allSalesData;

  int currentTabIndex = 1;

  void setTabIndex(int v) {
    currentTabIndex = v;
    notifyListeners();
  }

  getWholesalersAssociationData() async {
    setBusy(true);
    notifyListeners();
    print('allSalesData.length');
    print(allSalesData.length);
    await _repositorySales.getWholesalersAssociationData();
    setBusy(false);
    notifyListeners();
  }

  int tabNumber = 2;

  void gotoSalesDetails(AllSalesData storeList) {
    _navigationService.pushNamed(Routes.salesDetailsScreen,
        arguments: storeList);
  }

  // void gotoSalesDetailsScreen(AllSalesData data) {
  //   _navigationService.pushNamed(Routes.salesDetailsScreen, arguments: data);
  // }
}
