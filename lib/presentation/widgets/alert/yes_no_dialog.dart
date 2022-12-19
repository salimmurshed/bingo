import 'package:bingo_wholesale/const/all_const.dart';
import 'package:bingo_wholesale/presentation/widgets/buttons/submit_button.dart';
import 'package:flutter/material.dart';

class YesNoDialog extends StatelessWidget {
  final String title;
  final String content;
  YesNoDialog({this.title = "", this.content = ""});

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
              color: AppColors.statusReject,
              text: AppString.cancelButton.toUpperCase(),
              width: 30.0.wp,
            ),
            SubmitButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              text: AppString.submitButton.toUpperCase(),
              width: 30.0.wp,
            ),
          ],
        ),
      ],
    );
  }
}
