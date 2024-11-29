class LoginResponse {
  String? message;
  bool? error;
  GetAddressInLogin? data;

  LoginResponse({this.message, this.error, this.data});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    error = json['error'];
    data = json['data'] != null ? new GetAddressInLogin.fromJson(json['data']) : null;
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

class GetAddressInLogin {
  int? customerId;
  String? customerMobile;
  String? customerName;
  List<Addresses>? addresses;

  GetAddressInLogin({this.customerId, this.customerMobile, this.customerName, this.addresses});

  GetAddressInLogin.fromJson(Map<String, dynamic> json) {
    customerId = json['customerId'];
    customerMobile = json['customer_mobile'];
    customerName = json['customer_name'];
    if (json['addresses'] != null) {
      addresses = <Addresses>[];
      json['addresses'].forEach((v) {
        addresses!.add(new Addresses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerId'] = this.customerId;
    data['customer_mobile'] = this.customerMobile;
    data['customer_name'] = this.customerName;
    if (this.addresses != null) {
      data['addresses'] = this.addresses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Addresses {
  int? customerAddressId;
  String? customerAddress;
  String? customerCity;
  String? customerState;
  String? customerPincode;
  String? customerCountry;
  dynamic? isDefault;

  Addresses(
      {this.customerAddressId,
      this.customerAddress,
      this.customerCity,
      this.customerState,
      this.customerPincode,
      this.customerCountry,
      this.isDefault});

  Addresses.fromJson(Map<String, dynamic> json) {
    customerAddressId = json['customerAddressId'];
    customerAddress = json['customerAddress'];
    customerCity = json['customerCity'];
    customerState = json['customerState'];
    customerPincode = json['customerPincode'];
    customerCountry = json['customerCountry'];
    isDefault = json['isDefault'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerAddressId'] = this.customerAddressId;
    data['customerAddress'] = this.customerAddress;
    data['customerCity'] = this.customerCity;
    data['customerState'] = this.customerState;
    data['customerPincode'] = this.customerPincode;
    data['customerCountry'] = this.customerCountry;
    data['isDefault'] = this.isDefault;
    return data;
  }
}
