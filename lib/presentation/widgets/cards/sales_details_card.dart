import 'package:bingo_wholesale/const/all_const.dart';
import 'package:flutter/material.dart';

import '../../../const/utils.dart';

class SalesDetails extends StatelessWidget {
  SalesDetails({Key? key, required this.data}) : super(key: key);
  List<String> data;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.0.wp - 100,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (int i = 0; i < data.length; i++)
            getNiceText(data[i], style: AppTextStyles.dashboardHeadTitle),
        ],
      ),
    );
  }
}
