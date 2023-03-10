class PartnerWithCurrencyList {
  bool? success;
  String? message;
  List<PartnerWithCurrencyListData>? data;

  PartnerWithCurrencyList({this.success, this.message, this.data});

  PartnerWithCurrencyList.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <PartnerWithCurrencyListData>[];
      json['data'].forEach((v) {
        data!.add(new PartnerWithCurrencyListData.fromJson(v));
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

class PartnerWithCurrencyListData {
  List<WholesalerData>? wholesalerData;

  PartnerWithCurrencyListData({this.wholesalerData});

  PartnerWithCurrencyListData.fromJson(Map<String, dynamic> json) {
    if (json['wholesaler_data'] != null) {
      wholesalerData = <WholesalerData>[];
      json['wholesaler_data'].forEach((v) {
        wholesalerData!.add(new WholesalerData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.wholesalerData != null) {
      data['wholesaler_data'] =
          this.wholesalerData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WholesalerData {
  String? bpIdW;
  String? associationUniqueId;
  String? wholesalerName;
  List<WholesalerCurrency>? wholesalerCurrency;

  WholesalerData(
      {this.bpIdW,
      this.associationUniqueId,
      this.wholesalerName,
      this.wholesalerCurrency});

  WholesalerData.fromJson(Map<String, dynamic> json) {
    bpIdW = json['bp_id_w'] ?? "";
    associationUniqueId = json['association_unique_id'] ?? "";
    wholesalerName = json['wholesaler_name'] ?? "";
    if (json['wholesaler_currency'] != null) {
      wholesalerCurrency = <WholesalerCurrency>[];
      json['wholesaler_currency'].forEach((v) {
        wholesalerCurrency!.add(new WholesalerCurrency.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bp_id_w'] = this.bpIdW;
    data['association_unique_id'] = this.associationUniqueId;
    data['wholesaler_name'] = this.wholesalerName;
    if (this.wholesalerCurrency != null) {
      data['wholesaler_currency'] =
          this.wholesalerCurrency!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WholesalerCurrency {
  String? currency;

  WholesalerCurrency({this.currency});

  WholesalerCurrency.fromJson(Map<String, dynamic> json) {
    currency = json['currency'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currency'] = this.currency;
    return data;
  }
}
