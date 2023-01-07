import 'package:bingo_wholesale/const/all_const.dart';
import 'package:bingo_wholesale/const/app_sizes/app_icon_sizes.dart';
import 'package:bingo_wholesale/data_models/models/all_sales_model/all_sales_model.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRAlertDialog extends StatelessWidget {
  String data;
  QRAlertDialog(this.allSalesData, {Key? key, this.data = ""})
      : super(key: key);
  AllSalesData allSalesData;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: InkWell(
              child: Icon(
                Icons.close_rounded,
                size: AppIconSizes.s10,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              AppString.offlineApprove,
              style: AppTextStyles.statusCardTitle
                  .copyWith(fontSize: AppFontSize.s13),
            ),
          ),
        ],
      ),
      content: SizedBox(
        width: 200.0,
        height: 200.0,
        child: Center(
          child: QrImage(
            data: allSalesData.toString(),
            version: QrVersions.auto,
            size: 200.0,
          ),
        ),
      ),
    );
  }
}
