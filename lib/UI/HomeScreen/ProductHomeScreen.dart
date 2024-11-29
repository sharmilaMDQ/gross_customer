import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grosshop/Provider/ProductProvider.dart';
import 'package:provider/provider.dart';

import '../../Components/AppTheme.dart';
import '../../Components/ProductDisplayCommonComponent.dart';
import '../../Controller/ProductHomeScreenController.dart';
import '../../Pageroutes/App_routes.dart';
import '../CartScreen/CartScreen.dart';

class ProductHomeScreen extends GetView<ProductHomeScreenController> {
  ProductHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get instance of the controller
    ProductHomeScreenController homeController = Get.put(ProductHomeScreenController());

    // Provide the ProductProvider to the controller
    homeController.userDataProvider = Provider.of<ProductProvider>(context, listen: false);

    // Scaffold key to control the drawer
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    // Call resetCounter at the start
    homeController.resetCounter();

    // Initialize the home API call after the build is complete
    WidgetsBinding.instance?.addPostFrameCallback((_) {
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
                  Get.to(() => CartScreen());
                },
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  size: 22,
                  color: Colors.black,
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
                        Obx(
                          () => Text(
                            "Welcome ${controller.customerName}",
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
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
                                    : Obx(() => Expanded(
                                          child: ListView.builder(
                                            key: PageStorageKey('scrollableList'),
                                            controller: controller.scrollController,
                                            shrinkWrap: true,
                                            itemCount: controller.product.length,
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                onTap: () {
                                                  controller.userDataProvider.SetParticularProduct(controller.product[index]);
                                                  // Get.toNamed(AppRoutes.ParticularHomeScreenProduct.toName);
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
                                                        productimage: controller.product[index].productImage ?? "",
                                                        productname: controller.product[index].productName ?? "",
                                                        productCategory: controller.product[index].productCategory.toString() ?? "",
                                                        shopName: controller.product[index].shopName.toString() ?? "",
                                                        productprice: controller.productPriceDuplicate[index].value.toInt(), // Ensure it's a double
                                                        productQty: controller.product[index].productQty ?? "", // Handle null values
                                                        productDuplicatePrice: controller.product[index].actualPrice ?? 0.0, // Handle null values
                                                        productDiscountPrice: controller.product[index].productDiscountPrice?.toString() ?? "0.0",  // Ensure it's a string or null
                                                        discountAvailable: controller.product[index].discountAvailable ?? 0, // Ensure it's an int
                                                        soldOut: controller.product[index].soldOut ?? "", 
                                                        offerPercentage: controller.product[index].discountPercentage?.toString() ?? "0", // Ensure it's a string or null
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
                                          ),
                                        )),
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
                                        '${product.productDiscountPrice}',
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
                                    '\₹${product.productPrice ?? '0'}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    '${product.productQty ?? 0} pcs',
                                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                                  ),
                                ],
                              ),
                               Row(
                                children: [
                                  Text(
                                    '\%${product.productDiscountPrice ?? '0'}',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      decoration: TextDecoration.lineThrough,
                                  
                                    ),
                                  ),
                                  const Spacer(),
                                  // Text(
                                  //   '${product.productQty ?? 0} pcs',
                                  //   style: const TextStyle(fontSize: 12, color: Colors.grey),
                                  // ),
                                ],
                              ),
                              // const SizedBox(height: 4),
                              // if (product.productDiscountPrice != null)
                              //   Row(
                              //     children: [
                              //       Text(
                              //         'Discount: \$${product.productDiscountPrice}',
                              //         style: const TextStyle(
                              //           fontSize: 12,
                              //           color: Colors.green,
                              //         ),
                              //       ),
                              //       Icon(Icons.)
                              //     ],
                              //   ),
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

  // Widget SearchProductsListWidgets(BuildContext context) {
  //   return SingleChildScrollView(
  //     scrollDirection: Axis.vertical,
  //     child: Obx(() => Padding(
  //       padding: const EdgeInsets.symmetric(),
  //       child: Column(
  //         children: [
           
  //           Padding(
  //             padding: const EdgeInsets.only(top: 15,right: 10,left: 10),
  //             child: GridView.builder(
  //               shrinkWrap: true,
  //               itemCount: controller.searchproduct.length,
  //               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2,
  //                 childAspectRatio: 0.55,
  //               crossAxisSpacing: 8,), 
  //             itemBuilder: (context,index){
  //               return Container(
                 
  //                 decoration: BoxDecoration(
  //                   // color: Colors.white,
  //                   // boxShadow: <BoxShadow>[
  //                   //   BoxShadow(
  //                   //     color: Colors.grey,
  //                   //     offset: Offset(0.0, 0.75),
  //                   //     blurRadius: 5
  //                   //   ),
                      
