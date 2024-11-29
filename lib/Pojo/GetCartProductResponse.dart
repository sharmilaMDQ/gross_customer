class GetCartResponse {
  String? message;
  bool? error;
  List<CartData>? data;
  String? subtotal;
  dynamic? discount;
  dynamic? total;

  GetCartResponse({this.message, this.error, this.data, this.subtotal, this.discount, this.total});

  GetCartResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    error = json['error'];
    if (json['data'] != null) {
      data = <CartData>[];
      json['data'].forEach((v) {
        data!.add(new CartData.fromJson(v));
      });
    }
    subtotal = json['subtotal'];
    discount = json['discount'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['error'] = this.error;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['subtotal'] = this.subtotal;
    data['discount'] = this.discount;
    data['total'] = this.total;
    return data;
  }
}

class CartData {
  int? cartId;
  int? productId;
  int? cartQty;
  int? sellerId;
  String? productName;
  String? productQty;
  dynamic? productPrice;
  dynamic? productPriceDuplicate;
  String? productImage;
  String? productDescription;
  int? discountAvailable;
  dynamic? discountPercentage;
  String? productDiscountPrice;
  String? productDiscountNote;
  dynamic? actualPrice;

  CartData(
      {this.cartId,
      this.productId,
      this.cartQty,
      this.sellerId,
      this.productName,
      this.productQty,
      this.productPrice,
      this.productPriceDuplicate,
      this.productImage,
      this.productDescription,
      this.discountAvailable,
      this.discountPercentage,
      this.productDiscountPrice,
      this.productDiscountNote,
      this.actualPrice});

  CartData.fromJson(Map<String, dynamic> json) {
    cartId = json['cartId'];
    productId = json['productId'];
    cartQty = json['cartQty'];
    sellerId = json['sellerId'];
    productName = json['productName'];
    productQty = json['productQty'];
    productPrice = json['productPrice'];
    productPriceDuplicate = json['productPrice'];
    productImage = json['productImage'];
    productDescription = json['productDescription'];
    discountAvailable = json['discountAvailable'];
    discountPercentage = json['discountPercentage'];
    productDiscountPrice = json['productDiscountPrice'];
    productDiscountNote = json['productDiscountNote'];
    actualPrice = json['actualPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cartId'] = this.cartId;
    data['productId'] = this.productId;
    data['cartQty'] = this.cartQty;
    data['sellerId'] = this.sellerId;
    data['productName'] = this.productName;
    data['productQty'] = this.productQty;
    data['productPrice'] = this.productPrice;
    data['productPrice'] = this.productPriceDuplicate;
    data['productImage'] = this.productImage;
    data['productDescription'] = this.productDescription;
    data['discountAvailable'] = this.discountAvailable;
    data['discountPercentage'] = this.discountPercentage;
    data['productDiscountPrice'] = this.productDiscountPrice;
    data['productDiscountNote'] = this.productDiscountNote;
    data['actualPrice'] = this.actualPrice;
    return data;
  }
}
