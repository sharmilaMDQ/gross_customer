import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Controller/MyOrderScreenController.dart';

class MyOrderScreen extends GetView<MyOrderScreenController> {
  final controller = Get.put(MyOrderScreenController());

  Map<String, String> extractDiscountAndSubtotal(String? billingDetails) {
    if (billingDetails == null || billingDetails.isEmpty) {
      return {"discount": "N/A", "subtotal": "N/A"}; // Handle null or empty case
    }
    try {
      // Parse the JSON string into a Map
      final Map<String, dynamic> detailsMap = jsonDecode(billingDetails);

      // Extract discount and subtotal
      final discount = detailsMap['discount'] ?? 0.0;
      final subTotal = detailsMap['subtotal'] ?? 0.0;

      // Format and return the values as strings
      return {"discount": "₹${discount.toStringAsFixed(2)}", "subtotal": "₹${subTotal.toStringAsFixed(2)}"};
    } catch (e) {
      return {"discount": "Error", "subtotal": "Error"}; // Handle invalid JSON
    }
  }

  Map<String, String> extractDeliveryDetails(String? deliveryDetails) {
    if (deliveryDetails == null || deliveryDetails.isEmpty) {
      return {"address": "N/A"}; // Handle null or empty case
    }
    try {
      // Parse the JSON string into a Map
      final Map<String, dynamic> detailsMap = jsonDecode(deliveryDetails);

      final address = detailsMap['address'] ?? 0.0;

      // Format and return the values as strings
      return {"address": "${address}"};
    } catch (e) {
      return {
        "address": "Error",
      }; // Handle invalid JSON
    }
  }

  @override
  Widget build(BuildContext context) {
    final billingDetails = controller.getParticularOrderList?.billingDetails.toString();
    final deliveryDetails = controller.getParticularOrderList?.deliveryDetails.toString();
    final billingInfo = extractDiscountAndSubtotal(billingDetails);
    final deliveryInfo = extractDeliveryDetails(deliveryDetails);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green.shade700,
          title: Text(
            "Order Status",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Obx(
          () => controller.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Delivery Information
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Delivery Tomorrow 6:00 PM - 8:00 PM",
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        deliveryInfo['address'] ?? "N/A",
                                        style: GoogleFonts.poppins(
                                          fontSize: MediaQuery.of(context).size.width * 0.035,
                                          color: Colors.black54,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 16),

                        // Invoice Summary
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "INVOICE SUMMARY",
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                                Divider(thickness: 1, color: Colors.black26),
                                buildRow("Payment Mode", controller.getParticularOrderList?.paymentGateway.toString() ?? ""),
                                buildRow("Order ID", controller.getParticularOrderList?.orderId.toString() ?? ""),
                                buildRow("Date", controller.getParticularOrderList?.createdAt.toString() ?? ""),
                                buildRow("Order Status", controller.getParticularOrderList?.orderStatus.toString() ?? "", valueColor: Colors.red),
                                buildRow("Payment Status", controller.getParticularOrderList?.paymentStatus.toString() ?? "", valueColor: Colors.red),
                                buildRow("Discount", billingInfo['discount'] ?? "N/A"),
                                buildRow("Sub Total", billingInfo['subtotal'] ?? "N/A"),
                                buildRow("Amount Payable", "₹ ${controller.getParticularOrderList?.totalAmount.toString()}" ?? "",
                                    valueStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 16),

                        // Ordered Items
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Ordered Item(s)",
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                                Divider(thickness: 1, color: Colors.black26),

                                // Dynamically generated rows for products from the API
                                if (controller.getParticularOrderList?.orderedProducts != null &&
                                    controller.getParticularOrderList!.orderedProducts!.isNotEmpty)
                                  ...buildProductRows(
                                    controller.getParticularOrderList!.orderedProducts.toString(),
                                  )
                                else
                                  Text(
                                    "No products available",
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black54,
                                    ),
                                  ),

                                Divider(thickness: 1, color: Colors.black26),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ));
  }

  Widget buildRow(String label, String value, {Color valueColor = Colors.black54, TextStyle? valueStyle}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          Text(
            value,
            style: valueStyle ??
                GoogleFonts.poppins(
                  fontSize: 14,
                  color: valueColor,
                ),
          ),
        ],
      ),
    );
  }

  List<Widget> buildProductRows(String? orderedProducts) {
    if (orderedProducts == null || orderedProducts.isEmpty) {
      return [Text("No products available")]; // Handle null or empty case
    }

    try {
      // Decode the JSON string
      final List<dynamic> products = jsonDecode(orderedProducts);

      // Map each product to a buildItemRow widget
      return products.map((product) {
        final productId = product['productId'];
        final productName = product['productName'] ?? "Unknown";
        final unit = product['productQty'] ?? "N/A";
        final qtyPrice = "${product['cartQty']} x ₹${product['price']}";
        final totalPrice = "₹${(product['cartQty'] * product['price']).toStringAsFixed(2)}";

        return buildItemRow(productName, unit, qtyPrice, totalPrice);
      }).toList();
    } catch (e) {
      return [Text("Error parsing products")]; // Handle invalid JSON
    }
  }

  Widget buildItemRow(String itemName, String unit, String qtyPrice, String totalPrice) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 3,
                child: Text(
                  itemName,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  unit,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  qtyPrice,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  totalPrice,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
