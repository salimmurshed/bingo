import 'package:bingo_wholesale/const/all_const.dart';import 'package:flutter/material.dart';class NameTextField extends StatelessWidget {  final String fieldName;  final TextEditingController? controller;  final bool isError;  final bool obscureText;  final bool readOnly;  NameTextField({    Key? key,    this.controller,    this.fieldName = "",    this.isError = false,    this.obscureText = false,    this.readOnly = false,  }) : super(key: key);  @override  Widget build(BuildContext context) {    return SizedBox(      child: Column(        crossAxisAlignment: CrossAxisAlignment.start,        children: [          Text(            fieldName,            style: AppTextStyles.successStyle.copyWith(                color: !isError ? AppColors.fontBlack : AppColors.fontRed),          ),          10.0.giveHeight,          SizedBox(            height: 45.0,            child: TextFormField(              readOnly: readOnly,              obscureText: obscureText,              decoration: AppInputStyles.ashOutlineBorder,              controller: controller,            ),          ),        ],      ),    );  }}