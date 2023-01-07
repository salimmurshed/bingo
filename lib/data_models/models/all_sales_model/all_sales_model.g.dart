// // GENERATED CODE - DO NOT MODIFY BY HAND
//
// part of 'all_sales_model.dart';
//
// // **************************************************************************
// // JsonSerializableGenerator
// // **************************************************************************
//
// AllSalesModel _$AllSalesModelFromJson(Map<String, dynamic> json) =>
//     AllSalesModel(
//       success: json['success'] as bool?,
//       message: json['message'] as String?,
//       data: (json['data'] as List<dynamic>?)
//           ?.map((e) => AllSalesData.fromJson(e as Map<String, dynamic>))
//           .toList(),
//     );
//
// Map<String, dynamic> _$AllSalesModelToJson(AllSalesModel instance) {
//   final val = <String, dynamic>{};
//
//   void writeNotNull(String key, dynamic value) {
//     if (value != null) {
//       val[key] = value;
//     }
//   }
//
//   writeNotNull('success', instance.success);
//   writeNotNull('message', instance.message);
//   writeNotNull('data', instance.data?.map((e) => e.toJson()).toList());
//   return val;
// }
//
// AllSalesData _$AllSalesDataFromJson(Map<String, dynamic> json) => AllSalesData(
//       bpIdR: json['bp_id_r'] as String? ?? '',
//       internalId: json['internal_id'] as String? ?? '',
//       associationUniqueId: json['association_unique_id'] as String? ?? '',
//       retailerName: json['retailer_name'] as String? ?? '',
//       storeList: (json['store_list'] as List<dynamic>?)
//               ?.map((e) => StoreList.fromJson(e as Map<String, dynamic>))
//               .toList() ??
//           [],
//       isOnline: json['is_online'] as int? ?? 1,
//     );
//
// Map<String, dynamic> _$AllSalesDataToJson(AllSalesData instance) {
//   final val = <String, dynamic>{};
//
//   void writeNotNull(String key, dynamic value) {
//     if (value != null) {
//       val[key] = value;
//     }
//   }
//
//   writeNotNull('bp_id_r', instance.bpIdR);
//   writeNotNull('internal_id', instance.internalId);
//   writeNotNull('association_unique_id', instance.associationUniqueId);
//   writeNotNull('retailer_name', instance.retailerName);
//   writeNotNull(
//       'store_list', instance.storeList?.map((e) => e.toJson()).toList());
//   writeNotNull('is_online', instance.isOnline);
//   return val;
// }
//
// StoreList _$StoreListFromJson(Map<String, dynamic> json) => StoreList(
//       storeId: json['store_id'] as String? ?? '',
//       name: json['name'] as String? ?? '',
//       city: json['city'] as String? ?? '',
//       address: json['address'] as String? ?? '',
//       associationId: json['associationId'] as String? ?? '',
//       saleType: json['sale_type'] as String? ?? '',
//       creditlineId: json['creditline_id'] as String? ?? '',
//       approvedCreditLineCurrency:
//           json['approved_credit_line_currency'] as String? ?? '',
//       availableAmount: (json['available_amount'] as num?)?.toDouble() ?? 0.0,
//     );
//
// Map<String, dynamic> _$StoreListToJson(StoreList instance) {
//   final val = <String, dynamic>{};
//
//   void writeNotNull(String key, dynamic value) {
//     if (value != null) {
//       val[key] = value;
//     }
//   }
//
//   writeNotNull('store_id', instance.storeId);
//   writeNotNull('name', instance.name);
//   writeNotNull('city', instance.city);
//   writeNotNull('address', instance.address);
//   writeNotNull('associationId', instance.associationId);
//   writeNotNull('sale_type', instance.saleType);
//   writeNotNull('creditline_id', instance.creditlineId);
//   writeNotNull(
//       'approved_credit_line_currency', instance.approvedCreditLineCurrency);
//   writeNotNull('available_amount', instance.availableAmount);
//   return val;
// }
