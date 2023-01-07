import 'package:bingo_wholesale/const/all_const.dart';
import 'package:bingo_wholesale/const/app_strings.dart';
import 'package:bingo_wholesale/presentation/widgets/buttons/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../app/locator.dart';
import '../../../repository/repository_retailer.dart';
import '../../../repository/repository_wholesaler.dart';

class BottomTabsScreenViewModel extends BaseViewModel
    with WidgetsBindingObserver {
  final RepositoryRetailer _apiService = locator<RepositoryRetailer>();
  final RepositoryWholesaler _repositoryWholesaler =
      locator<RepositoryWholesaler>();

  BottomTabsScreenViewModel() {
    _apiService.getStores();
    getWholesalerData();
  }
  int numberOfTabs = 5;
  int selectedNumber = 0;
  final double iconHeight = 24;
  void onChangedTab(context, int index) {
    selectedNumber = index;
    DefaultTabController.of(context)!.animateTo(index);
    notifyListeners();
  }

  void getWholesalerData() async {
    setBusy(true);
    notifyListeners();
    await _repositoryWholesaler.getWholesalersAssociationData();
    await _repositoryWholesaler.getCreditLinesList();
    setBusy(false);
    notifyListeners();
  }

  Future<bool> showExitPopup(context) async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(AppString.exitApp),
            content: Text(AppString.exitAppBody),
            actions: [
              Row(
                children: [
                  SubmitButton(
                    width: 30.0.wp,
                    onPressed: () => Navigator.of(context).pop(false),
                    //return false when click on "NO"
                    text: (AppString.noText),
                  ),
                  SubmitButton(
                    width: 30.0.wp,
                    onPressed: () => Navigator.of(context).pop(true),
                    //return true when click on "Yes"
                    text: (AppString.yesText),
                  ),
                ],
              ),
            ],
          ),
        ) ??
        false; //if showDialouge had returned null, then return false
  }
}
