  import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:grosshop/Controller/LoginScreenController.dart';
import 'package:grosshop/Controller/cartItem/cartItem_controller.dart';
import 'package:grosshop/Models/offerslist_model/offers_click_model.dart';
import 'package:grosshop/Provider/ProductProvider.dart';
import 'package:grosshop/utility/AppPreference.dart';
import 'package:provider/provider.dart';
import '../../Components/AppTheme.dart';
import '../../Components/ProductDisplayCommonComponent.dart';
import '../../Controller/CartScreenController.dart';
import '../../Controller/ProductHomeScreenController.dart';
import '../../Helper/Helper.dart';
import '../CartScreen/CartScreen.dart';

class ProductHomeScreen extends GetView<ProductHomeScreenController> {
  List<OffersClickData>? offerData = [];
  ProductHomeScreen({Key? key,this.offerData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    

    
    // Get instance of the controller
    ProductHomeScreenController homeController = Get.put(ProductHomeScreenController());
    final appPreference = AppPreference();


    final CartScreenController cartcontroller = Get.put(CartScreenController());
      final LoginScreenController loginController = Get.find<LoginScreenController>();
       final cartitemController = Get.find<CartitemController>();
       

    // Provide the ProductProvider to the controller
    homeController.userDataProvider = Provider.of<ProductProvider>(context, listen: false);

    // Scaffold key to control the drawer
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    // Call resetCounter at the start
    homeController.resetCounter();

    // Initialize the home API call after the build is complete

    // Initialize the home API call after the build is complete
    WidgetsBinding.instance.addPostFrameCallback((_) {
      print("WIDGET ENTERED");

        if (Helper.customerID != 0) {

          cartitemController.getCartCount(customerId:Helper.customerID );
        }

      if (!homeController.ishomeCall) {
        homeController.ishomeCall = true;
        // homeController.SearchProductApi(); // Uncomment if needed
      }
    });
   

    return GetBuilder<ProductHomeScreenController>(
      init: ProductHomeScreenController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppTheme.Buttoncolor,
          key: _scaffoldKey,
          appBar: AppBar(
            backgroundColor: AppTheme.Buttoncolor,
            automaticallyImplyLeading: false,
            bottomOpacity: 0.0,
            elevation: 0.0,
            toolbarHeight: 80,
            actions: [
              IconButton(
                onPressed: () {
                   controller.isSearchVisible.value = !controller.isSearchVisible.value;
                   controller.isSearch.value = !controller.isSearch.value;
                   controller.HomeScreenApi();
                },
                icon: Icon(
                  Icons.search,
                  size: 22,
                  color: Colors.black,
                ),
              ),
             IconButton(
      onPressed: () {
        cartcontroller.GetCartApi().then((data) {
          Get.to(() => CartScreen());
        });
      },
      icon: Stack(
        clipBehavior: Clip.none,
        children: [
          Icon(
            Icons.shopping_cart_outlined,
            size: 22,
            color: Colors.black,
          ),
          Visibility(
            visible: int.parse( cartitemController.itemCount.value.toString())>0,
            child: Positioned(
              right: -6,
              top: -6,
              child: Obx(() =>CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.red,
                    child: Text(
                      cartitemController.itemCount.value.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  )
                  )
            ),
          )
        ],
      ),
    ),

            ],
            leading: IconButton(
              onPressed: () => _scaffoldKey.currentState?.openDrawer(),
              icon: Icon(
                Icons.sort_outlined,
              ),
            ),
            title: Obx(() {
              return controller.isSearchVisible.value
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5)
                            ),
                            child: TextField(
                              onChanged: (value) {
                                controller.isSearch.value = true;
                                controller.SearchProductApi();
                              },
                              controller: controller.searchController,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                hintText: 'Search Grocery',
                                hintStyle: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                                prefixIcon: Icon(
                                  Icons.search,
                                  size: 18,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Row(
                      children: [
                       ValueListenableBuilder<String>(
      valueListenable: appPreference.customerNameNotifier,
      builder: (context, customerName, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Welcome",
            style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
            " ${customerName.isNotEmpty ? customerName : "Guest"}...",
             style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              
            ),
          ],
        );
      },
    ),
                        SizedBox(width: 10),
                      ],
                    );
            }),
          ),
          body: ListView(
            children: [
              
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: AppTheme.ScreenBackground,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),
                ),
                child: Obx(
                  () => controller.initialLoading.value
                      ? const Center(child: Image(height: 30, width: 30, image: AssetImage("assets/images/vkart_10.png")))// Show loading indicator
                      : controller.product.isNotEmpty
                          ? Column(
                              children: [
                                controller.isSearch.value
                                    ? SearchProductsListWidgets(context)
                                    : ListView.builder(
                                      key: PageStorageKey('scrollableList'),
                                      controller: controller.scrollController,
                                      shrinkWrap: true,
                                      itemCount:
                                      
                                      Helper.offerState == true ? Helper.offerData!.length: controller.product.length,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () {
                                            controller.userDataProvider.SetParticularProduct(controller.product[index]);
                                           
                                          },
                                          child: Card(
                                            shadowColor: Colors.grey,
                                            color: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),
                                            ),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [

                                                ProductDisplayCommonComponent(
                                                  productimage: Helper.offerState == true ? Helper.offerData![index].productImage: controller.product[index].productImage ?? "",
                                                  productname: Helper.offerState == true ?  Helper.offerData![index].productName:controller.product[index].productName ?? "",
                                                  productCategory: Helper.offerState == true ? Helper.offerData![index].productMainCategoryName:controller.product[index].productCategory.toString() ?? "",
                                                  shopName: Helper.offerState == true ?  Helper.offerData![index].shopName:controller.product[index].shopName.toString() ?? "",
                                                  productprice: Helper.offerState == true ?int.parse(Helper.offerData![index].productPrice):controller.productPriceDuplicate[index].value.toInt(), // Ensure it's a double
                                                  productQty: Helper.offerState == true ?  Helper.offerData![index].productQty:controller.product[index].productQty ?? "", // Handle null values
                                                  productDuplicatePrice: Helper.offerState == true ?  Helper.offerData![index].actualPrice :controller.product[index].actualPrice ?? 0.0, // Handle null values
                                                  productDiscountPrice: Helper.offerState == true ?Helper.offerData![index].productDiscountPrice:controller.product[index].productDiscountPrice?.toString() ?? "",  // Ensure it's a string or null
                                                  discountAvailable: Helper.offerState == true ?Helper.offerData![index].discountAvailable:controller.product[index].discountAvailable ?? 0, // Ensure it's an int
                                                  soldOut: Helper.offerState == true ?  Helper.offerData![index].soldOut:controller.product[index].soldOut ?? "", 
                                                  offerPercentage: Helper.offerState == true ?  Helper.offerData![index].discountPercentage:controller.product[index].discountPercentage?.toString() ?? "", // Ensure it's a string or null
                                                  index: index,
                                                  onTap: () async {
                                                    controller.index = index;
                                                  },
                                                  decrementCounter: () async {
                                                    if (!controller.getLoading(index)) {
                                                      controller.setLoading(index, true);
                                                      await controller.decrementCounter(Scaffold.of(context).context, index);
                                                      controller.setLoading(index, false);
                                                    }
                                                  },
                                                  incrementCounter: () async {
                                                    if (!controller.getLoading(index)) {
                                                      controller.setLoading(index, true);
                                                      await controller.incrementCounter(Scaffold.of(context).context, index);
                                                      controller.setLoading(index, false);
                                                    }
                                                  },
                                                  counter: controller.product[index].cartQuantity ?? 0,  // Ensure it's an int
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    )
                              ],
                            )
                          : Center(
                              child: Container(
                                child: Image.asset(
                                  height: 250,
                                  width: 250,
                                  "assets/images/nodata.png",
                                ),
                              ),
                            ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
Widget SearchProductsListWidgets(BuildContext context) {
  return SingleChildScrollView(
    child: Obx(() => Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.searchproduct.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.5,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemBuilder: (context, index) {
                  final product = controller.searchproduct[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white12,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade100,
                          blurRadius: 1,
                          offset: const Offset(0, 2),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                          child: Stack(
                            children:[
                              SizedBox(
                                height: 10,
                              ),
                               Image.network(
                              product.productImage ?? '',
                              fit: BoxFit.fitHeight,
                              height: 120,
                          
                              loadingBuilder: (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                              errorBuilder: (context, error, stackTrace) {
                                return const Center(
                                  child: Icon(Icons.error, size: 40, color: Colors.red),
                                );
                              },
                            ),
                            if (product.productDiscountPrice != null)
                            Positioned(child: Row(
                              children: [
                                Image.asset('assets/icons/discount.png',
                                height: 25,fit: BoxFit.fitHeight,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text(
                                        '${product.productDiscountPrice.toString()}',
                                        style: const TextStyle(
                                          fontSize: 12,
                                          // color: Colors.green,
                                        ),
                                      ),
                                ),
                              ],
                            ))
                            ]
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.productName ?? 'Unknown Product',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                controller.product[index].shopName.toString()?? 'Unknown Shop',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                product.productCategory.toString() ?? 'No Category',
                                style: const TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Text(
                                    '\₹${product.productPrice.toString() ?? ''}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    '${product.productQty.toString() ?? 0} pcs',
                                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                                  ),
                                ],
                              ),
                               Row(
                                children: [
                                  Text(
                                    '\%${product.productDiscountPrice.toString() ?? ''}',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      decoration: TextDecoration.lineThrough,
                                  
                                    ),
                                  ),
                                  const Spacer(),
                                  
                                ],
                              ),
                             
                                SizedBox(
                height: 50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        controller.counter[0].value > 0 // Access the value of the first item in the list
              ? Row(
                  children: [
                    // Decrement button
                    InkWell(
                      onTap: () {
                        if (controller.counter[0].value > 0) { // Access the value of RxInt
                          controller.decrementCounter(context, index);
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: controller.counter[0].value > 0 // Access the value of RxInt
                              ? Colors.red
                              : AppTheme.IconBackground,
                        ),
                        child: Icon(
                          CupertinoIcons.minus,
                          color: controller.counter[0].value > 0 // Access the value of RxInt
                              ? Colors.white
                              : AppTheme.Buttoncolor,
                          size: 15,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    // Counter value
                    Text(
                      controller.counter[0].value.toString(), // Access the value of RxInt
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 10),
                    // Increment button
                    InkWell(
                      onTap: () {
                        controller.incrementCounter(context, index);
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: AppTheme.Buttoncolor,
                        ),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                    ),
                  ],
                )
              : InkWell(
                  onTap: () {
                    controller.incrementCounter(context, index);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 9, horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppTheme.Buttoncolor,
                    ),
                    child: Text(
                      'Add',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                      ],
                    ),
                  ],
                ),
              )
              
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        )),
  );
}

}