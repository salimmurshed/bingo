class PricingGroupModel {
  bool? success;
  String? message;
  List<Data>? data;

  PricingGroupModel({this.success, this.message, this.data});

  PricingGroupModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? pricingGroups;

  Data({this.pricingGroups});

  Data.fromJson(Map<String, dynamic> json) {
    pricingGroups = json['pricing_groups'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pricing_groups'] = this.pricingGroups;
    return data;
  }
}
