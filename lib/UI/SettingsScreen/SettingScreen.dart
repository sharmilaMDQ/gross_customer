import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../Components/AppTheme.dart';
import '../../Controller/SettingScreenController.dart';
import '../../Pageroutes/App_routes.dart';
import '../HelpCenter/helpCenter.dart';

class SettingScreen extends GetView<SettingScreenController> {
  SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingScreenController homeController = Get.put(SettingScreenController());
    // controller.getParticularCustomerApi();
    return GetBuilder<SettingScreenController>(
      init: SettingScreenController(),
      builder: (controller) {
        return Theme(
          data: Theme.of(context).copyWith(
            dividerTheme: const DividerThemeData(
              color: Colors.transparent,
            ),
          ),
          child: Scaffold(
            backgroundColor: AppTheme.Buttoncolor,

            /* persistentFooterButtons: [
              Center(
                child: Button(
                  widthFactor: 0.9,
                  heightFactor: 0.06,
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => navigateBar()));
                    Get.offNamed(AppRoutes.root.toName);
                  },
                  child: Text('Log out',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      )),
                ),
              ),
            ],*/
            // backgroundColor: AppTheme.Buttoncolor,
            appBar: AppBar(
              backgroundColor: AppTheme.Buttoncolor,
              automaticallyImplyLeading: false,
              bottomOpacity: 0.0,
              elevation: 0.0,
              toolbarHeight: 80,
              // leading: Padding(
              //   padding: EdgeInsets.only(top: 20, bottom: 20, right: 0, left: 15),
              //   child: InkWell(
              //     onTap: () {
              //       Navigator.pop(context);
              //     },
              //     child: Container(
              //       decoration: BoxDecoration(
              //           color: Colors.green.shade700,
              //           borderRadius: BorderRadius.circular(10)),
              //       margin: EdgeInsets.symmetric(
              //         horizontal: 2,
              //       ),
              //       child: Icon(
              //         Icons.arrow_back_ios_new,
              //         color: Colors.white, // customize color as per requirement
              //       ),
              //     ),
              //   ),
              // ),
              title: Text(
                "Settings",
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
              height: MediaQuery.of(context).size.height - 150,
              decoration:
                  BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25))),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Stack(
                      children: [
                        Obx(
                          () => controller.imageString.value.isNotEmpty
                              ? CircleAvatar(
                                  backgroundImage: NetworkImage(controller.imageString.value),
                                  radius: 70,
                                )
                              : CircleAvatar(
                                  backgroundImage: NetworkImage('https://autorevog.blob.core.windows.net/autorevog/uploads/images/18942381.jpg'),
                                  radius: 70,
                                ),
                        ),
                        CircularPercentIndicator(
                          radius: 70,
                          lineWidth: 4,
                          percent: 0.85,
                          center: Text(
                            '',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          progressColor: AppTheme.primaryColor,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Obx(() => Text(
                          controller.customerName.toString(),
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.editProfile.toName);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Card(
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10), boxShadow: [BoxShadow(color: Colors.white, spreadRadius: 0, blurRadius: 0)]),
                            child: Row(children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Container(
                                  height: 35,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: AppTheme.IconBackground,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Icon(
                                    Icons.person_outline,
                                    color: AppTheme.Buttoncolor,
                                    size: 35,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.65,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Edit Profile',
                                      style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.toNamed(AppRoutes.editProfile.toName);
                                      },
                                      child: Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        size: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ]),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Card(
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10), boxShadow: [BoxShadow(color: Colors.white, spreadRadius: 0, blurRadius: 0)]),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Container(
                                  height: 35,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: AppTheme.IconBackground,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: SvgPicture.asset(
                                    'assets/icons/Points.svg',
                                    color: AppTheme.Buttoncolor,
                                    height: 10,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.65,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'My Order History',
                                      style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      size: 15,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Card(
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10), boxShadow: [BoxShadow(color: Colors.white, spreadRadius: 0, blurRadius: 0)]),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Container(
                                  height: 35,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: AppTheme.IconBackground,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Icon(
                                    Icons.note_add_rounded,
                                    color: AppTheme.Buttoncolor,
                                    size: 35,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.65,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Points',
                                      style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(),
                                    Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      size: 15,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Card(
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10), boxShadow: [BoxShadow(color: Colors.white, spreadRadius: 0, blurRadius: 0)]),
                          child: Row(children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Container(
                                height: 35,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: AppTheme.IconBackground,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Icon(
                                  Icons.credit_card_sharp,
                                  color: AppTheme.Buttoncolor,
                                  size: 35,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.65,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Manage Card',
                                    style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(),
                                  Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    size: 15,
                                  ),
                                ],
                              ),
                            )
                          ]),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => HelpCenterScreen());
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Card(
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10), boxShadow: [BoxShadow(color: Colors.white, spreadRadius: 0, blurRadius: 0)]),
                            child: Row(children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Container(
                                  height: 35,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: AppTheme.IconBackground,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: SvgPicture.asset(
                                    'assets/icons/helpcenter.svg',
                                    color: AppTheme.Buttoncolor,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.65,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Help center',
                                      style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(),
                                    Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      size: 15,
                                    ),
                                  ],
                                ),
                              )
                            ]),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 48.0, horizontal: 16.0),
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 6.0,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: Icon(
                                  Icons.logout_rounded,
                                  size: 24.0,
                                  color: AppTheme.Buttoncolor,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Text(
                                "Log Out",
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                                overflow: TextOverflow.ellipsis, // Handles text overflow
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
