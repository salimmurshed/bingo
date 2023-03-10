import 'package:auto_size_text/auto_size_text.dart';
import 'package:bingo_wholesale/const/all_const.dart';
import 'package:bingo_wholesale/const/app_extensions/status.dart';
import '../../../const/app_sizes/app_sizes.dart';

import 'package:bingo_wholesale/const/app_styles/app_box_decoration.dart';
import 'package:flutter/material.dart';

class StatusCardCreditLine extends StatelessWidget {
  StatusCardCreditLine({
    Key? key,
    this.title = "",
    this.subTitle = '',
    this.status = 0,
    this.statusDescription = '',
    this.bodyFirstKey = '',
    this.bodyFirstValue = '',
    this.bodySecondKey = '',
    this.bodySecondValue = '',
    this.onTap,
  }) : super(key: key);

  final String title;

  final String subTitle;

  final int status;
  final String statusDescription;

  final String bodyFirstKey;
  final String bodyFirstValue;

  final String bodySecondKey;
  final String bodySecondValue;
  Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: AppMargins.statusCardMargin,
      decoration:
          AppBoxDecoration.shadowBox.copyWith(color: AppColors.cardColor),
      width: 377.0,
      child: Material(
          shape: RoundedRectangleBorder(
            borderRadius: AppRadius.statusCardMaterialRadius,
          ),
          child: InkWell(
            onTap: onTap ?? () {},
            child: Padding(
              padding: AppPaddings.statusCardLeftPadding,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 200,
                            child: AutoSizeText(
                              title,
                              maxLines: 2,
                              style: AppTextStyles.statusCardTitle,
                            ),
                          ),
                          if (subTitle.isNotEmpty)
                            Text(
                              subTitle,
                              maxLines: 2,
                              style: AppTextStyles.statusCardSubTitle,
                            ),
                        ],
                      ),
                      Flexible(
                        // width: 120.0,
                        child: status.toStatusFromInt(value: statusDescription),
                      ),
                    ],
                  ),
                  12.0.giveHeight,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: 180.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                bodyFirstKey,
                                style: AppTextStyles.bottomTexts,
                              ),
                              Text(
                                bodyFirstValue,
                                style: AppTextStyles.bottomTexts.copyWith(
                                    fontWeight: AppFontWeighs.regular),
                              ),
                            ],
                          )),
                      SizedBox(
                        width: 120.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              bodySecondKey,
                              style: AppTextStyles.bottomTexts,
                            ),
                            Text(
                              bodySecondValue,
                              style: AppTextStyles.bottomTexts
                                  .copyWith(fontWeight: AppFontWeighs.regular),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}
