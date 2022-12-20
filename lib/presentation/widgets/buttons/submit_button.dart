import 'package:bingo_wholesale/const/all_const.dart';
import 'package:bingo_wholesale/const/app_sizes/app_sizes.dart';
import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final Function()? onPressed;
  final bool active;
  final String text;
  final double width;
  final double height;
  final Color color;
  const SubmitButton(
      {this.onPressed,
      this.text = "",
      this.width = 283.0,
      this.height = 30.0,
      this.active = true,
      this.color = AppColors.activeButtonColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.buttonWidgetPadding,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          onPrimary: active ? color : AppColors.inactiveButtonColor,
          minimumSize: Size(width, height),
          primary: active ? color : AppColors.inactiveButtonColor,
          // foregroundColor: active ? color : AppColors.inactiveButtonColor,
          shape: RoundedRectangleBorder(
            borderRadius: AppRadius.buttonWidgetRadius,
          ),
        ),
        onPressed: onPressed ?? () {},
        child: Text(
          text,
          style: AppTextStyles.buttonText.copyWith(
              color: active ? AppColors.whiteColor : AppColors.blackColor),
        ),
      ),
    );
  }
}
