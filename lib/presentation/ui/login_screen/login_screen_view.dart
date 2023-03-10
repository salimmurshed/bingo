import 'package:bingo_wholesale/const/all_const.dart';
import 'package:bingo_wholesale/const/app_extensions/strings_extention.dart';
import 'package:bingo_wholesale/const/app_sizes/app_sizes.dart';
import 'package:bingo_wholesale/const/app_styles/app_box_decoration.dart';
import 'package:bingo_wholesale/presentation/widgets/buttons/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'login_screen_view_model.dart';

class LoginScreenView extends StatelessWidget {
  const LoginScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginScreenViewModel>.reactive(
      viewModelBuilder: () => LoginScreenViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          body: Stack(
            children: [
              SizedBox(
                height: 100.0.hp,
                width: 100.0.wp,
                child: Image.asset(
                  AppAsset.loginBg,
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: AppPaddings.loginScreenMainCard,
                  child: Card(
                    child: Container(
                      padding: AppPaddings.loginScreenInnerCard,
                      // width: 280.0,
                      decoration: AppBoxDecoration.loginScreenCardDecoration,
                      child: Form(
                          key: model.formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: 222,
                                height: 73,
                                child: Image.asset(
                                  AppAsset.loginLogo,
                                ),
                              ),
                              15.0.giveHeight,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    AppString.emailAddress.isRequired,
                                    style: AppTextStyles.successStyle
                                        .copyWith(color: AppColors.blackColor),
                                  ),
                                  10.0.giveHeight,
                                  SizedBox(
                                    height: 45.0,
                                    width: 62.0.wp,
                                    child: TextFormField(
                                      scrollPhysics:
                                          NeverScrollableScrollPhysics(),
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      maxLines: 1,
                                      // scrollPadding:
                                      //     const EdgeInsets.only(left: 10.0),
                                      validator: (v) => model.checkEmail(v!),
                                      decoration:
                                          AppInputStyles.ashOutlineBorder,
                                      enableSuggestions: false,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      controller: model.nameController,
                                    ),
                                  ),
                                  Text(
                                    model.emailError,
                                    style: AppTextStyles.errorTextStyle,
                                  ),
                                ],
                              ),
                              20.0.giveHeight,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    AppString.password.isRequired,
                                    style: AppTextStyles.successStyle
                                        .copyWith(color: AppColors.blackColor),
                                  ),
                                  10.0.giveHeight,
                                  SizedBox(
                                    height: 45.0,
                                    width: 62.0.wp,
                                    child: TextFormField(
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      maxLines: 1,
                                      obscureText: !model.isVisible,
                                      decoration: AppInputStyles
                                          .ashOutlineBorder
                                          .copyWith(
                                        suffixIcon: GestureDetector(
                                          onTap: model.changeVisibility,
                                          child: !model.isVisible
                                              ? const Icon(
                                                  Icons.remove_red_eye,
                                                  color: AppColors.ashColor,
                                                )
                                              : const Icon(
                                                  Icons.visibility_off_sharp,
                                                  color: AppColors.ashColor,
                                                ),
                                        ),
                                      ),
                                      controller: model.passwordController,
                                      validator: (v) => model.checkPassword(v!),
                                    ),
                                  ),
                                  Text(
                                    model.passwordError,
                                    style: AppTextStyles.errorTextStyle,
                                  ),
                                ],
                              ),
                              20.0.giveHeight,
                              model.isLoginAttempt
                                  ? const SizedBox(
                                      height: 20.0,
                                      width: 20.0,
                                      child: CircularProgressIndicator(
                                        color: AppColors.loader1,
                                      ),
                                    )
                                  : SubmitButton(
                                      height: 45.0,
                                      onPressed: () {
                                        model.login(context);
                                      },
                                      text: AppString.login.toUpperCase(),
                                    ),
                              20.0.giveHeight,
                              Text(
                                AppString.forgotPassword,
                                style: AppTextStyles.loginTitleStyle,
                              )
                            ],
                          )),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
