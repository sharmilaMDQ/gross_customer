import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grosshop/Provider/ProductProvider.dart';
import 'package:provider/provider.dart';

import '../../Components/AppTheme.dart';
import '../../Components/ProductDisplayCommonComponent.dart';
import '../../Controller/ProductHomeScreenController.dart';
import '../../Pageroutes/App_routes.dart';

class OfferDetailScreen extends GetView<ProductHomeScreenController> {
  OfferDetailScreen({Key? key}) : super(key: key);

  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    ProductHomeScreenController homeController = Get.put(ProductHomeScreenController());
    controller.userDataProvider = Provider.of<ProductProvider>(context, listen: false);

    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      if (!controller.ishomeCall) {
        controller.ishomeCall = true;

        // controller.HomeScreenApi();
      }
    });

    return Scaffold(
      backgroundColor: AppTheme.Buttoncolor,
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: AppTheme.Buttoncolor,
        automaticallyImplyLeading: false,
        bottomOpacity: 0.0,
        elevation: 0.0,
        toolbarHeight: 80,
        leading: Padding(
          padding: EdgeInsets.only(top: 20, bottom: 20, right: 0, left: 15),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              decoration: BoxDecoration(color: Colors.green.shade700, borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.symmetric(
                horizontal: 2,
              ),
              child: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white, // customize color as per requirement
              ),
            ),
          ),
        ),
        title: Text(
          "offer Details",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: <Widget>[],
      ),

      body: Container(
        decoration: BoxDecoration(
            color: AppTheme.ScreenBackground, borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25))),
        child: Obx(() => controller.initialLoading.value
            ? Center(child: CircularProgressIndicator())
            : controller.product.isNotEmpty
                ? Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ProductsListWidgets(context),
                    ],
                  )
                : Container()),
      ),
    );
  }



  Widget ProductsListWidgets(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Obx(() => Padding(
              padding: const EdgeInsets.symmetric(),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    child: GridView.count(
                      physics: ScrollPhysics(),
                      crossAxisCount: 2,
                      childAspectRatio: 0.65,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 5,
                      shrinkWrap: true,
                      children: List.generate(
                        controller.product.length,
                        (index) {
                          return InkWell(
                            onTap: () {
                              controller.userDataProvider.SetProduct(controller.product[index]);
                              Get.toNamed(AppRoutes.producthomescreen.toName);
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
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ProductDisplayCommonComponent(
                                      productimage: controller.product[index].productImage ?? "",
                                      shopName: controller.product[index].shopName.toString() ?? "",
                                      productname: controller.product[index].productName ?? "",
                                      productCategory: controller.product[index].productCategory.toString() ?? "",
                                      productprice: controller.product[index].productPrice ?? "",
                                      productQty: controller.product[index].productQty ?? "",
                                      index: controller.counter[index].value,
                                      onTap: () {},
                                      isFavaurite: false,
                                      productDiscountPrice: '',
                                      discountAvailable: 0,
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
              )))),
    );
  }
}
