import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grosshop/UI/Addresses/addNewAddressScreen.dart';
import 'package:grosshop/UI/CartScreen/checkOutScreen.dart';
import 'package:intl/intl.dart';

import '../../Components/AppTheme.dart';
import '../../Components/CartCommonComponent.dart';
import '../../Components/Forms.dart';
import '../../Controller/CartScreenController.dart';
import '../../utility/BottomNavigationBar.dart';

class CartScreen extends GetView<CartScreenController> {
  CartScreen({Key? key}) : super(key: key);

  bool isSelected = false;

  // get index => controller.CartProdcts[index];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.height;
    CartScreenController Controller = Get.put(CartScreenController());
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      // controller.GetCartApi();
    });
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    // String formatAmount(int amount) {
    //   final formatter = NumberFormat('#,##0');
    //   return formatter.format(amount);
    // }
    String formatAmount(String amount) {
      final formatter = NumberFormat('#,##0');
      int parsedAmount = int.tryParse(amount) ?? 0; // Parse the string to int
      return formatter.format(parsedAmount);
    }

    // Controller.UpdateTotalPrice.value = "0";
    // for (int i = 0; i < Controller.CartProdct.length; i++) {
    //   String productPrice = Controller.CartProdct[i].productPrice.toString();
    //   String updatePrice = Controller.UpdateTotalPrice.value;
    //   int num1 = int.parse(productPrice);
    //   int num2 = int.parse(updatePrice);
    //   int result = num1 + num2;
    //   Controller.UpdateTotalPrice.value = result.toString();
    //   print(" Total price : ${Controller.UpdateTotalPrice.value}");
    // }
    return GetBuilder<CartScreenController>(
      init: CartScreenController(),
      builder: (controller) {
        return Theme(
          data: Theme.of(context).copyWith(
            dividerTheme: const DividerThemeData(
              color: Colors.transparent,
            ),
          ),
          child: WillPopScope(
            onWillPop: () async {
              controller.refreshCartData();
              Get.off(() => const navigateBar(initialIndex: 1));
              // Get.back();
              return false;
            },
            child: Scaffold(
              key: _scaffoldKey,
              persistentFooterButtons: [
                Obx(
                  () => controller.CartProdct.isEmpty
                      ? Container()
                      : Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Row(
                                children: [
                                  Obx(() => Expanded(
                                        child: Center(
                                          child: TextButton(
                                            style: TextButton.styleFrom(
                                              minimumSize: const Size(170, 50),
                                              splashFactory: NoSplash.splashFactory,
                                              elevation: 0,
                                              backgroundColor:
                                                  controller.selectedButton.value == 1 ? AppTheme.Buttoncolor.withOpacity(0.5) : Colors.white,
                                              side: BorderSide(
                                                color: controller.selectedButton.value == 1 ? AppTheme.Buttoncolor : Colors.grey.withOpacity(0.5),
                                              ),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 36), // Height approximation
                                            ),
                                            onPressed: () {
                                              controller.selectedButton.value = 1;
                                              controller.userDataProvider.setGetItNow(controller.selectedButton.value.toString());
                                              // Get.to(CheckOutScreen());
                                            },
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text.rich(
                                                  TextSpan(
                                                    children: [
                                                      WidgetSpan(
                                                        child: Icon(
                                                          Icons.electric_bolt_sharp, // Choose your icon
                                                          size: 16, // Adjust the icon size to match text
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: " Pick Up",
                                                        style: GoogleFonts.poppins(
                                                          color: Colors.black,
                                                          fontSize: 13,
                                                          fontWeight: FontWeight.w400,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                /*Text(
                                              "Get it in minutes",
                                              style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),*/
                                              ],
                                            ),
                                          ),
                                        ),
                                      )),
                                  Obx(() => Expanded(
                                        child: Center(
                                          child: TextButton(
                                            style: TextButton.styleFrom(
                                              minimumSize: Size(170, 50),
                                              splashFactory: NoSplash.splashFactory,
                                              elevation: 0,
                                              backgroundColor:
                                                  controller.selectedButton.value == 2 ? AppTheme.Buttoncolor.withOpacity(0.5) : Colors.white,
                                              side: BorderSide(
                                                color: controller.selectedButton.value == 2 ? AppTheme.Buttoncolor : Colors.grey.withOpacity(0.5),
                                              ),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 36), // Height approximation
                                            ),
                                            onPressed: () {
                                              controller.selectedButton.value = 2;
                                              controller.userDataProvider.setGetItNow(controller.selectedButton.value.toString());
                                              // Get.to(CheckOutScreen());
                                            },
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text.rich(
                                                  TextSpan(
                                                    children: [
                                                      WidgetSpan(
                                                        child: Icon(
                                                          Icons.schedule, // Choose your icon
                                                          size: 16, // Adjust the icon size to match text
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: " Delivery",
                                                        style: GoogleFonts.poppins(
                                                          color: Colors.black,
                                                          fontSize: 13,
                                                          fontWeight: FontWeight.w400,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),

                                              ],
                                            ),
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Obx(() {
                                          return controller.isLoading.value
                                              ? const CircularProgressIndicator()
                                              : Column(
                                                  children: [
                                                    Center(
                                                      child: Text(
                                                        "Total: ₹ ${controller.total.value}",
                                                        style: GoogleFonts.roboto(
                                                          color: Colors.black,
                                                          fontSize: 19,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                    controller.amountSaved.value != "0.00"
                                                        ? Center(
                                                            child: RichText(
                                                              text: TextSpan(
                                                                children: [
                                                                  WidgetSpan(
                                                                    child: SvgPicture.asset(
                                                                      'assets/icons/tag.svg',
                                                                      color: AppTheme.Buttoncolor,
                                                                      width: 18,
                                                                      height: 18,
                                                                    ),
                                                                  ),
                                                                  const WidgetSpan(child: SizedBox(width: 8)), // Space between icon and text
                                                                  TextSpan(
                                                                    text: "Saved: ₹ ${controller.amountSaved.value}",
                                                                    style: GoogleFonts.roboto(
                                                                      color: Colors.black,
                                                                      fontSize: 12,
                                                                      fontWeight: FontWeight.bold,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          )
                                                        : SizedBox(),
                                                  ],
                                                );
                                        }),
                                      ),
                                      Expanded(
                                        child: Center(
                                          child: Button(
                                              heightFactor: 0.06,
                                              onPressed: () {
                                                // controller.updateCartQuantities();
                                                Get.to(() => CheckOutScreen());
                                              },
                                              child: Obx(
                                                () => Text(
                                                  /*controller.selectedButton.value == 1 ? */
                                                  controller.checkOut.toString() /*: controller.selectSlot.toString()*/,
                                                  style: GoogleFonts.poppins(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              )),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                )
              ],
              appBar: AppBar(
                backgroundColor: AppTheme.Buttoncolor,
                automaticallyImplyLeading: false,
                bottomOpacity: 0.0,
                elevation: 0.0,
                toolbarHeight: 50,

                leading: Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 20, right: 0, left: 15),
                  child: InkWell(
                    onTap: () {
                      // controller.userDataProvider.getCounterClear;
                      controller.refreshCartData();
                      Get.off(() => navigateBar(initialIndex: 1));
                      // Get.back(result: false);
                    },

                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white, // customize color as per requirement
                    ),
                    /*),*/
                  ),
                ),
                title: Text("My cart detail",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    )),
                centerTitle: true,
                actions: <Widget>[],
              ),
              body: SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                      color: AppTheme.ScreenBackground, borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25))),
                  child: Obx(
                    () => controller.isLoading.value
                        ? const Center(
                            child: Image(
                              height: 30,
                              width: 30,
                              image: AssetImage("assets/images/vkart_10.png"),
                            ),
                          )
                        : controller.CartProdct.isNotEmpty
                            ? Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 50),
                                          child: Container(
                                            height: height * 0.02,
                                            decoration: BoxDecoration(color: Colors.white24),
                                            child: Row(
                                              children: [
                                                Text.rich(
                                                  TextSpan(
                                                    children: [
                                                      const WidgetSpan(
                                                        child: Icon(
                                                          Icons.location_on_outlined, // Choose your icon
                                                          size: 16, // Adjust the icon size to match text
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: " Deliver to",
                                                        style: GoogleFonts.poppins(
                                                          color: Colors.black,
                                                          fontSize: 13,
                                                          fontWeight: FontWeight.w400,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      " Office",
                                                      style: GoogleFonts.poppins(
                                                        color: Colors.black,
                                                        fontSize: 13,
                                                        fontWeight: FontWeight.w400,
                                                      ),
                                                    ),
                                                    Center(child: const Icon(Icons.arrow_drop_down)),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 170),
                                                      child: InkWell(
                                                        onTap: () {
                                                          Get.to(() => AddNewAddressScreen());
                                                        },
                                                        child: Container(
                                                          height: height * 0.4,
                                                          width: width * 0.1,
                                                          decoration: BoxDecoration(
                                                            color: AppTheme.Buttoncolor.withOpacity(0.3),
                                                            border: Border.all(
                                                              color: AppTheme.Buttoncolor,
                                                            ),
                                                            borderRadius: BorderRadius.circular(1),
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              "Change",
                                                              style: GoogleFonts.poppins(
                                                                color: Colors.black,
                                                                fontSize: 12,
                                                                fontWeight: FontWeight.w400,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Obx(() => Text(
                                                      controller.address.toString(),
                                                      style: GoogleFonts.poppins(
                                                        color: Colors.black,
                                                        fontSize: 13,
                                                        fontWeight: FontWeight.w400,
                                                      ),
                                                    )),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 10),
                                          child: Container(
                                            height: height * 0.02,
                                            decoration: BoxDecoration(color: Colors.white24),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Delivery in 8 minutes",
                                                  style: GoogleFonts.poppins(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Row(children: [
                                          SizedBox(
                                            height: MediaQuery.of(context).size.height * 0.01,
                                          )
                                        ]),
                                      ],
                                    ),
                                  ),
                                  CartListView(context)
                                ],
                              )
                            : Center(
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(height: 100),
                                      Image.asset("assets/images/nodata.png"),
                                      SizedBox(height: 20),
                                    ],
                                  ),
                                ),
                              ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget CartListView(BuildContext context) {
    return Obx(
      () => controller.CartProdct.value.isNotEmpty
          ? ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.CartProdct.length,
              itemBuilder: (context, index) {
                // Calculate price for each product based on quantity
          

                return Card(
                  shadowColor: Colors.grey.withOpacity(0.5),
                  color: Colors.white,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      CartCommonComponent(
                        productImage: controller.CartProdct[index].productImage ?? "",
                        productName: controller.CartProdct[index].productName ?? "",
                        productQty: controller.CartProdct[index].productQty ?? "",
                        productPriceChangeable: controller.CartProdct[index].actualPrice /*totalItemPrice.toDouble()*/,
                        productPrice: controller.CartProdct[index].productPriceDuplicate ?? "", // Display calculated price here
                        productDescription: "",
                        productDiscountPrice: controller.CartProdct[index].productDiscountPrice.toString(),
                        discountAvailable: controller.CartProdct[index].discountAvailable,
                        OnPressed: () async {
                          controller.index = index;
                          controller.DeleteCartApi(index);
                          controller.update();
                        },
                        decrementCounter: () async {
                          if (!controller.getLoading(index)) {
                            controller.setLoading(index, true);
                            // Call your logic here
                            await controller.decrementCounter(Scaffold.of(context).context, index);
                            print("Increment onTap triggered for index $index");

                            // After the operation finishes
                            controller.setLoading(index, false);
                          }
                        },
                        incrementCounter: () async {
                          if (!controller.getLoading(index)) {
                            controller.setLoading(index, true);
                            // Call your logic here
                            await controller.incrementCounter(Scaffold.of(context).context, index);
                            print("Increment onTap triggered for index $index");

                            // After the operation finishes
                            controller.setLoading(index, false);
                          }
                        },
                        counter: controller.CartProdct[index].cartQty ?? 1, index: index,
                      ),
                    ],
                  ),
                );
              },
            )
          : Center(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 100),
                    Image.asset("assets/images/nodata.png"),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
    );
  }
}