  //                   // ],
  //                   borderRadius: BorderRadius.circular(8)
  //                 ),
  //                 // width: 200,
  //                 child: Column(
  //                   children: [
  //                     ClipRRect(
  //                       borderRadius: BorderRadius.circular(5),
  //                       child: Image.network(controller.searchproduct[index].productImage.toString(),
  //                                        ),
  //                     ),
                                               
  //                      Padding(
  //                        padding: const EdgeInsets.only(top: 10),
  //                        child: Column(
  //                         crossAxisAlignment: CrossAxisAlignment.start,
  //                         children: [
                         
  //                           Row(
  //                             children: [
  //                               Text(''),
  //                               Text(controller.searchproduct[index].productName.toString(),
  //                                              style: TextStyle(
  //                     fontSize: 16.5,
  //                     fontWeight: FontWeight.w700
  //                                              ),),
  //                               Text(controller.product[index].shopName.toString()),
  //                             ],
  //                           ),
  //                           controller.searchproduct!=null? Text(controller.searchproduct[index].productCategory.toString()):Text(''),
  //                            Text(controller.searchproduct[index].productPrice),
  //                            Text(controller.searchproduct[index].productQty.toString()),
  //                            Text(controller.searchproduct[index].productDiscountPrice.toString())
                             
  //                         //  ProductDisplayCommonComponent(
  //                         //       productimage: controller.searchproduct[index].productImage ?? "",
  //                         //       productname: controller.searchproduct[index].productName ?? "",
  //                         //       shopName: controller.product[index].shopName.toString() ?? "",
  //                         //       productCategory: controller.searchproduct[index].productCategory.toString() ?? "",
  //                         //       productprice: int.parse(controller.product[index].productPrice ?? "0"),
  //                         //       // Ensure it's a string
  //                         //       productQty: controller.searchproduct[index].productQty ?? "0", // Ensure it's a string
  //                         //       onTap: () {
  //                         //         controller.onClickList[index] = !controller.onClickList[index];
  //                         //       },
  //                         //       productDiscountPrice: controller.searchproduct[index].productDiscountPrice.toString(),
  //                         //       discountAvailable: controller.searchproduct[index].discountAvailable,
  //                         //       index: controller.counter[index].value,
  //                         //     )
  //                         ],
  //                        ),
  //                      )
  //                   ],
  //                 ),
  //               );
  //             }),
  //           )
  //           // Container(
  //           //   padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
  //           //   child: GridView.count(
  //           //     // physics: ScrollPhysics(),
  //           //     crossAxisCount: 2,
  //           //     childAspectRatio: 0.65,
  //           //     crossAxisSpacing: 8,
  //           //     mainAxisSpacing: 5,
  //           //     shrinkWrap: true,
  //           //     children: List.generate(
  //           //       controller.searchproduct.length,
  //           //       (index) {
  //           //         return InkWell(
  //           //           onTap: () {
  //           //             Get.toNamed(AppRoutes.producthomescreen.toName);
  //           //           },
  //           //           child: Card(
  //           //             shape: RoundedRectangleBorder(
  //           //               borderRadius: BorderRadius.circular(20),
  //           //             ),
  //           //             child: Container(
  //           //               padding: EdgeInsets.only(right: 10, left: 10),
  //           //               child: Column(
  //           //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //           //                 children: [
  //           //                   ProductDisplayCommonComponent(
  //           //                     productimage: controller.searchproduct[index].productImage ?? "",
  //           //                     productname: controller.searchproduct[index].productName ?? "",
  //           //                     shopName: controller.product[index].shopName.toString() ?? "",
  //           //                     productCategory: controller.searchproduct[index].productCategory.toString() ?? "",
  //           //                     productprice: int.parse(controller.product[index].productPrice ?? "0"),
  //           //                     // Ensure it's a string
  //           //                     productQty: controller.searchproduct[index].productQty ?? "0", // Ensure it's a string
  //           //                     onTap: () {
  //           //                       controller.onClickList[index] = !controller.onClickList[index];
  //           //                     },
  //           //                     productDiscountPrice: controller.searchproduct[index].productDiscountPrice.toString(),
  //           //                     discountAvailable: controller.searchproduct[index].discountAvailable,
  //           //                     index: controller.counter[index].value,
  //           //                   )
  //           //                 ],
  //           //               ),
  //           //             ),
  //           //           ),
  //           //         );
  //           //       },
  //           //     ),
  //           //   ),
  //           // ),
  //         ],
  //       ),
  //     )));
  // }
}
