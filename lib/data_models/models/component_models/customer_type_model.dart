class CustomerTypeModel {
  bool? success;
  String? message;
  List<Data>? data;

  CustomerTypeModel({this.success, this.message, this.data});

  CustomerTypeModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? customerType;

  Data({this.customerType});

  Data.fromJson(Map<String, dynamic> json) {
    customerType = json['customer_type'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['customer_type'] = customerType;
    return data;
  }
}
