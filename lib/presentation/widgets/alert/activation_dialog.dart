import 'package:bingo_wholesale/const/all_const.dart';import 'package:bingo_wholesale/const/app_sizes/app_icon_sizes.dart';import 'package:bingo_wholesale/const/app_sizes/app_sizes.dart';import 'package:flutter/material.dart';import '../../../const/app_font_manager.dart';import '../../../const/app_strings.dart';import '../../../const/app_styles/app_text_styles.dart';import '../buttons/submit_button.dart';class ActivationDialog extends StatelessWidget {  ActivationDialog({this.activationCode = "", Key? key}) : super(key: key);  String activationCode;  TextEditingController textController = TextEditingController();  @override  Widget build(BuildContext context) {    textController.text = activationCode;    return AlertDialog(      title: Row(        mainAxisAlignment: MainAxisAlignment.spaceBetween,        children: [          Text(            "Activation Code",            style: AppTextStyles.dashboardHeadTitle.copyWith(              fontWeight: AppFontWeighs.semiBold,            ),          ),          Padding(            padding: AppPaddings.activationDialogPadding,            child: InkWell(              onTap: () {                Navigator.pop(context);              },              child: Icon(                Icons.close_outlined,                size: AppIconSizes.s12,              ),            ),          ),        ],      ),      content: Column(        mainAxisSize: MainAxisSize.min,        children: [          TextField(            controller: textController,            decoration: AppInputStyles.blackOutlineBorder,          ),          27.0.giveHeight,          SubmitButton(            // onPressed: model.openActivationCodeDialog,            width: 209.0,            height: 45.0,            active: true,            text: AppString.submitButton,          )        ],      ),    );  }}