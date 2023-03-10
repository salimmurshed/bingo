import 'package:bingo_wholesale/const/all_const.dart';
import 'package:bingo_wholesale/const/utils.dart';
import 'package:flutter/material.dart';

import '../../../const/app_sizes/app_sizes.dart';

class AccountBalanceCard extends StatelessWidget {
  final String title;
  final List<String> subTitleList;

  const AccountBalanceCard({this.title = "", this.subTitleList = const []});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: AppMargins.accountBalanceCardMargin,
      padding: AppPaddings.accountBalanceCardPadding,
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: AppRadius.accountBalanceCardRadius,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getNiceText(title,
              style: AppTextStyles.statusCardTitle
                  .copyWith(fontWeight: AppFontWeighs.light)),
          if (subTitleList.isNotEmpty)
            Wrap(
              children: [
                for (int i = 0; i < subTitleList.length; i++)
                  SizedBox(
                    width: 40.0.wp,
                    child: getNiceText(subTitleList[i], nxtln: true),
                  ),
              ],
            )
        ],
      ),
    );
  }
}
