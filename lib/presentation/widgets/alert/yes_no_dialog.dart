import 'package:bingo_wholesale/const/all_const.dart';
import 'package:bingo_wholesale/presentation/widgets/buttons/submit_button.dart';
import 'package:flutter/material.dart';

class YesNoDialog extends StatelessWidget {
  final String title;
  final String content;
  final String submitButtonText;
  YesNoDialog(
      {this.title = "", this.content = "", this.submitButtonText = "Submit"});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SubmitButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              color: submitButtonText == AppString.reject
                  ? AppColors.statusVerified
                  : AppColors.statusReject,
              text: AppString.cancelButton.toUpperCase(),
              width: 30.0.wp,
            ),
            SubmitButton(
              color: submitButtonText == AppString.reject
                  ? AppColors.statusReject
                  : AppColors.statusVerified,
              onPressed: () {
                Navigator.pop(context, true);
              },
              text: submitButtonText.toUpperCase(),
              width: 30.0.wp,
            ),
          ],
        ),
      ],
    );
  }
}
