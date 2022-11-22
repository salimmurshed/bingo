import 'package:auto_size_text/auto_size_text.dart';import 'package:bingo_wholesale/const/allConst.dart';import 'package:bingo_wholesale/const/utils.dart';import 'package:flutter/material.dart';class StatusCardFourPart extends StatelessWidget {  StatusCardFourPart({    this.title = "",    this.subTitle = '',    this.status = '',    this.bodyFirstKey = '',    this.bodyFirstValue = '',    this.bodySecondKey = '',    this.bodySecondValue = '',  });  String title;  String subTitle;  String status;  String bodyFirstKey;  String bodyFirstValue;  String bodySecondKey;  String bodySecondValue;  @override  Widget build(BuildContext context) {    return Card(      child: Container(        color: AppColors.cardColor,        // height: subTitle.isNotEmpty ? 125.0 : 100.0,        width: 377.0,        child: Padding(          padding: const EdgeInsets.fromLTRB(26.0, 16.0, 16.0, 16.0),          child: Column(            mainAxisAlignment: MainAxisAlignment.spaceBetween,            children: [              Row(                mainAxisAlignment: MainAxisAlignment.spaceBetween,                crossAxisAlignment: CrossAxisAlignment.start,                children: [                  Column(                    crossAxisAlignment: CrossAxisAlignment.start,                    children: [                      SizedBox(                        width: 200,                        child: AutoSizeText(                          title,                          maxLines: 2,                          style: TextStyles.statusCardTitle,                        ),                      ),                      if (subTitle.isNotEmpty)                        Text(                          subTitle,                          maxLines: 2,                          style: TextStyles.statusCardSubTitle,                        ),                    ],                  ),                  SizedBox(                    width: 120.0,                    child: Row(                      mainAxisAlignment: MainAxisAlignment.end,                      children: [                        statusWidget(                          color: AppColors.statusProgress,                          text: "",                        ),                        Flexible(                          child: Text(                            status,                            maxLines: 2,                            style: TextStyles.statusCardStatus                                .copyWith(color: AppColors.statusProgress),                          ),                        ),                      ],                    ),                  ),                ],              ),              SizedBox(                height: 4.0,              ),              Row(                mainAxisAlignment: MainAxisAlignment.spaceBetween,                children: [                  SizedBox(                      width: 180.0,                      child: Column(                        crossAxisAlignment: CrossAxisAlignment.start,                        children: [                          bodyFirstKey.isEmpty                              ? SizedBox()                              : getNiceText(bodyFirstKey),                          bodyFirstValue.isEmpty                              ? SizedBox()                              : getNiceText(bodyFirstValue),                          // Text(                          //   bodyFirstKey,                          //   style: TextStyles.bottomTexts,                          // ),                          // Text(                          //   bodyFirstValue,                          //   style: TextStyles.bottomTexts.copyWith(                          //       fontWeight: AppFontWeighs.regular),                          // ),                        ],                      )),                  SizedBox(                    width: 120.0,                    child: Column(                      crossAxisAlignment: CrossAxisAlignment.start,                      children: [                        bodySecondKey.isEmpty                            ? SizedBox()                            : getNiceText(bodySecondKey),                        bodySecondValue.isEmpty                            ? SizedBox()                            : getNiceText(bodySecondValue),                        // Text(                        //   bodySecondKey,                        //   style: TextStyles.bottomTexts,                        // ),                        // Text(                        //   bodySecondValue,                        //   style: TextStyles.bottomTexts                        //       .copyWith(fontWeight: AppFontWeighs.regular),                        // ),                      ],                    ),                  ),                ],              )            ],          ),        ),      ),    );  }}