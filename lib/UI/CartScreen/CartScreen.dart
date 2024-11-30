import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../Components/AppTheme.dart';
import '../../Components/CartCommonComponent.dart';
import '../../Components/Forms.dart';
import '../../Controller/CartScreenController.dart';
import '../../utility/BottomNavigationBar.dart';
import 'checkOutScreen.dart';

class CartScreen extends GetView<CartScreenController> {
  CartScreen({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Format amount with commas
  String formatAmount(String amount) {
    final formatter = NumberFormat('#,##0');
    int parsedAmount = int.tryParse(amount) ?? 0;
    return formatter.format(parsedAmount);
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    final CartScreenController controller = Get.put(CartScreenController());

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
                controller.refreshCartData(); // Ensure cart data is refreshed when returning to CartScreen
  Get.off(() => const navigateBar(initialIndex: 1));
  return false;

            },
            child: Scaffold(
              key: _scaffoldKey,
              appBar: _buildAppBar(controller),
              body: Obx(() {
                if (controller.cartProductLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (controller.CartProdct.isEmpty) {
                  return _buildEmptyCartMessage();
                }

                return Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: _buildCartDetails(context, controller, height),
                      ),
                    ),
                    _buildFooter(controller, height),
                  ],
                );
              }),
            ),
          ),
        );
      },
    );
  }

  AppBar _buildAppBar(CartScreenController controller) {
    return AppBar(
      backgroundColor: AppTheme.Buttoncolor,
      automaticallyImplyLeading: false,
      elevation: 0.0,
      toolbarHeight: 50,
      leading: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: InkWell(
          onTap: () {
            controller.refreshCartData();
            Get.off(() => navigateBar(initialIndex: 1));
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
      ),
      title: Text(
        "My cart detail",
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 17,
          fontWeight: FontWeight.w600,
        ),
      ),
      centerTitle: true,
    );
  }

  Widget _buildEmptyCartMessage() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/nodata.png", height: 150),
          const SizedBox(height: 20),
          Text(
            "Your cart is empty.",
            style: GoogleFonts.poppins(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildCartDetails(BuildContext context, CartScreenController controller, double height) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const SizedBox(height: 30),
              Container(
                height: height * 0.02,
                decoration: const BoxDecoration(color: Colors.white24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Delivery in 8 minutes",
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Text(
                        "8 items",
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
        CartListView(context),
      ],
    );
  }

  Widget _buildFooter(CartScreenController controller, double height) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Row(
            children: [
              _buildPickupButton(controller),
              _buildDeliveryButton(controller),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: Obx(() {
                  return controller.isLoading.value
                      ? const CircularProgressIndicator()
                      : Column(
                          children: [
                            Text(
                              "Total: ₹ ${controller.total.value}",
                              style: GoogleFonts.roboto(
                                color: Colors.black,
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            if (controller.amountSaved.value != "0.00")
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/tag.svg',
                                    color: AppTheme.Buttoncolor,
                                    width: 18,
                                    height: 18,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    "Saved: ₹ ${controller.amountSaved.value}",
                                    style: GoogleFonts.roboto(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        );
                }),
              ),
              Expanded(
                child: Center(
                  child: Button(
                    heightFactor: 0.06,
                    onPressed: () {
                      Get.to(() => CheckOutScreen());
                    },
                    child: Obx(
                      () => Text(
                        controller.checkOut.toString(),
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildPickupButton(CartScreenController controller) {
    return Expanded(
      child: Obx(
        () => TextButton(
          style: TextButton.styleFrom(
            backgroundColor: controller.selectedButton.value == 1
                ? AppTheme.Buttoncolor.withOpacity(0.5)
                : Colors.white,
            side: BorderSide(
              color: controller.selectedButton.value == 1
                  ? AppTheme.Buttoncolor
                  : Colors.grey.withOpacity(0.5),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () {
            controller.selectedButton.value = 1;
            controller.userDataProvider.setGetItNow(controller.selectedButton.value);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.electric_bolt_sharp, size: 16, color: Colors.black),
              const SizedBox(width: 8),
              Text(
                "Pick Up",
                style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDeliveryButton(CartScreenController controller) {
    return Expanded(
      child: Obx(
        () => TextButton(
          style: TextButton.styleFrom(
            backgroundColor: controller.selectedButton.value == 2
                ? AppTheme.Buttoncolor.withOpacity(0.5)
                : Colors.white,
            side: BorderSide(
              color: controller.selectedButton.value == 2
                  ? AppTheme.Buttoncolor
                  : Colors.grey.withOpacity(0.5),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () {
            controller.selectedButton.value = 2;
            controller.userDataProvider.setGetItNow(controller.selectedButton.value);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.schedule, size: 16, color: Colors.black),
              const SizedBox(width: 8),
              Text(
                "Delivery",
                style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget CartListView(BuildContext context) {
    return Obx(
      () => controller.CartProdct.isNotEmpty
          ? ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.CartProdct.length,
              itemBuilder: (context, index) {
                
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
                        productPrice: controller.CartProdct[index].productPriceDuplicate ?? "",
                        // Display calculated price here
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
                        counter: controller.CartProdct[index].cartQty ?? 1,
                        index: index,
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
