import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../Apiconnect/ApiConnect.dart';
import '../Models/ParticularCustomerResponseModel.dart';
import '../Models/SearchProductsResponse.dart';
import '../Pojo/ProductHomeScreenResponse.dart';
import '../Provider/ProductProvider.dart';
import '../utility/AppPreference.dart';

class ProductHomeScreenController extends GetxController with WidgetsBindingObserver {
  RxBool isVisible = false.obs;
  RxBool arrowIsVisible = false.obs;
  late ProductProvider userDataProvider;
  RxString ImageUrl = RxString('');
  RxInt count = RxInt(0);

  RxList<RxInt> productPriceDuplicate = RxList<RxInt>();
  var actualPrice = 0.0.obs;

  int index = 0;
  int selectedIndex = 0;
  final ScrollController scrollController = ScrollController();

  ParticularCustomerResponseData? getParticularCustomer;
  RxString customerName = RxString("");
  RxList<bool> loadingStates = RxList<bool>.filled(10, false); // Assume 10 items for this example
  final ApiConnect _connect = Get.put(ApiConnect());
  bool ishomeCall = false;
  RxBool isVisible1 = false.obs;
  RxBool arrowIsVisible1 = false.obs;

  RxBool isVisible2 = false.obs;
  RxBool arrowIsVisible2 = false.obs;

  RxBool isVisible3 = false.obs;
  RxBool arrowIsVisible3 = false.obs;

  RxBool isVisible4 = false.obs;
  RxBool arrowIsVisible4 = false.obs;

  RxBool isVisible5 = false.obs;
  RxBool arrowIsVisible5 = false.obs;
  bool isCall = false;
  TextEditingController searchController = TextEditingController();
  RxString UpdatePrice = RxString("");
  RxString UpdateProductId = RxString("");
  RxString UpdateTotalPrice = RxString("0");
  RxString sameSeller = RxString("0");
  RxList<String> updateProductIds = RxList<String>();
  RxList<String> updatePrices = RxList<String>();
  RxList<int> countersList = RxList<int>();

  // RxString productPriceOriginal = RxString("0");
  RxList<Data> productPriceOriginal = RxList();
 RxList<RxInt> counter = RxList<RxInt>([RxInt(0)]);


  // List<bool> isLoadings = List.filled(counter.length, false);

  RxInt selectedIndexx = RxInt(0);
  RxInt selectedIndexOne = RxInt(0);

  int selectedProduct = 0;

  late RxList<Data> product = RxList();
  late RxList<SearchProductsResponseData> searchproduct = RxList();

  // late RxList<CartData> product = RxList();
  RxList<bool> onClickList = RxList();
  RxBool initialLoading = RxBool(false);
  RxBool isLoading = RxBool(true);
  RxBool isSearch = RxBool(false);
  RxBool isSearchVisible = RxBool(false);
  RxBool isClicked = RxBool(false);

  void toggleVisibility() {
    isVisible.value = !isVisible.value;
    arrowIsVisible.value = !arrowIsVisible.value;
  }

  @override
  void onInit() async {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
    // if (isCall) {
    //   isCall = true;
    HomeScreenApi();
    getParticularCustomerApi();
    resetCounter();
    toggleVisibility1();
    toggleVisibility2();
    toggleVisibility4();
    toggleVisibility5();
    toggleVisibilityColor();
    paymentProcess();
    _fetchPriceFromApi();
    SearchProductApi();

    update();
    // }
  }

 
  void resetCounter() {
    for (var i = 0; i < counter.length; i++) {
      counter[i].value = 0; // Reset each counter to 0
    }
  }

  ///
  var isLoadingMap = <int, bool>{}.obs;

  void setLoading(int index, bool value) {
    isLoadingMap[index] = value;
  }

  bool getLoading(int index) {
    return isLoadingMap[index] ?? false;
  }

  ///
  void toggleVisibility1() {
    isVisible1.value = !isVisible1.value;
    arrowIsVisible1.value = !arrowIsVisible1.value;
  }

  void toggleVisibility2() {
    isVisible2.value = !isVisible2.value;
    arrowIsVisible2.value = !arrowIsVisible2.value;
  }

  void toggleVisibility3() {
    isVisible3.value = !isVisible3.value;
    arrowIsVisible3.value = !arrowIsVisible3.value;
  }

  void toggleVisibility4() {
    isVisible4.value = !isVisible4.value;
    arrowIsVisible4.value = !arrowIsVisible4.value;
  }

