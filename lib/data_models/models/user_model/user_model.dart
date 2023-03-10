import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserModel {
  bool? success;
  String? message;
  Data? data;

  UserModel({this.success, this.message, this.data});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Data {
  @JsonKey(name: "unique_id")
  String? uniqueId;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "enrollment_type")
  String? enrollmentType;
  @JsonKey(name: "country")
  String? country;
  @JsonKey(name: "device_type")
  String? deviceType;
  @JsonKey(name: "device_token")
  String? deviceToken;
  @JsonKey(defaultValue: '0', name: "latitude")
  String? latitude;
  @JsonKey(defaultValue: '0', name: "longitude")
  String? longitude;
  @JsonKey(name: "notification_on_off")
  int? notificationOnOff;
  @JsonKey(name: "token")
  String? token;

  Data(
      {this.uniqueId,
      this.name,
      this.enrollmentType,
      this.country,
      this.deviceType,
      this.deviceToken,
      this.latitude,
      this.longitude,
      this.notificationOnOff,
      this.token});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}
