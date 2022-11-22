// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data?.toJson(),
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      uniqueId: json['unique_id'] as String?,
      name: json['name'] as String?,
      enrollmentType: json['enrollment_type'] as String?,
      country: json['country'] as String?,
      deviceType: json['device_type'] as String?,
      deviceToken: json['device_token'] as String?,
      latitude: json['latitude'] as String? ?? '0',
      longitude: json['longitude'] as String? ?? '0',
      notificationOnOff: json['notification_on_off'] as int?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'unique_id': instance.uniqueId,
      'name': instance.name,
      'enrollment_type': instance.enrollmentType,
      'country': instance.country,
      'device_type': instance.deviceType,
      'device_token': instance.deviceToken,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'notification_on_off': instance.notificationOnOff,
      'token': instance.token,
    };
