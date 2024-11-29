import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Components/AppTheme.dart';
import '../../Components/Forms.dart';
import '../../Controller/ForgotPasswordScreenController.dart';

class ForgotPasswordScreen extends GetView<ForgotPasswordScreenController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgotPasswordScreenController>(
      init: ForgotPasswordScreenController(),
      builder: (controller) {
        return Scaffold(
          body: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50, left: 20),
                    child: Container(
                      height: 40,
                      width: 50,
                      decoration: BoxDecoration(
                        color: AppTheme.IconBackground,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios_new,
                          color: AppTheme.Buttoncolor,
                          size: 20,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'Forgot Password  ',
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600, color: Colors.black),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'We will send an email with a confirmation\n'
                      'code to this number   ',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black26),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              // Padding(
              //   padding:
              //       const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              //   child: TextFormField(
              //     decoration: InputDecoration(
              //       border: OutlineInputBorder(),
              //       enabledBorder: OutlineInputBorder(
              //         borderSide: BorderSide(color: AppTheme.Buttoncolor),
              //         borderRadius: BorderRadius.circular(25),
              //       ),
              //       focusedBorder: OutlineInputBorder(
              //         borderSide: BorderSide(color: AppTheme.Buttoncolor),
              //         borderRadius: BorderRadius.circular(20),
              //       ),
              //       hintText: ' Email',
              //       hintStyle: TextStyle(
              //           fontSize: 15,
              //           fontWeight: FontWeight.w400,
              //           color: Colors.black26),
              //       suffixIcon: Icon(
              //         Icons.mail,
              //         size: 27,
              //         color: AppTheme.Buttoncolor,
              //       ),
              //     ),
              //     style: TextStyle(
              //         fontSize: 15,
              //         fontWeight: FontWeight.w400,
              //         color: Colors.black26),
              //   ),
              // ),

              // ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: TextInput1(
                  label: "Mobile Number",
                  onPressed: () {},
                  contentPaddingV: 15,
                  controller: controller.usercontroller,
                  textInputType: TextInputType.number,
                  textColor: Color(0xCC252525),
                  hintText: "Enter  Your Mobile Number",
                  onTextChange: (String) {},
                ),
              ),

              // Obx(
              //       () => Padding(
              //     padding: EdgeInsets.symmetric(
              //       horizontal: 10,
              //     ),
              //     child: TextInput1(
              //       // height: 300,
              //         label: " New Password ",
              //         onPressed: () {
              //
              //         },onPressedSuffixIcon: () {
              //       controller.toggleVisibility();
              //     },
              //         contentPaddingV: 15,
              //         controller: controller.olsPassController,
              //         textInputType: TextInputType.text,
              //         obscureText: true,
              //         textVisible: !controller.isVisible.value,
              //         textColor: Color(0xCC252525),
              //         hintText: "Enter New Password",
              //         onTextChange: (String) {},
              //         sufficIcon: controller.isVisible.value
              //             ? Icon(
              //           Icons.visibility,
              //           color: AppTheme.primaryColor,
              //         )
              //             :Icon(
              //           Icons.visibility_off,
              //           color: AppTheme.primaryColor,
              //         )
              //     ),
              //   ),
              // ),
              Obx(
                () => Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: TextInput1(
                      // height: 300,
                      label: " Confirm Password ",
                      onPressed: () {},
                      onPressedSuffixIcon: () {
                        controller.toggleVisibility();
                      },
                      contentPaddingV: 15,
                      controller: controller.confirmPassController,
                      textInputType: TextInputType.text,
                      obscureText: true,
                      textVisible: !controller.isVisible.value,
                      textColor: Color(0xCC252525),
                      hintText: "Enter  Confirm  Password",
                      onTextChange: (String) {},
                      sufficIcon: controller.isVisible.value
                          ? Icon(
                              Icons.visibility,
                              color: AppTheme.primaryColor,
                            )
                          : Icon(
                              Icons.visibility_off,
                              color: AppTheme.primaryColor,
                            )),
                ),
              ),
              SizedBox(
                height: 0,
              ),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 28, vertical: 10),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Text(
              //         'Please enter a vaild email ',
              //         style: TextStyle(
              //             fontSize: 15,
              //             fontWeight: FontWeight.w400,
              //             color: Colors.red),
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(
                height: 70,
              ),
              Center(
                child: Button(
                    widthFactor: 0.9,
                    heightFactor: 0.06,
                    onPressed: () {
                      controller.ForgotPasswordApi();
                    },
                    child: const Text("Next", style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600))),
              ),
            ],
          ),
        );
      },
    );
  }
}
