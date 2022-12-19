import 'package:bingo_wholesale/const/all_const.dart';

import '../data_models/models/status_list_model.dart';

List<StatusListModel> statusList = [
  StatusListModel(
    text: "Active",
    color: AppColors.statusVerified,
  ),
  StatusListModel(
    text: "Sale Pending Approval",
    color: AppColors.statusReject,
  ),
  StatusListModel(
    text: "Pending Wholesaler Review",
    color: AppColors.statusProgress,
  ),
  StatusListModel(
    text: "Sale Pending Approval",
    color: AppColors.statusReject,
  ),
  StatusListModel(
    text: "Sale Approval",
    color: AppColors.statusVerified,
  ),
  StatusListModel(
    text: "Sale Delivered",
    color: AppColors.statusVerified,
  )
];
