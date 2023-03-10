import 'package:bingo_wholesale/const/app_sizes/app_icon_sizes.dart';
import 'package:bingo_wholesale/const/app_sizes/app_sizes.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ConnectivityService {
  Connectivity connectivity = Connectivity();
  connectionStream() {
    return StreamBuilder(
        stream: Connectivity().onConnectivityChanged,
        builder: (BuildContext context, snapshot) {
          var connectivityResult = snapshot.data;
          if (connectivityResult != null &&
              connectivityResult == ConnectivityResult.none) {
            return connectionWidget();
          } else {
            return Container();
          }
        });
  }

  connectionWidget() {
    // return Container();
    return Container(
      margin: AppMargins.connectionWidgetMargin,
      alignment: Alignment.centerLeft,
      height: 70.0,
      width: double.infinity,
      padding: AppPaddings.connectionWidgetPadding,
      decoration: BoxDecoration(
        borderRadius: AppRadius.connectionWidgetRadius,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              height: 30.0,
              width: 30.0,
              alignment: Alignment.center,
              child: Stack(
                children: [
                  Icon(
                    Icons.wifi_off,
                    color: Colors.white,
                    size: AppIconSizes.s28,
                  ),
                ],
              )),
          SizedBox(width: 15),
          const Flexible(
            child: Text(
              "Constants.message_no_net",
            ),
          )
        ],
      ),
    );
  }
}
