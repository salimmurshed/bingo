import '../../../const/app_sizes/app_sizes.dart';
import 'package:flutter/material.dart';

import '../app_colors.dart';

class AppBoxDecoration {
  AppBoxDecoration._();
  static BoxDecoration tabBarShadowDecoration = BoxDecoration(
    borderRadius: AppRadius.tabBarShadowDecorationRadius,
    color: AppColors.background,
    boxShadow: const [
      BoxShadow(
        spreadRadius: 1,
        blurRadius: 1,
        offset: Offset(0, 2),
        color: AppColors.cardShaddow,
      )
    ],
  );

  static BoxDecoration shadowBox = BoxDecoration(
    borderRadius: AppRadius.shadowBoxRadius,
    color: AppColors.background,
    boxShadow: const [
      BoxShadow(
        spreadRadius: 1,
        blurRadius: 1,
        offset: Offset(0, 2),
        color: AppColors.cardShaddow,
      )
    ],
  );

  static BoxDecoration dashboardCardDecoration = BoxDecoration(
    borderRadius: AppRadius.dashboardCardDecorationRadius,
    color: AppColors.background,
  );

  static BoxDecoration loginScreenCardDecoration = BoxDecoration(
    color: AppColors.background,
    borderRadius: AppRadius.loginScreenCardDecorationRadius,
  );

  static BoxDecoration borderDecoration = BoxDecoration(
    border: Border.all(
      color: AppColors.cardShaddow,
      width: 1.0,
    ),
    borderRadius: AppRadius.borderDecorationRadius,
  );
}
