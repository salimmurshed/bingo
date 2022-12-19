import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../app/locator.dart';
import '../../../repository/repository_retailer.dart';

class BottomTabsScreenViewModel extends BaseViewModel
    with WidgetsBindingObserver {
  final RepositoryRetailer _apiService = locator<RepositoryRetailer>();

  BottomTabsScreenViewModel() {
    _apiService.getStores();
  }
  int numberOfTabs = 5;
  int selectedNumber = 0;
  final double iconHeight = 24;
  void onChangedTab(context, int index) {
    selectedNumber = index;
    DefaultTabController.of(context)!.animateTo(index);
    notifyListeners();
  }
}
