import 'package:bingo_wholesale/const/all_const.dart';import 'package:bingo_wholesale/const/app_styles/app_box_decoration.dart';import 'package:flutter/material.dart';import 'package:shimmer/shimmer.dart';import '../../../const/app_sizes/app_sizes.dart';class SingleLineShimmerScreen extends StatelessWidget {  const SingleLineShimmerScreen({Key? key}) : super(key: key);  @override  Widget build(BuildContext context) {    return Padding(      padding: AppPaddings.screenARDSWidgetPadding,      child: SizedBox(        // margin: AppMargins.screenARDSWidgetMarginH,        // padding: AppPaddings.screenARDSWidgetInnerPadding,        width: 100.0.wp,        // height: 200.0,        child: Shimmer.fromColors(          baseColor: AppColors.shimmer1,          highlightColor: AppColors.shimmer2,          child: Container(            height: 20.0,            width: 100.0.wp,            decoration: AppBoxDecoration.shadowBox,            child: const Text(""),          ),        ),      ),    );  }}