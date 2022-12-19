import 'package:bingo_wholesale/const/all_const.dart';
import 'package:bingo_wholesale/const/app_sizes/app_sizes.dart';
import 'package:bingo_wholesale/const/app_styles/app_box_decoration.dart';
import 'package:flutter/material.dart';

class WithBorderText extends StatelessWidget {
  final String text1;
  final String text2;
  final bool isIcon;
  const WithBorderText(
      {this.text1 = "", this.text2 = "No Data", this.isIcon = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text1),
        15.0.giveHeight,
        Container(
          margin: AppPaddings.classifiedTextBottomPadding,
          padding: AppPaddings.withBorderTextBottomPaddingH,
          height: 45.0,
          decoration: AppBoxDecoration.borderDecoration,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text2),
              !isIcon ? SizedBox() : Icon(Icons.arrow_drop_down_rounded),
            ],
          ),
        ),
      ],
    );
  }
}
