import 'package:bingo_wholesale/const/all_const.dart';
import 'package:flutter/material.dart';

class AlertDialogMessage extends StatelessWidget {
  final String error;
  const AlertDialogMessage(this.error);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Alert'),
      content: SingleChildScrollView(
        child: Text(error),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text(
            'Close',
            style: AppTextStyles.addRequestSubTitle,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
