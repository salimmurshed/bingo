import 'package:bingo_wholesale/const/app_assets.dart';import 'package:bingo_wholesale/const/app_colors.dart';import 'package:bingo_wholesale/const/app_extensions/widgets_extensions.dart';import '../../../const/app_sizes/app_sizes.dart';import 'package:bingo_wholesale/const/app_styles/app_text_styles.dart';import 'package:flutter/material.dart';import '../data_models/enums/status_name.dart';import 'app_font_manager.dart';statusWidget(    {Color color = AppColors.statusProgress,    String text = "",    bool isIconAvailable = true,    TextStyle textStyle = AppTextStyles.statusCardStatus}) {  return Row(    mainAxisSize: MainAxisSize.min,    crossAxisAlignment: CrossAxisAlignment.center,    mainAxisAlignment: MainAxisAlignment.end,    children: [      if (isIconAvailable)        Image.asset(          AppAsset.statusIcon,          color: color,        ),      Text(        text,        maxLines: 2,        textAlign: TextAlign.start,        style: textStyle.copyWith(color: color),      ),    ],  );}StatusNames statusNamesEnumFromServer(text) {  String newText = text.replaceAll("/", " ");  return convertToStatusNames(newText.toLowerCamelCase());}endOfData() {  return Padding(    padding: AppPaddings.endOfDataPadding,    child: Row(      children: const [        Expanded(            child: Divider(          color: AppColors.fontAsh,          indent: 20.0,          endIndent: 10.0,          thickness: .3,        )),        Text(          "end Of Page",          style: AppTextStyles.statusCardSubTitle,        ),        Expanded(          child: Divider(            color: AppColors.fontAsh,            indent: 10.0,            endIndent: 20.0,            thickness: .3,          ),        ),      ],    ),  );}getNiceText(String text,    {TextStyle style = AppTextStyles.dashboardHeadTitleAsh,    bool nxtln = false,    double padding = 0.0}) {  List<String> name = text.split(':');  String restTest() {    String sub = "";    for (int i = 1; i < name.length - 0; i++) {      sub = sub + name[i];      if (i < name.length - 1) sub = sub + ":";    }    return sub;  }  return text.isNotEmpty      ? Padding(          padding: EdgeInsets.symmetric(vertical: padding),          child: RichText(            text: TextSpan(              text: name[0] == "" ? "" : "${name[0]}:",              style: style,              children: <TextSpan>[                if (nxtln)                  const TextSpan(                    text: "\n",                  ),                TextSpan(                  text: restTest() == "" ? "" : restTest(),                  style: style.copyWith(fontWeight: AppFontWeighs.regular),                ),              ],            ),          ),        )      : SizedBox();}commonText(String text) {  return Padding(    padding: AppPaddings.screenARDSTextPaddingH,    child: Text(      text,      style: AppTextStyles.dashboardHeadTitle.copyWith(        fontWeight: AppFontWeighs.semiBold,      ),    ),  );}