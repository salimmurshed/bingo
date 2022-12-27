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
        data!.add(RetailerListData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
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
  List<StoreList>? storeList;

  RetailerListData(
      {this.bpIdR,
      this.internalId,
      this.associationUniqueId,
      this.retailerName,
      this.storeList});

  RetailerListData.fromJson(Map<String, dynamic> json) {
    bpIdR = json['bp_id_r'] ?? "";
    internalId = json['internal_id'] ?? "";
    associationUniqueId = json['association_unique_id'] ?? "";
    retailerName = json['retailer_name'] ?? "";
    if (json['store_list'] != null) {
      storeList = <StoreList>[];
      json['store_list'].forEach((v) {
        storeList!.add(StoreList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bp_id_r'] = bpIdR;
    data['internal_id'] = internalId;
    data['association_unique_id'] = associationUniqueId;
    data['retailer_name'] = retailerName;
    if (storeList != null) {
      data['store_list'] = storeList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StoreList {
  String? storeId;
  String? name;
  String? city;
  String? address;
  String? associationId;
  String? saleType;
  String? creditlineId;
  String? approvedCreditLineCurrency;
  double? availableAmount;

  StoreList(
      {this.storeId,
      this.name,
      this.city,
      this.address,
      this.associationId,
      this.saleType,
      this.creditlineId,
      this.approvedCreditLineCurrency,
      this.availableAmount});

  StoreList.fromJson(Map<String, dynamic> json) {
    storeId = json['store_id'] ?? "";
    name = json['name'] ?? "";
    city = json['city'] ?? "";
    address = json['address'] ?? "";
    associationId = json['associationId'] ?? "";
    saleType = json['sale_type'] ?? "";
    creditlineId = json['creditline_id'] ?? "";
    approvedCreditLineCurrency = json['approved_credit_line_currency'] ?? "";
    availableAmount =
        json['available_amount'] == 0 ? 0.0 : json['available_amount'] ?? 0.0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['store_id'] = storeId;
    data['name'] = name;
    data['city'] = city;
    data['address'] = address;
    data['associationId'] = associationId;
    data['sale_type'] = saleType;
    data['creditline_id'] = creditlineId;
    data['approved_credit_line_currency'] = approvedCreditLineCurrency;
    data['available_amount'] = availableAmount;
    return data;
  }
}
