import 'package:auto_size_text/auto_size_text.dart';import 'package:bingo_wholesale/const/all_const.dart';import 'package:bingo_wholesale/const/app_styles/app_box_decoration.dart';import 'package:bingo_wholesale/const/utils.dart';import 'package:flutter/material.dart';class StatusCard extends StatelessWidget {  StatusCard({    this.title = "",    this.subTitle = '',    this.status = '',    this.bodyFirstKey = '',    this.bodyFirstValue = '',    this.bodySecondKey = '',    this.bodySecondValue = '',    this.onTap,  });  String title;  String subTitle;  String status;  String bodyFirstKey;  String bodyFirstValue;  String bodySecondKey;  String bodySecondValue;  Function()? onTap;  @override  Widget build(BuildContext context) {    return Container(      margin: EdgeInsets.symmetric(vertical: 8.0),      decoration:          AppBoxDecoration.shadowBox.copyWith(color: AppColors.cardColor),      width: 377.0,      child: Material(          shape: RoundedRectangleBorder(            borderRadius: BorderRadius.circular(12), // <-- Radius          ),          child: InkWell(            onTap: onTap ?? () {},            child: Padding(              padding: const EdgeInsets.fromLTRB(26.0, 16.0, 16.0, 16.0),              child: Column(                mainAxisAlignment: MainAxisAlignment.spaceBetween,                children: [                  Row(                    mainAxisAlignment: MainAxisAlignment.spaceBetween,                    crossAxisAlignment: CrossAxisAlignment.start,                    children: [                      Column(                        crossAxisAlignment: CrossAxisAlignment.start,                        children: [                          SizedBox(                            width: 200,                            child: AutoSizeText(                              title,                              maxLines: 2,                              style: AppTextStyles.statusCardTitle,                            ),                          ),                          if (subTitle.isNotEmpty)                            Text(                              subTitle,                              maxLines: 2,                              style: AppTextStyles.statusCardSubTitle,                            ),                        ],                      ),                      SizedBox(                        width: 120.0,                        child: Row(                          mainAxisAlignment: MainAxisAlignment.end,                          children: [                            statusWidget(                              color: AppColors.statusProgress,                              text: "",                            ),                            Flexible(                              child: Text(                                status,                                maxLines: 2,                                style: AppTextStyles.statusCardStatus                                    .copyWith(color: AppColors.statusProgress),                              ),                            ),                          ],                        ),                      ),                    ],                  ),                  12.0.giveHeight,                  Row(                    mainAxisAlignment: MainAxisAlignment.spaceBetween,                    children: [                      SizedBox(                          width: 180.0,                          child: Column(                            crossAxisAlignment: CrossAxisAlignment.start,                            children: [                              Text(                                bodyFirstKey,                                style: AppTextStyles.bottomTexts,                              ),                              Text(                                bodyFirstValue,                                style: AppTextStyles.bottomTexts.copyWith(                                    fontWeight: AppFontWeighs.regular),                              ),                            ],                          )),                      SizedBox(                        width: 120.0,                        child: Column(                          crossAxisAlignment: CrossAxisAlignment.start,                          children: [                            Text(                              bodySecondKey,                              style: AppTextStyles.bottomTexts,                            ),                            Text(                              bodySecondValue,                              style: AppTextStyles.bottomTexts                                  .copyWith(fontWeight: AppFontWeighs.regular),                            ),                          ],                        ),                      ),                    ],                  )                ],              ),            ),          )),    );  }}