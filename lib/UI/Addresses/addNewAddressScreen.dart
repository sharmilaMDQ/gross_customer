import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Components/AppTheme.dart';
import '../../Components/Forms.dart';
import '../../Controller/AddNewAddressController.dart';
import '../CartScreen/checkOutScreen.dart';
import 'MapAddresses.dart';

class AddNewAddressScreen extends GetView<AddNewAddressController> {
  AddNewAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () async {
        Get.off(() => CheckOutScreen());
        return false;
      },
      child: Scaffold(
        persistentFooterButtons: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: Button(
                widthFactor: 0.8,
                heightFactor: 0.06,
                onPressed: () {
                  if (controller.selectedAddress.value != null) {
      Get.off(() => CheckOutScreen(), arguments: controller.selectedAddress.value);
    } else {
      Get.snackbar("Error", "Please select an address before confirming.");
    }
                },
                child: Text(
                  "Confirm",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ],
        appBar: AppBar(
          backgroundColor: AppTheme.Buttoncolor,
          automaticallyImplyLeading: false,
          elevation: 0.0,
          toolbarHeight: 50,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
            onPressed: () {
              Get.off(() => CheckOutScreen());
            },
          ),
          title: Text(
            "Addresses",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30),
              TextButton(
                onPressed: () {
                  Get.to(() => AddressView());
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                  side: BorderSide(color: Colors.grey.shade400),
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.my_location, size: 20, color: Colors.grey[600]),
                    const SizedBox(width: 8),
                    Text(
                      "Choose Current Location",
                      style: GoogleFonts.poppins(
                        color: Colors.grey[600],
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: height * 0.05,
                width: double.infinity,
                color: Colors.white24,
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: InkWell(
                    onTap: () {
                      Get.to(() => AddressView());
                    },
                    child: Text(
                      "+ADD NEW ADDRESS",
                      style: GoogleFonts.poppins(
                        color: AppTheme.Buttoncolor,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              Obx(
                () => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                  child: controller.isLoading.value
                      ? Center(
                          child: CircularProgressIndicator(
                            color: AppTheme.Buttoncolor,
                          ),
                        )
                      : controller.getAddressesList.isEmpty
                          ? Center(child: Image.asset("assets/images/nodata.png"))
                          : ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: controller.getAddressesList.length,
                              itemBuilder: (context, index) {
                                var model = controller.getAddressesList[index];
                                return AddressCard(
                                  index: index,
                                  model: model,
                                  controller: controller,
                                );
                              },
                            ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class AddressCard extends StatelessWidget {
  final int index;
  final dynamic model;
  final AddNewAddressController controller;

  const AddressCard({
    Key? key,
    required this.index,
    required this.model,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.grey.withOpacity(0.5),
      color: Colors.white,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => Radio<int>(
                value: index,
                groupValue: controller.selectedRadioIndex.value,
                onChanged: (int? value) {
                  if (value != null) {
                    controller.selectedRadioIndex.value = value;
                    var selectedAddress = controller.getAddressesList[value]; 
                    controller.selectedAddress.value = selectedAddress;
                    controller.userDataProvider.setWholeAddress(
                      '${selectedAddress.customerAddress ?? ''}, '
                      '${selectedAddress.appartmentName ?? ''}, '
                      '${selectedAddress.landmark ?? ''}, '
                      '${selectedAddress.customerCity ?? ''}, '
                      '${selectedAddress.customerState ?? ''}, '
                      '${selectedAddress.customerPincode ?? ''}, '
                      '${selectedAddress.customerCountry ?? ''}',
                    );
                  }
                },
                activeColor: Colors.red,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Obx(
                        () => Text(
                          controller.selectedRadioIndex.value == index
                              ? "Selected Address: "
                              : model.isDefault == "yes"
                                  ? "Default Address: "
                                  : "",
                          style: GoogleFonts.poppins(
                            color: controller.selectedRadioIndex.value == index
                                ? Colors.green
                                : Colors.red,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          model.addressType.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    model.customerAddress ?? '',
                    style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[600]),
                  ),
                  Text(
                    "${model.customerCity}, ${model.customerState} - ${model.customerPincode}",
                    style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[600]),
                  ),
                  if (model.appartmentName?.isNotEmpty ?? false)
                    Text(
                      "${model.appartmentName} (Apartment Name)",
                      style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[600]),
                    ),
                  if (model.landmark?.isNotEmpty ?? false)
                    Text(
                      "${model.landmark} (Landmark)",
                      style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[600]),
                    ),
                  Text(
                    model.mobileNumber.toString(),
                    style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                IconButton(
                  icon: Icon(Icons.edit, size: 20, color: Colors.grey),
                  onPressed: () {
                    Get.to(() => AddressView());
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete, size: 20, color: Colors.grey),
                  onPressed: () {
                    controller.deleteCustomerAddress(index, context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