  void toggleVisibility5() {
    isVisible5.value = !isVisible5.value;
    arrowIsVisible5.value = !arrowIsVisible5.value;
  }

  RxBool isVisibleColor = true.obs;

  void toggleVisibilityColor() {
    isVisibleColor.value = !isVisibleColor.value;
  }

  paymentProcess() async {
    for (int i = 0; i < onClickList.length; i++) {
      if (onClickList[i] == true) {
        isClicked.value = true;
        selectedIndex = i;
        break;
      }
    }

    if (isClicked.value == false) {
      
     
      return;
    }
  }

  @override
  void didChangeMetrics() {
    isSearch.value = WidgetsBinding.instance!.window.viewInsets.bottom > 0;
    update();
    print('VISIBLE');
  }



  HomeScreenApi() async {
    Map<String, dynamic> payload = {
      "customerId": AppPreference().UserId,
      'latitude': "", //userDataProvider.getLatitude.toString(),
      'longitude': "" //.getLongitude.toString(),
    };
    print("ProductPayload${payload}");
    initialLoading.value = true;
    var response = await _connect.HomeScreen(payload);

    print('HomeScreen_Response${response.toJson()}');
    onClickList.clear();
    counter.clear();
    if (!response.error!) {
      product.value = response.data!;
      selectedProduct = product[index].productId!;
      print("selectedProducts${selectedProduct}");

      userDataProvider.SetProduct(product[index]);
      productPriceOriginal.value = response.data!;
      productPriceDuplicate.clear();
      for (var item in product) {
        print("Printing productId: ${item.productId}");
      }
      for (var data in response.data!) {
        productPriceDuplicate.add(RxInt(int.tryParse(data.productPrice) ?? 0));
      }

      print("dhfjjv${productPriceDuplicate}");
      // productPriceDuplicate.value = response.data!.map((e) => e.productPrice).toList();

      // productPriceOriginal.value = response.data![index].productDescription.toString();
      // for (int i = 0; i < response.data!.length; i++) {
      //   productPriceOriginal.value = response.data![i].productPrice.toString();
      // }
      print("ytfift${response.data![index].productPrice.toString()}");
      print("Index: $index, Product Price: ${response.data![index].productPrice}");

      userDataProvider.SetProductList(response.data!);
      for (int i = 0; i < response.data!.length; i++) {
        counter.add(RxInt(0));
        update();
      }
    } else {}
    initialLoading.value = false;
  }



Future<void> incrementCounter(BuildContext outerContext, int index) async {
  // Ensure lists are large enough to hold values for each product
  while (updateProductIds.length <= index) {
    updateProductIds.add("");
    updatePrices.add("");
    countersList.add(0);
  }
   update();
  // Prevent duplicate API calls for the same index
  print("incrementCounter called for index $index with initial value: ${product[index].cartQuantity}");

  // Set the loading state
  isLoading.value = true;

  try {
    // Update the cart quantity and counter if valid index
    if (index >= 0 && index < counter.length) {
      int currentQty = product[index].cartQuantity ?? 0;
      currentQty++;
      product[index].cartQuantity = currentQty;
      counter[index].value = currentQty;
      countersList[index] = currentQty;
    }

    print("Counter updated for index $index, new value: ${counter[index].value}");

    // Fetch product price and update it
    double price = 0.0;
    String? discountPrice = product[index].productDiscountPrice;
    String? priceDuplicate = product[index].productPriceDuplicate;

    if (discountPrice != null && discountPrice.isNotEmpty) {
      price = double.tryParse(discountPrice) ?? 0.0;
    } else {
      price = double.tryParse(priceDuplicate ?? '') ?? 0.0;
    }

    double updatedProductPrice = price * product[index].cartQuantity!;
    updatePrices[index] = updatedProductPrice.toStringAsFixed(2);
    product[index].productPrice = updatePrices[index];
    updateProductIds[index] = product[index].productId.toString();
    update();
    print(">>>>>>>>>>>add product price::::::::::${UpdateProductId}");

    // Make the API call
    await AddCart(outerContext, index: index, showLoading: false, isIncrement: true);

    Fluttertoast.showToast(
      msg: "Item Updated...",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black,
      textColor: Colors.white,
    );
    update();
  } finally {
    // Reset the loading state
    isLoading.value = false;
  }
}


