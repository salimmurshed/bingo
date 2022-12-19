import 'package:bingo_wholesale/presentation/widgets/alert'
    '/qr_alert_dialog'
    '.dart';
import 'package:stacked/stacked.dart';
import '../../../app/locator.dart';
import '../../../data_models/construction_model/confirmation_model/confirmation_model.dart';
import '../../../services/auth_service/auth_service.dart';
import '../../../services/navigation/navigationService.dart';

class SalesDetailsScreenViewModel extends BaseViewModel {
  final AuthService _authService = locator<AuthService>();
  NavigationService _navigationService = locator<NavigationService>();
  bool get isRetailer => _authService.isRetailer.value;
  ConfirmationModel singleConfirmationData = ConfirmationModel();
  void openQRDialog() {
    _navigationService.displayDialog(QRAlertDialog());
  }

  setData(ConfirmationModel arguments) {
    singleConfirmationData = arguments;
    notifyListeners();
  }
}
