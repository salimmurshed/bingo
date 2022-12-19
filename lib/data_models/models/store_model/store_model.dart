import 'package:json_annotation/json_annotation.dart';
part 'store_model.g.dart';

@JsonSerializable(explicitToJson: true)
class StoreModel {
  bool? success;
  String? message;
  List<StoreData>? data;

  StoreModel({this.success, this.message, this.data});

  factory StoreModel.fromJson(Map<String, dynamic> json) =>
      _$StoreModelFromJson(json);
  Map<String, dynamic> toJson() => _$StoreModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class StoreData {
  @JsonKey(name: "unique_id")
  String? uniqueId;
  @JsonKey(defaultValue: '', name: "name")
  String? name;
  @JsonKey(defaultValue: '', name: "city")
  String? city;
  @JsonKey(defaultValue: '', name: "address")
  String? address;
  @JsonKey(defaultValue: '', name: "remarks")
  String? remarks;
  @JsonKey(defaultValue: '', name: "status")
  String? status;

  StoreData(
      {this.uniqueId,
      this.name,
      this.city,
      this.address,
      this.remarks,
      this.status});

  factory StoreData.fromJson(Map<String, dynamic> json) =>
      _$StoreDataFromJson(json);
  Map<String, dynamic> toJson() => _$StoreDataToJson(this);
}