  Future<void> decrementCounter(BuildContext outerContext, int index) async {
    if (updateProductIds.length <= index) {
      updateProductIds.addAll(List.filled(index + 1 - updateProductIds.length, ""));
      updatePrices.addAll(List.filled(index + 1 - updatePrices.length, ""));
      countersList.addAll(List.filled(index + 1 - countersList.length, 0)); // Initialize to 0
    }



    if (index >= 0 && index < counter.length) {
      int currentQty = product[index].cartQuantity ?? 0;
      currentQty--;
      product[index].cartQuantity = currentQty;
      counter[index].value = currentQty;
      countersList[index] = currentQty;
    }

    // Calculate the updated price based on the decremented counter
    int price = int.tryParse(product[index].productPriceDuplicate ?? '0') ?? 0;
    int result = price * counter[index].value;
    updatePrices[index] = result.toString(); // Store updated price for this product
    product[index].productPrice = updatePrices[index];

    updateProductIds[index] = product[index].productId.toString(); // Store productId
    isLoading.value = true;
    // Call the _updateCart API without the dialog and with decrement flag
    await AddCart(outerContext, index: index, showLoading: true, isIncrement: false);

    isLoading.value = false;

    // Show a toast for item update
    // Fluttertoast.showToast(
    //   msg: "Item Updated...",
    //   toastLength: Toast.LENGTH_SHORT,
    //   gravity: ToastGravity.BOTTOM,
    //   backgroundColor: Colors.black,
    //   textColor: Colors.white,
    // );
    update();
  }

  Future<void> AddCart(BuildContext outerContext,
      {required int index, bool isConfirmed = false, bool showLoading = true, required bool isIncrement}) async {
    Map<String, dynamic> payload = {
      'customerId': AppPreference().UserId,
      'productId': updateProductIds[index],
      'qty': countersList[index],
    };

    isLoading.value = true;
    print("Payload: $payload");
    var response = await _connect.AddCart(payload);
    isLoading.value = false;

    final updatedCart = product[index];
    updatedCart.actualPrice = response.actualPrice ?? updatedCart.actualPrice;
    product[index] = updatedCart;
    update();

    print("Response: ${response.message}");
    // No mismatch; item added to cart successfully
    Fluttertoast.showToast(
      msg: response.message ?? "Item added to cart",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black,
      textColor: Colors.white,
    );
    update(); // Update the UI after successful addition
  }

  

  Future<Map<String, dynamic>> _fetchPriceFromApi() async {
    await Future.delayed(Duration(seconds: 2)); // Simulate network delay
    return {'newPrice': 100.0}; // Example new price
  }


  ///dont delete this commented code

  AddWishListApi() async {
    Map<String, dynamic> payload = {
      "customerId": AppPreference().UserId,
      "productId": userDataProvider.product!.productId.toString(),
    };
    print("AddWishListPayload${payload}");
    var response = await _connect.AddWishList(payload);
    if (!response.error!) {
      HomeScreenApi();
      update();
    } else {}
  }

  deleteWishListApi() async {
    Map<String, dynamic> payload = {
      "customerId": AppPreference().UserId,
      "productId": userDataProvider.product!.productId.toString(),
    };
    print("AddWishListPayload${payload}");

    var response = await _connect.DeleteWishList(payload);

    print(response.error);
    if (!response.error!) {
      HomeScreenApi();
      update();
    } else {}
  }

  void updatePrice(int index) {
    if (index >= 0 && index < product.length && index < counter.length) {}
  }

  SearchProductApi() async {
    Map<String, dynamic> payload = {'searchKey': searchController.value.text};
    print(payload);
    initialLoading.value = true;
    // Call the API (replace with your actual API function)
    var response = await _connect.SearchProduct(payload);
    initialLoading.value = false;

    if (!response.error!) {
      searchproduct.value = response.data!; // Set the search results
      update();
    } else {
      // Handle API error here
    }
  }


  getParticularCustomerApi() async {
    print("SellerId ${AppPreference().UserId}");
    Map<String, dynamic> payload = {'customerId': AppPreference().UserId};
    print(" getParticularSeller_payload ${payload}");
    isLoading.value = true;
    var response = await _connect.GetParticularCustomer(payload);
    isLoading.value = false;
    print('getParticularSeller_Response${response.toJson()}');

    if (!response.error!) {
      getParticularCustomer = response.data;
      customerName.value = response.data!.customerName!;
      update();
    } else {}
  }
}