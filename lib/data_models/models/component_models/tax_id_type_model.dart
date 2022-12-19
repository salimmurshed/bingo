class TaxIdType {
  bool? success;
  String? message;
  List<Data>? data;

  TaxIdType({this.success, this.message, this.data});

  TaxIdType.fromJson(Map<String, dynamic> json) {
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
  String? taxIdType;

  Data({this.taxIdType});

  Data.fromJson(Map<String, dynamic> json) {
    taxIdType = json['tax_id_type'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tax_id_type'] = this.taxIdType;
    return data;
  }
}
