import 'package:bingo_wholesale/const/all_const.dart';
import 'package:bingo_wholesale/data_models/enums/data_source.dart';
import 'package:bingo_wholesale/presentation/widgets/alert/alert_dialog.dart';

import '../../../repository/repository_retailer.dart';
import 'package:bingo_wholesale/services/navigation/navigationService.dart';
import 'package:stacked/stacked.dart';

import '../../../app/locator.dart';
import '../../../data_models/models/wholesaler_list_model/wholesaler_list_model.dart';
import '../../../services/auth_service/auth_service.dart';

class AddAssociationRequestViewModel extends ReactiveViewModel {
  final AuthService _authService = locator<AuthService>();
  final RepositoryRetailer _RepositoryRetailer = locator<RepositoryRetailer>();
  final NavigationService _navigationService = locator<NavigationService>();
  int wholeSalerOrFia = 0;
  bool get isRetailer => _authService.isRetailer.value;
  bool isAddRequestBusy = false;
  List<WholeSalerOrFiaListData> get wholeSaleList =>
      _RepositoryRetailer.wholeSaleList;
  List<WholeSalerOrFiaListData> get fiaList => _RepositoryRetailer.fiaList;
  void changeTabBar(int i) {
    wholeSalerOrFia = i;
    notifyListeners();
  }

  List<String> selectedWholeSaler = [];
  List<String> selectedFia = [];

  void setAddRequestBusy(bool v) {
    isAddRequestBusy = v;
    notifyListeners();
  }

  void addRemoveWholesaler(int i) {
    var data = selectedWholeSaler.contains(wholeSaleList[i].uniqueId);
    if (data) {
      selectedWholeSaler.remove(wholeSaleList[i].uniqueId!);
    } else {
      selectedWholeSaler.add(wholeSaleList[i].uniqueId!);
    }
    notifyListeners();
  }

  void addRemoveFia(int i) {
    var data = selectedFia.contains(fiaList[i].uniqueId);
    if (data) {
      selectedFia.remove(fiaList[i].uniqueId!);
    } else {
      selectedFia.add(fiaList[i].uniqueId!);
    }
    notifyListeners();
  }

  void cancelButtonPressed() {
    _navigationService.pop();
  }

  void sendWholesalerRequest() async {
    if (selectedWholeSaler.isEmpty) {
      _navigationService.animatedDialog(
          const AlertDialogMessage(AppString.needToSelectOneWholesaler));
    } else {
      setAddRequestBusy(true);
      await _RepositoryRetailer.sendWholesalerRequest(selectedWholeSaler);
      notifyListeners();
      selectedWholeSaler.clear();
      setAddRequestBusy(false);
      notifyListeners();
    }
  }

  void setDetails(RetailerTypeAssociationRequest arguments) {
    wholeSalerOrFia = arguments.index;
    notifyListeners();
  }

  void sendFiaRequest() async {
    if (selectedFia.isEmpty) {
      _navigationService
          .animatedDialog(AlertDialogMessage(AppString.needToSelectFie));
    } else {
      setAddRequestBusy(true);
      await _RepositoryRetailer.sendFiaRequest(selectedFia);
      await _RepositoryRetailer.getRetailersAssociationData();
      selectedFia.clear();
      setAddRequestBusy(false);
      _navigationService.pop();
    }
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_RepositoryRetailer];
}
