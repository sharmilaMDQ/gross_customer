import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Components/AppTheme.dart';
import '../../Components/Forms.dart';
import '../../Controller/CheckOutScreenController.dart';
import '../../Forms/AppSnackBar.dart';
import '../Addresses/addNewAddressScreen.dart';

class CheckOutScreen extends GetView<CheckOutScreenController> {
  CheckOutScreen({Key? key}) : super(key: key);

  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.height;
    CheckOutScreenController Controller = Get.put(CheckOutScreenController());
    // String formatAmount(int amount) {
    //   final formatter = NumberFormat('#,##0');
    //   return formatter.format(amount);
    // }
    // String formatAmount(String amount) {
    //   final formatter = NumberFormat('#,##0');
    //   int parsedAmount = int.tryParse(amount) ?? 0; // Parse the string to int
    //   return formatter.format(parsedAmount);
    // }
    //
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
    print("jtjftjfd${controller.CartProdct.length}");
    /* return GetBuilder<CheckOutScreenController>(
      init: CheckOutScreenController(),
      builder: (controller) {
        return Theme(
          data: Theme.of(context).copyWith(
            dividerTheme: const DividerThemeData(
              color: Colors.transparent,
            ),
          ),
          child: Scaffold(

            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Cart Total',
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Obx(
                            () => Text(
                              controller.UpdateTotalPrice.value,
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Text(
                            '9000 Young Street store',
                            style: GoogleFonts.poppins(
                              color: Colors.black87,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 400,
                          width: MediaQuery.of(context).size.width,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 45,
                                  child: Container(
                                    // decoration:
                                    // BoxDecoration(
                                    //   color: isSelected
                                    //       ? AppTheme
                                    //       .Buttoncolor
                                    //       : AppTheme
                                    //       .BorderColor,
                                    //   borderRadius:
                                    //   BorderRadius
                                    //       .circular(
                                    //       20),
                                    //   border:
                                    //   Border.all(
                                    //     color: Colors
                                    //         .orange,
                                    //   ),
                                    // ),
                                    child: TabBar(
                                      onTap: (int) {},
                                      unselectedLabelColor: Colors.black,
                                      indicatorSize: TabBarIndicatorSize.tab,
                                      indicator: BoxDecoration(
                                          gradient: LinearGradient(colors: [AppTheme.Buttoncolor, AppTheme.lightGreen]),
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.redAccent),
                                      labelColor: Colors.white,
                                      // unselectedLabelColor:
                                      // Colors
                                      //     .black87,
                                      // indicator:
                                      // BoxDecoration(
                                      //   color: Colors
                                      //       .blue,
                                      //   borderRadius:
                                      //   BorderRadius
                                      //       .circular(
                                      //       5),
                                      // ),
                                      labelStyle: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      tabs: [
                                        Tab(
                                          text: 'Pickup',
                                        ),
                                        Tab(
                                          text: 'Delivery',
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 15),
                                SizedBox(
                                  height: 350,
                                  child: Expanded(
                                    child: TabBarView(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            height: 300,
                                            child: SingleChildScrollView(
                                              child: Column(
                                                children: [
                                                  // Padding(
                                                  //   padding: EdgeInsets.symmetric(
                                                  //     horizontal: 10,
                                                  //   ),
                                                  //   child: TextInput1(
                                                  //
                                                  //     label: "",
                                                  //     onPressed: () {
                                                  //       showBottomTimePicker(
                                                  //           context, controller.timeOfBirthController);
                                                  //     },
                                                  //
                                                  //     controller: controller.timeOfBirthController,
                                                  //     textInputType: TextInputType.number,
                                                  //     textColor: Color(0xCC252525),
                                                  //     hintText: "Enter Pick up Time",
                                                  //     onTextChange: (String) {},
                                                  //     sufficIcon: Icon(Icons.access_time,size: 20, color: AppTheme.Buttoncolor,),
                                                  //   ),
                                                  // ),
                                                  Container(
                                                    height: 50,
                                                    width: MediaQuery.of(context).size.width * 0.9,
                                                    child: TextFormField(
                                                      onTap: () {
                                                        showBottomTimePicker(context, controller.pickUptimeController);
                                                      },
                                                      readOnly: true,
                                                      controller: controller.pickUptimeController,
                                                      decoration: InputDecoration(
                                                          border: OutlineInputBorder(),
                                                          enabledBorder: OutlineInputBorder(
                                                            borderSide: BorderSide(color: AppTheme.Buttoncolor),
                                                            borderRadius: BorderRadius.circular(10),
                                                          ),
                                                          focusedBorder: OutlineInputBorder(
                                                            borderSide: BorderSide(color: AppTheme.Buttoncolor),
                                                            borderRadius: BorderRadius.circular(10),
                                                          ),
                                                          hintText: 'Choose a pick time',
                                                          hintStyle: GoogleFonts.poppins(
                                                            color: Colors.black26,
                                                            fontSize: 12,
                                                            fontWeight: FontWeight.w600,
                                                          ),
                                                          suffixIcon: Icon(
                                                            Icons.access_time,
                                                            size: 20,
                                                            color: AppTheme.Buttoncolor,
                                                          )),
                                                    ),
                                                  ),
                                                  SizedBox(height: 15),
                                                  Obx(
                                                    () => DropdownButtonFormField<String>(
                                                      value: controller.selectedCategory.value.isEmpty ? null : controller.selectedCategory.value,
                                                      decoration: InputDecoration(
                                                        hintText: controller.productCategoryDropdown.value,
                                                        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                                        hintStyle: GoogleFonts.poppins(
                                                          color: Colors.black26,
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.w600,
                                                        ),
                                                        border: OutlineInputBorder(),
                                                        enabledBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(color: AppTheme.Buttoncolor),
                                                          borderRadius: BorderRadius.circular(10),
                                                        ),
                                                        focusedBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(color: AppTheme.Buttoncolor),
                                                          borderRadius: BorderRadius.circular(10),
                                                        ),
                                                      ),
                                                      items: controller.categories
                                                          .map((category) => DropdownMenuItem(
                                                                value: category,
                                                                child: Text(category),
                                                              ))
                                                          .toList(),
                                                      onChanged: (value) {
                                                        controller.selectedCategory.value = value ?? '';
                                                        controller.productCategoryController.text = value ?? '';
                                                      },
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                  Container(
                                                    height: 50,
                                                    width: MediaQuery.of(context).size.width * 0.9,
                                                    child: TextFormField(
                                                      keyboardType: TextInputType.phone,
                                                      controller: controller.mobileNumberController,
                                                      decoration: InputDecoration(
                                                          border: OutlineInputBorder(),
                                                          enabledBorder: OutlineInputBorder(
                                                            borderSide: BorderSide(color: AppTheme.Buttoncolor),
                                                            borderRadius: BorderRadius.circular(10),
                                                          ),
                                                          focusedBorder: OutlineInputBorder(
                                                            borderSide: BorderSide(color: AppTheme.Buttoncolor),
                                                            borderRadius: BorderRadius.circular(10),
                                                          ),
                                                          hintText: 'Enter Your Mobile Number',
                                                          hintStyle: GoogleFonts.poppins(
                                                            color: Colors.black26,
                                                            fontSize: 12,
                                                            fontWeight: FontWeight.w600,
                                                          ),
                                                          suffixIcon: Icon(
                                                            Icons.settings_phone,
                                                            size: 20,
                                                            color: AppTheme.Buttoncolor,
                                                          )),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                  //
                                                  // Center(
                                                  //   child: Button(
                                                  //     widthFactor: 0.9,
                                                  //     heightFactor: 0.06,
                                                  //     onPressed: () async {
                                                  //       // Set the pickup method
                                                  //       controller.pickupMethods.value =
                                                  //           "PickUp"; // Ensure you're using the correct method to set the value
                                                  //       AppPreference().updatePicUp("PickUp"); // Save the pickup method preference
                                                  //
                                                  //       // Call the GetCartPlaceItemsApi and wait for it to complete
                                                  //       await controller.GetCartPlaceItemsApi(context);
                                                  //
                                                  //       // Delete the cart item only after the previous API call is complete
                                                  //       await controller.DeleteCartApi(); // Ensure this call returns a Future
                                                  //     },
                                                  //     child: Text(
                                                  //       'Checkout',
                                                  //       style: GoogleFonts.poppins(
                                                  //         color: Colors.white,
                                                  //         fontSize: 18,
                                                  //         fontWeight: FontWeight.w400,
                                                  //       ),
                                                  //     ),
                                                  //   ),
                                                  // ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            height: 300,
                                            child: SingleChildScrollView(
                                                child: Column(
                                              children: [
                                                Container(
                                                  height: 50,
                                                  width: MediaQuery.of(context).size.width * 0.9,
                                                  child: TextFormField(
                                                    readOnly: true,
                                                    controller: controller.addressController,
                                                    onTap: () async {},
                                                    decoration: InputDecoration(
                                                        border: OutlineInputBorder(),
                                                        enabledBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(color: AppTheme.Buttoncolor),
                                                          borderRadius: BorderRadius.circular(10),
                                                        ),
                                                        focusedBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(color: AppTheme.Buttoncolor),
                                                          borderRadius: BorderRadius.circular(10),
                                                        ),
                                                        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                                        hintText: 'Enter your address',
                                                        hintStyle: GoogleFonts.poppins(
                                                          color: Colors.black,
                                                          fontSize: 10,
                                                          fontWeight: FontWeight.w400,
                                                        ),
                                                        suffixIcon: Icon(
                                                          Icons.location_on_outlined,
                                                          size: 20,
                                                          color: AppTheme.Buttoncolor,
                                                        )),
                                                  ),
                                                ),
                                                SizedBox(height: 15),
                                                Obx(
                                                  () => DropdownButtonFormField<String>(
                                                    value: controller.selectedCategory.value.isEmpty ? null : controller.selectedCategory.value,
                                                    decoration: InputDecoration(
                                                      hintText: controller.productCategoryDropdown.value,
                                                      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                                      hintStyle: GoogleFonts.poppins(
                                                        color: Colors.black26,
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.w600,
                                                      ),
                                                      border: OutlineInputBorder(),
                                                      enabledBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(color: AppTheme.Buttoncolor),
                                                        borderRadius: BorderRadius.circular(10),
                                                      ),
                                                      focusedBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(color: AppTheme.Buttoncolor),
                                                        borderRadius: BorderRadius.circular(10),
                                                      ),
                                                    ),
                                                    items: controller.categories
                                                        .map((category) => DropdownMenuItem(
                                                              value: category,
                                                              child: Text(category),
                                                            ))
                                                        .toList(),
                                                    onChanged: (value) {
                                                      controller.selectedCategory.value = value ?? '';
                                                      controller.productCategoryController.text = value ?? '';
                                                    },
                                                  ),
                                                ),
                                                SizedBox(height: 15),
                                                Container(
                                                  height: 50,
                                                  width: MediaQuery.of(context).size.width * 0.9,
                                                  child: TextFormField(
                                                    keyboardType: TextInputType.phone,
                                                    controller: controller.mobileNumberController,
                                                    decoration: InputDecoration(
                                                        border: OutlineInputBorder(),
                                                        enabledBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(color: AppTheme.Buttoncolor),
                                                          borderRadius: BorderRadius.circular(10),
                                                        ),
                                                        focusedBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(color: AppTheme.Buttoncolor),
                                                          borderRadius: BorderRadius.circular(10),
                                                        ),
                                                        hintText: 'Enter Your Mobile Number',
                                                        hintStyle: GoogleFonts.poppins(
                                                          color: Colors.black26,
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.w600,
                                                        ),
                                                        suffixIcon: Icon(
                                                          Icons.settings_phone,
                                                          size: 20,
                                                          color: AppTheme.Buttoncolor,
                                                        )),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 15,
                                                ),

                                                ///
                                                // Center(
                                                //   child: Button(
                                                //       widthFactor: 0.9,
                                                //       heightFactor: 0.06,
                                                //       onPressed: () {
                                                //         controller.pickupMethods.value == "delivery";
                                                //         AppPreference().updateDelivery("delivery");
                                                //         controller.GetCartPlaceItemsApi(context);
                                                //         controller.DeleteCartApi();
                                                //         Get.back();
                                                //       },
                                                //       child: controller.isLoading.value
                                                //           ? Container(
                                                //               height: height * 0.04,
                                                //               width: height * 0.04,
                                                //               child: const CircularProgressIndicator(
                                                //                 color: Colors.white,
                                                //               ))
                                                //           : Text(
                                                //               "Checkout".tr,
                                                //               style: GoogleFonts.poppins(
                                                //                 color: Colors.white,
                                                //                 fontSize: 20,
                                                //                 fontWeight: FontWeight.w400,
                                                //               ),
                                                //             )),
                                                // ),
                                              ],
                                            )),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );*/
    return GetBuilder<CheckOutScreenController>(
      init: CheckOutScreenController(),
      builder: (controller) {
        return Theme(
          data: Theme.of(context).copyWith(
            dividerTheme: const DividerThemeData(
              color: Colors.transparent,
            ),
          ),
          child: Scaffold(
            persistentFooterButtons: [
              // controller.CartProdct.value.isNotEmpty
              Column(
                children: [
                  Obx(
                    () => controller.isLoading.value
                        ? CircularProgressIndicator()
                        : Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: height * 0.2,
                                width: double.infinity,
                                color: Colors.white,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Text("Order Summary",
                                        style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        )),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Sub Total",
                                            style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize: 16,
                                            )),
                                        Text("₹ ${(controller.getCartInfos.subtotal.toString())}",
                                            style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize: 16,
                                            )),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Total Discount",
                                            style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize: 16,
                                            )),
                                        Text("₹ ${controller.getCartInfos.discount.toString()}",
                                            style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize: 16,
                                            )),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Delivery Charges",
                                            style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize: 16,
                                            )),
                                        Text("₹ ${"+ 0.00"}",
                                            style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize: 16,
                                            )),
                                      ],
                                    ),
                                    Divider(
                                      color: Colors.black.withOpacity(0.5),
                                      thickness: 0,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Your Order Total',
                                            style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize: 16,
                                            )),
                                        Text('₹ ${controller.getCartInfos.total.toString()}',
                                            style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize: 16,
                                            )),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Customer Pays',
                                            style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize: 16,
                                            )),
                                        Text('₹ ${controller.getCartInfos.total.toString()}',
                                            style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                            )),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Center(
                      child: Button(
                        widthFactor: 0.8,
                        heightFactor: 0.06,
                        onPressed: () {
                          // Get the DefaultTabController
                          // final tabController = DefaultTabController.of(context);
                          //
                          // // Check if the tabController is not null
                          // if (tabController != null) {
                          //   // Switch to the Delivery tab (index 1)
                          //   tabController.animateTo(1); // Make sure the index is 1 for Delivery
                          // }
                          // Reset the total price before calculating
                          // Controller.UpdateTotalPrice.value = "0";
                          // Get.to(AddNewAddressScreen());
                          // Loop through the cart products and calculate the total price
                          // for (int i = 0; i < Controller.CartProdct.length; i++) {
                          //   String productPrice = Controller.CartProdct[i].productPrice.toString();
                          //   String updatePrice = Controller.UpdateTotalPrice.value;
                          //   int num1 = int.parse(productPrice);
                          //   int num2 = int.parse(updatePrice);
                          //   int result = num1 + num2;
                          //   Controller.UpdateTotalPrice.value = result.toString();
                          //   print("Total price: ${Controller.UpdateTotalPrice.value}");
                          // }
                          // Optionally, you can navigate to a new screen here
                          // Get.to(() => PaymentDetailsCartScreen());
                          controller.GetCartPlaceItemsApi(context);
                        },
                        child: Text(
                          "Place Order",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              )
              // : Container(),
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
                    Get.back();
                  },
                  /*child: Container(
                    decoration: BoxDecoration(color: Colors.green.shade700, borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.symmetric(
                      horizontal: 2,
                    ),*/
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white, // customize color as per requirement
                  ),
                  /*),*/
                ),
              ),
              title: Text("Place Order",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  )),
              centerTitle: true,
              actions: <Widget>[],
            ),
            body: SingleChildScrollView(
              // physics: NeverScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      Container(
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
                                    text: " Deliver to ",
                                    style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  // Office Text
                                  Text(
                                    "Office",
                                    style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  // Arrow icon
                                  const Center(child: Icon(Icons.arrow_drop_down)),

                                  const Spacer(),

                                  InkWell(
                                    onTap: () {
                                      Get.to(() => AddNewAddressScreen());
                                    },
                                    child: Container(
                                      height: MediaQuery.of(context).size.height * 0.08, // Dynamic height based on screen height
                                      width: MediaQuery.of(context).size.width * 0.25, // Dynamic width (responsive based on screen width)
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
                                ],
                              ),
                            ),
                          ],
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
                      SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Cart Total',
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Obx(
                            () => controller.isLoading.value
                                ? Container(height: 5, width: 5, child: CircularProgressIndicator())
                                : Text(
                                    controller.getCartInfos.total != null ? controller.getCartInfos.total.toString() : "No Data",
                                    style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                          )
                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                      SizedBox(
                        height: height * 0.5,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 45,
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [AppTheme.Buttoncolor, AppTheme.lightGreen]),
                                  borderRadius: BorderRadius.circular(1),
                                ),
                                child: Center(
                                  child: Text(
                                    controller.userDataProvider.getItNow == 2 ? 'Delivery' : 'Pickup',
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            Expanded(
                              child: TabBarView(
                                physics: const NeverScrollableScrollPhysics(),
                                children: [
                                  if (controller.userDataProvider.getItNow == null || controller.userDataProvider.getItNow == 1)
                                    SingleChildScrollView(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 50,
                                              width: MediaQuery.of(context).size.width * 0.9,
                                              child: TextFormField(
                                                onTap: () {
                                                  showBottomTimePicker(context, controller.pickUptimeController);
                                                },
                                                readOnly: true,
                                                controller: controller.pickUptimeController,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  enabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: AppTheme.Buttoncolor),
                                                    borderRadius: BorderRadius.circular(10),
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: AppTheme.Buttoncolor),
                                                    borderRadius: BorderRadius.circular(10),
                                                  ),
                                                  hintText: 'Choose a pick time',
                                                  hintStyle: GoogleFonts.poppins(
                                                    color: Colors.black26,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                  suffixIcon: Icon(
                                                    Icons.access_time,
                                                    size: 20,
                                                    color: AppTheme.Buttoncolor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 15),
                                            Obx(
                                              () => DropdownButtonFormField<String>(
                                                value: controller.selectedCategory.value.isEmpty ? null : controller.selectedCategory.value,
                                                decoration: InputDecoration(
                                                  hintText: controller.productCategoryDropdown.value,
                                                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                                  hintStyle: GoogleFonts.poppins(
                                                    color: Colors.black26,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                  border: OutlineInputBorder(),
                                                  enabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: AppTheme.Buttoncolor),
                                                    borderRadius: BorderRadius.circular(10),
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: AppTheme.Buttoncolor),
                                                    borderRadius: BorderRadius.circular(10),
                                                  ),
                                                ),
                                                items: controller.categories
                                                    .map((category) => DropdownMenuItem(
                                                          value: category,
                                                          child: Text(category),
                                                        ))
                                                    .toList(),
                                                onChanged: (value) {
                                                  controller.selectedCategory.value = value ?? '';
                                                  controller.productCategoryController.text = value ?? '';
                                                },
                                              ),
                                            ),
                                            const SizedBox(height: 15),
                                            Container(
                                              height: 50,
                                              width: MediaQuery.of(context).size.width * 0.9,
                                              child: TextFormField(
                                                inputFormatters: [
                                                  FilteringTextInputFormatter.digitsOnly, // Allows only digits
                                                  LengthLimitingTextInputFormatter(10), // Limits input to 10 digits
                                                ],
                                                keyboardType: TextInputType.phone,
                                                controller: controller.mobileNumberController,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  enabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: AppTheme.Buttoncolor),
                                                    borderRadius: BorderRadius.circular(10),
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: AppTheme.Buttoncolor),
                                                    borderRadius: BorderRadius.circular(10),
                                                  ),
                                                  hintText: 'Enter Your Mobile Number',
                                                  hintStyle: GoogleFonts.poppins(
                                                    color: Colors.black26,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                  suffixIcon: Icon(
                                                    Icons.settings_phone,
                                                    size: 20,
                                                    color: AppTheme.Buttoncolor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 15),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "HAVE A COUPON?",
                                                  style: GoogleFonts.poppins(
                                                    color: Colors.black26,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              height: 50,
                                              width: MediaQuery.of(context).size.width * 0.9,
                                              child: TextFormField(
                                                keyboardType: TextInputType.text,
                                                controller: controller.couponCodeController,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  enabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: AppTheme.Buttoncolor),
                                                    borderRadius: BorderRadius.circular(10),
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: AppTheme.Buttoncolor),
                                                    borderRadius: BorderRadius.circular(10),
                                                  ),
                                                  hintText: 'Enter Your Promo Code',
                                                  hintStyle: GoogleFonts.poppins(
                                                    color: Colors.black26,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                  suffixIcon: const Padding(
                                                    padding: EdgeInsets.all(8.0),
                                                    child: SizedBox(
                                                      height: 16,
                                                      width: 16,
                                                      child: Image(
                                                        color: AppTheme.Buttoncolor,
                                                        image: AssetImage("assets/icons/promo-code.png"),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  SingleChildScrollView(
                                  physics: NeverScrollableScrollPhysics(),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Obx(
                                            () => Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  "Schedule Delivery",
                                                  style: GoogleFonts.poppins(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                Switch.adaptive(
                                                  value: controller.isAdditionalInputEnabled.value,
                                                  onChanged: (value) {
                                                    controller.isAdditionalInputEnabled.value = value;
                                                  },
                                                  activeColor: AppTheme.Buttoncolor,
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 15),
                                          Obx(
                                            () => controller.isAdditionalInputEnabled.value
                                                ? Container(
                                                    height: 50,
                                                    width: MediaQuery.of(context).size.width * 0.9,
                                                    child: TextFormField(
                                                      onTap: () {
                                                        showBottomTimePicker(context, controller.pickUptimeController);
                                                      },
                                                      readOnly: true,
                                                      controller: controller.pickUptimeController,
                                                      decoration: InputDecoration(
                                                        border: OutlineInputBorder(),
                                                        enabledBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(color: AppTheme.Buttoncolor),
                                                          borderRadius: BorderRadius.circular(10),
                                                        ),
                                                        focusedBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(color: AppTheme.Buttoncolor),
                                                          borderRadius: BorderRadius.circular(10),
                                                        ),
                                                        hintText: 'Choose a pick time',
                                                        hintStyle: GoogleFonts.poppins(
                                                          color: Colors.black26,
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.w600,
                                                        ),
                                                        suffixIcon: Icon(
                                                          Icons.access_time,
                                                          size: 20,
                                                          color: AppTheme.Buttoncolor,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                : Container(),
                                          ),
                                          const SizedBox(height: 15),
                                          Container(
                                            height: 50,
                                            width: MediaQuery.of(context).size.width * 0.9,
                                            child: TextFormField(
                                              readOnly: true,
                                              controller: controller.addressController,
                                              onTap: () async {},
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(color: AppTheme.Buttoncolor),
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(color: AppTheme.Buttoncolor),
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                                hintText: 'Enter your address',
                                                hintStyle: GoogleFonts.poppins(
                                                  color: Colors.black,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                suffixIcon: Icon(
                                                  Icons.location_on_outlined,
                                                  size: 20,
                                                  color: AppTheme.Buttoncolor,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 15),
                                          Obx(
                                            () => DropdownButtonFormField<String>(
                                              value: controller.selectedCategory.value.isEmpty ? null : controller.selectedCategory.value,
                                              decoration: InputDecoration(
                                                hintText: controller.productCategoryDropdown.value,
                                                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                                hintStyle: GoogleFonts.poppins(
                                                  color: Colors.black26,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                                border: OutlineInputBorder(),
                                                enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(color: AppTheme.Buttoncolor),
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(color: AppTheme.Buttoncolor),
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                              ),
                                              items: controller.categories
                                                  .map((category) => DropdownMenuItem(
                                                        value: category,
                                                        child: Text(category),
                                                      ))
                                                  .toList(),
                                              onChanged: (value) {
                                                controller.selectedCategory.value = value ?? '';
                                                controller.productCategoryController.text = value ?? '';
                                              },
                                            ),
                                          ),
                                          const SizedBox(height: 15),
                                          Container(
                                            height: 50,
                                            width: MediaQuery.of(context).size.width * 0.9,
                                            child: TextFormField(
                                              keyboardType: TextInputType.phone,
                                              controller: controller.mobileNumberController,
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(color: AppTheme.Buttoncolor),
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(color: AppTheme.Buttoncolor),
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                hintText: 'Enter Your Mobile Number',
                                                hintStyle: GoogleFonts.poppins(
                                                  color: Colors.black26,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                                suffixIcon: Icon(
                                                  Icons.settings_phone,
                                                  size: 20,
                                                  color: AppTheme.Buttoncolor,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 15),
                                          Container(
                                            height: 50,
                                            width: MediaQuery.of(context).size.width * 0.9,
                                            child: TextFormField(
                                              keyboardType: TextInputType.phone,
                                              controller: controller.couponCodeController,
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(color: AppTheme.Buttoncolor),
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(color: AppTheme.Buttoncolor),
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                hintText: 'Enter Your Promo Code',
                                                hintStyle: GoogleFonts.poppins(
                                                  color: Colors.black26,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                                suffixIcon: const Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: SizedBox(
                                                    height: 16,
                                                    width: 16,
                                                    child: Image(
                                                      color: AppTheme.Buttoncolor,
                                                      image: AssetImage("assets/icons/f2063f54-5cb4-490a-ad6a-786a61723a39.jpg"),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  showBottomTimePicker(
    BuildContext context,
    TextEditingController controller,
  ) {
    var times;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
              height: 280,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(height: 20, width: 20),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: Text("Select Time",
                                textAlign: TextAlign.center, style: TextStyle(color: AppTheme.appBlack, fontSize: 16, fontWeight: FontWeight.bold)),
                          ),
                        ),
                        GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Icon(Icons.clear))
                      ],
                    ),
                  ),
                  Expanded(
                    child: TimePickerSpinner(
                      is24HourMode: false,
                      spacing: 30,
                      itemHeight: 37,
                      itemWidth: 60,
                      isForce2Digits: true,
                      onTimeChange: (time) {
                        times = time;
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AppButton2(
                        width: width * 0.45,
                        height: 40,
                        title: 'Cancel',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        onPressed: () {
                          Get.back();
                        },
                        color: Colors.white,
                        titleColor: AppTheme.bottomTabsLabelInActiveColor,
                        borderColor: AppTheme.cancelBorder,
                      ),
                      AppButton2(
                        width: width * 0.45,
                        height: 40,
                        title: 'Save ',
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        onPressed: () {
                          controller.text = " ${formatDate(times, [
                                hh,
                                ':',
                                nn,
                                ' ',
                                am,
                              ])}";
                          Navigator.of(context).pop();
                        },
                        titleColor: Colors.white,
                        color: AppTheme.Buttoncolor,
                        borderColor: AppTheme.Buttoncolor,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
