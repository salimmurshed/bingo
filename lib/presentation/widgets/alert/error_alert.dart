import 'package:flutter/material.dart';

import '../../../data_models/models/failure.dart';

class ErrorAlert extends StatelessWidget {
  final Failure error;
  const ErrorAlert(this.error);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(error.code.toString()),
      content: SingleChildScrollView(
        child: Text(error.message),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Approve'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
