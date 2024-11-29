class GetCartInfoResponseModel {
  String? message;
  bool? error;
  Data? data;

  GetCartInfoResponseModel({this.message, this.error, this.data});

  GetCartInfoResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    error = json['error'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['error'] = this.error;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  dynamic? subtotal;
  dynamic? discount;
  dynamic? total;

  Data({this.subtotal, this.discount, this.total});

  Data.fromJson(Map<String, dynamic> json) {
    subtotal = json['subtotal'];
    discount = json['discount'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subtotal'] = this.subtotal;
    data['discount'] = this.discount;
    data['total'] = this.total;
    return data;
  }
}
