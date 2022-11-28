import 'package:bingo_wholesale/services/navigation/navigationService.dart';import 'package:stacked/stacked.dart';import '../../../app/locator.dart';import '../../../services/auth_service/auth_service.dart';import '../../common_widgets/alert/activation_dialog.dart';class AssociationRequestDetailsScreenModel extends BaseViewModel {  final AuthService _authService = locator<AuthService>();  final NavigationService _navigationService = locator<NavigationService>();  bool get isRetailer => _authService.isRetailer.value;  void openActivationCodeDialog() {    _navigationService.displayDialog(const ActivationDialog());  }  void gotoBackScreen() {    _navigationService.pop();  }}