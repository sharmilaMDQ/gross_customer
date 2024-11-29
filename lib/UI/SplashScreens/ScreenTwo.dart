import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grosshop/Components/AppTheme.dart';

import '../../Components/Forms.dart';
import '../../Controller/ScreenTwoController.dart';

class ScreenTwo extends GetView<ScreenTwoController> {
  const ScreenTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    ScreenTwoController controller = Get.put(ScreenTwoController());

    return GetBuilder(
      init: ScreenTwoController(),
      builder: (controller) {
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Expanded(
                flex: 0,
                child: Center(
                  child: Image.asset('assets/images/page1.png', fit: BoxFit.contain, width: width * 0.7, height: height * 0.4),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'Online Grocery',
                      style: GoogleFonts.poppins(
                        color: AppTheme.Frontcolor,
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'Pick & Delivery',
                      style: GoogleFonts.poppins(
                        color: AppTheme.Frontcolor,
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Listen Podcast and open your \n       '
                        ' world this application ',
                        style: GoogleFonts.poppins(
                          color: AppTheme.Frontcolor,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.11,
              ),
              Center(
                child: Obx(() {
                  // Using Obx to react to changes in the isLoading state
                  return Button(
                    widthFactor: 0.9,
                    heightFactor: 0.06,
                    onPressed: controller.onPressed, // Call the onPressed method in the controller
                    child: controller.isLoading.value
                        ? SizedBox(
                            width: 15, // Adjust the size of the circular indicator
                            height: 15,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                              strokeWidth: 3, // Adjust the thickness of the spinner
                            ),
                          )
                        : Text(
                            "Get Started",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                  );
                }),
              ),
            ],
          ),
        );
      },
    );
  }
}
