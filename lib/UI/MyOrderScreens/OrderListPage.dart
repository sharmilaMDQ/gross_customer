import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grosshop/Components/MyOrderListComponents.dart';

import '../../Components/AppTheme.dart';
import '../../Controller/OrderListScreenController.dart';
import 'MyOrderScreen.dart';

class OrderListScreen extends GetView<OrderListScreenController> {
  OrderListScreen({
    Key? key,
  }) : super(key: key);

  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    OrderListScreenController controller = Get.put(OrderListScreenController());
    // controller.getParticularSellerApi();

    return Scaffold(
        backgroundColor: AppTheme.Buttoncolor,
        appBar: AppBar(
          backgroundColor: AppTheme.Buttoncolor,
          automaticallyImplyLeading: false,
          bottomOpacity: 0.0,
          elevation: 0.0,
          toolbarHeight: 80,
          title: Text(
            "order List",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
          actions: const <Widget>[],
        ),
        body: SingleChildScrollView(
            child: Container(
          height: MediaQuery.of(context).size.height * 0.83,
          decoration: const BoxDecoration(
              color: AppTheme.ScreenBackground, borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25))),
          child: Obx(
            () => controller.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : controller.getOrderList.isNotEmpty
                    ? SingleChildScrollView(
                        child: RefreshIndicator(
                          onRefresh: controller.refreshData,
                          child: Column(
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.02,
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: controller.getOrderList.length,
                                  itemBuilder: (context, index) {
                                    return ProductsListWidgets(context, index);
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
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
        )));
  }

  // Widget ProductsListWidget(BuildContext context ,int superIndex) {
  //   final OrderListScreenController controller = Get.find<OrderListScreenController>();
  //   return Obx(
  //         () => Container(
  //           // height: MediaQuery
  //           //     .of(context)
  //           //     .size
  //           //     .height,
  //           padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
  //           child: GridView.builder(
  //             physics: NeverScrollableScrollPhysics(),
  //             shrinkWrap: true,
  //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //               crossAxisCount: 1,
  //               childAspectRatio: 3,
  //               // crossAxisSpacing: 8,
  //               // mainAxisSpacing: 5,
  //             ),
  //             itemCount: controller.getOrderList[superIndex].productsDetails!.length,
  //             itemBuilder: (context, subIndex) {
  //               final product = controller.getOrderList[superIndex].productsDetails![subIndex];
  //               return InkWell(
  //                 onTap: () {
  //                   controller.userDataProvider
  //                       .SetCustomerOrderList(controller.getOrderList[superIndex]);
  //                   Get.to(MyOrderScreen());
  //                 },
  //                 child: Card(
  //                   shadowColor: Colors.grey,
  //                   color: Colors.white,
  //                   elevation: 5,
  //                   shape: RoundedRectangleBorder(
  //                     borderRadius: BorderRadius.circular(20),
  //                   ),
  //                   child: Container(
  //                     padding: EdgeInsets.symmetric(horizontal: 10),
  //                     child: Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                       children: [
  //                         MyOrderListCommonComponent(
  //                           productImage: product.productImage ?? "",
  //                           productName: product.productName ?? "",
  //                           productQty: product.productQty ?? "",
  //                           productPrice: product.productPrice ?? "",
  //                           picUpTime: controller.getOrderList[superIndex].pickupTime?.toString() ?? "",
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //               );
  //             },
  //           ),
  //         ),
  //   );
  // }

  Widget ProductsListWidgets(BuildContext context, int superIndex) {
    OrderListScreenController controller = Get.put(OrderListScreenController());
    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(),
        child: controller.getOrderList[superIndex].productsDetails!.isNotEmpty
            ? controller.initialLoading.isFalse
                ? Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        child: GridView.count(
                          physics: const ScrollPhysics(),
                          crossAxisCount: 1,
                          childAspectRatio: 3,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 5,
                          shrinkWrap: true,
                          children: List.generate(
                            controller.getOrderList[superIndex].productsDetails!.length,
                            (subIndex) {
                              return InkWell(
                                onTap: () {
                                  controller.userDataProvider.SetCustomerOrderList(controller.getOrderList[superIndex]);
                                  Get.to(MyOrderScreen());
                                },
                                child: Card(
                                  shadowColor: Colors.grey,
                                  color: Colors.white,
                                  //surfaceTintColor: Colors.grey,
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.only(right: 10, left: 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        MyOrderListCommonComponent(
                                          productImage: controller.getOrderList[superIndex].productsDetails![subIndex].productImage ?? "",
                                          productName: controller.getOrderList[superIndex].productsDetails![subIndex].productName ?? "",
                                          productQty: controller.getOrderList[superIndex].productsDetails![subIndex].productQty ?? "",
                                          productPrice: controller.getOrderList[superIndex].productsDetails![subIndex].productPrice ?? "",
                                          picUpTime: controller.getOrderList[superIndex].pickupTime.toString() != ""
                                              ? " ${controller.getOrderList[superIndex].pickupTime.toString()}"
                                              : "",
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  )
                : Container()
            : Center(
                child: Container(),
              ),
      ),
    );
  }
}

// Widget ProductsListWidgets(BuildContext context , int superIndex) {
//   OrderListScreenController controller =
//   Get.put(OrderListScreenController());
//   return SingleChildScrollView(
//     scrollDirection: Axis.vertical,
//     child: Obx(() => Padding(
//       padding: const EdgeInsets.symmetric(),
//       child: controller.getOrderList[superIndex].productsDetails!.isNotEmpty
//           ? SingleChildScrollView(
//         child: controller.initialLoading.isFalse
//             ? Column(
//           children: [
//             Container(
//               padding: EdgeInsets.symmetric(
//                 horizontal: 10,
//                 vertical: 10,
//               ),
//               child: GridView.count(
//                 physics: ScrollPhysics(),
//                 crossAxisCount: 1,
//                 childAspectRatio: 3,
//                 crossAxisSpacing: 8,
//                 mainAxisSpacing: 5,
//                 shrinkWrap: true,
//
//
//                 children: List.generate(
//                   controller.getOrderList[superIndex].productsDetails!.length,
//                       (subIndex) {
//                     return InkWell(
//                       onTap: () {
//                         controller.userDataProvider
//                             .SetCustomerOrderList(controller
//                             .getOrderList[superIndex]);
//                         Get.to(MyOrderScreen());
//                       },
//                       child: Card.filled(
//                         shadowColor: Colors.grey,
//                         color: Colors.white,
//                         //surfaceTintColor: Colors.grey,
//                         elevation: 5,
//                         shape: RoundedRectangleBorder(
//                           borderRadius:
//                           BorderRadius.circular(20),
//                         ),
//                         child: Container(
//                           padding: EdgeInsets.only(
//                               right: 10, left: 10),
//                           child: Row(
//                             mainAxisAlignment:
//                             MainAxisAlignment
//                                 .spaceEvenly,
//                             children: [
//
//
//                               MyOrderListCommonComponent(
//
//                                 productImage:
//
//                                 controller.getOrderList[superIndex].productsDetails![subIndex].productImage
//                                     ??
//                                     "",
//                                 productName: controller.getOrderList[superIndex].productsDetails![subIndex].
//                                 productName ??
//                                     "",
//                                 productQty: controller.getOrderList[superIndex].productsDetails![subIndex].productQty
//                                     ??
//                                     "",
//                                 productPrice: controller.getOrderList[superIndex].productsDetails![subIndex].
//                                 productPrice  ??
//                                     "",
//
//
//                                 picUpTime: controller
//                                     .getOrderList[
//                                 superIndex]
//                                     .pickupTime
//                                     .toString() !=
//                                     null
//                                     ? " ${controller.getOrderList[superIndex].pickupTime.toString()}"
//                                     : "",
//                               )
//
//
//                             ],
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ),
//           ],
//         )
//             : Center(
//           child: Container(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SizedBox(height: 100),
//                 Image.asset("assets/images/nodata.png"),
//                 SizedBox(height: 20),
//               ],
//             ),
//           ),
//         ),
//       )
//           : Center(
//         child: Container(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox(height: 100),
//               Image.asset("assets/images/nodata.png"),
//               SizedBox(height: 20),
//             ],
//           ),
//         ),
//       ),
//     )),
//   );
// }

// Widget SearchProductsListWidgets(BuildContext context) {
//   return Expanded(
//     child: SingleChildScrollView(
//       scrollDirection: Axis.vertical,
//       child: Obx(() => Padding(
//             padding: const EdgeInsets.symmetric(),
//             child: controller.searchproduct!.value.isNotEmpty
//                 ? SingleChildScrollView(
//                     child: controller.initialLoading.isFalse
//                         ? Column(
//                             children: [
//                               Container(
//                                 padding: EdgeInsets.symmetric(
//                                   horizontal: 10,
//                                   vertical: 10,
//                                 ),
//                                 //color: Colors.blue,
//                                 child: GridView.count(
//                                   physics: ScrollPhysics(),
//                                   crossAxisCount: 2,
//                                   childAspectRatio: 0.65,
//                                   crossAxisSpacing: 8,
//                                   mainAxisSpacing: 5,
//                                   shrinkWrap: true,
//                                   children: List.generate(
//                                     controller.searchproduct.length,
//                                     (index) {
//                                       return InkWell(
//                                         onTap: () {
//                                          // controller.userDataProvider
//                                          //      .SetProduct(controller
//                                          //          .searchproduct[index]);
//                                           Get.toNamed(AppRoutes
//                                               .producthomescreen.toName);
//                                         },
//                                         child: Card(
//                                           shape: RoundedRectangleBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(20),
//                                           ),
//                                           child: Container(
//                                             padding: EdgeInsets.only(
//                                                 right: 10, left: 10),
//                                             child: Column(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment
//                                                       .spaceEvenly,
//                                               children: [
//                                                 ProductDisplayCommonComponent(
//                                                   productimage: controller
//                                                           .searchproduct[
//                                                               index]
//                                                           .productImage ??
//                                                       "",
//                                                   productname: controller
//                                                           .searchproduct[
//                                                               index]
//                                                           .productName ??
//                                                       "",
//                                                   productCategory: controller
//                                                           .searchproduct[
//                                                               index]
//                                                           .productCategory
//                                                           .toString() ??
//                                                       "",
//                                                   productprice: controller
//                                                           .searchproduct[
//                                                               index]
//                                                           .productPrice ??
//                                                       "",
//                                                   productQty: controller
//                                                           .searchproduct[
//                                                               index]
//                                                           .productQty ??
//                                                       "",
//                                                 )
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                       );
//                                     },
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           )
//                         : Center(
//                             child: Container(
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   SizedBox(height: 100),
//                                   Image.asset("assets/images/nodata.png"),
//                                   SizedBox(height: 20),
//                                 ],
//                               ),
//                             ),
//                           ),
//                   )
//                 : Center(
//                     child: Container(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           SizedBox(height: 100),
//                           Image.asset("assets/images/nodata.png"),
//                           SizedBox(height: 20),
//                         ],
//                       ),
//                     ),
//                   ),
//           )),
//     ),
//   );
// }
