class GracePeriodGroupModel {
  bool? success;
  String? message;
  List<Data>? data;

  GracePeriodGroupModel({this.success, this.message, this.data});

  GracePeriodGroupModel.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? gracePeriodGroup;

  Data({this.gracePeriodGroup});

  Data.fromJson(Map<String, dynamic> json) {
    gracePeriodGroup = json['grace_period_group'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['grace_period_group'] = this.gracePeriodGroup;
    return data;
  }
}
