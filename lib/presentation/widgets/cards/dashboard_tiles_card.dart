import 'package:auto_size_text/auto_size_text.dart';
import 'package:bingo_wholesale/const/all_const.dart';
import '../../../const/app_sizes/app_sizes.dart';
import 'package:flutter/material.dart';

class DashboardTilesCard extends StatelessWidget {
  final Color color;
  final String icon;
  final String amount;
  final String title;
  const DashboardTilesCard(
      {Key? key,
      this.color = AppColors.fontAsh,
      this.icon = "assets/icons/ic_allocated_order.png",
      this.amount = "\$45,445.90",
      this.title = "Allocated Credits"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 150.0,
        width: 176.0,
        decoration: BoxDecoration(
          borderRadius: AppRadius.dashboardTilesCardRadius,
          color: color,
        ),
        child: Stack(
          children: [
            Padding(
              padding: AppPaddings.dashboardTilesCardPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    icon,
                    width: 27.0,
                    height: 40.0,
                  ),
                  Padding(
                    padding: AppPaddings.dashboardTilesCardAmountPadding,
                    child: AutoSizeText(
                      amount,
                      maxLines: 1,
                      style: AppTextStyles.cartAmountText,
                    ),
                  ),
                  AutoSizeText(
                    title,
                    maxLines: 1,
                    style: AppTextStyles.cartTitleText,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 20.0,
              left: 48.0,
              child: Image.asset(
                AppAsset.cardShade,
                height: 192.0,
                width: 192.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
