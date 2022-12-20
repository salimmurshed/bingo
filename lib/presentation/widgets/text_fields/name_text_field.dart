import 'package:bingo_wholesale/const/all_const.dart';
import 'package:flutter/material.dart';

class NameTextField extends StatelessWidget {
  final String fieldName;
  final TextEditingController? controller;
  final bool isError;
  final bool obscureText;
  final bool readOnly;
  final bool isNumber;
  final bool enable;
  NameTextField({
    Key? key,
    this.controller,
    this.fieldName = "",
    this.isError = false,
    this.obscureText = false,
    this.readOnly = false,
    this.isNumber = false,
    this.enable = true,
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
            height: 45.0,
            child: TextFormField(
              style: AppTextStyles.successStyle.copyWith(
                  color: enable ? AppColors.blackColor : AppColors.ashColor),
              enabled: enable,
              keyboardType:
                  isNumber ? TextInputType.number : TextInputType.text,
              readOnly: readOnly,
              obscureText: obscureText,
              decoration: AppInputStyles.ashOutlineBorder.copyWith(
                  fillColor:
                      enable ? AppColors.whiteColor : AppColors.ashColor),
              controller: controller,
            ),
          ),
        ],
      ),
    );
  }
}
