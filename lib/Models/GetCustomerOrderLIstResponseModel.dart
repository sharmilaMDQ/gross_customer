class GetCustomerResponseModel {
  String? message;
  bool? error;
  List<GetCustomerResponseModelData>? data;

  GetCustomerResponseModel({this.message, this.error, this.data});

  GetCustomerResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    error = json['error'];
    if (json['data'] != null) {
      data = <GetCustomerResponseModelData>[];
      json['data'].forEach((v) {
        data!.add(new GetCustomerResponseModelData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['error'] = this.error;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetCustomerResponseModelData {
  int? orderId;
  int? customerId;
  String? customerName;
  String? customerMobile;
  int? sellerId;
  String? shopName;
  String? sellerName;
  String? customerAddress;
  String? customerCity;
  String? customerState;
  int? customerPincode;
  String? customerCountry;
  String? totalOrderCost;
  String? orderStatus;
  String? orderTime;
  String? paymentOption;
  String? pickupTime;
  List<ProductsDetails>? productsDetails;

  GetCustomerResponseModelData(
      {this.orderId,
        this.customerId,
        this.customerName,
        this.customerMobile,
        this.sellerId,
        this.shopName,
        this.sellerName,
        this.customerAddress,
        this.customerCity,
        this.customerState,
        this.customerPincode,
        this.customerCountry,
        this.totalOrderCost,
        this.orderStatus,
        this.orderTime,
        this.paymentOption,
        this.pickupTime,
        this.productsDetails});

  GetCustomerResponseModelData.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
    customerId = json['customerId'];
    customerName = json['customerName'];
    customerMobile = json['customerMobile'];
    sellerId = json['sellerId'];
    shopName = json['shopName'];
    sellerName = json['sellerName'];
    customerAddress = json['customerAddress'];
    customerCity = json['customerCity'];
    customerState = json['customerState'];
    customerPincode = json['customerPincode'];
    customerCountry = json['customerCountry'];
    totalOrderCost = json['totalOrderCost'];
    orderStatus = json['orderStatus'];
    orderTime = json['orderTime'];
    paymentOption = json['paymentOption'];
    pickupTime = json['pickupTime'];
    if (json['productsDetails'] != null) {
      productsDetails = <ProductsDetails>[];
      json['productsDetails'].forEach((v) {
        productsDetails!.add(new ProductsDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderId'] = this.orderId;
    data['customerId'] = this.customerId;
    data['customerName'] = this.customerName;
    data['customerMobile'] = this.customerMobile;
    data['sellerId'] = this.sellerId;
    data['shopName'] = this.shopName;
    data['sellerName'] = this.sellerName;
    data['customerAddress'] = this.customerAddress;
    data['customerCity'] = this.customerCity;
    data['customerState'] = this.customerState;
    data['customerPincode'] = this.customerPincode;
    data['customerCountry'] = this.customerCountry;
    data['totalOrderCost'] = this.totalOrderCost;
    data['orderStatus'] = this.orderStatus;
    data['orderTime'] = this.orderTime;
    data['paymentOption'] = this.paymentOption;
    data['pickupTime'] = this.pickupTime;
    if (this.productsDetails != null) {
      data['productsDetails'] =
          this.productsDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductsDetails {
  int? productId;
  String? productName;
  String? productQty;
  String? productPrice;
  String? orderedQty;
  int? subTotalProductPrice;
  String? productImage;

  ProductsDetails(
      {this.productId,
        this.productName,
        this.productQty,
        this.productPrice,
        this.orderedQty,
        this.subTotalProductPrice,
        this.productImage});

  ProductsDetails.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    productName = json['productName'];
    productQty = json['productQty'];
    productPrice = json['productPrice'];
    orderedQty = json['orderedQty'];
    subTotalProductPrice = json['subTotalProductPrice'];
    productImage = json['productImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['productName'] = this.productName;
    data['productQty'] = this.productQty;
    data['productPrice'] = this.productPrice;
    data['orderedQty'] = this.orderedQty;
    data['subTotalProductPrice'] = this.subTotalProductPrice;
    data['productImage'] = this.productImage;
    return data;
  }
}