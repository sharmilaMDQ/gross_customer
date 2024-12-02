import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Components/AppTheme.dart';
import '../../Components/Forms.dart';
import '../../Controller/FavouriteStoreScreenController.dart';
import '../../Pageroutes/App_routes.dart';

class FavouriteStoreScreen extends GetView<FavouriteStoreScreenController> {
  @override
  Widget build(BuildContext context) {
    FavouriteStoreScreenController Controller = Get.put(FavouriteStoreScreenController());
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/Grosshop G.png',
                        height: 50,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        'express',
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        '      Shop Your \n'
                        'Favourite Store ',
                        style: GoogleFonts.poppins(
                          color: AppTheme.Frontcolor,
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      // )
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Button1(
                          widthFactor: 0.45,
                          heightFactor: 0.06,
                          onPressed: () {
                            controller.getCurrentLocation();
                          },
                          child: Container(
                            width: width * 0.60,
                            //color: Colors.red,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                controller.isLoading.value
                                    ? const SizedBox(
                                        width: 15, // Adjust the size of the circular indicator
                                        height: 15,
                                        child: CircularProgressIndicator(
                                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                          strokeWidth: 3, // Adjust the thickness of the spinner
                                        ),
                                      )
                                    : Container(
                                        child: Icon(
                                          Icons.location_on_outlined,
                                          color: AppTheme.Buttoncolor,
                                          size: 20,
                                        ),
                                      ),
                                Container(
                                  width: width * 0.26,
                                  child: Text('  Get Current \n     Location',
                                      style: GoogleFonts.poppins(
                                        color: AppTheme.Buttoncolor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Button1(
                          widthFactor: 0.45,
                          heightFactor: 0.06,
                          onPressed: () async {
                            var result = await Get.toNamed(AppRoutes.getcurrentLocationMap.toName);
                            if (result != null) {
                              controller.PostalCodeController.text = controller.userDataProvider.getLocation.toString();
                            }
                          },
                          child: Row(
                            children: [
                              Container(
                                child: Icon(
                                  Icons.location_on_outlined,
                                  color: AppTheme.Buttoncolor,
                                  size: 20,
                                ),
                              ),
                              Container(
                                width: width * 0.26,
                                child: Text('  Get Location  \n     From Map',
                                    style: GoogleFonts.poppins(
                                      color: AppTheme.Buttoncolor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    // InkWell(
                    //   onTap: () {
                    //     showDialog(
                    //         context: context,
                    //         builder: (BuildContext context) {
                    //           return AlertDialog(
                    //             shape: RoundedRectangleBorder(
                    //               borderRadius: BorderRadius.circular(15),
                    //             ),
                    //             content: Obx(
                    //                   () => Stack(
                    //                 children: [
                    //                   GoogleMap(
                    //                     onMapCreated:
                    //                     controller.onMapCreated,
                    //                     initialCameraPosition:
                    //                     CameraPosition(
                    //                       target: controller
                    //                           .initialPosition.value,
                    //                       zoom: 4,
                    //                     ),
                    //                     onTap: controller.onMapClicked,
                    //                   ),
                    //                   Positioned(
                    //                     bottom: 50,
                    //                     left: 10,
                    //                     child: Container(
                    //                       padding: EdgeInsets.all(8),
                    //                       color: Colors.white,
                    //                       child: Text(controller
                    //                           .infoWindowText.value),
                    //                     ),
                    //                   ),
                    //                 ],
                    //               ),
                    //             ),
                    //           );
                    //         });
                    //   },
                    //   child: TextField(
                    //     readOnly: true,
                    //     keyboardType: TextInputType.none,
                    //     decoration: InputDecoration(
                    //         contentPadding: EdgeInsets.symmetric(
                    //             horizontal: 15, vertical: 15),
                    //         border: OutlineInputBorder(
                    //             borderRadius: BorderRadius.circular(20)),
                    //         hintText: 'Use current location',
                    //         hintStyle: GoogleFonts.poppins(
                    //           color: Colors.lightGreen,
                    //           fontSize: 17,
                    //           fontWeight: FontWeight.w400,
                    //         ),
                    //         prefixIcon: Icon(
                    //           Icons.location_on_outlined,
                    //           color: Colors.lightGreen,
                    //         )),
                    //   ),
                    // ),

                    // InkWell(
                    //   onTap: () {},
                    //   child: TextField(
                    //     controller: controller.StateController,
                    //     keyboardType: TextInputType.none,
                    //     decoration: InputDecoration(
                    //       contentPadding: EdgeInsets.symmetric(
                    //           horizontal: 15, vertical: 15),
                    //       border: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(20)),
                    //       hintText: 'Select your province',
                    //       hintStyle: GoogleFonts.poppins(
                    //         color: Colors.black,
                    //         fontSize: 14,
                    //         fontWeight: FontWeight.w400,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    // Container(
                    //   width: width * 9,
                    //   child: TextInput1(
                    //     label: "Address",
                    //     onPressed: () {},
                    //     contentPaddingV: 15,
                    //     controller: controller.PostalCodeController,
                    //     textInputType: TextInputType.text,
                    //     textColor: Color(0xCC252525),
                    //     hintText: "Enter Your Address",
                    //     onTextChange: (String) {},
                    //   ),
                    // ),
                    TextFormField(
                      controller: controller.PostalCodeController,
                      keyboardType: TextInputType.none,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppTheme.Buttoncolor),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppTheme.Buttoncolor),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                        hintText: "Address",
                        hintStyle: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    // TextField(
                    //   controller: controller.SelectStoreController,
                    //   decoration: InputDecoration(
                    //       contentPadding: EdgeInsets.symmetric(
                    //           horizontal: 15, vertical: 15),
                    //       border: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(20)),
                    //       hintText: 'Choose your Store',
                    //       hintStyle: GoogleFonts.poppins(
                    //         color: Colors.black,
                    //         fontSize: 14,
                    //         fontWeight: FontWeight.w400,
                    //       ),
                    //       suffixIcon: Icon(Icons.keyboard_arrow_right)),
                    // ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                ),
                Center(
                  child: Button(
                    widthFactor: 0.9,
                    heightFactor: 0.06,
                    onPressed: () {
                      controller.validation(context);
                    },
                    child: controller.isLoading.value
                        ? const SizedBox(
                            width: 15, // Adjust the size of the circular indicator
                            height: 15,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                              strokeWidth: 3, // Adjust the thickness of the spinner
                            ),
                          )
                        : Text('Start Shopping',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
