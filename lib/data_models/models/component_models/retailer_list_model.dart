class RetailerListModel {
  bool? success;
  String? message;
  List<RetailerListData>? data;

  RetailerListModel({this.success, this.message, this.data});

  RetailerListModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <RetailerListData>[];
      json['data'].forEach((v) {
        data!.add(new RetailerListData.fromJson(v));
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

class RetailerListData {
  String? bpIdR;
  String? internalId;
  String? associationUniqueId;
  String? retailerName;

  RetailerListData(
      {this.bpIdR,
      this.internalId,
      this.associationUniqueId,
      this.retailerName});

  RetailerListData.fromJson(Map<String, dynamic> json) {
    bpIdR = json['bp_id_r'] ?? "";
    internalId = json['internal_id'] ?? "";
    associationUniqueId = json['association_unique_id'] ?? "";
    retailerName = json['retailer_name'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bp_id_r'] = this.bpIdR;
    data['internal_id'] = this.internalId;
    data['association_unique_id'] = this.associationUniqueId;
    data['retailer_name'] = this.retailerName;
    return data;
  }
}
