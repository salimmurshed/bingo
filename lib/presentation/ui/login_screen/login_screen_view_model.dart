import 'package:bingo_wholesale/const/app_strings.dart';
import 'package:bingo_wholesale/const/email_validator.dart';
import 'package:bingo_wholesale/data_models/models/user_model/user_model.dart';
import 'package:bingo_wholesale/services/auth_service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stacked/stacked.dart';

import '../../../app/locator.dart';
import '../../../app/router.dart';
import '../../../services/navigation/navigationService.dart';
import '../../widgets/alert/alert_dialog.dart';

class LoginScreenViewModel extends BaseViewModel {
  LoginScreenViewModel() {
    SchedulerBinding.instance.addPostFrameCallback((_) {});
  }

  final AuthService _authService = locator<AuthService>();
  final NavigationService _navigationService = locator<NavigationService>();

  String _emailError = "";
  String _passwordError = "";
  // TextEditingController nameController =
  // TextEditingController(text: "mayorista1@mailinator.com");
  // TextEditingController nameController =
  //     TextEditingController(text: "anacaona@mailinator.com");
  // TextEditingController passwordController = TextEditingController(
  //     text: "123"
  //         "45678");
  // TextEditingController nameController =
  //     TextEditingController(text: "devyani.gohil@sensussoft.com");
  // TextEditingController passwordController =
  //     TextEditingController(text: "Dragon1!12345");
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;
  bool isVisible = false;
  bool isLoginAttempt = false;
  String get emailError => _emailError;
  String get passwordError => _passwordError;
  bool isEmailValidate = false;
  bool isPasswordValidate = false;

  void changeVisibility() {
    isVisible = !isVisible;
    notifyListeners();
  }

  String? checkEmail(String v) {
    print('vvvvvvvvv');
    print(v);
    if (v.isEmpty) {
      _emailError = AppString.emptyEmailValidationText;
      isEmailValidate = false;
      notifyListeners();
    } else if (!EmailValidator.validate(v)) {
      _emailError = AppString.wrongEmailFormatValidationText;
      isEmailValidate = false;
      notifyListeners();
    } else {
      _emailError = "";
      isEmailValidate = true;
      notifyListeners();
    }
    return null;
  }

  String? checkPassword(String v) {
    if (v.isEmpty) {
      isPasswordValidate = false;
      _passwordError = AppString.emptyPasswordValidationText;
      notifyListeners();
    } else if (v.length < 8) {
      isPasswordValidate = false;
      _passwordError = AppString.smallPasswordValidationText;
      notifyListeners();
    } else {
      _passwordError = "";
      isPasswordValidate = true;
      notifyListeners();
    }
    return null;
  }

  void makeBusy(bool v) {
    isLoginAttempt = v;
    notifyListeners();
  }

  void login(context) async {
    FocusScope.of(context).requestFocus(
      FocusNode(),
    );
    if (_formKey.currentState!.validate()) {
      if (isEmailValidate && isPasswordValidate) {
        try {
          makeBusy(true);
          UserModel user = await _authService.login(
              nameController.text, passwordController.text);

          makeBusy(false);
          if (user.success!) {
            _navigationService.pushReplacementNamed(Routes.dashboardScreen);
            makeBusy(false);
          } else {
            makeBusy(false);
            _navigationService
                .animatedDialog(AlertDialogMessage(user.message!));
          }
        } on Exception catch (_) {
          makeBusy(false);
          // TODO
        }
      }
    }
  }
}
