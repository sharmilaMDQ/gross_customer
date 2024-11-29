class SearchProductsResponse {
  String? message;
  bool? error;
  List<SearchProductsResponseData>? data;

  SearchProductsResponse({this.message, this.error, this.data});

  SearchProductsResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    error = json['error'];
    if (json['data'] != null) {
      data = <SearchProductsResponseData>[];
      json['data'].forEach((v) {
        data!.add(SearchProductsResponseData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = this.message;
    data['error'] = this.error;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SearchProductsResponseData {
  int? productId;
  int? sellerId;
  String? productName;
  String? productQty;
  dynamic? productPrice;
  String? productDescription;
  String? productImage;
  int? productCategory;
  String? soldOut;
  dynamic? discountAvailable;
  String? productDiscountPrice;
  String? productDiscountNote;
  String? subCategory;
  String? searchkey;

  SearchProductsResponseData({
    this.productId,
    this.sellerId,
    this.productName,
    this.productQty,
    this.productPrice,
    this.productDescription,
    this.productImage,
    this.productCategory,
    this.soldOut,
    this.discountAvailable,
    this.productDiscountPrice,
    this.productDiscountNote,
    this.subCategory,
    this.searchkey,
  });

  SearchProductsResponseData.fromJson(Map<String, dynamic> json) {
    // Handle productId
    productId = _parseInt(json['productId']);
    // Handle sellerId
    sellerId = _parseInt(json['sellerId']);
    productName = json['productName'];
    productQty = json['productQty'];
    productPrice = json['productPrice'];
    productDescription = json['productDescription'];
    productImage = json['productImage'];
    // Handle productCategory
    productCategory = _parseInt(json['productCategory']);
    soldOut = json['SoldOut'];
    discountAvailable = json['discountAvailable'];
    productDiscountPrice = json['productDiscountPrice'];
    productDiscountNote = json['productDiscountNote'];
    subCategory = json['sub_category'];
    searchkey = json['searchKey'];
  }

  // Helper function to parse integers from strings if needed
  int? _parseInt(dynamic value) {
    if (value is String) {
      return int.tryParse(value);
    }
    return value as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['productId'] = this.productId;
    data['sellerId'] = this.sellerId;
    data['productName'] = this.productName;
    data['productQty'] = this.productQty;
    data['productPrice'] = this.productPrice;
    data['productDescription'] = this.productDescription;
    data['productImage'] = this.productImage;
    data['productCategory'] = this.productCategory;
    data['SoldOut'] = this.soldOut;
    data['discountAvailable'] = this.discountAvailable;
    data['productDiscountPrice'] = this.productDiscountPrice;
    data['productDiscountNote'] = this.productDiscountNote;
    data['sub_category'] = this.subCategory;
    data['searchKey'] = this.searchkey;
    return data;
  }
}
