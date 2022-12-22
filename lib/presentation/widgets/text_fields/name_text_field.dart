import 'package:bingo_wholesale/const/all_const.dart';
import 'package:flutter/material.dart';

class NameTextField extends StatelessWidget {
  final String fieldName;
  final String hintText;
  final TextEditingController? controller;
  final bool isError;
  final bool obscureText;
  final bool readOnly;
  final bool isNumber;
  final bool enable;
  final int maxLine;
  NameTextField({
    Key? key,
    this.controller,
    this.fieldName = "",
    this.hintText = "",
    this.isError = false,
    this.obscureText = false,
    this.readOnly = false,
    this.isNumber = false,
    this.enable = true,
    this.maxLine = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            fieldName,
            style: AppTextStyles.successStyle
                .copyWith(color: AppColors.blackColor),
          ),
          10.0.giveHeight,
          SizedBox(
            height: 45.0 * maxLine - (30 * (maxLine - 1)),
            child: TextFormField(
              maxLines: maxLine,
              style: AppTextStyles.successStyle.copyWith(
                  color: enable ? AppColors.blackColor : AppColors.ashColor),
              enabled: enable,
              keyboardType:
                  isNumber ? TextInputType.number : TextInputType.text,
              readOnly: readOnly,
              obscureText: obscureText,
              decoration: enable
                  ? AppInputStyles.ashOutlineBorder.copyWith(hintText: hintText)
                  : AppInputStyles.ashOutlineBorderDisable,
              // decoration: AppInputStyles.ashOutlineBorder.copyWith(
              //     fillColor:
              //         enable ? AppColors.whiteColor : AppColors.disableColor),
              controller: controller,
            ),
          ),
        ],
      ),
    );
  }
}
