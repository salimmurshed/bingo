class AllCityModel {
  bool? success;
  String? message;
  List<AllCityDataModel>? data;

  AllCityModel({this.success, this.message, this.data});

  AllCityModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <AllCityDataModel>[];
      json['data'].forEach((v) {
        data!.add(new AllCityDataModel.fromJson(v));
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

class AllCityDataModel {
  String? city;

  AllCityDataModel({this.city});

  AllCityDataModel.fromJson(Map<String, dynamic> json) {
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    return data;
  }
}
