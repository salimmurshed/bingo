import 'package:bingo_wholesale/const/all_const.dart';
import 'package:bingo_wholesale/const/app_extensions/widgets_extensions.dart';
import 'package:bingo_wholesale/const/app_sizes/app_icon_sizes.dart';
import 'package:bingo_wholesale/const/app_sizes/app_sizes.dart';
import 'package:flutter/material.dart';

import '../../../const/app_font_manager.dart';
import '../../../const/app_strings.dart';
import '../../../const/app_styles/app_text_styles.dart';
import '../buttons/submit_button.dart';

class ActivationDialog extends StatelessWidget {
  ActivationDialog(
      {this.activationCode = "", Key? key, required this.isRetailer})
      : super(key: key);
  String activationCode;
  bool isRetailer;
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (!isRetailer) {
      textController.text = activationCode;
    }
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppString.activationCode.toUpperCamelCase(),
            style: AppTextStyles.dashboardHeadTitle.copyWith(
              fontWeight: AppFontWeighs.semiBold,
            ),
          ),
          Padding(
            padding: AppPaddings.activationDialogPadding,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.close_outlined,
                size: AppIconSizes.s12,
              ),
            ),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            maxLength: 6,
            keyboardType: TextInputType.number,
            controller: textController,
            decoration: AppInputStyles.blackOutlineBorder,
          ),
          27.0.giveHeight,
          isRetailer
              ? SubmitButton(
                  onPressed: () {
                    Navigator.pop(context, textController.text);
                  },
                  // onPressed: model.openActivationCodeDialog,
                  width: 209.0,
                  height: 45.0,
                  active: true,
                  text: AppString.submitButton,
                )
              : SubmitButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  // onPressed: model.openActivationCodeDialog,
                  width: 209.0,
                  height: 45.0,
                  active: true, // textController.text.trim().length == 6 ?
                  //true : false,
                  text: AppString.closeButton,
                )
        ],
      ),
    );
  }
}
