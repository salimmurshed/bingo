// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreModel _$StoreModelFromJson(Map<String, dynamic> json) => StoreModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => StoreData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StoreModelToJson(StoreModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };

StoreData _$StoreDataFromJson(Map<String, dynamic> json) => StoreData(
      uniqueId: json['unique_id'] as String?,
      name: json['name'] as String? ?? '',
      city: json['city'] as String? ?? '',
      address: json['address'] as String? ?? '',
      remarks: json['remarks'] as String? ?? '',
      status: json['status'] as String? ?? '',
    );

Map<String, dynamic> _$StoreDataToJson(StoreData instance) => <String, dynamic>{
      'unique_id': instance.uniqueId,
      'name': instance.name,
      'city': instance.city,
      'address': instance.address,
      'remarks': instance.remarks,
      'status': instance.status,
    };
