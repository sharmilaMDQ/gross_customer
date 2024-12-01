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

  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.height;
    AddNewAddressController Controller = Get.put(AddNewAddressController());
    return WillPopScope(
      onWillPop: () async {
        Get.off(() => CheckOutScreen());
        // Get.back();
        return false;
      },
      child: Scaffold(
        persistentFooterButtons: [
          Column(
            children: [
              /*Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Button1(
                              widthFactor: 0.40,
                              heightFactor: 0.06,
                              onPressed: () {
                                controller.getCurrentLocation();
                              },
                              child: Container(
                                width: width * 0.60,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Obx(
                                      () => controller.isLoading.value
                                          ? SizedBox(
                                              height: height * 0.01,
                                              width: height * 0.01,
                                              child: CircularProgressIndicator(
                                                color: AppTheme.Buttoncolor,
                                              ),
                                            )
                                          : Icon(
                                              Icons.location_on_outlined,
                                              color: AppTheme.Buttoncolor,
                                              size: 20,
                                            ),
                                    ),
                                    // Place Expanded directly inside Row
                                    Expanded(
                                      child: Text(
                                        '  Get Current \n     Location',
                                        style: GoogleFonts.poppins(
                                          color: AppTheme.Buttoncolor,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Button1(
                              widthFactor: 0.40,
                              heightFactor: 0.06,
                              onPressed: () async {
                                var result = await Get.toNamed(AppRoutes.getcurrentLocationMap.toName);
                                if (result != null) {
                                  controller.PostalCodeController.text = controller.userDataProvider.getLocation.toString();
                                }
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    color: AppTheme.Buttoncolor,
                                    size: 20,
                                  ),
                                  // Place Expanded directly inside Row
                                  Expanded(
                                    child: Text(
                                      '  Get Location  \n     From Map',
                                      style: GoogleFonts.poppins(
                                        color: AppTheme.Buttoncolor,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 10),
                        //   child: Center(
                        //     child: Button(
                        //       widthFactor: 0.8,
                        //       heightFactor: 0.06,
                        //       onPressed: () {},
                        //       child: Text(
                        //         "Add New Address+", // bottomsheet button
                        //         style: GoogleFonts.poppins(
                        //           color: Colors.white,
                        //           fontSize: 18,
                        //           fontWeight: FontWeight.w400,
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        SizedBox(height: 20),
                      ],
                    )),
              ),*/
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Center(
                  child: Button(
                    widthFactor: 0.8,
                    heightFactor: 0.06,
                    onPressed: () {
                      // Get.to(() => PaymentDetailsCartScreen(
                      //
                      //     ));
                      Get.off(() => CheckOutScreen());
                    },
                    child: Text(
                      "Confirm", //bottomsheet button
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
                Get.off(() => CheckOutScreen());
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
          title: Text("Addresses",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.w600,
              )),
          centerTitle: true,
          actions: <Widget>[],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30),
              TextButton(
                onPressed: () {
                  Get.to(() => AddressView());
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                  side: BorderSide(color: Colors.grey.shade400),
                  minimumSize: Size(400, 50),
                ),
                child: Text.rich(
                  TextSpan(
                    children: [
                      WidgetSpan(
                        child: Icon(
                          Icons.my_location, // Choose your icon
                          size: 20, // Adjust the icon size to match text
                          color: Colors.grey[600],
                        ),
                      ),
                      TextSpan(
                        text: " Choose Current Location",
                        style: GoogleFonts.poppins(
                          color: Colors.grey[600],
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                  height: height * 0.05,
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.white24),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, right: 20),
                    child: InkWell(
                      onTap: () {
                        Get.to(() => AddressView());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "+ADD NEW ADDRESS",
                            style: GoogleFonts.poppins(
                              color: AppTheme.Buttoncolor,
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
              Obx(
                () => Padding(
                  padding: const EdgeInsets.fromLTRB(18, 10, 18, 10),
                  child: controller.isLoading.value
                      ? SizedBox(
                          height: height * 0.01,
                          width: height * 0.01,
                          child: const CircularProgressIndicator(
                            color: AppTheme.Buttoncolor,
                          ),
                        )
                      : controller.getAddressesList.isEmpty
                          ? Center(child: Image.asset("assets/images/nodata.png"))
                          : GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: controller.getAddressesList.length,
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1,
                                childAspectRatio: 2.5, // Adjusted aspect ratio for design alignment
                              ),
                              itemBuilder: (context, index) {
                                var model = controller.getAddressesList[index];
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

                                                // Update selected address and whole address
                                                if (value < controller.getAddressesList.length) {
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
                                                        color: controller.selectedRadioIndex.value == index ? Colors.green : Colors.red,
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.w600,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      overflow: TextOverflow.ellipsis,
                                                      model.addressType.toString(),
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
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.poppins(
                                                  fontSize: 14,
                                                  color: Colors.grey[600],
                                                ),
                                              ),
                                              Text(
                                                "${model.customerCity}, ${model.customerState} - ${model.customerPincode}",
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.poppins(
                                                  fontSize: 14,
                                                  color: Colors.grey[600],
                                                ),
                                              ),
                                              if (model.appartmentName?.isNotEmpty ?? false)
                                                RichText(
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text: "${model.appartmentName} ",
                                                        style: GoogleFonts.poppins(
                                                          fontSize: 14,
                                                          color: Colors.grey[600],
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: "(Apartment Name)",
                                                        style: GoogleFonts.poppins(
                                                          fontSize: 12,
                                                          color: Colors.red,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              if (model.landmark?.isNotEmpty ?? false)
                                                RichText(
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text: "${model.landmark} ",
                                                        style: GoogleFonts.poppins(
                                                          fontSize: 14,
                                                          color: Colors.grey[600],
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: "(Landmark)",
                                                        style: GoogleFonts.poppins(
                                                          fontSize: 12,
                                                          color: Colors.red,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              Text(
                                                model.mobileNumber.toString() ?? "",
                                                style: GoogleFonts.poppins(
                                                  fontSize: 14,
                                                  color: Colors.grey[600],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            IconButton(
                                              icon: const Icon(
                                                Icons.edit,
                                                size: 20,
                                                color: Colors.grey,
                                              ),
                                              onPressed: () {
                                                Get.to(() => AddressView());
                                                print("Edit address with ID: ${model.customerAddressId}");
                                              },
                                            ),
                                            IconButton(
                                              icon: const Icon(
                                                Icons.delete,
                                                size: 20,
                                                color: Colors.grey,
                                              ),
                                              onPressed: () {
                                                controller.deleteCustomerAddress(index,context);
                                                controller.update();
                                                print("Delete address with ID: ${model.customerAddressId}");
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
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
