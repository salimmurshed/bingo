import 'package:bingo_wholesale/const/allConst.dart';import 'package:bingo_wholesale/presentation/ui/splash_screen/splash_screen_view_model.dart';import 'package:flutter/cupertino.dart';import 'package:flutter/material.dart';import 'package:stacked/stacked.dart';class SplashScreenView extends StatelessWidget {  @override  Widget build(BuildContext context) {    return ViewModelBuilder<SplashScreenViewModel>.reactive(        viewModelBuilder: () => SplashScreenViewModel(),        builder: (context, model, child) {          return Scaffold(            body: Center(              child: Image.asset(                AppAsset.loginLogo,                width: 70.0.wp,              ),            ),          );        });  }}