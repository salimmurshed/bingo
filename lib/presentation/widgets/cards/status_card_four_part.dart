import 'package:auto_size_text/auto_size_text.dart';
import 'package:bingo_wholesale/const/utils.dart';
import 'package:flutter/material.dart';

import '../../../const/app_colors.dart';
import '../../../const/app_sizes/app_sizes.dart';
import '../../../const/app_styles/app_text_styles.dart';

class StatusCardFourPart extends StatelessWidget {
  const StatusCardFourPart({
    this.title = "",
    this.subTitle = '',
    this.status = '',
    this.statusChild,
    this.bodyFirstKey = '',
    this.bodyFirstValue = '',
    this.bodySecondKey = '',
    this.bodySecondValue = '',
  });

  final String title;

  final String subTitle;

  final String status;
  final Widget? statusChild;

  final String bodyFirstKey;
  final String bodyFirstValue;

  final String bodySecondKey;
  final String bodySecondValue;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        color: AppColors.cardColor,
        // height: subTitle.isNotEmpty ? 125.0 : 100.0,
        width: 377.0,
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
                  statusChild != null
                      ? statusChild!
                      : SizedBox(
                          width: 120.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              statusWidget(
                                color: AppColors.statusProgress,
                                text: "",
                              ),
                              Flexible(
                                child: Text(
                                  status,
                                  maxLines: 2,
                                  style: AppTextStyles.statusCardStatus
                                      .copyWith(
                                          color: AppColors.statusProgress),
                                ),
                              ),
                            ],
                          ),
                        ),
                ],
              ),
              SizedBox(
                height: 4.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 180.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        bodyFirstKey.isEmpty
                            ? SizedBox()
                            : getNiceText(bodyFirstKey),
                        bodyFirstValue.isEmpty
                            ? SizedBox()
                            : getNiceText(bodyFirstValue),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 120.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        bodySecondKey.isEmpty
                            ? SizedBox()
                            : getNiceText(bodySecondKey),
                        bodySecondValue.isEmpty
                            ? SizedBox()
                            : getNiceText(bodySecondValue),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
