import 'package:bingo_wholesale/const/app_font_manager.dart';
import 'package:flutter/material.dart';

import '../app_colors.dart';

class AppTextStyles {
  AppTextStyles._();
//DashBoard
  static const TextStyle appBarTitle = TextStyle(
    fontFamily: AppFont.mainTextFontFamily,
    fontWeight: AppFontWeighs.medium,
    fontSize: AppFontSize.s19,
    color: AppColors.whiteColor,
  );

  static const TextStyle dashboardHeadTitle = TextStyle(
    fontFamily: AppFont.mainTextFontFamily,
    fontWeight: AppFontWeighs.light,
    fontSize: AppFontSize.s16,
    color: AppColors.blackColor,
    height: 1.5,
  );

  static const TextStyle cartAmountText = TextStyle(
    fontFamily: AppFont.mainTextFontFamily,
    fontWeight: AppFontWeighs.medium,
    fontSize: AppFontSize.s26,
    color: AppColors.whiteColor,
  );

  static const TextStyle dashboardBodyTitle = TextStyle(
    fontFamily: AppFont.mainTextFontFamily,
    fontWeight: AppFontWeighs.light,
    fontSize: AppFontSize.s10,
    color: AppColors.blackColor,
    height: 1.5,
  );

  static const TextStyle dashboardHeadTitleAsh = TextStyle(
    fontFamily: AppFont.mainTextFontFamily,
    fontWeight: AppFontWeighs.light,
    fontSize: AppFontSize.s12,
    color: AppColors.ashColor,
    height: 1.5,
  );

  static const TextStyle cartTitleText = TextStyle(
    fontFamily: AppFont.mainTextFontFamily,
    fontWeight: AppFontWeighs.light,
    fontSize: AppFontSize.s13,
    color: AppColors.whiteColor,
  );

  static const TextStyle heading1 = TextStyle(
    fontFamily: AppFont.mainTextFontFamily,
    fontWeight: AppFontWeighs.light,
    fontSize: AppFontSize.s32,
    color: AppColors.blackColor,
  );
//button text
  static const TextStyle buttonText = TextStyle(
    fontFamily: AppFont.mainTextFontFamily,
    fontWeight: AppFontWeighs.regular,
    fontSize: AppFontSize.s10,
    color: AppColors.blackColor,
  );

  //StatusCard
  static const TextStyle statusCardTitle = TextStyle(
    fontFamily: AppFont.mainTextFontFamily,
    fontWeight: AppFontWeighs.semiBold,
    fontSize: AppFontSize.s16,
    color: AppColors.blackColor,
  );
  static const TextStyle statusCardSubTitle = TextStyle(
    fontFamily: AppFont.mainTextFontFamily,
    fontWeight: AppFontWeighs.light,
    fontSize: AppFontSize.s10,
    color: AppColors.ashColor,
  );
  static const TextStyle statusCardStatus = TextStyle(
    fontFamily: AppFont.mainTextFontFamily,
    fontWeight: AppFontWeighs.light,
    fontSize: AppFontSize.s10,
    color: AppColors.statusVerified,
  );

  static const TextStyle bottomTexts = TextStyle(
    fontFamily: AppFont.mainTextFontFamily,
    fontWeight: AppFontWeighs.light,
    fontSize: AppFontSize.s12,
    color: AppColors.ashColor,
  );

  static const TextStyle loginTitleStyle = TextStyle(
    fontFamily: AppFont.mainTextFontFamily,
    fontWeight: AppFontWeighs.light,
    fontSize: AppFontSize.s13,
    color: AppColors.activeButtonColor,
  );

  static const TextStyle testForAll = TextStyle(
    fontFamily: AppFont.mainTextFontFamily,
    fontWeight: AppFontWeighs.light,
    fontSize: AppFontSize.s13,
    color: AppColors.activeButtonColor,
  );
//add request screen
  static const TextStyle addRequestTabBar = TextStyle(
    fontFamily: AppFont.mainTextFontFamily,
    fontWeight: AppFontWeighs.semiBold,
    fontSize: AppFontSize.s12,
    color: AppColors.whiteColor,
  );

  static const TextStyle addRequestHeader = TextStyle(
    fontFamily: AppFont.mainTextFontFamily,
    fontWeight: AppFontWeighs.semiBold,
    fontSize: AppFontSize.s16,
    color: AppColors.blackColor,
  );

  static const TextStyle addRequestSubTitle = TextStyle(
    fontFamily: AppFont.mainTextFontFamily,
    fontWeight: AppFontWeighs.light,
    fontSize: AppFontSize.s10,
    color: AppColors.ashColor,
  );

  static const TextStyle requestDetailsSubTitle = TextStyle(
    fontFamily: AppFont.mainTextFontFamily,
    fontWeight: AppFontWeighs.light,
    fontSize: AppFontSize.s16,
    color: AppColors.ashColor,
  );

  static const TextStyle noDataTextStyle = TextStyle(
    fontFamily: AppFont.mainTextFontFamily,
    fontWeight: AppFontWeighs.light,
    fontSize: AppFontSize.s16,
    color: AppColors.ashColor,
  );

  static const TextStyle successStyle = TextStyle(
    fontFamily: AppFont.mainTextFontFamily,
    fontWeight: AppFontWeighs.regular,
    fontSize: AppFontSize.s12,
    color: AppColors.blackColor,
  );
//drawer
  static const TextStyle drawerText = TextStyle(
    fontFamily: AppFont.mainTextFontFamily,
    fontWeight: AppFontWeighs.regular,
    fontSize: AppFontSize.s19,
    color: AppColors.blackColor,
  );
  static const TextStyle errorTextStyle = TextStyle(
    fontFamily: AppFont.mainTextFontFamily,
    fontWeight: AppFontWeighs.regular,
    fontSize: AppFontSize.s12,
    color: AppColors.redColor,
  );

  //sales
  static const TextStyle addSaleGreenBoxText = TextStyle(
    fontFamily: AppFont.mainTextFontFamily,
    fontWeight: AppFontWeighs.regular,
    fontSize: AppFontSize.s12,
    color: AppColors.whiteColor,
  );
  static const TextStyle addSaleGreenBoxTextBold =
      TextStyle(fontWeight: AppFontWeighs.bold);
}
