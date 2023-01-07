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
            color: AppColors.statusProgress,
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
      case StatusNames.accepted:
        return statusWidget(
            text: "Accepted",
            color: AppColors.statusConfirmed,
            textStyle: textStyle,
            isIconAvailable: isIconAvailable);
      case StatusNames.onEvaluationAssociationPending:
        return statusWidget(
            text: "On Evaluation/\nAssociation Pending",
            color: AppColors.statusConfirmed,
            textStyle: textStyle,
            isIconAvailable: isIconAvailable);
      case StatusNames.pendingFieForward:
        return statusWidget(
            text: "Pending FIE Forward",
            color: AppColors.statusConfirmed,
            textStyle: textStyle,
            isIconAvailable: isIconAvailable);
      case StatusNames.onEvaluation:
        return statusWidget(
            text: "On Evaluation",
            color: AppColors.statusProgress,
            textStyle: textStyle,
            isIconAvailable: isIconAvailable);
      case StatusNames.waitingReply:
        return statusWidget(
            text: "Waiting Reply",
            color: AppColors.statusProgress,
            textStyle: textStyle,
            isIconAvailable: isIconAvailable);
      case StatusNames.error:
        return statusWidget(
            text: "error",
            color: AppColors.statusError,
            textStyle: textStyle,
            isIconAvailable: isIconAvailable);
      case StatusNames.fieQueue:
        return statusWidget(
            text: "FIE queue",
            color: AppColors.statusConfirmed,
            textStyle: textStyle,
            isIconAvailable: isIconAvailable);
      case StatusNames.associationPendingFieQueue:
        return statusWidget(
            text: "Association Pending/\nFIE Queue",
            color: AppColors.statusConfirmed,
            textStyle: textStyle,
            isIconAvailable: isIconAvailable);
      case StatusNames.waitingReplyAssociationPending:
        return statusWidget(
            text: "Waiting Reply/Association Pending",
            color: AppColors.statusConfirmed,
            textStyle: textStyle,
            isIconAvailable: isIconAvailable);
      case StatusNames.approved:
        return statusWidget(
            text: "Approved",
            color: AppColors.statusVerified,
            textStyle: textStyle,
            isIconAvailable: isIconAvailable);
      case StatusNames.associationPendingRecommended:
        return statusWidget(
            text: "Association Pending/Recommended",
            color: AppColors.statusProgress,
            textStyle: textStyle,
            isIconAvailable: isIconAvailable);
      case StatusNames.inactive:
        return statusWidget(
            text: "Inactive",
            color: AppColors.statusReject,
            textStyle: textStyle,
            isIconAvailable: isIconAvailable);
      case StatusNames.recommended:
        return statusWidget(
            text: "Recommended",
            color: AppColors.statusRecommended,
            textStyle: textStyle,
            isIconAvailable: isIconAvailable);
      case StatusNames.formalized:
        return statusWidget(
            text: "Formalized",
            color: AppColors.statusProgress,
            textStyle: textStyle,
            isIconAvailable: isIconAvailable);
      default:
        return statusWidget(
            text: "Error",
            color: AppColors.ashColor,
            textStyle: textStyle,
            isIconAvailable: isIconAvailable);
    }
  }
}

class StatusArgument {
  String title;
  Color color;
  StatusArgument({this.title = "", this.color = AppColors.ashColor});
}

