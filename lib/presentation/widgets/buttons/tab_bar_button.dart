import 'package:bingo_wholesale/const/all_const.dart';
import 'package:bingo_wholesale/const/app_sizes/app_sizes.dart';
import 'package:flutter/material.dart';

class TabBarButton extends StatelessWidget {
  final bool active;
  final String text;
  final double width;
  final double height;
  final Color color;
  const TabBarButton(
      {this.text = "",
      this.width = 283.0,
      this.height = 30.0,
      this.active = true,
      this.color = AppColors.activeButtonColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.buttonWidgetPadding,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: active ? color : AppColors.inactiveButtonColor,
          borderRadius: AppRadius.buttonWidgetRadius,
        ),
        child: Center(
            child: Text(
          text,
          style: AppTextStyles.buttonText.copyWith(
              color: active ? AppColors.whiteColor : AppColors.blackColor),
        )),
      ),
    );
  }
}
