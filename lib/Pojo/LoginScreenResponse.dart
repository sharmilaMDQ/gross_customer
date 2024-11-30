class LoginResponse {
  String? message;
  bool? error;
  Data? data;

  LoginResponse({this.message, this.error, this.data});

  LoginResponse.fromJson(Map<String, dynamic> json) {
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
  int? customerId;
  String? firstName;
  String? lastName;
  String? fullName;
  String? customerMobile;

  Data({this.customerId, this.firstName, this.lastName, this.fullName, this.customerMobile});

  Data.fromJson(Map<String, dynamic> json) {
    customerId = json['customerId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    fullName = json['fullName'];
    customerMobile = json['customerMobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerId'] = this.customerId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['fullName'] = this.fullName;
    data['customerMobile'] = this.customerMobile;
    return data;
  }
}
