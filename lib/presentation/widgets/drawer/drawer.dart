import 'package:bingo_wholesale/app/router.dart';
import 'package:bingo_wholesale/const/all_const.dart';
import 'package:bingo_wholesale/data_models/models/user_model/user_model.dart';
import 'package:bingo_wholesale/presentation/widgets/buttons/submit_button.dart';
import 'package:bingo_wholesale/presentation/widgets/text_fields/name_text_field_drop_down.dart';
import 'package:bingo_wholesale/repository/repository_wholesaler.dart';
import 'package:bingo_wholesale/services/auth_service/auth_service.dart';
import 'package:bingo_wholesale/services/storage/deviceStorage.dart';
import 'package:flutter/material.dart';
import 'package:bingo_wholesale/repository/repository_retailer.dart' as _i2;
import 'package:bingo_wholesale/repository/repository_wholesaler.dart' as _i3;
import 'package:injectable/injectable.dart' as _i1;

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
    final gh = _i1.GetItHelper(locator);
    if (locator.isRegistered<RepositoryRetailer>()) {
      locator.unregister<RepositoryRetailer>();
      gh.lazySingleton<_i2.RepositoryRetailer>(() => _i2.RepositoryRetailer());
    }
    if (locator.isRegistered<RepositoryWholesaler>()) {
      locator.unregister<RepositoryWholesaler>();
      gh.lazySingleton<_i3.RepositoryWholesaler>(
          () => _i3.RepositoryWholesaler());
    }
    _deviceStorage.clearData();
    _localData.deleteDB();
    Navigator.pushReplacementNamed(context, Routes.login);
  }

  @override
  Widget build(BuildContext context) {
    print('isRetailer');
    print(isRetailer);
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
                        ? AppString.noName
                        : user.data!.name!,
                    style: AppTextStyles.drawerText,
                  ),
                  Text(
                    user.data!.enrollmentType!.trim() == ""
                        ? AppString.noName
                        : user.data!.enrollmentType!,
                    style: AppTextStyles.drawerText
                        .copyWith(fontWeight: AppFontWeighs.semiBold),
                  ),
                  SubmitButton(
                    color: AppColors.borderColors,
                    active: false,
                    width: 167.0,
                    height: 34.0,
                    text: AppString.editProfile,
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
