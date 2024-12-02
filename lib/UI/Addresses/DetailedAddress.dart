import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../Components/AppTheme.dart';
import '../../Controller/AddressViewController.dart';
import '../../Forms/AppText.dart';
import '../../Forms/TextFormsFiled.dart';
import '../../utility/AppColor.dart';

class DetailedAddress extends GetView<AddressViewController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(CupertinoIcons.arrow_left),
              ),
              AppText('Select Delivery Loaction')
            ],
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.17,
                  child: Expanded(
                    child: GoogleMap(
                      myLocationEnabled: false,
                      zoomControlsEnabled: false,
                      zoomGesturesEnabled: false,
                      mapType: MapType.normal,
                      initialCameraPosition: controller.initialPosition,
                      onMapCreated: (GoogleMapController googleMapController) {
                        controller.mapController.complete(googleMapController);
                      },
                      onCameraMove: controller.onCameraMove,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8, top: 10),
                      child: Row(
                        children: [
                          Icon(
                            CupertinoIcons.location_fill,
                            size: 23,
                            color: AppColors.buttonBgColor,
                          ),
                          Text(
                            controller.locality.value,
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              controller.fullAddress.value,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20, top: 35),
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            backgroundColor: Color(0xffFFFCF6).withOpacity(0.5),
                            minimumSize: Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8), side: BorderSide(color: Colors.grey.withOpacity(0.2)))),
                        onPressed: () {},
                        child: Text(
                          'A detailed address will help our Delivery Partner reach your doorstep easily',
                          style: TextStyle(fontSize: 11, color: Colors.brown.withOpacity(0.8)),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                  child: TextFormsField(
                    title: "House / Flat / Block No",
                    validate: controller.houseNo.value,
                    hintText: "House / Flat / Block No",
                    errorText: controller.houseNoErrorText.value,
                    // onChanged: controller.setHouseNo,
                    controller: controller.customerHouseNocontroller,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                  child: TextFormsField(
                    title: "Apartment / Road / Area (Optional)",
                    // validate: controller.houseNo.value,
                    hintText: "Apartment / Road / Area (Optional)",
                    // errorText: controller.houseNoErrorText.value,
                    controller: controller.customerApartmentcontroller,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                  child: TextFormsField(
                    title: "Landmark",
                    // validate: controller.houseNo.value,
                    hintText: "Enter Landmark (Optional)",
                    // errorText: controller.houseNoErrorText.value,
                    // onChanged: controller.setRoad,
                    controller: controller.customerLandmarkController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                  child: TextFormsField(
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly, // Allows only digits
                      LengthLimitingTextInputFormatter(10), // Limits input to 10 digits
                    ],
                    title: "Mobile Number",
                    // validate: controller.houseNo.value,
                    hintText: "Enter Your Mobile Number  (Optional)",
                    // errorText: controller.houseNoErrorText.value,
                    // onChanged: controller.setRoad,
                    controller: controller.mobileNumberController,
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 20, top: 20, bottom: 0),
                //   child: Row(
                //     children: [
                //       Text(
                //         'Landmark',
                //         style: GoogleFonts.k2d(
                //           textStyle: TextStyle(fontSize: 14),
                //         ),
                //       ),
                //       Text(
                //         '  (OPTIONAL)',
                //         style: GoogleFonts.k2d(textStyle: TextStyle(fontSize: 14), color: Colors.grey),
                //       ),
                //     ],
                //   ),
                // ),
                /*Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.grey.withOpacity(0.05),
                      disabledForegroundColor:
                      Colors.transparent.withOpacity(0.38),
                      disabledBackgroundColor:
                      Colors.transparent.withOpacity(0.12),
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(90),
                      ),
                      splashFactory: NoSplash
                          .splashFactory, // Use this for the button's disabled color
                      shadowColor: Colors
                          .transparent, // Use this for the button's shadow color
                      textStyle: TextStyle(
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ).copyWith(
                      overlayColor: MaterialStateProperty.all(
                          Colors.transparent), // Disable splash color
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Tap to record voice directions',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black.withOpacity(0.6),
                          ),
                        ),
                        Spacer(),
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.grey.withOpacity(0.3),
                          ),
                          child: Icon(
                            Icons.mic,
                            size: 19,
                          ),
                        )
                      ],
                    ),
                  ),
                ),*/
                // Padding(
                //   padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                //   child: TextFormsField(
                //     title: "e.g. Ring the bell on the red gate",
                //     // validate: controller.houseNo.value,
                //     hintText: "e.g. Ring the bell on the red gate",
                //     // errorText: controller.houseNoErrorText.value,
                //     onChanged: controller.setDirection,
                //     controller: controller.directionController,
                //     maxLines: 5,
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  child: Row(
                    children: [
                      Text('SAVE AS'),
                    ],
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 10, right: 20, top: 10),
                //   child: Row(
                //     children: [
                //       SizedBox(
                //         height: MediaQuery.of(context).size.height * 0.035,
                //         width: MediaQuery.of(context).size.width * 0.25,
                //         child: ElevatedButton(
                //           style: ElevatedButton.styleFrom(
                //             backgroundColor: Colors.grey.withOpacity(0.1),
                //             elevation: 0,
                //             shape: RoundedRectangleBorder(
                //                 borderRadius: BorderRadius.circular(30),
                //                 side: BorderSide(
                //                     color: CupertinoColors.inactiveGray
                //                         .withOpacity(0.3))),
                //           ),
                //           onPressed: () {},
                //           child: Row(
                //             children: [
                //               Icon(
                //                 Icons.home_filled,
                //                 size: 17,
                //                 color: Colors.black,
                //               ),
                //               Text(
                //                 '  Home',
                //                 style: GoogleFonts.roboto(
                //                     textStyle: TextStyle(
                //                         fontSize: 15, color: Colors.black)),
                //               ),
                //             ],
                //           ),
                //         ),
                //       ),
                //       Padding(
                //         padding: const EdgeInsets.only(left: 10),
                //         child: SizedBox(
                //           height: MediaQuery.of(context).size.height * 0.035,
                //           width: MediaQuery.of(context).size.width * 0.24,
                //           child: ElevatedButton(
                //             style: ElevatedButton.styleFrom(
                //               backgroundColor: Colors.grey.withOpacity(0.1),
                //               elevation: 0,
                //               shape: RoundedRectangleBorder(
                //                 borderRadius: BorderRadius.circular(30),
                //                 side: BorderSide(
                //                   color: CupertinoColors.inactiveGray
                //                       .withOpacity(0.3),
                //                 ),
                //               ),
                //             ),
                //             onPressed: () {},
                //             child: Row(
                //               children: [
                //                 Icon(
                //                   Icons.work,
                //                   size: 17,
                //                   color: Colors.black,
                //                 ),
                //                 Text(
                //                   '  Work',
                //                   style: GoogleFonts.roboto(
                //                       textStyle: TextStyle(
                //                           fontSize: 15, color: Colors.black)),
                //                 ),
                //               ],
                //             ),
                //           ),
                //         ),
                //       ),
                //       Padding(
                //         padding: const EdgeInsets.only(left: 10),
                //         child: SizedBox(
                //           height: MediaQuery.of(context).size.height * 0.035,
                //           width: MediaQuery.of(context).size.width * 0.36,
                //           child: ElevatedButton(
                //             style: ElevatedButton.styleFrom(
                //               backgroundColor: Colors.grey.withOpacity(0.1),
                //               elevation: 0,
                //               shape: RoundedRectangleBorder(
                //                 borderRadius: BorderRadius.circular(30),
                //                 side: BorderSide(
                //                   color: CupertinoColors.inactiveGray
                //                       .withOpacity(0.3),
                //                 ),
                //               ),
                //             ),
                //             onPressed: () {},
                //             child: Expanded(
                //               child: Row(
                //                 children: [
                //                   Icon(
                //                     Icons.family_restroom,
                //                     size: 17,
                //                     color: Colors.black,
                //                   ),
                //                   Text(
                //                     'Friends and Family',
                //                     style: GoogleFonts.roboto(
                //                         textStyle: TextStyle(
                //                             fontSize: 15, color: Colors.black)),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // )
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                    spacing: 12.0, // Increased space between items
                    runSpacing: 8.0, // Space between rows
                    children: [
                      Wrap(
                        spacing: 12.0, // Increased space between items
                        runSpacing: 8.0, // Space between rows
                        children: [
                          Obx(() {
                            return InkWell(
                              onTap: () {
                                controller.addressType.value = "Home";
                                print(controller.addressTypeController.text);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(0),
                                  color: controller.addressType.value == "Home" ? AppTheme.Buttoncolor.withOpacity(0.5) : AppColors.white,
                                  border: Border.all(
                                    color: controller.addressType.value == "Home" ? AppTheme.Buttoncolor : Colors.grey.withOpacity(0.7),
                                    width: 1.2,
                                  ),
                                  boxShadow: controller.addressType.value == "Home"
                                      ? [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(0.1),
                                            offset: Offset(2, 2),
                                            blurRadius: 5,
                                          ),
                                        ]
                                      : [],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        CupertinoIcons.house_fill,
                                        size: 18,
                                        color: controller.addressType.value == "Home" ? AppColors.black : AppColors.black,
                                      ),
                                      SizedBox(width: 8),
                                      AppText(
                                        'Home',
                                        color: controller.addressType.value == "Home" ? AppColors.black : AppColors.black,
                                        fontWeight: controller.addressType.value == "Home" ? FontWeight.bold : FontWeight.normal,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                          Obx(() {
                            return InkWell(
                              onTap: () {
                                controller.addressType.value = "Work";
                                print(controller.addressTypeController.text);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(0),
                                  color: controller.addressType.value == "Work" ? AppTheme.Buttoncolor.withOpacity(0.5) : AppColors.white,
                                  border: Border.all(
                                    color: controller.addressType.value == "Work" ? AppTheme.Buttoncolor : Colors.grey.withOpacity(0.7),
                                    width: 1.2,
                                  ),
                                  boxShadow: controller.addressType.value == "Work"
                                      ? [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(0.1),
                                            offset: Offset(2, 2),
                                            blurRadius: 5,
                                          ),
                                        ]
                                      : [],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        CupertinoIcons.briefcase_fill,
                                        size: 18,
                                        color: controller.addressType.value == "Work" ? AppColors.black : AppColors.black,
                                      ),
                                      SizedBox(width: 8),
                                      AppText(
                                        'Work',
                                        color: controller.addressType.value == "Work" ? AppColors.black : AppColors.black,
                                        fontWeight: controller.addressType.value == "Work" ? FontWeight.bold : FontWeight.normal,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                          Obx(() {
                            return InkWell(
                              onTap: () {
                                controller.addressType.value = "Family";
                                print(controller.addressTypeController.text);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(0),
                                  color: controller.addressType.value == "Family" ? AppTheme.Buttoncolor.withOpacity(0.5) : AppColors.white,
                                  border: Border.all(
                                    color: controller.addressType.value == "Family" ? AppTheme.Buttoncolor : Colors.grey.withOpacity(0.7),
                                    width: 1.2,
                                  ),
                                  boxShadow: controller.addressType.value == "Family"
                                      ? [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(0.1),
                                            offset: Offset(2, 2),
                                            blurRadius: 5,
                                          ),
                                        ]
                                      : [],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        CupertinoIcons.person_3_fill,
                                        size: 18,
                                        color: controller.addressType.value == "Family" ? AppColors.black : AppColors.black,
                                      ),
                                      SizedBox(width: 8),
                                      AppText(
                                        'Family',
                                        color: controller.addressType.value == "Family" ? AppColors.black : AppColors.black,
                                        fontWeight: controller.addressType.value == "Family" ? FontWeight.bold : FontWeight.normal,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                          Obx(() {
                            return InkWell(
                              onTap: () {
                                controller.addressType.value = "Other";
                                print(controller.addressTypeController.text);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(0),
                                  color: controller.addressType.value == "Other" ? AppTheme.Buttoncolor.withOpacity(0.5) : AppColors.white,
                                  border: Border.all(
                                    color: controller.addressType.value == "Other" ? AppTheme.Buttoncolor : Colors.grey.withOpacity(0.7),
                                    width: 1.2,
                                  ),
                                  boxShadow: controller.addressType.value == "Other"
                                      ? [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(0.1),
                                            offset: Offset(2, 2),
                                            blurRadius: 5,
                                          ),
                                        ]
                                      : [],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        CupertinoIcons.dial_fill,
                                        size: 18,
                                        color: controller.addressType.value == "Other" ? AppColors.black : AppColors.black,
                                      ),
                                      SizedBox(width: 8),
                                      AppText(
                                        'Other',
                                        color: controller.addressType.value == "Other" ? AppColors.black : AppColors.black,
                                        fontWeight: controller.addressType.value == "Other" ? FontWeight.bold : FontWeight.normal,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                        ],
                      ),
                    ],
                  ),
                ),

                Obx(() => controller.addressType.value == "Other"
                    ? Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: TextFormsField(
                          title: "Other Address Type",
                          validate: controller.isOtherClicked.value ? controller.otherTypeValidation.value : null,
                          hintText: "Other Address Type",
                          errorText: controller.otherTypeErrorText.value,
                          onChanged: controller.setHouseNo,
                          controller: controller.customAddressTypeController,
                        ),
                      )
                    : SizedBox.shrink()),
                Obx(() {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: controller.isDefaultAddress.value,
                        onChanged: (bool? newValue) {
                          controller.isDefaultAddress.value = newValue ?? false;
                        },
                        activeColor: AppTheme.Buttoncolor,
                      ),
                      AppText(
                        'Default Address',
                        color: AppColors.black,
                        fontWeight: FontWeight.normal,
                      ),
                    ],
                  );
                }),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.Buttoncolor, // Background color
                      minimumSize: Size(double.infinity, 50), // Full width
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2), // Rounded corners
                      ),
                    ),
                    onPressed: () {
                      controller.addAddresses();
                    },
                    child: Text(
                      "Add Address",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
