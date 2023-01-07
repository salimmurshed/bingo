// import 'package:json_annotation/json_annotation.dart';
//
// part 'all_sales_model.g.dart';
//
// @JsonSerializable(explicitToJson: true, includeIfNull: false)
class AllSalesModel {
  bool? success;
  String? message;
  Data? data;

  AllSalesModel({this.success, this.message, this.data});

  AllSalesModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? currentPage;
  List<AllSalesData>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? nextPageUrl;
  String? path;
  String? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  Data(
      {this.currentPage,
      this.data,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.links,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total});

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <AllSalesData>[];
      json['data'].forEach((v) {
        data!.add(new AllSalesData.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class AllSalesData {
  String? uniqueId;
  String? invoiceNumber;
  String? orderNumber;
  String? saleDate;
  String? dueDate;
  String? currency;
  var amount;
  String? bingoOrderId;
  int? status;
  String? description;
  String? retailerName;
  String? fieName;
  String? statusDescription;
  String? balance;

  AllSalesData(
      {this.uniqueId,
      this.invoiceNumber,
      this.orderNumber,
      this.saleDate,
      this.dueDate,
      this.currency,
      this.amount,
      this.bingoOrderId,
      this.status,
      this.description,
      this.retailerName,
      this.fieName,
      this.statusDescription,
      this.balance});

  AllSalesData.fromJson(Map<String, dynamic> json) {
    uniqueId = json['unique_id'] ?? "";
    invoiceNumber = json['invoice_number'] ?? "";
    orderNumber = json['order_number'] ?? "";
    saleDate = json['sale_date'] ?? "";
    dueDate = json['due_date'] ?? "";
    currency = json['currency'] ?? "";
    amount = json['amount'] ?? 0;
    bingoOrderId = json['bingo_order_id'] ?? "";
    status = json['status'] ?? 0;
    description = json['description'] ?? "";
    retailerName = json['retailer_name'] ?? "";
    fieName = json['fie_name'] ?? "";
    statusDescription = json['status_description'] ?? "";
    balance = json['balance'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['unique_id'] = this.uniqueId;
    data['invoice_number'] = this.invoiceNumber;
    data['order_number'] = this.orderNumber;
    data['sale_date'] = this.saleDate;
    data['due_date'] = this.dueDate;
    data['currency'] = this.currency;
    data['amount'] = this.amount;
    data['bingo_order_id'] = this.bingoOrderId;
    data['status'] = this.status;
    data['description'] = this.description;
    data['retailer_name'] = this.retailerName;
    data['fie_name'] = this.fieName;
    data['status_description'] = this.statusDescription;
    data['balance'] = this.balance;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}