extension StatusExtensionFromInt on int {
  Widget toStatusFromInt(
      {bool isIconAvailable = true,
      TextStyle textStyle = AppTextStyles.statusCardStatus,
      required String value}) {
    switch (this) {
      case 0:
        return statusWidget(
            text: value,
            color: AppColors.statusConfirmed,
            textStyle: textStyle,
            isIconAvailable: isIconAvailable);
      case 1:
        return statusWidget(
            text: value,
            color: AppColors.statusConfirmed,
            textStyle: textStyle,
            isIconAvailable: isIconAvailable);
      case 2:
        return statusWidget(
            text: value,
            color: AppColors.statusProgress,
            textStyle: textStyle,
            isIconAvailable: isIconAvailable);
      case 3:
        return statusWidget(
            text: value,
            color: AppColors.statusConfirmed,
            textStyle: textStyle,
            isIconAvailable: isIconAvailable);
      case 4:
        return statusWidget(
            text: value,
            color: AppColors.statusProgress,
            textStyle: textStyle,
            isIconAvailable: isIconAvailable);
      case 5:
        return statusWidget(
            text: value,
            color: AppColors.statusProgress,
            textStyle: textStyle,
            isIconAvailable: isIconAvailable);
      case 6:
        return statusWidget(
            text: value,
            color: AppColors.statusReject,
            textStyle: textStyle,
            isIconAvailable: isIconAvailable);
      case 7:
        return statusWidget(
            text: value,
            color: AppColors.statusConfirmed,
            textStyle: textStyle,
            isIconAvailable: isIconAvailable);
      case 8:
        return statusWidget(
            text: value,
            color: AppColors.statusProgress,
            textStyle: textStyle,
            isIconAvailable: isIconAvailable);
      case 9:
        return statusWidget(
            text: value,
            color: AppColors.statusProgress,
            textStyle: textStyle,
            isIconAvailable: isIconAvailable);
      case 10:
        return statusWidget(
            text: value,
            color: AppColors.statusProgress,
            textStyle: textStyle,
            isIconAvailable: isIconAvailable);
      case 11:
        return statusWidget(
            text: value,
            color: AppColors.statusConfirmed,
            textStyle: textStyle,
            isIconAvailable: isIconAvailable);
      case 12:
        return statusWidget(
            text: value,
            color: AppColors.statusConfirmed,
            textStyle: textStyle,
            isIconAvailable: isIconAvailable);
      case 13:
        return statusWidget(
            text: value,
            color: AppColors.statusVerified,
            textStyle: textStyle,
            isIconAvailable: isIconAvailable);
      case 14:
        return statusWidget(
            text: value,
            color: AppColors.statusVerified,
            textStyle: textStyle,
            isIconAvailable: isIconAvailable);

      default:
        return statusWidget(
            text: "Error",
            color: AppColors.ashColor,
            textStyle: textStyle,
            isIconAvailable: isIconAvailable);
    }
  }
}

extension CardStatusExtensionFromInt on int {
  Widget toCardStatusFromInt(
      {bool isIconAvailable = true,
      TextStyle textStyle = AppTextStyles.statusCardStatus,
      required String value}) {
    switch (this) {
      case 0:
        return statusWidget(
            text: value,
            color: AppColors.statusReject,
            textStyle: textStyle,
            isIconAvailable: isIconAvailable);
      case 1:
        return statusWidget(
            text: value,
            color: AppColors.statusVerified,
            textStyle: textStyle,
            isIconAvailable: isIconAvailable);
      case 2:
        return statusWidget(
            text: value,
            color: AppColors.statusReject,
            textStyle: textStyle,
            isIconAvailable: isIconAvailable);
      case 3:
        return statusWidget(
            text: value,
            color: AppColors.statusConfirmed,
            textStyle: textStyle,
            isIconAvailable: isIconAvailable);

      default:
        return statusWidget(
            text: "Error",
            color: AppColors.ashColor,
            textStyle: textStyle,
            isIconAvailable: isIconAvailable);
    }
  }
}

extension SalesStatus on int {
  Widget toSaleStatus(
      {bool isIconAvailable = true,
      String text = "",
      TextStyle textStyle = AppTextStyles.statusCardStatus}) {
    switch (this) {
      case 0:
        return statusWidget(
            text: text,
            color: AppColors.statusReject,
            textStyle: textStyle,
            isIconAvailable: isIconAvailable);

      case 1:
        return statusWidget(
            text: text,
            color: AppColors.statusVerified,
            textStyle: textStyle,
            isIconAvailable: isIconAvailable);
      case 2:
        return statusWidget(
            text: text,
            color: AppColors.statusVerified,
            textStyle: textStyle,
            isIconAvailable: isIconAvailable);
      case 3:
        return statusWidget(
            text: text,
            color: AppColors.statusVerified,
            textStyle: textStyle,
            isIconAvailable: isIconAvailable);
      case 4:
        return statusWidget(
            text: text,
            color: AppColors.statusConfirmed,
            textStyle: textStyle,
            isIconAvailable: isIconAvailable);
      case 5:
        return statusWidget(
            text: text,
            color: AppColors.statusReject,
            textStyle: textStyle,
            isIconAvailable: isIconAvailable);
      case 6:
        return statusWidget(
            text: text,
            color: AppColors.statusVerified,
            textStyle: textStyle,
            isIconAvailable: isIconAvailable);
      case 7:
        return statusWidget(
            text: text,
            color: AppColors.statusProgress,
            textStyle: textStyle,
            isIconAvailable: isIconAvailable);
      case 8:
        return statusWidget(
            text: text,
            color: AppColors.statusVerified,
            textStyle: textStyle,
            isIconAvailable: isIconAvailable);

      default:
        return statusWidget(
            text: "Error",
            color: AppColors.ashColor,
            textStyle: textStyle,
            isIconAvailable: isIconAvailable);
    }
  }
}
