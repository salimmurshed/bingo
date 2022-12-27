import 'package:bingo_wholesale/presentation/widgets/alert/activation_dialog.dart';
import 'package:bingo_wholesale/presentation/widgets/text_fields/name_text_field.dart';
import 'package:flutter/material.dart';

import '../app_colors.dart';

class AppInputStyles {
  /// [ActivationDialog]
  static InputDecoration blackOutlineBorder = const InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.inputBorder, width: 1.0),
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.inputBorder, width: 1.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.inputBorder, width: 1.0),
    ),
  );

  /// [NameTextField]
  static InputDecoration ashOutlineBorder = const InputDecoration(
    // contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
    fillColor: AppColors.whiteColor,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.cardShaddow, width: 1.0),
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.cardShaddow, width: 1.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.cardShaddow, width: 1.0),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.borderColors),
    ),
    isDense: true,
  );

  /// [NameTextField]
  static InputDecoration ashOutlineBorderDisable = const InputDecoration(
    fillColor: AppColors.disableColor,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.borderColors),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.borderColors),
    ),
    filled: true,
  );
}
