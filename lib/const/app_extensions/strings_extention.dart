import 'package:flutter/material.dart';

import '../utils.dart';

extension ConvertRequired on String {
  String get isRequired => "${this} *";
}

extension ValidationWidget on String {
  Widget validate() {
    return isNotEmpty ? validationText(this) : const SizedBox();
  }
}
