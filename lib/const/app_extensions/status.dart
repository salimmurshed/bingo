import 'package:bingo_wholesale/const/all_const.dart';
import 'package:flutter/material.dart';

import '../../data_models/enums/status_name.dart';
import '../utils.dart';

extension StatusExtension on StatusNames {
  Widget toStatus(
      {bool isIconAvailable = true,
      TextStyle textStyle = AppTextStyles.statusCardStatus}) {
    switch (this) {
      case StatusNames.salePendingApproval:
        return statusWidget(
            text: "Sale Pending\n Approval",
            color: AppColors.statusReject,
            textStyle: textStyle,
            isIconAvailable: isIconAvailable);
      case StatusNames.completed:
        return statusWidget(
            text: "Complete",
            color: AppColors.statusVerified,
            textStyle: textStyle,
            isIconAvailable: isIconAvailable);
      case StatusNames.procesada:
        return statusWidget(
            text: "Procesada",
            color: AppColors.statusVerified,
            textStyle: textStyle,
            isIconAvailable: isIconAvailable);
      case StatusNames.saleApprovalDelivered:
        return statusWidget(
            text: "Sale Approval\n/Delivered".toLowerCase(),
            color: AppColors.statusVerified,
            textStyle: textStyle,
            isIconAvailable: isIconAvailable);
      case StatusNames.pending:
        return statusWidget(
            text: "Pending",
            color: AppColors.statusConfirmed,
            textStyle: textStyle,
            isIconAvailable: isIconAvailable);
      case StatusNames.rejected:
        return statusWidget(
            text: "Rejected",
            color: AppColors.statusReject,
            textStyle: textStyle,
            isIconAvailable: isIconAvailable);
      case StatusNames.active:
        return statusWidget(
            text: "Active",
            color: AppColors.statusVerified,
            textStyle: textStyle,
            isIconAvailable: isIconAvailable);
      case StatusNames.pendingWholesalerReview:
        return statusWidget(
            text: "Padding WholeSeller\n Review",
            color: AppColors.statusVerified,
            textStyle: textStyle,
            isIconAvailable: isIconAvailable);
      case StatusNames.inProcess:
        return statusWidget(
            text: "In Process",
            color: AppColors.statusVerified,
            textStyle: textStyle,
            isIconAvailable: isIconAvailable);
      case StatusNames.verified:
        return statusWidget(
            text: "Verified",
            color: AppColors.statusVerified,
            textStyle: textStyle,
            isIconAvailable: isIconAvailable);
      case StatusNames.processed:
        return statusWidget(
            text: "Processed",
            color: AppColors.statusVerified,
            textStyle: textStyle,
            isIconAvailable: isIconAvailable);

      default:
        return statusWidget(
            text: "Error",
            color: AppColors.fontAsh,
            textStyle: textStyle,
            isIconAvailable: isIconAvailable);
    }
  }
}

class StatusArgument {
  String title;
  Color color;
  StatusArgument({this.title = "", this.color = AppColors.fontAsh});
}
