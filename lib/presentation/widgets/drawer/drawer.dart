import 'package:bingo_wholesale/app/router.dart';
import 'package:bingo_wholesale/const/all_const.dart';
import 'package:bingo_wholesale/data_models/models/user_model/user_model.dart';
import 'package:bingo_wholesale/presentation/widgets/buttons/submit_button.dart';
import 'package:bingo_wholesale/presentation/widgets/text_fields/name_text_field_drop_down.dart';
import 'package:bingo_wholesale/services/auth_service/auth_service.dart';
import 'package:bingo_wholesale/services/storage/deviceStorage.dart';
import 'package:flutter/material.dart';

import '../../../app/locator.dart';
import '../../../const/app_sizes/app_sizes.dart';
import '../../../repository/repository_retailer.dart';
import '../../../services/local_data/local_data.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({Key? key}) : super(key: key);
  var _deviceStorage = locator<ZDeviceStorage>();
  var _repositoryRetailer = locator<RepositoryRetailer>();
  final _authService = locator<AuthService>();
  final _localData = locator<LocalData>();
  UserModel get user => _authService.user.value;
  bool get isRetailer => _authService.isRetailer.value;
  void logout(context) {
    _repositoryRetailer.creditLineInformation.value.clear();
    _deviceStorage.clearData();
    _localData.deleteDB();
    Navigator.pushReplacementNamed(context, Routes.login);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                padding: AppPaddings.drawerCloseIconPaddingTR,
                color: isRetailer
                    ? AppColors.appBarColorRetailer
                    : AppColors.appBarColorWholesaler,
                width: 100.0.wp,
                height: 156.0,
                child: Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              )
            ],
          ),
          Positioned(
            top: 78.0,
            child: SizedBox(
              width: 100.0.wp,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    AppAsset.profileImage,
                    height: 159.0,
                    width: 159.0,
                  ),
                  11.0.giveHeight,
                  Text(
                    user.data!.name!.trim() == ""
                        ? "No Name"
                        : user.data!.name!,
                    style: AppTextStyles.drawerText,
                  ),
                  Text(
                    user.data!.enrollmentType!.trim() == ""
                        ? "No Name"
                        : user.data!.enrollmentType!,
                    style: AppTextStyles.drawerText
                        .copyWith(fontWeight: AppFontWeighs.semiBold),
                  ),
                  const SubmitButton(
                    color: AppColors.borderColors,
                    active: false,
                    width: 167.0,
                    height: 34.0,
                    text: "Edit Profile",
                  ),
                  NameTextFieldDropDown(
                    fieldName: "Zones",
                    value: user.data!.enrollmentType!,
                    width: 322.0,
                  ),
                  22.0.giveHeight,
                  NameTextFieldDropDown(
                    fieldName: "Routes",
                    value: user.data!.country!,
                    width: 322.0,
                  ),
                  150.0.giveHeight,
                  SubmitButton(
                    onPressed: () {
                      logout(context);
                    },
                    active: false,
                    color: AppColors.borderColors,
                    width: 99.0,
                    height: 34.0,
                    text: "Logout",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
