import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Components/AppTheme.dart';
import '../../Controller/SettingScreenController.dart';
import '../../Pageroutes/App_routes.dart';

class HelpCenterScreen extends GetView<SettingScreenController> {
  HelpCenterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.height;
    return Scaffold(
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
          "Help Center",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: <Widget>[],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                              'Write Your Feedback',
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
                              'Share Our App',
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
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
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
                    child: Expanded(
                      child: Text(
                        "Customer Care",
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis, // Handles text overflow
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppTheme.Buttoncolor.withOpacity(0.5),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildItem(
                          icon: Icons.phone,
                          text: "7358662448",
                          onTap: () {
                            // Add functionality for phone tap if needed
                          },
                        ),
                        _buildItem(
                          icon: Icons.email,
                          text: "vkart.help@gmail.com",
                          onTap: () {
                            // Add functionality for email tap if needed
                          },
                        ),
                        _buildItem(
                          icon: Icons.question_answer,
                          text: "FAQ",
                          onTap: () {
                            // Add functionality for email tap if needed
                          },
                        ),
                        _buildItem(
                          icon: Icons.report,
                          text: "Report Issue",
                          onTap: () {
                            // Add functionality for reporting issue
                          },
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
    );
  }
}

Widget _buildItem({
  required IconData icon,
  required String text,
  required Function onTap,
}) {
  return GestureDetector(
    onTap: () => onTap(),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Container(
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
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Icon(
                icon,
                size: 24.0,
                color: AppTheme.Buttoncolor,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                text,
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis, // Handles text overflow
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
